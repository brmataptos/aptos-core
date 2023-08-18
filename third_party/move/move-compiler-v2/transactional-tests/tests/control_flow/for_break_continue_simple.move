//# run
script {
fun main() {
    let x;
    for (x = 0; true; x = x + 1) {
        if (x >= 5) break;
        x = x + 1;
        continue
    };
    assert!(move x == 5, 42);
}
}
