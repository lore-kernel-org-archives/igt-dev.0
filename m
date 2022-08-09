Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8681154615401205934=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 09 Aug 2022 13:14:22 -0000
Message-ID: <166005086255.12844.14022370679700539695@emeril.freedesktop.org>
References: <20220809102638.146913-1-matthew.auld@intel.com>
In-Reply-To: <20220809102638.146913-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Flmem=5Fswapping=3A_add_some_coverage_for_big_objects_=28r?=
 =?utf-8?q?ev2=29?=
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

--===============8681154615401205934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_lmem_swapping: add some coverage for big objects (rev2)
URL   : https://patchwork.freedesktop.org/series/107030/
State : success

== Summary ==

CI Bug Log - changes from IGT_6619_full -> IGTPW_7623_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/index.html

Participating hosts (9 -> 10)
------------------------------

  Additional (1): shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7623_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_lmem_swapping@massive} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb7/igt@gem_lmem_swapping@massive.html

  * {igt@gem_lmem_swapping@massive-random} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb6/igt@gem_lmem_swapping@massive-random.html
    - {shard-rkl}:        NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-2/igt@gem_lmem_swapping@massive-random.html
    - {shard-tglu}:       NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_vblank@pipe-a-wait-idle-hang:
    - {shard-dg1}:        NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-dg1-19/igt@kms_vblank@pipe-a-wait-idle-hang.html

  
New tests
---------

  New tests have been introduced between IGT_6619_full and IGTPW_7623_full:

### New IGT tests (4) ###

  * igt@gem_lmem_swapping@massive:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_lmem_swapping@massive-random:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_lmem_swapping@massive-random@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@gem_lmem_swapping@massive@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [11.05] s

  

Known issues
------------

  Here are the changes found in IGTPW_7623_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_buddy@all:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#6433])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb2/igt@drm_buddy@all.html
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#6433])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@drm_buddy@all.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#658])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb2/igt@feature_discovery@psr2.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb4/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-snb2/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][11] ([i915#3354])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-snb2/igt@gem_eio@unwedge-stress.html
    - shard-tglb:         NOTRUN -> [FAIL][12] ([i915#5784])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#4525])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb4/igt@gem_exec_balancer@parallel.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb6/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          NOTRUN -> [FAIL][16] ([i915#2842]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#2842]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb7/igt@gem_exec_fair@basic-pace@vecs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#2849])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#112283])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb1/igt@gem_exec_params@secure-non-root.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#112283])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb8/igt@gem_exec_params@secure-non-root.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-kbl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@gem_lmem_swapping@parallel-multi.html
    - shard-apl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#4613]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl2/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][28] ([i915#2658])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl3/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][29] ([fdo#109271]) +23 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#768])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl6/igt@gem_workarounds@suspend-resume.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl3/igt@gem_workarounds@suspend-resume.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109289])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109289])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb4/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          [PASS][35] -> [TIMEOUT][36] ([i915#4639])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl7/igt@gen9_exec_parse@bb-large.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl8/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#2527] / [i915#2856])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#2856])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb6/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_module_load@resize-bar:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#6412])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][40] ([i915#454])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][41] ([i915#180])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180]) +5 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl4/igt@i915_suspend@forcewake.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#5286])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#5286])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3886]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk1/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278] / [i915#3886]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl8/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3689] / [i915#3886])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb7/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +10 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb3/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#6095])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb1/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl4/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][56] ([i915#2105])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#4103])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#4103])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][59] -> [FAIL][60] ([i915#2346]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:
    - shard-glk:          [PASS][61] -> [FAIL][62] ([i915#1888] / [i915#5160])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html

  * igt@kms_dsc@dsc-with-bpp:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3828])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@kms_dsc@dsc-with-bpp.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#3828])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb4/igt@kms_dsc@dsc-with-bpp.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109274])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb8/igt@kms_flip@2x-blocking-wf_vblank.html
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][67] ([i915#180])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#2672]) +7 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#2672])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#2672] / [i915#3555])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-snb:          NOTRUN -> [SKIP][71] ([fdo#109271]) +38 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271]) +201 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#6497]) +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109280] / [fdo#111825]) +6 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109280]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#1839])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#1839])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][78] ([fdo#108145] / [i915#265]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][79] ([fdo#108145] / [i915#265]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#111615]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [PASS][81] -> [SKIP][82] ([i915#5176]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#5235]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271]) +119 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#658])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#658]) +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][87] ([i915#132] / [i915#3467])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][88] -> [SKIP][89] ([fdo#109441]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#3555])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2437])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl2/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2437])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [PASS][93] -> [FAIL][94] ([i915#5639])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl6/igt@perf@polling-parameterized.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl4/igt@perf@polling-parameterized.html
    - shard-glk:          [PASS][95] -> [FAIL][96] ([i915#5639])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-glk7/igt@perf@polling-parameterized.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk3/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109291]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_3:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109291]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb2/igt@prime_nv_pcopy@test3_3.html

  * igt@sysfs_clients@create:
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2994]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@sysfs_clients@create.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-busy:
    - {shard-rkl}:        [SKIP][100] -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-5/igt@drm_fdinfo@virtual-busy.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-5/igt@drm_fdinfo@virtual-busy.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][102] ([i915#6268]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html
    - {shard-tglu}:       [FAIL][104] ([i915#6268]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-tglu-8/igt@gem_ctx_exec@basic-nohangcheck.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglu-8/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-apl:          [DMESG-WARN][106] ([i915#180]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][108] ([i915#4525]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][110] ([i915#2846]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [FAIL][112] ([i915#2846]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-glk6/igt@gem_exec_fair@basic-deadline.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - {shard-rkl}:        [FAIL][114] ([i915#2842]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-2/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-5/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-tglu}:       [FAIL][116] ([i915#2842]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglb:         [FAIL][118] ([i915#2842]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][120] ([i915#2842]) -> [PASS][121] +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][122] ([i915#2842]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@invalid-bsd2-flag-on-blt:
    - {shard-rkl}:        [SKIP][124] ([fdo#109315]) -> [PASS][125] +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-5/igt@gem_exec_params@invalid-bsd2-flag-on-blt.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-4/igt@gem_exec_params@invalid-bsd2-flag-on-blt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - {shard-rkl}:        [SKIP][126] ([i915#3281]) -> [PASS][127] +3 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][128] ([i915#2190]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@display:
    - {shard-rkl}:        [SKIP][130] ([i915#3282]) -> [PASS][131] +3 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-1/igt@gem_pread@display.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-5/igt@gem_pread@display.html

  * igt@gem_softpin@evict-single-offset:
    - {shard-rkl}:        [FAIL][132] ([i915#4171]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-1/igt@gem_softpin@evict-single-offset.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@gem_softpin@evict-single-offset.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [INCOMPLETE][134] -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@valid-registers:
    - {shard-rkl}:        [SKIP][136] ([i915#2527]) -> [PASS][137] +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-1/igt@gen9_exec_parse@valid-registers.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_backlight@fade_with_dpms:
    - {shard-rkl}:        [SKIP][138] ([i915#3012]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-2/igt@i915_pm_backlight@fade_with_dpms.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@i915_pm_backlight@fade_with_dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][140] ([fdo#109271]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_sseu@full-enable:
    - {shard-rkl}:        [SKIP][142] ([i915#4387]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-2/igt@i915_pm_sseu@full-enable.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:
    - {shard-rkl}:        [SKIP][144] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][145] +2 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [FAIL][146] ([i915#2122]) -> [PASS][147] +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][148] ([i915#180]) -> [PASS][149] +10 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][150] ([i915#1849] / [i915#4098]) -> [PASS][151] +11 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - {shard-rkl}:        [SKIP][152] ([i915#1849] / [i915#3546] / [i915#4098]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - {shard-rkl}:        [SKIP][154] ([i915#1849] / [i915#3546] / [i915#4070] / [i915#4098]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_psr@cursor_mmap_cpu:
    - {shard-rkl}:        [SKIP][156] ([i915#1072]) -> [PASS][157] +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-5/igt@kms_psr@cursor_mmap_cpu.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@kms_psr@cursor_mmap_cpu.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][158] ([fdo#109441]) -> [PASS][159] +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][160] ([i915#5519]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - {shard-rkl}:        [SKIP][162] ([i915#1845] / [i915#4098]) -> [PASS][163] +25 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-1/igt@kms_rotation_crc@primary-rotation-90.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_vblank@pipe-c-wait-busy-hang:
    - shard-tglb:         [INCOMPLETE][164] -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-tglb7/igt@kms_vblank@pipe-c-wait-busy-hang.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb7/igt@kms_vblank@pipe-c-wait-busy-hang.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - {shard-rkl}:        [SKIP][166] ([i915#2436]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@invalid-oa-metric-set-id:
    - {shard-rkl}:        [SKIP][168] ([i915#5608]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-5/igt@perf@invalid-oa-metric-set-id.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@perf@invalid-oa-metric-set-id.html

  * igt@syncobj_wait@multi-wait-all-for-submit-unsubmitted-submitted:
    - {shard-rkl}:        [SKIP][170] ([i915#2575]) -> [PASS][171] +7 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-rkl-5/igt@syncobj_wait@multi-wait-all-for-submit-unsubmitted-submitted.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-2/igt@syncobj_wait@multi-wait-all-for-submit-unsubmitted-submitted.html

  
#### Warnings ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [INCOMPLETE][172] ([i915#180] / [i915#1982] / [i915#4939]) -> [INCOMPLETE][173] ([i915#180] / [i915#4939])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [INCOMPLETE][174] ([i915#180] / [i915#4939]) -> [FAIL][175] ([i915#4767])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][176] ([i915#658]) -> [SKIP][177] ([i915#2920])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][178] ([i915#2920]) -> [SKIP][179] ([i915#658])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb1/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][180] ([i915#2920]) -> [SKIP][181] ([fdo#111068] / [i915#658]) +1 similar issue
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][188], [FAIL][189], [FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl8/igt@runner@aborted.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl8/igt@runner@aborted.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl6/igt@runner@aborted.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl8/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl7/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl2/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl1/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl8/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl8/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl1/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl3/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl3/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][194], [FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198], [FAIL][199], [FAIL][200], [FAIL][201], [FAIL][202], [FAIL][203]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92]) -> ([FAIL][204], [FAIL][205], [FAIL][206], [FAIL][207], [FAIL][208]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl1/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl1/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl1/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl1/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl7/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl7/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl7/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl7/igt@runner@aborted.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl7/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl7/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@runner@aborted.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3354]: https://gitlab.freedesktop.org/drm/intel/issues/3354
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
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
  [i915#3692]: https://gitlab.freedesktop.org/drm/intel/issues/3692
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4639]: https://gitlab.freedesktop.org/drm/intel/issues/4639
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5160]: https://gitlab.freedesktop.org/drm/intel/issues/5160
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6331]: https://gitlab.freedesktop.org/drm/intel/issues/6331
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6458]: https://gitlab.freedesktop.org/drm/intel/issues/6458
  [i915#6463]: https://gitlab.freedesktop.org/drm/intel/issues/6463
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6619 -> IGTPW_7623

  CI-20190529: 20190529
  CI_DRM_11975: 5b5ad12f8d971a9feeb54a3f3d58b48de8978ad2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7623: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/index.html
  IGT_6619: ec2ab8e3a151ce05bd2726319c528c2ab99e8a96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/index.html

--===============8681154615401205934==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/gem_lmem_swapping: add some coverage f=
or big objects (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107030/">https://patchwork.freedesktop.org/series/107030/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7623/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6619_full -&gt; IGTPW_7623_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/index.=
html</p>
<h2>Participating hosts (9 -&gt; 10)</h2>
<p>Additional (1): shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7623=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_lmem_swapping@massive} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb7/igt@gem_lmem_swapping@massive.html">SK=
IP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_lmem_swapping@massive-random} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb6/igt@gem_lmem_swapping@massive-random.ht=
ml">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-rkl-2/igt@gem_lmem_swapping@massive-random.ht=
ml">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglu-1/igt@gem_lmem_swapping@massive-random.h=
tml">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_vblank@pipe-a-wait-idle-hang:<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-dg1-19/igt@kms_vblank@pipe-a-wait-idle-hang.=
html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6619_full and IGTPW_7623_full=
:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random@lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive@lmem0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.05] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7623_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_buddy@all:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb2/igt@drm_buddy@all.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6433">i915#6433</a>)<=
/p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb2/igt@drm_buddy@all.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6433">i915#6433</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb4/igt@f=
eature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
persistence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-snb2/igt@gem_eio@unwedge-stress.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3354">i915#33=
54</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb5/igt@gem_eio@unwedge-stress.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5=
784</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb4/igt@gem_exec_balancer@parallel.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb6/i=
gt@gem_exec_balancer@parallel.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs=
0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk7/=
igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-icl=
b5/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-=
iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb1/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb8/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-kbl1/igt@gem_lmem_swapping@parallel-multi.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-apl2/igt@gem_lmem_swapping@parallel-multi.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4613">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-apl3/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-y-til=
ed-mc-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +23 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb3/igt@gem_render_copy@y-tiled-ccs-to-y-ti=
led-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/768">i915#768</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-apl6/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl3=
/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb4/igt@gen7_exec_parse@cmd-crossing-page.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-apl7/igt@gen9_exec_parse@bb-large.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl8/igt@g=
en9_exec_parse@bb-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4639">i915#4639</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">=
i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb6/igt@gen9_exec_parse@bb-start-out.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">=
i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@i915_module_load@resize-bar.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6412">=
i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@i915_suspend@fence-restore-untiled.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-kbl4/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@i91=
5_suspend@forcewake.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-glk1/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-apl8/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb7/igt@kms_ccs@pipe-b-random-ccs-data-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-iclb3/igt@kms_ccs@pipe-c-random-ccs-data-y_t=
iled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb1/igt@kms_chamelium@dp-crc-multiple.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
4">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_chamelium@hdmi-cmp-planar-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-apl4/igt@kms_chamelium@hdmi-crc-fast.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_content_protection@uevent.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105"=
>i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb1/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb6/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4103">i915#4103</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7623/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitio=
ns.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2346">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7623/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888"=
>i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5160">i915#5160</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb5/igt@kms_dsc@dsc-with-bpp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3828">i915#382=
8</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb4/igt@kms_dsc@dsc-with-bpp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3828">i915#382=
8</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb8/igt@kms_flip@2x-blocking-wf_vblank.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
4">fdo#109274</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb5/igt@kms_flip@2x-blocking-wf_vblank.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
4">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3637">i915#3637</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +=
7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +201 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b565-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/6497">i915#6497</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +6 similar iss=
ues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-tglb5/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1839">i915#1839</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-iclb6/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1839">i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb4/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb3/igt@kms_plane_scaling@=
plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5=
176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-=
edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-apl6/igt@kms_plane_scaling@planes-upscale-fa=
ctor-0-25-downscale-factor-0-25@pipe-b-dp-1.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +119 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-apl7/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl4/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_psr@psr2_primary_mmap_gtt.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132"=
>i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3467">i915#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-iclb6/igt@=
kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb2/igt@kms_vrr@flip-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-apl2/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6619/shard-apl6/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl4/igt@=
perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/5639">i915#5639</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6619/shard-glk7/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-glk3/igt@=
perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/5639">i915#5639</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-tglb5/igt@prime_nv_api@i915_nv_import_twice_=
check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-iclb2/igt@prime_nv_pcopy@test3_3.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-kbl1/igt@sysfs_clients@create.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-busy:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-5/igt@drm_fdinfo@virtual-busy.html">SKIP</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-5/igt@=
drm_fdinfo@virtual-busy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6619/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shar=
d-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6619/shard-tglu-8/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/sha=
rd-tglu-8/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7623/shard-apl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a=
> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525=
">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7623/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6619/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-k=
bl1/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6619/shard-glk6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-g=
lk3/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/=
shard-rkl-5/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6619/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#28=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_762=
3/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6619/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623=
/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard=
-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/s=
hard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@invalid-bsd2-flag-on-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-5/igt@gem_exec_params@invalid-bsd2-flag-on-blt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109315">f=
do#109315</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7623/shard-rkl-4/igt@gem_exec_params@invalid-bsd2-flag-on-blt.html">PAS=
S</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3=
281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
23/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">PASS</a> +3 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-tglb3/=
igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-1/igt@gem_pread@display.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-5/igt@=
gem_pread@display.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-1/igt@gem_softpin@evict-single-offset.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171">i915#4171</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/sh=
ard-rkl-6/igt@gem_softpin@evict-single-offset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/s=
hard-kbl4/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/sh=
ard-rkl-5/igt@gen9_exec_parse@valid-registers.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-2/igt@i915_pm_backlight@fade_with_dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/s=
hard-rkl-6/igt@i915_pm_backlight@fade_with_dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl6/ig=
t@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-2/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rk=
l-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-yti=
led.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb2101010-mmap-gtt-ytiled.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hd=
mi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7623/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interru=
ptible@a-hdmi-a1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7623/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb10=
1010-draw-mmap-gtt.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3546">i915#3546</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-al=
pha-transparent-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3546">i915#3546</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7623/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-=
b-constant-alpha-max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_cpu:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-5/igt@kms_psr@cursor_mmap_cpu.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-rk=
l-6/igt@kms_psr@cursor_mmap_cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/sha=
rd-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7623/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalida=
te-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1=
845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">=
i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7623/shard-rkl-6/igt@kms_rotation_crc@primary-rotation-90.html">PASS</a=
> +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-busy-hang:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-tglb7/igt@kms_vblank@pipe-c-wait-busy-hang.html">INCOMPLETE=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/s=
hard-tglb7/igt@kms_vblank@pipe-c-wait-busy-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2436">=
i915#2436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7623/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-metric-set-id:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-5/igt@perf@invalid-oa-metric-set-id.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shar=
d-rkl-6/igt@perf@invalid-oa-metric-set-id.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@multi-wait-all-for-submit-unsubmitted-submitted:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-rkl-5/igt@syncobj_wait@multi-wait-all-for-submit-unsubmitte=
d-submitted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7623/shard-rkl-2/igt@syncobj_wait@multi-wait-all-for-=
submit-unsubmitted-submitted.html">PASS</a> +7 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6619/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i91=
5#4939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7623/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a=
>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6619/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/=
shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7623/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exc=
eed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920=
">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7623/shard-iclb1/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658=
">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920=
">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7623/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1110=
68">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl8/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/s=
hard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6619/shard-apl8/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-apl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6619/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#43=
12</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i=
915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7623/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl8/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_762=
3/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7623/shard-apl1/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard=
-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7623/shard-apl3/igt@runner@aborted.html">FAIL</a>) =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/300=
2">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6619/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl1/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/s=
hard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6619/shard-kbl1/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6619/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl7/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6619/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6619/=
shard-kbl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7623/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7623/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/shard-kbl7/igt@runner@ab=
orted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6619 -&gt; IGTPW_7623</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11975: 5b5ad12f8d971a9feeb54a3f3d58b48de8978ad2 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7623: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7623/index.htm=
l<br />
  IGT_6619: ec2ab8e3a151ce05bd2726319c528c2ab99e8a96 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8681154615401205934==--
