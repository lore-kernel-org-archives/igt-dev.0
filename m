Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 05 Aug 2020 16:26:30 -0000
Message-ID: <159664479035.4771.152771425849559563@emeril.freedesktop.org>
References: <20200805105900.29444-1-petri.latvala@intel.com>
In-Reply-To: <20200805105900.29444-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Only_claim_the_test_was_killed_if_it_was_killed?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0806867527=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0806867527==
Content-Type: multipart/alternative;
 boundary="===============3287814469241343099=="

--===============3287814469241343099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Only claim the test was killed if it was killed
URL   : https://patchwork.freedesktop.org/series/80284/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5759_full -> IGTPW_4853_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4853_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4853_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4853_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk9/igt@i915_selftest@mock.html
    - shard-iclb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb5/igt@i915_selftest@mock.html
    - shard-hsw:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw2/igt@i915_selftest@mock.html
    - shard-kbl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@i915_selftest@mock.html
    - shard-snb:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb6/igt@i915_selftest@mock.html
    - shard-tglb:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb7/igt@i915_selftest@mock.html

  
Known issues
------------

  Here are the changes found in IGTPW_4853_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#165])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][9] -> [SKIP][10] ([i915#2190])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_linear_blits@normal:
    - shard-hsw:          [PASS][11] -> [TIMEOUT][12] ([i915#1958]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@gem_linear_blits@normal.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw8/igt@gem_linear_blits@normal.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-iclb:         [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@i915_module_load@reload-with-fault-injection.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@blt:
    - shard-snb:          [PASS][15] -> [DMESG-FAIL][16] ([i915#1409])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb6/igt@i915_selftest@live@blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb4/igt@i915_selftest@live@blt.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#1119])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk5/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk3/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][19] -> [DMESG-FAIL][20] ([i915#118] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_busy@basic@flip:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#118] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk4/igt@kms_busy@basic@flip.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk3/igt@kms_busy@basic@flip.html

  * igt@kms_color@pipe-c-ctm-0-5:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#182])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@kms_color@pipe-c-ctm-0-5.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk3/igt@kms_color@pipe-c-ctm-0-5.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk9/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#2122])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk6/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk3/igt@kms_frontbuffer_tracking@fbc-farfromfence.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +11 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-snb:          [PASS][39] -> [TIMEOUT][40] ([i915#1958]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb6/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  * igt@kms_vblank@pipe-c-query-busy:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#1635] / [i915#1982]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl3/igt@kms_vblank@pipe-c-query-busy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-apl2/igt@kms_vblank@pipe-c-query-busy.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#1542])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@perf@blocking-parameterized.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb8/igt@perf@blocking-parameterized.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [PASS][45] -> [FAIL][46] ([i915#2258]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw8/igt@prime_busy@hang-wait@bcs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#1635] / [i915#1755])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#1755])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl2/igt@sysfs_timeslice_duration@timeout@vecs0.html
    - shard-tglb:         [PASS][51] -> [FAIL][52] ([i915#1755])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb3/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb1/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][53] ([i915#118] / [i915#95]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-snb:          [TIMEOUT][55] ([i915#1958]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [INCOMPLETE][57] ([i915#82]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb4/igt@i915_module_load@reload-no-display.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb5/igt@i915_module_load@reload-no-display.html
    - shard-iclb:         [INCOMPLETE][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@i915_module_load@reload-no-display.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb1/igt@i915_module_load@reload-no-display.html
    - shard-apl:          [INCOMPLETE][61] ([i915#1635]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl2/igt@i915_module_load@reload-no-display.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-apl7/igt@i915_module_load@reload-no-display.html
    - shard-glk:          [INCOMPLETE][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@i915_module_load@reload-no-display.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk4/igt@i915_module_load@reload-no-display.html
    - shard-tglb:         [INCOMPLETE][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@i915_module_load@reload-no-display.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb1/igt@i915_module_load@reload-no-display.html
    - shard-hsw:          [INCOMPLETE][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@i915_module_load@reload-no-display.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw7/igt@i915_module_load@reload-no-display.html
    - shard-kbl:          [INCOMPLETE][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@i915_module_load@reload-no-display.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl6/igt@i915_module_load@reload-no-display.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled:
    - shard-apl:          [DMESG-WARN][71] ([i915#1635] / [i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-apl1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +6 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][75] ([i915#2055]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-kbl:          [DMESG-WARN][77] ([i915#1982]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][79] ([i915#1982]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][81] ([i915#155]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-256:
    - shard-hsw:          [TIMEOUT][83] ([i915#1958]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_plane_cursor@pipe-c-viewport-size-256.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw1/igt@kms_plane_cursor@pipe-c-viewport-size-256.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][87] ([i915#588]) -> [SKIP][88] ([i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-hsw:          [TIMEOUT][89] ([i915#1958]) -> [SKIP][90] ([fdo#109271]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][91] ([i915#1319] / [i915#1958]) -> [TIMEOUT][92] ([i915#1319])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_content_protection@lic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-hsw:          [SKIP][93] ([fdo#109271]) -> [TIMEOUT][94] ([i915#1958])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
    - shard-snb:          [SKIP][95] ([fdo#109271]) -> [TIMEOUT][96] ([i915#1958])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-snb:          [TIMEOUT][97] ([i915#1958]) -> [SKIP][98] ([fdo#109271]) +4 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb4/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][99], [FAIL][100]) ([i915#2283]) -> ([FAIL][101], [FAIL][102]) ([i915#1436] / [i915#2110] / [i915#2283])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw8/igt@runner@aborted.html
    - shard-kbl:          [FAIL][103] ([i915#1784]) -> [FAIL][104] ([i915#1436] / [i915#1784] / [i915#2110])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         [FAIL][105] -> [FAIL][106] ([i915#2110])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb5/igt@runner@aborted.html
    - shard-glk:          [FAIL][107] ([k.org#202321]) -> [FAIL][108] ([i915#2110] / [k.org#202321])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk9/igt@runner@aborted.html
    - shard-tglb:         [FAIL][109] ([i915#1852]) -> [FAIL][110] ([i915#2110])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb7/igt@runner@aborted.html
    - shard-snb:          [FAIL][111] -> [FAIL][112] ([i915#2110])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb4/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb6/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1409]: https://gitlab.freedesktop.org/drm/intel/issues/1409
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#182]: https://gitlab.freedesktop.org/drm/intel/issues/182
  [i915#1852]: https://gitlab.freedesktop.org/drm/intel/issues/1852
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5759 -> IGTPW_4853

  CI-20190529: 20190529
  CI_DRM_8845: a486392fed875e0b9154eaeb4bf6a4193484e0b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4853: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/index.html
  IGT_5759: 917b8990f87afa8a04beff8b491450f8bc9201de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/index.html

--===============3287814469241343099==
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
<tr><td><b>Series:</b></td><td>runner: Only claim the test was killed if it was killed</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80284/">https://patchwork.freedesktop.org/series/80284/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5759_full -&gt; IGTPW_4853_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4853_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4853_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4853_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk9/igt@i915_selftest@mock.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb5/igt@i915_selftest@mock.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw2/igt@i915_selftest@mock.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@i915_selftest@mock.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb6/igt@i915_selftest@mock.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb7/igt@i915_selftest@mock.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4853_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb7/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@normal:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@gem_linear_blits@normal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw8/igt@gem_linear_blits@normal.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb1/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb6/igt@i915_selftest@live@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb4/igt@i915_selftest@live@blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1409">i915#1409</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk5/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk3/igt@kms_big_fb@linear-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk4/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk3/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-0-5:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@kms_color@pipe-c-ctm-0-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk3/igt@kms_color@pipe-c-ctm-0-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/182">i915#182</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk9/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-farfromfence:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk6/igt@kms_frontbuffer_tracking@fbc-farfromfence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk3/igt@kms_frontbuffer_tracking@fbc-farfromfence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-a-functional:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb6/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl3/igt@kms_vblank@pipe-c-query-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-apl2/igt@kms_vblank@pipe-c-query-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb4/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb8/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw8/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl4/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl2/igt@sysfs_timeslice_duration@timeout@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb3/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb1/igt@sysfs_timeslice_duration@timeout@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb4/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb5/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb1/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl2/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-apl7/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk4/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb1/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw7/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl6/igt@i915_module_load@reload-no-display.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-apl1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-c-viewport-size-256:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_plane_cursor@pipe-c-viewport-size-256.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw1/igt@kms_plane_cursor@pipe-c-viewport-size-256.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl1/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl7/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb4/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-hsw4/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw8/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-kbl2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-iclb1/igt@runner@aborted.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-glk3/igt@runner@aborted.html">FAIL</a> (<a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk9/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-tglb6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1852">i915#1852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5759/shard-snb4/igt@runner@aborted.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5759 -&gt; IGTPW_4853</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8845: a486392fed875e0b9154eaeb4bf6a4193484e0b3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4853: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/index.html<br />
  IGT_5759: 917b8990f87afa8a04beff8b491450f8bc9201de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3287814469241343099==--

--===============0806867527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0806867527==--
