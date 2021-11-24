Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0099942540607907677=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Nov 2021 22:55:02 -0000
Message-ID: <163779450237.25293.9714243752697428411@emeril.freedesktop.org>
References: <20211119150024.2701531-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211119150024.2701531-1-Rodrigo.Siqueira@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Add_test_for_AMD_DP_DSC?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0099942540607907677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Add test for AMD DP DSC
URL   : https://patchwork.freedesktop.org/series/97108/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10907 -> IGTPW_6418
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6418 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6418, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/index.html

Participating hosts (44 -> 34)
------------------------------

  Missing    (10): bat-dg1-6 fi-tgl-u2 bat-dg1-5 fi-hsw-4200u fi-icl-u2 fi-bsw-cyan bat-adlp-6 fi-ctg-p8600 bat-jsl-2 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6418:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-rkl-11600:       [PASS][1] -> [FAIL][2] +36 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - fi-rkl-guc:         [PASS][3] -> [FAIL][4] +36 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-rkl-11600:       [PASS][5] -> [CRASH][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
    - fi-rkl-guc:         [PASS][7] -> [CRASH][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-rkl-11600:       [SKIP][9] ([i915#3012]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-guc:         [SKIP][11] ([i915#3012]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-rkl-11600:       [SKIP][13] ([fdo#111827]) -> [FAIL][14] +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-rkl-guc:         [SKIP][15] ([fdo#111827]) -> [FAIL][16] +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_chamelium@dp-edid-read.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-rkl-11600:       [SKIP][17] ([i915#4103]) -> [FAIL][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-rkl-guc:         [SKIP][19] ([i915#4103]) -> [FAIL][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-rkl-11600:       [SKIP][21] ([i915#533]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-rkl-guc:         [SKIP][23] ([i915#533]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {fi-jsl-1}:         [PASS][25] -> [CRASH][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_addfb_basic@too-high:
    - {fi-ehl-2}:         [PASS][27] -> [FAIL][28] +46 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_addfb_basic@too-high.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_addfb_basic@too-high.html

  * igt@kms_busy@basic:
    - {fi-jsl-1}:         NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_busy@basic.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_busy@basic.html

  * igt@kms_chamelium@dp-hpd-fast:
    - {fi-jsl-1}:         [SKIP][31] ([fdo#111827]) -> [FAIL][32] +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - {fi-ehl-2}:         [SKIP][33] ([fdo#111827]) -> [FAIL][34] +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_chamelium@hdmi-edid-read.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - {fi-jsl-1}:         [SKIP][35] ([i915#4103]) -> [FAIL][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - {fi-ehl-2}:         [SKIP][37] ([fdo#109278]) -> [FAIL][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - {fi-jsl-1}:         [SKIP][39] ([i915#533]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - {fi-ehl-2}:         [SKIP][41] ([fdo#109278] / [i915#533]) -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - {fi-jsl-1}:         [PASS][43] -> [FAIL][44] +46 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@prime_vgem@basic-fence-flip:
    - {fi-ehl-2}:         [PASS][45] -> [CRASH][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_6418 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][47] ([fdo#109271]) +31 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-rkl-guc:         [PASS][48] -> [CRASH][49] ([i915#4598])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html
    - fi-tgl-1115g4:      [PASS][50] -> [CRASH][51] ([i915#4598]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html
    - fi-rkl-11600:       [PASS][52] -> [CRASH][53] ([i915#4598])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-rkl-11600:       [PASS][54] -> [FAIL][55] ([i915#4598]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
    - fi-rkl-guc:         [PASS][56] -> [FAIL][57] ([i915#4598]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][58] -> [INCOMPLETE][59] ([i915#3921])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - fi-rkl-guc:         [PASS][60] -> [FAIL][61] ([i915#4638]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@too-wide:
    - fi-tgl-1115g4:      [PASS][62] -> [FAIL][63] ([i915#4598]) +42 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html

  * igt@kms_busy@basic:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][64] ([i915#4598])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_busy@basic.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][65] ([i915#4638])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_busy@basic.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][66] ([i915#4638])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_busy@basic.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-rkl-11600:       [PASS][68] -> [FAIL][69] ([i915#4638]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-rkl-11600:       [PASS][70] -> [CRASH][71] ([i915#4638])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html
    - fi-rkl-guc:         [PASS][72] -> [CRASH][73] ([i915#4638])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [PASS][74] -> [DMESG-WARN][75] ([i915#4269])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-1115g4:      [FAIL][76] ([i915#1888]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-tgl-1115g4:      [SKIP][78] ([i915#1155]) -> [FAIL][79] ([i915#4598])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-tgl-1115g4:      [SKIP][80] ([fdo#111827]) -> [FAIL][81] ([i915#4598]) +8 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-tgl-1115g4:      [SKIP][82] ([i915#4103]) -> [FAIL][83] ([i915#4598]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [FAIL][84] ([i915#4547]) -> [INCOMPLETE][85] ([i915#4564])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4564]: https://gitlab.freedesktop.org/drm/intel/issues/4564
  [i915#4598]: https://gitlab.freedesktop.org/drm/intel/issues/4598
  [i915#4638]: https://gitlab.freedesktop.org/drm/intel/issues/4638
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6285 -> IGTPW_6418

  CI-20190529: 20190529
  CI_DRM_10907: e1f2e7039c95fdf680b357e4c19f7d2a3790cc1d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6418: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/index.html
  IGT_6285: 2e0355faad5c2e81cd6705b76e529ce526c7c9bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@amdgpu/amd_dp_dsc@dsc-bpc
+igt@amdgpu/amd_dp_dsc@dsc-enable-basic
+igt@amdgpu/amd_dp_dsc@dsc-link-settings
+igt@amdgpu/amd_dp_dsc@dsc-slice-dimensions-change
+igt@amdgpu/amd_dp_dsc@dsc-slice-height-property

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/index.html

--===============0099942540607907677==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: Add test for AMD DP DSC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97108/">https://patchwork.freedesktop.org/series/97108/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10907 -&gt; IGTPW_6418</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6418 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6418, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/index.html</p>
<h2>Participating hosts (44 -&gt; 34)</h2>
<p>Missing    (10): bat-dg1-6 fi-tgl-u2 bat-dg1-5 fi-hsw-4200u fi-icl-u2 fi-bsw-cyan bat-adlp-6 fi-ctg-p8600 bat-jsl-2 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6418:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html">FAIL</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_addfb_basic@basic-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_addfb_basic@basic-x-tiled-legacy.html">FAIL</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_chamelium@dp-edid-read.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html">CRASH</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_addfb_basic@too-high.html">FAIL</a> +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_busy@basic.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_busy@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_chamelium@hdmi-edid-read.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">FAIL</a> +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html">CRASH</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6418 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +2 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_busy@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_busy@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_busy@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4564">i915#4564</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6285 -&gt; IGTPW_6418</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10907: e1f2e7039c95fdf680b357e4c19f7d2a3790cc1d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6418: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/index.html<br />
  IGT_6285: 2e0355faad5c2e81cd6705b76e529ce526c7c9bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@amdgpu/amd_dp_dsc@dsc-bpc<br />
+igt@amdgpu/amd_dp_dsc@dsc-enable-basic<br />
+igt@amdgpu/amd_dp_dsc@dsc-link-settings<br />
+igt@amdgpu/amd_dp_dsc@dsc-slice-dimensions-change<br />
+igt@amdgpu/amd_dp_dsc@dsc-slice-height-property</p>

</body>
</html>

--===============0099942540607907677==--
