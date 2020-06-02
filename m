Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 16:57:25 -0000
Message-ID: <159111704569.21430.2065066558611163011@emeril.freedesktop.org>
References: <20200602100551.1413463-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200602100551.1413463-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fexec=5Fschedule=3A_?=
 =?utf-8?q?Try_to_spot_unfairness?=
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

Series: series starting with [i-g-t,1/2] i915/gem_exec_schedule: Try to spot unfairness
URL   : https://patchwork.freedesktop.org/series/77911/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8571_full -> IGTPW_4638_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4638_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-half@bcs0} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-tglb2/igt@gem_exec_schedule@fair-half@bcs0.html

  * {igt@gem_exec_schedule@fair-solo@bcs0} (NEW):
    - shard-iclb:         NOTRUN -> [INCOMPLETE][2] +6 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-iclb5/igt@gem_exec_schedule@fair-solo@bcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8571_full and IGTPW_4638_full:

### New IGT tests (42) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.45, 8.91] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.73, 8.91] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.74] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.75, 8.91] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.56, 8.93] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.83, 8.96] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.82] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.79, 8.94] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.33, 10.23] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [10.01, 10.53] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [9.87] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [9.89, 10.69] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.41, 8.65] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.52, 8.64] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.52] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.51, 8.65] s

  * igt@gem_exec_schedule@fair-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-solo@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.33, 8.69] s

  * igt@gem_exec_schedule@fair-solo@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.43, 8.58] s

  * igt@gem_exec_schedule@fair-solo@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.50] s

  * igt@gem_exec_schedule@fair-solo@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.44, 8.57] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.44, 8.85] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.78, 8.80] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.81] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.81, 8.94] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 2 incomplete(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.36, 8.63] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [8.46, 8.54] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.47] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [8.46, 8.61] s

  

Known issues
------------

  Here are the changes found in IGTPW_4638_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile@rcs0:
    - shard-iclb:         [PASS][3] -> [FAIL][4] ([i915#1622])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb8/igt@gem_ctx_persistence@engines-hostile@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-iclb2/igt@gem_ctx_persistence@engines-hostile@rcs0.html
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#1622])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk8/igt@gem_ctx_persistence@engines-hostile@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-glk4/igt@gem_ctx_persistence@engines-hostile@rcs0.html

  * igt@gem_exec_capture@userptr:
    - shard-glk:          [PASS][7] -> [INCOMPLETE][8] ([i915#1927] / [i915#58] / [k.org#198133])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk7/igt@gem_exec_capture@userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-glk6/igt@gem_exec_capture@userptr.html

  * igt@gem_pipe_control_store_loop@fresh-buffer:
    - shard-glk:          [PASS][9] -> [TIMEOUT][10] ([i915#1958]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk9/igt@gem_pipe_control_store_loop@fresh-buffer.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-glk1/igt@gem_pipe_control_store_loop@fresh-buffer.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [PASS][15] -> [DMESG-FAIL][16] ([i915#1925] / [i915#1926])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109349])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#53] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#53] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:
    - shard-snb:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-snb2/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-snb4/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([fdo#108145] / [i915#265] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Possible fixes ####

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-snb:          [FAIL][31] ([i915#1930]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-glk:          [TIMEOUT][33] ([i915#1958]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk6/igt@gem_exec_reloc@basic-cpu-read.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-glk5/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][35] ([i915#1436] / [i915#716]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-glk2/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [DMESG-WARN][37] ([i915#1436] / [i915#716]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-kbl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-iclb:         [INCOMPLETE][39] ([i915#189]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][41] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-apl:          [FAIL][43] ([i915#70] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl6/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-apl2/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
    - shard-kbl:          [FAIL][45] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-kbl1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][47] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][49] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][51] ([i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl8/igt@kms_draw_crc@fill-fb.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-apl2/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][53] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-kbl7/igt@kms_fbcon_fbt@fbc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-kbl7/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][55] ([i915#1525] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl1/igt@kms_fbcon_fbt@fbc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-apl8/igt@kms_fbcon_fbt@fbc.html

  * {igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-vga1-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][57] ([i915#1927] / [i915#61]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-hsw8/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-vga1-hdmi-a1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-hsw8/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-vga1-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +6 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][61] ([i915#83]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-tglb6/igt@kms_panel_fitting@atomic-fastset.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-tglb8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][63] ([fdo#109441]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][65] ([i915#1319] / [i915#1635]) -> [FAIL][66] ([fdo#110321] / [fdo#110336] / [i915#95])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl4/igt@kms_content_protection@atomic-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-apl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][67] ([fdo#110321]) -> [TIMEOUT][68] ([i915#1319] / [i915#1635])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-apl6/igt@kms_content_protection@srm.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [SKIP][69] ([fdo#109271]) -> [TIMEOUT][70] ([i915#1958]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/shard-glk2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1622]: https://gitlab.freedesktop.org/drm/intel/issues/1622
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5690 -> IGTPW_4638
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8571: 0536dff30eff69abcf6355bdd9b9fdf45a560099 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4638: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/index.html
  IGT_5690: bea881189520a9cccbb1c1cb454ac5b6fdaea40e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4638/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
