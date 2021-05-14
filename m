Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 14 May 2021 18:25:51 -0000
Message-ID: <162101675137.21339.2681626212928395955@emeril.freedesktop.org>
References: <20210514132643.30709-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210514132643.30709-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=3A_3D_LUT_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1639764660=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1639764660==
Content-Type: multipart/alternative;
 boundary="===============5071992337979455459=="

--===============5071992337979455459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: 3D LUT tests
URL   : https://patchwork.freedesktop.org/series/90165/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6084_full -> IGTPW_5813_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5813_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5813_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5813_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-snb:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-apl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-apl1/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * {igt@kms_color@pipe-d-gamma-lut-3d} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_color@pipe-d-gamma-lut-3d.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-glk:          [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_plane_cursor@pipe-b-primary-size-256:
    - shard-snb:          NOTRUN -> [FAIL][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb7/igt@kms_plane_cursor@pipe-b-primary-size-256.html
    - shard-tglb:         NOTRUN -> [FAIL][8] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_plane_cursor@pipe-b-primary-size-256.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-glk:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@kms_prime@basic-crc@second-to-first.html

  
#### Warnings ####

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-tglb:         [FAIL][10] ([i915#3457]) -> [FAIL][11] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-tglb1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-snb:          [FAIL][12] ([i915#3457]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-snb6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes}:
    - shard-glk:          NOTRUN -> [FAIL][14] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  
New tests
---------

  New tests have been introduced between IGT_6084_full and IGTPW_5813_full:

### New IGT tests (7) ###

  * igt@kms_color@pipe-a-gamma-lut-3d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-gamma-lut-3d:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-gamma-lut-3d:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-gamma-lut-3d:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-invalid-gamma-lut-3d-sizes:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@plane-panning-top-left@pipe-a-planes:
    - Statuses : 4 pass(s)
    - Exec time: [0.34, 5.87] s

  * igt@kms_plane@plane-panning-top-left@pipe-b-planes:
    - Statuses : 4 pass(s)
    - Exec time: [0.38, 6.92] s

  

Known issues
------------

  Here are the changes found in IGTPW_5813_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@offset-control:
    - shard-snb:          NOTRUN -> [DMESG-WARN][15] ([i915#3457]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb5/igt@api_intel_bb@offset-control.html

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#1839]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb5/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#1839])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@feature_discovery@display-3x.html

  * igt@gem_create@busy-create:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([i915#3457])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-tglb3/igt@gem_create@busy-create.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb2/igt@gem_create@busy-create.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][20] ([i915#3457] / [i915#3468])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb7/igt@gem_ctx_engines@invalid-engines.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][21] ([i915#3457] / [i915#3468])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk4/igt@gem_ctx_engines@invalid-engines.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][22] ([i915#3457] / [i915#3468])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl3/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][23] ([i915#180] / [i915#3457]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@engines-persistence@vcs0:
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#3457])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-apl1/igt@gem_ctx_persistence@engines-persistence@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@gem_ctx_persistence@engines-persistence@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#1099]) +11 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][28] ([i915#2502] / [i915#3457])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][29] ([i915#2842] / [i915#3457]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][30] ([i915#2842] / [i915#3457]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][31] ([i915#2842] / [i915#3457]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#2842] / [i915#3457])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [PASS][34] -> [FAIL][35] ([i915#2842] / [i915#3457])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fence@keep-in-fence@vecs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][36] ([i915#3457])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@gem_exec_fence@keep-in-fence@vecs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109283])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109283])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb8/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_schedule@preemptive-hang@rcs0:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#3457]) +26 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk3/igt@gem_exec_schedule@preemptive-hang@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk8/igt@gem_exec_schedule@preemptive-hang@rcs0.html

  * igt@gem_exec_schedule@submit-golden-slice@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][41] ([i915#3457]) +42 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@gem_exec_schedule@submit-golden-slice@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          NOTRUN -> [DMESG-WARN][42] ([i915#118] / [i915#95])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk8/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][43] -> [DMESG-WARN][44] ([i915#118] / [i915#95]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111656])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@gem_mmap_gtt@coherency.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109292])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-glk:          [PASS][47] -> [INCOMPLETE][48] ([i915#3468])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk8/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk9/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-snb:          NOTRUN -> [INCOMPLETE][49] ([i915#3468]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-tglb:         [PASS][50] -> [INCOMPLETE][51] ([i915#3468] / [i915#750])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-tglb2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
    - shard-iclb:         [PASS][52] -> [INCOMPLETE][53] ([i915#3468])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-iclb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][54] ([i915#2658])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][55] ([i915#2658])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk7/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][56] ([i915#2658])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb5/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][57] ([i915#2658])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb7/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][58] ([i915#2658])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl2/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [WARN][59] ([i915#2658])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#768]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][61] ([i915#3468]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][62] ([i915#3468]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb1/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-apl:          NOTRUN -> [INCOMPLETE][63] ([i915#3468]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][64] ([i915#3468]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][65] ([i915#3468]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109312])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109312])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#3297]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@huge-split:
    - shard-glk:          [PASS][69] -> [FAIL][70] ([i915#3376] / [i915#3457])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk9/igt@gem_userptr_blits@huge-split.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@gem_userptr_blits@huge-split.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][71] ([i915#3002])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@gem_userptr_blits@input-checking.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][72] ([i915#3002])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb6/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-apl:          NOTRUN -> [FAIL][73] ([i915#3324])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl7/igt@gem_userptr_blits@set-cache-level.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#3297]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][75] ([i915#3318] / [i915#3457])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][76] -> [DMESG-WARN][77] ([i915#180] / [i915#3457])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109289]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb1/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-snb:          NOTRUN -> [SKIP][79] ([fdo#109271]) +447 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#112306]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#112306]) +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_hangman@engine-hang@bcs0:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][82] ([i915#3457]) +10 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@i915_hangman@engine-hang@bcs0.html

  * igt@i915_hangman@engine-hang@vecs0:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][83] ([i915#3457]) +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk5/igt@i915_hangman@engine-hang@vecs0.html
    - shard-apl:          NOTRUN -> [DMESG-FAIL][84] ([i915#3457]) +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl7/igt@i915_hangman@engine-hang@vecs0.html

  * igt@i915_hangman@error-state-capture@bcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][85] ([i915#3457]) +6 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl6/igt@i915_hangman@error-state-capture@bcs0.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][86] ([i915#2411] / [i915#3457])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb5/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#111644] / [i915#1397] / [i915#2411])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#110892])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-mmap-type@uc:
    - shard-glk:          [PASS][89] -> [DMESG-WARN][90] ([i915#3475])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@uc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@uc.html
    - shard-tglb:         [PASS][91] -> [DMESG-WARN][92] ([i915#2411])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-tglb7/igt@i915_pm_rpm@gem-mmap-type@uc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb3/igt@i915_pm_rpm@gem-mmap-type@uc.html

  * igt@i915_pm_rpm@gem-mmap-type@wc:
    - shard-iclb:         [PASS][93] -> [DMESG-WARN][94] ([i915#3457])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-iclb3/igt@i915_pm_rpm@gem-mmap-type@wc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb5/igt@i915_pm_rpm@gem-mmap-type@wc.html
    - shard-glk:          [PASS][95] -> [DMESG-WARN][96] ([i915#3457])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@wc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@wc.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          NOTRUN -> [SKIP][97] ([fdo#109271]) +150 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl7/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][98] ([i915#3457]) +12 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-apl:          NOTRUN -> [DMESG-WARN][99] ([i915#3457]) +10 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@i915_pm_sseu@full-enable.html
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109288])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109302])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109302])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][103] ([i915#3462])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@i915_selftest@live@execlists.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][104] ([i915#3462])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@i915_selftest@live@execlists.html
    - shard-iclb:         NOTRUN -> [DMESG-FAIL][105] ([i915#3462])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb5/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][106] ([i915#2373])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][107] ([i915#1759] / [i915#2291])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@mman:
    - shard-glk:          NOTRUN -> [DMESG-WARN][108] ([i915#3457]) +4 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][109] ([i915#180]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#404])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#404])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([fdo#111614]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#111615]) +9 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#110723]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([i915#2705])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_big_joiner@basic.html
    - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#2705])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl6/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][118] ([i915#2705])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-apl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2705])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl7/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic:
    - shard-glk:          [PASS][120] -> [FAIL][121] ([fdo#108145])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk9/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic:
    - shard-glk:          NOTRUN -> [FAIL][122] ([fdo#108145])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-kbl:          NOTRUN -> [SKIP][123] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl3/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-apl:          NOTRUN -> [SKIP][124] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_chamelium@vga-hpd:
    - shard-tglb:         NOTRUN -> [SKIP][125] ([fdo#109284] / [fdo#111827]) +28 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][126] ([fdo#109271] / [fdo#111827]) +29 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb7/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-a-degamma:
    - shard-glk:          [PASS][127] -> [FAIL][128] ([fdo#108145] / [i915#71]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk9/igt@kms_color@pipe-a-degamma.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][129] ([fdo#109278] / [i915#1149])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][130] ([fdo#109284] / [fdo#111827]) +23 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][131] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][132] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk5/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][133] ([i915#1319]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][134] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][135] ([fdo#111828]) +2 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb5/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][136] ([i915#1319])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-apl:          NOTRUN -> [FAIL][137] ([i915#3444] / [i915#3457]) +5 simila

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/index.html

--===============5071992337979455459==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_color: 3D LUT tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90165/">https://patchwork.freedesktop.org/series/90165/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6084_full -&gt; IGTPW_5813_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5813_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5813_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5813_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-apl1/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@gem_ppgtt@blt-vs-render-ctx0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-gamma-lut-3d} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_color@pipe-d-gamma-lut-3d.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-primary-size-256:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb7/igt@kms_plane_cursor@pipe-b-primary-size-256.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_plane_cursor@pipe-b-primary-size-256.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@kms_prime@basic-crc@second-to-first.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane_cursor@pipe-a-overlay-size-256:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-tglb1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html">FAIL</a> ([i915#3457]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-snb6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html">FAIL</a> ([i915#3457]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes}:<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6084_full and IGTPW_5813_full:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@kms_color@pipe-a-gamma-lut-3d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-gamma-lut-3d:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-gamma-lut-3d:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-gamma-lut-3d:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-invalid-gamma-lut-3d-sizes:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.34, 5.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-b-planes:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.38, 6.92] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5813_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@offset-control:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb5/igt@api_intel_bb@offset-control.html">DMESG-WARN</a> ([i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb5/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_create@busy-create:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-tglb3/igt@gem_create@busy-create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb2/igt@gem_create@busy-create.html">INCOMPLETE</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb7/igt@gem_ctx_engines@invalid-engines.html">INCOMPLETE</a> ([i915#3457] / [i915#3468])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk4/igt@gem_ctx_engines@invalid-engines.html">INCOMPLETE</a> ([i915#3457] / [i915#3468])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl3/igt@gem_ctx_engines@invalid-engines.html">INCOMPLETE</a> ([i915#3457] / [i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> ([i915#180] / [i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-persistence@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-apl1/igt@gem_ctx_persistence@engines-persistence@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@gem_ctx_persistence@engines-persistence@vcs0.html">FAIL</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@gem_exec_endless@dispatch@rcs0.html">INCOMPLETE</a> ([i915#2502] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@keep-in-fence@vecs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@gem_exec_fence@keep-in-fence@vecs0.html">INCOMPLETE</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb8/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk3/igt@gem_exec_schedule@preemptive-hang@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk8/igt@gem_exec_schedule@preemptive-hang@rcs0.html">FAIL</a> ([i915#3457]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@gem_exec_schedule@submit-golden-slice@rcs0.html">FAIL</a> ([i915#3457]) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk8/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#109292])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk8/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk9/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-tglb2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#3468] / [i915#750])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-iclb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb1/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb1/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk9/igt@gem_userptr_blits@huge-split.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@gem_userptr_blits@huge-split.html">FAIL</a> ([i915#3376] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb6/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl7/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> ([i915#180] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb1/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb5/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([fdo#109271]) +447 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-hang@bcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@i915_hangman@engine-hang@bcs0.html">DMESG-WARN</a> ([i915#3457]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-hang@vecs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk5/igt@i915_hangman@engine-hang@vecs0.html">DMESG-FAIL</a> ([i915#3457]) +4 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl7/igt@i915_hangman@engine-hang@vecs0.html">DMESG-FAIL</a> ([i915#3457]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-capture@bcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl6/igt@i915_hangman@error-state-capture@bcs0.html">DMESG-WARN</a> ([i915#3457]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb5/igt@i915_pm_rpm@cursor.html">DMESG-WARN</a> ([i915#2411] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@uc:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@uc.html">DMESG-WARN</a> ([i915#3475])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-tglb7/igt@i915_pm_rpm@gem-mmap-type@uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb3/igt@i915_pm_rpm@gem-mmap-type@uc.html">DMESG-WARN</a> ([i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@wc:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-iclb3/igt@i915_pm_rpm@gem-mmap-type@wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb5/igt@i915_pm_rpm@gem-mmap-type@wc.html">DMESG-WARN</a> ([i915#3457])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@wc.html">DMESG-WARN</a> ([i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl7/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([fdo#109271]) +150 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@i915_pm_rps@min-max-config-idle.html">DMESG-WARN</a> ([i915#3457]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@i915_pm_sseu@full-enable.html">DMESG-WARN</a> ([i915#3457]) +10 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb5/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb7/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> ([i915#3462])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb5/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@i915_selftest@live@mman.html">DMESG-WARN</a> ([i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111615]) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl6/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl7/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk9/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html">FAIL</a> ([fdo#108145])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html">FAIL</a> ([fdo#108145])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl3/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl1/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb6/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-snb7/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6084/shard-glk9/igt@kms_color@pipe-a-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk3/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([fdo#108145] / [i915#71]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb8/igt@kms_color@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-glk5/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-kbl2/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-iclb7/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-tglb5/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5813/shard-apl6/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; [FAIL][137] ([i915#3444] / [i915#3457]) +5 simila</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5071992337979455459==--

--===============1639764660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1639764660==--
