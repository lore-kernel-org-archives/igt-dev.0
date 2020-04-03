Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 14:41:43 -0000
Message-ID: <158592490312.13350.16669094313641655100@emeril.freedesktop.org>
References: <20200403130306.1272436-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200403130306.1272436-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/6=5D_tests/kms=5Fvblank=3A_Make_sur?=
 =?utf-8?q?e_that_we_have_a_mode_set?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/6] tests/kms_vblank: Make sure that we have a mode set
URL   : https://patchwork.freedesktop.org/series/75461/
State : success

== Summary ==

CI Bug Log - changes from IGT_5562 -> IGTPW_4403
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4403 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4403, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4403:

### IGT changes ###

#### Warnings ####

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-8809g:       [SKIP][1] ([fdo#109271]) -> [FAIL][2] +27 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-8809g:       [SKIP][3] ([fdo#109271]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-kbl-8809g/igt@prime_vgem@basic-fence-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/fi-kbl-8809g/igt@prime_vgem@basic-fence-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_4403 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-skl-6770hq:      [PASS][5] -> [DMESG-WARN][6] ([i915#203]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-skl-6770hq/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/fi-skl-6770hq/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-icl-dsi:         [PASS][7] -> [INCOMPLETE][8] ([i915#189])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-skl-6770hq:      [PASS][9] -> [FAIL][10] ([i915#220]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-skl-6770hq/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/fi-skl-6770hq/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [PASS][11] -> [SKIP][12] ([fdo#109271]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-skl-6770hq:      [PASS][13] -> [DMESG-FAIL][14] ([i915#106] / [i915#165])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  
#### Possible fixes ####

  * igt@gem_tiled_fence_blits@basic:
    - fi-blb-e6850:       [DMESG-WARN][15] ([i915#1612]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2520m:       [INCOMPLETE][17] -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-snb-2520m/igt@i915_selftest@live@hangcheck.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/fi-snb-2520m/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-n3050:       [INCOMPLETE][19] ([i915#1382]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#1382]: https://gitlab.freedesktop.org/drm/intel/issues/1382
  [i915#1612]: https://gitlab.freedesktop.org/drm/intel/issues/1612
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#203]: https://gitlab.freedesktop.org/drm/intel/issues/203
  [i915#220]: https://gitlab.freedesktop.org/drm/intel/issues/220


Participating hosts (50 -> 45)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5562 -> IGTPW_4403

  CI-20190529: 20190529
  CI_DRM_8244: 55348aac86bd6f0c4ce4d3d8a0e227f6a20a72f9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4403: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/index.html
  IGT_5562: 4770480c8c1f105ff9225e8eb07b652ca954e06a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_chamelium@dp-hpd-enable-disable-mode
+igt@kms_chamelium@dp-hpd-with-enabled-mode
+igt@kms_chamelium@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium@hdmi-hpd-with-enabled-mode
+igt@kms_chamelium@vga-hpd-enable-disable-mode
+igt@kms_chamelium@vga-hpd-with-enabled-mode

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
