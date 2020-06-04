Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 04 Jun 2020 10:20:54 -0000
Message-ID: <159126605495.14553.17856943788810045225@emeril.freedesktop.org>
References: <20200603234758.1961637-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200603234758.1961637-1-chris@chris-wilson.co.uk>
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
URL   : https://patchwork.freedesktop.org/series/77973/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8579_full -> IGTPW_4648_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4648_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-next-share@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][1] +61 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-iclb6/igt@gem_exec_schedule@fair-next-share@rcs0.html

  * {igt@gem_exec_schedule@fair-next@bcs0} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-tglb1/igt@gem_exec_schedule@fair-next@bcs0.html

  * {igt@gem_exec_schedule@fair-none-ping@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][3] +65 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-tglb3/igt@gem_exec_schedule@fair-none-ping@rcs0.html

  * {igt@gem_exec_schedule@fair-pace@rcs0} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][4] +32 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl6/igt@gem_exec_schedule@fair-pace@rcs0.html

  * {igt@gem_exec_schedule@fair-pace@vecs0} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][5] +41 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl7/igt@gem_exec_schedule@fair-pace@vecs0.html

  * {igt@gem_exec_schedule@fair-solo@rcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][6] +37 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-glk2/igt@gem_exec_schedule@fair-solo@rcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8579_full and IGTPW_4648_full:

### New IGT tests (90) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.35] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.17, 6.54] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [2.10, 6.55] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [2.10, 6.35] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.10, 8.82] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 4.27] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [4.41, 6.62] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [6.41, 11.43] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [8.93, 10.86] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [4.27, 11.48] s

  * igt@gem_exec_schedule@fair-next:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-next-share@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.35] s

  * igt@gem_exec_schedule@fair-next-share@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.17, 6.57] s

  * igt@gem_exec_schedule@fair-next-share@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.10, 6.56] s

  * igt@gem_exec_schedule@fair-next-share@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [4.21, 4.33] s

  * igt@gem_exec_schedule@fair-next-share@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.10, 6.55] s

  * igt@gem_exec_schedule@fair-next@bcs0:
    - Statuses : 1 fail(s) 1 incomplete(s) 3 skip(s)
    - Exec time: [0.0, 2.12] s

  * igt@gem_exec_schedule@fair-next@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.32, 6.52] s

  * igt@gem_exec_schedule@fair-next@vcs0:
    - Statuses : 3 fail(s) 1 pass(s)
    - Exec time: [2.11, 6.55] s

  * igt@gem_exec_schedule@fair-next@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [6.54] s

  * igt@gem_exec_schedule@fair-next@vecs0:
    - Statuses : 4 fail(s)
    - Exec time: [2.12, 4.66] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-ping@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 5.09] s

  * igt@gem_exec_schedule@fair-none-ping@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.87, 4.83] s

  * igt@gem_exec_schedule@fair-none-ping@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.88, 8.09] s

  * igt@gem_exec_schedule@fair-none-ping@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [2.88, 5.20] s

  * igt@gem_exec_schedule@fair-none-ping@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.86, 5.28] s

  * igt@gem_exec_schedule@fair-none-rrul:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-rrul@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 4.36] s

  * igt@gem_exec_schedule@fair-none-rrul@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.09, 4.48] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.07, 6.71] s

  * igt@gem_exec_schedule@fair-none-rrul@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [2.07, 4.44] s

  * igt@gem_exec_schedule@fair-none-rrul@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.07, 6.93] s

  * igt@gem_exec_schedule@fair-none-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-share@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 7.30] s

  * igt@gem_exec_schedule@fair-none-share@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.56, 5.03] s

  * igt@gem_exec_schedule@fair-none-share@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.57, 7.63] s

  * igt@gem_exec_schedule@fair-none-share@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [2.57, 4.92] s

  * igt@gem_exec_schedule@fair-none-share@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.57, 7.26] s

  * igt@gem_exec_schedule@fair-none-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none-vip@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 4.95] s

  * igt@gem_exec_schedule@fair-none-vip@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.57, 7.39] s

  * igt@gem_exec_schedule@fair-none-vip@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.61, 7.44] s

  * igt@gem_exec_schedule@fair-none-vip@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [4.94, 5.19] s

  * igt@gem_exec_schedule@fair-none-vip@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.61, 7.83] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 4.85] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.89, 4.81] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.57, 7.64] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [4.87, 4.95] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.57, 7.53] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-share:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace-share@bcs0:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 6.30] s

  * igt@gem_exec_schedule@fair-pace-share@rcs0:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [4.22, 6.38] s

  * igt@gem_exec_schedule@fair-pace-share@vcs0:
    - Statuses : 2 fail(s)
    - Exec time: [4.19, 4.24] s

  * igt@gem_exec_schedule@fair-pace-share@vcs1:
    - Statuses : 1 fail(s)
    - Exec time: [4.18] s

  * igt@gem_exec_schedule@fair-pace-share@vecs0:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [4.20, 6.36] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 4.18] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [2.18, 6.35] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.10, 6.41] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [4.20, 4.21] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.10, 6.39] s

  * igt@gem_exec_schedule@fair-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-solo@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 6.21] s

  * igt@gem_exec_schedule@fair-solo@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [2.22, 8.43] s

  * igt@gem_exec_schedule@fair-solo@vcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [2.09, 8.59] s

  * igt@gem_exec_schedule@fair-solo@vcs1:
    - Statuses : 3 fail(s)
    - Exec time: [2.09, 4.19] s

  * igt@gem_exec_schedule@fair-solo@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.09, 8.59] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 4.22] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [4.31, 10.62] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [4.20, 8.79] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [4.21, 8.46] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [4.21, 9.00] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync-vip@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 4.21] s

  * igt@gem_exec_schedule@fair-sync-vip@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.16, 8.79] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.08, 4.40] s

  * igt@gem_exec_schedule@fair-sync-vip@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [4.21, 6.40] s

  * igt@gem_exec_schedule@fair-sync-vip@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.08, 6.47] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 4.16] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [2.18, 6.29] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.08, 4.26] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [4.16, 4.20] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [2.08, 4.21] s

  

Known issues
------------

  Here are the changes found in IGTPW_4648_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-apl:          [PASS][9] -> [TIMEOUT][10] ([i915#1572] / [i915#1635])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl8/igt@gem_mmap_gtt@medium-copy-odd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl8/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#95]) +38 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_color@pipe-b-ctm-max.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl6/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1926])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-glk2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-apl:          [PASS][25] -> [TIMEOUT][26] ([i915#1635]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([fdo#108145] / [i915#54] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([fdo#108145] / [i915#54] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#93] / [i915#95]) +45 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-farfromfence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#95]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-iclb:         [PASS][41] -> [INCOMPLETE][42] ([i915#1185] / [i915#250])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-kbl:          [PASS][43] -> [INCOMPLETE][44] ([i915#155] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][45] -> [DMESG-FAIL][46] ([fdo#108145] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][47] -> [DMESG-FAIL][48] ([fdo#108145] / [i915#95])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][51] -> [FAIL][52] ([i915#31])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_setmode@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl3/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-kbl:          [FAIL][53] ([fdo#103375]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * {igt@gem_ctx_isolation@preservation-s3@vcs0}:
    - shard-kbl:          [INCOMPLETE][55] ([i915#1780]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * {igt@gem_exec_fence@syncobj-channel}:
    - shard-hsw:          [DMESG-WARN][57] ([i915#1927]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-hsw4/igt@gem_exec_fence@syncobj-channel.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-hsw4/igt@gem_exec_fence@syncobj-channel.html

  * {igt@gem_exec_schedule@implicit-write-read@rcs0}:
    - shard-snb:          [INCOMPLETE][59] ([i915#82]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-snb5/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-snb2/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [DMESG-WARN][61] ([i915#118] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [TIMEOUT][63] ([i915#1635]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-tglb:         [DMESG-WARN][67] ([i915#402]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [DMESG-FAIL][69] ([i915#54] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [DMESG-WARN][71] ([i915#95]) -> [PASS][72] +31 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@pipe-a-torture-move:
    - shard-hsw:          [INCOMPLETE][73] ([i915#61]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-hsw4/igt@kms_cursor_legacy@pipe-a-torture-move.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-hsw4/igt@kms_cursor_legacy@pipe-a-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-apl:          [DMESG-FAIL][75] ([i915#54] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][79] ([i915#1982]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][83] ([i915#49]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-glk:          [FAIL][85] ([i915#49]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [DMESG-FAIL][87] ([i915#49] / [i915#95]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][89] ([fdo#109642] / [fdo#111068]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180]) -> [PASS][94] +5 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-hang:
    - shard-glk:          [INCOMPLETE][95] ([i915#1927] / [i915#58] / [k.org#198133]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html

  * {igt@perf_pmu@module-unload}:
    - shard-iclb:         [DMESG-WARN][97] ([i915#1982]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb6/igt@perf_pmu@module-unload.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-iclb3/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [TIMEOUT][99] ([i915#1958]) -> [PASS][100] +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk5/igt@perf_pmu@rc6-runtime-pm.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-glk5/igt@perf_pmu@rc6-runtime-pm.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-kbl:          [DMESG-WARN][101] ([i915#93] / [i915#95]) -> [PASS][102] +38 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@syncobj_wait@invalid-wait-zero-handles.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-kbl4/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][103] ([i915#454]) -> [SKIP][104] ([i915#468])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][105] ([i915#1319]) -> [TIME

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4648/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
