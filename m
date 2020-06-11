Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 11 Jun 2020 22:10:35 -0000
Message-ID: <159191343597.22714.13076261245449933023@emeril.freedesktop.org>
References: <20200611163309.262209-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200611163309.262209-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fmmap=5Fgtt=3A_Increase_concurrent_stress?=
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

Series: i915/gem_mmap_gtt: Increase concurrent stress
URL   : https://patchwork.freedesktop.org/series/78231/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8618_full -> IGTPW_4670_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4670_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4670_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4670_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-tglb8/igt@gem_mmap_gtt@fault-concurrent.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-tglb7/igt@gem_mmap_gtt@fault-concurrent.html
    - shard-snb:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-snb1/igt@gem_mmap_gtt@fault-concurrent.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-snb1/igt@gem_mmap_gtt@fault-concurrent.html
    - shard-iclb:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-iclb2/igt@gem_mmap_gtt@fault-concurrent.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-iclb5/igt@gem_mmap_gtt@fault-concurrent.html
    - shard-kbl:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl7/igt@gem_mmap_gtt@fault-concurrent.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl3/igt@gem_mmap_gtt@fault-concurrent.html
    - shard-hsw:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-hsw1/igt@gem_mmap_gtt@fault-concurrent.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-hsw2/igt@gem_mmap_gtt@fault-concurrent.html
    - shard-glk:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-glk9/igt@gem_mmap_gtt@fault-concurrent.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-glk6/igt@gem_mmap_gtt@fault-concurrent.html
    - shard-apl:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl4/igt@gem_mmap_gtt@fault-concurrent.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl7/igt@gem_mmap_gtt@fault-concurrent.html

  
Known issues
------------

  Here are the changes found in IGTPW_4670_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#1602])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-tglb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-tglb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@in-flight-1us:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#402]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-tglb2/igt@gem_eio@in-flight-1us.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-tglb3/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#93] / [i915#95]) +41 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl2/igt@gem_exec_flush@basic-uc-set-default.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl6/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-hsw:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-hsw2/igt@i915_pm_rpm@gem-pread.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-hsw8/igt@i915_pm_rpm@gem-pread.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][25] -> [DMESG-FAIL][26] ([i915#118] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#54] / [i915#95]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#95]) +44 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#70] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:
    - shard-hsw:          [PASS][37] -> [INCOMPLETE][38] ([i915#61])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-hsw8/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-tglb:         [PASS][41] -> [DMESG-WARN][42] ([i915#1982])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_plane_cursor@pipe-b-overlay-size-64:
    - shard-hsw:          [PASS][43] -> [TIMEOUT][44] ([i915#1958]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-hsw2/igt@kms_plane_cursor@pipe-b-overlay-size-64.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-hsw8/igt@kms_plane_cursor@pipe-b-overlay-size-64.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#1982])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl6/igt@kms_vblank@pipe-c-accuracy-idle.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl2/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][49] -> [FAIL][50] ([i915#1542])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-iclb2/igt@perf@blocking-parameterized.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-iclb8/igt@perf@blocking-parameterized.html
    - shard-hsw:          [PASS][51] -> [FAIL][52] ([i915#1542])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-hsw2/igt@perf@blocking-parameterized.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-hsw2/igt@perf@blocking-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-busy-all:
    - shard-snb:          [TIMEOUT][53] ([i915#1958]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-snb2/igt@gem_exec_fence@basic-busy-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-snb6/igt@gem_exec_fence@basic-busy-all.html
    - shard-hsw:          [TIMEOUT][55] ([i915#1958]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-hsw2/igt@gem_exec_fence@basic-busy-all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-hsw8/igt@gem_exec_fence@basic-busy-all.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-apl:          [DMESG-WARN][57] ([i915#95]) -> [PASS][58] +38 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl4/igt@gem_exec_reloc@basic-wc-cpu-active.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl7/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_schedule@implicit-read-write@bcs0:
    - shard-snb:          [INCOMPLETE][59] ([i915#82]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-snb5/igt@gem_exec_schedule@implicit-read-write@bcs0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-snb2/igt@gem_exec_schedule@implicit-read-write@bcs0.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][61] ([i915#1899]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-iclb5/igt@i915_pm_dc@dc5-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-iclb1/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_selftest@perf@request:
    - shard-tglb:         [INCOMPLETE][63] ([i915#1823]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-tglb7/igt@i915_selftest@perf@request.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-tglb1/igt@i915_selftest@perf@request.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-kbl:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-glk:          [FAIL][67] ([i915#1119]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-glk4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-glk4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][69] ([i915#118] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-glk4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-c-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][71] ([i915#93] / [i915#95]) -> [PASS][72] +47 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl7/igt@kms_color@pipe-c-ctm-blue-to-red.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl3/igt@kms_color@pipe-c-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [DMESG-FAIL][73] ([i915#54] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-apl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
    - shard-glk:          [FAIL][81] ([i915#79]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][83] ([i915#95]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [DMESG-FAIL][85] ([i915#95]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][87] ([i915#49]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-apl:          [DMESG-FAIL][89] ([i915#49] / [i915#95]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-kbl:          [FAIL][91] ([i915#49]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][93] ([i915#433]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][95] ([i915#83]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-tglb5/igt@kms_panel_fitting@atomic-fastset.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-tglb1/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [FAIL][97] ([i915#83]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [DMESG-FAIL][99] ([fdo#108145] / [i915#95]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [DMESG-FAIL][101] ([fdo#108145] / [i915#95]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][103] ([fdo#109441]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-c-wait-busy-hang:
    - shard-apl:          [DMESG-WARN][105] ([i915#1982]) -> [PASS][106] +4 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl8/igt@kms_vblank@pipe-c-wait-busy-hang.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl4/igt@kms_vblank@pipe-c-wait-busy-hang.html

  * igt@syncobj_wait@multi-wait-for-submit-unsubmitted-submitted-signaled:
    - shard-tglb:         [DMESG-WARN][107] ([i915#402]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-tglb5/igt@syncobj_wait@multi-wait-for-submit-unsubmitted-submitted-signaled.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-tglb7/igt@syncobj_wait@multi-wait-for-submit-unsubmitted-submitted-signaled.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][109] ([i915#1958]) -> [FAIL][110] ([i915#1930])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-apl:          [INCOMPLETE][111] ([i915#1635] / [i915#1958] / [i915#95]) -> [INCOMPLETE][112] ([i915#1635] / [i915#1958])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl2/igt@gem_exec_reloc@basic-concurrent16.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gen3_render_mixed_blits:
    - shard-hsw:          [TIMEOUT][113] ([i915#1958]) -> [SKIP][114] ([fdo#109271]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-hsw2/igt@gen3_render_mixed_blits.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-hsw4/igt@gen3_render_mixed_blits.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][115] ([i915#1515]) -> [WARN][116] ([i915#1515])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_chamelium@hdmi-hpd-storm-disable:
    - shard-snb:          [TIMEOUT][117] ([i915#1958]) -> [SKIP][118] ([fdo#109271] / [fdo#111827])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-snb2/igt@kms_chamelium@hdmi-hpd-storm-disable.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-snb5/igt@kms_chamelium@hdmi-hpd-storm-disable.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-hsw:          [SKIP][119] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][120] ([i915#1958])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-hsw1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-hsw8/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [DMESG-FAIL][121] ([fdo#110321] / [i915#95]) -> [FAIL][122] ([fdo#110321] / [fdo#110336])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl6/igt@kms_content_protection@atomic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          [TIMEOUT][123] ([i915#1319] / [i915#1958]) -> [TIMEOUT][124] ([i915#1319]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl4/igt@kms_content_protection@legacy.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl3/igt@kms_content_protection@legacy.html
    - shard-apl:          [FAIL][125] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][126] ([i915#1319] / [i915#1635])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl4/igt@kms_content_protection@legacy.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][127] ([i915#1319]) -> [TIMEOUT][128] ([i915#1319] / [i915#1958])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-kbl2/igt@kms_content_protection@lic.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-kbl4/igt@kms_content_protection@lic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][129] ([fdo#109349]) -> [DMESG-WARN][130] ([i915#1226])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-snb:          [TIMEOUT][131] ([i915#1958]) -> [SKIP][132] ([fdo#109271]) +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          [FAIL][133] ([i915#265]) -> [DMESG-FAIL][134] ([i915#95])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-hsw:          [SKIP][135] ([fdo#109271]) -> [TIMEOUT][136] ([i915#1958]) +2 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-hsw6/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-hsw8/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [DMESG-FAIL][137] ([i915#95]) -> [FAIL][138] ([i915#1542])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-apl1/igt@perf@polling-parameterized.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-apl1/igt@perf@polling-parameterized.html

  * igt@runner@aborted:
    - shard-tglb:         [FAIL][139] ([i915#1759]) -> [FAIL][140] ([i915#402])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8618/shard-tglb7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/shard-tglb2/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1823]: https://gitlab.freedesktop.org/drm/intel/issues/1823
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5703 -> IGTPW_4670
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8618: 88841e30e7f8c60ff464be277e5b8fef49ebaea0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4670: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/index.html
  IGT_5703: c33471b4aa0a0ae9dd42202048e7037a661e0574 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4670/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
