Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 06:11:30 -0000
Message-ID: <159107829029.21429.9853877349759994210@emeril.freedesktop.org>
References: <20200601190809.1174616-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200601190809.1174616-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev3=29?=
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

Series: i915/gem_exec_schedule: Try to spot unfairness (rev3)
URL   : https://patchwork.freedesktop.org/series/77887/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8567_full -> IGTPW_4633_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4633_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4633_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4633_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fairness@bcs0} (NEW):
    - shard-iclb:         NOTRUN -> [INCOMPLETE][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-iclb8/igt@gem_exec_schedule@fairness@bcs0.html

  * {igt@gem_exec_schedule@fairness@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-iclb8/igt@gem_exec_schedule@fairness@rcs0.html

  * {igt@gem_exec_schedule@unfairness@bcs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][3] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl6/igt@gem_exec_schedule@unfairness@bcs0.html
    - shard-glk:          NOTRUN -> [FAIL][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-glk1/igt@gem_exec_schedule@unfairness@bcs0.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-tglb5/igt@gem_exec_schedule@unfairness@bcs0.html

  * {igt@gem_exec_schedule@unfairness@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-tglb5/igt@gem_exec_schedule@unfairness@rcs0.html

  * {igt@gem_exec_schedule@unfairness@vcs0} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl7/igt@gem_exec_schedule@unfairness@vcs0.html

  * igt@kms_plane@plane-panning-top-left-pipe-c-planes:
    - shard-kbl:          [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl2/igt@kms_plane@plane-panning-top-left-pipe-c-planes.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl2/igt@kms_plane@plane-panning-top-left-pipe-c-planes.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8567_full and IGTPW_4633_full:

### New IGT tests (12) ###

  * igt@gem_exec_schedule@fairness:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fairness@bcs0:
    - Statuses : 2 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 13.41] s

  * igt@gem_exec_schedule@fairness@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [3.35, 13.40] s

  * igt@gem_exec_schedule@fairness@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [13.22, 13.40] s

  * igt@gem_exec_schedule@fairness@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [13.23] s

  * igt@gem_exec_schedule@fairness@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [13.25, 13.36] s

  * igt@gem_exec_schedule@unfairness:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@unfairness@bcs0:
    - Statuses : 3 fail(s) 2 incomplete(s)
    - Exec time: [0.0, 15.31] s

  * igt@gem_exec_schedule@unfairness@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [3.98, 14.85] s

  * igt@gem_exec_schedule@unfairness@vcs0:
    - Statuses : 3 fail(s)
    - Exec time: [11.38, 15.42] s

  * igt@gem_exec_schedule@unfairness@vcs1:
    - Statuses : 1 fail(s)
    - Exec time: [15.39] s

  * igt@gem_exec_schedule@unfairness@vecs0:
    - Statuses : 3 fail(s)
    - Exec time: [11.37, 11.58] s

  

Known issues
------------

  Here are the changes found in IGTPW_4633_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_render_copy@x-tiled:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#1927])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk7/igt@gem_render_copy@x-tiled.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-glk8/igt@gem_render_copy@x-tiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][12] -> [INCOMPLETE][13] ([i915#155]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#1119] / [i915#118] / [i915#95]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][18] -> [DMESG-WARN][19] ([i915#180]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#70] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#70] / [i915#93] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#72])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#49])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#93] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl7/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-top-left-pipe-a-planes:
    - shard-apl:          [PASS][32] -> [TIMEOUT][33] ([i915#1635]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl4/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][34] -> [FAIL][35] ([i915#1559] / [i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][36] -> [FAIL][37] ([i915#1559] / [i915#93] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109441]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [DMESG-WARN][40] ([i915#180]) -> [PASS][41] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-glk:          [TIMEOUT][42] ([i915#1958]) -> [PASS][43] +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk5/igt@gem_exec_reloc@basic-cpu-read.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-glk6/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][44] ([i915#1899]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [FAIL][46] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][48] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][49] +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-apl:          [FAIL][52] ([i915#70] / [i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl8/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
    - shard-kbl:          [FAIL][54] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-tglb:         [INCOMPLETE][56] -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-tglb7/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-tglb3/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][58] ([i915#1925] / [i915#1926]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][60] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][62] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-kbl:          [FAIL][64] ([i915#52] / [i915#93] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl1/igt@kms_draw_crc@fill-fb.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl2/igt@kms_draw_crc@fill-fb.html
    - shard-apl:          [FAIL][66] ([i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl8/igt@kms_draw_crc@fill-fb.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl1/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][68] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][70] ([i915#1525] / [i915#95]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_fbcon_fbt@fbc.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl1/igt@kms_fbcon_fbt@fbc.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][72] ([i915#61]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][74] ([i915#180] / [i915#95]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][76] ([i915#83]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-tglb6/igt@kms_panel_fitting@atomic-fastset.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-tglb1/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [FAIL][78] ([i915#83]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][80] ([fdo#109441]) -> [PASS][81] +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb5/igt@kms_psr@psr2_suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-iclb2/igt@kms_psr@psr2_suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][82] ([i915#588]) -> [SKIP][83] ([i915#658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][84] ([i915#1899]) -> [FAIL][85] ([i915#454])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-apl:          [SKIP][86] ([fdo#109271]) -> [TIMEOUT][87] ([i915#1635]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl6/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl4/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][88] ([i915#1319] / [i915#1635]) -> [TIMEOUT][89] ([i915#1319])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_content_protection@atomic.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][90] ([i915#1319]) -> [TIMEOUT][91] ([i915#1319] / [i915#1635])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl6/igt@kms_content_protection@legacy.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][92] ([i915#1319] / [i915#1635]) -> [FAIL][93] ([fdo#110321] / [i915#95])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl8/igt@kms_content_protection@lic.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][94] ([fdo#110321]) -> [TIMEOUT][95] ([i915#1319] / [i915#1635])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl4/igt@kms_content_protection@srm.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][96] ([i915#357]) -> [FAIL][97] ([i915#357] / [i915#93] / [i915#95])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl7/igt@kms_content_protection@uevent.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl7/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][98] ([i915#357]) -> [FAIL][99] ([i915#357] / [i915#95])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl1/igt@kms_content_protection@uevent.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [DMESG-FAIL][100] ([i915#1925] / [i915#1926]) -> [DMESG-WARN][101] ([i915#1926])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-glk4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-glk1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [FAIL][102] ([fdo#108145] / [i915#265]) -> [FAIL][103] ([fdo#108145] / [i915#265] / [i915#95])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [FAIL][104] ([fdo#108145] / [i915#265]) -> [FAIL][105] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][106] ([i915#608]) -> [SKIP][107] ([fdo#109642] / [fdo#111068])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8567/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/shard-iclb7/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5690 -> IGTPW_4633
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8567: d36c7a9807541df70739a5917cbbab42fdf66a29 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4633: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/index.html
  IGT_5690: bea881189520a9cccbb1c1cb454ac5b6fdaea40e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4633/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
