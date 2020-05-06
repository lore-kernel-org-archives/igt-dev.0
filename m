Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 06 May 2020 18:15:06 -0000
Message-ID: <158878890668.11895.7415409161465260887@emeril.freedesktop.org>
References: <20200506150218.3811-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200506150218.3811-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3A_Adjusted_test_to_utilize_all_available_e?=
 =?utf-8?q?ngines=2E?=
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
To: sai gowtham <sai.gowtham.ch@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ringfill: Adjusted test to utilize all available engines.
URL   : https://patchwork.freedesktop.org/series/77001/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8434_full -> IGTPW_4539_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4539_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4539_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4539_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-tglb8/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8434_full and IGTPW_4539_full:

### New IGT tests (70) ###

  * igt@gem_ringfill@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-fd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-fd@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@gem_ringfill@basic-fd@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@gem_ringfill@basic-fd@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@gem_ringfill@basic-fd@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@gem_ringfill@basic-fd@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@gem_ringfill@basic-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-forked@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-forked@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-forked@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@gem_ringfill@basic-forked@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_ringfill@basic-forked@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_ringfill@basic-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-hang@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [10.75, 15.06] s

  * igt@gem_ringfill@basic-hang@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [10.75, 15.41] s

  * igt@gem_ringfill@basic-hang@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 15.04] s

  * igt@gem_ringfill@basic-hang@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [14.97, 14.98] s

  * igt@gem_ringfill@basic-hang@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [10.75, 15.04] s

  * igt@gem_ringfill@basic-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-interruptible@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.08, 1.13] s

  * igt@gem_ringfill@basic-interruptible@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.08, 1.18] s

  * igt@gem_ringfill@basic-interruptible@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.12] s

  * igt@gem_ringfill@basic-interruptible@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [1.09, 1.12] s

  * igt@gem_ringfill@basic-interruptible@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.09, 1.12] s

  * igt@gem_ringfill@basic@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@basic@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_ringfill@basic@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ringfill@basic@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@basic@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@legacy-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-basic-fd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-basic-fd@blt:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@gem_ringfill@legacy-basic-fd@bsd:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@gem_ringfill@legacy-basic-fd@bsd1:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@gem_ringfill@legacy-basic-fd@bsd2:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_ringfill@legacy-basic-fd@default:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@gem_ringfill@legacy-basic-fd@render:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 0.10] s

  * igt@gem_ringfill@legacy-basic-fd@vebox:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@gem_ringfill@legacy-basic-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-basic-forked@blt:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_ringfill@legacy-basic-forked@bsd:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@gem_ringfill@legacy-basic-forked@bsd1:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@gem_ringfill@legacy-basic-forked@bsd2:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_ringfill@legacy-basic-forked@default:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_ringfill@legacy-basic-forked@render:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@legacy-basic-forked@vebox:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@gem_ringfill@legacy-basic-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-basic-hang@blt:
    - Statuses : 7 pass(s)
    - Exec time: [10.76, 15.05] s

  * igt@gem_ringfill@legacy-basic-hang@bsd:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 15.03] s

  * igt@gem_ringfill@legacy-basic-hang@bsd1:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 15.04] s

  * igt@gem_ringfill@legacy-basic-hang@bsd2:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 15.04] s

  * igt@gem_ringfill@legacy-basic-hang@default:
    - Statuses : 7 pass(s)
    - Exec time: [10.75, 15.48] s

  * igt@gem_ringfill@legacy-basic-hang@render:
    - Statuses : 7 pass(s)
    - Exec time: [10.75, 15.04] s

  * igt@gem_ringfill@legacy-basic-hang@vebox:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 15.04] s

  * igt@gem_ringfill@legacy-basic-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@legacy-basic-interruptible@blt:
    - Statuses : 7 pass(s)
    - Exec time: [1.08, 1.11] s

  * igt@gem_ringfill@legacy-basic-interruptible@bsd:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.10] s

  * igt@gem_ringfill@legacy-basic-interruptible@bsd1:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.13] s

  * igt@gem_ringfill@legacy-basic-interruptible@bsd2:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.09] s

  * igt@gem_ringfill@legacy-basic-interruptible@default:
    - Statuses : 7 pass(s)
    - Exec time: [1.08, 1.16] s

  * igt@gem_ringfill@legacy-basic-interruptible@render:
    - Statuses : 7 pass(s)
    - Exec time: [1.08, 1.13] s

  * igt@gem_ringfill@legacy-basic-interruptible@vebox:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.10] s

  * igt@gem_ringfill@legacy-basic@blt:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@legacy-basic@bsd:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ringfill@legacy-basic@bsd1:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ringfill@legacy-basic@bsd2:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_ringfill@legacy-basic@default:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_ringfill@legacy-basic@render:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@legacy-basic@vebox:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4539_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#109276])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][4] -> [FAIL][5] ([i915#54] / [i915#93] / [i915#95])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#54])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
    - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#54])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11] ([i915#1602])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#52] / [i915#54] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][16] -> [DMESG-WARN][17] ([i915#180] / [i915#93] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#1559] / [i915#93] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#109441]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@oa-formats:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([i915#405])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-iclb7/igt@perf@oa-formats.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-iclb7/igt@perf@oa-formats.html
    - shard-glk:          [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-glk1/igt@perf@oa-formats.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-glk2/igt@perf@oa-formats.html
    - shard-apl:          [PASS][26] -> [SKIP][27] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@perf@oa-formats.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl8/igt@perf@oa-formats.html
    - shard-kbl:          [PASS][28] -> [SKIP][29] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl7/igt@perf@oa-formats.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl3/igt@perf@oa-formats.html
    - shard-hsw:          [PASS][30] -> [SKIP][31] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-hsw7/igt@perf@oa-formats.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-hsw2/igt@perf@oa-formats.html
    - shard-tglb:         [PASS][32] -> [SKIP][33] ([i915#405])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-tglb8/igt@perf@oa-formats.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-tglb7/igt@perf@oa-formats.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - shard-glk:          [FAIL][34] ([i915#1528]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-glk4/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-glk1/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][36] ([i915#180]) -> [PASS][37] +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl3/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][38] ([i915#1119] / [i915#95]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][40] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [FAIL][42] ([i915#71]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl4/igt@kms_color@pipe-b-legacy-gamma.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl4/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-glk:          [FAIL][44] ([i915#71]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-glk1/igt@kms_color@pipe-b-legacy-gamma.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-glk4/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-apl:          [FAIL][46] ([i915#71]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl4/igt@kms_color@pipe-b-legacy-gamma.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl2/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][48] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][49] +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][50] ([i915#95]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@kms_draw_crc@fill-fb.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl7/igt@kms_draw_crc@fill-fb.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-apl:          [FAIL][52] ([i915#49] / [i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-kbl:          [FAIL][54] ([i915#49]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [FAIL][56] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [FAIL][58] ([i915#53] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][62] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][64] ([i915#1559] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-iclb5/igt@kms_psr@psr2_basic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-iclb2/igt@kms_psr@psr2_basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][68] ([i915#1542]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-hsw8/igt@perf@blocking-parameterized.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-hsw4/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][70] ([i915#454]) -> [SKIP][71] ([i915#468])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-snb:          [INCOMPLETE][72] ([i915#82]) -> [SKIP][73] ([fdo#109271])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-snb6/igt@i915_pm_rpm@pm-tiling.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-snb5/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][74] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][75] ([i915#1319])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@kms_content_protection@legacy.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][76] ([i915#1319]) -> [FAIL][77] ([fdo#110321] / [i915#95])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl3/igt@kms_content_protection@lic.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl4/igt@kms_content_protection@lic.html
    - shard-kbl:          [TIMEOUT][78] ([i915#1319]) -> [FAIL][79] ([fdo#110321] / [i915#93] / [i915#95])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl7/igt@kms_content_protection@lic.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl2/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][80] ([i915#357]) -> [FAIL][81] ([i915#357] / [i915#93] / [i915#95])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl7/igt@kms_content_protection@uevent.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][82] ([i915#357]) -> [FAIL][83] ([i915#357] / [i915#95])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl1/igt@kms_content_protection@uevent.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/shard-apl6/igt@kms_content_protection@uevent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5635 -> IGTPW_4539
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8434: 2951bac393beb4f095468de8b7cc53c8e3a092c2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4539: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/index.html
  IGT_5635: e83abfca61d407d12eee4d25bb0e8686337a7791 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
