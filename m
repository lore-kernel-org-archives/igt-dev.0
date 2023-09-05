Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3823885250648645705=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 05 Sep 2023 17:45:44 -0000
Message-ID: <169393594460.19170.16269049176447836693@emeril.freedesktop.org>
References: <20230905132316.1666056-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230905132316.1666056-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUmVuYW1l?=
 =?utf-8?q?_all_intel_specific_tests?=
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

--===============3823885250648645705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Rename all intel specific tests
URL   : https://patchwork.freedesktop.org/series/123278/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13599 -> IGTPW_9721
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9721 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9721, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/index.html

Participating hosts (38 -> 37)
------------------------------

  Additional (2): fi-kbl-soraka bat-dg2-8 
  Missing    (3): fi-hsw-4770 bat-dg2-9 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9721:

### IGT changes ###

#### Possible regressions ####

  * igt@debugfs_test@basic-hwmon:
    - bat-dg1-5:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg1-5/igt@debugfs_test@basic-hwmon.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg1-5/igt@debugfs_test@basic-hwmon.html
    - bat-atsm-1:         [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-atsm-1/igt@debugfs_test@basic-hwmon.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-atsm-1/igt@debugfs_test@basic-hwmon.html
    - bat-dg2-11:         [PASS][5] -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-11/igt@debugfs_test@basic-hwmon.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-11/igt@debugfs_test@basic-hwmon.html

  * igt@debugfs_test@read_all_entries:
    - bat-adlp-11:        [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@debugfs_test@read_all_entries.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@debugfs_test@read_all_entries.html
    - bat-adln-1:         [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adln-1/igt@debugfs_test@read_all_entries.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adln-1/igt@debugfs_test@read_all_entries.html
    - bat-mtlp-8:         [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-mtlp-8/igt@debugfs_test@read_all_entries.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-mtlp-8/igt@debugfs_test@read_all_entries.html
    - bat-dg2-8:          NOTRUN -> [SKIP][13] +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@debugfs_test@read_all_entries.html
    - bat-adlm-1:         [PASS][14] -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlm-1/igt@debugfs_test@read_all_entries.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlm-1/igt@debugfs_test@read_all_entries.html
    - bat-jsl-1:          [PASS][16] -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-jsl-1/igt@debugfs_test@read_all_entries.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-1/igt@debugfs_test@read_all_entries.html
    - fi-tgl-1115g4:      [PASS][18] -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html
    - bat-rpls-1:         [PASS][20] -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-rpls-1/igt@debugfs_test@read_all_entries.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rpls-1/igt@debugfs_test@read_all_entries.html
    - bat-adlp-9:         [PASS][22] -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-9/igt@debugfs_test@read_all_entries.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-9/igt@debugfs_test@read_all_entries.html
    - bat-adlp-6:         [PASS][24] -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-6/igt@debugfs_test@read_all_entries.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-6/igt@debugfs_test@read_all_entries.html
    - bat-rplp-1:         [PASS][26] -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-rplp-1/igt@debugfs_test@read_all_entries.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rplp-1/igt@debugfs_test@read_all_entries.html
    - fi-rkl-11600:       [PASS][28] -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-rkl-11600/igt@debugfs_test@read_all_entries.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-rkl-11600/igt@debugfs_test@read_all_entries.html
    - bat-adls-5:         [PASS][30] -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adls-5/igt@debugfs_test@read_all_entries.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adls-5/igt@debugfs_test@read_all_entries.html
    - bat-jsl-3:          [PASS][32] -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-jsl-3/igt@debugfs_test@read_all_entries.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-3/igt@debugfs_test@read_all_entries.html

  * igt@i915_gem_lmem_swapping@basic (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][34] +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-1/igt@i915_gem_lmem_swapping@basic.html
    - bat-rpls-1:         NOTRUN -> [SKIP][35] +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rpls-1/igt@i915_gem_lmem_swapping@basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][36] +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-rkl-11600/igt@i915_gem_lmem_swapping@basic.html
    - bat-adls-5:         NOTRUN -> [SKIP][37] +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adls-5/igt@i915_gem_lmem_swapping@basic.html

  * igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][38] +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlm-1/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][39] +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-tgl-1115g4/igt@i915_gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_gem_lmem_swapping@verify-random (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][40] +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-3/igt@i915_gem_lmem_swapping@verify-random.html
    - bat-adlp-9:         NOTRUN -> [SKIP][41] +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-9/igt@i915_gem_lmem_swapping@verify-random.html

  * igt@i915_gem_mmap@basic (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][42] +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-11/igt@i915_gem_mmap@basic.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][43] +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-14/igt@i915_gem_mmap@basic.html

  * igt@i915_gem_render_tiled_blits@basic (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][44] +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg1-5/igt@i915_gem_render_tiled_blits@basic.html
    - bat-atsm-1:         NOTRUN -> [SKIP][45] +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-atsm-1/igt@i915_gem_render_tiled_blits@basic.html

  * igt@i915_gem_tiled_pread_basic (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-6/igt@i915_gem_tiled_pread_basic.html
    - bat-adln-1:         NOTRUN -> [SKIP][47]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adln-1/igt@i915_gem_tiled_pread_basic.html
    - bat-rplp-1:         NOTRUN -> [SKIP][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rplp-1/igt@i915_gem_tiled_pread_basic.html
    - bat-adlp-11:        NOTRUN -> [SKIP][49]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@i915_gem_tiled_pread_basic.html

  
#### Warnings ####

  * igt@debugfs_test@basic-hwmon:
    - bat-mtlp-8:         [SKIP][50] ([i915#7456]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-9:         [SKIP][52] ([i915#7456]) -> [SKIP][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-6:         [SKIP][54] ([i915#7456]) -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
    - bat-rplp-1:         [SKIP][56] ([i915#7456]) -> [SKIP][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
    - fi-rkl-11600:       [SKIP][58] ([i915#7456]) -> [SKIP][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
    - bat-adls-5:         [SKIP][60] ([i915#7456]) -> [SKIP][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adls-5/igt@debugfs_test@basic-hwmon.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adls-5/igt@debugfs_test@basic-hwmon.html
    - bat-jsl-3:          [SKIP][62] ([i915#7456]) -> [SKIP][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-jsl-3/igt@debugfs_test@basic-hwmon.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-3/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-11:        [SKIP][64] ([i915#7456]) -> [SKIP][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@debugfs_test@basic-hwmon.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@debugfs_test@basic-hwmon.html
    - bat-adln-1:         [SKIP][66] ([i915#7456]) -> [SKIP][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adln-1/igt@debugfs_test@basic-hwmon.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adln-1/igt@debugfs_test@basic-hwmon.html
    - bat-adlm-1:         [SKIP][68] ([i915#7456]) -> [SKIP][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
    - bat-jsl-1:          [SKIP][70] ([i915#7456]) -> [SKIP][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - fi-tgl-1115g4:      [SKIP][72] ([i915#7456]) -> [SKIP][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html
    - bat-rpls-1:         [SKIP][74] ([i915#7456]) -> [SKIP][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-rpls-1/igt@debugfs_test@basic-hwmon.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rpls-1/igt@debugfs_test@basic-hwmon.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@debugfs_test@basic-hwmon:
    - {bat-dg2-14}:       [PASS][76] -> [SKIP][77] +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-14/igt@debugfs_test@basic-hwmon.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-14/igt@debugfs_test@basic-hwmon.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13599 and IGTPW_9721:

### New IGT tests (126) ###

  * igt@i915_gem_basic@bad-close:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@create-close:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@create-fd-close:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@busy@all-engines:
    - Statuses : 1 abort(s) 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@basic-process:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@basic-threads:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_create@basic:
    - Statuses : 34 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_create@basic-files:
    - Statuses : 34 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_exec@basic:
    - Statuses : 34 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_basic@basic@bcs0-lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@bcs0-smem:
    - Statuses : 32 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs0-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs0-smem:
    - Statuses : 4 pass(s)
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
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs0-lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs0-smem:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs1-lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs1-smem:
    - Statuses : 14 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs0-lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs0-smem:
    - Statuses : 31 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs1-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs1-smem:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_create@basic@lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@basic@smem:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_fence@basic-await@bcs0:
    - Statuses : 32 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs0:
    - Statuses : 4 pass(s)
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
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vcs1:
    - Statuses : 14 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vecs0:
    - Statuses : 31 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_fence@basic-busy@bcs0:
    - Statuses : 32 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs0:
    - Statuses : 4 pass(s)
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
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vcs1:
    - Statuses : 14 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vecs0:
    - Statuses : 31 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_fence@basic-wait@bcs0:
    - Statuses : 32 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs0:
    - Statuses : 4 pass(s)
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
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vcs1:
    - Statuses : 14 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vecs0:
    - Statuses : 31 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_fence@nb-await@bcs0:
    - Statuses : 32 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs0:
    - Statuses : 4 pass(s)
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
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vcs1:
    - Statuses : 14 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vecs0:
    - Statuses : 31 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@basic:
    - Statuses : 33 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_parallel@engines@basic:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@contexts:
    - Statuses : 34 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@fds:
    - Statuses : 32 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@userptr:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_store@basic:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s0:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_suspend@basic-s0@lmem0:
    - Statuses : 1 dmesg-warn(s) 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s0@smem:
    - Statuses : 2 dmesg-warn(s) 20 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_suspend@basic-s3@lmem0:
    - Statuses : 1 dmesg-warn(s) 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s3@smem:
    - Statuses : 2 dmesg-warn(s) 20 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@bad-flink:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@bad-open:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@basic:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@double-flink:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@flink-lifetime:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_huc_copy@huc-copy:
    - Statuses : 17 pass(s) 18 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_linear_blits@basic:
    - Statuses : 33 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@basic:
    - Statuses : 25 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@basic@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@parallel-random-engines:
    - Statuses : 25 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@parallel-random-engines@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@random-engines:
    - Statuses : 25 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@random-engines@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@verify-random:
    - Statuses : 25 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@verify-random@lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_mmap@basic:
    - Statuses : 30 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_mmap_gtt@basic:
    - Statuses : 30 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_render_linear_blits@basic:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_render_tiled_blits@basic:
    - Statuses : 30 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ringfill@basic-all:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@allocator-basic:
    - Statuses : 31 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@allocator-basic-reserve:
    - Statuses : 31 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@safe-alignment:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_sync@basic-all:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_sync@basic-each:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_blits@basic:
    - Statuses : 28 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_fence_blits@basic:
    - Statuses : 30 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_pread_basic:
    - Statuses : 21 pass(s) 14 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_wait@busy@all-engines:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_wait@wait@all-engines:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-llseek-bad:
    - Statuses : 29 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-llseek-size:
    - Statuses : 29 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_fd_dup:
    - Statuses : 29 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_one_bo:
    - Statuses : 29 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_one_bo_two_files:
    - Statuses : 29 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_two_bos:
    - Statuses : 29 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9721 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][78] ([fdo#109271]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-7567u/igt@debugfs_test@basic-hwmon.html

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [PASS][79] -> [SKIP][80] ([fdo#109271])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][81] ([fdo#109271]) +14 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html
    - fi-cfl-8109u:       [PASS][82] -> [SKIP][83] ([fdo#109271])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html
    - fi-kbl-8809g:       [PASS][84] -> [SKIP][85] ([fdo#109271])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html
    - fi-ivb-3770:        [PASS][86] -> [SKIP][87] ([fdo#109271])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-ivb-3770/igt@debugfs_test@read_all_entries.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-ivb-3770/igt@debugfs_test@read_all_entries.html
    - fi-elk-e7500:       [PASS][88] -> [SKIP][89] ([fdo#109271])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-elk-e7500/igt@debugfs_test@read_all_entries.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-elk-e7500/igt@debugfs_test@read_all_entries.html
    - fi-kbl-guc:         [PASS][90] -> [SKIP][91] ([fdo#109271])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-kbl-guc/igt@debugfs_test@read_all_entries.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-guc/igt@debugfs_test@read_all_entries.html
    - fi-ilk-650:         [PASS][92] -> [SKIP][93] ([fdo#109271])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-ilk-650/igt@debugfs_test@read_all_entries.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-ilk-650/igt@debugfs_test@read_all_entries.html
    - fi-blb-e6850:       [PASS][94] -> [SKIP][95] ([fdo#109271])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-blb-e6850/igt@debugfs_test@read_all_entries.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-blb-e6850/igt@debugfs_test@read_all_entries.html
    - fi-cfl-guc:         [PASS][96] -> [SKIP][97] ([fdo#109271])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-cfl-guc/igt@debugfs_test@read_all_entries.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-guc/igt@debugfs_test@read_all_entries.html
    - fi-skl-6600u:       [PASS][98] -> [SKIP][99] ([fdo#109271])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-skl-6600u/igt@debugfs_test@read_all_entries.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-skl-6600u/igt@debugfs_test@read_all_entries.html
    - fi-apl-guc:         [PASS][100] -> [SKIP][101] ([fdo#109271])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-apl-guc/igt@debugfs_test@read_all_entries.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-apl-guc/igt@debugfs_test@read_all_entries.html
    - fi-glk-j4005:       [PASS][102] -> [SKIP][103] ([fdo#109271])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-glk-j4005/igt@debugfs_test@read_all_entries.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-glk-j4005/igt@debugfs_test@read_all_entries.html
    - fi-skl-guc:         [PASS][104] -> [SKIP][105] ([fdo#109271])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-skl-guc/igt@debugfs_test@read_all_entries.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-skl-guc/igt@debugfs_test@read_all_entries.html
    - fi-cfl-8700k:       [PASS][106] -> [SKIP][107] ([fdo#109271])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html
    - fi-bsw-nick:        [PASS][108] -> [SKIP][109] ([fdo#109271])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-bsw-nick/igt@debugfs_test@read_all_entries.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-bsw-nick/igt@debugfs_test@read_all_entries.html
    - bat-kbl-2:          [PASS][110] -> [SKIP][111] ([fdo#109271])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-kbl-2/igt@debugfs_test@read_all_entries.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-kbl-2/igt@debugfs_test@read_all_entries.html

  * igt@fbdev@info:
    - bat-adlp-11:        [PASS][112] -> [SKIP][113] ([i915#1849] / [i915#2582])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@fbdev@info.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - bat-adlp-11:        [PASS][114] -> [SKIP][115] ([i915#2582]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@fbdev@nullptr.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@fbdev@nullptr.html

  * igt@i915_gem_busy@busy@all-engines (NEW):
    - bat-mtlp-8:         NOTRUN -> [ABORT][116] ([i915#9262])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-mtlp-8/igt@i915_gem_busy@busy@all-engines.html

  * igt@i915_gem_exec_parallel@engines@fds (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][117] ([fdo#109271]) +7 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-elk-e7500/igt@i915_gem_exec_parallel@engines@fds.html
    - fi-ilk-650:         NOTRUN -> [SKIP][118] ([fdo#109271]) +7 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-ilk-650/igt@i915_gem_exec_parallel@engines@fds.html

  * igt@i915_gem_exec_suspend@basic-s0@lmem0 (NEW):
    - bat-atsm-1:         NOTRUN -> [DMESG-WARN][119] ([i915#8841]) +3 other tests dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-atsm-1/igt@i915_gem_exec_suspend@basic-s0@lmem0.html

  * igt@i915_gem_exec_suspend@basic-s0@smem (NEW):
    - fi-ivb-3770:        NOTRUN -> [DMESG-WARN][120] ([i915#8841]) +1 other test dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-ivb-3770/igt@i915_gem_exec_suspend@basic-s0@smem.html

  * igt@i915_gem_lmem_swapping@basic (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][121] ([fdo#109271]) +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-blb-e6850/igt@i915_gem_lmem_swapping@basic.html
    - bat-kbl-2:          NOTRUN -> [SKIP][122] ([fdo#109271]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-kbl-2/igt@i915_gem_lmem_swapping@basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][123] ([fdo#109271]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-skl-6600u/igt@i915_gem_lmem_swapping@basic.html
    - fi-apl-guc:         NOTRUN -> [SKIP][124] ([fdo#109271]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-apl-guc/igt@i915_gem_lmem_swapping@basic.html

  * igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][125] ([fdo#109271]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-skl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][126] ([fdo#109271]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-x1275/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][127] ([fdo#109271]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-8109u/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][128] ([fdo#109271]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-8809g/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][129] ([fdo#109271]) +6 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-ivb-3770/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][130] ([fdo#109271]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-bsw-nick/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][131] ([fdo#109271]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_gem_lmem_swapping@random-engines (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][132] ([fdo#109271]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-guc/igt@i915_gem_lmem_swapping@random-engines.html

  * igt@i915_gem_lmem_swapping@verify-random (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][133] ([fdo#109271]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-glk-j4005/igt@i915_gem_lmem_swapping@verify-random.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][134] ([fdo#109271]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-8700k/igt@i915_gem_lmem_swapping@verify-random.html

  * igt@i915_gem_mmap_gtt@basic (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][135] ([i915#4077]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@i915_gem_mmap_gtt@basic.html

  * igt@i915_gem_tiled_blits@basic (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][136] ([i915#4077]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg1-5/igt@i915_gem_tiled_blits@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][137] ([i915#4077]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-11/igt@i915_gem_tiled_blits@basic.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][138] ([i915#4077]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-14/igt@i915_gem_tiled_blits@basic.html
    - bat-atsm-1:         NOTRUN -> [SKIP][139] ([i915#4077]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-atsm-1/igt@i915_gem_tiled_blits@basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-dg2-8:          NOTRUN -> [SKIP][140] ([i915#5354] / [i915#7561])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@module-reload:
    - fi-apl-guc:         [PASS][141] -> [DMESG-FAIL][142] ([i915#8585])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-apl-guc/igt@i915_pm_rpm@module-reload.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-apl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-8:          NOTRUN -> [SKIP][143] ([i915#6621])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][144] ([i915#1886] / [i915#7913])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-dg2-8:          NOTRUN -> [SKIP][145] ([i915#6645])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-kbl-7567u:       NOTRUN -> [ABORT][146] ([i915#8913])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][147] ([i915#5190])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][148] ([i915#4215] / [i915#5190])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-8:          NOTRUN -> [SKIP][149] ([i915#4212]) +7 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][150] ([i915#4103] / [i915#4213]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-8:          NOTRUN -> [SKIP][151] ([fdo#109285])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-8:          NOTRUN -> [SKIP][152] ([i915#5274])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][153] ([i915#3546]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_psr@cursor_plane_move:
    - bat-dg2-8:          NOTRUN -> [SKIP][154] ([i915#1072]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rplp-1:         NOTRUN -> [ABORT][155] ([i915#8442] / [i915#8668] / [i915#8712])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-8:          NOTRUN -> [SKIP][156] ([i915#3555])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-8:          NOTRUN -> [SKIP][157] ([i915#3708])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-8:          NOTRUN -> [SKIP][158] ([i915#3708] / [i915#4077]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-8:          NOTRUN -> [SKIP][159] ([i915#3291] / [i915#3708]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][160] ([i915#7952]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - {bat-dg2-13}:       [DMESG-WARN][162] ([Intel XE#485]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:
    - bat-adlp-11:        [FAIL][164] ([i915#6121]) -> [PASS][165] +4 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5:
    - bat-adlp-11:        [DMESG-WARN][166] ([i915#6868]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-7567u:       [ABORT][168] ([i915#8913]) -> [SKIP][169] ([fdo#109271])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html

  * igt@kms_psr@cursor_plane_move:
    - bat-rplp-1:         [ABORT][170] ([i915#9243]) -> [SKIP][171] ([i915#1072])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rplp-1/igt@kms_psr@cursor_plane_move.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8712]: https://gitlab.freedesktop.org/drm/intel/issues/8712
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8913]: https://gitlab.freedesktop.org/drm/intel/issues/8913
  [i915#9243]: https://gitlab.freedesktop.org/drm/intel/issues/9243
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7468 -> IGTPW_9721

  CI-20190529: 20190529
  CI_DRM_13599: 58fe10f34e80d0eeb5609128faa135260623a715 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9721: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/index.html
  IGT_7468: 7468


Testlist changes
----------------

+++ 59647 lines
--- 59647 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/index.html

--===============3823885250648645705==
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
<tr><td><b>Series:</b></td><td>Rename all intel specific tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123278/">https://patchwork.freedesktop.org/series/123278/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13599 -&gt; IGTPW_9721</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9721 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9721, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Additional (2): fi-kbl-soraka bat-dg2-8 <br />
  Missing    (3): fi-hsw-4770 bat-dg2-9 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9721:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg1-5/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg1-5/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-atsm-1/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-atsm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-11/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-11/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>
<p>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adln-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adln-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-mtlp-8/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-mtlp-8/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@debugfs_test@read_all_entries.html">SKIP</a> +4 other tests skip</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlm-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlm-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-jsl-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-rpls-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rpls-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-9/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-9/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-6/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-6/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-rplp-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rplp-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-rkl-11600/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-rkl-11600/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adls-5/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adls-5/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-jsl-3/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-3/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic (NEW):</p>
<ul>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-1/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rpls-1/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 other tests skip</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-rkl-11600/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +5 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adls-5/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):</p>
<ul>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlm-1/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-tgl-1115g4/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@verify-random (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-3/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> +4 other tests skip</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-9/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> +4 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap@basic (NEW):</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-11/igt@i915_gem_mmap@basic.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-14/igt@i915_gem_mmap@basic.html">SKIP</a> +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_tiled_blits@basic (NEW):</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg1-5/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-atsm-1/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_pread_basic (NEW):</p>
<ul>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-6/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adln-1/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rplp-1/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
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
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-9/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-9/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adls-5/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adls-5/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adln-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adln-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-rpls-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rpls-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@debugfs_test@basic-hwmon:<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-14/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-14/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13599 and IGTPW_9721:</p>
<h3>New IGT tests (126)</h3>
<ul>
<li>
<p>igt@i915_gem_basic@bad-close:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@create-close:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@create-fd-close:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@all-engines:</p>
<ul>
<li>Statuses : 1 abort(s) 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@basic-process:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@basic-threads:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic:</p>
<ul>
<li>Statuses : 34 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic-files:</p>
<ul>
<li>Statuses : 34 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_exec@basic:</p>
<ul>
<li>Statuses : 34 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<li>Statuses : 32 pass(s)</li>
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
<li>Statuses : 4 pass(s)</li>
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
<li>Statuses : 35 pass(s)</li>
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
<li>Statuses : 34 pass(s)</li>
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
<li>Statuses : 14 pass(s)</li>
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
<li>Statuses : 31 pass(s)</li>
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
<p>igt@i915_gem_exec_create@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>Statuses : 32 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
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
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vcs1:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
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
<p>igt@i915_gem_exec_fence@basic-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>Statuses : 32 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
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
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vcs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vcs1:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
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
<p>igt@i915_gem_exec_fence@basic-wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>Statuses : 32 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
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
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vcs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vcs1:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vecs0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
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
<p>igt@i915_gem_exec_fence@nb-await:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@bcs0:</p>
<ul>
<li>Statuses : 32 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
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
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vcs1:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
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
<li>Statuses : 33 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@basic:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@contexts:</p>
<ul>
<li>Statuses : 34 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@fds:</p>
<ul>
<li>Statuses : 32 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@userptr:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_store@basic:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
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
<li>Statuses : 1 dmesg-warn(s) 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 20 pass(s)</li>
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
<li>Statuses : 1 dmesg-warn(s) 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 20 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@bad-flink:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@bad-open:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@basic:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@double-flink:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@flink-lifetime:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_huc_copy@huc-copy:</p>
<ul>
<li>Statuses : 17 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_linear_blits@basic:</p>
<ul>
<li>Statuses : 33 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic:</p>
<ul>
<li>Statuses : 25 skip(s)</li>
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
<li>Statuses : 25 skip(s)</li>
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
<li>Statuses : 25 skip(s)</li>
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
<li>Statuses : 25 skip(s)</li>
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
<li>Statuses : 30 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap_gtt@basic:</p>
<ul>
<li>Statuses : 30 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_linear_blits@basic:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_tiled_blits@basic:</p>
<ul>
<li>Statuses : 30 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ringfill@basic-all:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses : 31 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses : 31 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@safe-alignment:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_sync@basic-all:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_sync@basic-each:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_blits@basic:</p>
<ul>
<li>Statuses : 28 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_fence_blits@basic:</p>
<ul>
<li>Statuses : 30 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_pread_basic:</p>
<ul>
<li>Statuses : 21 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_wait@busy@all-engines:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_wait@wait@all-engines:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-llseek-bad:</p>
<ul>
<li>Statuses : 29 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-llseek-size:</p>
<ul>
<li>Statuses : 29 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>Statuses : 29 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>Statuses : 29 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>Statuses : 29 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_two_bos:</p>
<ul>
<li>Statuses : 29 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9721 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-7567u/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-ivb-3770/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-ivb-3770/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-elk-e7500/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-elk-e7500/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-kbl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-ilk-650/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-ilk-650/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-blb-e6850/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-blb-e6850/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-cfl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-skl-6600u/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-skl-6600u/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-apl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-apl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-glk-j4005/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-glk-j4005/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-skl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-skl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-bsw-nick/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-bsw-nick/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-kbl-2/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-kbl-2/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@all-engines (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-mtlp-8/igt@i915_gem_busy@busy@all-engines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@fds (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-elk-e7500/igt@i915_gem_exec_parallel@engines@fds.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 other tests skip</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-ilk-650/igt@i915_gem_exec_parallel@engines@fds.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@lmem0 (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-atsm-1/igt@i915_gem_exec_suspend@basic-s0@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@smem (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-ivb-3770/igt@i915_gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-blb-e6850/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 other tests skip</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-kbl-2/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-skl-6600u/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-apl-guc/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-skl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-x1275/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-8109u/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-8809g/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-ivb-3770/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-bsw-nick/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@random-engines (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-guc/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@verify-random (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-glk-j4005/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-cfl-8700k/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap_gtt@basic (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@i915_gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_blits@basic (NEW):</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg1-5/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-11/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-14/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-atsm-1/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-7567u/igt@kms_addfb_basic@addfb25-bad-modifier.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8913">i915#8913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8712">i915#8712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/485">Intel XE#485</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8913">i915#8913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9243">i915#9243</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7468 -&gt; IGTPW_9721</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13599: 58fe10f34e80d0eeb5609128faa135260623a715 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9721: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9721/index.html<br />
  IGT_7468: 7468</p>
<h2>Testlist changes</h2>
<p>+++ 59647 lines<br />
--- 59647 lines</p>

</body>
</html>

--===============3823885250648645705==--
