Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Nov 2020 12:20:26 -0000
Message-ID: <160492442624.18041.15324076477569375547@emeril.freedesktop.org>
References: <20201109104811.3773962-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20201109104811.3773962-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVXNlciBm?=
 =?utf-8?q?riendly_lsgpu_default_output?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0232160720=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0232160720==
Content-Type: multipart/alternative;
 boundary="===============6828804427223621972=="

--===============6828804427223621972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: User friendly lsgpu default output
URL   : https://patchwork.freedesktop.org/series/83639/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9295_full -> IGTPW_5145_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5145_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5145_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5145_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-snb5/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-snb2/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-snb:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-snb7/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-snb7/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][5] ([i915#454]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_pwrite@basic-exhaustion}:
    - shard-hsw:          NOTRUN -> [WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw1/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk5/igt@gem_pwrite@basic-exhaustion.html

  
Known issues
------------

  Here are the changes found in IGTPW_5145_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10] ([i915#2502])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb8/igt@gem_exec_endless@dispatch@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb3/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk1/igt@gem_exec_whisper@basic-fds-priority.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk9/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#454])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@forcewake:
    - shard-iclb:         [PASS][15] -> [INCOMPLETE][16] ([i915#1185])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb5/igt@i915_suspend@forcewake.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@i915_suspend@forcewake.html
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([i915#155] / [i915#636])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl6/igt@i915_suspend@forcewake.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl7/igt@i915_suspend@forcewake.html
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#2055] / [i915#2637])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw8/igt@i915_suspend@forcewake.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw1/igt@i915_suspend@forcewake.html
    - shard-glk:          [PASS][21] -> [INCOMPLETE][22] ([i915#2635])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk3/igt@i915_suspend@forcewake.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk6/igt@i915_suspend@forcewake.html
    - shard-apl:          [PASS][23] -> [INCOMPLETE][24] ([i915#1635] / [i915#2635])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl3/igt@i915_suspend@forcewake.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl6/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-iclb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#52] / [i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#2122])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#2598])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#79])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#1635] / [i915#79])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-snb:          [PASS][43] -> [FAIL][44] ([i915#2546]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#49])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-tglb:         [PASS][47] -> [DMESG-WARN][48] ([i915#1982]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_vblank@pipe-b-query-forked-busy:
    - shard-apl:          [PASS][51] -> [DMESG-WARN][52] ([i915#1635] / [i915#1982]) +6 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl3/igt@kms_vblank@pipe-b-query-forked-busy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl1/igt@kms_vblank@pipe-b-query-forked-busy.html

  * igt@perf@non-system-wide-paranoid:
    - shard-apl:          [PASS][53] -> [SKIP][54] ([fdo#109271] / [i915#1354] / [i915#1635])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl4/igt@perf@non-system-wide-paranoid.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl4/igt@perf@non-system-wide-paranoid.html
    - shard-glk:          [PASS][55] -> [SKIP][56] ([fdo#109271] / [i915#1354])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk3/igt@perf@non-system-wide-paranoid.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk5/igt@perf@non-system-wide-paranoid.html
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([i915#1354])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb8/igt@perf@non-system-wide-paranoid.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb2/igt@perf@non-system-wide-paranoid.html
    - shard-kbl:          [PASS][59] -> [SKIP][60] ([fdo#109271] / [i915#1354])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl2/igt@perf@non-system-wide-paranoid.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl7/igt@perf@non-system-wide-paranoid.html
    - shard-tglb:         [PASS][61] -> [SKIP][62] ([i915#1354])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb5/igt@perf@non-system-wide-paranoid.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb5/igt@perf@non-system-wide-paranoid.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [PASS][63] -> [FAIL][64] ([i915#1542])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw1/igt@perf@polling-parameterized.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw6/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_create@forked:
    - shard-glk:          [DMESG-WARN][65] ([i915#118] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk3/igt@gem_exec_create@forked.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk8/igt@gem_exec_create@forked.html

  * igt@gem_linear_blits@normal:
    - shard-hsw:          [FAIL][67] ([i915#1263] / [i915#1888]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw4/igt@gem_linear_blits@normal.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw7/igt@gem_linear_blits@normal.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-hsw:          [FAIL][69] ([i915#2261]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw4/igt@gem_partial_pwrite_pread@reads-display.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw7/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-glk:          [SKIP][71] ([fdo#109271]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk5/igt@i915_pm_rpm@system-suspend-modeset.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk8/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-iclb:         [SKIP][73] ([i915#579]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb4/igt@i915_pm_rpm@system-suspend-modeset.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb4/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-apl:          [SKIP][75] ([fdo#109271] / [i915#1635]) -> [PASS][76] +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl3/igt@i915_pm_rpm@system-suspend-modeset.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl4/igt@i915_pm_rpm@system-suspend-modeset.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][77] ([i915#2521]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl7/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl6/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-iclb:         [FAIL][79] ([i915#2521]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb1/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-glk:          [FAIL][81] ([i915#2521]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk7/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk9/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-apl:          [FAIL][83] ([i915#1635] / [i915#2521]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-kbl:          [DMESG-WARN][85] ([i915#1982]) -> [PASS][86] +6 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl6/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-hsw:          [INCOMPLETE][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [INCOMPLETE][89] ([i915#1635] / [i915#2635]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-iclb:         [INCOMPLETE][91] ([i915#1185]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-glk:          [INCOMPLETE][93] ([i915#2635]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-hsw:          [INCOMPLETE][95] ([i915#2637]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [INCOMPLETE][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [DMESG-WARN][99] ([i915#1982]) -> [PASS][100] +8 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:
    - shard-apl:          [DMESG-WARN][101] ([i915#1635] / [i915#1982]) -> [PASS][102] +5 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][103] ([i915#96]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-iclb:         [DMESG-WARN][105] -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb7/igt@kms_dp_aux_dev.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb2/igt@kms_dp_aux_dev.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-vga1:
    - shard-hsw:          [DMESG-WARN][107] ([i915#1982]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw6/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-vga1.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw8/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          [FAIL][109] ([i915#2546]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-iclb:         [SKIP][111] ([i915#433]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a:
    - shard-snb:          [FAIL][113] -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-snb4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-snb4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][115] ([fdo#109642] / [fdo#111068]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][117] ([fdo#109441]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [SKIP][119] ([fdo#109271]) -> [PASS][120] +6 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-kbl:          [SKIP][121] ([fdo#109271]) -> [PASS][122] +4 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][123] ([fdo#109278]) -> [PASS][124] +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb4/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [SKIP][125] ([fdo#109271] / [i915#1354]) -> [PASS][126] +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk8/igt@perf@disabled-read-error.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk8/igt@perf@disabled-read-error.html
    - shard-apl:          [SKIP][127] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl6/igt@perf@disabled-read-error.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl2/igt@perf@disabled-read-error.html
    - shard-kbl:          [SKIP][129] ([fdo#109271] / [i915#1354]) -> [PASS][130] +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl1/igt@perf@disabled-read-error.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl7/igt@perf@disabled-read-error.html
    - shard-tglb:         [SKIP][131] ([i915#1354]) -> [PASS][132] +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb1/igt@perf@disabled-read-error.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb5/igt@perf@disabled-read-error.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-iclb:         [SKIP][133] ([i915#1354]) -> [PASS][134] +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb2/igt@perf@invalid-remove-userspace-config.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@perf@invalid-remove-userspace-config.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [DMESG-WARN][135] ([i915#1982]) -> [PASS][136] +4 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb2/igt@perf_pmu@module-unload.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb2/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@feature_discovery@psr2:
    - shard-kbl:          [INCOMPLETE][137] -> [SKIP][138] ([fdo#109271])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl6/igt@feature_discovery@psr2.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl4/igt@feature_discovery@psr2.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][139] ([i915#588]) -> [SKIP][140] ([i915#658])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-tglb:         [SKIP][141] ([i915#579]) -> [DMESG-WARN][142] ([i915#2411]) +2 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb5/igt@i915_pm_rpm@gem-pread.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb5/igt@i915_pm_rpm@gem-pread.html
    - shard-glk:          [SKIP][143] ([fdo#109271]) -> [DMESG-WARN][144] ([i915#1982])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk1/igt@i915_pm_rpm@gem-pread.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk8/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][145] ([fdo#109293] / [fdo#109506]) -> [SKIP][146] ([i915#579])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         [SKIP][147] ([fdo#109506] / [i915#2411]) -> [SKIP][148] ([i915#579])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb7/igt@i915_pm_rpm@pc8-residency.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb8/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_suspend@forcewake:
    - shard-tglb:         [DMESG-WARN][149] ([i915#2411]) -> [DMESG-WARN][150] ([i915#1436] / [i915#1887] / [i915#2411])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb1/igt@i915_suspend@forcewake.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb8/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][151] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][152] ([i915#2411])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [DMESG-WARN][153] ([i915#2411]) -> [DMESG-WARN][154] ([i915#1982] / [i915#2411])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][155] -> [DMESG-WARN][156] ([i915#2411]) +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][157] ([i915#1436] / [i915#456]) -> [DMESG-WARN][158] ([i915#2411])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][159] -> [FAIL][160] ([i915#2439] / [i915#483])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw7/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw1/igt@runner@aborted.html
    - shard-iclb:         [FAIL][161] ([i915#1814]) -> [FAIL][162] ([i915#2439] / [i915#483])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb4/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@runner@aborted.html
    - shard-apl:          [FAIL][163] ([i915#1635] / [i915#1814]) -> [FAIL][164] ([i915#1635] / [i915#2439])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl3/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl6/igt@runner@aborted.html
    - shard-glk:          [FAIL][165] ([i915#1814] / [k.org#202321]) -> [FAIL][166] ([i915#2439] / [k.org#202321])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk5/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk6/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][167], [FAIL][168]) ([i915#1602]) -> [FAIL][169] ([i915#1602] / [i915#2439])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb6/igt@run

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/index.html

--===============6828804427223621972==
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
<tr><td><b>Series:</b></td><td>User friendly lsgpu default output</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83639/">https://patchwork.freedesktop.org/series/83639/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9295_full -&gt; IGTPW_5145_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5145_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5145_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5145_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-snb5/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-snb2/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-snb7/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-snb7/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_dc@dc6-dpms:<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@gem_pwrite@basic-exhaustion}:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw1/igt@gem_pwrite@basic-exhaustion.html">WARN</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk5/igt@gem_pwrite@basic-exhaustion.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5145_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb8/igt@gem_exec_endless@dispatch@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb3/igt@gem_exec_endless@dispatch@rcs0.html">INCOMPLETE</a> ([i915#2502])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk1/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk9/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb5/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#1185])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl6/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl7/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#155] / [i915#636])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw8/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw1/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#2055] / [i915#2637])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk3/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk6/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#2635])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl3/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl6/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#1635] / [i915#2635])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#1982]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#1982]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html">FAIL</a> ([i915#52] / [i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">FAIL</a> ([i915#1635] / [i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a> ([i915#2546]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">DMESG-WARN</a> ([i915#1982]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl3/igt@kms_vblank@pipe-b-query-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl1/igt@kms_vblank@pipe-b-query-forked-busy.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl4/igt@perf@non-system-wide-paranoid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl4/igt@perf@non-system-wide-paranoid.html">SKIP</a> ([fdo#109271] / [i915#1354] / [i915#1635])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk3/igt@perf@non-system-wide-paranoid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk5/igt@perf@non-system-wide-paranoid.html">SKIP</a> ([fdo#109271] / [i915#1354])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb8/igt@perf@non-system-wide-paranoid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb2/igt@perf@non-system-wide-paranoid.html">SKIP</a> ([i915#1354])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl2/igt@perf@non-system-wide-paranoid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl7/igt@perf@non-system-wide-paranoid.html">SKIP</a> ([fdo#109271] / [i915#1354])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb5/igt@perf@non-system-wide-paranoid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb5/igt@perf@non-system-wide-paranoid.html">SKIP</a> ([i915#1354])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw1/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw6/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk3/igt@gem_exec_create@forked.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk8/igt@gem_exec_create@forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@normal:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw4/igt@gem_linear_blits@normal.html">FAIL</a> ([i915#1263] / [i915#1888]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw7/igt@gem_linear_blits@normal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw4/igt@gem_partial_pwrite_pread@reads-display.html">FAIL</a> ([i915#2261]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw7/igt@gem_partial_pwrite_pread@reads-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk5/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk8/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb4/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb4/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl3/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> ([fdo#109271] / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl4/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl7/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> ([i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb1/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> ([i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb1/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk7/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> ([i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk9/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> ([i915#1635] / [i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl1/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl6/igt@kms_big_fb@linear-16bpp-rotate-180.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl1/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-random:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#1635] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#1185]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> ([i915#96]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb7/igt@kms_dp_aux_dev.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb2/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw6/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-vga1.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw8/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> ([i915#2546]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb1/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-snb4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-snb4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb7/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +6 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb4/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> ([fdo#109278]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk8/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk8/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl6/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354] / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl2/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl1/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl7/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb1/igt@perf@disabled-read-error.html">SKIP</a> ([i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb5/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-remove-userspace-config:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb2/igt@perf@invalid-remove-userspace-config.html">SKIP</a> ([i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@perf@invalid-remove-userspace-config.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb2/igt@perf_pmu@module-unload.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb2/igt@perf_pmu@module-unload.html">PASS</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-kbl6/igt@feature_discovery@psr2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-kbl4/igt@feature_discovery@psr2.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-pread:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb5/igt@i915_pm_rpm@gem-pread.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb5/igt@i915_pm_rpm@gem-pread.html">DMESG-WARN</a> ([i915#2411]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk1/igt@i915_pm_rpm@gem-pread.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk8/igt@i915_pm_rpm@gem-pread.html">DMESG-WARN</a> ([i915#1982])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109293] / [fdo#109506]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb7/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb8/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb1/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb8/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#1436] / [i915#1887] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-WARN</a> ([i915#1982] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">DMESG-WARN</a> ([i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-hsw7/igt@runner@aborted.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-hsw1/igt@runner@aborted.html">FAIL</a> ([i915#2439] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-iclb4/igt@runner@aborted.html">FAIL</a> ([i915#1814]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-iclb6/igt@runner@aborted.html">FAIL</a> ([i915#2439] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-apl3/igt@runner@aborted.html">FAIL</a> ([i915#1635] / [i915#1814]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-apl6/igt@runner@aborted.html">FAIL</a> ([i915#1635] / [i915#2439])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-glk5/igt@runner@aborted.html">FAIL</a> ([i915#1814] / [k.org#202321]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5145/shard-glk6/igt@runner@aborted.html">FAIL</a> ([i915#2439] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9295/shard-tglb6/igt@run">FAIL</a>, [FAIL][168]) ([i915#1602]) -&gt; [FAIL][169] ([i915#1602] / [i915#2439])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6828804427223621972==--

--===============0232160720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0232160720==--
