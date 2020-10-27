Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 27 Oct 2020 23:04:38 -0000
Message-ID: <160383987890.26911.12496031004933421206@emeril.freedesktop.org>
References: <20201026130811.11136-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20201026130811.11136-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_fix_pixel_format_=28-clamping=29_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0555896340=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0555896340==
Content-Type: multipart/alternative;
 boundary="===============5753837014963948442=="

--===============5753837014963948442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: fix pixel format (-clamping) tests
URL   : https://patchwork.freedesktop.org/series/83041/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9202_full -> IGTPW_5098_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5098_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5098_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5098_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][4] +12 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@sw_sync@sync_busy_fork:
    - shard-hsw:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw6/igt@sw_sync@sync_busy_fork.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw2/igt@sw_sync@sync_busy_fork.html

  
Known issues
------------

  Here are the changes found in IGTPW_5098_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_await@wide-contexts:
    - shard-snb:          [PASS][9] -> [INCOMPLETE][10] ([i915#82])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-snb5/igt@gem_exec_await@wide-contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-snb2/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk3/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#1888])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw4/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw7/igt@gem_ppgtt@blt-vs-render-ctxn.html
    - shard-glk:          [PASS][15] -> [INCOMPLETE][16] ([i915#1888])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk7/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk9/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#1982]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#96])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk9/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1635] / [i915#2346])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp1:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1635] / [i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-iclb:         [PASS][27] -> [INCOMPLETE][28] ([i915#123] / [i915#2606])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-iclb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@invalid-oa-exponent:
    - shard-hsw:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw2/igt@perf@invalid-oa-exponent.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw7/igt@perf@invalid-oa-exponent.html
    - shard-apl:          [PASS][33] -> [SKIP][34] ([fdo#109271] / [i915#1354] / [i915#1635])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl4/igt@perf@invalid-oa-exponent.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl7/igt@perf@invalid-oa-exponent.html
    - shard-kbl:          [PASS][35] -> [SKIP][36] ([fdo#109271] / [i915#1354])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-kbl4/igt@perf@invalid-oa-exponent.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-kbl7/igt@perf@invalid-oa-exponent.html

  
#### Possible fixes ####

  * igt@gem_exec_create@basic:
    - shard-snb:          [INCOMPLETE][37] ([i915#82]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-snb5/igt@gem_exec_create@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-snb5/igt@gem_exec_create@basic.html
    - shard-hsw:          [FAIL][39] ([i915#1888]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw4/igt@gem_exec_create@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw6/igt@gem_exec_create@basic.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [FAIL][41] ([i915#1888] / [i915#2545]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk4/igt@gem_exec_create@madvise.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk2/igt@gem_exec_create@madvise.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][43] ([i915#2389]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk7/igt@gem_exec_whisper@basic-fds-forked-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk6/igt@gem_exec_whisper@basic-fds-forked-all.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][47] ([i915#2521]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk6/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk1/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-apl:          [FAIL][49] ([i915#1635] / [i915#2521]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-kbl:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-kbl4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-kbl2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge:
    - shard-hsw:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw6/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw1/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-apl:          [DMESG-WARN][55] ([i915#1635] / [i915#1982]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
    - shard-glk:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [INCOMPLETE][59] ([i915#1635]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-iclb:         [INCOMPLETE][61] ([i915#123]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][63] ([i915#1635]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  
#### Warnings ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-hsw:          [FAIL][65] ([i915#183]) -> [SKIP][66] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw4/igt@gem_tiled_swapping@non-threaded.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw6/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         [INCOMPLETE][67] ([i915#123]) -> [DMESG-WARN][68] ([i915#2606])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][69] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][70] ([fdo#108145] / [i915#1635] / [i915#1982])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@runner@aborted:
    - shard-tglb:         ([FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76], [FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82], [FAIL][83], [FAIL][84], [FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90], [FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95]) ([i915#1764] / [i915#1814] / [i915#456]) -> ([FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120]) ([i915#1602] / [i915#1764] / [i915#1814] / [i915#456] / [k.org#205379])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb3/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb2/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb7/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb5/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb2/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb3/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb7/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb2/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb2/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb8/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb8/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb5/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb5/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb8/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb3/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb7/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb5/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb1/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb8/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb1/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb7/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb8/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb7/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb8/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb7/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#183]: https://gitlab.freedesktop.org/drm/intel/issues/183
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2545]: https://gitlab.freedesktop.org/drm/intel/issues/2545
  [i915#2606]: https://gitlab.freedesktop.org/drm/intel/issues/2606
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5827 -> IGTPW_5098
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9202: 073691f2baf2db32197f744612f5249dcf942c79 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5098: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/index.html
  IGT_5827: 7fd7e3fb8b42eb4e62a4575f6edc5a048e5bec3d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/index.html

--===============5753837014963948442==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: fix pixel format (-clamping=
) tests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83041/">https://patchwork.freedesktop.org/series/83041/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5098/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5098/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9202_full -&gt; IGTPW_5098_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5098_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5098_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5098=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5098/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-of=
fscren-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5098/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-off=
scren-pri-shrfb-draw-render.html">DMESG-WARN</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5098/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-off=
scren-pri-shrfb-draw-render.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-pri-shrfb-draw-mmap-wc.html">INCOMPLETE</a> +12 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw=
-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5098/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-dra=
w-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@sw_sync@sync_busy_fork:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-hsw6/igt@sw_sync@sync_busy_fork.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw2/igt@=
sw_sync@sync_busy_fork.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5098_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_await@wide-contexts:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-snb5/igt@gem_exec_await@wide-contexts.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-snb=
2/igt@gem_exec_await@wide-contexts.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-g=
lk3/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-hsw4/igt@gem_ppgtt@blt-vs-render-ctxn.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw7=
/igt@gem_ppgtt@blt-vs-render-ctxn.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-glk7/igt@gem_ppgtt@blt-vs-render-ctxn.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk9=
/igt@gem_ppgtt@blt-vs-render-ctxn.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5098/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635=
">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5098/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/96=
">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5098/shard-glk9/igt@kms_cursor_legacy@cursora-vs-fl=
ipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transit=
ions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5098/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-=
atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/=
shard-apl7/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-iclb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-=
wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5098/shard-iclb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-w=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/123">i915#123</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2606">i915#2606</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-featur=
es-pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5098/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-=
features-pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-exponent:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-hsw2/igt@perf@invalid-oa-exponent.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw7/igt=
@perf@invalid-oa-exponent.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-apl4/igt@perf@invalid-oa-exponent.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl7/igt=
@perf@invalid-oa-exponent.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-kbl4/igt@perf@invalid-oa-exponent.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-kbl7/igt=
@perf@invalid-oa-exponent.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@basic:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-snb5/igt@gem_exec_create@basic.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-snb=
5/igt@gem_exec_create@basic.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-hsw4/igt@gem_exec_create@basic.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw6/=
igt@gem_exec_create@basic.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@madvise:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-glk4/igt@gem_exec_create@madvise.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2545">i915#2545</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/sh=
ard-glk2/igt@gem_exec_create@madvise.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5098/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-glk7/igt@gem_exec_whisper@basic-fds-forked-all.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118=
">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5098/shard-glk6/igt@gem_exec_whisper@basic-fds-forked-all.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-glk6/igt@kms_async_flips@async-flip-with-page-flip-events=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5098/shard-glk1/igt@kms_async_flips@async-flip-with-page-flip-ev=
ents.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5098/shard-apl3/igt@kms_async_flips@async-flip-with-page-f=
lip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-kbl4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i9=
15#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5098/shard-kbl2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +1 si=
milar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-hsw6/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5098/shard-hsw1/igt@kms_cursor_edge_walk@pipe-c-128x128-top-e=
dge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5098/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256=
-left-edge.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9202/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5098/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-256x256-left-=
edge.html">PASS</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915=
#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5098/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw=
-blt.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/123">i915#123</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5098/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb=
101010-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5098/shard-apl8/igt@kms_plane@plane-panning-bot=
tom-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-hsw4/igt@gem_tiled_swapping@non-threaded.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/183">i915#183</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/sh=
ard-hsw6/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-indfb-draw-mmap-gtt.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/123">i915#123</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb1/igt@kms_frontbuffer_tr=
acking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2606">i915#2606</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9202/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5098/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.=
html">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_9202/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_9202/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9202/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
9202/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_920=
2/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb3/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/s=
hard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb2/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shar=
d-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-t=
glb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_9202/shard-tglb8/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb=
8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_9202/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_9202/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb8/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_9202/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_9202/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb5/igt@runne=
r@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1764">i915#1764</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/456">i915#456</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb1/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/sha=
rd-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tg=
lb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb8/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5098/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5098/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5098/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_509=
8/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/sha=
rd-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tg=
lb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5098/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5098/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb1/igt@runner@=
aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1764">i915#1764</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/456">i915#456</a> / <a href=3D"https://bugzilla.=
kernel.org/show_bug.cgi?id=3D205379">k.org#205379</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5827 -&gt; IGTPW_5098</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9202: 073691f2baf2db32197f744612f5249dcf942c79 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5098: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/index.htm=
l<br />
  IGT_5827: 7fd7e3fb8b42eb4e62a4575f6edc5a048e5bec3d @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5753837014963948442==--

--===============0555896340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0555896340==--
