function testRegex() {
  const patternText = document.getElementById("patternInput").value;
  const testString = document.getElementById("testStringInput").value;

  try {
    const regex = new RegExp(patternText);
    const match = regex.test(testString);

    document.getElementById("result").innerText =
      match ? "✅" : "❌";
  } catch (error) {
    document.getElementById("result").innerText =
      "Erro na expressão regular: " + error.message;
  }
}

document.getElementById("testButton").addEventListener("click", testRegex);