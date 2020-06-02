Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 12:02:41 -0000
Message-ID: <159109936148.21428.675387165596211676@emeril.freedesktop.org>
References: <20200602082245.1356782-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200602082245.1356782-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness_=28rev6=29?=
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

Series: i915/gem_exec_schedule: Try to spot unfairness (rev6)
URL   : https://patchwork.freedesktop.org/series/77887/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8568_full -> IGTPW_4635_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4635_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-half@bcs0} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-tglb3/igt@gem_exec_schedule@fair-half@bcs0.html

  * {igt@gem_exec_schedule@fair-solo@bcs0} (NEW):
    - shard-iclb:         NOTRUN -> [INCOMPLETE][2] +6 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-iclb1/igt@gem_exec_schedule@fair-solo@bcs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-kbl:          [FAIL][3] ([i915#1930]) -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl6/igt@gem_exec_reloc@basic-concurrent16.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl1/igt@gem_exec_reloc@basic-concurrent16.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8568_full and IGTPW_4635_full:

### New IGT tests (42) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.45, 8.89] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.78, 8.92] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.72] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.73, 8.91] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.60, 8.94] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.91, 8.94] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.95] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.92, 8.96] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.28, 10.21] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [9.87, 10.61] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [9.93] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [9.93, 10.73] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.42, 8.65] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.54, 8.68] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.48] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.53, 8.68] s

  * igt@gem_exec_schedule@fair-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-solo@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.31, 8.60] s

  * igt@gem_exec_schedule@fair-solo@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.46, 8.57] s

  * igt@gem_exec_schedule@fair-solo@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.46] s

  * igt@gem_exec_schedule@fair-solo@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.50, 8.57] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.44, 8.97] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.81, 9.00] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.84] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.82, 8.98] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 2 incomplete(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.34, 8.59] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.44, 8.61] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.43] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.44, 8.59] s

  

Known issues
------------

  Here are the changes found in IGTPW_4635_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#1528])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl7/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl4/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-glk:          [PASS][7] -> [TIMEOUT][8] ([i915#1958]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk1/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-glk1/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#1927])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk8/igt@gem_exec_reloc@basic-write-wc-noreloc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-glk2/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#1479] / [i915#1772])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl4/igt@gem_exec_whisper@basic-queues-priority.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl1/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][15] -> [SKIP][16] ([i915#1904])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][17] -> [WARN][18] ([i915#1519])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([i915#155])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#72])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#52] / [i915#54] / [i915#95]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][33] -> [FAIL][34] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#53] / [i915#93] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#53] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@oa-formats:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([i915#405])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb7/igt@perf@oa-formats.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-iclb3/igt@perf@oa-formats.html
    - shard-glk:          [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk4/igt@perf@oa-formats.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-glk4/igt@perf@oa-formats.html
    - shard-apl:          [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl2/igt@perf@oa-formats.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl1/igt@perf@oa-formats.html
    - shard-kbl:          [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl7/igt@perf@oa-formats.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl3/igt@perf@oa-formats.html
    - shard-hsw:          [PASS][53] -> [SKIP][54] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw1/igt@perf@oa-formats.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-hsw4/igt@perf@oa-formats.html
    - shard-tglb:         [PASS][55] -> [SKIP][56] ([i915#405])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-tglb1/igt@perf@oa-formats.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-tglb7/igt@perf@oa-formats.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-glk:          [TIMEOUT][59] ([i915#1958]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk6/igt@gem_exec_reloc@basic-cpu-read.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-glk4/igt@gem_exec_reloc@basic-cpu-read.html

  * {igt@gem_exec_schedule@implicit-write-read@rcs0}:
    - shard-snb:          [INCOMPLETE][61] ([i915#82]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-snb6/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-snb4/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [INCOMPLETE][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl8/igt@gem_workarounds@suspend-resume-fd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][65] ([i915#1436] / [i915#716]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][67] ([i915#1899]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-hsw:          [INCOMPLETE][69] ([i915#151] / [i915#61]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw8/igt@i915_pm_rpm@system-suspend-devices.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-hsw6/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][71] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-apl:          [FAIL][73] ([i915#70] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
    - shard-kbl:          [FAIL][75] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [DMESG-WARN][77] ([i915#1926]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-glk2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][79] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][81] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][83] ([i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl2/igt@kms_draw_crc@fill-fb.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl4/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][85] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][87] ([i915#1525] / [i915#95]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_fbcon_fbt@fbc.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl4/igt@kms_fbcon_fbt@fbc.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][89] ([i915#61]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][91] ([i915#83]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-tglb8/igt@kms_panel_fitting@atomic-fastset.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-tglb6/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [FAIL][93] ([i915#83]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][95] ([i915#173]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb1/igt@kms_psr@no_drrs.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-iclb7/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][97] ([fdo#109441]) -> [PASS][98] +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][99] ([i915#31]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_setmode@basic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][101] ([i915#180]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][103] ([i915#1542]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw6/igt@perf@polling-parameterized.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-hsw8/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][105] ([i915#658]) -> [SKIP][106] ([i915#588])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][107] ([i915#468]) -> [FAIL][108] ([i915#454])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][109] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][110] ([i915#1319] / [i915#1635])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_content_protection@atomic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][111] ([i915#1319] / [i915#1635]) -> [FAIL][112] ([fdo#110321])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl2/igt@kms_content_protection@lic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][113] ([fdo#110321]) -> [TIMEOUT][114] ([i915#1319] / [i915#1635])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_content_protection@srm.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding:
    - shard-glk:          [SKIP][115] ([fdo#109271]) -> [TIMEOUT][116] ([i915#1958]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk6/igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-glk1/igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-WARN][117] ([i915#1926]) -> [DMESG-FAIL][118] ([i915#1925] / [i915#1926])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/shard-glk4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1479]: https://gitlab.freedesktop.org/drm/intel/issues/1479
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#1772]: https://gitlab.freedesktop.org/drm/intel/issues/1772
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
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
  * IGT: IGT_5690 -> IGTPW_4635
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8568: 124bafc80c3ce62fc61b8eabb2657c87424b999b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4635: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/index.html
  IGT_5690: bea881189520a9cccbb1c1cb454ac5b6fdaea40e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4635/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
