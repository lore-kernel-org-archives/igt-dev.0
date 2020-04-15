Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 11:57:48 -0000
Message-ID: <158695186809.21014.9885632226783368777@emeril.freedesktop.org>
References: <20200414190509.2868509-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200414190509.2868509-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBV?=
 =?utf-8?q?se_read=28=29_for_timerfd_timeout_detection?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Use read() for timerfd timeout detection
URL   : https://patchwork.freedesktop.org/series/75940/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8298_full -> IGTPW_4462_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4462_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4462_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4462_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-kbl:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-apl:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  
Known issues
------------

  Here are the changes found in IGTPW_4462_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#456] / [i915#460])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-tglb6/igt@gem_workarounds@suspend-resume-context.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-tglb6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [PASS][7] -> [FAIL][8] ([i915#1066])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-snb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#1566] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#52] / [i915#54]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#52] / [i915#54] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#899])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][39] ([fdo#109276]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][41] ([i915#716]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [SKIP][43] ([i915#1316] / [i915#579]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-iclb2/igt@i915_pm_rpm@dpms-lpsp.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-iclb2/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [SKIP][45] ([i915#1316] / [i915#579]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-tglb5/igt@i915_pm_rpm@dpms-lpsp.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-tglb2/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-glk:          [SKIP][47] ([fdo#109271]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-glk2/igt@i915_pm_rpm@sysfs-read.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-glk7/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl1/igt@i915_suspend@debugfs-reader.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][51] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][53] ([i915#72]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][55] ([i915#52] / [i915#54]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][57] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][59] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][61] ([i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl6/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][65] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][67] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-iclb7/igt@kms_psr@psr2_cursor_render.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][71] ([i915#31]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl4/igt@kms_setmode@basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][73] ([fdo#112015]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][75] ([fdo#109278]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][77] ([i915#454]) -> [SKIP][78] ([i915#468])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-snb:          [SKIP][79] ([fdo#109271]) -> [INCOMPLETE][80] ([i915#82])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-snb4/igt@i915_pm_rpm@drm-resources-equal.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-snb5/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][81] ([i915#180] / [i915#95]) -> [FAIL][82] ([i915#93] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          [FAIL][83] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][84] ([fdo#108145] / [i915#265]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][85] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][86] ([fdo#108145] / [i915#265]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][87], [FAIL][88]) ([i915#1423] / [i915#716]) -> [FAIL][89] ([i915#1423])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl3/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl3/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4462
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8298: 17f82f0c2857d0b442adbdb62eb44b61d0f5b775 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4462: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4462/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
