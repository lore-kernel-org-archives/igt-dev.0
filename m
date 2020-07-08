Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Jul 2020 13:28:38 -0000
Message-ID: <159421491832.3838.3387081602667275288@emeril.freedesktop.org>
References: <20200708085900.4706-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200708085900.4706-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgUG9ydGlv?=
 =?utf-8?q?n_of_libdrm_removal_in_simple_tests?=
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Portion of libdrm removal in simple tests
URL   : https://patchwork.freedesktop.org/series/79240/
State : success

== Summary ==

CI Bug Log - changes from IGT_5728_full -> IGTPW_4746_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/index.html

Known issues
------------

  Here are the changes found in IGTPW_4746_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#93] / [i915#95]) +40 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl4/igt@gem_exec_balancer@smoke.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl7/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-snb:          [PASS][3] -> [TIMEOUT][4] ([i915#1958] / [i915#2119]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-snb6/igt@gem_exec_reloc@basic-softpin.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-snb4/igt@gem_exec_reloc@basic-softpin.html
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-hsw7/igt@gem_exec_reloc@basic-softpin.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-hsw4/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-glk3/igt@gem_exec_whisper@basic-contexts-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-glk6/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_mmap_wc@close:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1635] / [i915#95]) +37 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl1/igt@gem_mmap_wc@close.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl1/igt@gem_mmap_wc@close.html

  * igt@gem_pwrite@basic-random:
    - shard-tglb:         [PASS][11] -> [DMESG-WARN][12] ([i915#402]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-tglb1/igt@gem_pwrite@basic-random.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-tglb8/igt@gem_pwrite@basic-random.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#54] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-tglb6/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-tglb1/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html

  * igt@kms_flip@2x-flip-vs-dpms@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-hsw1/igt@kms_flip@2x-flip-vs-dpms@ab-vga1-hdmi-a1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-hsw6/igt@kms_flip@2x-flip-vs-dpms@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#2122])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#79])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-vga1:
    - shard-snb:          [PASS][35] -> [INCOMPLETE][36] ([i915#82])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible@b-vga1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@b-vga1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-iclb:         [PASS][39] -> [DMESG-WARN][40] ([i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#1635] / [i915#95]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [PASS][43] -> [DMESG-FAIL][44] ([i915#95]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][45] -> [SKIP][46] ([i915#1911])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-tglb3/igt@kms_psr2_su@page_flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-tglb3/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-iclb7/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#331])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#331])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-glk1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-glk2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-apl:          [PASS][53] -> [FAIL][54] ([i915#331])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [FAIL][55] ([i915#2079]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl3/igt@gem_exec_balancer@bonded-early.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl3/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-apl:          [DMESG-WARN][57] ([i915#1635] / [i915#95]) -> [PASS][58] +32 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl4/igt@gem_exec_flush@basic-wb-pro-default.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl6/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][59] ([i915#1930]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [DMESG-WARN][61] ([i915#118] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-glk6/igt@gem_exec_whisper@basic-normal.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-glk8/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_media_fill:
    - shard-kbl:          [DMESG-WARN][63] ([i915#93] / [i915#95]) -> [PASS][64] +39 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl6/igt@gem_media_fill.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl7/igt@gem_media_fill.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-iclb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-iclb1/igt@i915_module_load@reload-with-fault-injection.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-iclb1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-hsw:          [INCOMPLETE][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-hsw5/igt@i915_module_load@reload-with-fault-injection.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-hsw7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-kbl:          [DMESG-FAIL][69] ([i915#95]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl4/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl3/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [DMESG-FAIL][71] ([i915#1635] / [i915#95]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-snb:          [TIMEOUT][73] ([i915#1958] / [i915#2119]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
    - shard-hsw:          [TIMEOUT][75] ([i915#1958] / [i915#2119]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [DMESG-FAIL][77] ([i915#54] / [i915#95]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][79] ([i915#1525]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][81] ([i915#64]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_tiling@flip-to-x-tiled:
    - shard-kbl:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl7/igt@kms_flip_tiling@flip-to-x-tiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl1/igt@kms_flip_tiling@flip-to-x-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [FAIL][85] ([i915#49]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [DMESG-FAIL][87] ([i915#1635] / [i915#49] / [i915#95]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-glk3/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][91] ([i915#1982]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180]) -> [PASS][94] +5 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][97] ([i915#1542]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-iclb7/igt@perf@blocking-parameterized.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-iclb5/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_vm_create@execbuf:
    - shard-hsw:          [TIMEOUT][99] ([i915#1958] / [i915#2119]) -> [SKIP][100] ([fdo#109271]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-hsw6/igt@gem_vm_create@execbuf.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-hsw8/igt@gem_vm_create@execbuf.html
    - shard-snb:          [TIMEOUT][101] ([i915#1958] / [i915#2119]) -> [SKIP][102] ([fdo#109271]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-snb2/igt@gem_vm_create@execbuf.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-snb6/igt@gem_vm_create@execbuf.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-apl:          [SKIP][103] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][104] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl6/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl8/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [fdo#111827]) -> [SKIP][106] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl4/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [DMESG-FAIL][107] ([fdo#110321] / [i915#1635] / [i915#95]) -> [FAIL][108] ([fdo#110321] / [fdo#110336])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl7/igt@kms_content_protection@atomic-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl4/igt@kms_content_protection@atomic-dpms.html
    - shard-kbl:          [DMESG-FAIL][109] ([fdo#110321] / [i915#95]) -> [TIMEOUT][110] ([i915#1319] / [i915#1958] / [i915#2119])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl2/igt@kms_content_protection@atomic-dpms.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][111] ([fdo#109271]) -> [TIMEOUT][112] ([i915#1958] / [i915#2119]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-snb:          [SKIP][113] ([fdo#109271]) -> [TIMEOUT][114] ([i915#1958] / [i915#2119]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][115] ([i915#93] / [i915#95]) -> [DMESG-WARN][116] ([i915#180] / [i915#93] / [i915#95])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-apl:          [SKIP][117] ([fdo#109271]) -> [SKIP][118] ([fdo#109271] / [i915#1635]) +17 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          [FAIL][119] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][120] ([fdo#108145] / [i915#1635] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:
    - shard-apl:          [SKIP][123] ([fdo#109271] / [i915#1635]) -> [SKIP][124] ([fdo#109271]) +8 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl1/igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl4/igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][125] ([i915#93] / [i915#95]) -> [DMESG-WARN][126] ([i915#180])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][127], [FAIL][128], [FAIL][129]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][130] ([i915#1635] / [i915#2110])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl4/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl7/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5728/shard-apl3/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/shard-apl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5728 -> IGTPW_4746

  CI-20190529: 20190529
  CI_DRM_8714: d8410c7e293b66004f3f6ae4ba59b2183ebdd7e8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4746: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/index.html
  IGT_5728: 6988eebf78e9ce9746b8c2b7d21cb4174d6623a9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4746/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
