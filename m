Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5102326853890807586=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 23 Aug 2023 12:49:17 -0000
Message-ID: <169279495767.16626.11469697710751147026@emeril.freedesktop.org>
References: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU2VwYXJh?=
 =?utf-8?q?te_display_PM_tests_from_Core?=
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

--===============5102326853890807586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Separate display PM tests from Core
URL   : https://patchwork.freedesktop.org/series/122790/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13551 -> IGTPW_9643
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (2): bat-adlp-11 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9643:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_pm_backlight@basic-brightness} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
    - {bat-dg2-13}:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-13/igt@kms_pm_backlight@basic-brightness.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html

  * {igt@kms_pm_rpm@basic-pci-d3-state} (NEW):
    - {bat-dg2-14}:       NOTRUN -> [ABORT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-14/igt@kms_pm_rpm@basic-pci-d3-state.html
    - {bat-dg2-13}:       NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-13/igt@kms_pm_rpm@basic-pci-d3-state.html

  * {igt@kms_pm_rpm@basic-rte} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-atsm-1/igt@kms_pm_rpm@basic-rte.html
    - bat-dg2-9:          NOTRUN -> [SKIP][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-9/igt@kms_pm_rpm@basic-rte.html
    - bat-dg2-11:         NOTRUN -> [SKIP][8] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-11/igt@kms_pm_rpm@basic-rte.html
    - bat-adlm-1:         NOTRUN -> [SKIP][9] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-adlm-1/igt@kms_pm_rpm@basic-rte.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][10] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-tgl-1115g4/igt@kms_pm_rpm@basic-rte.html
    - bat-rpls-1:         NOTRUN -> [SKIP][11] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rpls-1/igt@kms_pm_rpm@basic-rte.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][12] +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-mtlp-6/igt@kms_pm_rpm@basic-rte.html
    - bat-rpls-2:         NOTRUN -> [SKIP][13] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rpls-2/igt@kms_pm_rpm@basic-rte.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][14] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-mtlp-8/igt@kms_pm_rpm@basic-rte.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - bat-adls-5:         NOTRUN -> [SKIP][15] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-adls-5/igt@kms_pm_rpm@module-reload.html
    - bat-dg1-5:          NOTRUN -> [SKIP][16] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg1-5/igt@kms_pm_rpm@module-reload.html
    - bat-adlp-9:         NOTRUN -> [SKIP][17] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-adlp-9/igt@kms_pm_rpm@module-reload.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13551 and IGTPW_9643:

### New IGT tests (5) ###

  * igt@kms_pm_backlight@basic-brightness:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_backlight@basic-brightness@edp-1:
    - Statuses : 1 abort(s) 6 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - Statuses : 3 abort(s) 29 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@basic-rte:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@module-reload:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9643 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#2190])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#4613]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][20] ([i915#1886] / [i915#7913])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][21] ([fdo#109271]) +10 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][22] ([i915#1845] / [i915#5354]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-rpls-2:         NOTRUN -> [SKIP][23] ([i915#1845])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * {igt@kms_pm_backlight@basic-brightness} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][24] ([fdo#109271]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-blb-e6850/igt@kms_pm_backlight@basic-brightness.html
    - bat-kbl-2:          NOTRUN -> [SKIP][25] ([fdo#109271]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html
    - bat-atsm-1:         NOTRUN -> [SKIP][26] ([i915#6078])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-atsm-1/igt@kms_pm_backlight@basic-brightness.html

  * {igt@kms_pm_backlight@basic-brightness@edp-1} (NEW):
    - bat-rplp-1:         NOTRUN -> [ABORT][27] ([i915#8668])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html

  * {igt@kms_pm_rpm@basic-pci-d3-state} (NEW):
    - bat-adln-1:         NOTRUN -> [ABORT][28] ([i915#8668])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][29] ([fdo#109271]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][30] ([fdo#109271]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ilk-650:         NOTRUN -> [SKIP][31] ([fdo#109271]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html

  * {igt@kms_pm_rpm@basic-rte} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][32] ([fdo#112080]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-jsl-3/igt@kms_pm_rpm@basic-rte.html
    - fi-skl-guc:         NOTRUN -> [SKIP][33] ([fdo#109271]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-skl-guc/igt@kms_pm_rpm@basic-rte.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][34] ([fdo#109271]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-x1275/igt@kms_pm_rpm@basic-rte.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][35] ([fdo#109271]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-hsw-4770/igt@kms_pm_rpm@basic-rte.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][36] ([fdo#109271]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-cfl-8109u/igt@kms_pm_rpm@basic-rte.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][37] ([fdo#109271]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-8809g/igt@kms_pm_rpm@basic-rte.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-guc/igt@kms_pm_rpm@basic-rte.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][39] ([fdo#109271]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-bsw-n3050/igt@kms_pm_rpm@basic-rte.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][40] ([fdo#109271]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][41] ([fdo#109271]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-skl-6600u/igt@kms_pm_rpm@basic-rte.html
    - bat-jsl-1:          NOTRUN -> [SKIP][42] ([fdo#112080]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-jsl-1/igt@kms_pm_rpm@basic-rte.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][43] ([fdo#109271]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-cfl-8700k/igt@kms_pm_rpm@basic-rte.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][44] ([fdo#109271]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-apl-guc/igt@kms_pm_rpm@module-reload.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][45] ([fdo#109271]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-pnv-d510/igt@kms_pm_rpm@module-reload.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][46] ([fdo#109271]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-glk-j4005/igt@kms_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-9:          [INCOMPLETE][47] ([i915#6311]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-2:         [ABORT][49] ([i915#7978] / [i915#8668]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         [DMESG-FAIL][51] ([i915#4258] / [i915#7913]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@migrate:
    - bat-mtlp-8:         [DMESG-FAIL][53] ([i915#7699]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-mtlp-8/igt@i915_selftest@live@migrate.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-mtlp-8/igt@i915_selftest@live@migrate.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][55] ([i915#8442] / [i915#8668]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
    - bat-adlp-6:         [ABORT][57] ([i915#7977] / [i915#8668]) -> [ABORT][58] ([i915#7977] / [i915#8469] / [i915#8668])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7977]: https://gitlab.freedesktop.org/drm/intel/issues/7977
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7451 -> IGTPW_9643

  CI-20190529: 20190529
  CI_DRM_13551: 8cb94c67371921ca934d49ff3edbe12cd6b21a39 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9643: 9643
  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_pm_backlight@bad-brightness
+igt@kms_pm_backlight@basic-brightness
+igt@kms_pm_backlight@fade
+igt@kms_pm_backlight@fade-with-dpms
+igt@kms_pm_backlight@fade-with-suspend
+igt@kms_pm_dc@dc3co-vpb-simulation
+igt@kms_pm_dc@dc5-dpms
+igt@kms_pm_dc@dc5-dpms-negative
+igt@kms_pm_dc@dc5-psr
+igt@kms_pm_dc@dc6-dpms
+igt@kms_pm_dc@dc6-psr
+igt@kms_pm_dc@dc9-dpms
+igt@kms_pm_lpsp@kms-lpsp
+igt@kms_pm_lpsp@screens-disabled
+igt@kms_pm_rpm@basic-pci-d3-state
+igt@kms_pm_rpm@cursor
+igt@kms_pm_rpm@cursor-dpms
+igt@kms_pm_rpm@dpms-lpsp
+igt@kms_pm_rpm@dpms-mode-unset-lpsp
+igt@kms_pm_rpm@dpms-mode-unset-non-lpsp
+igt@kms_pm_rpm@dpms-non-lpsp
+igt@kms_pm_rpm@drm-resources-equal
+igt@kms_pm_rpm@fences-dpms
+igt@kms_pm_rpm@i2c
+igt@kms_pm_rpm@legacy-planes
+igt@kms_pm_rpm@legacy-planes-dpms
+igt@kms_pm_rpm@modeset-lpsp
+igt@kms_pm_rpm@modeset-lpsp-stress
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
+igt@kms_pm_rpm@modeset-non-lpsp
+igt@kms_pm_rpm@modeset-non-lpsp-stress
+igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait
+igt@kms_pm_rpm@modeset-pc8-residency-stress
+igt@kms_pm_rpm@modeset-stress-extra-wait
+igt@kms_pm_rpm@system-suspend-modeset
+igt@kms_pm_rpm@universal-planes
+igt@kms_pm_rpm@universal-planes-dpms
-igt@i915_pm_backlight@bad-brightness
-igt@i915_pm_backlight@basic-brightness
-igt@i915_pm_backlight@fade
-igt@i915_pm_backlight@fade-with-dpms
-igt@i915_pm_backlight@fade-with-suspend
-igt@i915_pm_dc@dc3co-vpb-simulation
-igt@i915_pm_dc@dc5-dpms
-igt@i915_pm_dc@dc5-dpms-negative
-igt@i915_pm_dc@dc5-psr
-igt@i915_pm_dc@dc6-dpms
-igt@i915_pm_dc@dc6-psr
-igt@i915_pm_dc@dc9-dpms
-igt@i915_pm_lpsp@kms-lpsp
-igt@i915_pm_lpsp@screens-disabled
-igt@i915_pm_rpm@basic-pci-d3-state
-igt@i915_pm_rpm@cursor
-igt@i915_pm_rpm@cursor-dpms
-igt@i915_pm_rpm@dpms-lpsp
-igt@i915_pm_rpm@dpms-mode-unset-lpsp
-igt@i915_pm_rpm@dpms-mode-unset-non-lpsp
-igt@i915_pm_rpm@dpms-non-lpsp
-igt@i915_pm_rpm@drm-resources-equal
-igt@i915_pm_rpm@fences-dpms
-igt@i915_pm_rpm@i2c
-igt@i915_pm_rpm@legacy-planes
-igt@i915_pm_rpm@legacy-planes-dpms
-igt@i915_pm_rpm@modeset-lpsp
-igt@i915_pm_rpm@modeset-lpsp-stress
-igt@i915_pm_rpm@modeset-lpsp-stress-no-wait
-igt@i915_pm_rpm@modeset-non-lpsp
-igt@i915_pm_rpm@modeset-non-lpsp-stress
-igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait
-igt@i915_pm_rpm@modeset-pc8-residency-stress
-igt@i915_pm_rpm@modeset-stress-extra-wait
-igt@i915_pm_rpm@system-suspend-modeset
-igt@i915_pm_rpm@universal-planes
-igt@i915_pm_rpm@universal-planes-dpms

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/index.html

--===============5102326853890807586==
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
<tr><td><b>Series:</b></td><td>Separate display PM tests from Core</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122790/">https://patchwork.freedesktop.org/series/122790/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13551 -&gt; IGTPW_9643</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (2): bat-adlp-11 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9643:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_pm_backlight@basic-brightness} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-dg2-13}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-13/igt@kms_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-pci-d3-state} (NEW):</p>
<ul>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-14/igt@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a></p>
</li>
<li>
<p>{bat-dg2-13}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-13/igt@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-rte} (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-atsm-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-9/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-11/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-adlm-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-tgl-1115g4/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rpls-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-mtlp-6/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rpls-2/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-mtlp-8/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-adls-5/igt@kms_pm_rpm@module-reload.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg1-5/igt@kms_pm_rpm@module-reload.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-adlp-9/igt@kms_pm_rpm@module-reload.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13551 and IGTPW_9643:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>Statuses : 1 abort(s) 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>Statuses : 3 abort(s) 29 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@module-reload:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9643 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_backlight@basic-brightness} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-blb-e6850/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-atsm-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_backlight@basic-brightness@edp-1} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-pci-d3-state} (NEW):</p>
<ul>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-rte} (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-jsl-3/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-skl-guc/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-x1275/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-hsw-4770/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-cfl-8109u/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-8809g/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-kbl-guc/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-bsw-n3050/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-skl-6600u/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-jsl-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-cfl-8700k/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-apl-guc/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-pnv-d510/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/fi-glk-j4005/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6311">i915#6311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-mtlp-8/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-mtlp-8/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13551/bat-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7977">i915#7977</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9643/bat-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7977">i915#7977</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8469">i915#8469</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7451 -&gt; IGTPW_9643</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13551: 8cb94c67371921ca934d49ff3edbe12cd6b21a39 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9643: 9643<br />
  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_pm_backlight@bad-brightness<br />
+igt@kms_pm_backlight@basic-brightness<br />
+igt@kms_pm_backlight@fade<br />
+igt@kms_pm_backlight@fade-with-dpms<br />
+igt@kms_pm_backlight@fade-with-suspend<br />
+igt@kms_pm_dc@dc3co-vpb-simulation<br />
+igt@kms_pm_dc@dc5-dpms<br />
+igt@kms_pm_dc@dc5-dpms-negative<br />
+igt@kms_pm_dc@dc5-psr<br />
+igt@kms_pm_dc@dc6-dpms<br />
+igt@kms_pm_dc@dc6-psr<br />
+igt@kms_pm_dc@dc9-dpms<br />
+igt@kms_pm_lpsp@kms-lpsp<br />
+igt@kms_pm_lpsp@screens-disabled<br />
+igt@kms_pm_rpm@basic-pci-d3-state<br />
+igt@kms_pm_rpm@cursor<br />
+igt@kms_pm_rpm@cursor-dpms<br />
+igt@kms_pm_rpm@dpms-lpsp<br />
+igt@kms_pm_rpm@dpms-mode-unset-lpsp<br />
+igt@kms_pm_rpm@dpms-mode-unset-non-lpsp<br />
+igt@kms_pm_rpm@dpms-non-lpsp<br />
+igt@kms_pm_rpm@drm-resources-equal<br />
+igt@kms_pm_rpm@fences-dpms<br />
+igt@kms_pm_rpm@i2c<br />
+igt@kms_pm_rpm@legacy-planes<br />
+igt@kms_pm_rpm@legacy-planes-dpms<br />
+igt@kms_pm_rpm@modeset-lpsp<br />
+igt@kms_pm_rpm@modeset-lpsp-stress<br />
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait<br />
+igt@kms_pm_rpm@modeset-non-lpsp<br />
+igt@kms_pm_rpm@modeset-non-lpsp-stress<br />
+igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
+igt@kms_pm_rpm@modeset-pc8-residency-stress<br />
+igt@kms_pm_rpm@modeset-stress-extra-wait<br />
+igt@kms_pm_rpm@system-suspend-modeset<br />
+igt@kms_pm_rpm@universal-planes<br />
+igt@kms_pm_rpm@universal-planes-dpms<br />
-igt@i915_pm_backlight@bad-brightness<br />
-igt@i915_pm_backlight@basic-brightness<br />
-igt@i915_pm_backlight@fade<br />
-igt@i915_pm_backlight@fade-with-dpms<br />
-igt@i915_pm_backlight@fade-with-suspend<br />
-igt@i915_pm_dc@dc3co-vpb-simulation<br />
-igt@i915_pm_dc@dc5-dpms<br />
-igt@i915_pm_dc@dc5-dpms-negative<br />
-igt@i915_pm_dc@dc5-psr<br />
-igt@i915_pm_dc@dc6-dpms<br />
-igt@i915_pm_dc@dc6-psr<br />
-igt@i915_pm_dc@dc9-dpms<br />
-igt@i915_pm_lpsp@kms-lpsp<br />
-igt@i915_pm_lpsp@screens-disabled<br />
-igt@i915_pm_rpm@basic-pci-d3-state<br />
-igt@i915_pm_rpm@cursor<br />
-igt@i915_pm_rpm@cursor-dpms<br />
-igt@i915_pm_rpm@dpms-lpsp<br />
-igt@i915_pm_rpm@dpms-mode-unset-lpsp<br />
-igt@i915_pm_rpm@dpms-mode-unset-non-lpsp<br />
-igt@i915_pm_rpm@dpms-non-lpsp<br />
-igt@i915_pm_rpm@drm-resources-equal<br />
-igt@i915_pm_rpm@fences-dpms<br />
-igt@i915_pm_rpm@i2c<br />
-igt@i915_pm_rpm@legacy-planes<br />
-igt@i915_pm_rpm@legacy-planes-dpms<br />
-igt@i915_pm_rpm@modeset-lpsp<br />
-igt@i915_pm_rpm@modeset-lpsp-stress<br />
-igt@i915_pm_rpm@modeset-lpsp-stress-no-wait<br />
-igt@i915_pm_rpm@modeset-non-lpsp<br />
-igt@i915_pm_rpm@modeset-non-lpsp-stress<br />
-igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
-igt@i915_pm_rpm@modeset-pc8-residency-stress<br />
-igt@i915_pm_rpm@modeset-stress-extra-wait<br />
-igt@i915_pm_rpm@system-suspend-modeset<br />
-igt@i915_pm_rpm@universal-planes<br />
-igt@i915_pm_rpm@universal-planes-dpms</p>

</body>
</html>

--===============5102326853890807586==--
