Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Nov 2020 23:39:57 -0000
Message-ID: <160556999720.30807.8541326241389995065@emeril.freedesktop.org>
References: <20201116165954.158540-1-apoorva1.singh@intel.com>
In-Reply-To: <20201116165954.158540-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fwait=3A_Add_description_for_test_and_subtests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1054033805=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1054033805==
Content-Type: multipart/alternative;
 boundary="===============9090872786209140961=="

--===============9090872786209140961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_wait: Add description for test and subtests
URL   : https://patchwork.freedesktop.org/series/83892/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9338_full -> IGTPW_5172_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5172_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5172_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5172_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@legacy-engines-hang@render:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb8/igt@gem_ctx_persistence@legacy-engines-hang@render.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb1/igt@gem_ctx_persistence@legacy-engines-hang@render.html

  * igt@gem_exec_parallel@fds@rcs0:
    - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk5/igt@gem_exec_parallel@fds@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk4/igt@gem_exec_parallel@fds@rcs0.html

  * igt@gem_exec_parallel@fds@vcs0:
    - shard-hsw:          [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-hsw8/igt@gem_exec_parallel@fds@vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw2/igt@gem_exec_parallel@fds@vcs0.html

  * igt@gem_exec_whisper@basic-contexts:
    - shard-hsw:          [PASS][7] -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-hsw6/igt@gem_exec_whisper@basic-contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw2/igt@gem_exec_whisper@basic-contexts.html

  
#### Warnings ####

  * igt@gem_exec_parallel@fds@bcs0:
    - shard-snb:          [FAIL][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-snb6/igt@gem_exec_parallel@fds@bcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-snb5/igt@gem_exec_parallel@fds@bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5172_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-snb:          [PASS][11] -> [INCOMPLETE][12] ([i915#1037])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_exec_create@forked:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#1888] / [i915#2676])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-hsw8/igt@gem_exec_create@forked.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw1/igt@gem_exec_create@forked.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk4/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#1888]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl7/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl4/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk7/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk3/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1635] / [i915#1982]) +6 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-iclb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#62])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([i915#1354]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb5/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@polling-small-buf:
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271] / [i915#1354])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk2/igt@perf@polling-small-buf.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk9/igt@perf@polling-small-buf.html
    - shard-tglb:         [PASS][45] -> [SKIP][46] ([i915#1354])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb2/igt@perf@polling-small-buf.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb2/igt@perf@polling-small-buf.html
    - shard-apl:          [PASS][47] -> [SKIP][48] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-apl7/igt@perf@polling-small-buf.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-apl7/igt@perf@polling-small-buf.html
    - shard-kbl:          [PASS][49] -> [SKIP][50] ([fdo#109271] / [i915#1354]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl3/igt@perf@polling-small-buf.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl1/igt@perf@polling-small-buf.html
    - shard-hsw:          [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-hsw2/igt@perf@polling-small-buf.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw1/igt@perf@polling-small-buf.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][53] ([i915#658]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb4/igt@feature_discovery@psr2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-snb:          [FAIL][55] -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-snb7/igt@gem_exec_suspend@basic-s4-devices.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-snb4/igt@gem_exec_suspend@basic-s4-devices.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][57] ([i915#2521]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb6/igt@kms_async_flips@alternate-sync-async-flip.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb8/igt@kms_async_flips@alternate-sync-async-flip.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-iclb:         [FAIL][59] ([i915#2521]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb5/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-glk:          [FAIL][61] ([i915#2521]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][63] ([i915#2597]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb6/igt@kms_async_flips@test-time-stamp.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb7/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge:
    - shard-tglb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb8/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb3/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
    - shard-apl:          [DMESG-WARN][67] ([i915#1635] / [i915#1982]) -> [PASS][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-apl8/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-glk:          [DMESG-WARN][69] ([i915#1982] / [i915#2295]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-tglb:         [FAIL][71] ([i915#2346]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-glk:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk8/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-glk:          [FAIL][77] ([i915#49]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-snb:          [FAIL][79] ([i915#2546]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch:
    - shard-kbl:          [DMESG-WARN][81] ([i915#165] / [i915#78]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl2/igt@kms_hdr@bpc-switch.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl6/igt@kms_hdr@bpc-switch.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-glk:          [INCOMPLETE][83] ([i915#2635]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-apl:          [INCOMPLETE][85] ([i915#1635] / [i915#2635]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-kbl:          [INCOMPLETE][87] ([i915#155] / [i915#648]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-iclb:         [INCOMPLETE][89] ([i915#1185] / [i915#250]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-hsw:          [INCOMPLETE][91] ([i915#2637]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-glk:          [FAIL][93] ([i915#2657]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk9/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-snb:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-snb2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-snb4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_plane_cursor@pipe-b-primary-size-128:
    - shard-kbl:          [DMESG-WARN][97] ([i915#78]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl2/igt@kms_plane_cursor@pipe-b-primary-size-128.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl1/igt@kms_plane_cursor@pipe-b-primary-size-128.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][101] ([i915#1982]) -> [PASS][102] +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
    - shard-iclb:         [DMESG-WARN][103] ([i915#1982]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@stress-open-close:
    - shard-kbl:          [SKIP][105] ([fdo#109271] / [i915#1354]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl2/igt@perf@stress-open-close.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl3/igt@perf@stress-open-close.html
    - shard-hsw:          [SKIP][107] ([fdo#109271]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-hsw8/igt@perf@stress-open-close.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw5/igt@perf@stress-open-close.html
    - shard-tglb:         [SKIP][109] ([i915#1354]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb6/igt@perf@stress-open-close.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb6/igt@perf@stress-open-close.html
    - shard-glk:          [SKIP][111] ([fdo#109271] / [i915#1354]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk5/igt@perf@stress-open-close.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk6/igt@perf@stress-open-close.html
    - shard-apl:          [SKIP][113] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-apl1/igt@perf@stress-open-close.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-apl2/igt@perf@stress-open-close.html
    - shard-iclb:         [SKIP][115] ([i915#1354]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb1/igt@perf@stress-open-close.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb7/igt@perf@stress-open-close.html

  
#### Warnings ####

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-hsw:          [FAIL][117] -> [DMESG-WARN][118] ([i915#1982])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-hsw8/igt@gem_exec_whisper@basic-contexts-forked.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw1/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-tglb:         [DMESG-WARN][119] ([i915#1982] / [i915#2411]) -> [DMESG-WARN][120] ([i915#2411])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb6/igt@i915_pm_rpm@pm-tiling.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb2/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-tglb:         [INCOMPLETE][121] ([i915#1436] / [i915#456]) -> [DMESG-WARN][122] ([i915#2411])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][123] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][124] ([fdo#108145] / [i915#1635] / [i915#265])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][125] ([fdo#109441]) -> [DMESG-WARN][126] ([i915#1982])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][127] ([fdo#109289]) -> [SKIP][128] ([i915#1354])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb3/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][129], [FAIL][130]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439]) -> [FAIL][131] ([i915#1611] / [i915#2295] / [i915#2439])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl7/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][132], [FAIL][133]) ([i915#1814] / [i915#2295] / [i915#2439] / [i915#483]) -> [FAIL][134] ([i915#2295] / [i915#2439] / [i915#483])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb6/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb4/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][135], [FAIL][136]) ([i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439] / [i915#62]) -> [FAIL][137] ([i915#1611] / [i915#1635] / [i915#2295] / [i915#2439])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-apl7/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-apl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][138], [FAIL][139]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [k.org#202321]) -> ([FAIL][140], [FAIL][141]) ([i915#1611] / [i915#2295] / [i915#2426] / [i915#2439] / [k.org#202321])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk1/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk4/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk4/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk9/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][142], [FAIL][143]) ([i915#1814] / [i915#2295] / [i915#2439]) -> [FAIL][144] ([i915#2295] / [i915#2439])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb2/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb2/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2657]: https://gitlab.freedesktop.org/drm/intel/issues/2657
  [i915#2676]: https://gitlab.freedesktop.org/drm/intel/issues/2676
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5854 -> IGTPW_5172
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9338: 994881297675ccca3caf7348ee0dc36cdbd47cef @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5172: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/index.ht

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/index.html

--===============9090872786209140961==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>i915/gem_wait: Add description for test and =
subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83892/">https://patchwork.freedesktop.org/series/83892/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5172/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5172/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9338_full -&gt; IGTPW_5172_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5172_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5172_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5172=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@render:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-tglb8/igt@gem_ctx_persistence@legacy-engines-hang@render=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5172/shard-tglb1/igt@gem_ctx_persistence@legacy-engines-hang@render.ht=
ml">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@fds@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-glk5/igt@gem_exec_parallel@fds@rcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk4/=
igt@gem_exec_parallel@fds@rcs0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@fds@vcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-hsw8/igt@gem_exec_parallel@fds@vcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw2/=
igt@gem_exec_parallel@fds@vcs0.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-hsw6/igt@gem_exec_whisper@basic-contexts.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-=
hsw2/igt@gem_exec_whisper@basic-contexts.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_exec_parallel@fds@bcs0:<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-snb6/igt@gem_exec_parallel@fds@bcs0.html">FAIL</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-snb5/=
igt@gem_exec_parallel@fds@bcs0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5172_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/sha=
rd-snb6/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-hsw8/igt@gem_exec_create@forked.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw1/igt@=
gem_exec_create@forked.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2676">i915#2676</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shar=
d-glk4/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sync-unmap-cycles:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/sh=
ard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) +1 si=
milar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-kbl7/igt@kms_cursor_legacy@short-flip-before-cursor-togg=
le.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5172/shard-kbl4/igt@kms_cursor_legacy@short-flip-before-cursor-toggl=
e.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untile=
d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5172/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
52">i915#52</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/54">i915#54</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-glk7/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/=
shard-glk3/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982<=
/a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
172/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-sh=
rfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5172/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-of=
fscren-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5172/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mm=
ap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5172/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw=
-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5172/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb6/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-=
iclb3/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5172/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-iclb5/igt@perf@gen8-unprivileged-single-ctx-counters.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5172/shard-iclb1/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915=
#1354</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-glk2/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk9/igt@p=
erf@polling-small-buf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-tglb2/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb2/igt=
@perf@polling-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-apl7/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-apl7/igt@p=
erf@polling-small-buf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</=
p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-kbl3/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl1/igt@p=
erf@polling-small-buf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-hsw2/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-hsw1/igt@p=
erf@polling-small-buf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-iclb4/igt@feature_discovery@psr2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb=
2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-snb7/igt@gem_exec_suspend@basic-s4-devices.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shar=
d-snb4/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-tglb6/igt@kms_async_flips@alternate-sync-async-flip.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2521=
">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5172/shard-tglb8/igt@kms_async_flips@alternate-sync-async-flip.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-iclb2/igt@kms_async_flips@async-flip-with-page-flip-event=
s.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5172/shard-iclb5/igt@kms_async_flips@async-flip-with-page-flip-=
events.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5172/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-ev=
ents.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172=
/shard-tglb7/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-tglb8/igt@kms_cursor_edge_walk@pipe-b-128x128-right-edge=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5172/shard-tglb3/igt@kms_cursor_edge_walk@pipe-b-128x128-r=
ight-edge.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5172/shard-apl8/igt@kms_cursor_edge_walk@pipe-c-256x=
256-bottom-edge.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-glk4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transit=
ions.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2295">i915#2295</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5172/shard-glk2/igt@kms_cursor_legacy@cursor-vs-=
flip-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">=
i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5172/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5172/shard-glk8/igt@kms_draw_crc@draw-method-xrgb8888-rend=
er-xtiled.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a=
1.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5172/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hd=
mi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-in=
dfb-draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5172/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-c=
pu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5172/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-m=
map-cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-kbl2/igt@kms_hdr@bpc-switch.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-k=
bl6/igt@kms_hdr@bpc-switch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5172/shard-glk2/igt@kms_plane@plane-panning-bott=
om-right-suspend-pipe-a-planes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-apl4/igt@kms_plane@plane-pannin=
g-bottom-right-suspend-pipe-a-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/155">i915#155</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/648">i915#648</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl4/igt@kms_plane@plane-panning-bo=
ttom-right-suspend-pipe-a-planes.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1185">i915#1185</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/250">i915#250</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb2/igt@kms_plane@plane-pannin=
g-bottom-right-suspend-pipe-a-planes.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5172/shard-hsw7/igt@kms_plane@plane-panning-bott=
om-right-suspend-pipe-a-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-overlay-size-256:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-glk9/igt@kms_plane_cursor@pipe-a-overlay-size-256.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2657">=
i915#2657</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5172/shard-glk2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-viewport-size-64:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-snb2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5172/shard-snb4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-primary-size-128:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-kbl2/igt@kms_plane_cursor@pipe-b-primary-size-128.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
78">i915#78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5172/shard-kbl1/igt@kms_plane_cursor@pipe-b-primary-size-128.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/=
shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-feature=
s-pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5172/shard-kbl7/igt@kms_universal_plane@universal-=
plane-gen9-features-pipe-a.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-iclb7/igt@kms_universal_plane@universal-plane-gen9-featur=
es-pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5172/shard-iclb7/igt@kms_universal_plane@universa=
l-plane-gen9-features-pipe-a.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-kbl2/igt@perf@stress-open-close.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/=
shard-kbl3/igt@perf@stress-open-close.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-hsw8/igt@perf@stress-open-close.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-=
hsw5/igt@perf@stress-open-close.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-tglb6/igt@perf@stress-open-close.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tg=
lb6/igt@perf@stress-open-close.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-glk5/igt@perf@stress-open-close.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/=
shard-glk6/igt@perf@stress-open-close.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-apl1/igt@perf@stress-open-close.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5172/shard-apl2/igt@perf@stress-open-close.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9338/shard-iclb1/igt@perf@stress-open-close.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-ic=
lb7/igt@perf@stress-open-close.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-hsw8/igt@gem_exec_whisper@basic-contexts-forked.html">FA=
IL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172=
/shard-hsw1/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#198=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-tglb6/igt@i915_pm_rpm@pm-tiling.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2=
411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
72/shard-tglb2/igt@i915_pm_rpm@pm-tiling.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-p=
ipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-tglb5/igt@kms_plane@plane-panni=
ng-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">D=
MESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
8145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5172/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alp=
ha-7efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_517=
2/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)=
</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
89">fdo#109289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5172/shard-tglb3/igt@perf@gen8-unprivileged-single-ctx-counters.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
54">i915#1354</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-kbl7/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-kbl7/igt@runner@aborted.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i9=
15#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-iclb4/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-iclb7/igt@runner@aborted.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i=
915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-apl7/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-apl4/igt@runner@aborted.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-glk4/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://bugzilla.ker=
nel.org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/shard-glk4/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5172/shard-glk9/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> =
/ <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#20=
2321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9338/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9338/shard-tglb2/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5172/shard-tglb1/igt@runner@aborted.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#=
2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439"=
>i915#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5854 -&gt; IGTPW_5172</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9338: 994881297675ccca3caf7348ee0dc36cdbd47cef @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5172: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5172/index.ht<=
/p>

</body>
</html>

--===============9090872786209140961==--

--===============1054033805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1054033805==--
