Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8991023607821542977=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 02 Aug 2023 20:40:50 -0000
Message-ID: <169100885043.6325.2811608169910658164@emeril.freedesktop.org>
References: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgTmV3IGRp?=
 =?utf-8?q?r_structure_for_intel_specific_tests_=28rev7=29?=
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

--===============8991023607821542977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New dir structure for intel specific tests (rev7)
URL   : https://patchwork.freedesktop.org/series/117227/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13463 -> IGTPW_9498
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9498 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9498, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9498:

### IGT changes ###

#### Possible regressions ####

  * igt@debugfs_test@basic-hwmon:
    - bat-atsm-1:         [PASS][1] -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-atsm-1/igt@debugfs_test@basic-hwmon.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-atsm-1/igt@debugfs_test@basic-hwmon.html
    - bat-dg2-11:         [PASS][3] -> [SKIP][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-11/igt@debugfs_test@basic-hwmon.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-11/igt@debugfs_test@basic-hwmon.html
    - bat-dg2-8:          [PASS][5] -> [SKIP][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-8/igt@debugfs_test@basic-hwmon.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-8/igt@debugfs_test@basic-hwmon.html
    - bat-dg1-5:          [PASS][7] -> [SKIP][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg1-5/igt@debugfs_test@basic-hwmon.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg1-5/igt@debugfs_test@basic-hwmon.html
    - bat-dg2-9:          [PASS][9] -> [SKIP][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-9/igt@debugfs_test@basic-hwmon.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-9/igt@debugfs_test@basic-hwmon.html

  * igt@debugfs_test@read_all_entries:
    - bat-adln-1:         [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adln-1/igt@debugfs_test@read_all_entries.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adln-1/igt@debugfs_test@read_all_entries.html
    - fi-tgl-1115g4:      [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html
    - bat-mtlp-6:         [PASS][15] -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-6/igt@debugfs_test@read_all_entries.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@debugfs_test@read_all_entries.html
    - bat-rpls-2:         [PASS][17] -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-2/igt@debugfs_test@read_all_entries.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-2/igt@debugfs_test@read_all_entries.html
    - bat-adlp-6:         [PASS][19] -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-6/igt@debugfs_test@read_all_entries.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-6/igt@debugfs_test@read_all_entries.html
    - bat-jsl-3:          [PASS][21] -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-jsl-3/igt@debugfs_test@read_all_entries.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-3/igt@debugfs_test@read_all_entries.html
    - bat-mtlp-8:         [PASS][23] -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-8/igt@debugfs_test@read_all_entries.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@debugfs_test@read_all_entries.html
    - bat-adlm-1:         [PASS][25] -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlm-1/igt@debugfs_test@read_all_entries.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlm-1/igt@debugfs_test@read_all_entries.html
    - bat-jsl-1:          [PASS][27] -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-jsl-1/igt@debugfs_test@read_all_entries.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-1/igt@debugfs_test@read_all_entries.html
    - bat-rpls-1:         [PASS][29] -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-1/igt@debugfs_test@read_all_entries.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-1/igt@debugfs_test@read_all_entries.html
    - bat-adlp-9:         [PASS][31] -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-9/igt@debugfs_test@read_all_entries.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-9/igt@debugfs_test@read_all_entries.html
    - bat-rplp-1:         [PASS][33] -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rplp-1/igt@debugfs_test@read_all_entries.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@debugfs_test@read_all_entries.html
    - fi-rkl-11600:       [PASS][35] -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-rkl-11600/igt@debugfs_test@read_all_entries.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-rkl-11600/igt@debugfs_test@read_all_entries.html
    - bat-adls-5:         [PASS][37] -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adls-5/igt@debugfs_test@read_all_entries.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adls-5/igt@debugfs_test@read_all_entries.html

  * igt@i915_gem_lmem_swapping@basic (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][39] +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-1/igt@i915_gem_lmem_swapping@basic.html
    - bat-rpls-1:         NOTRUN -> [SKIP][40] +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-1/igt@i915_gem_lmem_swapping@basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][41] +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-rkl-11600/igt@i915_gem_lmem_swapping@basic.html
    - bat-adls-5:         NOTRUN -> [SKIP][42] +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adls-5/igt@i915_gem_lmem_swapping@basic.html

  * igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][43] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-tgl-1115g4/igt@i915_gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_gem_lmem_swapping@random-engines (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][44] +6 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@i915_gem_lmem_swapping@random-engines.html
    - bat-jsl-3:          NOTRUN -> [SKIP][45] +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-3/igt@i915_gem_lmem_swapping@random-engines.html

  * igt@i915_gem_mmap@basic (NEW):
    - {bat-dg2-13}:       NOTRUN -> [SKIP][46] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-13/igt@i915_gem_mmap@basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][47] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-9/igt@i915_gem_mmap@basic.html

  * igt@i915_gem_render_tiled_blits@basic (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][48] +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-atsm-1/igt@i915_gem_render_tiled_blits@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][49] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-11/igt@i915_gem_render_tiled_blits@basic.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][50] +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-14/igt@i915_gem_render_tiled_blits@basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][51] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-8/igt@i915_gem_render_tiled_blits@basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][52] +6 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_gem_render_tiled_blits@basic.html
    - bat-dg1-5:          NOTRUN -> [SKIP][53] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg1-5/igt@i915_gem_render_tiled_blits@basic.html

  * igt@i915_gem_tiled_pread_basic (NEW):
    - bat-rpls-2:         NOTRUN -> [SKIP][54] +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-2/igt@i915_gem_tiled_pread_basic.html
    - bat-adlp-6:         NOTRUN -> [SKIP][55]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-6/igt@i915_gem_tiled_pread_basic.html
    - bat-adlm-1:         NOTRUN -> [SKIP][56] +4 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlm-1/igt@i915_gem_tiled_pread_basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][57]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-9/igt@i915_gem_tiled_pread_basic.html
    - bat-adln-1:         NOTRUN -> [SKIP][58]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adln-1/igt@i915_gem_tiled_pread_basic.html
    - bat-rplp-1:         NOTRUN -> [SKIP][59]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@i915_gem_tiled_pread_basic.html

  
#### Warnings ####

  * igt@debugfs_test@basic-hwmon:
    - bat-rpls-2:         [SKIP][60] ([i915#7456]) -> [SKIP][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-2/igt@debugfs_test@basic-hwmon.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-2/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-6:         [SKIP][62] ([i915#7456]) -> [SKIP][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
    - bat-jsl-3:          [SKIP][64] ([i915#7456]) -> [SKIP][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-jsl-3/igt@debugfs_test@basic-hwmon.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-3/igt@debugfs_test@basic-hwmon.html
    - bat-adlm-1:         [SKIP][66] ([i915#7456]) -> [SKIP][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
    - bat-jsl-1:          [SKIP][68] ([i915#7456]) -> [SKIP][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
    - bat-rpls-1:         [SKIP][70] ([i915#7456]) -> [SKIP][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-1/igt@debugfs_test@basic-hwmon.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-1/igt@debugfs_test@basic-hwmon.html
    - bat-mtlp-8:         [SKIP][72] ([i915#7456]) -> [SKIP][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
    - bat-adlp-9:         [SKIP][74] ([i915#7456]) -> [SKIP][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
    - bat-rplp-1:         [SKIP][76] ([i915#7456]) -> [SKIP][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
    - fi-rkl-11600:       [SKIP][78] ([i915#7456]) -> [SKIP][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
    - bat-adls-5:         [SKIP][80] ([i915#7456]) -> [SKIP][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adls-5/igt@debugfs_test@basic-hwmon.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adls-5/igt@debugfs_test@basic-hwmon.html
    - bat-adln-1:         [SKIP][82] ([i915#7456]) -> [SKIP][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adln-1/igt@debugfs_test@basic-hwmon.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adln-1/igt@debugfs_test@basic-hwmon.html
    - fi-tgl-1115g4:      [SKIP][84] ([i915#7456]) -> [SKIP][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html
    - bat-mtlp-6:         [SKIP][86] ([i915#7456]) -> [SKIP][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-8809g:       [FAIL][88] ([i915#8843]) -> [FAIL][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-8809g/igt@i915_pm_rpm@basic-rte.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-8809g/igt@i915_pm_rpm@basic-rte.html
    - fi-kbl-guc:         [FAIL][90] ([i915#8843]) -> [FAIL][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@debugfs_test@basic-hwmon:
    - {bat-dg2-14}:       [PASS][92] -> [SKIP][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-14/igt@debugfs_test@basic-hwmon.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-14/igt@debugfs_test@basic-hwmon.html
    - {bat-dg2-13}:       [PASS][94] -> [SKIP][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-13/igt@debugfs_test@basic-hwmon.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-13/igt@debugfs_test@basic-hwmon.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13463 and IGTPW_9498:

### New IGT tests (126) ###

  * igt@i915_gem_basic@bad-close:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@create-close:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_basic@create-fd-close:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_busy@busy@all-engines:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@basic-process:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_close_race@basic-threads:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_create@basic:
    - Statuses : 38 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_create@basic-files:
    - Statuses : 38 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ctx_exec@basic:
    - Statuses : 38 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_basic@basic@bcs0-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@bcs0-smem:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs0-lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs0-smem:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs1-lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs1-smem:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs2-lmem0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs2-smem:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs3-lmem0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@ccs3-smem:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@rcs0-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@rcs0-smem:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs0-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs0-smem:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs1-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vcs1-smem:
    - Statuses : 17 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs0-lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs0-smem:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs1-lmem0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_basic@basic@vecs1-smem:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_create@basic@lmem0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_create@basic@smem:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_fence@basic-await@bcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@ccs3:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vcs1:
    - Statuses : 17 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vecs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-await@vecs1:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_fence@basic-busy@bcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@ccs3:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vcs1:
    - Statuses : 17 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vecs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-busy@vecs1:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_fence@basic-wait@bcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@ccs3:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vcs1:
    - Statuses : 17 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vecs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@basic-wait@vecs1:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_fence@nb-await@bcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@ccs3:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vcs1:
    - Statuses : 17 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vecs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_fence@nb-await@vecs1:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_gttfill@basic:
    - Statuses : 37 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_parallel@engines@basic:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@contexts:
    - Statuses : 38 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@fds:
    - Statuses : 36 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_parallel@engines@userptr:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_store@basic:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s0:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_suspend@basic-s0@lmem0:
    - Statuses : 1 dmesg-warn(s) 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s0@smem:
    - Statuses : 2 dmesg-warn(s) 26 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_gem_exec_suspend@basic-s3@lmem0:
    - Statuses : 1 dmesg-warn(s) 3 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_exec_suspend@basic-s3@smem:
    - Statuses : 2 dmesg-warn(s) 26 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@bad-flink:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@bad-open:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@basic:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@double-flink:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_flink_basic@flink-lifetime:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_huc_copy@huc-copy:
    - Statuses : 20 pass(s) 20 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_linear_blits@basic:
    - Statuses : 37 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@basic:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@basic@lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@parallel-random-engines:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@parallel-random-engines@lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@random-engines:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@random-engines@lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@verify-random:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_lmem_swapping@verify-random@lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_mmap@basic:
    - Statuses : 31 pass(s) 9 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_mmap_gtt@basic:
    - Statuses : 31 pass(s) 9 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_render_linear_blits@basic:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_render_tiled_blits@basic:
    - Statuses : 31 pass(s) 9 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_ringfill@basic-all:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@allocator-basic:
    - Statuses : 34 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@allocator-basic-reserve:
    - Statuses : 34 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_softpin@safe-alignment:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_sync@basic-all:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_sync@basic-each:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_blits@basic:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_fence_blits@basic:
    - Statuses : 31 pass(s) 9 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_tiled_pread_basic:
    - Statuses : 22 pass(s) 18 skip(s)
    - Exec time: [0.0] s

  * igt@i915_gem_wait@busy@all-engines:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_gem_wait@wait@all-engines:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-llseek-bad:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-llseek-size:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_fd_dup:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_one_bo:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_one_bo_two_files:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  * igt@i915_prime_self_import@basic-with_two_bos:
    - Statuses : 34 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9498 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [PASS][96] -> [SKIP][97] ([fdo#109271])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
    - fi-cfl-8109u:       [PASS][98] -> [SKIP][99] ([fdo#109271])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html
    - fi-kbl-7567u:       [PASS][100] -> [SKIP][101] ([fdo#109271])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html
    - fi-kbl-8809g:       [PASS][102] -> [SKIP][103] ([fdo#109271])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html
    - fi-ilk-650:         [PASS][104] -> [SKIP][105] ([fdo#109271])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-ilk-650/igt@debugfs_test@read_all_entries.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-ilk-650/igt@debugfs_test@read_all_entries.html
    - fi-blb-e6850:       [PASS][106] -> [SKIP][107] ([fdo#109271])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-blb-e6850/igt@debugfs_test@read_all_entries.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-blb-e6850/igt@debugfs_test@read_all_entries.html
    - fi-cfl-guc:         [PASS][108] -> [SKIP][109] ([fdo#109271])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-guc/igt@debugfs_test@read_all_entries.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-guc/igt@debugfs_test@read_all_entries.html
    - fi-skl-6600u:       [PASS][110] -> [SKIP][111] ([fdo#109271])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-skl-6600u/igt@debugfs_test@read_all_entries.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-skl-6600u/igt@debugfs_test@read_all_entries.html
    - fi-apl-guc:         [PASS][112] -> [SKIP][113] ([fdo#109271])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-apl-guc/igt@debugfs_test@read_all_entries.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-apl-guc/igt@debugfs_test@read_all_entries.html
    - fi-cfl-8700k:       [PASS][114] -> [SKIP][115] ([fdo#109271])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html
    - fi-bsw-nick:        [PASS][116] -> [SKIP][117] ([fdo#109271])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-bsw-nick/igt@debugfs_test@read_all_entries.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-bsw-nick/igt@debugfs_test@read_all_entries.html
    - fi-kbl-soraka:      [PASS][118] -> [SKIP][119] ([fdo#109271])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html
    - fi-hsw-4770:        [PASS][120] -> [SKIP][121] ([fdo#109271])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-hsw-4770/igt@debugfs_test@read_all_entries.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-hsw-4770/igt@debugfs_test@read_all_entries.html
    - fi-ivb-3770:        [PASS][122] -> [SKIP][123] ([fdo#109271])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-ivb-3770/igt@debugfs_test@read_all_entries.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-ivb-3770/igt@debugfs_test@read_all_entries.html
    - fi-elk-e7500:       [PASS][124] -> [SKIP][125] ([fdo#109271])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-elk-e7500/igt@debugfs_test@read_all_entries.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-elk-e7500/igt@debugfs_test@read_all_entries.html
    - fi-kbl-guc:         [PASS][126] -> [SKIP][127] ([fdo#109271])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-guc/igt@debugfs_test@read_all_entries.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-guc/igt@debugfs_test@read_all_entries.html
    - fi-bsw-n3050:       [PASS][128] -> [SKIP][129] ([fdo#109271])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-bsw-n3050/igt@debugfs_test@read_all_entries.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-bsw-n3050/igt@debugfs_test@read_all_entries.html
    - fi-pnv-d510:        [PASS][130] -> [SKIP][131] ([fdo#109271])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-pnv-d510/igt@debugfs_test@read_all_entries.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-pnv-d510/igt@debugfs_test@read_all_entries.html
    - fi-glk-j4005:       [PASS][132] -> [SKIP][133] ([fdo#109271])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-glk-j4005/igt@debugfs_test@read_all_entries.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-glk-j4005/igt@debugfs_test@read_all_entries.html

  * igt@i915_gem_ctx_create@basic (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][134] ([fdo#109271]) +11 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-pnv-d510/igt@i915_gem_ctx_create@basic.html

  * igt@i915_gem_exec_parallel@engines@fds (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][135] ([fdo#109271]) +7 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-elk-e7500/igt@i915_gem_exec_parallel@engines@fds.html

  * igt@i915_gem_exec_suspend@basic-s0@lmem0 (NEW):
    - bat-atsm-1:         NOTRUN -> [DMESG-WARN][136] ([i915#8841]) +3 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-atsm-1/igt@i915_gem_exec_suspend@basic-s0@lmem0.html

  * igt@i915_gem_exec_suspend@basic-s3@smem (NEW):
    - fi-ivb-3770:        NOTRUN -> [DMESG-WARN][137] ([i915#8841]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-ivb-3770/igt@i915_gem_exec_suspend@basic-s3@smem.html

  * igt@i915_gem_huc_copy@huc-copy (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][138] ([fdo#109271]) +6 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-hsw-4770/igt@i915_gem_huc_copy@huc-copy.html

  * igt@i915_gem_lmem_swapping@basic (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][139] ([fdo#109271]) +7 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-bsw-n3050/igt@i915_gem_lmem_swapping@basic.html

  * igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][140] ([fdo#109271]) +4 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-x1275/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][141] ([fdo#109271]) +4 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8109u/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][142] ([fdo#109271]) +4 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-7567u/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][143] ([fdo#109271]) +4 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-8809g/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-ilk-650:         NOTRUN -> [SKIP][144] ([fdo#109271]) +7 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-ilk-650/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][145] ([fdo#109271]) +4 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8700k/igt@i915_gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][146] ([fdo#109271]) +3 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_gem_lmem_swapping@random-engines (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][147] ([fdo#109271]) +3 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-guc/igt@i915_gem_lmem_swapping@random-engines.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][148] ([fdo#109271]) +11 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-blb-e6850/igt@i915_gem_lmem_swapping@random-engines.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][149] ([fdo#109271]) +4 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-skl-6600u/igt@i915_gem_lmem_swapping@random-engines.html
    - fi-apl-guc:         NOTRUN -> [SKIP][150] ([fdo#109271]) +3 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-apl-guc/igt@i915_gem_lmem_swapping@random-engines.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][151] ([fdo#109271]) +6 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-ivb-3770/igt@i915_gem_lmem_swapping@random-engines.html

  * igt@i915_gem_lmem_swapping@verify-random (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][152] ([fdo#109271]) +4 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-glk-j4005/igt@i915_gem_lmem_swapping@verify-random.html

  * igt@i915_gem_tiled_blits@basic (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][153] ([i915#4077]) +2 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-11/igt@i915_gem_tiled_blits@basic.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][154] ([fdo#109271]) +7 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-soraka/igt@i915_gem_tiled_blits@basic.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][155] ([i915#4077]) +2 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-14/igt@i915_gem_tiled_blits@basic.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][156] ([fdo#109271]) +7 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-bsw-nick/igt@i915_gem_tiled_blits@basic.html
    - bat-atsm-1:         NOTRUN -> [SKIP][157] ([i915#4077]) +2 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-atsm-1/igt@i915_gem_tiled_blits@basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][158] ([i915#4077]) +2 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-8/igt@i915_gem_tiled_blits@basic.html

  * igt@i915_gem_tiled_fence_blits@basic (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][159] ([i915#4077]) +2 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_gem_tiled_fence_blits@basic.html
    - bat-dg1-5:          NOTRUN -> [SKIP][160] ([i915#4077]) +2 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg1-5/igt@i915_gem_tiled_fence_blits@basic.html
    - {bat-dg2-13}:       NOTRUN -> [SKIP][161] ([i915#4077]) +2 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-13/igt@i915_gem_tiled_fence_blits@basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][162] ([i915#4077]) +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-9/igt@i915_gem_tiled_fence_blits@basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][163] ([i915#4077]) +2 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@i915_gem_tiled_fence_blits@basic.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][164] -> [FAIL][165] ([i915#7940])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-7567u/igt@i915_pm_rpm@basic-pci-d3-state.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-7567u/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][166] -> [FAIL][167] ([i915#7940])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - bat-mtlp-8:         NOTRUN -> [SKIP][168] ([i915#6621])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-8:         NOTRUN -> [DMESG-FAIL][169] ([i915#7059])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@requests:
    - fi-kbl-soraka:      [PASS][170] -> [ABORT][171] ([i915#7913])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-soraka/igt@i915_selftest@live@requests.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-soraka/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [PASS][172] -> [ABORT][173] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-1/igt@i915_selftest@live@reset.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [PASS][174] -> [INCOMPLETE][175] ([i915#7913])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-8:         NOTRUN -> [SKIP][176] ([i915#6645])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-mtlp-8:         NOTRUN -> [SKIP][177] ([i915#7828])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_psr@cursor_plane_move:
    - bat-rplp-1:         NOTRUN -> [SKIP][178] ([i915#1072])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rplp-1:         NOTRUN -> [ABORT][179] ([i915#8442] / [i915#8668] / [i915#8712])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         NOTRUN -> [SKIP][180] ([i915#3708]) +2 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-mtlp-8:         NOTRUN -> [SKIP][181] ([i915#3708] / [i915#4077]) +1 similar issue
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@prime_vgem@basic-gtt.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - bat-mtlp-8:         [ABORT][182] ([i915#7077] / [i915#7977] / [i915#8668]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html
    - bat-adlp-9:         [FAIL][184] ([i915#7940]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-9/igt@i915_pm_rpm@basic-pci-d3-state.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-9/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-x1275:       [FAIL][186] ([i915#7940]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-x1275/igt@i915_pm_rpm@basic-rte.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-x1275/igt@i915_pm_rpm@basic-rte.html
    - fi-kbl-7567u:       [FAIL][188] ([i915#7940]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8700k:       [FAIL][190] ([i915#7940]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][192] ([i915#5334] / [i915#7872]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-6:         [DMESG-FAIL][194] ([i915#8497]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [DMESG-WARN][196] ([i915#6367]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@i915_selftest@live@slpc.html
    - bat-rpls-2:         [DMESG-WARN][198] ([i915#6367]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-2/igt@i915_selftest@live@slpc.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-2/igt@i915_selftest@live@slpc.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlp-11:        [DMESG-WARN][200] ([i915#4423]) -> [ABORT][201] ([i915#4423])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-11/igt@i915_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-11/igt@i915_module_load@load.html

  * igt@kms_psr@primary_page_flip:
    - bat-rplp-1:         [ABORT][202] ([i915#8860]) -> [SKIP][203] ([i915#1072])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rplp-1/igt@kms_psr@primary_page_flip.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#7977]: https://gitlab.freedesktop.org/drm/intel/issues/7977
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8712]: https://gitlab.freedesktop.org/drm/intel/issues/8712
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8843]: https://gitlab.freedesktop.org/drm/intel/issues/8843
  [i915#8860]: https://gitlab.freedesktop.org/drm/intel/issues/8860


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7412 -> IGTPW_9498

  CI-20190529: 20190529
  CI_DRM_13463: 20610a111d61d6945d578360942dc5c7bd828eb5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9498: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/index.html
  IGT_7412: 7412


Testlist changes
----------------

+++ 59610 lines
--- 59610 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/index.html

--===============8991023607821542977==
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
<tr><td><b>Series:</b></td><td>New dir structure for intel specific tests (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117227/">https://patchwork.freedesktop.org/series/117227/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13463 -&gt; IGTPW_9498</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9498 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9498, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9498:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-atsm-1/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-atsm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-11/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-11/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-8/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg1-5/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg1-5/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-9/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-9/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adln-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adln-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-tgl-1115g4/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-6/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-2/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-2/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-6/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-6/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-jsl-3/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-3/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-8/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlm-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlm-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-jsl-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-9/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-9/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rplp-1/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-rkl-11600/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-rkl-11600/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adls-5/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adls-5/igt@debugfs_test@read_all_entries.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic (NEW):</p>
<ul>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-1/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-1/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-rkl-11600/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +5 similar issues</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adls-5/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-tgl-1115g4/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@random-engines (NEW):</p>
<ul>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> +6 similar issues</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-3/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap@basic (NEW):</p>
<ul>
<li>
<p>{bat-dg2-13}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-13/igt@i915_gem_mmap@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-9/igt@i915_gem_mmap@basic.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_tiled_blits@basic (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-atsm-1/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-11/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-14/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-8/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +6 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg1-5/igt@i915_gem_render_tiled_blits@basic.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_pread_basic (NEW):</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-2/igt@i915_gem_tiled_pread_basic.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-6/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlm-1/igt@i915_gem_tiled_pread_basic.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-9/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adln-1/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@i915_gem_tiled_pread_basic.html">SKIP</a></p>
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
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlm-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-9/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-9/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adls-5/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adls-5/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adln-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adln-1/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-8809g/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8843">i915#8843</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-8809g/igt@i915_pm_rpm@basic-rte.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8843">i915#8843</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>
<p>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-14/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-14/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-13/igt@debugfs_test@basic-hwmon.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-13/igt@debugfs_test@basic-hwmon.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13463 and IGTPW_9498:</p>
<h3>New IGT tests (126)</h3>
<ul>
<li>
<p>igt@i915_gem_basic@bad-close:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@create-close:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_basic@create-fd-close:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_busy@busy@all-engines:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@basic-process:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_close_race@basic-threads:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic:</p>
<ul>
<li>Statuses : 38 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic-files:</p>
<ul>
<li>Statuses : 38 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_exec@basic:</p>
<ul>
<li>Statuses : 38 pass(s) 2 skip(s)</li>
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
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@bcs0-smem:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs0-lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs0-smem:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs1-lmem0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs1-smem:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs2-lmem0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs2-smem:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs3-lmem0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@ccs3-smem:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@rcs0-lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@rcs0-smem:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs0-lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs0-smem:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs1-lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vcs1-smem:</p>
<ul>
<li>Statuses : 17 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs0-lmem0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs0-smem:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs1-lmem0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_basic@basic@vecs1-smem:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
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
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_create@basic@smem:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
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
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@ccs3:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vcs1:</p>
<ul>
<li>Statuses : 17 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-await@vecs1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
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
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@ccs3:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vcs1:</p>
<ul>
<li>Statuses : 17 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-busy@vecs1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
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
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@ccs3:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vcs1:</p>
<ul>
<li>Statuses : 17 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vecs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@basic-wait@vecs1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
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
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@ccs3:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vcs1:</p>
<ul>
<li>Statuses : 17 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_fence@nb-await@vecs1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_gttfill@basic:</p>
<ul>
<li>Statuses : 37 pass(s) 3 skip(s)</li>
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
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@contexts:</p>
<ul>
<li>Statuses : 38 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@fds:</p>
<ul>
<li>Statuses : 36 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@userptr:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_store@basic:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
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
<li>Statuses : 1 dmesg-warn(s) 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 26 pass(s)</li>
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
<li>Statuses : 1 dmesg-warn(s) 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 26 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@bad-flink:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@bad-open:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@basic:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@double-flink:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_flink_basic@flink-lifetime:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_huc_copy@huc-copy:</p>
<ul>
<li>Statuses : 20 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_linear_blits@basic:</p>
<ul>
<li>Statuses : 37 pass(s) 3 skip(s)</li>
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
<li>Statuses : 5 pass(s)</li>
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
<li>Statuses : 5 pass(s)</li>
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
<li>Statuses : 5 pass(s)</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap@basic:</p>
<ul>
<li>Statuses : 31 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_mmap_gtt@basic:</p>
<ul>
<li>Statuses : 31 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_linear_blits@basic:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_render_tiled_blits@basic:</p>
<ul>
<li>Statuses : 31 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ringfill@basic-all:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses : 34 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses : 34 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_softpin@safe-alignment:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_sync@basic-all:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_sync@basic-each:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_blits@basic:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_fence_blits@basic:</p>
<ul>
<li>Statuses : 31 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_pread_basic:</p>
<ul>
<li>Statuses : 22 pass(s) 18 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_wait@busy@all-engines:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_gem_wait@wait@all-engines:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-llseek-bad:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-llseek-size:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_prime_self_import@basic-with_two_bos:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9498 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-8809g/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-ilk-650/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-ilk-650/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-blb-e6850/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-blb-e6850/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-skl-6600u/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-skl-6600u/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-apl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-apl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8700k/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-bsw-nick/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-bsw-nick/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-soraka/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-hsw-4770/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-hsw-4770/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-ivb-3770/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-ivb-3770/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-elk-e7500/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-elk-e7500/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-guc/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-guc/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-bsw-n3050/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-bsw-n3050/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-pnv-d510/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-pnv-d510/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-glk-j4005/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-glk-j4005/igt@debugfs_test@read_all_entries.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_ctx_create@basic (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-pnv-d510/igt@i915_gem_ctx_create@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_parallel@engines@fds (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-elk-e7500/igt@i915_gem_exec_parallel@engines@fds.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s0@lmem0 (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-atsm-1/igt@i915_gem_exec_suspend@basic-s0@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_exec_suspend@basic-s3@smem (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-ivb-3770/igt@i915_gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_gem_huc_copy@huc-copy (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-hsw-4770/igt@i915_gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@basic (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-bsw-n3050/igt@i915_gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@parallel-random-engines (NEW):</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-x1275/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8109u/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-7567u/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-8809g/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-ilk-650/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8700k/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-guc/igt@i915_gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@random-engines (NEW):</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-guc/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-blb-e6850/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-skl-6600u/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-apl-guc/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-ivb-3770/igt@i915_gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_lmem_swapping@verify-random (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-glk-j4005/igt@i915_gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_blits@basic (NEW):</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-11/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-soraka/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-14/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-bsw-nick/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-atsm-1/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-8/igt@i915_gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_gem_tiled_fence_blits@basic (NEW):</p>
<ul>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg1-5/igt@i915_gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>{bat-dg2-13}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-13/igt@i915_gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-9/igt@i915_gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@i915_gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-7567u/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-7567u/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-soraka/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-soraka/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-dg2-11/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8712">i915#8712</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7977">i915#7977</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-9/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-9/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-x1275/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-x1275/igt@i915_pm_rpm@basic-rte.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-6/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rpls-2/igt@i915_selftest@live@slpc.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rplp-1/igt@kms_psr@primary_page_flip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8860">i915#8860</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/bat-rplp-1/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7412 -&gt; IGTPW_9498</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13463: 20610a111d61d6945d578360942dc5c7bd828eb5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9498: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9498/index.html<br />
  IGT_7412: 7412</p>
<h2>Testlist changes</h2>
<p>+++ 59610 lines<br />
--- 59610 lines</p>

</body>
</html>

--===============8991023607821542977==--
