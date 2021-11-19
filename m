Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8097347597949528876=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 19 Nov 2021 16:34:57 -0000
Message-ID: <163733969738.2300.5326491527066719394@emeril.freedesktop.org>
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
To: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8097347597949528876==
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

  * igt@i915_pm_rpm@basic-rte:
    - fi-rkl-guc:         [PASS][1] -> [CRASH][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html
    - fi-tgl-1115g4:      [PASS][3] -> [CRASH][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - fi-rkl-guc:         [PASS][5] -> [FAIL][6] +41 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@too-wide:
    - fi-tgl-1115g4:      [PASS][7] -> [FAIL][8] +42 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html

  * igt@kms_busy@basic:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_busy@basic.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_busy@basic.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-rkl-11600:       [PASS][12] -> [FAIL][13] +41 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-rkl-11600:       [PASS][14] -> [CRASH][15] +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-tgl-1115g4:      [SKIP][16] ([i915#1155]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][18] ([i915#3012]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-guc:         [SKIP][20] ([i915#3012]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-tgl-1115g4:      [SKIP][22] ([fdo#111827]) -> [FAIL][23] +8 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-rkl-11600:       [SKIP][24] ([fdo#111827]) -> [FAIL][25] +8 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-rkl-guc:         [SKIP][26] ([fdo#111827]) -> [FAIL][27] +8 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_chamelium@dp-edid-read.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-rkl-11600:       [SKIP][28] ([i915#4103]) -> [FAIL][29] +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-rkl-guc:         [SKIP][30] ([i915#4103]) -> [FAIL][31] +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-tgl-1115g4:      [SKIP][32] ([i915#4103]) -> [FAIL][33] +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-rkl-11600:       [SKIP][34] ([i915#533]) -> [FAIL][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-rkl-guc:         [SKIP][36] ([i915#533]) -> [FAIL][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [FAIL][38] ([i915#4547]) -> [INCOMPLETE][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {fi-jsl-1}:         [PASS][40] -> [CRASH][41] +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_addfb_basic@too-high:
    - {fi-ehl-2}:         [PASS][42] -> [FAIL][43] +46 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_addfb_basic@too-high.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_addfb_basic@too-high.html

  * igt@kms_busy@basic:
    - {fi-jsl-1}:         NOTRUN -> [FAIL][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_busy@basic.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][45]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_busy@basic.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-dsi/igt@kms_busy@basic.html

  * igt@kms_chamelium@dp-hpd-fast:
    - {fi-jsl-1}:         [SKIP][47] ([fdo#111827]) -> [FAIL][48] +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - {fi-ehl-2}:         [SKIP][49] ([fdo#111827]) -> [FAIL][50] +8 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_chamelium@hdmi-edid-read.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - {fi-tgl-dsi}:       [SKIP][51] ([fdo#109284] / [fdo#111827]) -> [FAIL][52] +8 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - {fi-jsl-1}:         [SKIP][53] ([i915#4103]) -> [FAIL][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - {fi-ehl-2}:         [SKIP][55] ([fdo#109278]) -> [FAIL][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {fi-tgl-dsi}:       [SKIP][57] ([i915#4103]) -> [FAIL][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:
    - {fi-tgl-dsi}:       [PASS][59] -> [FAIL][60] +43 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - {fi-jsl-1}:         [SKIP][61] ([i915#533]) -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - {fi-ehl-2}:         [SKIP][63] ([fdo#109278] / [i915#533]) -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - {fi-jsl-1}:         [PASS][65] -> [FAIL][66] +46 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@prime_vgem@basic-fence-flip:
    - {fi-tgl-dsi}:       [PASS][67] -> [CRASH][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html
    - {fi-ehl-2}:         [PASS][69] -> [CRASH][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_6418 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][71] ([fdo#109271]) +31 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][72] -> [INCOMPLETE][73] ([i915#3921])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [PASS][75] -> [DMESG-WARN][76] ([i915#4269])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-1115g4:      [FAIL][77] ([i915#1888]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  
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

--===============8097347597949528876==
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
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html">CRASH</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">FAIL</a> +41 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html">FAIL</a> +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_busy@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@kms_busy@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_busy@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +41 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html">FAIL</a> +8 similar issues</li>
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
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
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
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a></li>
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
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-dsi/igt@kms_busy@basic.html">FAIL</a></p>
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
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html">FAIL</a> +8 similar issues</li>
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
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">FAIL</a> +43 similar issues</li>
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
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html">CRASH</a> +2 similar issues</p>
</li>
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
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6418/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
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

--===============8097347597949528876==--
