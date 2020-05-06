Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 06 May 2020 02:29:53 -0000
Message-ID: <158873219393.11897.11473066849358670683@emeril.freedesktop.org>
References: <20200505133836.2873640-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200505133836.2873640-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915=3A_Report_scheduler_c?=
 =?utf-8?q?aps_for_timeslicing?=
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

Series: series starting with [i-g-t,1/2] lib/i915: Report scheduler caps for timeslicing
URL   : https://patchwork.freedesktop.org/series/76956/
State : success

== Summary ==

CI Bug Log - changes from IGT_5633_full -> IGTPW_4535_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4535_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_fence@syncobj-future-self@vecs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +31 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-iclb3/igt@gem_exec_fence@syncobj-future-self@vecs0.html

  * {igt@gem_exec_fence@syncobj-future@vecs0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +39 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-tglb3/igt@gem_exec_fence@syncobj-future@vecs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_fence@flip}:
    - shard-iclb:         [SKIP][3] ([i915#1837]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb8/igt@gem_exec_fence@flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-iclb1/igt@gem_exec_fence@flip.html
    - shard-tglb:         [SKIP][5] ([i915#1837]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-tglb7/igt@gem_exec_fence@flip.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-tglb8/igt@gem_exec_fence@flip.html

  
New tests
---------

  New tests have been introduced between IGT_5633_full and IGTPW_4535_full:

### New IGT tests (49) ###

  * igt@gem_exec_fence@syncobj-future:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@syncobj-future-deadlock:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@syncobj-future-deadlock@bcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.00] s

  * igt@gem_exec_fence@syncobj-future-deadlock@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.00] s

  * igt@gem_exec_fence@syncobj-future-deadlock@vcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-deadlock@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-deadlock@vecs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-past:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@syncobj-future-past@bcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_exec_fence@syncobj-future-past@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-past@vcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-past@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@gem_exec_fence@syncobj-future-past@vecs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-self:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@syncobj-future-self-submit:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@syncobj-future-self-submit@bcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-self-submit@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-self-submit@vcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-self-submit@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-self-submit@vecs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-self@bcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-self@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.00] s

  * igt@gem_exec_fence@syncobj-future-self@vcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-self@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@gem_exec_fence@syncobj-future-self@vecs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-submit:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@syncobj-future-submit-deadlock:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@syncobj-future-submit-deadlock@bcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-submit-deadlock@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-submit-deadlock@vcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit-deadlock@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit-deadlock@vecs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-submit-past:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@syncobj-future-submit-past@bcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit-past@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future-submit-past@vcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit-past@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit-past@vecs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit@bcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit@vcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit@vecs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future@bcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future@rcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future@vcs0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-future@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@gem_exec_fence@syncobj-future@vecs0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-incomplete-wait-submit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4535_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-iclb8/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#716])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#49])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#49] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1559] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#1559] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][27] ([i915#180]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-kbl2/igt@gem_softpin@noreloc-s3.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][29] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][31] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-apl:          [DMESG-WARN][33] ([i915#180]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@b-vga1}:
    - shard-snb:          [DMESG-WARN][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-snb6/igt@kms_flip@flip-vs-suspend@b-vga1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-snb1/igt@kms_flip@flip-vs-suspend@b-vga1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-kbl:          [FAIL][37] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][39] ([i915#433]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
    - shard-iclb:         [SKIP][41] ([i915#433]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-iclb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][43] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][45] ([i915#1559] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * {igt@kms_prime@basic-crc@second-to-first}:
    - shard-apl:          [FAIL][47] ([i915#95]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [FAIL][49] ([i915#93] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-kbl2/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][53] ([i915#31]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl7/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl2/igt@kms_setmode@basic.html
    - shard-hsw:          [FAIL][55] ([i915#31]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-hsw1/igt@kms_setmode@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-hsw1/igt@kms_setmode@basic.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][57] ([i915#1542]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-hsw6/igt@perf@polling-parameterized.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-hsw7/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][59] ([i915#658]) -> [SKIP][60] ([i915#588])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][61] ([i915#454]) -> [SKIP][62] ([i915#468])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][63] ([i915#468]) -> [FAIL][64] ([i915#454])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][65] ([i915#1319]) -> [FAIL][66] ([fdo#110321] / [fdo#110336])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl8/igt@kms_content_protection@atomic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][67] ([fdo#110321] / [fdo#110336] / [i915#95]) -> [TIMEOUT][68] ([i915#1319])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][69] ([fdo#110321]) -> [TIMEOUT][70] ([i915#1319])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-apl6/igt@kms_content_protection@lic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          [FAIL][71] ([fdo#108145] / [i915#265]) -> [FAIL][72] ([fdo#108145] / [i915#265] / [i915#62])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][73] ([i915#608]) -> [SKIP][74] ([fdo#109642] / [fdo#111068])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5633/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/shard-iclb5/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1837]: https://gitlab.freedesktop.org/drm/intel/issues/1837
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5633 -> IGTPW_4535

  CI-20190529: 20190529
  CI_DRM_8430: 2daa6f8cad645f49a898158190a20a893b4aabe3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4535: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/index.html
  IGT_5633: c8c2e5ed5cd8e4b7a69a903f3f1653612086abcc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4535/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
