Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2236546280468719135=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Tue, 14 Jun 2022 15:48:41 -0000
Message-ID: <165522172185.12484.4247258191153023789@emeril.freedesktop.org>
References: <20220610084540.4087062-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220610084540.4087062-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fcursor=5Fedge=5Fwa?=
 =?utf-8?q?lk=3A_Convert_tests_to_dynamic?=
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

--===============2236546280468719135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_cursor_edge_walk: Convert tests to dynamic
URL   : https://patchwork.freedesktop.org/series/104968/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11752_full -> IGTPW_7276_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7276_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-dg1-17/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * {igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-edp-1} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb7/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-edp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - {shard-tglu}:       [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglu-6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglu-4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@module-unload:
    - {shard-tglu}:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglu-1/igt@perf_pmu@module-unload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglu-1/igt@perf_pmu@module-unload.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11752_full and IGTPW_7276_full:

### New IGT tests (63) ###

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.36] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.36] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.33, 3.53] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 4.28] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 4.30] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.51, 4.59] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [1.64, 3.37] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [1.64, 3.41] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [1.66, 3.73] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.39] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.35] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.33, 3.50] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 4.27] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.52, 4.57] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [1.63, 3.39] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [1.62, 3.37] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [1.67, 3.86] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.38] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.40] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.33, 3.51] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 4.29] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.56, 4.57] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.22, 3.40] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.23, 3.44] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.76] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.37] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.27, 3.38] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.42, 3.67] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.46, 4.27] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.46, 4.28] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.55] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.39, 3.62] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.38, 3.63] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.69, 3.99] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.23] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.23] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.50] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.29] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.59] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.28] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-edp-1:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.19, 1.54] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.06, 0.41] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  

Known issues
------------

  Here are the changes found in IGTPW_7276_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#658])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb1/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-snb5/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_eio@in-flight-1us:
    - shard-tglb:         [PASS][9] -> [TIMEOUT][10] ([i915#3063]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb3/igt@gem_eio@in-flight-1us.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb1/igt@gem_eio@in-flight-1us.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#5784])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb7/igt@gem_eio@kms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb1/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][13] -> [TIMEOUT][14] ([i915#3070])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb5/igt@gem_eio@unwedge-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4525])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([i915#4525])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#2842]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-kbl6/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#2842]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglb:         [PASS][26] -> [FAIL][27] ([i915#2842])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#2849])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#2190])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#4270])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb3/igt@gem_pxp@create-regular-context-2.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#4270])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb7/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][33] ([fdo#109271]) +38 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#768])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_softpin@evict-single-offset:
    - shard-apl:          NOTRUN -> [FAIL][35] ([i915#4171])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl3/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@input-checking:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][36] ([i915#4991])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb3/igt@gem_userptr_blits@input-checking.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][37] ([i915#4991])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-kbl3/igt@gem_userptr_blits@input-checking.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][38] ([i915#4991])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-snb5/igt@gem_userptr_blits@input-checking.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][39] ([i915#4991])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb5/igt@gem_userptr_blits@input-checking.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][40] ([i915#4991])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk8/igt@gem_userptr_blits@input-checking.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          NOTRUN -> [DMESG-WARN][41] ([i915#5566] / [i915#716])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][42] -> [FAIL][43] ([i915#454])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][44] -> [SKIP][45] ([fdo#109271]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl4/igt@i915_pm_dc@dc9-dpms.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl8/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#110892])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111644] / [i915#1397] / [i915#2411])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][48] -> [DMESG-WARN][49] ([i915#5591])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb5/igt@i915_selftest@live@hangcheck.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-snb:          [PASS][50] -> [DMESG-WARN][51] ([i915#4528])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-snb6/igt@i915_suspend@basic-s2idle-without-i915.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-snb7/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          NOTRUN -> [DMESG-WARN][52] ([i915#180])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglb:         [PASS][53] -> [FAIL][54] ([i915#3743]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#6095]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb2/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3886]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3689])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3886])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk7/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [i915#3886])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb7/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
    - shard-kbl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#3886])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-kbl1/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-snb:          NOTRUN -> [SKIP][61] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-snb6/igt@kms_chamelium@common-hpd-after-suspend.html
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb7/igt@kms_chamelium@common-hpd-after-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk3/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb5/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_color@pipe-d-ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][65] ([fdo#109271]) +57 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-snb4/igt@kms_color@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278] / [i915#1149])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb1/igt@kms_color@pipe-d-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl4/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-0-75.html
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-kbl6/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3319])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3359]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109278]) +12 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][73] -> [FAIL][74] ([i915#72])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109274] / [fdo#111825]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb3/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109274]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [PASS][77] -> [DMESG-WARN][78] ([i915#180])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#2587])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-iclb:         [PASS][80] -> [SKIP][81] ([i915#3701])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109280]) +7 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#109280] / [fdo#111825]) +7 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][84] -> [FAIL][85] ([i915#1188])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-snb:          [PASS][86] -> [SKIP][87] ([fdo#109271])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-snb4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-snb5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#3536])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-none.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#3536])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb3/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#111615] / [fdo#112054])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271]) +159 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#658])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@cursor_render:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271]) +39 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-kbl6/igt@kms_psr@cursor_render.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][94] -> [SKIP][95] ([fdo#109441]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-tglb:         NOTRUN -> [FAIL][96] ([i915#132] / [i915#3467])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb1/igt@kms_psr@psr2_cursor_render.html
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109441])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [PASS][98] -> [SKIP][99] ([i915#5519])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vblank@pipe-b-query-idle-hang:
    - shard-glk:          [PASS][100] -> [SKIP][101] ([fdo#109271])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-glk3/igt@kms_vblank@pipe-b-query-idle-hang.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk4/igt@kms_vblank@pipe-b-query-idle-hang.html
    - shard-kbl:          [PASS][102] -> [SKIP][103] ([fdo#109271])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-kbl4/igt@kms_vblank@pipe-b-query-idle-hang.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-kbl1/igt@kms_vblank@pipe-b-query-idle-hang.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#533])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-glk:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#533])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk1/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-kbl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#533])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#3555])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb2/igt@kms_vrr@flip-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][108] ([i915#3555])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_vrr@flip-suspend.html

  * igt@sw_sync@sync_multi_timeline_wait:
    - shard-iclb:         NOTRUN -> [FAIL][109] ([i915#6140])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb4/igt@sw_sync@sync_multi_timeline_wait.html
    - shard-kbl:          NOTRUN -> [FAIL][110] ([i915#6140])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-kbl3/igt@sw_sync@sync_multi_timeline_wait.html
    - shard-snb:          NOTRUN -> [FAIL][111] ([i915#6140])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-snb7/igt@sw_sync@sync_multi_timeline_wait.html
    - shard-apl:          NOTRUN -> [FAIL][112] ([i915#6140])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl4/igt@sw_sync@sync_multi_timeline_wait.html
    - shard-tglb:         NOTRUN -> [FAIL][113] ([i915#6140])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb3/igt@sw_sync@sync_multi_timeline_wait.html
    - shard-glk:          NOTRUN -> [FAIL][114] ([i915#6140])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk1/igt@sw_sync@sync_multi_timeline_wait.html

  * igt@sysfs_clients@busy:
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2994]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl1/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@split-25:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#2994])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb4/igt@sysfs_clients@split-25.html
    - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#2994])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-kbl7/igt@sysfs_clients@split-25.html
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#2994])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb1/igt@sysfs_clients@split-25.html
    - shard-glk:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2994])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk9/igt@sysfs_clients@split-25.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-apl:          [TIMEOUT][120] ([i915#3063]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl4/igt@gem_eio@in-flight-contexts-10ms.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl8/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][122] ([i915#4525]) -> [PASS][123] +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][124] ([i915#2842]) -> [PASS][125] +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [TIMEOUT][126] ([i915#3953]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_backlight@basic-brightness:
    - {shard-rkl}:        [SKIP][128] ([i915#3012]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@i915_pm_backlight@basic-brightness.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][130] ([i915#4281]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb8/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - {shard-tglu}:       [WARN][132] ([i915#2681]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - {shard-dg1}:        [SKIP][134] ([i915#1397]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-dg1-17/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - {shard-rkl}:        [SKIP][136] ([i915#1397]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglb:         [FAIL][138] ([i915#3743]) -> [PASS][139] +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-glk:          [FAIL][140] ([i915#1888] / [i915#5138]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-glk4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - {shard-rkl}:        [SKIP][142] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][143] +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - {shard-rkl}:        [SKIP][144] ([fdo#112022] / [i915#4070]) -> [PASS][145] +6 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-2/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - {shard-rkl}:        [SKIP][146] ([fdo#111825] / [i915#4070]) -> [PASS][147] +6 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-tglb:         [FAIL][148] ([i915#2346]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][150] ([i915#2346] / [i915#533]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-iclb:         [FAIL][152] ([i915#2346]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - {shard-rkl}:        [SKIP][154] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][155] +9 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][156] ([i915#1849] / [i915#4098]) -> [PASS][157] +29 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_invalid_mode@bad-vtotal:
    - {shard-rkl}:        [SKIP][158] ([i915#4278]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@kms_invalid_mode@bad-vtotal.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_plane@plane-panning-top-left@pipe-b-planes:
    - {shard-rkl}:        [SKIP][160] ([i915#3558]) -> [PASS][161] +3 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html

  * igt@kms_plane@plane-position-hole@pipe-b-planes:
    - {shard-rkl}:        [SKIP][162] ([i915#1849] / [i915#3558]) -> [PASS][163] +1 similar issue
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-2/igt@kms_plane@plane-position-hole@pipe-b-planes.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min:
    - {shard-rkl}:        [SKIP][164] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][165] +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min.html

  * igt@kms_properties@crtc-properties-legacy:
    - {shard-rkl}:        [SKIP][166] ([i915#1849]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr@sprite_plane_move:
    - {shard-rkl}:        [SKIP][168] ([i915#1072]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@kms_psr@sprite_plane_move.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_psr@sprite_plane_move.html

  * igt@kms_vblank@pipe-b-query-idle:
    - {shard-rkl}:        [SKIP][170] ([i915#1845] / [i915#4098]) -> [PASS][171] +29 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-rkl-1/igt@kms_vblank@pipe-b-query-idle.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_vblank@pipe-b-query-idle.html

  * igt@kms_vblank@pipe-b-ts-continuation-idle:
    - shard-snb:          [SKIP][172] ([fdo#109271]) -> [PASS][173] +3 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-snb4/igt@kms_vblank@pipe-b-ts-continuation-idle.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-snb7/igt@kms_vblank@pipe-b-ts-continuation-idle.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][174] ([i915#180]) -> [PASS][175] +3 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][176] ([i915#4525]) -> [FAIL][177] ([i915#6117])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][178] ([i915#2842]) -> [FAIL][179] ([i915#2852])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][180] ([i915#2851]) -> [FAIL][181] ([i915#2842])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [SKIP][182] ([i915#2848]) -> [FAIL][183] ([i915#2842]) +4 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][184] ([i915#658]) -> [SKIP][185] ([i915#2920])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][186] ([fdo#111068] / [i915#658]) -> [SKIP][187] ([i915#2920])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][188], [FAIL][189], [FAIL][190], [FAIL][191], [FAIL][192]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl3/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl4/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl1/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl7/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl2/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl6/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl6/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl2/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2848]: https://gitlab.freedesktop.org/drm/intel/issues/2848
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2851]: https://gitlab.freedesktop.org/drm/intel/issues/2851
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3953]: https://gitlab.freedesktop.org/drm/intel/issues/3953
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5266]: https://gitlab.freedesktop.org/drm/intel/issues/5266
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5303]: https://gitlab.freedesktop.org/drm/intel/issues/5303
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6518 -> IGTPW_7276
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11752: 75ccb392dacda10127700cb2a03160f5dd9f475c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7276: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.html
  IGT_6518: 0189ca288f7188e60f5eda356b190040bf8ec704 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.html

--===============2236546280468719135==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_c=
ursor_edge_walk: Convert tests to dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/104968/">https://patchwork.freedesktop.org/series/104968/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7276/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11752_full -&gt; IGTPW_7276_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7276=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-dg1-17/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-1.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-edp-1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-tglb7/igt@kms_dither@fb-8bpc-vs-panel-8bpc@p=
ipe-a-edp-1.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglu-6/igt@kms_vblank@pipe-a-ts-continuation-suspend.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7276/shard-tglu-4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DME=
SG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglu-1/igt@perf_pmu@module-unload.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglu-1=
/igt@perf_pmu@module-unload.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11752_full and IGTPW_7276_=
full:</p>
<h3>New IGT tests (63)</h3>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.33, 3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 4.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.51, 4.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.64, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.64, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.66, 3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.33, 3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.52, 4.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.63, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.62, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.67, 3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.33, 3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.56, 4.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.22, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.23, 3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.27, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.42, 3.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.46, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.46, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.39, 3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.38, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.69, 3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.19, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.06, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7276_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-iclb1/igt@feature_discovery@psr2.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#6=
58</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-snb5/igt@gem_ctx_persistence@engines-hostile=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-1us:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglb3/igt@gem_eio@in-flight-1us.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb1/ig=
t@gem_eio@in-flight-1us.html">TIMEOUT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3063">i915#3063</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglb7/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-tglb1/igt@gem_eio@=
kms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb5/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb2/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3070">i915#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-iclb5/igt@gem_exec_balancer@parallel.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i=
915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7276/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-kbl6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/sh=
ard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/=
shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/sh=
ard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11752/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/sh=
ard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 si=
milar issues</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11752/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/s=
hard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/sh=
ard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-apl1/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-tglb3/igt@gem_pxp@create-regular-context-2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42=
70">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb7/igt@gem_pxp@create-regular-context-2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42=
70">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-glk3/igt@gem_render_copy@y-tiled-ccs-to-yf-ti=
led-mc-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +38 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb2/igt@gem_render_copy@y-tiled-ccs-to-yf-t=
iled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/768">i915#768</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-apl3/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/417=
1">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb3/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-kbl3/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4991">i915#4991</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-snb5/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4991">i915#4991</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-tglb5/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-glk8/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4991">i915#4991</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-apl2/igt@gen9_exec_parse@allowed-single.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5566">i915#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-iclb7/igt@i=
915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-apl8/igt@i9=
15_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110892">fdo#110892</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglb5/igt@i915_selftest@live@hangcheck.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-t=
glb5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-snb6/igt@i915_suspend@basic-s2idle-without-i915.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_727=
6/shard-snb7/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#45=
28</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-apl6/igt@i915_suspend@fence-restore-tiled2un=
tiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglb7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-0-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7276/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-32b=
pp-rotate-0-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3743">i915#3743</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-tglb2/igt@kms_ccs@pipe-a-bad-rotation-90-4_t=
iled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-apl1/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-glk7/igt@kms_ccs@pipe-c-random-ccs-data-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb7/igt@kms_ccs@pipe-c-random-ccs-data-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-kbl1/igt@kms_ccs@pipe-c-random-ccs-data-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-snb6/igt@kms_chamelium@common-hpd-after-suspe=
nd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-tglb7/igt@kms_chamelium@common-hpd-after-susp=
end.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-glk3/igt@kms_chamelium@common-hpd-after-suspe=
nd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-iclb5/igt@kms_chamelium@dp-hpd-with-enabled-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-snb4/igt@kms_color@pipe-d-ctm-red-to-blue.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) +57 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb1/igt@kms_color@pipe-d-ctm-red-to-blue.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1149">i915#1149</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-apl4/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-0-75=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-kbl6/igt@kms_color_chamelium@pipe-d-ctm-0-75.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3319">i915#3319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-max-s=
ize-onscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3359">i915#3359</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21=
-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomi=
c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7276/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7=
2">i915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-tglb3/igt@kms_flip@2x-flip-vs-fences.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">=
fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111825">fdo#111825</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_flip@2x-wf_vblank-ts-check.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-=
apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp=
-ytile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3701">i915#3701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +7 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +7 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/s=
hard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-snb4/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7276/shard-snb5/igt@kms_plane@plane-panning-bottom-right-s=
uspend@pipe-b-planes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3536">i915#3536</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb3/igt@kms_plane_lowres@pipe-b-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3536">i915#3536</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-=
dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-apl2/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-75@pipe-c-dp-1.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +159 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-apl2/igt@kms_psr2_su@page_flip-p010.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_render:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-kbl6/igt@kms_psr@cursor_render.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard=
-iclb5/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-tglb1/igt@kms_psr@psr2_cursor_render.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i91=
5#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467=
">i915#3467</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb5/igt@kms_psr@psr2_cursor_render.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">f=
do#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb2/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7276/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-idle-hang:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11752/shard-glk3/igt@kms_vblank@pipe-b-query-idle-hang.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shar=
d-glk4/igt@kms_vblank@pipe-b-query-idle-hang.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11752/shard-kbl4/igt@kms_vblank@pipe-b-query-idle-hang.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shar=
d-kbl1/igt@kms_vblank@pipe-b-query-idle-hang.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-glk1/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-tglb2/igt@kms_vrr@flip-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_vrr@flip-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sw_sync@sync_multi_timeline_wait:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb4/igt@sw_sync@sync_multi_timeline_wait.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/61=
40">i915#6140</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-kbl3/igt@sw_sync@sync_multi_timeline_wait.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/614=
0">i915#6140</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-snb7/igt@sw_sync@sync_multi_timeline_wait.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/614=
0">i915#6140</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-apl4/igt@sw_sync@sync_multi_timeline_wait.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/614=
0">i915#6140</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-tglb3/igt@sw_sync@sync_multi_timeline_wait.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/61=
40">i915#6140</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-glk1/igt@sw_sync@sync_multi_timeline_wait.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/614=
0">i915#6140</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-apl1/igt@sysfs_clients@busy.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i9=
15#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-iclb4/igt@sysfs_clients@split-25.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-kbl7/igt@sysfs_clients@split-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-tglb1/igt@sysfs_clients@split-25.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7276/shard-glk9/igt@sysfs_clients@split-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-apl4/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#=
3063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
276/shard-apl8/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7276/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence=
.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/=
shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3953">i915#3953</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7276/shard-tglb7/igt@i915_module_load@reload-with-fault-inject=
ion.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@i915_pm_backlight@basic-brightness.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915=
#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7276/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-ic=
lb8/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2=
681</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_72=
76/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shar=
d-dg1-17/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397"=
>i915#1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7276/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3743">i915#3743</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7276/shard-tglb5/igt@kms_big_fb@x-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-glk4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#=
1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5138"=
>i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7276/shard-glk9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@kms_color@pipe-a-ctm-blue-to-red.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1=
149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">=
i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_color@pipe-a-ctm-blue-to-red.html"=
>PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-2/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2022">fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-256x85-s=
liding.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-var=
ying-size.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_cursor_legacy@basic-fl=
ip-after-cursor-varying-size.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-trans=
itions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7276/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atom=
ic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-glk3/igt@kms_cursor_legacy@flip=
-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346"=
>i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7276/shard-iclb4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-unti=
led.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb2101010-blt-untiled.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcps=
r-rgb565-draw-mmap-gtt.html">PASS</a> +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@kms_invalid_mode@bad-vtotal.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#4278</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/sh=
ard-rkl-6/igt@kms_invalid_mode@bad-vtotal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@kms_plane@plane-panning-top-left@pipe-b-plane=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7276/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-b-pl=
anes.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-2/igt@kms_plane@plane-position-hole@pipe-b-planes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-pl=
anes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-m=
in.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7276/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-=
constant-alpha-min.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i=
915#1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7276/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_move:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@kms_psr@sprite_plane_move.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shar=
d-rkl-6/igt@kms_psr@sprite_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-idle:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-rkl-1/igt@kms_vblank@pipe-b-query-idle.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915=
#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7276/shard-rkl-6/igt@kms_vblank@pipe-b-query-idle.html">PASS</a> +29 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-idle:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-snb4/igt@kms_vblank@pipe-b-ts-continuation-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7276/shard-snb7/igt@kms_vblank@pipe-b-ts-continuation-idle.html">PASS<=
/a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7276/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.htm=
l">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7276/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7276/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2852">i915#2852</a>=
)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2851">i915#=
2851</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
276/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2848">i915#2848=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/=
shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11752/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7276/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11752/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11752/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl7/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11752/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/s=
hard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7276/shard-apl6/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/shard-ap=
l2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7276/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#=
180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">=
i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6518 -&gt; IGTPW_7276</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11752: 75ccb392dacda10127700cb2a03160f5dd9f475c @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7276: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7276/index.htm=
l<br />
  IGT_6518: 0189ca288f7188e60f5eda356b190040bf8ec704 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2236546280468719135==--
