const year = document.querySelector("#year");
  const make = document.querySelector("#make");
  const model = document.querySelector("#model");
  const results = document.querySelector("#results");
  const submit = document.querySelector("#submit");

  const getMakes = (event) => {
    make.innerHTML = "<option selected>make...</option>";
    model.innerHTML = "<option selected>model...</option>";
    make.removeAttribute("disabled");
    model.setAttribute("disabled", "");
    fetch(`cars/${year.value}`)
    .then(response => response.json())
    .then((data) => {
      data.forEach((car) => {
        const item = `<option value="${car}">${car}</option>`
        make.insertAdjacentHTML("beforeend", item);
      });
    });
  }

  const yearListener = () => {
    year.addEventListener("change", getMakes);
  };


  const getModels = (event) => {
    model.innerHTML = "<option selected>model...</option>";
    model.removeAttribute("disabled");
    fetch(`cars/${year.value}/${make.value}`)
    .then(response => response.json())
    .then((data) => {
      data.forEach((car) => {
        const item = `<option value="${car}">${car}</option>`
        model.insertAdjacentHTML("beforeend", item);
      });
    });
  }

  const makeListener = () => {
    make.addEventListener("change", getModels);
  };


  const getCar = (event) => {
    event.preventDefault();
    results.innerHTML = "";
    fetch(`cars/${year.value}/${make.value}/${encodeURIComponent(model.value)}`)
    .then(response => response.json())
    .then((data) => {
      console.log(data)

        const item = `<p>${data.year} ${data.make} ${data.model}</p>
        <ul>
          <li>MPG: ${data.mileage}</li>
          <li>Cylinders: ${data.cylinders}</li>
          <li>Liters: ${data.liters}</li>
          <li>Drive: ${data.drive}</li>
          <li>Transmission: ${data.trany}</li>
        </ul>`
        results.insertAdjacentHTML("beforeend", item);

    });
  }

const submitListener = () => {
  submit.addEventListener("click", getCar);
};

const listen = () => {
  document.addEventListener("DOMContentLoaded",function(){
    submitListener();
    makeListener();
    yearListener();
  });
}



