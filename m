Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Feb 2020 13:34:27 -0000
Message-ID: <158229206726.7919.14253359196173785447@emeril.freedesktop.org>
References: <20200219161358.4726-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200219161358.4726-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Refresh_map-fixed-invalidate*_subtests?=
 =?utf-8?q?_=28rev2=29?=
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

Series: tests/gem_userptr_blits: Refresh map-fixed-invalidate* subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/73405/
State : success

== Summary ==

CI Bug Log - changes from IGT_5452_full -> IGTPW_4187_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/index.html

New tests
---------

  New tests have been introduced between IGT_5452_full and IGTPW_4187_full:

### New IGT tests (32) ###

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt:
    - Statuses : 6 pass(s)
    - Exec time: [0.62, 2.90] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc:
    - Statuses : 6 pass(s)
    - Exec time: [0.76, 2.12] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@wb:
    - Statuses : 6 pass(s)
    - Exec time: [0.61, 2.86] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@wc:
    - Statuses : 6 pass(s)
    - Exec time: [0.63, 2.43] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - Statuses : 1 dmesg-warn(s) 6 pass(s)
    - Exec time: [0.43, 2.46] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.43, 2.35] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.42, 2.32] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.43, 2.36] s

  * igt@gem_userptr_blits@map-fixed-invalidate-gup@gtt:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 1.69] s

  * igt@gem_userptr_blits@map-fixed-invalidate-gup@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.46, 1.65] s

  * igt@gem_userptr_blits@map-fixed-invalidate-gup@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.43, 1.65] s

  * igt@gem_userptr_blits@map-fixed-invalidate-gup@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 1.64] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - Statuses : 1 dmesg-warn(s) 6 pass(s)
    - Exec time: [0.46, 2.29] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.45, 2.27] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.42, 2.21] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.45, 2.23] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt:
    - Statuses : 1 dmesg-warn(s) 6 pass(s)
    - Exec time: [0.50, 2.40] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.56, 2.45] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.55, 2.44] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.55, 2.47] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup@gtt:
    - Statuses : 6 pass(s)
    - Exec time: [0.44, 1.71] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup@uc:
    - Statuses : 6 pass(s)
    - Exec time: [0.47, 1.70] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup@wb:
    - Statuses : 6 pass(s)
    - Exec time: [0.43, 1.66] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup@wc:
    - Statuses : 6 pass(s)
    - Exec time: [0.43, 1.66] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap@gtt:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.14] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.11] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.11] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.11] s

  * igt@gem_userptr_blits@map-fixed-invalidate@gtt:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.14] s

  * igt@gem_userptr_blits@map-fixed-invalidate@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.10] s

  * igt@gem_userptr_blits@map-fixed-invalidate@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.11] s

  * igt@gem_userptr_blits@map-fixed-invalidate@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.10] s

  

Known issues
------------

  Here are the changes found in IGTPW_4187_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2] ([i915#61] / [i915#977])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-hsw7/igt@gem_busy@close-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-hsw6/igt@gem_busy@close-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +16 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +9 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#818])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-hsw8/igt@gem_tiled_blits@normal.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@gem_tiled_wc:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([i915#478] / [i915#915])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-snb6/igt@gem_tiled_wc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-snb6/igt@gem_tiled_wc.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#447])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [PASS][17] -> [TIMEOUT][18] ([fdo#112271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-apl6/igt@i915_selftest@live_gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-apl1/igt@i915_selftest@live_gtt.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#61])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-hsw5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-random:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#54]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-tglb:         [PASS][27] -> [TIMEOUT][28] ([fdo#112271] / [i915#561])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-tglb6/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-tglb3/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb4/igt@kms_psr@psr2_primary_blt.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#112080]) +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][35] ([fdo#112080]) -> [PASS][36] +9 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][37] ([fdo#112146]) -> [PASS][38] +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb2/igt@gem_exec_async@concurrent-writes-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb6/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][39] ([fdo#110854]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd2}:
    - shard-iclb:         [SKIP][41] ([fdo#109276] / [i915#677]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb6/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][43] ([i915#677]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][45] ([fdo#109276]) -> [PASS][46] +9 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb5/igt@gem_exec_schedule@promotion-bsd1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html

  * {igt@gem_exec_whisper@basic-contexts-forked-all}:
    - shard-hsw:          [INCOMPLETE][47] ([i915#61]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-hsw2/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-hsw7/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][51] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][53] ([fdo#111870] / [i915#478]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][55] ([i915#413]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-tglb1/igt@i915_pm_rps@waitboost.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-tglb8/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - shard-hsw:          [INCOMPLETE][57] ([CI#80] / [i915#61]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_flip@flip-vs-modeset-vs-hang-interruptible:
    - shard-tglb:         [TIMEOUT][59] ([fdo#112271] / [i915#561]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-tglb5/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-tglb7/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-tilingchange:
    - shard-apl:          [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-apl6/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-apl6/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
    - shard-kbl:          [FAIL][65] ([i915#49]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-tilingchange.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [SKIP][67] ([i915#668]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-tglb5/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-tglb5/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][73] ([IGT#28]) -> [SKIP][74] ([fdo#112080])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][75] ([i915#818]) -> [FAIL][76] ([i915#694])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-hsw1/igt@gem_tiled_blits@interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-hsw6/igt@gem_tiled_blits@interruptible.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [INCOMPLETE][77] ([i915#1233]) -> [DMESG-FAIL][78] ([i915#1233])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5452/shard-tglb6/igt@i915_selftest@live_gt_lrc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/shard-tglb6/igt@i915_selftest@live_gt_lrc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#915]: https://gitlab.freedesktop.org/drm/intel/issues/915
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5452 -> IGTPW_4187

  CI-20190529: 20190529
  CI_DRM_7966: 014bfb094e0b4e80d7510dc5d6f45e5e73bbb419 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4187: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/index.html
  IGT_5452: c05dc6cd816feb1cc518ce777ab3fd6c81893113 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4187/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
