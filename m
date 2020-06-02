Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 12:48:10 -0000
Message-ID: <159110209047.21427.1407467233056496940@emeril.freedesktop.org>
References: <20200602082245.1356782-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200602082245.1356782-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev7=29?=
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

Series: i915/gem_exec_schedule: Try to spot unfairness (rev7)
URL   : https://patchwork.freedesktop.org/series/77887/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8568_full -> IGTPW_4636_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4636_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-half@bcs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +27 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-tglb5/igt@gem_exec_schedule@fair-half@bcs0.html

  * {igt@gem_exec_schedule@fair-spare@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +20 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-iclb1/igt@gem_exec_schedule@fair-spare@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8568_full and IGTPW_4636_full:

### New IGT tests (42) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.47, 8.96] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.90] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.71] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.93] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.59, 8.97] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.96] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.98] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.95] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.41, 10.22] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.53] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 10.07] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.92] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.41, 8.69] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.67] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.51] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.67] s

  * igt@gem_exec_schedule@fair-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-solo@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.31, 8.57] s

  * igt@gem_exec_schedule@fair-solo@vcs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.58] s

  * igt@gem_exec_schedule@fair-solo@vcs1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.52] s

  * igt@gem_exec_schedule@fair-solo@vecs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.59] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.44, 8.94] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.94] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.79] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.95] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.35, 8.74] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.67] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.41] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.61] s

  

Known issues
------------

  Here are the changes found in IGTPW_4636_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl7/igt@gem_softpin@noreloc-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][5] -> [INCOMPLETE][6] ([i915#1687])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl8/igt@gem_workarounds@suspend-resume.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl7/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1436] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl4/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1119] / [i915#118] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#49])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#53] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#53] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#1602] / [i915#456])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@interrupts:
    - shard-hsw:          [PASS][25] -> [INCOMPLETE][26] ([i915#1927] / [i915#61])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw2/igt@perf_pmu@interrupts.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-hsw2/igt@perf_pmu@interrupts.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-glk:          [TIMEOUT][27] ([i915#1958]) -> [PASS][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk6/igt@gem_exec_reloc@basic-cpu-read.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-glk8/igt@gem_exec_reloc@basic-cpu-read.html

  * {igt@gem_exec_schedule@implicit-write-read@rcs0}:
    - shard-snb:          [INCOMPLETE][29] ([i915#82]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-snb6/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-snb2/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [INCOMPLETE][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl8/igt@gem_workarounds@suspend-resume-fd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][33] ([i915#1436] / [i915#716]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-hsw:          [INCOMPLETE][35] ([i915#151] / [i915#61]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw8/igt@i915_pm_rpm@system-suspend-devices.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-hsw4/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][38] +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-apl:          [FAIL][39] ([i915#70] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
    - shard-kbl:          [FAIL][41] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][43] ([fdo#109349]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][45] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][47] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][49] ([i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl2/igt@kms_draw_crc@fill-fb.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl6/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][51] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][53] ([i915#1525] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_fbcon_fbt@fbc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl7/igt@kms_fbcon_fbt@fbc.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][55] ([i915#61]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][59] ([i915#83]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-tglb8/igt@kms_panel_fitting@atomic-fastset.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-tglb7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [FAIL][61] ([i915#83]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][63] ([i915#173]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb1/igt@kms_psr@no_drrs.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-iclb4/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][67] ([i915#31]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl3/igt@kms_setmode@basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-kbl3/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][71] ([i915#1542]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw6/igt@perf@polling-parameterized.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-hsw4/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][73] ([i915#1899]) -> [FAIL][74] ([i915#454])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
    - shard-tglb:         [SKIP][75] ([i915#468]) -> [FAIL][76] ([i915#454])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][77] ([i915#1319] / [i915#1635]) -> [FAIL][78] ([fdo#110321] / [fdo#110336])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][79] ([fdo#110321]) -> [TIMEOUT][80] ([i915#1319] / [i915#1635])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_content_protection@srm.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][81] ([i915#357]) -> [FAIL][82] ([i915#357] / [i915#93] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_content_protection@uevent.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][83] ([i915#357]) -> [FAIL][84] ([i915#357] / [i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_content_protection@uevent.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-WARN][85] ([i915#1926]) -> [DMESG-FAIL][86] ([i915#1925] / [i915#1926]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-glk4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-glk:          [SKIP][87] ([fdo#109271]) -> [TIMEOUT][88] ([i915#1958]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk2/igt@kms_vblank@pipe-d-wait-idle.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/shard-glk2/igt@kms_vblank@pipe-d-wait-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1687]: https://gitlab.freedesktop.org/drm/intel/issues/1687
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
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
  * IGT: IGT_5690 -> IGTPW_4636
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8568: 124bafc80c3ce62fc61b8eabb2657c87424b999b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4636: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/index.html
  IGT_5690: bea881189520a9cccbb1c1cb454ac5b6fdaea40e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4636/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
