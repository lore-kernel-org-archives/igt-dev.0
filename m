Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5287611086662549369=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Tue, 28 Feb 2023 14:48:05 -0000
Message-ID: <167759568529.15136.4255271201246269235@emeril.freedesktop.org>
References: <20230228142951.972328-1-jani.nikula@intel.com>
In-Reply-To: <20230228142951.972328-1-jani.nikula@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fpm=3A_make_igt=5Fpm=5Fdmc=5Floaded=28=29_more_robust?=
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

--===============5287611086662549369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_pm: make igt_pm_dmc_loaded() more robust
URL   : https://patchwork.freedesktop.org/series/114477/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12790 -> IGTPW_8540
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/index.html

Participating hosts (2 -> 37)
------------------------------

  Additional (36): fi-kbl-soraka fi-rkl-11600 bat-dg1-6 bat-dg1-5 fi-apl-guc bat-adlp-6 fi-pnv-d510 bat-rpls-1 fi-blb-e6850 bat-rpls-2 fi-skl-6600u fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-ilk-650 fi-hsw-4770 bat-adln-1 fi-ivb-3770 fi-elk-e7500 bat-jsl-3 bat-rplp-1 bat-dg2-11 fi-bsw-nick fi-kbl-7567u bat-dg1-7 bat-adlp-9 fi-skl-guc fi-cfl-8700k fi-glk-j4005 bat-jsl-1 fi-tgl-1115g4 fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8540 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-skl-guc:         NOTRUN -> [SKIP][1] ([fdo#109271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-skl-guc/igt@debugfs_test@basic-hwmon.html
    - bat-rpls-2:         NOTRUN -> [SKIP][2] ([i915#7456])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-2/igt@debugfs_test@basic-hwmon.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-soraka/igt@debugfs_test@basic-hwmon.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][4] ([fdo#109271])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-glk-j4005/igt@debugfs_test@basic-hwmon.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][5] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-hsw-4770/igt@debugfs_test@basic-hwmon.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][6] ([fdo#109271])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-8109u/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-9:         NOTRUN -> [SKIP][7] ([i915#7456])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][8] ([fdo#109271])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-7567u/igt@debugfs_test@basic-hwmon.html
    - bat-adln-1:         NOTRUN -> [SKIP][9] ([i915#7456])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adln-1/igt@debugfs_test@basic-hwmon.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][10] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-ivb-3770/igt@debugfs_test@basic-hwmon.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][11] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-elk-e7500/igt@debugfs_test@basic-hwmon.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][12] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-8700k/igt@debugfs_test@basic-hwmon.html
    - bat-adlm-1:         NOTRUN -> [SKIP][13] ([i915#7456])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
    - fi-ilk-650:         NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-ilk-650/igt@debugfs_test@basic-hwmon.html
    - bat-jsl-1:          NOTRUN -> [SKIP][15] ([i915#7456])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][16] ([i915#7456])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-6:         NOTRUN -> [SKIP][17] ([i915#7456])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
    - bat-rplp-1:         NOTRUN -> [SKIP][18] ([i915#7456])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][19] ([i915#7456])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-bsw-n3050/igt@debugfs_test@basic-hwmon.html
    - bat-rpls-1:         NOTRUN -> [SKIP][21] ([i915#7456])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-1/igt@debugfs_test@basic-hwmon.html
    - fi-apl-guc:         NOTRUN -> [SKIP][22] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-apl-guc/igt@debugfs_test@basic-hwmon.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][23] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-guc/igt@debugfs_test@basic-hwmon.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][24] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-skl-6600u/igt@debugfs_test@basic-hwmon.html
    - bat-jsl-3:          NOTRUN -> [SKIP][25] ([i915#7456])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-jsl-3/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@eof:
    - fi-kbl-guc:         NOTRUN -> [SKIP][26] ([fdo#109271]) +5 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-guc/igt@fbdev@eof.html
    - bat-adlm-1:         NOTRUN -> [SKIP][27] ([i915#2582]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlm-1/igt@fbdev@eof.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][28] ([fdo#109271]) +5 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-bsw-nick/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-dg1-7:          NOTRUN -> [SKIP][29] ([i915#2582]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg1-7/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - bat-rpls-1:         NOTRUN -> [SKIP][30] ([i915#2582]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-1/igt@fbdev@nullptr.html

  * igt@fbdev@read:
    - bat-rpls-2:         NOTRUN -> [SKIP][31] ([i915#2582]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-2/igt@fbdev@read.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][32] ([fdo#109271]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-x1275/igt@fbdev@read.html

  * igt@gem_ctx_create@basic:
    - fi-blb-e6850:       NOTRUN -> [SKIP][33] ([fdo#109271]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-blb-e6850/igt@gem_ctx_create@basic.html

  * igt@gem_ctx_create@basic-files:
    - fi-pnv-d510:        NOTRUN -> [SKIP][34] ([fdo#109271]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-pnv-d510/igt@gem_ctx_create@basic-files.html

  * igt@gem_exec_fence@basic-busy@ccs0:
    - bat-dg2-11:         NOTRUN -> [ABORT][35] ([i915#8233])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg2-11/igt@gem_exec_fence@basic-busy@ccs0.html

  * igt@gem_exec_fence@basic-busy@ccs3:
    - bat-dg2-9:          NOTRUN -> [ABORT][36] ([i915#8233])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg2-9/igt@gem_exec_fence@basic-busy@ccs3.html
    - bat-dg2-8:          NOTRUN -> [ABORT][37] ([i915#8233])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg2-8/igt@gem_exec_fence@basic-busy@ccs3.html

  * igt@gem_exec_fence@basic-busy@rcs0:
    - fi-blb-e6850:       NOTRUN -> [ABORT][38] ([i915#8233])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-blb-e6850/igt@gem_exec_fence@basic-busy@rcs0.html
    - fi-pnv-d510:        NOTRUN -> [ABORT][39] ([i915#8233])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-pnv-d510/igt@gem_exec_fence@basic-busy@rcs0.html

  * igt@gem_exec_fence@basic-busy@vcs0:
    - fi-ivb-3770:        NOTRUN -> [ABORT][40] ([i915#8233])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-ivb-3770/igt@gem_exec_fence@basic-busy@vcs0.html
    - fi-elk-e7500:       NOTRUN -> [ABORT][41] ([i915#8233])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-elk-e7500/igt@gem_exec_fence@basic-busy@vcs0.html
    - fi-ilk-650:         NOTRUN -> [ABORT][42] ([i915#8233])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-ilk-650/igt@gem_exec_fence@basic-busy@vcs0.html

  * igt@gem_exec_fence@basic-busy@vecs0:
    - bat-adlp-9:         NOTRUN -> [ABORT][43] ([i915#8233])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlp-9/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-skl-guc:         NOTRUN -> [ABORT][44] ([i915#8233])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-skl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-rpls-2:         NOTRUN -> [ABORT][45] ([i915#8233])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-2/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-kbl-soraka:      NOTRUN -> [ABORT][46] ([i915#8233])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-dg1-6:          NOTRUN -> [ABORT][47] ([i915#8233])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg1-6/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-cfl-8109u:       NOTRUN -> [ABORT][48] ([i915#8233])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-kbl-7567u:       NOTRUN -> [ABORT][49] ([i915#8233])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-adln-1:         NOTRUN -> [ABORT][50] ([i915#8233])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adln-1/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-jsl-1:          NOTRUN -> [ABORT][51] ([i915#8233])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-jsl-1/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-bsw-nick:        NOTRUN -> [ABORT][52] ([i915#8233])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-bsw-nick/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-kbl-guc:         NOTRUN -> [ABORT][53] ([i915#8233])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-cfl-8700k:       NOTRUN -> [ABORT][54] ([i915#8233])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-8700k/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-adlm-1:         NOTRUN -> [ABORT][55] ([i915#8233])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlm-1/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-rplp-1:         NOTRUN -> [ABORT][56] ([i915#8233])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rplp-1/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-rpls-1:         NOTRUN -> [ABORT][57] ([i915#8233])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-1/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-tgl-1115g4:      NOTRUN -> [ABORT][58] ([i915#8233])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-tgl-1115g4/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-adlp-6:         NOTRUN -> [ABORT][59] ([i915#8233])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlp-6/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-rkl-11600:       NOTRUN -> [ABORT][60] ([i915#8233])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-rkl-11600/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-skl-6600u:       NOTRUN -> [ABORT][61] ([i915#8233])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-skl-6600u/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-bsw-n3050:       NOTRUN -> [ABORT][62] ([i915#8233])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-bsw-n3050/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-apl-guc:         NOTRUN -> [ABORT][63] ([i915#8233])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-apl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-dg1-5:          NOTRUN -> [ABORT][64] ([i915#8233])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg1-5/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-cfl-guc:         NOTRUN -> [ABORT][65] ([i915#8233])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-dg1-7:          NOTRUN -> [ABORT][66] ([i915#8233])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg1-7/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-kbl-x1275:       NOTRUN -> [ABORT][67] ([i915#8233])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-jsl-3:          NOTRUN -> [ABORT][68] ([i915#8233])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-jsl-3/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-glk-j4005:       NOTRUN -> [ABORT][69] ([i915#8233])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-glk-j4005/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-hsw-4770:        NOTRUN -> [ABORT][70] ([i915#8233])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-hsw-4770/igt@gem_exec_fence@basic-busy@vecs0.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#8233]: https://gitlab.freedesktop.org/drm/intel/issues/8233


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7175 -> IGTPW_8540

  CI-20190529: 20190529
  CI_DRM_12790: 92b7ba2b502495a393b6db904061b6938a09db17 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8540: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/index.html
  IGT_7175: e825eb183729902489365e56bd99f15af2aa3316 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/index.html

--===============5287611086662549369==
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
<tr><td><b>Series:</b></td><td>lib/igt_pm: make igt_pm_dmc_loaded() more robust</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114477/">https://patchwork.freedesktop.org/series/114477/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12790 -&gt; IGTPW_8540</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/index.html</p>
<h2>Participating hosts (2 -&gt; 37)</h2>
<p>Additional (36): fi-kbl-soraka fi-rkl-11600 bat-dg1-6 bat-dg1-5 fi-apl-guc bat-adlp-6 fi-pnv-d510 bat-rpls-1 fi-blb-e6850 bat-rpls-2 fi-skl-6600u fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-ilk-650 fi-hsw-4770 bat-adln-1 fi-ivb-3770 fi-elk-e7500 bat-jsl-3 bat-rplp-1 bat-dg2-11 fi-bsw-nick fi-kbl-7567u bat-dg1-7 bat-adlp-9 fi-skl-guc fi-cfl-8700k fi-glk-j4005 bat-jsl-1 fi-tgl-1115g4 fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8540 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-skl-guc/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-soraka/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-glk-j4005/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-hsw-4770/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-8109u/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlp-9/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-7567u/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adln-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-ivb-3770/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-elk-e7500/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-8700k/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-ilk-650/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-bsw-n3050/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-apl-guc/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-guc/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-skl-6600u/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-guc/igt@fbdev@eof.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlm-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-bsw-nick/igt@fbdev@eof.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg1-7/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-1/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-x1275/igt@fbdev@read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@basic:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-blb-e6850/igt@gem_ctx_create@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@basic-files:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-pnv-d510/igt@gem_ctx_create@basic-files.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@ccs0:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg2-11/igt@gem_exec_fence@basic-busy@ccs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@ccs3:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg2-9/igt@gem_exec_fence@basic-busy@ccs3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg2-8/igt@gem_exec_fence@basic-busy@ccs3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-blb-e6850/igt@gem_exec_fence@basic-busy@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-pnv-d510/igt@gem_exec_fence@basic-busy@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vcs0:</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-ivb-3770/igt@gem_exec_fence@basic-busy@vcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-elk-e7500/igt@gem_exec_fence@basic-busy@vcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-ilk-650/igt@gem_exec_fence@basic-busy@vcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlp-9/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-skl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-2/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg1-6/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adln-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-jsl-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-bsw-nick/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-8700k/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlm-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rplp-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-rpls-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-tgl-1115g4/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-adlp-6/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-rkl-11600/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-skl-6600u/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-bsw-n3050/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-apl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg1-5/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-cfl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-dg1-7/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/bat-jsl-3/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-glk-j4005/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/fi-hsw-4770/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7175 -&gt; IGTPW_8540</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12790: 92b7ba2b502495a393b6db904061b6938a09db17 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8540: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8540/index.html<br />
  IGT_7175: e825eb183729902489365e56bd99f15af2aa3316 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5287611086662549369==--
