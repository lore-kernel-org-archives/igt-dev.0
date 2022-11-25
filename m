Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8406269780087698688=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 25 Nov 2022 12:51:01 -0000
Message-ID: <166938066190.7726.14584810899628083081@emeril.freedesktop.org>
References: <20221125120148.28490-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221125120148.28490-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIG11?=
 =?utf-8?q?lti-process_subtests_for_multi-GPUs_=28rev2=29?=
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

--===============8406269780087698688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add multi-process subtests for multi-GPUs (rev2)
URL   : https://patchwork.freedesktop.org/series/109487/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12434 -> IGTPW_8157
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8157 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8157, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/index.html

Participating hosts (36 -> 40)
------------------------------

  Additional (6): fi-cml-u2 bat-adls-5 fi-tgl-dsi bat-dg1-6 fi-bdw-gvtdvm fi-cfl-guc 
  Missing    (2): fi-ctg-p8600 fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8157:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_basic@create-close@create-close-gpu-1} (NEW):
    - fi-glk-j4005:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-glk-j4005/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-rkl-guc:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-guc/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-skl-guc:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-guc/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-dg2-11}:       NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-11/igt@gem_basic@create-close@create-close-gpu-1.html
    - bat-dg1-6:          NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-6/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-skl-6700k2:      NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-6700k2/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-kbl-7567u:       NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-7567u/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-adln-1}:       NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adln-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-cfl-8700k:       NOTRUN -> [INCOMPLETE][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8700k/igt@gem_basic@create-close@create-close-gpu-1.html
    - {fi-tgl-dsi}:       NOTRUN -> [INCOMPLETE][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-tgl-dsi/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-elk-e7500:       NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-elk-e7500/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-kbl-2}:        NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-kbl-2/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-rplp-1}:       NOTRUN -> [INCOMPLETE][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rplp-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-11600/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-bsw-kefka:       NOTRUN -> [INCOMPLETE][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bsw-kefka/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-guc/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-jsl-3}:        NOTRUN -> [INCOMPLETE][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-3/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-dg2-9}:        NOTRUN -> [INCOMPLETE][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-9/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-kbl-x1275:       NOTRUN -> [INCOMPLETE][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-x1275/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-hsw-4770:        NOTRUN -> [INCOMPLETE][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-hsw-4770/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-cfl-8109u:       NOTRUN -> [INCOMPLETE][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8109u/igt@gem_basic@create-close@create-close-gpu-1.html
    - bat-adlp-4:         NOTRUN -> [INCOMPLETE][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-4/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-kbl-8809g:       NOTRUN -> [INCOMPLETE][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-8809g/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-cml-u2:          NOTRUN -> [INCOMPLETE][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cml-u2/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-rpls-2}:       NOTRUN -> [INCOMPLETE][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-2/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-ivb-3770:        NOTRUN -> [INCOMPLETE][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ivb-3770/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-dg2-8}:        NOTRUN -> [INCOMPLETE][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-8/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-adlm-1}:       NOTRUN -> [INCOMPLETE][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlm-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-jsl-1}:        NOTRUN -> [INCOMPLETE][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-blb-e6850:       NOTRUN -> [INCOMPLETE][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-blb-e6850/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-rpls-1}:       NOTRUN -> [INCOMPLETE][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-adlp-6}:       NOTRUN -> [INCOMPLETE][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-6/igt@gem_basic@create-close@create-close-gpu-1.html
    - {fi-ehl-2}:         NOTRUN -> [INCOMPLETE][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ehl-2/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-icl-u2:          NOTRUN -> [INCOMPLETE][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-icl-u2/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-adls-5}:       NOTRUN -> [INCOMPLETE][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adls-5/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-apl-guc:         NOTRUN -> [INCOMPLETE][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-apl-guc/igt@gem_basic@create-close@create-close-gpu-1.html
    - bat-dg1-5:          NOTRUN -> [INCOMPLETE][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-5/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bdw-gvtdvm/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-dg1-7}:        NOTRUN -> [INCOMPLETE][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-7/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-snb-2520m:       NOTRUN -> [INCOMPLETE][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-snb-2520m/igt@gem_basic@create-close@create-close-gpu-1.html

  * {igt@gem_exec_gttfill@multigpu-basic} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cml-u2/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-rpls-2}:       NOTRUN -> [SKIP][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-2/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-guc/igt@gem_exec_gttfill@multigpu-basic.html
    - bat-dg1-6:          NOTRUN -> [SKIP][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-6/igt@gem_exec_gttfill@multigpu-basic.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][45]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-tgl-dsi/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-adlp-6}:       NOTRUN -> [SKIP][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-6/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-rplp-1}:       NOTRUN -> [SKIP][47]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rplp-1/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-11600/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-icl-u2:          NOTRUN -> [SKIP][49]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-icl-u2/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-adls-5}:       NOTRUN -> [SKIP][50]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adls-5/igt@gem_exec_gttfill@multigpu-basic.html
    - bat-dg1-5:          NOTRUN -> [SKIP][51]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-5/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-dg1-7}:        NOTRUN -> [SKIP][52]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-7/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-jsl-3}:        NOTRUN -> [SKIP][53]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-3/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-dg2-9}:        NOTRUN -> [SKIP][54]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-9/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-dg2-11}:       NOTRUN -> [SKIP][55]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html
    - bat-adlp-4:         NOTRUN -> [SKIP][56]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-4/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-adln-1}:       NOTRUN -> [SKIP][57]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adln-1/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-dg2-8}:        NOTRUN -> [SKIP][58]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-8/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-adlm-1}:       NOTRUN -> [SKIP][59]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlm-1/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][60]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-1/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-rpls-1}:       NOTRUN -> [SKIP][61]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-1/igt@gem_exec_gttfill@multigpu-basic.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][62]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ehl-2/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@meta_test@fail-result (NEW):
    - {bat-jsl-1}:        NOTRUN -> [FAIL][63]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-1/igt@meta_test@fail-result.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][64]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-blb-e6850/igt@meta_test@fail-result.html
    - {bat-rpls-1}:       NOTRUN -> [FAIL][65]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-1/igt@meta_test@fail-result.html
    - {bat-adlp-6}:       NOTRUN -> [FAIL][66]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-6/igt@meta_test@fail-result.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][67]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ehl-2/igt@meta_test@fail-result.html
    - fi-icl-u2:          NOTRUN -> [FAIL][68]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-icl-u2/igt@meta_test@fail-result.html
    - fi-apl-guc:         NOTRUN -> [FAIL][69]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-apl-guc/igt@meta_test@fail-result.html
    - bat-dg1-5:          NOTRUN -> [FAIL][70]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-5/igt@meta_test@fail-result.html
    - {bat-dg1-7}:        NOTRUN -> [FAIL][71]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-7/igt@meta_test@fail-result.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][72]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-snb-2520m/igt@meta_test@fail-result.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][73]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-glk-j4005/igt@meta_test@fail-result.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][74]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-guc/igt@meta_test@fail-result.html
    - fi-skl-guc:         NOTRUN -> [FAIL][75]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-guc/igt@meta_test@fail-result.html
    - {bat-dg2-11}:       NOTRUN -> [FAIL][76]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-11/igt@meta_test@fail-result.html
    - bat-dg1-6:          NOTRUN -> [FAIL][77]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-6/igt@meta_test@fail-result.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][78]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-7567u/igt@meta_test@fail-result.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][79]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8700k/igt@meta_test@fail-result.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][80]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-tgl-dsi/igt@meta_test@fail-result.html
    - {bat-kbl-2}:        NOTRUN -> [FAIL][81]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-kbl-2/igt@meta_test@fail-result.html
    - {bat-rplp-1}:       NOTRUN -> [FAIL][82]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rplp-1/igt@meta_test@fail-result.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][83]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-11600/igt@meta_test@fail-result.html
    - {bat-adls-5}:       NOTRUN -> [FAIL][84]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adls-5/igt@meta_test@fail-result.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][85]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bdw-gvtdvm/igt@meta_test@fail-result.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][86]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bsw-kefka/igt@meta_test@fail-result.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][87]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-guc/igt@meta_test@fail-result.html
    - {bat-jsl-3}:        NOTRUN -> [FAIL][88]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-3/igt@meta_test@fail-result.html
    - {bat-dg2-9}:        NOTRUN -> [FAIL][89]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-9/igt@meta_test@fail-result.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][90]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-x1275/igt@meta_test@fail-result.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][91]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-hsw-4770/igt@meta_test@fail-result.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][92]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-6700k2/igt@meta_test@fail-result.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][93]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8109u/igt@meta_test@fail-result.html
    - bat-adlp-4:         NOTRUN -> [FAIL][94]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-4/igt@meta_test@fail-result.html
    - {bat-adln-1}:       NOTRUN -> [FAIL][95]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adln-1/igt@meta_test@fail-result.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][96]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-8809g/igt@meta_test@fail-result.html
    - fi-cml-u2:          NOTRUN -> [FAIL][97]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cml-u2/igt@meta_test@fail-result.html
    - {bat-rpls-2}:       NOTRUN -> [FAIL][98]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-2/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][99]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ivb-3770/igt@meta_test@fail-result.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][100]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-elk-e7500/igt@meta_test@fail-result.html
    - {bat-dg2-8}:        NOTRUN -> [FAIL][101]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-8/igt@meta_test@fail-result.html
    - {bat-adlm-1}:       NOTRUN -> [FAIL][102]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlm-1/igt@meta_test@fail-result.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12434 and IGTPW_8157:

### New IGT tests (4) ###

  * igt@gem_basic@create-close@create-close-gpu-0:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@gem_basic@create-close@create-close-gpu-1:
    - Statuses : 40 incomplete(s)
    - Exec time: [0.0] s

  * igt@gem_exec_gttfill@multigpu-basic:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@meta_test@fail-result:
    - Statuses : 40 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8157 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@gem_exec_gttfill@multigpu-basic} (NEW):
    - fi-snb-2520m:       NOTRUN -> [SKIP][103] ([fdo#109271])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-snb-2520m/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][104] ([fdo#109271])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-glk-j4005/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-skl-guc:         NOTRUN -> [SKIP][105] ([fdo#109271])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-guc/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][106] ([fdo#109271])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8700k/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][107] ([fdo#109271])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-blb-e6850/igt@gem_exec_gttfill@multigpu-basic.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][108] ([fdo#109271])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-kbl-2/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-apl-guc:         NOTRUN -> [SKIP][109] ([fdo#109271])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-apl-guc/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][110] ([fdo#109271])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bdw-gvtdvm/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][111] ([fdo#109271])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bsw-kefka/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][112] ([fdo#109271])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-x1275/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][113] ([fdo#109271])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-hsw-4770/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][114] ([fdo#109271])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-6700k2/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][115] ([fdo#109271])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8109u/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][116] ([fdo#109271])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-7567u/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][117] ([fdo#109271])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-8809g/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][118] ([fdo#109271])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ivb-3770/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][119] ([fdo#109271])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-elk-e7500/igt@gem_exec_gttfill@multigpu-basic.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][120] ([fdo#109271])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-guc/igt@gem_exec_gttfill@multigpu-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7072 -> IGTPW_8157

  CI-20190529: 20190529
  CI_DRM_12434: 985931f189852e505af573997ddbf63bfbe2570b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8157: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/index.html
  IGT_7072: 69ba7163475925cdc69aebbdfa0e87453ae165c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_exec_gttfill@multigpu-basic
-igt@kms_dsc@dsc-fractional-bpp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/index.html

--===============8406269780087698688==
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
<tr><td><b>Series:</b></td><td>Add multi-process subtests for multi-GPUs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109487/">https://patchwork.freedesktop.org/series/109487/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12434 -&gt; IGTPW_8157</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8157 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8157, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/index.html</p>
<h2>Participating hosts (36 -&gt; 40)</h2>
<p>Additional (6): fi-cml-u2 bat-adls-5 fi-tgl-dsi bat-dg1-6 fi-bdw-gvtdvm fi-cfl-guc <br />
  Missing    (2): fi-ctg-p8600 fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8157:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_basic@create-close@create-close-gpu-1} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-glk-j4005/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-guc/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-guc/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-11/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-6/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-6700k2/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-7567u/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adln-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8700k/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-tgl-dsi/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-elk-e7500/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-kbl-2/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rplp-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-11600/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bsw-kefka/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-guc/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-3/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-9/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-x1275/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-hsw-4770/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8109u/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-4/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-8809g/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cml-u2/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-2/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ivb-3770/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-8/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlm-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-blb-e6850/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-6/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ehl-2/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-icl-u2/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adls-5/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-apl-guc/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-5/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bdw-gvtdvm/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-dg1-7}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-7/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-snb-2520m/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_gttfill@multigpu-basic} (NEW):</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cml-u2/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-2/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-guc/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-6/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-tgl-dsi/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-6/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rplp-1/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-11600/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-icl-u2/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adls-5/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-5/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg1-7}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-7/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-3/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-9/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-4/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adln-1/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-8/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlm-1/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-1/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-1/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ehl-2/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-blb-e6850/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-6/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ehl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-icl-u2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-apl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg1-7}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-7/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-snb-2520m/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-glk-j4005/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-11/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg1-6/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-7567u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8700k/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-tgl-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-kbl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rplp-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-rkl-11600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adls-5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bdw-gvtdvm/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bsw-kefka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-jsl-3/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-9/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-x1275/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-hsw-4770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-6700k2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8109u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlp-4/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adln-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-8809g/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cml-u2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-rpls-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-elk-e7500/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-dg2-8/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-adlm-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12434 and IGTPW_8157:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@gem_basic@create-close@create-close-gpu-0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_basic@create-close@create-close-gpu-1:</p>
<ul>
<li>Statuses : 40 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>Statuses : 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result:</p>
<ul>
<li>Statuses : 40 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8157 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@gem_exec_gttfill@multigpu-basic} (NEW):</p>
<ul>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-snb-2520m/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-glk-j4005/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-guc/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8700k/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-blb-e6850/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/bat-kbl-2/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-apl-guc/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bdw-gvtdvm/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-bsw-kefka/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-x1275/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-hsw-4770/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-skl-6700k2/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-8109u/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-7567u/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-kbl-8809g/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-ivb-3770/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-elk-e7500/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/fi-cfl-guc/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7072 -&gt; IGTPW_8157</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12434: 985931f189852e505af573997ddbf63bfbe2570b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8157: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8157/index.html<br />
  IGT_7072: 69ba7163475925cdc69aebbdfa0e87453ae165c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_exec_gttfill@multigpu-basic<br />
-igt@kms_dsc@dsc-fractional-bpp</p>

</body>
</html>

--===============8406269780087698688==--
