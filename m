Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 09:39:07 -0000
Message-ID: <158573394706.25627.1723598664066655869@emeril.freedesktop.org>
References: <20200331114746.81898-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200331114746.81898-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_add_tests_for_triggered_OA_reports?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/perf: add tests for triggered OA reports
URL   : https://patchwork.freedesktop.org/series/75311/
State : success

== Summary ==

CI Bug Log - changes from IGT_5548_full -> IGTPW_4381_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4381_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@triggered-oa-reports} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-tglb8/igt@perf@triggered-oa-reports.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb}:
    - shard-kbl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  
New tests
---------

  New tests have been introduced between IGT_5548_full and IGTPW_4381_full:

### New IGT tests (2) ###

  * igt@gem_exec_capture@capture:
    - Statuses :
    - Exec time: [None] s

  * igt@perf@triggered-oa-reports:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4381_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +9 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb5/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#716] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live@hangcheck:
    - shard-iclb:         [PASS][11] -> [INCOMPLETE][12] ([i915#1580])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb6/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb3/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-iclb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1185])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb7/igt@i915_suspend@debugfs-reader.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb3/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([CI#80] / [i915#155])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl1/igt@i915_suspend@sysfs-reader.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color@pipe-c-ctm-blue-to-red:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#129])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl2/igt@kms_color@pipe-c-ctm-blue-to-red.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl7/igt@kms_color@pipe-c-ctm-blue-to-red.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#129])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl6/igt@kms_color@pipe-c-ctm-blue-to-red.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl1/igt@kms_color@pipe-c-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#52] / [i915#54]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#79])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1297]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#1297]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl6/igt@kms_flip@bo-too-big-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl7/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#79])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#112080]) +8 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb3/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][47] ([fdo#112080]) -> [PASS][48] +11 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb8/igt@gem_busy@extended-parallel-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][49] ([i915#1277]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-tglb6/igt@gem_exec_balancer@hang.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-tglb1/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][51] ([fdo#109276] / [i915#677]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [INCOMPLETE][57] ([i915#656]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl4/igt@i915_selftest@live@execlists.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl4/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [INCOMPLETE][59] ([i915#1531]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-tglb3/igt@i915_selftest@live@requests.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-tglb8/igt@i915_selftest@live@requests.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-kbl:          [FAIL][61] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [FAIL][63] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][65] ([fdo#109349]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [FAIL][67] ([i915#52] / [i915#54]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [FAIL][69] ([i915#53] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [FAIL][71] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][73] ([i915#155]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][79] ([fdo#108145] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][83] ([i915#1542]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-hsw6/igt@perf@blocking-parameterized.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-hsw1/igt@perf@blocking-parameterized.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][85] ([i915#1085]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][87] ([fdo#109276]) -> [PASS][88] +11 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][89] ([i915#658]) -> [SKIP][90] ([i915#588])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][91] ([i915#454]) -> [SKIP][92] ([i915#468])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-snb:          [SKIP][93] ([fdo#109271]) -> [INCOMPLETE][94] ([i915#82])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-snb1/igt@i915_pm_rpm@gem-evict-pwrite.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-snb2/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][95] ([fdo#108145]) -> [FAIL][96] ([fdo#108145] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][97] ([fdo#108145]) -> [FAIL][98] ([fdo#108145] / [i915#93] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][99] ([i915#1423] / [i915#92]) -> ([FAIL][100], [FAIL][101]) ([i915#1423] / [i915#716] / [i915#92])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-kbl6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl1/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][102], [FAIL][103]) ([i915#1423] / [i915#529]) -> [FAIL][104] ([i915#1423])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl2/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5548/shard-apl4/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1580]: https://gitlab.freedesktop.org/drm/intel/issues/1580
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5548 -> IGTPW_4381

  CI-20190529: 20190529
  CI_DRM_8222: 6970d295e51e3b03d7ee3f781522398402d3a35d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4381: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/index.html
  IGT_5548: d9e70dc1b35633b7d5c81cbfa165e331189eb260 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4381/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
