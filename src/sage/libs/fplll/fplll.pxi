#
# general include
#

cdef extern from "fplll/fplll.h":
    pass

#
# integers
#

cdef extern from "fplll/nr.h":
    ctypedef struct Z_NR "fplll::Z_NR<mpz_t>":
        mpz_t (*GetData)()
        void (*set_mpz_t "set")(mpz_t d)

    Z_NR *Z_NR_new "new fplll::Z_NR<mpz_t>"()
    void Z_NR_delete "delete "(Z_NR *mem)

    Z_NR *Z_NR_construct "Construct< fplll::Z_NR<mpz_t> >"(void *mem)
    void Z_NR_destruct "Destruct< fplll::Z_NR<mpz_t> >"(Z_NR *mem)

#
# matrices over the integers
#

cdef extern from "fplll/matrix.h":
    ctypedef struct ZZ_mat "fplll::ZZ_mat<mpz_t>":
        int (*GetNumCols)()
        int (*GetNumRows)()

        Z_NR (*Get)(int i, int j)
        void (*Set)(int i, int j, Z_NR d)

        void (*print_c "print")()

        void (*gen_intrel)(int bits)
        void (*gen_simdioph)(int bits,int bits2)
        void (*gen_uniform)(int bits)
        void (*gen_ntrulike)(int bits,int q)
        void (*gen_ntrulike2)(int bits,int q)
        void (*gen_ajtai)(double alpha)

    ZZ_mat *ZZ_mat_new "new fplll::ZZ_mat<mpz_t>"(int r, int c)
    void ZZ_mat_delete "delete "(ZZ_mat *mem)

#
# fastest LLL
#

cdef  extern from "fplll/fplllv31.h":
    ctypedef struct fast_double "fplll::fast<mpz_t,double>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    fast_double *fast_double_new "new fplll::fast<mpz_t,double>"(ZZ_mat *B,int precision, double eta, double delta)
    void fast_double_delete "delete "(fast_double *mem)

#
# fastest LLL with early reduction
#

cdef  extern from "fplll/fplllv31.h":
    ctypedef struct fast_early_red_double "fplll::fast_early_red<mpz_t,double>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    fast_early_red_double *fast_early_red_double_new "new fplll::fast_early_red<mpz_t,double>"(ZZ_mat *B,int precision, double eta, double delta)
    void fast_early_red_double_delete "delete "(fast_early_red_double *mem)

#
# heuristic
#

cdef  extern from "fplll/fplllv31.h":
    ctypedef struct heuristic_mpfr "fplll::heuristic<mpz_t,mpfr_t>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    heuristic_mpfr *heuristic_mpfr_new "new fplll::heuristic<mpz_t,mpfr_t>"(ZZ_mat *B,int precision, double eta, double delta)
    void heuristic_mpfr_delete "delete "(heuristic_mpfr *mem)

    ctypedef struct heuristic_dpe "fplll::heuristic<mpz_t,dpe_t>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    heuristic_dpe *heuristic_dpe_new "new fplll::heuristic<mpz_t,dpe_t>"(ZZ_mat *B,int precision, double eta, double delta)
    void heuristic_dpe_delete "delete "(heuristic_dpe *mem)

    ctypedef struct heuristic_double "fplll::heuristic<mpz_t,double>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    heuristic_double *heuristic_double_new "new fplll::heuristic<mpz_t,double>"(ZZ_mat *B,int precision, double eta, double delta)
    void heuristic_double_delete "delete "(heuristic_double *mem)

#
# heuristic with early reduction
#

cdef  extern from "fplll/fplllv31.h":
    ctypedef struct heuristic_early_red_mpfr "fplll::heuristic_early_red<mpz_t,mpfr_t>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    heuristic_early_red_mpfr *heuristic_early_red_mpfr_new "new fplll::heuristic_early_red<mpz_t,mpfr_t>"(ZZ_mat *B,int precision, double eta, double delta)
    void heuristic_early_red_mpfr_delete "delete "(heuristic_early_red_mpfr *mem)

    ctypedef struct heuristic_early_red_dpe "fplll::heuristic_early_red<mpz_t,dpe_t>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    heuristic_early_red_dpe *heuristic_early_red_dpe_new "new fplll::heuristic_early_red<mpz_t,dpe_t>"(ZZ_mat *B,int precision, double eta, double delta)
    void heuristic_early_red_dpe_delete "delete "(heuristic_early_red_dpe *mem)

    ctypedef struct heuristic_early_red_double "fplll::heuristic_early_red<mpz_t,double>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    heuristic_early_red_double *heuristic_early_red_double_new "new fplll::heuristic_early_red<mpz_t,double>"(ZZ_mat *B,int precision, double eta, double delta)
    void heuristic_early_red_double_delete "delete "(heuristic_early_red_double *mem)



#
# provable LLL
#

cdef  extern from "fplll/fplllv31.h":
    ctypedef struct proved_mpfr "fplll::proved<mpz_t,mpfr_t>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    proved_mpfr *proved_mpfr_new "new fplll::proved<mpz_t,mpfr_t>"(ZZ_mat *B,int precision, double eta, double delta)
    void proved_mpfr_delete "delete "(proved_mpfr *mem)

    ctypedef struct proved_dpe "fplll::proved<mpz_t,dpe_t>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    proved_dpe *proved_dpe_new "new fplll::proved<mpz_t,dpe_t>"(ZZ_mat *B,int precision, double eta, double delta)
    void proved_dpe_delete "delete "(proved_dpe *mem)

    ctypedef struct proved_double "fplll::proved<mpz_t,double>":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    proved_double *proved_double_new "new fplll::proved<mpz_t,double>"(ZZ_mat *B,int precision, double eta, double delta)
    void proved_double_delete "delete "(proved_double *mem)

#
# wrapper code which chooses a LLL sequence automatically
#

cdef  extern from "fplll/fplllv31.h":
    ctypedef struct wrapper "fplll::wrapper":
      int (*LLL)()
      ZZ_mat* (*GetBase)()

    wrapper *wrapper_new "new fplll::wrapper"(ZZ_mat *B,int precision, double eta, double delta)
    void wrapper_delete "delete "(wrapper *mem)
