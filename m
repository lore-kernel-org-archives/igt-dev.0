Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5970870611262814457=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 13 Feb 2023 17:41:04 -0000
Message-ID: <167631006406.20212.2232134683104979054@emeril.freedesktop.org>
References: <20230212062758.1956925-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230212062758.1956925-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fcursor=5Flegacy=3A?=
 =?utf-8?q?_Fix_CI_tiemout_issues?=
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

--===============5970870611262814457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_cursor_legacy: Fix CI tiemout issues
URL   : https://patchwork.freedesktop.org/series/113923/
State : success

== Summary ==

CI Bug Log - changes from IGT_7159_full -> IGTPW_8487_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html

Participating hosts (9 -> 11)
------------------------------

  Additional (2): shard-rkl0 shard-tglu-9 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8487_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane_scaling@invalid-parameters}:
    - {shard-rkl}:        [SKIP][1] ([i915#8152]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@kms_plane_scaling@invalid-parameters.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@kms_plane_scaling@invalid-parameters.html

  
New tests
---------

  New tests have been introduced between IGT_7159_full and IGTPW_8487_full:

### New IGT tests (55) ###

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8487_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-apl:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#6334])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl3/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][4] ([i915#2846])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-apl:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#4613]) +20 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl6/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][7] ([i915#2658]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-apl:          NOTRUN -> [SKIP][8] ([fdo#109271]) +1265 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#3323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][10] ([i915#3318])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][11] -> [ABORT][12] ([i915#5566])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-glk5/igt@gen9_exec_parse@allowed-single.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk4/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-apl:          NOTRUN -> [FAIL][13] ([i915#7036]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#1937])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          NOTRUN -> [FAIL][15] ([i915#6537])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl1/igt@i915_pm_rps@engine-order.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][16] ([fdo#109271]) +38 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#3886])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#3886]) +53 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][19] ([fdo#109271]) +42 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-snb1/igt@kms_color@ctm-max@pipe-a-hdmi-a-1.html

  * igt@kms_content_protection@lic@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][20] ([i915#7173]) +4 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl2/igt@kms_content_protection@lic@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][21] ([i915#1339])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl7/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][22] ([i915#4103] / [i915#4213])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][23] ([i915#4103]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][24] ([fdo#109274]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][25] ([fdo#111825])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size (NEW):
    - {shard-tglu-10}:    NOTRUN -> [SKIP][26] ([fdo#109274]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-10/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][27] ([i915#1845] / [i915#4098]) +44 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - {shard-tglu-9}:     NOTRUN -> [SKIP][28] ([i915#1845]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][29] ([fdo#111825]) +11 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-dg1-12/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][30] ([i915#1845]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions (NEW):
    - shard-glk:          NOTRUN -> [FAIL][31] ([i915#2346]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size (NEW):
    - {shard-tglu-10}:    NOTRUN -> [SKIP][32] ([i915#4103])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][33] ([i915#4103]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][34] ([i915#7862]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][35] ([i915#4573]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#658]) +17 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_setmode@basic@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][37] ([i915#5465]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#533])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#2437]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@kms_writeback@writeback-pixel-formats.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - {shard-rkl}:        [FAIL][40] ([i915#7742]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - {shard-rkl}:        [FAIL][42] ([i915#2842]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [FAIL][44] ([i915#2842]) -> [PASS][45] +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - {shard-rkl}:        [SKIP][46] ([i915#3281]) -> [PASS][47] +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_madvise@dontneed-before-exec:
    - {shard-rkl}:        [SKIP][48] ([i915#3282]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@gem_madvise@dontneed-before-exec.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_workarounds@suspend-resume-context:
    - {shard-rkl}:        [FAIL][50] ([fdo#103375]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@unaligned-access:
    - {shard-rkl}:        [SKIP][52] ([i915#2527]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][54] ([i915#6258]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-3/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - {shard-tglu}:       [SKIP][56] ([i915#1845]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-tglu-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-4/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_dc@dc5-dpms:
    - {shard-rkl}:        [FAIL][58] ([i915#7330]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-5/igt@i915_pm_dc@dc5-dpms.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-2/igt@i915_pm_dc@dc5-dpms.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - {shard-tglu}:       [SKIP][60] ([i915#7651]) -> [PASS][61] +8 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-tglu-6/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-2/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - {shard-rkl}:        [SKIP][62] ([i915#1845] / [i915#4098]) -> [PASS][63] +19 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][64] ([i915#2122]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - {shard-rkl}:        [SKIP][66] ([i915#1849] / [i915#4098]) -> [PASS][67] +12 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - {shard-tglu}:       [SKIP][68] ([i915#1849]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_pipe_crc_basic@bad-source:
    - {shard-tglu}:       [SKIP][70] ([i915#1845] / [i915#7651]) -> [PASS][71] +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-tglu-6/igt@kms_pipe_crc_basic@bad-source.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-3/igt@kms_pipe_crc_basic@bad-source.html

  * igt@kms_plane@plane-panning-top-left@pipe-a-planes:
    - {shard-tglu}:       [SKIP][72] ([i915#1849] / [i915#3558]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-tglu-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-1/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
    - {shard-rkl}:        [SKIP][74] ([i915#1849]) -> [PASS][75] +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html

  * igt@kms_psr@cursor_mmap_gtt:
    - {shard-rkl}:        [SKIP][76] ([i915#1072]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@kms_psr@cursor_mmap_gtt.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_psr@cursor_mmap_gtt.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-a:
    - {shard-rkl}:        [SKIP][78] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html

  * igt@perf@stress-open-close:
    - shard-glk:          [ABORT][80] ([i915#5213]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-glk6/igt@perf@stress-open-close.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk4/igt@perf@stress-open-close.html

  * igt@perf_pmu@rc6-suspend:
    - {shard-rkl}:        [ABORT][82] ([i915#5122]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-4/igt@perf_pmu@rc6-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-3/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-write:
    - {shard-rkl}:        [SKIP][84] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-3/igt@prime_vgem@basic-write.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@prime_vgem@basic-write.html

  * igt@testdisplay:
    - {shard-rkl}:        [SKIP][86] ([i915#4098]) -> [PASS][87] +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-4/igt@testdisplay.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@testdisplay.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
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
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1339]: https://gitlab.freedesktop.org/drm/intel/issues/1339
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7036]: https://gitlab.freedesktop.org/drm/intel/issues/7036
  [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7330]: https://gitlab.freedesktop.org/drm/intel/issues/7330
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/intel/issues/7862
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7159 -> IGTPW_8487

  CI-20190529: 20190529
  CI_DRM_12730: c54b5fcf3e686a0abfdd7d6af53e9014c137023a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8487: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html
  IGT_7159: d2ca8db8bf83a19034eee61c11ec01a4e973e0ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html

--===============5970870611262814457==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_cursor_legacy: Fix CI tiemout issues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113923/">https://patchwork.freedesktop.org/series/113923/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7159_full -&gt; IGTPW_8487_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html</p>
<h2>Participating hosts (9 -&gt; 11)</h2>
<p>Additional (2): shard-rkl0 shard-tglu-9 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8487_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_plane_scaling@invalid-parameters}:<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7159_full and IGTPW_8487_full:</p>
<h3>New IGT tests (55)</h3>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-toggle:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-toggle:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8487_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl3/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl6/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1265 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-glk5/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk4/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7036">i915#7036</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl1/igt@i915_pm_rps@engine-order.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6537">i915#6537</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-snb1/igt@kms_color@ctm-max@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl2/igt@kms_content_protection@lic@pipe-a-dp-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl7/igt@kms_content_protection@uevent@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1339">i915#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size (NEW):</p>
<ul>
<li>{shard-tglu-10}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-10/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy (NEW):</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +44 similar issues</p>
</li>
<li>
<p>{shard-tglu-9}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-dg1-12/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size (NEW):</p>
<ul>
<li>{shard-tglu-10}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7862">i915#7862</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-apl4/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@gem_madvise@dontneed-before-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6258">i915#6258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-3/igt@i915_hangman@engine-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-tglu-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-4/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-5/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7330">i915#7330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-2/igt@i915_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-tglu-6/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@bad-source:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-tglu-6/igt@kms_pipe_crc_basic@bad-source.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-3/igt@kms_pipe_crc_basic@bad-source.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-tglu-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3558">i915#3558</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-tglu-1/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@kms_psr@cursor_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_psr@cursor_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-2/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-glk6/igt@perf@stress-open-close.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-glk4/igt@perf@stress-open-close.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-4/igt@perf_pmu@rc6-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-3/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-5/igt@prime_vgem@basic-write.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/shard-rkl-4/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/shard-rkl-6/igt@testdisplay.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7159 -&gt; IGTPW_8487</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12730: c54b5fcf3e686a0abfdd7d6af53e9014c137023a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8487: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html<br />
  IGT_7159: d2ca8db8bf83a19034eee61c11ec01a4e973e0ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5970870611262814457==--
