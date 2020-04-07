Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Apr 2020 02:43:15 -0000
Message-ID: <158622739579.26327.917990898048700571@emeril.freedesktop.org>
References: <20200406180532.30762-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200406180532.30762-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengi?=
 =?utf-8?q?ne_to_utilize_all_available_=28rev4=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available (rev4)
URL   : https://patchwork.freedesktop.org/series/75536/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8261_full -> IGTPW_4418_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4418_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf_pmu@event-wait@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-iclb6/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-tglb6/igt@perf_pmu@event-wait@rcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8261_full and IGTPW_4418_full:

### New IGT tests (7) ###

  * igt@gem_sync@basic_sync_ring:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@basic_sync_ring@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [20.02, 20.36] s

  * igt@gem_sync@basic_sync_ring@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [20.04, 20.30] s

  * igt@gem_sync@basic_sync_ring@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [20.02, 20.16] s

  * igt@gem_sync@basic_sync_ring@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [20.03, 20.07] s

  * igt@gem_sync@basic_sync_ring@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [20.02, 20.07] s

  * igt@perf_pmu@event-wait@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4418_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl7/igt@gem_eio@in-flight-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-kbl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-iclb5/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#454])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl3/igt@i915_suspend@forcewake.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-apl6/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#1119] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#1119] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#96])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#52] / [i915#54]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#34])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#53] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#53] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#1559] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1559] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-hsw8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-glk8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109278])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-tglb:         [PASS][39] -> [SKIP][40] ([fdo#112015])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][41] ([i915#180] / [i915#95]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-apl6/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][43] ([i915#1316] / [i915#579]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb1/igt@i915_pm_rpm@cursor.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-tglb8/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][45] ([fdo#109271]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw7/igt@i915_pm_rpm@cursor.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-hsw7/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [SKIP][47] ([fdo#109271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk4/igt@i915_pm_rpm@cursor.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-glk1/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [SKIP][49] ([i915#1316] / [i915#579]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-iclb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-apl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_busy@basic@flip:
    - shard-hsw:          [INCOMPLETE][53] ([i915#61]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw7/igt@kms_busy@basic@flip.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-hsw4/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [FAIL][55] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][57] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [FAIL][59] ([i915#52] / [i915#54]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][61] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-apl8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][65] ([i915#79]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [FAIL][67] ([i915#49]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [FAIL][69] ([i915#49]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-glk:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb4/igt@kms_psr@psr2_dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][77] ([i915#1542]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw1/igt@perf@polling-parameterized.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-hsw8/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][79] ([i915#1515]) -> [WARN][80] ([i915#1515])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-snb:          [INCOMPLETE][81] ([i915#82]) -> [SKIP][82] ([fdo#109271])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-snb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-snb4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][83] ([fdo#109293] / [fdo#109506]) -> [SKIP][84] ([i915#1316] / [i915#579])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb1/igt@i915_pm_rpm@pc8-residency.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-iclb8/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         [SKIP][85] ([fdo#109506]) -> [SKIP][86] ([i915#1316] / [i915#579])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/shard-tglb3/igt@i915_pm_rpm@pc8-residency.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5572 -> IGTPW_4418
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8261: 80b64adc6f5ffeb1c69996737dbdc5ad275d8e6c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4418: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/index.html
  IGT_5572: 6c124b5c8501d900966c033ac86c3dc55c16a2da @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4418/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
