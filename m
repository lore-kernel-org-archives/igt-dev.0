Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Apr 2020 21:28:56 -0000
Message-ID: <158620853621.4194.7908619338171387856@emeril.freedesktop.org>
References: <20200402110729.18305-1-mika.kahola@intel.com>
In-Reply-To: <20200402110729.18305-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_Wait_for_an_extra_vblank_=28rev2=29?=
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_cursor_legacy: Wait for an extra vblank (rev2)
URL   : https://patchwork.freedesktop.org/series/75413/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8261_full -> IGTPW_4411_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4411_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4411_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4411_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-tglb3/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4411_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#109276])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][4] -> [DMESG-WARN][5] ([i915#180]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][6] -> [FAIL][7] ([i915#57])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#52] / [i915#54]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@kms_draw_crc@fill-fb.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-apl2/igt@kms_draw_crc@fill-fb.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-hsw:          [PASS][12] -> [INCOMPLETE][13] ([i915#61])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#109441]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([i915#456] / [i915#460])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][20] ([i915#180] / [i915#95]) -> [PASS][21] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-apl6/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][22] ([i915#1316] / [i915#579]) -> [PASS][23] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb1/igt@i915_pm_rpm@cursor.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-tglb3/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][24] ([fdo#109271]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw7/igt@i915_pm_rpm@cursor.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-hsw7/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [SKIP][26] ([fdo#109271]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk4/igt@i915_pm_rpm@cursor.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-glk8/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [SKIP][28] ([i915#1316] / [i915#579]) -> [PASS][29] +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-iclb3/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][30] ([i915#180]) -> [PASS][31] +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-apl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_busy@basic@flip:
    - shard-hsw:          [INCOMPLETE][32] ([i915#61]) -> [PASS][33] +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw7/igt@kms_busy@basic@flip.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-hsw6/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [FAIL][34] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][36] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][38] ([i915#52] / [i915#54]) -> [PASS][39] +7 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][40] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][42] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [FAIL][44] ([i915#79]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-apl2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][46] ([i915#79]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [DMESG-WARN][48] ([i915#180]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl6/igt@kms_flip@flip-vs-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-kbl7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [FAIL][50] ([i915#49]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [FAIL][52] ([i915#49]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-glk:          [FAIL][54] ([i915#49]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][56] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][58] ([fdo#109441]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][60] ([i915#31]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl8/igt@kms_setmode@basic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-apl2/igt@kms_setmode@basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][62] ([i915#1542]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw1/igt@perf@blocking-parameterized.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-hsw7/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][64] ([i915#454]) -> [FAIL][65] ([i915#454] / [i915#93] / [i915#95])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][66] ([i915#1515]) -> [WARN][67] ([i915#1515])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-snb:          [INCOMPLETE][68] ([i915#82]) -> [SKIP][69] ([fdo#109271])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-snb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-snb4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][70] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][71] ([i915#357])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl4/igt@kms_content_protection@uevent.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][72] ([i915#357] / [i915#95]) -> [FAIL][73] ([i915#357])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl3/igt@kms_content_protection@uevent.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/shard-apl3/igt@kms_content_protection@uevent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5572 -> IGTPW_4411
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8261: 80b64adc6f5ffeb1c69996737dbdc5ad275d8e6c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4411: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/index.html
  IGT_5572: 6c124b5c8501d900966c033ac86c3dc55c16a2da @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4411/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
