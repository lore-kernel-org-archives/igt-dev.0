Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Feb 2020 07:19:20 -0000
Message-ID: <158157836077.17960.9190750947441957642@emeril.freedesktop.org>
References: <20200211143048.12260-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200211143048.12260-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Enhance_invalid_mapping_exercise_=28re?=
 =?utf-8?b?djIp?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Enhance invalid mapping exercise (rev2)
URL   : https://patchwork.freedesktop.org/series/72411/
State : success

== Summary ==

CI Bug Log - changes from IGT_5435_full -> IGTPW_4128_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/index.html

New tests
---------

  New tests have been introduced between IGT_5435_full and IGTPW_4128_full:

### New IGT tests (3) ###

  * igt@gem_userptr_blits@invalid-uc-mapping:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@gem_userptr_blits@invalid-wb-mapping:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_userptr_blits@invalid-wc-mapping:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4128_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +14 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +6 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb8/igt@gem_exec_schedule@preempt-self-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb4/igt@gem_exec_schedule@preempt-self-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#644])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [PASS][11] -> [INCOMPLETE][12] ([fdo#103927])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl8/igt@gem_workarounds@suspend-resume-fd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk7/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live_gtt:
    - shard-kbl:          [PASS][15] -> [TIMEOUT][16] ([fdo#112271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl7/igt@i915_selftest@live_gtt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-kbl3/igt@i915_selftest@live_gtt.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#1172]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#1140])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-a:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#402])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb2/igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb6/igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-a.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-random:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#70])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb5/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#559]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-tglb:         [PASS][33] -> [DMESG-FAIL][34] ([i915#402]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#34])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#46])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-glk4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-tglb:         [PASS][41] -> [FAIL][42] ([i915#699])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb2/igt@kms_flip_tiling@flip-changes-tiling.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb3/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-snb:          [PASS][43] -> [DMESG-WARN][44] ([i915#478])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_mmap_write_crc@main:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#1180])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb2/igt@kms_mmap_write_crc@main.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb1/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#1139])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb5/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-tglb:         [PASS][51] -> [DMESG-FAIL][52] ([i915#402] / [i915#65])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-iclb:         [PASS][53] -> [INCOMPLETE][54] ([i915#1078])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +10 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#110841]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][59] ([fdo#110854]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-hsw:          [FAIL][65] ([i915#694]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-hsw6/igt@gem_partial_pwrite_pread@reads-snoop.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-hsw7/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [FAIL][67] ([fdo#103375]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_color@pipe-a-ctm-negative:
    - shard-tglb:         [FAIL][69] ([i915#1149]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb8/igt@kms_color@pipe-a-ctm-negative.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb8/igt@kms_color@pipe-a-ctm-negative.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [FAIL][71] ([i915#168]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl4/igt@kms_color@pipe-c-ctm-max.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-kbl1/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [FAIL][73] ([i915#168]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl6/igt@kms_color@pipe-c-ctm-max.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-apl7/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-tglb:         [FAIL][75] ([fdo#111703]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +6 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-glk:          [FAIL][81] ([fdo#103375]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-tglb:         [DMESG-FAIL][83] ([i915#402]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-tglb:         [FAIL][85] ([i915#559]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][87] ([i915#79]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [FAIL][89] ([i915#34]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-snb:          [DMESG-WARN][91] ([i915#478]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb6/igt@kms_psr@psr2_no_drrs.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [SKIP][95] ([i915#405]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb2/igt@perf@rc6-disable.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb3/igt@perf@rc6-disable.html
    - shard-hsw:          [SKIP][97] ([fdo#109271]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-hsw6/igt@perf@rc6-disable.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-hsw7/igt@perf@rc6-disable.html
    - shard-kbl:          [SKIP][99] ([fdo#109271]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl1/igt@perf@rc6-disable.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-kbl6/igt@perf@rc6-disable.html
    - shard-apl:          [SKIP][101] ([fdo#109271]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl6/igt@perf@rc6-disable.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-apl8/igt@perf@rc6-disable.html
    - shard-tglb:         [SKIP][103] ([fdo#111719] / [i915#405]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb8/igt@perf@rc6-disable.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-tglb3/igt@perf@rc6-disable.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][105] ([fdo#109276]) -> [PASS][106] +22 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][107] ([i915#818]) -> [FAIL][108] ([i915#694])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][109] ([fdo#107724]) -> [SKIP][110] ([fdo#109349])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1180]: https://gitlab.freedesktop.org/drm/intel/issues/1180
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5435 -> IGTPW_4128
  * Linux: CI_DRM_7908 -> CI_DRM_7911

  CI-20190529: 20190529
  CI_DRM_7908: a485616028300ec76e3afbc7a9926f2df18e7246 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_7911: 5d64e9f8063c7649404c3182c1fd38499ee03059 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4128: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/index.html
  IGT_5435: 2b6d4476dde53c363b8808ed9f0dd5547ac78641 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4128/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
