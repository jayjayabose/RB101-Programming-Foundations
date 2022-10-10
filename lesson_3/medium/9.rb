def foo(param = "no")
  "yes" # return is always "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo) #:no