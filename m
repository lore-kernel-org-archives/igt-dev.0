Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4951666246405291870=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/i915=5Fsuspend?=
 =?utf-8?q?=3A_Fix_WARN_of_invalid_fd?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 09 Jan 2024 12:19:06 -0000
Message-ID: <170480274694.215423.16484159911271569701@5338d5abeb45>
References: <20240109102703.2529736-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240109102703.2529736-1-bhanuprakash.modem@intel.com>
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

--===============4951666246405291870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_suspend: Fix WARN of invalid fd
URL   : https://patchwork.freedesktop.org/series/128364/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14100 -> IGTPW_10493
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10493 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10493, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/index.html

Participating hosts (38 -> 34)
------------------------------

  Missing    (4): bat-dg2-8 bat-mtlp-8 fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10493:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-cfl-8109u:       [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-kbl-7567u:       [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-cfl-8700k:       [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-ivb-3770:        [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-elk-e7500:       [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-elk-e7500/igt@i915_suspend@basic-s2idle-without-i915.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-elk-e7500/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-bsw-nick:        [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-bsw-nick/igt@i915_suspend@basic-s2idle-without-i915.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-bsw-nick/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-adlm-1:         [PASS][13] -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-tgl-1115g4:      [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-atsm-1:         NOTRUN -> [FAIL][17] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-atsm-1/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-cfl-guc:         [PASS][18] -> [FAIL][19] +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-cfl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-cfl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-kbl-x1275:       [PASS][20] -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-kbl-x1275/igt@i915_suspend@basic-s2idle-without-i915.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-kbl-x1275/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-kbl-guc:         [PASS][22] -> [FAIL][23] +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-kbl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-kbl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-ilk-650:         [PASS][24] -> [FAIL][25] +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-ilk-650/igt@i915_suspend@basic-s2idle-without-i915.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-ilk-650/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-jsl-1:          NOTRUN -> [FAIL][26] +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-blb-e6850:       [PASS][27] -> [FAIL][28] +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-blb-e6850/igt@i915_suspend@basic-s2idle-without-i915.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-blb-e6850/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-bsw-n3050:       [PASS][29] -> [FAIL][30] +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-bsw-n3050/igt@i915_suspend@basic-s2idle-without-i915.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-bsw-n3050/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][31] -> [FAIL][32] +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
    - fi-skl-6600u:       [PASS][33] -> [FAIL][34] +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-skl-6600u/igt@i915_suspend@basic-s3-without-i915.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-skl-6600u/igt@i915_suspend@basic-s3-without-i915.html
    - fi-apl-guc:         [PASS][35] -> [FAIL][36] +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-apl-guc/igt@i915_suspend@basic-s3-without-i915.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-apl-guc/igt@i915_suspend@basic-s3-without-i915.html
    - fi-pnv-d510:        [PASS][37] -> [FAIL][38] +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html
    - bat-dg1-7:          [PASS][39] -> [FAIL][40] +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-dg1-7/igt@i915_suspend@basic-s3-without-i915.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-dg1-7/igt@i915_suspend@basic-s3-without-i915.html
    - bat-jsl-3:          [PASS][41] -> [FAIL][42] +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
    - fi-glk-j4005:       [PASS][43] -> [FAIL][44] +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-glk-j4005/igt@i915_suspend@basic-s3-without-i915.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-glk-j4005/igt@i915_suspend@basic-s3-without-i915.html
    - bat-adlp-9:         [PASS][45] -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html
    - fi-skl-guc:         [PASS][47] -> [FAIL][48] +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-skl-guc/igt@i915_suspend@basic-s3-without-i915.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-skl-guc/igt@i915_suspend@basic-s3-without-i915.html
    - bat-dg2-11:         [PASS][49] -> [FAIL][50] +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
    - bat-kbl-2:          [PASS][51] -> [FAIL][52] +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-tgl-1115g4:      [INCOMPLETE][53] ([i915#7443]) -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
    - bat-mtlp-6:         [SKIP][55] ([i915#6645]) -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html
    - fi-kbl-x1275:       [SKIP][57] ([fdo#109271]) -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_suspend@basic-s2idle-without-i915:
    - {bat-dg2-14}:       [PASS][59] -> [FAIL][60] +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-dg2-14/igt@i915_suspend@basic-s2idle-without-i915.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-dg2-14/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - {bat-rpls-3}:       [PASS][61] -> [FAIL][62] +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-rpls-3/igt@i915_suspend@basic-s3-without-i915.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-rpls-3/igt@i915_suspend@basic-s3-without-i915.html

  
Known issues
------------

  Here are the changes found in IGTPW_10493 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][63] ([i915#9318])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][64] ([i915#2190])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-jsl-1:          NOTRUN -> [SKIP][65] ([i915#4613]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-mtlp-6:         [PASS][66] -> [FAIL][67] ([i915#9092])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-adlp-9:         [PASS][68] -> [FAIL][69] ([i915#9649])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-adlp-9/igt@i915_suspend@basic-s2idle-without-i915.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-adlp-9/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][70] ([i915#4103]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][71] ([i915#3555] / [i915#9886])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-1:          NOTRUN -> [SKIP][72] ([fdo#109285])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-atsm-1:         NOTRUN -> [SKIP][73] ([i915#1836])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-1:          NOTRUN -> [SKIP][74] ([i915#3555])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-atsm-1:         [INCOMPLETE][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-atsm-1/igt@i915_selftest@live@hangcheck.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-atsm-1/igt@i915_selftest@live@hangcheck.html
    - {bat-rpls-3}:       [DMESG-WARN][77] ([i915#5591]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
  [i915#9092]: https://gitlab.freedesktop.org/drm/intel/issues/9092
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9649]: https://gitlab.freedesktop.org/drm/intel/issues/9649
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7663 -> IGTPW_10493

  CI-20190529: 20190529
  CI_DRM_14100: 88035acade648815ca1e0c27c44abd96b258c7e7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10493: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/index.html
  IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/index.html

--===============4951666246405291870==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_suspend: Fix WARN of invalid fd</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128364/">https://patchwork.freedesktop.org/series/128364/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14100 -&gt; IGTPW_10493</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10493 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10493, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/index.html</p>
<h2>Participating hosts (38 -&gt; 34)</h2>
<p>Missing    (4): bat-dg2-8 bat-mtlp-8 fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10493:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-elk-e7500/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-elk-e7500/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-bsw-nick/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-bsw-nick/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-atsm-1/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-cfl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-cfl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-kbl-x1275/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-kbl-x1275/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-kbl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-kbl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-ilk-650/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-ilk-650/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-blb-e6850/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-blb-e6850/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-bsw-n3050/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-bsw-n3050/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-skl-6600u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-skl-6600u/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-apl-guc/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-apl-guc/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-dg1-7/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-dg1-7/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-glk-j4005/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-glk-j4005/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a></li>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-skl-guc/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-skl-guc/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-dg2-11/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-dg2-11/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7443">i915#7443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a></li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>{bat-dg2-14}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-dg2-14/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-dg2-14/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-rpls-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-rpls-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10493 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9092">i915#9092</a>)</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-adlp-9/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-adlp-9/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9649">i915#9649</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-atsm-1/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-atsm-1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7663 -&gt; IGTPW_10493</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14100: 88035acade648815ca1e0c27c44abd96b258c7e7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10493: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10493/index.html<br />
  IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4951666246405291870==--
