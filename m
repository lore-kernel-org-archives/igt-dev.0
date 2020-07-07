Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Jul 2020 21:52:50 -0000
Message-ID: <159415877076.7664.7298092056024895888@emeril.freedesktop.org>
References: <20200707145817.17415-1-marcin.bernatowicz@intel.com>
In-Reply-To: <20200707145817.17415-1-marcin.bernatowicz@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?device=5Freset=3A_Test_device_sysfs_reset_=28rev4=29?=
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
To: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/device_reset: Test device sysfs reset (rev4)
URL   : https://patchwork.freedesktop.org/series/78849/
State : success

== Summary ==

CI Bug Log - changes from IGT_5727_full -> IGTPW_4745_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/index.html

New tests
---------

  New tests have been introduced between IGT_5727_full and IGTPW_4745_full:

### New IGT tests (1) ###

  * igt@device_reset@unbind-reset-rebind:
    - Statuses : 7 pass(s)
    - Exec time: [0.33, 2.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4745_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_fence@parallel@vecs0:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-glk2/igt@gem_exec_fence@parallel@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-glk2/igt@gem_exec_fence@parallel@vecs0.html

  * igt@gem_exec_fence@syncobj-unused-fence:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#1635] / [i915#95]) +30 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl8/igt@gem_exec_fence@syncobj-unused-fence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl4/igt@gem_exec_fence@syncobj-unused-fence.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-kbl:          [PASS][7] -> [DMESG-FAIL][8] ([i915#95]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl7/igt@kms_big_fb@linear-16bpp-rotate-180.html
    - shard-apl:          [PASS][9] -> [DMESG-FAIL][10] ([i915#1635] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl4/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-glk8/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-glk7/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#1635] / [i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#155])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#93] / [i915#95]) +37 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl1/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl4/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-iclb4/igt@kms_psr@psr2_suspend.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#402])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-tglb8/igt@perf_pmu@module-unload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-tglb8/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][37] ([i915#1930]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [DMESG-WARN][39] ([i915#118] / [i915#95]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][41] ([i915#1436] / [i915#716]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl3/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl6/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-kbl:          [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [FAIL][47] ([i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-apl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-glk:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][53] ([i915#54] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][55] ([i915#72]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][57] ([i915#1982] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-glk:          [FAIL][61] ([i915#49]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
    - shard-iclb:         [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [DMESG-FAIL][67] ([i915#1635] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [DMESG-FAIL][69] ([i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-glk:          [FAIL][71] ([i915#1559]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-glk6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-glk9/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_vblank@pipe-a-query-forked:
    - shard-hsw:          [TIMEOUT][75] ([i915#1958] / [i915#2119]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-hsw4/igt@kms_vblank@pipe-a-query-forked.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-hsw1/igt@kms_vblank@pipe-a-query-forked.html
    - shard-snb:          [TIMEOUT][77] ([i915#1958] / [i915#2119]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-snb5/igt@kms_vblank@pipe-a-query-forked.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-snb2/igt@kms_vblank@pipe-a-query-forked.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-hang:
    - shard-kbl:          [DMESG-WARN][79] ([i915#93] / [i915#95]) -> [PASS][80] +42 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html

  * igt@syncobj_wait@multi-wait-for-submit-submitted-signaled:
    - shard-tglb:         [DMESG-WARN][81] ([i915#402]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-tglb1/igt@syncobj_wait@multi-wait-for-submit-submitted-signaled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-tglb8/igt@syncobj_wait@multi-wait-for-submit-submitted-signaled.html

  * igt@syncobj_wait@multi-wait-signaled:
    - shard-apl:          [DMESG-WARN][83] ([i915#1635] / [i915#95]) -> [PASS][84] +37 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl3/igt@syncobj_wait@multi-wait-signaled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl3/igt@syncobj_wait@multi-wait-signaled.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][85] ([i915#1958] / [i915#2119]) -> [FAIL][86] ([i915#1930])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:
    - shard-hsw:          [SKIP][87] ([fdo#109271]) -> [TIMEOUT][88] ([i915#1958] / [i915#2119])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-hsw6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-hsw1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [DMESG-WARN][89] ([i915#180]) -> [DMESG-WARN][90] ([i915#93] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl7/igt@gem_workarounds@suspend-resume.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl7/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][91] ([i915#588]) -> [SKIP][92] ([i915#658])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          [SKIP][93] ([fdo#109271]) -> [SKIP][94] ([fdo#109271] / [i915#1635]) +16 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][95] ([i915#93] / [i915#95]) -> [DMESG-WARN][96] ([i915#180])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl1/igt@i915_suspend@forcewake.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl6/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-hsw:          [TIMEOUT][97] ([i915#1958] / [i915#2119]) -> [SKIP][98] ([fdo#109271]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-hsw4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-hsw4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-apl:          [SKIP][99] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][100] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl6/igt@kms_chamelium@hdmi-audio-edid.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl8/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [fdo#111827]) -> [SKIP][102] ([fdo#109271] / [fdo#111827] / [i915#1635]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl4/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl7/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][103] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][104] ([i915#1319] / [i915#2119])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl7/igt@kms_content_protection@atomic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][105] ([fdo#110321]) -> [DMESG-FAIL][106] ([fdo#110321] / [i915#1635] / [i915#95])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl7/igt@kms_content_protection@srm.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [DMESG-FAIL][107] ([i915#95]) -> [FAIL][108] ([i915#2105])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl4/igt@kms_content_protection@uevent.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          [DMESG-FAIL][109] ([i915#1635] / [i915#95]) -> [FAIL][110] ([i915#2105])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl8/igt@kms_content_protection@uevent.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          [TIMEOUT][111] ([i915#1958] / [i915#2119]) -> [SKIP][112] ([fdo#109271]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         [DMESG-FAIL][113] ([i915#1982]) -> [FAIL][114] ([i915#2122]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-tglb1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][115] ([i915#93] / [i915#95]) -> [DMESG-WARN][116] ([i915#1982] / [i915#93] / [i915#95])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-apl:          [SKIP][117] ([fdo#109271] / [i915#1635]) -> [SKIP][118] ([fdo#109271]) +14 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          [FAIL][119] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][120] ([fdo#108145] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
    - shard-apl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#1635] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          [FAIL][123] ([i915#265]) -> [DMESG-FAIL][124] ([i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][125], [FAIL][126]) ([fdo#109271] / [i915#1436] / [i915#1784] / [i915#2110] / [i915#716]) -> [FAIL][127] ([i915#1436] / [i915#1784] / [i915#2110])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl7/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-kbl1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][128], [FAIL][129], [FAIL][130]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][131] ([i915#1635] / [i915#2110])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl8/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/shard-apl6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/shard-apl8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5727 -> IGTPW_4745

  CI-20190529: 20190529
  CI_DRM_8710: 274a7b2cbc164c0381a28cb30fd5d3ab93a36dee @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4745: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/index.html
  IGT_5727: 90254c14f4e68bec9d4a114ddf039075f3c1a30c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
