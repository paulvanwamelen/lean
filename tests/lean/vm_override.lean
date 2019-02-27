/- Author: E.W.Ayers -/

instance : has_repr name := ⟨λ x, to_string x⟩

meta def hello_override := `hello_override.name

@[vm_override hello_override]
meta def hello := `hello.name

#print hello
#eval hello

set_option vm_override.enabled false

#eval hello

set_option vm_override.enabled true

#eval hello

def float : Type := sorry

@[vm_override native.float.add]
def add (a b : float) : float := sorry

instance : has_add float := ⟨add⟩

@[vm_override native.float.div]
def div (a b : float) : float := sorry

instance : has_div float := ⟨div⟩

@[vm_override native.float.pow]
def float.pow (a b : float) : float := sorry

instance : has_pow float float := ⟨float.pow⟩

@[vm_override native.float.zero]
def zero : float := sorry

@[vm_override native.float.one]
def one : float := sorry

instance : has_one float := ⟨one⟩

instance : has_zero float := ⟨zero⟩

@[vm_override native.float.to_repr]
def to_repr (p : float) : string := repr "dummy"

instance : has_repr float := ⟨to_repr⟩

#eval (0.1 + 05 / 0.0000034 : float)
