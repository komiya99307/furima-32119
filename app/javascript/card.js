const pay = () => {
  const form = document.getElementById("charge-form");
  Payjp.setPublicKey("pk_test_3e1fcf240766873f832a88d2");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase[number]"),
      cvc: formData.get("purchase[cvc]"),
      exp_month: formData.get("purchase[exp_month]"),
      exp_year: `20${formData.get("purchase[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("purchase_number").removeAttribute("name");
      document.getElementById("purchase_cvc").removeAttribute("name");
      document.getElementById("purchase_exp_month").removeAttribute("name");
      document.getElementById("purchase_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();

    });
  });
};

window.addEventListener("load", pay);