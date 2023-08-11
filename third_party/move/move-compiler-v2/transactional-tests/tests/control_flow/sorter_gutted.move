//# publish
module 0x42::heap {
    fun length(_x: &vector<u64>): u64 {
	3
    }

    fun push_back(_x: &mut vector<u64>, _i: u64) {
    }

    fun get(_x: &vector<u64>, _i: u64): u64 {
	3
    }

    fun swap(_x: &mut vector<u64>, _i: u64, _j: u64) {
    }

    fun create1(): vector<u64> {
	vector<u64>[3, 2, 1, 5, 8, 4]
    }

    fun create2(): vector<u64> {
	vector<u64>[1, 2, 3, 4, 5, 8]
    }


    fun vcopy(x: &vector<u64>): vector<u64> {
	let y : vector<u64> = vector<u64>[];
	let i : u64 = 0;
	let l : u64 = length(x);
	while (i < l) {
	    let a = get(x, i);
	    let aref = &a;
	    push_back(&mut y, *aref);
	    i = i + 1;
	};
	y
    }

    fun sort(x: &mut vector<u64>) {
	let i: u64 = 0;
	while (i < length(x)) {
	    let j: u64 = i + 1;
	    while (j < length(x)) {
		let a = get(x, i);
		let b = get(x, j);
		let aref = &a;
		let bref = &b;
		if (*aref > *bref) {
		    swap(x, i, j)
		};
		j = j + 1;
	    };
	    i = i + 1;
	}
    }

    fun array_equals(x: &vector<u64>, y: &vector<u64>): bool {
	let l1: u64 = length(x);
	let l2: u64 = length(y);
	if (l1 != l2) {
	    return false
	};
	let i: u64 = 0;
	while (i < l1) {
	    let a = get(x, i);
	    let b = get(y, i);
	    let aref = &a;
	    let bref = &b;
	    if (*aref != *bref) {
		return false
	    };
	    i = i + 1;
	};
	true
    }

    public fun main() {
	let x: vector<u64> = create1();
	let y: vector<u64> = create2();
	let z: vector<u64> = vcopy(&x);
	assert!(array_equals(&x, &z), 23);
	assert!(array_equals(&y, &y), 29);
	sort(&mut x);
	assert!(array_equals(&y, &x), 31);
	assert!(array_equals(&x, &y), 29);
	assert!(!array_equals(&x, &z), 31);
    }
}

//# run
script {
    use 0x42::heap::main;
    fun mymain() {
	main();
    }
}
