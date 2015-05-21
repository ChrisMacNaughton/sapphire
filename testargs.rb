require_relative 'compiler'

prog = prog = [:do, 
  [:defun, :f, [:test,[:arr, :rest]],[:let,[:i], 
      [:assign, :i, 0], 
      [:while, [:lt,:i,[:sub,:numargs,1]], [:do, 
          [:printf, "test=%ld, i=%ld, numargs=%ld, arr[i]=%ld\\n",:test,:i,:numargs,[:index, :arr, :i]], 
          [:assign, :i, [:add, :i, 1]], 
        ] 
      ] 
    ] 
  ], 
  [:defun,:g,[:i,:j],[:let,[:k], 
      [:assign,:k,42], 
      [:printf,"numargs=%ld, i=%ld,j=%ld,k=%ld\n",:numargs,:i,:j,:k] 
    ] 
  ], 
  [:f,123, 42,43,45], 
  [:g,23,67] 
]
    
Compiler.new.compile(prog)