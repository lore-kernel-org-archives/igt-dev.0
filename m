Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5885449555478660150=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 27 Jul 2023 17:54:29 -0000
Message-ID: <169048046961.19794.7527527911136803613@emeril.freedesktop.org>
References: <20230727165401.926688-1-swati2.sharma@intel.com>
In-Reply-To: <20230727165401.926688-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRFNDIEZy?=
 =?utf-8?q?actional_BPP_Val_Support_=28rev5=29?=
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

--===============5885449555478660150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DSC Fractional BPP Val Support (rev5)
URL   : https://patchwork.freedesktop.org/series/117493/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13432 -> IGTPW_9474
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9474 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9474, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9474:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dsc@dsc-fractional-bpp (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-11/igt@kms_dsc@dsc-fractional-bpp.html

  * {igt@kms_dsc@dsc-fractional-bpp-with-bpc} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-rkl-11600/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - bat-dg1-5:          NOTRUN -> [SKIP][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg1-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * {igt@kms_dsc@dsc-with-output-formats-with-bpc} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-jsl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-mtlp-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - bat-dg2-8:          NOTRUN -> [SKIP][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - bat-jsl-1:          NOTRUN -> [SKIP][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-jsl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13432 and IGTPW_9474:

### New IGT tests (3) ###

  * igt@kms_dsc@dsc-fractional-bpp:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9474 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-cfl-guc:         [PASS][8] -> [FAIL][9] ([i915#7940])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-cfl-guc/igt@i915_pm_rpm@basic-rte.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-1115g4:      [PASS][10] -> [FAIL][11] ([i915#7940])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-1:         [PASS][12] -> [ABORT][13] ([i915#7911] / [i915#7920])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-rpls-1/igt@i915_selftest@live@requests.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         NOTRUN -> [DMESG-WARN][14] ([i915#6367])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-2/igt@i915_selftest@live@slpc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-rpls-2:         NOTRUN -> [SKIP][15] ([i915#7828])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][16] ([fdo#109271]) +7 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][17] ([fdo#109271]) +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][18] ([i915#3555] / [i915#3840]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-rkl-11600/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][19] ([fdo#109271]) +7 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-blb-e6850/igt@kms_dsc@dsc-fractional-bpp.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][20] ([fdo#109271]) +7 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-skl-6600u/igt@kms_dsc@dsc-fractional-bpp.html
    - fi-apl-guc:         NOTRUN -> [SKIP][21] ([fdo#109271]) +7 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-apl-guc/igt@kms_dsc@dsc-fractional-bpp.html
    - fi-skl-guc:         NOTRUN -> [SKIP][22] ([fdo#109271]) +7 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-skl-guc/igt@kms_dsc@dsc-fractional-bpp.html

  * {igt@kms_dsc@dsc-fractional-bpp-with-bpc} (NEW):
    - bat-adls-5:         NOTRUN -> [SKIP][23] ([i915#1845]) +7 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-adls-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - bat-dg2-9:          NOTRUN -> [SKIP][24] ([i915#5354]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - fi-cfl-guc:         NOTRUN -> [SKIP][25] ([fdo#109271]) +7 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-guc/igt@kms_dsc@dsc-with-bpc.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][26] ([i915#1845]) +7 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-mtlp-6/igt@kms_dsc@dsc-with-bpc.html
    - bat-dg2-9:          NOTRUN -> [SKIP][27] ([i915#1845] / [i915#5354]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-9/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - bat-rpls-2:         NOTRUN -> [SKIP][28] ([i915#1845]) +8 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-2/igt@kms_dsc@dsc-with-bpc-formats.html
    - bat-atsm-1:         NOTRUN -> [SKIP][29] ([i915#6078]) +7 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-atsm-1/igt@kms_dsc@dsc-with-bpc-formats.html
    - bat-jsl-3:          NOTRUN -> [SKIP][30] ([i915#3555]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-jsl-3/igt@kms_dsc@dsc-with-bpc-formats.html
    - bat-dg2-11:         NOTRUN -> [SKIP][31] ([i915#3555] / [i915#3840]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-11/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - fi-glk-j4005:       NOTRUN -> [SKIP][32] ([fdo#109271]) +7 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-glk-j4005/igt@kms_dsc@dsc-with-formats.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][33] ([fdo#109271]) +7 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-kbl-x1275/igt@kms_dsc@dsc-with-formats.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][34] ([fdo#109271]) +7 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-8109u/igt@kms_dsc@dsc-with-formats.html
    - fi-ilk-650:         NOTRUN -> [SKIP][35] ([fdo#109271]) +7 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-ilk-650/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - fi-ivb-3770:        NOTRUN -> [SKIP][36] ([fdo#109271]) +7 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-ivb-3770/igt@kms_dsc@dsc-with-output-formats.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][37] ([fdo#109271]) +7 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-elk-e7500/igt@kms_dsc@dsc-with-output-formats.html
    - bat-dg2-8:          NOTRUN -> [SKIP][38] ([i915#3555] / [i915#3840]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-8/igt@kms_dsc@dsc-with-output-formats.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][39] ([fdo#109271]) +7 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-bsw-nick/igt@kms_dsc@dsc-with-output-formats.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][40] ([fdo#109271]) +7 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-kbl-guc/igt@kms_dsc@dsc-with-output-formats.html
    - bat-adlm-1:         NOTRUN -> [SKIP][41] ([i915#1845]) +7 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-adlm-1/igt@kms_dsc@dsc-with-output-formats.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][42] ([fdo#109271]) +7 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-bsw-n3050/igt@kms_dsc@dsc-with-output-formats.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][43] ([i915#3840]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-mtlp-8/igt@kms_dsc@dsc-with-output-formats.html
    - bat-jsl-1:          NOTRUN -> [SKIP][44] ([i915#3555]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-jsl-1/igt@kms_dsc@dsc-with-output-formats.html
    - bat-dg1-5:          NOTRUN -> [SKIP][45] ([i915#3555] / [i915#3840]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg1-5/igt@kms_dsc@dsc-with-output-formats.html

  * {igt@kms_dsc@dsc-with-output-formats-with-bpc} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][46] ([fdo#109271]) +7 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-8700k/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][47] ([i915#1845] / [i915#5354]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_psr@cursor_plane_move:
    - bat-rplp-1:         NOTRUN -> [ABORT][48] ([i915#8434] / [i915#8668])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rplp-1/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - bat-rplp-1:         NOTRUN -> [SKIP][49] ([i915#1072])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rplp-1/igt@kms_psr@primary_page_flip.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-tgl-1115g4:      [FAIL][50] ([i915#7940]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-tgl-1115g4/igt@i915_pm_rpm@basic-pci-d3-state.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-tgl-1115g4/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8700k:       [FAIL][52] ([i915#7940]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         [DMESG-FAIL][54] ([i915#4258] / [i915#7913]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-8:          [DMESG-FAIL][56] ([i915#6998] / [i915#7913]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-dg2-8/igt@i915_selftest@live@hangcheck.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-8/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         [ABORT][58] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-rpls-2/igt@i915_selftest@live@reset.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [DMESG-WARN][60] ([i915#6367]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][62] ([i915#8442] / [i915#8668]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-cfl-8700k:       [FAIL][64] ([i915#7940]) -> [FAIL][65] ([i915#7691])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-cfl-8700k/igt@i915_pm_rpm@basic-pci-d3-state.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-8700k/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [FAIL][66] ([i915#7940]) -> [FAIL][67] ([i915#8843])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6998]: https://gitlab.freedesktop.org/drm/intel/issues/6998
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7691]: https://gitlab.freedesktop.org/drm/intel/issues/7691
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8434]: https://gitlab.freedesktop.org/drm/intel/issues/8434
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8843]: https://gitlab.freedesktop.org/drm/intel/issues/8843


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7406 -> IGTPW_9474

  CI-20190529: 20190529
  CI_DRM_13432: 069a79d6af09879060345da9f8b886a73b7810a8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9474: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/index.html
  IGT_7406: 1d6fd796607099d189e85d1fd305160363b961f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_dsc@dsc-fractional-bpp
+igt@kms_dsc@dsc-fractional-bpp-with-bpc
+igt@kms_dsc@dsc-with-output-formats-with-bpc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/index.html

--===============5885449555478660150==
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
<tr><td><b>Series:</b></td><td>DSC Fractional BPP Val Support (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117493/">https://patchwork.freedesktop.org/series/117493/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13432 -&gt; IGTPW_9474</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9474 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9474, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9474:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp (NEW):</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-11/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-fractional-bpp-with-bpc} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-rkl-11600/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg1-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-output-formats-with-bpc} (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-jsl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-mtlp-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-jsl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13432 and IGTPW_9474:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9474 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-cfl-guc/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-blb-e6850/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-skl-6600u/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-apl-guc/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-skl-guc/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-fractional-bpp-with-bpc} (NEW):</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-adls-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +7 similar issues</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-guc/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-mtlp-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +7 similar issues</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-9/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +8 similar issues</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-atsm-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +7 similar issues</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-jsl-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 similar issues</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-11/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-glk-j4005/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-kbl-x1275/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-8109u/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-ilk-650/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-ivb-3770/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-elk-e7500/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +4 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-bsw-nick/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-kbl-guc/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-adlm-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +7 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-bsw-n3050/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-mtlp-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +4 similar issues</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-jsl-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg1-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-output-formats-with-bpc} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-8700k/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8434">i915#8434</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rplp-1/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-tgl-1115g4/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-tgl-1115g4/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6998">i915#6998</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-cfl-8700k/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-cfl-8700k/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7691">i915#7691</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13432/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8843">i915#8843</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7406 -&gt; IGTPW_9474</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13432: 069a79d6af09879060345da9f8b886a73b7810a8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9474: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9474/index.html<br />
  IGT_7406: 1d6fd796607099d189e85d1fd305160363b961f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_dsc@dsc-fractional-bpp<br />
+igt@kms_dsc@dsc-fractional-bpp-with-bpc<br />
+igt@kms_dsc@dsc-with-output-formats-with-bpc</p>

</body>
</html>

--===============5885449555478660150==--
