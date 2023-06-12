Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8789223339242925648=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Mon, 12 Jun 2023 09:42:45 -0000
Message-ID: <168656296582.26644.1150518428783932171@emeril.freedesktop.org>
References: <20230612085948.12130-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230612085948.12130-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSW50ZWdy?=
 =?utf-8?q?ate_igt=5Fspin=5Fnew_with_Xe_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============8789223339242925648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Integrate igt_spin_new with Xe (rev4)
URL   : https://patchwork.freedesktop.org/series/118837/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7326 -> IGTPW_9147
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9147 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9147, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9147:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_busy@busy@all-engines:
    - fi-hsw-4770:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-hsw-4770/igt@gem_busy@busy@all-engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-hsw-4770/igt@gem_busy@busy@all-engines.html
    - bat-rpls-2:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-rpls-2/igt@gem_busy@busy@all-engines.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-rpls-2/igt@gem_busy@busy@all-engines.html
    - bat-jsl-1:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-jsl-1/igt@gem_busy@busy@all-engines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-jsl-1/igt@gem_busy@busy@all-engines.html
    - fi-cfl-8700k:       [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-8700k/igt@gem_busy@busy@all-engines.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-8700k/igt@gem_busy@busy@all-engines.html
    - fi-blb-e6850:       [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-blb-e6850/igt@gem_busy@busy@all-engines.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-blb-e6850/igt@gem_busy@busy@all-engines.html
    - bat-rpls-1:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-rpls-1/igt@gem_busy@busy@all-engines.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-rpls-1/igt@gem_busy@busy@all-engines.html
    - bat-adlp-6:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-6/igt@gem_busy@busy@all-engines.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-6/igt@gem_busy@busy@all-engines.html
    - fi-rkl-11600:       [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-rkl-11600/igt@gem_busy@busy@all-engines.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-rkl-11600/igt@gem_busy@busy@all-engines.html
    - fi-skl-6600u:       [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-skl-6600u/igt@gem_busy@busy@all-engines.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-skl-6600u/igt@gem_busy@busy@all-engines.html
    - bat-adls-5:         [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adls-5/igt@gem_busy@busy@all-engines.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adls-5/igt@gem_busy@busy@all-engines.html
    - fi-apl-guc:         [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-apl-guc/igt@gem_busy@busy@all-engines.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-apl-guc/igt@gem_busy@busy@all-engines.html
    - bat-dg1-5:          [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg1-5/igt@gem_busy@busy@all-engines.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg1-5/igt@gem_busy@busy@all-engines.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-pnv-d510/igt@gem_busy@busy@all-engines.html
    - bat-atsm-1:         [PASS][26] -> [FAIL][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-atsm-1/igt@gem_busy@busy@all-engines.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-atsm-1/igt@gem_busy@busy@all-engines.html
    - bat-dg1-7:          [PASS][28] -> [FAIL][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg1-7/igt@gem_busy@busy@all-engines.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg1-7/igt@gem_busy@busy@all-engines.html
    - bat-jsl-3:          [PASS][30] -> [FAIL][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-jsl-3/igt@gem_busy@busy@all-engines.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-jsl-3/igt@gem_busy@busy@all-engines.html
    - fi-glk-j4005:       [PASS][32] -> [FAIL][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-glk-j4005/igt@gem_busy@busy@all-engines.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-glk-j4005/igt@gem_busy@busy@all-engines.html
    - bat-adlp-9:         [PASS][34] -> [FAIL][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-9/igt@gem_busy@busy@all-engines.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-9/igt@gem_busy@busy@all-engines.html
    - fi-skl-guc:         [PASS][36] -> [FAIL][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-skl-guc/igt@gem_busy@busy@all-engines.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-skl-guc/igt@gem_busy@busy@all-engines.html
    - bat-dg2-11:         [PASS][38] -> [FAIL][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-11/igt@gem_busy@busy@all-engines.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-11/igt@gem_busy@busy@all-engines.html
    - fi-cfl-8109u:       [PASS][40] -> [FAIL][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-8109u/igt@gem_busy@busy@all-engines.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-8109u/igt@gem_busy@busy@all-engines.html
    - fi-kbl-7567u:       [PASS][42] -> [FAIL][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-7567u/igt@gem_busy@busy@all-engines.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-7567u/igt@gem_busy@busy@all-engines.html
    - bat-adln-1:         [PASS][44] -> [FAIL][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adln-1/igt@gem_busy@busy@all-engines.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adln-1/igt@gem_busy@busy@all-engines.html
    - fi-kbl-8809g:       [PASS][46] -> [FAIL][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-8809g/igt@gem_busy@busy@all-engines.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-8809g/igt@gem_busy@busy@all-engines.html
    - fi-ivb-3770:        [PASS][48] -> [FAIL][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-ivb-3770/igt@gem_busy@busy@all-engines.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-ivb-3770/igt@gem_busy@busy@all-engines.html
    - fi-elk-e7500:       [PASS][50] -> [FAIL][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-elk-e7500/igt@gem_busy@busy@all-engines.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-elk-e7500/igt@gem_busy@busy@all-engines.html
    - bat-dg2-8:          [PASS][52] -> [FAIL][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-8/igt@gem_busy@busy@all-engines.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-8/igt@gem_busy@busy@all-engines.html
    - fi-bsw-nick:        [PASS][54] -> [FAIL][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-bsw-nick/igt@gem_busy@busy@all-engines.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-bsw-nick/igt@gem_busy@busy@all-engines.html
    - fi-kbl-guc:         [PASS][56] -> [FAIL][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-guc/igt@gem_busy@busy@all-engines.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-guc/igt@gem_busy@busy@all-engines.html
    - bat-adlm-1:         [PASS][58] -> [FAIL][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlm-1/igt@gem_busy@busy@all-engines.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlm-1/igt@gem_busy@busy@all-engines.html
    - fi-ilk-650:         [PASS][60] -> [FAIL][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-ilk-650/igt@gem_busy@busy@all-engines.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-ilk-650/igt@gem_busy@busy@all-engines.html
    - fi-tgl-1115g4:      [PASS][62] -> [FAIL][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-tgl-1115g4/igt@gem_busy@busy@all-engines.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-tgl-1115g4/igt@gem_busy@busy@all-engines.html
    - fi-bsw-n3050:       [PASS][64] -> [FAIL][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-bsw-n3050/igt@gem_busy@busy@all-engines.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-bsw-n3050/igt@gem_busy@busy@all-engines.html
    - fi-cfl-guc:         [PASS][66] -> [FAIL][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-guc/igt@gem_busy@busy@all-engines.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-guc/igt@gem_busy@busy@all-engines.html
    - bat-dg2-9:          [PASS][68] -> [FAIL][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-9/igt@gem_busy@busy@all-engines.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-9/igt@gem_busy@busy@all-engines.html
    - fi-kbl-x1275:       [PASS][70] -> [FAIL][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-x1275/igt@gem_busy@busy@all-engines.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-x1275/igt@gem_busy@busy@all-engines.html

  * igt@gem_exec_fence@basic-await@rcs0:
    - fi-cfl-guc:         [PASS][72] -> [CRASH][73] +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-guc/igt@gem_exec_fence@basic-await@rcs0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-guc/igt@gem_exec_fence@basic-await@rcs0.html
    - bat-dg2-9:          [PASS][74] -> [CRASH][75] +6 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html
    - fi-hsw-4770:        [PASS][76] -> [CRASH][77] +8 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-hsw-4770/igt@gem_exec_fence@basic-await@rcs0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-hsw-4770/igt@gem_exec_fence@basic-await@rcs0.html

  * igt@gem_exec_fence@basic-busy@rcs0:
    - bat-rpls-2:         [PASS][78] -> [CRASH][79] +5 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-rpls-2/igt@gem_exec_fence@basic-busy@rcs0.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-rpls-2/igt@gem_exec_fence@basic-busy@rcs0.html
    - bat-jsl-1:          [PASS][80] -> [CRASH][81] +6 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-jsl-1/igt@gem_exec_fence@basic-busy@rcs0.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-jsl-1/igt@gem_exec_fence@basic-busy@rcs0.html
    - fi-blb-e6850:       [PASS][82] -> [CRASH][83] +7 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-blb-e6850/igt@gem_exec_fence@basic-busy@rcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-blb-e6850/igt@gem_exec_fence@basic-busy@rcs0.html
    - bat-rpls-1:         [PASS][84] -> [CRASH][85] +5 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-rpls-1/igt@gem_exec_fence@basic-busy@rcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-rpls-1/igt@gem_exec_fence@basic-busy@rcs0.html

  * igt@gem_exec_fence@basic-wait@rcs0:
    - fi-apl-guc:         [PASS][86] -> [CRASH][87] +6 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-apl-guc/igt@gem_exec_fence@basic-wait@rcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-apl-guc/igt@gem_exec_fence@basic-wait@rcs0.html
    - bat-dg1-5:          [PASS][88] -> [CRASH][89] +6 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg1-5/igt@gem_exec_fence@basic-wait@rcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg1-5/igt@gem_exec_fence@basic-wait@rcs0.html
    - fi-pnv-d510:        NOTRUN -> [CRASH][90] +7 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-pnv-d510/igt@gem_exec_fence@basic-wait@rcs0.html
    - bat-dg1-7:          [PASS][91] -> [CRASH][92] +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg1-7/igt@gem_exec_fence@basic-wait@rcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg1-7/igt@gem_exec_fence@basic-wait@rcs0.html
    - bat-jsl-3:          [PASS][93] -> [CRASH][94] +6 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-jsl-3/igt@gem_exec_fence@basic-wait@rcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-jsl-3/igt@gem_exec_fence@basic-wait@rcs0.html
    - fi-glk-j4005:       [PASS][95] -> [CRASH][96] +6 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-glk-j4005/igt@gem_exec_fence@basic-wait@rcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-glk-j4005/igt@gem_exec_fence@basic-wait@rcs0.html
    - bat-adlp-9:         [PASS][97] -> [CRASH][98] +6 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-9/igt@gem_exec_fence@basic-wait@rcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-9/igt@gem_exec_fence@basic-wait@rcs0.html

  * igt@gem_exec_fence@nb-await@rcs0:
    - fi-bsw-n3050:       [PASS][99] -> [CRASH][100] +8 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-bsw-n3050/igt@gem_exec_fence@nb-await@rcs0.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-bsw-n3050/igt@gem_exec_fence@nb-await@rcs0.html

  * igt@gem_exec_gttfill@basic:
    - fi-hsw-4770:        [PASS][101] -> [TIMEOUT][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-hsw-4770/igt@gem_exec_gttfill@basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-hsw-4770/igt@gem_exec_gttfill@basic.html

  * igt@gem_wait@busy@all-engines:
    - fi-skl-guc:         [PASS][103] -> [CRASH][104] +6 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-skl-guc/igt@gem_wait@busy@all-engines.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-skl-guc/igt@gem_wait@busy@all-engines.html
    - bat-dg2-11:         [PASS][105] -> [CRASH][106] +6 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-11/igt@gem_wait@busy@all-engines.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-11/igt@gem_wait@busy@all-engines.html
    - fi-kbl-x1275:       [PASS][107] -> [CRASH][108] +5 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html
    - fi-cfl-8109u:       [PASS][109] -> [CRASH][110] +6 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-8109u/igt@gem_wait@busy@all-engines.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-8109u/igt@gem_wait@busy@all-engines.html
    - fi-kbl-8809g:       [PASS][111] -> [CRASH][112] +5 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-8809g/igt@gem_wait@busy@all-engines.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-8809g/igt@gem_wait@busy@all-engines.html
    - fi-ivb-3770:        [PASS][113] -> [CRASH][114] +8 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-ivb-3770/igt@gem_wait@busy@all-engines.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-ivb-3770/igt@gem_wait@busy@all-engines.html
    - bat-dg2-8:          [PASS][115] -> [CRASH][116] +6 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-8/igt@gem_wait@busy@all-engines.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-8/igt@gem_wait@busy@all-engines.html
    - fi-bsw-nick:        [PASS][117] -> [CRASH][118] +5 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-bsw-nick/igt@gem_wait@busy@all-engines.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-bsw-nick/igt@gem_wait@busy@all-engines.html
    - fi-kbl-guc:         [PASS][119] -> [CRASH][120] +5 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-guc/igt@gem_wait@busy@all-engines.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-guc/igt@gem_wait@busy@all-engines.html
    - bat-adlm-1:         [PASS][121] -> [CRASH][122] +5 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlm-1/igt@gem_wait@busy@all-engines.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlm-1/igt@gem_wait@busy@all-engines.html
    - fi-ilk-650:         [PASS][123] -> [CRASH][124] +8 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-ilk-650/igt@gem_wait@busy@all-engines.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-ilk-650/igt@gem_wait@busy@all-engines.html

  * igt@gem_wait@wait@all-engines:
    - bat-adlp-6:         [PASS][125] -> [CRASH][126] +6 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-6/igt@gem_wait@wait@all-engines.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-6/igt@gem_wait@wait@all-engines.html
    - fi-rkl-11600:       [PASS][127] -> [CRASH][128] +6 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-rkl-11600/igt@gem_wait@wait@all-engines.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-rkl-11600/igt@gem_wait@wait@all-engines.html
    - fi-skl-6600u:       [PASS][129] -> [CRASH][130] +6 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-skl-6600u/igt@gem_wait@wait@all-engines.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-skl-6600u/igt@gem_wait@wait@all-engines.html
    - bat-adls-5:         [PASS][131] -> [CRASH][132] +5 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adls-5/igt@gem_wait@wait@all-engines.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adls-5/igt@gem_wait@wait@all-engines.html
    - bat-atsm-1:         [PASS][133] -> [CRASH][134] +5 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-atsm-1/igt@gem_wait@wait@all-engines.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-atsm-1/igt@gem_wait@wait@all-engines.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [PASS][135] -> [CRASH][136] +6 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-7567u/igt@kms_busy@basic@flip.html
    - bat-adln-1:         [PASS][137] -> [CRASH][138] +6 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adln-1/igt@kms_busy@basic@flip.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adln-1/igt@kms_busy@basic@flip.html
    - fi-cfl-8700k:       [PASS][139] -> [CRASH][140] +6 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-8700k/igt@kms_busy@basic@flip.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-8700k/igt@kms_busy@basic@flip.html
    - fi-elk-e7500:       [PASS][141] -> [CRASH][142] +8 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-elk-e7500/igt@kms_busy@basic@flip.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-elk-e7500/igt@kms_busy@basic@flip.html
    - fi-tgl-1115g4:      [PASS][143] -> [CRASH][144] +6 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-tgl-1115g4/igt@kms_busy@basic@flip.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-tgl-1115g4/igt@kms_busy@basic@flip.html

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - bat-adln-1:         [PASS][145] -> [ABORT][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adln-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adln-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html

  * igt@kms_force_connector_basic@force-edid:
    - bat-adlp-9:         [PASS][147] -> [ABORT][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html

  
#### Warnings ####

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - bat-adlp-6:         [SKIP][149] ([i915#7828]) -> [ABORT][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-6/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-6/igt@kms_chamelium_frames@hdmi-crc-fast.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_busy@busy@all-engines:
    - {bat-mtlp-8}:       [PASS][151] -> [FAIL][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-mtlp-8/igt@gem_busy@busy@all-engines.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-mtlp-8/igt@gem_busy@busy@all-engines.html
    - {bat-kbl-2}:        [PASS][153] -> [FAIL][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-kbl-2/igt@gem_busy@busy@all-engines.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-kbl-2/igt@gem_busy@busy@all-engines.html
    - {bat-mtlp-6}:       [PASS][155] -> [FAIL][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-mtlp-6/igt@gem_busy@busy@all-engines.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-mtlp-6/igt@gem_busy@busy@all-engines.html

  * igt@gem_exec_fence@basic-await@rcs0:
    - {bat-mtlp-6}:       [PASS][157] -> [CRASH][158] +5 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-mtlp-6/igt@gem_exec_fence@basic-await@rcs0.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-mtlp-6/igt@gem_exec_fence@basic-await@rcs0.html

  * igt@gem_exec_fence@basic-busy@rcs0:
    - {bat-mtlp-8}:       [PASS][159] -> [CRASH][160] +6 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-mtlp-8/igt@gem_exec_fence@basic-busy@rcs0.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-mtlp-8/igt@gem_exec_fence@basic-busy@rcs0.html

  * igt@gem_wait@wait@all-engines:
    - {bat-kbl-2}:        [PASS][161] -> [CRASH][162] +5 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-kbl-2/igt@gem_wait@wait@all-engines.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-kbl-2/igt@gem_wait@wait@all-engines.html

  * igt@i915_pm_rpm@basic-rte:
    - {bat-mtlp-8}:       [PASS][163] -> [ABORT][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html

  
Known issues
------------

  Here are the changes found in IGTPW_9147 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@guc:
    - bat-rpls-2:         [PASS][165] -> [DMESG-WARN][166] ([i915#7852])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-rpls-2/igt@i915_selftest@live@guc.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-rpls-2/igt@i915_selftest@live@guc.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][167] ([fdo#109271]) +36 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-pnv-d510:        NOTRUN -> [SKIP][168] ([fdo#109271] / [i915#4579])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-pnv-d510/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - bat-dg2-8:          [FAIL][169] ([i915#7932]) -> [PASS][170] +1 similar issue
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7326 -> IGTPW_9147

  CI-20190529: 20190529
  CI_DRM_13261: 05a9d13d90594f3e592f5992a05b00641c936350 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9147: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/index.html
  IGT_7326: 02c2cf17628b6203d6105d4a91dfe8a101d482ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_spin_batch@spin-all
+igt@xe_spin_batch@spin-basic
+igt@xe_spin_batch@spin-basic-all
+igt@xe_spin_batch@spin-batch

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/index.html

--===============8789223339242925648==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Integrate igt_spin_new with Xe (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118837/">https://patchwork.freedesktop.org/series/118837/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7326 -&gt; IGTPW_9147</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9147 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9147, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9147:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_busy@busy@all-engines:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-hsw-4770/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-hsw-4770/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-rpls-2/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-rpls-2/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-jsl-1/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-jsl-1/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-8700k/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-8700k/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-blb-e6850/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-blb-e6850/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-rpls-1/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-rpls-1/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-6/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-6/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-rkl-11600/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-rkl-11600/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-skl-6600u/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-skl-6600u/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adls-5/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adls-5/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-apl-guc/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-apl-guc/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg1-5/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg1-5/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-pnv-d510/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-atsm-1/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-atsm-1/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg1-7/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg1-7/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-jsl-3/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-jsl-3/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-glk-j4005/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-glk-j4005/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-9/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-9/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-skl-guc/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-skl-guc/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-11/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-11/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-8109u/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-8109u/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-7567u/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-7567u/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adln-1/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adln-1/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-8809g/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-8809g/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-ivb-3770/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-ivb-3770/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-elk-e7500/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-elk-e7500/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-8/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-8/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-bsw-nick/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-bsw-nick/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-guc/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-guc/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlm-1/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlm-1/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-ilk-650/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-ilk-650/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-tgl-1115g4/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-tgl-1115g4/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-bsw-n3050/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-bsw-n3050/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-guc/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-guc/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-9/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-9/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-x1275/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-x1275/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-guc/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-guc/igt@gem_exec_fence@basic-await@rcs0.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-hsw-4770/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-hsw-4770/igt@gem_exec_fence@basic-await@rcs0.html">CRASH</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-rpls-2/igt@gem_exec_fence@basic-busy@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-rpls-2/igt@gem_exec_fence@basic-busy@rcs0.html">CRASH</a> +5 similar issues</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-jsl-1/igt@gem_exec_fence@basic-busy@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-jsl-1/igt@gem_exec_fence@basic-busy@rcs0.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-blb-e6850/igt@gem_exec_fence@basic-busy@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-blb-e6850/igt@gem_exec_fence@basic-busy@rcs0.html">CRASH</a> +7 similar issues</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-rpls-1/igt@gem_exec_fence@basic-busy@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-rpls-1/igt@gem_exec_fence@basic-busy@rcs0.html">CRASH</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@rcs0:</p>
<ul>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-apl-guc/igt@gem_exec_fence@basic-wait@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-apl-guc/igt@gem_exec_fence@basic-wait@rcs0.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg1-5/igt@gem_exec_fence@basic-wait@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg1-5/igt@gem_exec_fence@basic-wait@rcs0.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-pnv-d510/igt@gem_exec_fence@basic-wait@rcs0.html">CRASH</a> +7 similar issues</p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg1-7/igt@gem_exec_fence@basic-wait@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg1-7/igt@gem_exec_fence@basic-wait@rcs0.html">CRASH</a> +5 similar issues</p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-jsl-3/igt@gem_exec_fence@basic-wait@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-jsl-3/igt@gem_exec_fence@basic-wait@rcs0.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-glk-j4005/igt@gem_exec_fence@basic-wait@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-glk-j4005/igt@gem_exec_fence@basic-wait@rcs0.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-9/igt@gem_exec_fence@basic-wait@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-9/igt@gem_exec_fence@basic-wait@rcs0.html">CRASH</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-bsw-n3050/igt@gem_exec_fence@nb-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-bsw-n3050/igt@gem_exec_fence@nb-await@rcs0.html">CRASH</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-hsw-4770/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-hsw-4770/igt@gem_exec_gttfill@basic.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all-engines:</p>
<ul>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-skl-guc/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-skl-guc/igt@gem_wait@busy@all-engines.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-11/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-11/igt@gem_wait@busy@all-engines.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-x1275/igt@gem_wait@busy@all-engines.html">CRASH</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-8109u/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-8109u/igt@gem_wait@busy@all-engines.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-8809g/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-8809g/igt@gem_wait@busy@all-engines.html">CRASH</a> +5 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-ivb-3770/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-ivb-3770/igt@gem_wait@busy@all-engines.html">CRASH</a> +8 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-8/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-8/igt@gem_wait@busy@all-engines.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-bsw-nick/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-bsw-nick/igt@gem_wait@busy@all-engines.html">CRASH</a> +5 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-guc/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-guc/igt@gem_wait@busy@all-engines.html">CRASH</a> +5 similar issues</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlm-1/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlm-1/igt@gem_wait@busy@all-engines.html">CRASH</a> +5 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-ilk-650/igt@gem_wait@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-ilk-650/igt@gem_wait@busy@all-engines.html">CRASH</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all-engines:</p>
<ul>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-6/igt@gem_wait@wait@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-6/igt@gem_wait@wait@all-engines.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-rkl-11600/igt@gem_wait@wait@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-rkl-11600/igt@gem_wait@wait@all-engines.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-skl-6600u/igt@gem_wait@wait@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-skl-6600u/igt@gem_wait@wait@all-engines.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adls-5/igt@gem_wait@wait@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adls-5/igt@gem_wait@wait@all-engines.html">CRASH</a> +5 similar issues</p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-atsm-1/igt@gem_wait@wait@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-atsm-1/igt@gem_wait@wait@all-engines.html">CRASH</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-kbl-7567u/igt@kms_busy@basic@flip.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adln-1/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adln-1/igt@kms_busy@basic@flip.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-cfl-8700k/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-cfl-8700k/igt@kms_busy@basic@flip.html">CRASH</a> +6 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-elk-e7500/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-elk-e7500/igt@kms_busy@basic@flip.html">CRASH</a> +8 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/fi-tgl-1115g4/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-tgl-1115g4/igt@kms_busy@basic@flip.html">CRASH</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adln-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adln-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_chamelium_frames@hdmi-crc-fast:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-adlp-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-adlp-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_busy@busy@all-engines:</p>
<ul>
<li>
<p>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>{bat-kbl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-kbl-2/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-kbl-2/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
<li>
<p>{bat-mtlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-mtlp-6/igt@gem_busy@busy@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-mtlp-6/igt@gem_busy@busy@all-engines.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>{bat-mtlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-mtlp-6/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-mtlp-6/igt@gem_exec_fence@basic-await@rcs0.html">CRASH</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-mtlp-8/igt@gem_exec_fence@basic-busy@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-mtlp-8/igt@gem_exec_fence@basic-busy@rcs0.html">CRASH</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all-engines:</p>
<ul>
<li>{bat-kbl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-kbl-2/igt@gem_wait@wait@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-kbl-2/igt@gem_wait@wait@all-engines.html">CRASH</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9147 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-rpls-2/igt@i915_selftest@live@guc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-rpls-2/igt@i915_selftest@live@guc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7852">i915#7852</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/fi-pnv-d510/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7326/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7326 -&gt; IGTPW_9147</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13261: 05a9d13d90594f3e592f5992a05b00641c936350 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9147: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9147/index.html<br />
  IGT_7326: 02c2cf17628b6203d6105d4a91dfe8a101d482ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_spin_batch@spin-all<br />
+igt@xe_spin_batch@spin-basic<br />
+igt@xe_spin_batch@spin-basic-all<br />
+igt@xe_spin_batch@spin-batch</p>

</body>
</html>

--===============8789223339242925648==--
