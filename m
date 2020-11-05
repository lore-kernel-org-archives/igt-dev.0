Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Nov 2020 02:00:36 -0000
Message-ID: <160454163612.14958.7619863437108034595@emeril.freedesktop.org>
References: <20201104222321.4078393-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201104222321.4078393-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fparallel=3A_Reopen_the_existing_device?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1314145303=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1314145303==
Content-Type: multipart/alternative;
 boundary="===============4937374166366726380=="

--===============4937374166366726380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_parallel: Reopen the existing device
URL   : https://patchwork.freedesktop.org/series/83514/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9265_full -> IGTPW_5130_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/index.html

Known issues
------------

  Here are the changes found in IGTPW_5130_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ringfill@basic-all:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2] ([i915#82])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb7/igt@gem_ringfill@basic-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-snb4/igt@gem_ringfill@basic-all.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][3] -> [SKIP][4] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk5/igt@i915_pm_rpm@system-suspend-modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk1/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#579])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb7/igt@i915_pm_rpm@system-suspend-modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb4/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-apl:          [PASS][7] -> [SKIP][8] ([fdo#109271] / [i915#1635])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl3/igt@i915_pm_rpm@system-suspend-modeset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-kbl:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@i915_pm_rpm@system-suspend-modeset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl6/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-a:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#62])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-a.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#1982]) +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl4/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk8/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk2/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#96])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw2/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - shard-snb:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb5/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-snb7/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb5/igt@kms_psr@psr2_no_drrs.html

  * igt@perf@blocking:
    - shard-hsw:          [PASS][33] -> [SKIP][34] ([fdo#109271]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw4/igt@perf@blocking.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw2/igt@perf@blocking.html
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#1354]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb5/igt@perf@blocking.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb8/igt@perf@blocking.html

  * igt@perf@disabled-read-error:
    - shard-kbl:          [PASS][37] -> [SKIP][38] ([fdo#109271] / [i915#1354]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl6/igt@perf@disabled-read-error.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl7/igt@perf@disabled-read-error.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271] / [i915#1354] / [i915#1635]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl2/igt@perf@invalid-oa-metric-set-id.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl4/igt@perf@invalid-oa-metric-set-id.html
    - shard-glk:          [PASS][41] -> [SKIP][42] ([fdo#109271] / [i915#1354]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk5/igt@perf@invalid-oa-metric-set-id.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk7/igt@perf@invalid-oa-metric-set-id.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([i915#1354]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb7/igt@perf@rc6-disable.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb2/igt@perf@rc6-disable.html
    - shard-tglb:         [PASS][45] -> [SKIP][46] ([fdo#111719] / [i915#1354])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@perf@rc6-disable.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb8/igt@perf@rc6-disable.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][47] ([i915#658]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb6/igt@feature_discovery@psr2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [FAIL][49] ([i915#2389]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [DMESG-WARN][51] ([i915#118] / [i915#95]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk2/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-hsw:          [FAIL][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw7/igt@gem_exec_whisper@basic-normal-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw4/igt@gem_exec_whisper@basic-normal-all.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-iclb:         [FAIL][55] -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb7/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt:
    - shard-hsw:          [FAIL][57] ([i915#1888]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:
    - shard-snb:          [INCOMPLETE][59] ([i915#82]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb.html

  * igt@i915_suspend@forcewake:
    - shard-iclb:         [INCOMPLETE][61] ([i915#1185]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb3/igt@i915_suspend@forcewake.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb6/igt@i915_suspend@forcewake.html
    - shard-kbl:          [INCOMPLETE][63] ([i915#155] / [i915#636]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl7/igt@i915_suspend@forcewake.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl7/igt@i915_suspend@forcewake.html
    - shard-hsw:          [INCOMPLETE][65] ([i915#2055]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw8/igt@i915_suspend@forcewake.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw4/igt@i915_suspend@forcewake.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][67] ([i915#2521]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-apl:          [FAIL][69] ([i915#1635] / [i915#2521]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-tglb:         [FAIL][71] ([i915#2346]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled:
    - shard-iclb:         [FAIL][73] ([i915#52] / [i915#54]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk8/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-apl:          [DMESG-WARN][77] ([i915#1635] / [i915#1982]) -> [PASS][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
    - shard-kbl:          [DMESG-WARN][79] ([i915#1982]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [FAIL][83] ([i915#2546]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         [FAIL][85] ([i915#49]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-glk:          [FAIL][87] ([i915#49]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence:
    - shard-glk:          [FAIL][89] ([i915#53]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-glk:          [INCOMPLETE][91] -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-apl:          [INCOMPLETE][93] ([i915#1635]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-kbl:          [INCOMPLETE][95] ([i915#155]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-hsw:          [INCOMPLETE][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb3/igt@kms_psr@psr2_sprite_render.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@sysfs_heartbeat_interval@mixed@vcs0:
    - shard-kbl:          [INCOMPLETE][101] ([i915#1731]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@sysfs_heartbeat_interval@mixed@vcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl1/igt@sysfs_heartbeat_interval@mixed@vcs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][103] ([i915#1515]) -> [WARN][104] ([i915#1515])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-tglb:         [DMESG-WARN][105] ([i915#2411]) -> [SKIP][106] ([i915#579])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@i915_pm_rpm@system-suspend-modeset.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb7/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_suspend@forcewake:
    - shard-tglb:         [INCOMPLETE][107] ([i915#1436] / [i915#456]) -> [DMESG-WARN][108] ([i915#2411])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@i915_suspend@forcewake.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb6/igt@i915_suspend@forcewake.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [INCOMPLETE][109] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][110] ([i915#2411])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#636]: https://gitlab.freedesktop.org/drm/intel/issues/636
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5832 -> IGTPW_5130
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9265: 4152d4ab08d937cfb9254d0e880f1daea64db549 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5130: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/index.html
  IGT_5832: 9c583f7e2a6638b5ff6a3682fea548a1313512e7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/index.html

--===============4937374166366726380==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_parallel: Reopen the existing device</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83514/">https://patchwork.freedesktop.org/series/83514/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9265_full -&gt; IGTPW_5130_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5130_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ringfill@basic-all:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb7/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-snb4/igt@gem_ringfill@basic-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk5/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk1/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb7/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb4/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl3/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl6/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl4/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk8/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk2/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw2/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb5/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-snb7/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb5/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@blocking:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw4/igt@perf@blocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw2/igt@perf@blocking.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb5/igt@perf@blocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb8/igt@perf@blocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl6/igt@perf@disabled-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl7/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-metric-set-id:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl2/igt@perf@invalid-oa-metric-set-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl4/igt@perf@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk5/igt@perf@invalid-oa-metric-set-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk7/igt@perf@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@rc6-disable:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb7/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb2/igt@perf@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb8/igt@perf@rc6-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111719">fdo#111719</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb6/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk2/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw7/igt@gem_exec_whisper@basic-normal-all.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw4/igt@gem_exec_whisper@basic-normal-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb7/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb3/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb6/igt@i915_suspend@forcewake.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl7/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/636">i915#636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl7/igt@i915_suspend@forcewake.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw8/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw4/igt@i915_suspend@forcewake.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/52">i915#52</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk8/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb3/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-kbl1/igt@sysfs_heartbeat_interval@mixed@vcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-kbl1/igt@sysfs_heartbeat_interval@mixed@vcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@i915_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb7/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb8/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb6/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9265/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5832 -&gt; IGTPW_5130</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9265: 4152d4ab08d937cfb9254d0e880f1daea64db549 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5130: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5130/index.html<br />
  IGT_5832: 9c583f7e2a6638b5ff6a3682fea548a1313512e7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4937374166366726380==--

--===============1314145303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1314145303==--
