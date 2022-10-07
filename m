Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2639355219460860767=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 07 Oct 2022 19:24:53 -0000
Message-ID: <166517069389.15727.4419133472045805151@emeril.freedesktop.org>
References: <20221007184902.54695-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221007184902.54695-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIG11?=
 =?utf-8?q?lti-process_subtests_for_multi-GPUs?=
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

--===============2639355219460860767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add multi-process subtests for multi-GPUs
URL   : https://patchwork.freedesktop.org/series/109487/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12226 -> IGTPW_7927
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7927 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7927, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/index.html

Participating hosts (44 -> 46)
------------------------------

  Additional (4): fi-kbl-soraka bat-atsm-1 bat-adls-5 bat-dg1-6 
  Missing    (2): fi-ctg-p8600 fi-hsw-4200u 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7927:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_basic@create-close@create-close-gpu-1} (NEW):
    - fi-glk-j4005:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-glk-j4005/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-rkl-guc:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-guc/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-skl-guc:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-guc/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-dg2-11}:       NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-11/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-soraka/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-skl-6700k2:      NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6700k2/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-kbl-7567u:       NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-7567u/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-adln-1}:       NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adln-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-cfl-8700k:       NOTRUN -> [INCOMPLETE][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8700k/igt@gem_basic@create-close@create-close-gpu-1.html
    - {fi-tgl-dsi}:       NOTRUN -> [INCOMPLETE][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-dsi/igt@gem_basic@create-close@create-close-gpu-1.html
    - {fi-tgl-mst}:       NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-mst/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-elk-e7500:       NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-elk-e7500/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-bsw-nick:        NOTRUN -> [INCOMPLETE][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bsw-nick/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-rplp-1}:       NOTRUN -> [INCOMPLETE][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rplp-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-11600/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-hsw-g3258:       NOTRUN -> [INCOMPLETE][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-hsw-g3258/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-adl-ddr5:        NOTRUN -> [INCOMPLETE][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-adl-ddr5/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-atsm-1}:       NOTRUN -> [INCOMPLETE][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-atsm-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-guc/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-jsl-3}:        NOTRUN -> [INCOMPLETE][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-3/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-dg2-9}:        NOTRUN -> [INCOMPLETE][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-9/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-5557u/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-cfl-8109u:       NOTRUN -> [INCOMPLETE][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8109u/igt@gem_basic@create-close@create-close-gpu-1.html
    - bat-adlp-4:         NOTRUN -> [INCOMPLETE][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-4/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-kbl-8809g:       NOTRUN -> [INCOMPLETE][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-8809g/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-rpls-2}:       NOTRUN -> [INCOMPLETE][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rpls-2/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-ivb-3770:        NOTRUN -> [INCOMPLETE][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ivb-3770/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-dg2-8}:        NOTRUN -> [INCOMPLETE][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-8/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-kbl-guc:         NOTRUN -> [INCOMPLETE][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-guc/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-snb-2600:        NOTRUN -> [INCOMPLETE][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2600/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-adlm-1}:       NOTRUN -> [INCOMPLETE][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlm-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-ilk-650:         NOTRUN -> [INCOMPLETE][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ilk-650/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-jsl-1}:        NOTRUN -> [INCOMPLETE][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-bxt-dsi:         NOTRUN -> [INCOMPLETE][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bxt-dsi/igt@gem_basic@create-close@create-close-gpu-1.html
    - {fi-jsl-1}:         NOTRUN -> [INCOMPLETE][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-jsl-1/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-blb-e6850:       NOTRUN -> [INCOMPLETE][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-blb-e6850/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-adlp-6}:       NOTRUN -> [INCOMPLETE][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-6/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-skl-6600u:       NOTRUN -> [INCOMPLETE][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6600u/igt@gem_basic@create-close@create-close-gpu-1.html
    - {fi-ehl-2}:         NOTRUN -> [INCOMPLETE][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ehl-2/igt@gem_basic@create-close@create-close-gpu-1.html
    - {bat-adls-5}:       NOTRUN -> [INCOMPLETE][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adls-5/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-apl-guc:         NOTRUN -> [INCOMPLETE][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-apl-guc/igt@gem_basic@create-close@create-close-gpu-1.html
    - bat-dg1-5:          NOTRUN -> [INCOMPLETE][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-5/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-gvtdvm/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-pnv-d510/igt@gem_basic@create-close@create-close-gpu-1.html
    - fi-snb-2520m:       NOTRUN -> [INCOMPLETE][45]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2520m/igt@gem_basic@create-close@create-close-gpu-1.html

  * {igt@gem_exec_gttfill@basic@basic-gpu-0} (NEW):
    - fi-pnv-d510:        NOTRUN -> [FAIL][46] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-pnv-d510/igt@gem_exec_gttfill@basic@basic-gpu-0.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][47] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-elk-e7500/igt@gem_exec_gttfill@basic@basic-gpu-0.html

  * {igt@gem_exec_gttfill@basic@basic-gpu-1} (NEW):
    - {bat-adlp-6}:       NOTRUN -> [SKIP][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-6/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][49]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ehl-2/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - bat-dg1-5:          NOTRUN -> [SKIP][50]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-5/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][51]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-guc/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-dg2-11}:       NOTRUN -> [SKIP][52]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-11/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][53]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-dsi/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {fi-tgl-mst}:       NOTRUN -> [SKIP][54]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-mst/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-rplp-1}:       NOTRUN -> [SKIP][55]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rplp-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][56]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-11600/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-adls-5}:       NOTRUN -> [SKIP][57]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adls-5/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][58]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-adl-ddr5/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-atsm-1}:       NOTRUN -> [SKIP][59]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-atsm-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-jsl-3}:        NOTRUN -> [SKIP][60]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-3/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-dg2-9}:        NOTRUN -> [SKIP][61]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-9/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - bat-adlp-4:         NOTRUN -> [SKIP][62]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-4/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-adln-1}:       NOTRUN -> [SKIP][63]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adln-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-rpls-2}:       NOTRUN -> [SKIP][64]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rpls-2/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-dg2-8}:        NOTRUN -> [SKIP][65]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-8/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-adlm-1}:       NOTRUN -> [SKIP][66]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlm-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][67]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][68]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-jsl-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html

  * igt@meta_test@fail-result (NEW):
    - fi-ilk-650:         NOTRUN -> [FAIL][69] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ilk-650/igt@meta_test@fail-result.html
    - {bat-jsl-1}:        NOTRUN -> [FAIL][70]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-1/igt@meta_test@fail-result.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][71]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bxt-dsi/igt@meta_test@fail-result.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][72]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-jsl-1/igt@meta_test@fail-result.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][73] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-blb-e6850/igt@meta_test@fail-result.html
    - {bat-adlp-6}:       NOTRUN -> [FAIL][74]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-6/igt@meta_test@fail-result.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][75]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6600u/igt@meta_test@fail-result.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][76]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ehl-2/igt@meta_test@fail-result.html
    - fi-apl-guc:         NOTRUN -> [FAIL][77]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-apl-guc/igt@meta_test@fail-result.html
    - bat-dg1-5:          NOTRUN -> [FAIL][78]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-5/igt@meta_test@fail-result.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][79]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-5557u/igt@meta_test@fail-result.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][80]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2520m/igt@meta_test@fail-result.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][81]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-glk-j4005/igt@meta_test@fail-result.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][82]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-guc/igt@meta_test@fail-result.html
    - fi-skl-guc:         NOTRUN -> [FAIL][83]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-guc/igt@meta_test@fail-result.html
    - {bat-dg2-11}:       NOTRUN -> [FAIL][84]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-11/igt@meta_test@fail-result.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][85]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-soraka/igt@meta_test@fail-result.html
    - bat-dg1-6:          NOTRUN -> [FAIL][86]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-6/igt@meta_test@fail-result.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][87]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-7567u/igt@meta_test@fail-result.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][88]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8700k/igt@meta_test@fail-result.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][89]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-dsi/igt@meta_test@fail-result.html
    - {fi-tgl-mst}:       NOTRUN -> [FAIL][90]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-mst/igt@meta_test@fail-result.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][91]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bsw-nick/igt@meta_test@fail-result.html
    - {bat-rplp-1}:       NOTRUN -> [FAIL][92]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rplp-1/igt@meta_test@fail-result.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][93]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-11600/igt@meta_test@fail-result.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][94]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-hsw-g3258/igt@meta_test@fail-result.html
    - {bat-adls-5}:       NOTRUN -> [FAIL][95]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adls-5/igt@meta_test@fail-result.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][96]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-gvtdvm/igt@meta_test@fail-result.html
    - fi-adl-ddr5:        NOTRUN -> [FAIL][97]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-adl-ddr5/igt@meta_test@fail-result.html
    - {bat-atsm-1}:       NOTRUN -> [FAIL][98]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-atsm-1/igt@meta_test@fail-result.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][99]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-guc/igt@meta_test@fail-result.html
    - {bat-jsl-3}:        NOTRUN -> [FAIL][100]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-3/igt@meta_test@fail-result.html
    - {bat-dg2-9}:        NOTRUN -> [FAIL][101]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-9/igt@meta_test@fail-result.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][102]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6700k2/igt@meta_test@fail-result.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][103]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8109u/igt@meta_test@fail-result.html
    - bat-adlp-4:         NOTRUN -> [FAIL][104]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-4/igt@meta_test@fail-result.html
    - {bat-adln-1}:       NOTRUN -> [FAIL][105]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adln-1/igt@meta_test@fail-result.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][106]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-8809g/igt@meta_test@fail-result.html
    - {bat-rpls-2}:       NOTRUN -> [FAIL][107]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rpls-2/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][108]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ivb-3770/igt@meta_test@fail-result.html
    - {bat-dg2-8}:        NOTRUN -> [FAIL][109]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-8/igt@meta_test@fail-result.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][110]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-guc/igt@meta_test@fail-result.html
    - fi-snb-2600:        NOTRUN -> [FAIL][111]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2600/igt@meta_test@fail-result.html
    - {bat-adlm-1}:       NOTRUN -> [FAIL][112]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlm-1/igt@meta_test@fail-result.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12226 and IGTPW_7927:

### New IGT tests (5) ###

  * igt@gem_basic@create-close@create-close-gpu-0:
    - Statuses : 45 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_basic@create-close@create-close-gpu-1:
    - Statuses : 45 incomplete(s)
    - Exec time: [0.0] s

  * igt@gem_exec_gttfill@basic@basic-gpu-0:
    - Statuses : 4 fail(s) 37 pass(s) 4 skip(s)
    - Exec time: [0.78, 25.87] s

  * igt@gem_exec_gttfill@basic@basic-gpu-1:
    - Statuses : 45 skip(s)
    - Exec time: [0.01, 1.17] s

  * igt@meta_test@fail-result:
    - Statuses : 46 fail(s)
    - Exec time: [0.01, 0.54] s

  

Known issues
------------

  Here are the changes found in IGTPW_7927 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][113] ([i915#2575]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-6/igt@gem_exec_gttfill@basic.html

  * {igt@gem_exec_gttfill@basic@basic-gpu-0} (NEW):
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][114] ([fdo#109271]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-gvtdvm/igt@gem_exec_gttfill@basic@basic-gpu-0.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][115] ([fdo#109271]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-soraka/igt@gem_exec_gttfill@basic@basic-gpu-0.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][116] ([fdo#109271]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bsw-nick/igt@gem_exec_gttfill@basic@basic-gpu-0.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][117] ([fdo#109271]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bxt-dsi/igt@gem_exec_gttfill@basic@basic-gpu-0.html

  * {igt@gem_exec_gttfill@basic@basic-gpu-1} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][118] ([fdo#109271])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-blb-e6850/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][119] ([fdo#109271])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6600u/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-apl-guc:         NOTRUN -> [SKIP][120] ([fdo#109271])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-apl-guc/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][121] ([fdo#109271])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-pnv-d510/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][122] ([fdo#109271])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-5557u/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][123] ([fdo#109271])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2520m/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][124] ([fdo#109271])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-glk-j4005/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-skl-guc:         NOTRUN -> [SKIP][125] ([fdo#109271])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-guc/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][126] ([fdo#109271])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6700k2/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][127] ([fdo#109271])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-7567u/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][128] ([fdo#109271])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8700k/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][129] ([fdo#109271])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-hsw-g3258/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][130] ([fdo#109271])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-guc/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][131] ([fdo#109271])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8109u/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][132] ([fdo#109271])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-8809g/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][133] ([fdo#109271])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ivb-3770/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][134] ([fdo#109271])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-elk-e7500/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][135] ([fdo#109271])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-guc/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-snb-2600:        NOTRUN -> [SKIP][136] ([fdo#109271])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2600/igt@gem_exec_gttfill@basic@basic-gpu-1.html
    - fi-ilk-650:         NOTRUN -> [SKIP][137] ([fdo#109271])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ilk-650/igt@gem_exec_gttfill@basic@basic-gpu-1.html

  * igt@i915_module_load@load:
    - bat-dg1-6:          NOTRUN -> [FAIL][138] ([i915#6766])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-6/igt@i915_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#6766]: https://gitlab.freedesktop.org/drm/intel/issues/6766
  [i915#7031]: https://gitlab.freedesktop.org/drm/intel/issues/7031


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7003 -> IGTPW_7927

  CI-20190529: 20190529
  CI_DRM_12226: bcc9e3eb1e7ba32651eae68b842df07db01e63be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7927: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/index.html
  IGT_7003: 1ea9ec5e7295fbc1cb784be4692971fd342bea53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/index.html

--===============2639355219460860767==
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
<tr><td><b>Series:</b></td><td>Add multi-process subtests for multi-GPUs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109487/">https://patchwork.freedesktop.org/series/109487/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12226 -&gt; IGTPW_7927</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7927 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7927, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/index.html</p>
<h2>Participating hosts (44 -&gt; 46)</h2>
<p>Additional (4): fi-kbl-soraka bat-atsm-1 bat-adls-5 bat-dg1-6 <br />
  Missing    (2): fi-ctg-p8600 fi-hsw-4200u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7927:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_basic@create-close@create-close-gpu-1} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-glk-j4005/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-guc/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-guc/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-11/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-soraka/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6700k2/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-7567u/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adln-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8700k/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-dsi/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{fi-tgl-mst}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-mst/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-elk-e7500/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bsw-nick/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rplp-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-11600/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-hsw-g3258/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-adl-ddr5/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-atsm-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-guc/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-3/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-9/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-5557u/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8109u/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-4/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-8809g/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rpls-2/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ivb-3770/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-8/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-guc/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2600/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlm-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ilk-650/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bxt-dsi/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-jsl-1/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-blb-e6850/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-6/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6600u/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ehl-2/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adls-5/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-apl-guc/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-5/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-gvtdvm/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-pnv-d510/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2520m/igt@gem_basic@create-close@create-close-gpu-1.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_gttfill@basic@basic-gpu-0} (NEW):</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-pnv-d510/igt@gem_exec_gttfill@basic@basic-gpu-0.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-elk-e7500/igt@gem_exec_gttfill@basic@basic-gpu-0.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_gttfill@basic@basic-gpu-1} (NEW):</p>
<ul>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-6/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ehl-2/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-5/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-guc/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-11/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-dsi/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-mst}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-mst/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rplp-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-11600/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adls-5/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-adl-ddr5/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-atsm-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-3/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-9/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-4/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adln-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rpls-2/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-8/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlm-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-jsl-1/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ilk-650/igt@meta_test@fail-result.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bxt-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-blb-e6850/igt@meta_test@fail-result.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-6/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6600u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ehl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-apl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-5557u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2520m/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-glk-j4005/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-11/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-soraka/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-6/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-7567u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8700k/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-mst}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-tgl-mst/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bsw-nick/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rplp-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-rkl-11600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-hsw-g3258/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adls-5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-gvtdvm/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-adl-ddr5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-atsm-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-jsl-3/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-9/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6700k2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8109u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlp-4/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adln-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-8809g/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-rpls-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg2-8/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-adlm-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12226 and IGTPW_7927:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@gem_basic@create-close@create-close-gpu-0:</p>
<ul>
<li>Statuses : 45 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_basic@create-close@create-close-gpu-1:</p>
<ul>
<li>Statuses : 45 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic@basic-gpu-0:</p>
<ul>
<li>Statuses : 4 fail(s) 37 pass(s) 4 skip(s)</li>
<li>Exec time: [0.78, 25.87] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic@basic-gpu-1:</p>
<ul>
<li>Statuses : 45 skip(s)</li>
<li>Exec time: [0.01, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result:</p>
<ul>
<li>Statuses : 46 fail(s)</li>
<li>Exec time: [0.01, 0.54] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7927 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-6/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_gttfill@basic@basic-gpu-0} (NEW):</p>
<ul>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-gvtdvm/igt@gem_exec_gttfill@basic@basic-gpu-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-soraka/igt@gem_exec_gttfill@basic@basic-gpu-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bsw-nick/igt@gem_exec_gttfill@basic@basic-gpu-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bxt-dsi/igt@gem_exec_gttfill@basic@basic-gpu-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_gttfill@basic@basic-gpu-1} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-blb-e6850/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6600u/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-apl-guc/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-pnv-d510/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-bdw-5557u/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2520m/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-glk-j4005/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-guc/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-skl-6700k2/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-7567u/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8700k/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-hsw-g3258/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-guc/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-cfl-8109u/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-8809g/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ivb-3770/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-elk-e7500/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-kbl-guc/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-snb-2600/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/fi-ilk-650/igt@gem_exec_gttfill@basic@basic-gpu-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/bat-dg1-6/igt@i915_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6766">i915#6766</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7003 -&gt; IGTPW_7927</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12226: bcc9e3eb1e7ba32651eae68b842df07db01e63be @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7927: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7927/index.html<br />
  IGT_7003: 1ea9ec5e7295fbc1cb784be4692971fd342bea53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2639355219460860767==--
