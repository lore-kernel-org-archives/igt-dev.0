Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6064264936864075393=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 31 Aug 2023 22:41:21 -0000
Message-ID: <169352168120.12506.14151420812933895024@emeril.freedesktop.org>
References: <20230831145622.1158622-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230831145622.1158622-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgTmV3IGRp?=
 =?utf-8?q?r_structure_for_intel_specific_tests_=28rev9=29?=
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

--===============6064264936864075393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New dir structure for intel specific tests (rev9)
URL   : https://patchwork.freedesktop.org/series/117227/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13583 -> IGTPW_9699
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9699 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9699, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/index.html

Participating hosts (38 -> 39)
------------------------------

  Additional (2): fi-kbl-soraka bat-rpls-2 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9699:

### IGT changes ###

#### Possible regressions ####

  * igt@debugfs_test@basic-hwmon:
    - bat-rpls-2:         NOTRUN -> [SKIP][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@debugfs_test@basic-hwmon.html
    - bat-dg1-5:          [PASS][2] -> [SKIP][3] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-dg1-5/igt@debugfs_test@basic-hwmon.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg1-5/igt@debugfs_test@basic-hwmon.html
    - bat-atsm-1:         [PASS][4] -> [SKIP][5] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-atsm-1/igt@debugfs_test@basic-hwmon.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-atsm-1/igt@debugfs_test@basic-hwmon.html
    - bat-dg2-9:          [PASS][6] -> [SKIP][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-dg2-9/igt@debugfs_test@basic-hwmon.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-9/igt@debugfs_test@basic-hwmon.html
    - bat-dg2-11:         [PASS][8] -> [SKIP][9] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-dg2-11/igt@debugfs_test@basic-hwmon.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-11/igt@debugfs_test@basic-hwmon.html

  * igt@debugfs_test@read_all_entries:
    - bat-adln-1:         [PASS][10] -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adln-1/igt@debugfs_test@read_all_entries.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adln-1/igt@debugfs_test@read_all_entries.html
    - bat-mtlp-8:         [PASS][12] -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-mtlp-8/igt@debugfs_test@read_all_entries.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-8/igt@debugfs_test@read_all_entries.html
    - bat-adlm-1:         [PASS][14] -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlm-1/igt@debugfs_test@read_all_entries.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlm-1/igt@debugfs_test@read_all_entries.html
    - bat-jsl-1:          [PASS][16] -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-jsl-1/igt@debugfs_test@read_all_entries.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-1/igt@debugfs_test@read_all_entries.html
    - fi-tgl-1115g4:      [PASS][18] -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html
    - bat-rpls-1:         [PASS][20] -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-rpls-1/igt@debugfs_test@read_all_entries.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-1/igt@debugfs_test@read_all_entries.html
    - bat-mtlp-6:         [PASS][22] -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-mtlp-6/igt@debugfs_test@read_all_entries.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-6/igt@debugfs_test@read_all_entries.html
    - bat-adlp-9:         [PASS][24] -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlp-9/igt@debugfs_test@read_all_entries.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-9/igt@debugfs_test@read_all_entries.html
    - bat-adlp-6:         [PASS][26] -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlp-6/igt@debugfs_test@read_all_entries.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-6/igt@debugfs_test@read_all_entries.html
    - bat-rplp-1:         [PASS][28] -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-rplp-1/igt@debugfs_test@read_all_entries.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@debugfs_test@read_all_entries.html
    - fi-rkl-11600:       [PASS][30] -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-rkl-11600/igt@debugfs_test@read_all_entries.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-rkl-11600/igt@debugfs_test@read_all_entries.html
    - bat-adls-5:         [PASS][32] -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adls-5/igt@debugfs_test@read_all_entries.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adls-5/igt@debugfs_test@read_all_entries.html
    - bat-jsl-3:          [PASS][34] -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-jsl-3/igt@debugfs_test@read_all_entries.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-3/igt@debugfs_test@read_all_entries.html

  * igt@i915_gem_lmem_swapping@basic (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][36] +4 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-1/igt@i915_gem_lmem_swapping@basic.html
    - bat-rpls-1:         NOTRUN -> [SKIP][37] +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-1/igt@i915_gem_lmem_swapping@basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][38] +5 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-rkl-11600/igt@i915_gem_lmem_swapping@basic.html
    - bat-adls-5:         NOTRUN -> [SKIP][39] +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adls-5/igt@i915_gem_lmem_swapping@basic.html

  * igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][40] +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlm-1/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][41] +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-tgl-1115g4/igt@i915_gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_gem_lmem_swapping@random-engines (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][42] +6 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-6/igt@i915_gem_lmem_swapping@random-engines.html

  * igt@i915_gem_lmem_swapping@verify-random (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][43] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-3/igt@i915_gem_lmem_swapping@verify-random.html
    - bat-adlp-9:         NOTRUN -> [SKIP][44] +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-9/igt@i915_gem_lmem_swapping@verify-random.html

  * igt@i915_gem_mmap@basic (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][45] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-11/igt@i915_gem_mmap@basic.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][46] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-14/igt@i915_gem_mmap@basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][47] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-9/igt@i915_gem_mmap@basic.html

  * igt@i915_gem_render_tiled_blits@basic (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][48] +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg1-5/igt@i915_gem_render_tiled_blits@basic.html
    - bat-atsm-1:         NOTRUN -> [SKIP][49] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-atsm-1/igt@i915_gem_render_tiled_blits@basic.html

  * igt@i915_gem_tiled_pread_basic (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][50] +6 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-8/igt@i915_gem_tiled_pread_basic.html
    - bat-adlp-6:         NOTRUN -> [SKIP][51]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-6/igt@i915_gem_tiled_pread_basic.html
    - bat-adln-1:         NOTRUN -> [SKIP][52]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adln-1/igt@i915_gem_tiled_pread_basic.html
    - bat-rplp-1:         NOTRUN -> [SKIP][53]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@i915_gem_tiled_pread_basic.html

  
#### Warnings ####

  * igt@debugfs_test@basic-hwmon:
    - bat-mtlp-8:         [SKIP][54] ([i915#7456]) -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-9:         [SKIP][56] ([i915#7456]) -> [SKIP][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-6:         [SKIP][58] ([i915#7456]) -> [SKIP][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
    - bat-rplp-1:         [SKIP][60] ([i915#7456]) -> [SKIP][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
    - fi-rkl-11600:       [SKIP][62] ([i915#7456]) -> [SKIP][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
    - bat-adls-5:         [SKIP][64] ([i915#7456]) -> [SKIP][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adls-5/igt@debugfs_test@basic-hwmon.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adls-5/igt@debugfs_test@basic-hwmon.html
    - bat-jsl-3:          [SKIP][66] ([i915#7456]) -> [SKIP][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-jsl-3/igt@debugfs_test@basic-hwmon.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-3/igt@debugfs_test@basic-hwmon.html
    - bat-adln-1:         [SKIP][68] ([i915#7456]) -> [SKIP][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adln-1/igt@debugfs_test@basic-hwmon.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adln-1/igt@debugfs_test@basic-hwmon.html
    - bat-adlm-1:         [SKIP][70] ([i915#7456]) -> [SKIP][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
    - bat-jsl-1:          [SKIP][72] ([i915#7456]) -> [SKIP][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - fi-tgl-1115g4:      [SKIP][74] ([i915#7456]) -> [SKIP][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html
    - bat-rpls-1:         [SKIP][76] ([i915#7456]) -> [SKIP][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-rpls-1/igt@debugfs_test@basic-hwmon.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-1/igt@debugfs_test@basic-hwmon.html
    - bat-mtlp-6:         [SKIP][78] ([i915#7456]) -> [SKIP][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@debugfs_test@basic-hwmon:
    - {bat-dg2-14}:       [PASS][80] -> [SKIP][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-dg2-14/igt@debugfs_test@basic-hwmon.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-14/igt@debugfs_test@basic-hwmon.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13583 and IGTPW_9699:

### New IGT tests (119) ###

  * igt@i915_gem_basic@bad-close:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@create-close:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@create-fd-close:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@busy@all-engines:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@basic-process:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@basic-threads:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_create@basic:
    - Statuses : 37 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_create@basic-files:
    - Statuses : 37 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_exec@basic:
    - Statuses : 37 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@bcs0-lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@bcs0-smem:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs0-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs0-smem:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs1-lmem0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs1-smem:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs2-lmem0:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs2-smem:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs3-lmem0:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs3-smem:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@rcs0-lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@rcs0-smem:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs0-lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs0-smem:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs1-lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs1-smem:
    - Statuses : 16 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs0-lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs0-smem:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs1-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs1-smem:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@basic@lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@basic@smem:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@bcs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs3:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@rcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vcs1:
    - Statuses : 16 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vecs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@bcs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs3:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@rcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vcs1:
    - Statuses : 16 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vecs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@bcs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs3:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@rcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vcs1:
    - Statuses : 16 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vecs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@bcs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs3:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@rcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vcs1:
    - Statuses : 16 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vecs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@basic:
    - Statuses : 36 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@basic:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@contexts:
    - Statuses : 37 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@fds:
    - Statuses : 35 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@userptr:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_store@basic:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s0:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_suspend@basic-s0@lmem0:
    - Statuses : 1 dmesg-warn(s) 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s0@smem:
    - Statuses : 3 dmesg-warn(s) 24 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_suspend@basic-s3@lmem0:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s3@smem:
    - Statuses : 3 dmesg-warn(s) 23 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@bad-flink:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@bad-open:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@basic:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@double-flink:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@flink-lifetime:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_huc_copy@huc-copy:
    - Statuses : 19 pass(s) 19 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_linear_blits@basic:
    - Statuses : 36 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@basic:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@basic@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@parallel-random-engines:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@parallel-random-engines@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@random-engines:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@random-engines@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@verify-random:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@verify-random@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_mmap@basic:
    - Statuses : 31 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_mmap_gtt@basic:
    - Statuses : 31 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_render_linear_blits@basic:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_render_tiled_blits@basic:
    - Statuses : 31 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ringfill@basic-all:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@allocator-basic:
    - Statuses : 33 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@allocator-basic-reserve:
    - Statuses : 33 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@safe-alignment:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_sync@basic-all:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_sync@basic-each:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_blits@basic:
    - Statuses : 29 pass(s) 9 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_fence_blits@basic:
    - Statuses : 31 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_pread_basic:
    - Statuses : 22 pass(s) 16 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_wait@busy@all-engines:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_wait@wait@all-engines:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-llseek-bad:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-llseek-size:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_fd_dup:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_one_bo:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_one_bo_two_files:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_two_bos:
    - Statuses : 33 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9699 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][82] ([fdo#109271]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-7567u/igt@debugfs_test@basic-hwmon.html

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [PASS][83] -> [SKIP][84] ([fdo#109271])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][85] ([fdo#109271]) +14 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html
    - fi-hsw-4770:        [PASS][86] -> [SKIP][87] ([fdo#109271])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-hsw-4770/igt@debugfs_test@read_all_entries.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-hsw-4770/igt@debugfs_test@read_all_entries.html
    - fi-cfl-8109u:       [PASS][88] -> [SKIP][89] ([fdo#109271])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html
    - fi-kbl-8809g:       [PASS][90] -> [SKIP][91] ([fdo#109271])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html
    - fi-ivb-3770:        [PASS][92] -> [SKIP][93] ([fdo#109271])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-ivb-3770/igt@debugfs_test@read_all_entries.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-ivb-3770/igt@debugfs_test@read_all_entries.html
    - fi-elk-e7500:       [PASS][94] -> [SKIP][95] ([fdo#109271])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-elk-e7500/igt@debugfs_test@read_all_entries.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-elk-e7500/igt@debugfs_test@read_all_entries.html
    - fi-kbl-guc:         [PASS][96] -> [SKIP][97] ([fdo#109271])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-kbl-guc/igt@debugfs_test@read_all_entries.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-guc/igt@debugfs_test@read_all_entries.html
    - fi-ilk-650:         [PASS][98] -> [SKIP][99] ([fdo#109271])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-ilk-650/igt@debugfs_test@read_all_entries.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-ilk-650/igt@debugfs_test@read_all_entries.html
    - fi-blb-e6850:       [PASS][100] -> [SKIP][101] ([fdo#109271])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-blb-e6850/igt@debugfs_test@read_all_entries.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-blb-e6850/igt@debugfs_test@read_all_entries.html
    - fi-bsw-n3050:       [PASS][102] -> [SKIP][103] ([fdo#109271])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-bsw-n3050/igt@debugfs_test@read_all_entries.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-bsw-n3050/igt@debugfs_test@read_all_entries.html
    - fi-cfl-guc:         [PASS][104] -> [SKIP][105] ([fdo#109271])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-cfl-guc/igt@debugfs_test@read_all_entries.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-guc/igt@debugfs_test@read_all_entries.html
    - fi-skl-6600u:       [PASS][106] -> [SKIP][107] ([fdo#109271])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-skl-6600u/igt@debugfs_test@read_all_entries.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-skl-6600u/igt@debugfs_test@read_all_entries.html
    - fi-apl-guc:         [PASS][108] -> [SKIP][109] ([fdo#109271])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-apl-guc/igt@debugfs_test@read_all_entries.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-apl-guc/igt@debugfs_test@read_all_entries.html
    - fi-glk-j4005:       [PASS][110] -> [SKIP][111] ([fdo#109271])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-glk-j4005/igt@debugfs_test@read_all_entries.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-glk-j4005/igt@debugfs_test@read_all_entries.html
    - fi-skl-guc:         [PASS][112] -> [SKIP][113] ([fdo#109271])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-skl-guc/igt@debugfs_test@read_all_entries.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-skl-guc/igt@debugfs_test@read_all_entries.html
    - fi-cfl-8700k:       [PASS][114] -> [SKIP][115] ([fdo#109271])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html
    - bat-kbl-2:          [PASS][116] -> [SKIP][117] ([fdo#109271])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-kbl-2/igt@debugfs_test@read_all_entries.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-kbl-2/igt@debugfs_test@read_all_entries.html

  * igt@fbdev@info:
    - bat-rpls-2:         NOTRUN -> [SKIP][118] ([i915#1849] / [i915#2582])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@fbdev@info.html

  * igt@fbdev@read:
    - bat-rpls-2:         NOTRUN -> [SKIP][119] ([i915#2582]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@fbdev@read.html

  * igt@i915_gem_exec_parallel@engines@fds (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][120] ([fdo#109271]) +7 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-elk-e7500/igt@i915_gem_exec_parallel@engines@fds.html
    - fi-ilk-650:         NOTRUN -> [SKIP][121] ([fdo#109271]) +7 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-ilk-650/igt@i915_gem_exec_parallel@engines@fds.html

  * igt@i915_gem_exec_suspend@basic-s0@lmem0 (NEW):
    - bat-atsm-1:         NOTRUN -> [DMESG-WARN][122] ([i915#8841]) +3 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-atsm-1/igt@i915_gem_exec_suspend@basic-s0@lmem0.html
    - bat-dg2-9:          NOTRUN -> [INCOMPLETE][123] ([i915#6311])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-9/igt@i915_gem_exec_suspend@basic-s0@lmem0.html

  * igt@i915_gem_exec_suspend@basic-s0@smem (NEW):
    - fi-ivb-3770:        NOTRUN -> [DMESG-WARN][124] ([i915#8841]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-ivb-3770/igt@i915_gem_exec_suspend@basic-s0@smem.html

  * igt@i915_gem_exec_suspend@basic-s3@smem (NEW):
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][125] ([i915#8841]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-hsw-4770/igt@i915_gem_exec_suspend@basic-s3@smem.html

  * igt@i915_gem_huc_copy@huc-copy (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][126] ([fdo#109271]) +6 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-hsw-4770/igt@i915_gem_huc_copy@huc-copy.html

  * igt@i915_gem_lmem_swapping@basic (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][127] ([fdo#109271]) +11 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-blb-e6850/igt@i915_gem_lmem_swapping@basic.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][128] ([fdo#109271]) +7 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-bsw-n3050/igt@i915_gem_lmem_swapping@basic.html
    - bat-kbl-2:          NOTRUN -> [SKIP][129] ([fdo#109271]) +4 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-kbl-2/igt@i915_gem_lmem_swapping@basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][130] ([fdo#109271]) +4 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-skl-6600u/igt@i915_gem_lmem_swapping@basic.html
    - fi-apl-guc:         NOTRUN -> [SKIP][131] ([fdo#109271]) +3 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-apl-guc/igt@i915_gem_lmem_swapping@basic.html

  * igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][132] ([fdo#109271]) +3 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-skl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][133] ([fdo#109271]) +4 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-x1275/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][134] ([fdo#109271]) +4 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-8109u/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][135] ([fdo#109271]) +4 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-8809g/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][136] ([fdo#109271]) +6 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-ivb-3770/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][137] ([fdo#109271]) +3 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_gem_lmem_swapping@random-engines (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][138] ([fdo#109271]) +3 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-guc/igt@i915_gem_lmem_swapping@random-engines.html

  * igt@i915_gem_lmem_swapping@verify-random (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][139] ([fdo#109271]) +4 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-glk-j4005/igt@i915_gem_lmem_swapping@verify-random.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][140] ([fdo#109271]) +4 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-8700k/igt@i915_gem_lmem_swapping@verify-random.html

  * igt@i915_gem_mmap_gtt@basic (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][141] ([i915#4077]) +2 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-8/igt@i915_gem_mmap_gtt@basic.html

  * igt@i915_gem_tiled_blits@basic (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][142] ([i915#4077]) +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg1-5/igt@i915_gem_tiled_blits@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][143] ([i915#4077]) +2 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-11/igt@i915_gem_tiled_blits@basic.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][144] ([i915#4077]) +2 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-14/igt@i915_gem_tiled_blits@basic.html
    - bat-atsm-1:         NOTRUN -> [SKIP][145] ([i915#4077]) +2 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-atsm-1/igt@i915_gem_tiled_blits@basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][146] ([i915#4077]) +2 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-6/igt@i915_gem_tiled_blits@basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][147] ([i915#4077]) +2 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-9/igt@i915_gem_tiled_blits@basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-rpls-2:         NOTRUN -> [SKIP][148] ([i915#7561])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_backlight@basic-brightness@edp-1:
    - bat-rplp-1:         NOTRUN -> [ABORT][149] ([i915#7077] / [i915#8668])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html

  * igt@i915_pm_rps@basic-api:
    - bat-rpls-2:         NOTRUN -> [SKIP][150] ([i915#6621])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][151] ([i915#4258] / [i915#7913])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][152] ([i915#1886] / [i915#7913])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-kbl-7567u:       NOTRUN -> [ABORT][153] ([i915#8913])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_busy@basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][154] ([i915#1845]) +16 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_busy@basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-rpls-2:         NOTRUN -> [SKIP][155] ([i915#3637]) +3 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-rpls-2:         NOTRUN -> [SKIP][156] ([fdo#109285])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][157] ([i915#1849])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rpls-2:         NOTRUN -> [SKIP][158] ([i915#1072]) +3 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         NOTRUN -> [SKIP][159] ([i915#3555])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-rpls-2:         NOTRUN -> [SKIP][160] ([i915#3555])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-rpls-2:         NOTRUN -> [SKIP][161] ([fdo#109295] / [i915#1845] / [i915#3708])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - bat-rpls-2:         NOTRUN -> [SKIP][162] ([fdo#109295] / [i915#3708]) +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][163] ([i915#7952]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-7567u:       [ABORT][165] ([i915#8913]) -> [SKIP][166] ([fdo#109271])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - fi-hsw-4770:        [DMESG-WARN][167] ([i915#8841]) -> [DMESG-WARN][168] ([i915#1982] / [i915#8841])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html

  * igt@kms_psr@primary_mmap_gtt:
    - bat-rplp-1:         [ABORT][169] ([i915#8469]) -> [SKIP][170] ([i915#1072])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8913]: https://gitlab.freedesktop.org/drm/intel/issues/8913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7460 -> IGTPW_9699

  CI-20190529: 20190529
  CI_DRM_13583: f299d7585a085ee36999da219c292e265da35886 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9699: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/index.html
  IGT_7460: 30b4034ea562952039ba6af58106791d5c39999e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 59610 lines
--- 59610 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/index.html

--===============6064264936864075393==
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
<tr><td><b>Series:</b></td><td>New dir structure for intel specific tests (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117227/">https://patchwork.freedesktop.org/series/117227/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13583 -&gt; IGTPW_9699</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9699 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9699, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/index.html</p>
<h2>Participating hosts (38 -&gt; 39)</h2>
<p>Additional (2): fi-kbl-soraka bat-rpls-2 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9699:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> +6 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-dg1-5/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg1-5/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-atsm-1/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-atsm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-dg2-9/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-9/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-dg2-11/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-11/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adln-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adln-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-mtlp-8/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-8/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlm-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlm-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-jsl-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-rpls-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-mtlp-6/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-6/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlp-9/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-9/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlp-6/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-6/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-rplp-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-rkl-11600/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-rkl-11600/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adls-5/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adls-5/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-jsl-3/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-3/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic (NEW):</p>
<ul>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-1/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-1/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-rkl-11600/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +5 similar issues</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adls-5/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):</p>
<ul>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlm-1/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-tgl-1115g4/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@random-engines (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-6/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@verify-random (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-3/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-9/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap@basic (NEW):</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-11/igt@i915_gem_mmap@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-14/igt@i915_gem_mmap@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-9/igt@i915_gem_mmap@basic.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_tiled_blits@basic (NEW):</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg1-5/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-atsm-1/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_pread_basic (NEW):</p>
<ul>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-8/igt@i915_gem_tiled_pread_basic.html">SKIP</a> +6 similar issues</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-6/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adln-1/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlp-9/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-9/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adls-5/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adls-5/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adln-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adln-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-rpls-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@debugfs_test@basic-hwmon:<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-dg2-14/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-14/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13583 and IGTPW_9699:</p>
<h3>New IGT tests (119)</h3>
<ul>
<li>
<p>igt@i915_gem_basic@bad-close:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@create-close:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@create-fd-close:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@all-engines:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@basic-process:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@basic-threads:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic:</p>
<ul>
<li>Statuses : 37 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic-files:</p>
<ul>
<li>Statuses : 37 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_exec@basic:</p>
<ul>
<li>Statuses : 37 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@bcs0-lmem0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@bcs0-smem:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs0-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs0-smem:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs1-lmem0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs1-smem:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs2-lmem0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs2-smem:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs3-lmem0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs3-smem:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@rcs0-lmem0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@rcs0-smem:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs0-lmem0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs0-smem:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs1-lmem0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs1-smem:</p>
<ul>
<li>Statuses : 16 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs0-lmem0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs0-smem:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs1-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs1-smem:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@basic@lmem0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@basic@smem:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vcs1:</p>
<ul>
<li>Statuses : 16 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vcs1:</p>
<ul>
<li>Statuses : 16 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@rcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vcs1:</p>
<ul>
<li>Statuses : 16 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vecs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@bcs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vcs1:</p>
<ul>
<li>Statuses : 16 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@basic:</p>
<ul>
<li>Statuses : 36 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@basic:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@contexts:</p>
<ul>
<li>Statuses : 37 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@fds:</p>
<ul>
<li>Statuses : 35 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@userptr:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_store@basic:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>Statuses : 3 dmesg-warn(s) 24 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s3:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>Statuses : 3 dmesg-warn(s) 23 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@bad-flink:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@bad-open:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@basic:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@double-flink:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@flink-lifetime:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_huc_copy@huc-copy:</p>
<ul>
<li>Statuses : 19 pass(s) 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_linear_blits@basic:</p>
<ul>
<li>Statuses : 36 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@parallel-random-engines@lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@random-engines:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@random-engines@lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@verify-random:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@verify-random@lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap@basic:</p>
<ul>
<li>Statuses : 31 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap_gtt@basic:</p>
<ul>
<li>Statuses : 31 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_linear_blits@basic:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_tiled_blits@basic:</p>
<ul>
<li>Statuses : 31 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ringfill@basic-all:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses : 33 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses : 33 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@safe-alignment:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_sync@basic-all:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_sync@basic-each:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_blits@basic:</p>
<ul>
<li>Statuses : 29 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_fence_blits@basic:</p>
<ul>
<li>Statuses : 31 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_pread_basic:</p>
<ul>
<li>Statuses : 22 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_wait@busy@all-engines:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_wait@wait@all-engines:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-llseek-bad:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-llseek-size:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_two_bos:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9699 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-7567u/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-hsw-4770/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-hsw-4770/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-ivb-3770/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-ivb-3770/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-elk-e7500/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-elk-e7500/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-kbl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-ilk-650/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-ilk-650/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-blb-e6850/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-blb-e6850/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-bsw-n3050/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-bsw-n3050/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-cfl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-skl-6600u/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-skl-6600u/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-apl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-apl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-glk-j4005/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-glk-j4005/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-skl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-skl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-kbl-2/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-kbl-2/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@fds (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-elk-e7500/igt@i915_gem_exec_parallel@engines@fds.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-ilk-650/igt@i915_gem_exec_parallel@engines@fds.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@lmem0 (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-atsm-1/igt@i915_gem_exec_suspend@basic-s0@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +3 similar issues</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-9/igt@i915_gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6311">i915#6311</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@smem (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-ivb-3770/igt@i915_gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s3@smem (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-hsw-4770/igt@i915_gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_gem_huc_copy@huc-copy (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-hsw-4770/igt@i915_gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-blb-e6850/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-bsw-n3050/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-kbl-2/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-skl-6600u/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-apl-guc/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-skl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-x1275/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-8109u/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-8809g/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-ivb-3770/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@random-engines (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-guc/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@verify-random (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-glk-j4005/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-cfl-8700k/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap_gtt@basic (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-8/igt@i915_gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_blits@basic (NEW):</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg1-5/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-11/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-14/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-atsm-1/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-mtlp-6/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-9/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-bad-modifier.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8913">i915#8913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rpls-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium_edid@hdmi-edid-read:<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8913">i915#8913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13583/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8469">i915#8469</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7460 -&gt; IGTPW_9699</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13583: f299d7585a085ee36999da219c292e265da35886 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9699: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/index.html<br />
  IGT_7460: 30b4034ea562952039ba6af58106791d5c39999e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 59610 lines<br />
--- 59610 lines</p>

</body>
</html>

--===============6064264936864075393==--
