Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3908233554748516978=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karolina Stolarek" <karolina.stolarek@intel.com>
Date: Tue, 17 Jan 2023 20:28:22 -0000
Message-ID: <167398730247.21230.18065956179299174144@emeril.freedesktop.org>
References: <cover.1673951674.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1673951674.git.karolina.stolarek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_blt=5Fcmd=5Finfo_struct_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============3908233554748516978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce blt_cmd_info struct (rev5)
URL   : https://patchwork.freedesktop.org/series/112055/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12590_full -> IGTPW_8351_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8351_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_ccs@block-multicopy-compressed:
    - {shard-rkl}:        [SKIP][1] ([i915#5325]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - {shard-tglu}:       NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-1/igt@gem_exec_whisper@basic-fds-forked-all.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12590_full and IGTPW_8351_full:

### New IGT tests (37) ###

  * igt@gem_exec_fair@basic-none@vcs1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@linear-lmem0-lmem0-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@linear-lmem0-smem-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@linear-smem-lmem0-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@linear-smem-smem-emit:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile4-lmem0-lmem0-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile4-lmem0-smem-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile4-smem-lmem0-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile4-smem-smem-emit:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile64-lmem0-lmem0-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile64-lmem0-smem-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile64-smem-lmem0-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@tile64-smem-smem-emit:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@yfmajor-smem-smem-emit:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@ymajor-lmem0-lmem0-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@ymajor-lmem0-smem-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@ymajor-smem-lmem0-emit:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy-emit@ymajor-smem-smem-emit:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@linear-lmem0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@linear-lmem0-smem:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@linear-smem-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@linear-smem-smem:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile4-lmem0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile4-lmem0-smem:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile4-smem-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile4-smem-smem:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile64-lmem0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile64-lmem0-smem:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile64-smem-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@tile64-smem-smem:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@yfmajor-smem-smem:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@ymajor-lmem0-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@ymajor-lmem0-smem:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@ymajor-smem-lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exercise_blt@fast-copy@ymajor-smem-smem:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8351_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@read-writes:
    - shard-apl:          [PASS][4] -> [INCOMPLETE][5] ([i915#7708])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-apl1/igt@gem_caching@read-writes.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl3/igt@gem_caching@read-writes.html

  * igt@gem_exec_fair@basic-none@vcs1 (NEW):
    - {shard-tglu-9}:     NOTRUN -> [FAIL][6] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-9/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * {igt@gem_exercise_blt@fast-copy-emit} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-snb5/igt@gem_exercise_blt@fast-copy-emit.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@verify:
    - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#4613])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl7/igt@gem_lmem_swapping@verify.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-apl:          [PASS][12] -> [INCOMPLETE][13] ([i915#7708] / [i915#7833])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#3886]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl7/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#3886]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk4/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][16] ([fdo#109271]) +46 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk2/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#2346])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-glk:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#7205])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-snb:          [PASS][20] -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][22] ([i915#4573]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk5/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-2.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#658])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#658])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271]) +52 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl2/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#2437])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk6/igt@kms_writeback@writeback-fb-id.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@idle@rcs0:
    - {shard-rkl}:        [FAIL][27] ([i915#7742]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html

  * igt@gem_eio@reset-stress:
    - {shard-dg1}:        [FAIL][29] ([i915#5784]) -> [PASS][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-dg1-18/igt@gem_eio@reset-stress.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-dg1-19/igt@gem_eio@reset-stress.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - {shard-rkl}:        [SKIP][31] ([i915#6247]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-4/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - {shard-rkl}:        [FAIL][33] ([i915#2846]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][35] ([i915#2842]) -> [PASS][36] +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-tglu-10}:    [FAIL][37] ([i915#2842]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - {shard-rkl}:        [SKIP][39] ([i915#3281]) -> [PASS][40] +12 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_pread@snoop:
    - {shard-rkl}:        [SKIP][41] ([i915#3282]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-4/igt@gem_pread@snoop.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-5/igt@gem_pread@snoop.html

  * igt@gen9_exec_parse@bb-start-param:
    - {shard-rkl}:        [SKIP][43] ([i915#2527]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - {shard-dg1}:        [FAIL][45] ([i915#3591]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [FAIL][47] ([i915#6537]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-apl7/igt@i915_pm_rps@engine-order.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl3/igt@i915_pm_rps@engine-order.html

  * igt@i915_pm_sseu@full-enable:
    - {shard-rkl}:        [SKIP][49] ([i915#4387]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-3/igt@i915_pm_sseu@full-enable.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_suspend@basic-s3-without-i915:
    - {shard-rkl}:        [FAIL][51] ([fdo#103375]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - {shard-tglu}:       [SKIP][53] ([i915#1845] / [i915#7651]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-tglu-6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - {shard-tglu}:       [SKIP][55] ([i915#1849]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][57] ([i915#1849] / [i915#4098]) -> [PASS][58] +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-d:
    - {shard-tglu}:       [SKIP][59] ([fdo#109274]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak-pipe-d.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak-pipe-d.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - {shard-rkl}:        [SKIP][61] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - {shard-rkl}:        [SKIP][63] ([i915#1845] / [i915#4098]) -> [PASS][64] +6 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
    - {shard-tglu}:       [SKIP][65] ([i915#7651]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-tglu-6/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-3/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][67] ([i915#1722]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-2/igt@perf@polling-small-buf.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-6/igt@perf@polling-small-buf.html

  * igt@sysfs_heartbeat_interval@precise@vcs0:
    - {shard-dg1}:        [FAIL][69] ([i915#1755]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-dg1-15/igt@sysfs_heartbeat_interval@precise@vcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-dg1-17/igt@sysfs_heartbeat_interval@precise@vcs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7205]: https://gitlab.freedesktop.org/drm/intel/issues/7205
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7708]: https://gitlab.freedesktop.org/drm/intel/issues/7708
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7833]: https://gitlab.freedesktop.org/drm/intel/issues/7833


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7121 -> IGTPW_8351
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12590: aa9844e5dcac30f3b7c09fa0218516692698f0e2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8351: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/index.html
  IGT_7121: aa16e81259f59734230d441905b9d0f605e4a4b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/index.html

--===============3908233554748516978==
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
<tr><td><b>Series:</b></td><td>Introduce blt_cmd_info struct (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112055/">https://patchwork.freedesktop.org/series/112055/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12590_full -&gt; IGTPW_8351_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/index.html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8351_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-1/igt@gem_exec_whisper@basic-fds-forked-all.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12590_full and IGTPW_8351_full:</p>
<h3>New IGT tests (37)</h3>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@linear-lmem0-lmem0-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@linear-lmem0-smem-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@linear-smem-lmem0-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@linear-smem-smem-emit:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile4-lmem0-lmem0-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile4-lmem0-smem-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile4-smem-lmem0-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile4-smem-smem-emit:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile64-lmem0-lmem0-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile64-lmem0-smem-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile64-smem-lmem0-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@tile64-smem-smem-emit:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@yfmajor-smem-smem-emit:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@ymajor-lmem0-lmem0-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@ymajor-lmem0-smem-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@ymajor-smem-lmem0-emit:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit@ymajor-smem-smem-emit:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@linear-lmem0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@linear-lmem0-smem:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@linear-smem-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@linear-smem-smem:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile4-lmem0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile4-lmem0-smem:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile4-smem-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile4-smem-smem:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile64-lmem0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile64-lmem0-smem:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile64-smem-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@tile64-smem-smem:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@yfmajor-smem-smem:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@ymajor-lmem0-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@ymajor-lmem0-smem:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@ymajor-smem-lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy@ymajor-smem-smem:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8351_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-apl1/igt@gem_caching@read-writes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl3/igt@gem_caching@read-writes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7708">i915#7708</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1 (NEW):</p>
<ul>
<li>{shard-tglu-9}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-9/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exercise_blt@fast-copy-emit} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-snb5/igt@gem_exercise_blt@fast-copy-emit.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl7/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7708">i915#7708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7833">i915#7833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl7/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk4/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk2/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7205">i915#7205</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk5/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl2/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +52 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-dg1-18/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-dg1-19/igt@gem_eio@reset-stress.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6247">i915#6247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-4/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>{shard-tglu-10}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-4/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-5/igt@gem_pread@snoop.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-apl7/igt@i915_pm_rps@engine-order.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6537">i915#6537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-apl3/igt@i915_pm_rps@engine-order.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-3/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-tglu-6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-d:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak-pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-b-functional:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-b-functional.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-tglu-6/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-tglu-3/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-rkl-2/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-rkl-6/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12590/shard-dg1-15/igt@sysfs_heartbeat_interval@precise@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/shard-dg1-17/igt@sysfs_heartbeat_interval@precise@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7121 -&gt; IGTPW_8351</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12590: aa9844e5dcac30f3b7c09fa0218516692698f0e2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8351: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8351/index.html<br />
  IGT_7121: aa16e81259f59734230d441905b9d0f605e4a4b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3908233554748516978==--
