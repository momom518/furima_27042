const pay = () => {
  // Payjp.setPublicKey("pk_test_9293169772cc50de71c6c1eb");
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log(form)
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {            //カードトークン生成
      number: formData.get("purchase_form[number]"),
      cvc: formData.get("purchase_form[cvc]"),
      exp_month: formData.get("purchase_form[exp_month]"),
      exp_year: `20${formData.get("purchase_form[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {   //カスタマートークン生成
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='card_token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
 
        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");
 
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      }
    });
  });
};

window.addEventListener("load", pay);