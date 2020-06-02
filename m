Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 03:59:28 -0000
Message-ID: <159107036880.21427.527318064850187621@emeril.freedesktop.org>
References: <20200601190809.1174616-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200601190809.1174616-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev2=29?=
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

Series: i915/gem_exec_schedule: Try to spot unfairness (rev2)
URL   : https://patchwork.freedesktop.org/series/77887/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8567_full -> IGTPW_4632_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4632_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4632_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4632_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fairness@bcs0} (NEW):
    - shard-iclb:         NOTRUN -> [INCOMPLETE][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-iclb8/igt@gem_exec_schedule@fairness@bcs0.html

  * {igt@gem_exec_schedule@fairness@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-iclb8/igt@gem_exec_schedule@fairness@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-glk5/igt@gem_exec_schedule@fairness@rcs0.html

  * {igt@gem_exec_schedule@unfairness@bcs0} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-tglb8/igt@gem_exec_schedule@unfairness@bcs0.html

  * {igt@gem_exec_schedule@unfairness@rcs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl6/igt@gem_exec_schedule@unfairness@rcs0.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl3/igt@i915_suspend@sysfs-reader.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8567_full and IGTPW_4632_full:

### New IGT tests (11) ###

  * igt@gem_exec_schedule@fairness:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fairness@bcs0:
    - Statuses : 2 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 13.38] s

  * igt@gem_exec_schedule@fairness@rcs0:
    - Statuses : 2 fail(s) 2 pass(s)
    - Exec time: [3.38, 13.39] s

  * igt@gem_exec_schedule@fairness@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [13.35, 13.38] s

  * igt@gem_exec_schedule@fairness@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [13.35] s

  * igt@gem_exec_schedule@unfairness:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@unfairness@bcs0:
    - Statuses : 2 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 15.36] s

  * igt@gem_exec_schedule@unfairness@rcs0:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [3.78, 14.49] s

  * igt@gem_exec_schedule@unfairness@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [15.55] s

  * igt@gem_exec_schedule@unfairness@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [15.43] s

  * igt@gem_exec_schedule@unfairness@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [15.44] s

  

Known issues
------------

  Here are the changes found in IGTPW_4632_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_mmap_offset@open-flood:
    - shard-glk:          [PASS][8] -> [TIMEOUT][9] ([i915#1958]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk9/igt@gem_mmap_offset@open-flood.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-glk8/igt@gem_mmap_offset@open-flood.html
    - shard-apl:          [PASS][10] -> [TIMEOUT][11] ([i915#1635]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl2/igt@gem_mmap_offset@open-flood.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl4/igt@gem_mmap_offset@open-flood.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][12] -> [DMESG-WARN][13] ([i915#1436] / [i915#716])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#54] / [i915#93] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#54])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-random:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#54]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#70] / [i915#93] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl1/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#1566] / [i915#93] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#52] / [i915#54] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][30] -> [SKIP][31] ([i915#433])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [PASS][32] -> [INCOMPLETE][33] ([i915#1602] / [i915#456])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#1559] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([i915#1559] / [i915#93] / [i915#95])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [DMESG-WARN][42] ([i915#180]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-snb:          [FAIL][44] ([i915#1930]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-glk:          [TIMEOUT][46] ([i915#1958]) -> [PASS][47] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk5/igt@gem_exec_reloc@basic-cpu-read.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-glk7/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][48] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][49] +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-apl:          [FAIL][52] ([i915#70] / [i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
    - shard-kbl:          [FAIL][54] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-tglb:         [INCOMPLETE][56] -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-tglb7/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-tglb1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][58] ([i915#1925] / [i915#1926]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][60] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][62] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-kbl:          [FAIL][64] ([i915#52] / [i915#93] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl1/igt@kms_draw_crc@fill-fb.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl2/igt@kms_draw_crc@fill-fb.html
    - shard-apl:          [FAIL][66] ([i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl8/igt@kms_draw_crc@fill-fb.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl7/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][68] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][70] ([i915#1525] / [i915#95]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_fbcon_fbt@fbc.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][72] ([i915#180] / [i915#95]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][74] ([i915#83]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-tglb6/igt@kms_panel_fitting@atomic-fastset.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-tglb2/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [FAIL][76] ([i915#83]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][78] ([fdo#109441]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb6/igt@kms_psr@psr2_primary_render.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][80] ([i915#31]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl3/igt@kms_setmode@basic.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl1/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][82] ([i915#588]) -> [SKIP][83] ([i915#658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][84] ([i915#1899]) -> [FAIL][85] ([i915#454])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
    - shard-tglb:         [FAIL][86] ([i915#1899]) -> [FAIL][87] ([i915#454])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][88] ([i915#1319] / [i915#1635]) -> [FAIL][89] ([fdo#110321] / [fdo#110336])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_content_protection@atomic.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][90] ([i915#1319]) -> [TIMEOUT][91] ([i915#1319] / [i915#1635])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl6/igt@kms_content_protection@legacy.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][92] ([i915#1319] / [i915#1635]) -> [FAIL][93] ([fdo#110321])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl8/igt@kms_content_protection@lic.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][94] ([fdo#110321]) -> [DMESG-FAIL][95] ([fdo#110321] / [i915#95])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@kms_content_protection@srm.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [DMESG-FAIL][96] ([i915#1925] / [i915#1926]) -> [DMESG-WARN][97] ([i915#1926])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-glk4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-apl:          [SKIP][98] ([fdo#109271]) -> [TIMEOUT][99] ([i915#1635])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-kbl:          [FAIL][100] ([fdo#108145] / [i915#265]) -> [FAIL][101] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
    - shard-apl:          [FAIL][102] ([fdo#108145] / [i915#265]) -> [FAIL][103] ([fdo#108145] / [i915#265] / [i915#95])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [FAIL][104] ([i915#608]) -> [SKIP][105] ([i915#1911])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-tglb1/igt@kms_psr2_su@page_flip.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-tglb8/igt@kms_psr2_su@page_flip.html
    - shard-iclb:         [FAIL][106] ([i915#608]) -> [SKIP][107] ([i915#1911])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5690 -> IGTPW_4632
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8567: d36c7a9807541df70739a5917cbbab42fdf66a29 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4632: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/index.html
  IGT_5690: bea881189520a9cccbb1c1cb454ac5b6fdaea40e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4632/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
