Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Apr 2020 20:27:15 -0000
Message-ID: <158629123584.26327.11693189500904043574@emeril.freedesktop.org>
References: <20200407134716.8872-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200407134716.8872-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengi?=
 =?utf-8?q?ne_to_utilize_all_available_=28rev5=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available (rev5)
URL   : https://patchwork.freedesktop.org/series/75536/
State : success

== Summary ==

CI Bug Log - changes from IGT_5574_full -> IGTPW_4426_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/index.html

New tests
---------

  New tests have been introduced between IGT_5574_full and IGTPW_4426_full:

### New IGT tests (6) ###

  * igt@gem_sync@basic_sync_ring:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@basic_sync_ring@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [20.05, 20.29] s

  * igt@gem_sync@basic_sync_ring@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [20.02, 20.13] s

  * igt@gem_sync@basic_sync_ring@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [20.03, 20.17] s

  * igt@gem_sync@basic_sync_ring@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [20.05, 20.07] s

  * igt@gem_sync@basic_sync_ring@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [20.03, 20.16] s

  

Known issues
------------

  Here are the changes found in IGTPW_4426_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [PASS][3] -> [SKIP][4] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-hsw4/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-hsw4/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#1316] / [i915#579])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-iclb2/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-iclb4/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#1316] / [i915#579])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-tglb5/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-tglb3/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-glk:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-glk7/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-glk6/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-apl8/igt@i915_suspend@sysfs-reader.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#1566] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#1085])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-tglb5/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][27] ([fdo#109276]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-iclb5/igt@gem_exec_params@invalid-bsd-ring.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][29] ([i915#716]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-glk4/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [DMESG-WARN][31] ([i915#716]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [INCOMPLETE][33] ([i915#1531]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-tglb2/igt@i915_selftest@live@requests.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-tglb8/igt@i915_selftest@live@requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][35] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-apl:          [FAIL][37] ([i915#70] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-apl6/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-apl2/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
    - shard-kbl:          [FAIL][39] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][41] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [FAIL][43] ([i915#52] / [i915#54]) -> [PASS][44] +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][45] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][47] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][49] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [INCOMPLETE][51] ([i915#61]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][59] ([i915#31]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-hsw6/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-hsw6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][61] ([i915#155]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][63] ([i915#1542]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-hsw8/igt@perf@polling-parameterized.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-hsw4/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][65] ([i915#588]) -> [SKIP][66] ([i915#658])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][67] ([i915#454]) -> [SKIP][68] ([i915#468])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@cursor:
    - shard-snb:          [SKIP][69] ([fdo#109271]) -> [INCOMPLETE][70] ([i915#82])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-snb2/igt@i915_pm_rpm@cursor.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-snb1/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@gem-mmap-type:
    - shard-snb:          [INCOMPLETE][71] ([i915#82]) -> [SKIP][72] ([fdo#109271])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-snb1/igt@i915_pm_rpm@gem-mmap-type.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-snb7/igt@i915_pm_rpm@gem-mmap-type.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][73] ([i915#608]) -> [SKIP][74] ([fdo#109642] / [fdo#111068])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][75], [FAIL][76]) ([i915#1423] / [i915#716] / [i915#92]) -> [FAIL][77] ([i915#1423] / [i915#92])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl2/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/shard-kbl4/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/shard-kbl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
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
  * IGT: IGT_5574 -> IGTPW_4426

  CI-20190529: 20190529
  CI_DRM_8264: e0104585f880a64d4a9b40803cf4fb51ab499f7c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4426: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/index.html
  IGT_5574: 15e8ffecfd55d3d632491b73ed981e4467145a4b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
