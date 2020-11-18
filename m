Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Nov 2020 15:33:24 -0000
Message-ID: <160571360429.24805.13223580301291204899@emeril.freedesktop.org>
References: <20201118081449.10523-1-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20201118081449.10523-1-pankaj.laxminarayan.bharadiya@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIEZC?=
 =?utf-8?q?=5FDAMAGE=5FCLIPS_prop_and_new_test_for_Selective_fetch?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1151772919=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1151772919==
Content-Type: multipart/alternative;
 boundary="===============5496935102443274410=="

--===============5496935102443274410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add FB_DAMAGE_CLIPS prop and new test for Selective fetch
URL   : https://patchwork.freedesktop.org/series/84014/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9350_full -> IGTPW_5184_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5184_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_psr2_sf@cursor-plane-update-sf} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +19 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb1/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * {igt@kms_psr2_sf@overlay-plane-update-sf-1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +19 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9350_full and IGTPW_5184_full:

### New IGT tests (20) ###

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-plane-update-sf-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-plane-update-sf-2:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-plane-update-sf-3:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-plane-update-sf-4:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-plane-update-sf-5:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-primary-update-sf-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-primary-update-sf-2:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-primary-update-sf-3:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-primary-update-sf-4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-primary-update-sf-5:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@plane-move-sf-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@plane-move-sf-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@plane-move-sf-2:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@plane-move-sf-3:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@primary-plane-update-sf-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@primary-plane-update-sf-2:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@primary-plane-update-sf-3:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@primary-plane-update-sf-4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@primary-plane-update-sf-5:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5184_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-snb:          [PASS][3] -> [INCOMPLETE][4] ([i915#1037])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-snb2/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#1982]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb6/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb7/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#2389])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hsw2/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#1888])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw7/igt@gem_exec_whisper@basic-forked-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hsw7/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#644])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#579])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb8/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1635] / [i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1635] / [i915#1982]) +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#2598])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [PASS][29] -> [INCOMPLETE][30] ([i915#1185] / [i915#250])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-apl:          [PASS][31] -> [INCOMPLETE][32] ([i915#1635] / [i915#2635])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-glk:          [PASS][33] -> [INCOMPLETE][34] ([i915#2635])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-hsw:          [PASS][35] -> [INCOMPLETE][36] ([i915#2055] / [i915#2637])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hsw1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([i915#155])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109642] / [fdo#111068])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([i915#1354]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb8/igt@perf@gen12-oa-tlb-invalidate.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb8/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-apl:          [PASS][45] -> [SKIP][46] ([fdo#109271] / [i915#1354] / [i915#1635])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl1/igt@perf@low-oa-exponent-permissions.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl3/igt@perf@low-oa-exponent-permissions.html
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([i915#1354])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb3/igt@perf@low-oa-exponent-permissions.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb3/igt@perf@low-oa-exponent-permissions.html
    - shard-kbl:          [PASS][49] -> [SKIP][50] ([fdo#109271] / [i915#1354])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl6/igt@perf@low-oa-exponent-permissions.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-kbl4/igt@perf@low-oa-exponent-permissions.html
    - shard-hsw:          [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw7/igt@perf@low-oa-exponent-permissions.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hsw7/igt@perf@low-oa-exponent-permissions.html
    - shard-glk:          [PASS][53] -> [SKIP][54] ([fdo#109271] / [i915#1354])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk1/igt@perf@low-oa-exponent-permissions.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk4/igt@perf@low-oa-exponent-permissions.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][55] -> [DMESG-WARN][56] ([i915#1982] / [i915#262])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb7/igt@perf_pmu@module-unload.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb5/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@gem_eio@kms:
    - shard-hsw:          [INCOMPLETE][57] ([i915#1888] / [i915#2244]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw2/igt@gem_eio@kms.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hsw7/igt@gem_eio@kms.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][59] ([i915#2389]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [FAIL][61] -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@gem_exec_suspend@basic-s3.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk5/igt@gem_exec_suspend@basic-s3.html
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][65] ([i915#1373] / [i915#2405]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb4/igt@gem_softpin@noreloc-s3.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb3/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [INCOMPLETE][67] ([i915#1635] / [i915#2405] / [i915#2635]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl8/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [INCOMPLETE][69] ([i915#2199] / [i915#2405] / [i915#2635]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@gem_softpin@noreloc-s3.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk5/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [INCOMPLETE][71] ([i915#2405] / [i915#2637]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw1/igt@gem_softpin@noreloc-s3.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hsw1/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [INCOMPLETE][73] ([i915#2405]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl1/igt@gem_softpin@noreloc-s3.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-kbl6/igt@gem_softpin@noreloc-s3.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][75] ([i915#2597]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb1/igt@kms_async_flips@test-time-stamp.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb3/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-kbl:          [DMESG-WARN][77] ([i915#1982]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-kbl3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-snb:          [FAIL][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-snb6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-snb7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
    - shard-apl:          [DMESG-WARN][81] ([i915#1635] / [i915#1982]) -> [PASS][82] +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
    - shard-glk:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html

  * igt@kms_flip@dpms-off-confusion@a-vga1:
    - shard-hsw:          [DMESG-WARN][85] ([i915#1982]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw6/igt@kms_flip@dpms-off-confusion@a-vga1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hsw2/igt@kms_flip@dpms-off-confusion@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-iclb:         [DMESG-WARN][87] ([i915#1982]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-tglb:         [DMESG-WARN][89] ([i915#1982]) -> [PASS][90] +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:
    - shard-kbl:          [FAIL][91] ([i915#2472]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl3/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-kbl6/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
    - shard-apl:          [FAIL][93] ([i915#1635] / [i915#2472]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl3/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl8/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [SKIP][95] ([i915#1354]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb8/igt@perf@oa-exponents.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb2/igt@perf@oa-exponents.html
    - shard-glk:          [SKIP][97] ([fdo#109271] / [i915#1354]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk5/igt@perf@oa-exponents.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk7/igt@perf@oa-exponents.html
    - shard-apl:          [SKIP][99] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl8/igt@perf@oa-exponents.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl4/igt@perf@oa-exponents.html
    - shard-kbl:          [SKIP][101] ([fdo#109271] / [i915#1354]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl1/igt@perf@oa-exponents.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-kbl7/igt@perf@oa-exponents.html
    - shard-iclb:         [SKIP][103] ([i915#1354]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb5/igt@perf@oa-exponents.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb7/igt@perf@oa-exponents.html
    - shard-hsw:          [SKIP][105] ([fdo#109271]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw6/igt@perf@oa-exponents.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hsw1/igt@perf@oa-exponents.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [DMESG-WARN][107] ([i915#1436]) -> [DMESG-WARN][108] ([i915#2411])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb7/igt@gem_softpin@noreloc-s3.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb2/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-tglb:         [DMESG-WARN][109] ([i915#2411]) -> [SKIP][110] ([i915#579])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][111] ([i915#1226]) -> [SKIP][112] ([fdo#109349])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-tglb:         [DMESG-WARN][113] ([i915#2411]) -> [INCOMPLETE][114] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-kbl:          [SKIP][115] ([fdo#109271]) -> [SKIP][116] ([fdo#109271] / [i915#1354])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl6/igt@perf@gen12-oa-tlb-invalidate.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-kbl4/igt@perf@gen12-oa-tlb-invalidate.html
    - shard-glk:          [SKIP][117] ([fdo#109271]) -> [SKIP][118] ([fdo#109271] / [i915#1354])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk3/igt@perf@gen12-oa-tlb-invalidate.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk4/igt@perf@gen12-oa-tlb-invalidate.html
    - shard-apl:          [SKIP][119] ([fdo#109271] / [i915#1635]) -> [SKIP][120] ([fdo#109271] / [i915#1354] / [i915#1635])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl2/igt@perf@gen12-oa-tlb-invalidate.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl3/igt@perf@gen12-oa-tlb-invalidate.html
    - shard-iclb:         [SKIP][121] ([fdo#109289]) -> [SKIP][122] ([i915#1354])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb8/igt@perf@gen12-oa-tlb-invalidate.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb3/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][123] ([i915#2295] / [i915#2439] / [i915#483]) -> [FAIL][124] ([i915#2295] / [i915#483])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw1/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hsw1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][125], [FAIL][126]) ([i915#2295] / [i915#2439] / [i915#483]) -> ([FAIL][127], [FAIL][128]) ([i915#1814] / [i915#2295] / [i915#2439] / [i915#483])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb5/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb4/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb6/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][129], [FAIL][130]) ([i915#1611] / [i915#1635] / [i915#2295] / [i915#2439]) -> ([FAIL][131], [FAIL][132]) ([i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl6/igt@runner@aborted.html
    - shard-glk:          ([FAIL][133], [FAIL][134]) ([i915#1611] / [i915#2295] / [i915#2439] / [i915#86] / [k.org#202321]) -> ([FAIL][135], [FAIL][136]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [k.org#202321])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk2/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk8/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk6/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][137], [FAIL][138]) ([i915#2295] / [i915#2439]) -> ([FAIL][139], [FAIL][140]) ([i915#1814] / [i915#2295] / [i915#2439])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb2/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb3/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2244]: https://gitlab.freedesktop.org/drm/intel/issues/2244
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2472]: https://gitlab.freedesktop.org/drm/intel/issues/2472
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5855 -> IGTPW_5184
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9350: 3161d1b26b7e1a7cb9146e3f8bd613f901ff5b38 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5184: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/index.html
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freed

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/index.html

--===============5496935102443274410==
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
<tr><td><b>Series:</b></td><td>Add FB_DAMAGE_CLIPS prop and new test for Se=
lective fetch</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84014/">https://patchwork.freedesktop.org/series/84014/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5184/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5184/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9350_full -&gt; IGTPW_5184_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5184=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_psr2_sf@cursor-plane-update-sf} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5184/shard-tglb1/igt@kms_psr2_sf@cursor-plane-update-sf=
.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@overlay-plane-update-sf-1} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5184/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-s=
f-1.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9350_full and IGTPW_5184_f=
ull:</p>
<h3>New IGT tests (20)</h3>
<ul>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-2:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-3:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-4:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-5:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-2:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-3:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-4:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-5:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-2:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-3:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-2:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-3:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-4:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-5:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5184_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/sha=
rd-snb2/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>)</=
li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb6/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tg=
lb7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/=
shard-hsw2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw7/igt@gem_exec_whisper@basic-forked-all.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shar=
d-hsw7/igt@gem_exec_whisper@basic-forked-all.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/sha=
rd-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/644">i915#644</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb8/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard=
-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5184/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#=
54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5184/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54"=
>i915#54</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5184/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#=
54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5184/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-apl8/igt@kms_cursor_legacy@basic-flip-before-cursor-atom=
ic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5184/shard-apl6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomi=
c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1982">i915#1982</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_518=
4/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mma=
p-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5184/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-m=
map-cpu.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5184/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-s=
uspend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1185">i915#1185</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/250">i915#250</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5184/shard-apl6/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5184/shard-glk8/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-hsw7/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5184/shard-hsw1/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2055">i915#2055</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5184/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb6/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb=
1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb8/igt@perf@gen12-oa-tlb-invalidate.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tg=
lb8/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@perf@low-oa-exponent-permissions:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl1/igt@perf@low-oa-exponent-permissions.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-=
apl3/igt@perf@low-oa-exponent-permissions.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</=
a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb3/igt@perf@low-oa-exponent-permissions.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard=
-iclb3/igt@perf@low-oa-exponent-permissions.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl6/igt@perf@low-oa-exponent-permissions.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-=
kbl4/igt@perf@low-oa-exponent-permissions.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-hsw7/igt@perf@low-oa-exponent-permissions.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-=
hsw7/igt@perf@low-oa-exponent-permissions.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk1/igt@perf@low-oa-exponent-permissions.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-=
glk4/igt@perf@low-oa-exponent-permissions.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb7/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb5/ig=
t@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw2/igt@gem_eio@kms.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2244">i915#2244</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hs=
w7/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5184/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk6/igt@gem_exec_suspend@basic-s3.html">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk5/ig=
t@gem_exec_suspend@basic-s3.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl2/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/sha=
rd-kbl6/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2=
405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
84/shard-iclb3/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#24=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5184/shard-apl8/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#2199</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#24=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5184/shard-glk5/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-hsw1/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#26=
37</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_518=
4/shard-hsw1/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl1/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shar=
d-kbl6/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb1/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184=
/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-kbl1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i=
915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5184/shard-kbl3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-snb6/igt@kms_cursor_legacy@short-flip-after-cursor-atomi=
c-transitions.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5184/shard-snb7/igt@kms_cursor_legacy@short-flip-after-cu=
rsor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-un=
tiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5184/shard-apl8/igt@kms_draw_crc@draw-method-xr=
gb2101010-mmap-gtt-untiled.html">PASS</a> +5 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-un=
tiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5184/shard-glk2/igt@kms_draw_crc@draw-method-xrgb2101=
010-mmap-gtt-untiled.html">PASS</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw6/igt@kms_flip@dpms-off-confusion@a-vga1.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5184/shard-hsw2/igt@kms_flip@dpms-off-confusion@a-vga1.html">PASS</a> +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-badstride.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5184/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-badstride.html">=
PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-bl=
t.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5184/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb1010=
10-draw-blt.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl3/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5184/shard-kbl6/igt@kms_plane@plane-position-hole-dpms-pipe-b-pl=
anes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl3/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5184/shard-apl8/igt@kms_plane@plane-position-hole-dpms-pip=
e-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-tglb8/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb2/ig=
t@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk5/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-g=
lk7/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl8/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/s=
hard-apl4/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl1/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-k=
bl7/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb5/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-iclb7/ig=
t@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-hsw6/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hsw1/ig=
t@perf@oa-exponents.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb7/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/sh=
ard-tglb2/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp-stress.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i9=
15#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5184/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i9=
15#1226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5184/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-p=
ipe-b-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb1/igt@kms_plane@plane-panning-b=
ottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>=
)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl6/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/sh=
ard-kbl4/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk3/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/sh=
ard-glk4/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl2/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#=
1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
184/shard-apl3/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#16=
35</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb8/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/s=
hard-iclb3/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-hsw1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-hs=
w1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb4/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5184/shard-iclb6/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-ic=
lb4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl4/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-apl2/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/sha=
rd-apl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/86">i915#86</a> / <a href=3D"https://bugzilla.kernel.=
org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-glk8/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_518=
4/shard-glk6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <=
a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#20232=
1</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb2/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5184/shard-tglb3/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/shard-tglb1/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5855 -&gt; IGTPW_5184</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9350: 3161d1b26b7e1a7cb9146e3f8bd613f901ff5b38 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5184: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5184/index.htm=
l<br />
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freed<=
/p>

</body>
</html>

--===============5496935102443274410==--

--===============1151772919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1151772919==--
