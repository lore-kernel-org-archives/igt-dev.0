Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4677218240094430095=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 18 Jan 2023 12:39:12 -0000
Message-ID: <167404555237.3606.17772982267762603669@emeril.freedesktop.org>
References: <20230118090640.10659-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230118090640.10659-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUnVuIGdl?=
 =?utf-8?q?m=5Fexercise=5Fblt_on_all_gens=2E?=
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

--===============4677218240094430095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Run gem_exercise_blt on all gens.
URL   : https://patchwork.freedesktop.org/series/113003/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12599 -> IGTPW_8360
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8360 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8360, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/index.html

Participating hosts (44 -> 42)
------------------------------

  Missing    (2): fi-bsw-kefka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8360:

### IGT changes ###

#### Possible regressions ####

  * igt@meta_test@fail-result (NEW):
    - fi-ilk-650:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ilk-650/igt@meta_test@fail-result.html
    - {bat-jsl-1}:        NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-jsl-1/igt@meta_test@fail-result.html
    - fi-ctg-p8600:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ctg-p8600/igt@meta_test@fail-result.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-jsl-1/igt@meta_test@fail-result.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-blb-e6850/igt@meta_test@fail-result.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-bsw-n3050/igt@meta_test@fail-result.html
    - {bat-rpls-1}:       NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-rpls-1/igt@meta_test@fail-result.html
    - {bat-adlp-6}:       NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-adlp-6/igt@meta_test@fail-result.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-skl-6600u/igt@meta_test@fail-result.html
    - fi-icl-u2:          NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-icl-u2/igt@meta_test@fail-result.html
    - fi-apl-guc:         NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-apl-guc/igt@meta_test@fail-result.html
    - bat-dg1-5:          NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg1-5/igt@meta_test@fail-result.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-pnv-d510/igt@meta_test@fail-result.html
    - {bat-dg1-7}:        NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg1-7/igt@meta_test@fail-result.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-glk-j4005/igt@meta_test@fail-result.html
    - {bat-adlp-9}:       NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-adlp-9/igt@meta_test@fail-result.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-rkl-guc/igt@meta_test@fail-result.html
    - fi-skl-guc:         NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-skl-guc/igt@meta_test@fail-result.html
    - {bat-dg2-11}:       NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg2-11/igt@meta_test@fail-result.html
    - bat-dg1-6:          NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg1-6/igt@meta_test@fail-result.html
    - {bat-dg2-oem1}:     NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg2-oem1/igt@meta_test@fail-result.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-kbl-7567u/igt@meta_test@fail-result.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-cfl-8700k/igt@meta_test@fail-result.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-bsw-nick/igt@meta_test@fail-result.html
    - {bat-kbl-2}:        NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-kbl-2/igt@meta_test@fail-result.html
    - {bat-rplp-1}:       NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-rplp-1/igt@meta_test@fail-result.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-rkl-11600/igt@meta_test@fail-result.html
    - {bat-adls-5}:       NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-adls-5/igt@meta_test@fail-result.html
    - fi-adl-ddr5:        NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-adl-ddr5/igt@meta_test@fail-result.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-cfl-guc/igt@meta_test@fail-result.html
    - {bat-jsl-3}:        NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-jsl-3/igt@meta_test@fail-result.html
    - {bat-dg2-9}:        NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg2-9/igt@meta_test@fail-result.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-skl-6700k2/igt@meta_test@fail-result.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-cfl-8109u/igt@meta_test@fail-result.html
    - {bat-adln-1}:       NOTRUN -> [FAIL][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-adln-1/igt@meta_test@fail-result.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-kbl-8809g/igt@meta_test@fail-result.html
    - {bat-rpls-2}:       NOTRUN -> [FAIL][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-rpls-2/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ivb-3770/igt@meta_test@fail-result.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-elk-e7500/igt@meta_test@fail-result.html
    - {bat-dg2-8}:        NOTRUN -> [FAIL][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg2-8/igt@meta_test@fail-result.html
    - fi-snb-2600:        NOTRUN -> [FAIL][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-snb-2600/igt@meta_test@fail-result.html
    - {bat-adlm-1}:       NOTRUN -> [FAIL][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-adlm-1/igt@meta_test@fail-result.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12599 and IGTPW_8360:

### New IGT tests (45) ###

  * igt@gem_exercise_blt@fast-copy:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@linear-lmem0-lmem0-emit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@linear-lmem0-smem-emit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@linear-smem-lmem0-emit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@linear-smem-smem-emit:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile4-lmem0-lmem0-emit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile4-lmem0-smem-emit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile4-smem-lmem0-emit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile4-smem-smem-emit:
    - Statuses : 18 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile64-lmem0-lmem0-emit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile64-lmem0-smem-emit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile64-smem-lmem0-emit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile64-smem-smem-emit:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@xmajor-lmem0-lmem0-emit:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@xmajor-lmem0-smem-emit:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@xmajor-smem-lmem0-emit:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@xmajor-smem-smem-emit:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@yfmajor-smem-smem-emit:
    - Statuses : 15 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@ymajor-lmem0-lmem0-emit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@ymajor-lmem0-smem-emit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@ymajor-smem-lmem0-emit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@ymajor-smem-smem-emit:
    - Statuses : 29 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@linear-lmem0-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@linear-lmem0-smem:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@linear-smem-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@linear-smem-smem:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile4-lmem0-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile4-lmem0-smem:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile4-smem-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile4-smem-smem:
    - Statuses : 18 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile64-lmem0-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile64-lmem0-smem:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile64-smem-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile64-smem-smem:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@xmajor-lmem0-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@xmajor-lmem0-smem:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@xmajor-smem-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@xmajor-smem-smem:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@yfmajor-smem-smem:
    - Statuses : 15 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@ymajor-lmem0-lmem0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@ymajor-lmem0-smem:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@ymajor-smem-lmem0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@ymajor-smem-smem:
    - Statuses : 29 pass(s)
    - Exec time: [0.0] s

  * igt@meta_test@fail-result:
    - Statuses : 42 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8360 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@gem_exercise_blt@fast-copy} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][43] ([fdo#109271]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-pnv-d510/igt@gem_exercise_blt@fast-copy.html

  * {igt@gem_exercise_blt@fast-copy-emit} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][44] ([fdo#109271]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-bsw-nick/igt@gem_exercise_blt@fast-copy-emit.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][45] ([fdo#109271]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ivb-3770/igt@gem_exercise_blt@fast-copy-emit.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][46] ([fdo#109271]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-elk-e7500/igt@gem_exercise_blt@fast-copy-emit.html
    - fi-snb-2600:        NOTRUN -> [SKIP][47] ([fdo#109271]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-snb-2600/igt@gem_exercise_blt@fast-copy-emit.html
    - fi-ilk-650:         NOTRUN -> [SKIP][48] ([fdo#109271]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ilk-650/igt@gem_exercise_blt@fast-copy-emit.html
    - fi-ctg-p8600:       NOTRUN -> [SKIP][49] ([fdo#109271]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ctg-p8600/igt@gem_exercise_blt@fast-copy-emit.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][50] ([fdo#109271]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-blb-e6850/igt@gem_exercise_blt@fast-copy-emit.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][51] ([fdo#109271]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-bsw-n3050/igt@gem_exercise_blt@fast-copy-emit.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7121 -> IGTPW_8360

  CI-20190529: 20190529
  CI_DRM_12599: 52aad5ad870672dc91502248cb7c76202d02dafc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8360: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/index.html
  IGT_7121: aa16e81259f59734230d441905b9d0f605e4a4b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_exercise_blt@fast-copy
+igt@gem_exercise_blt@fast-copy-emit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/index.html

--===============4677218240094430095==
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
<tr><td><b>Series:</b></td><td>Run gem_exercise_blt on all gens.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113003/">https://patchwork.freedesktop.org/series/113003/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12599 -&gt; IGTPW_8360</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8360 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8360, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Missing    (2): fi-bsw-kefka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8360:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ilk-650/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ctg-p8600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ctg-p8600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-jsl-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-blb-e6850/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-bsw-n3050/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-rpls-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-adlp-6/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-skl-6600u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-icl-u2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-apl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg1-5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-pnv-d510/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg1-7}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg1-7/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-glk-j4005/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-adlp-9/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-rkl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-skl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg2-11/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg1-6/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-oem1}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg2-oem1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-kbl-7567u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-cfl-8700k/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-bsw-nick/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-kbl-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-rplp-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-rkl-11600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-adls-5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-adl-ddr5/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-cfl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-jsl-3/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg2-9/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-skl-6700k2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-cfl-8109u/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-adln-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-kbl-8809g/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-rpls-2/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-elk-e7500/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-dg2-8/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-snb-2600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/bat-adlm-1/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12599 and IGTPW_8360:</p>
<h3>New IGT tests (45)</h3>
<ul>
<li>
<p>igt@gem_exercise_blt@fast-copy:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@linear-lmem0-lmem0-emit:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@linear-lmem0-smem-emit:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@linear-smem-lmem0-emit:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@linear-smem-smem-emit:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile4-lmem0-lmem0-emit:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile4-lmem0-smem-emit:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile4-smem-lmem0-emit:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile4-smem-smem-emit:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile64-lmem0-lmem0-emit:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile64-lmem0-smem-emit:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile64-smem-lmem0-emit:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile64-smem-smem-emit:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@xmajor-lmem0-lmem0-emit:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@xmajor-lmem0-smem-emit:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@xmajor-smem-lmem0-emit:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@xmajor-smem-smem-emit:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@yfmajor-smem-smem-emit:</p>
<ul>
<li>Statuses : 15 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@ymajor-lmem0-lmem0-emit:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@ymajor-lmem0-smem-emit:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@ymajor-smem-lmem0-emit:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@ymajor-smem-smem-emit:</p>
<ul>
<li>Statuses : 29 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@linear-lmem0-lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@linear-lmem0-smem:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@linear-smem-lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@linear-smem-smem:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile4-lmem0-lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile4-lmem0-smem:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile4-smem-lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile4-smem-smem:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile64-lmem0-lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile64-lmem0-smem:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile64-smem-lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile64-smem-smem:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@xmajor-lmem0-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@xmajor-lmem0-smem:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@xmajor-smem-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@xmajor-smem-smem:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@yfmajor-smem-smem:</p>
<ul>
<li>Statuses : 15 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@ymajor-lmem0-lmem0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@ymajor-lmem0-smem:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@ymajor-smem-lmem0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@ymajor-smem-smem:</p>
<ul>
<li>Statuses : 29 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result:</p>
<ul>
<li>Statuses : 42 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8360 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@gem_exercise_blt@fast-copy} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-pnv-d510/igt@gem_exercise_blt@fast-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exercise_blt@fast-copy-emit} (NEW):</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-bsw-nick/igt@gem_exercise_blt@fast-copy-emit.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ivb-3770/igt@gem_exercise_blt@fast-copy-emit.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-elk-e7500/igt@gem_exercise_blt@fast-copy-emit.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-snb-2600/igt@gem_exercise_blt@fast-copy-emit.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ilk-650/igt@gem_exercise_blt@fast-copy-emit.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ctg-p8600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-ctg-p8600/igt@gem_exercise_blt@fast-copy-emit.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-blb-e6850/igt@gem_exercise_blt@fast-copy-emit.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/fi-bsw-n3050/igt@gem_exercise_blt@fast-copy-emit.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7121 -&gt; IGTPW_8360</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12599: 52aad5ad870672dc91502248cb7c76202d02dafc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8360: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8360/index.html<br />
  IGT_7121: aa16e81259f59734230d441905b9d0f605e4a4b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_exercise_blt@fast-copy<br />
+igt@gem_exercise_blt@fast-copy-emit</p>

</body>
</html>

--===============4677218240094430095==--
