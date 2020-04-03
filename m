Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 16:49:19 -0000
Message-ID: <158593255940.13350.14989172819528148955@emeril.freedesktop.org>
References: <20200402111049.12762-1-swati2.sharma@intel.com>
In-Reply-To: <20200402111049.12762-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=3A_add_test_to_validate_immutable_zpos_=28rev5=29?=
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_atomic: add test to validate immutable zpos (rev5)
URL   : https://patchwork.freedesktop.org/series/73956/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8237_full -> IGTPW_4396_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4396_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4396_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4396_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-tglb6/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-tglb8/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-kbl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-kbl6/igt@gem_tiled_swapping@non-threaded.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-kbl7/igt@gem_tiled_swapping@non-threaded.html

  * {igt@kms_atomic@plane_primary_overlay_mutable_zpos} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-iclb4/igt@kms_atomic@plane_primary_overlay_mutable_zpos.html
    - shard-tglb:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-tglb3/igt@kms_atomic@plane_primary_overlay_mutable_zpos.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8237_full and IGTPW_4396_full:

### New IGT tests (2) ###

  * igt@kms_atomic@plane_immutable_zpos:
    - Statuses : 7 pass(s)
    - Exec time: [0.15, 0.41] s

  * igt@kms_atomic@plane_primary_overlay_mutable_zpos:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4396_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_cs_tlb@vcs1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112080])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-iclb2/igt@gem_cs_tlb@vcs1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-iclb5/igt@gem_cs_tlb@vcs1.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#70] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-kbl6/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([IGT#5])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#61])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#407])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-glk1/igt@kms_flip@modeset-vs-vblank-race.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-glk6/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#699] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#247])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-kbl7/igt@kms_plane@plane-position-covered-pipe-b-planes.html
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#247])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-apl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-apl1/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][43] ([fdo#110854]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-tglb:         [FAIL][45] -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-tglb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-tglb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * {igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt}:
    - shard-snb:          [DMESG-WARN][47] ([i915#478]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html
    - shard-hsw:          [DMESG-WARN][49] ([i915#478]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [FAIL][51] ([i915#1516]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [SKIP][53] ([fdo#109271]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-hsw6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-hsw2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-tglb:         [SKIP][55] ([i915#1316] / [i915#579]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-tglb1/igt@i915_pm_rpm@pm-caching.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-tglb2/igt@i915_pm_rpm@pm-caching.html
    - shard-glk:          [SKIP][57] ([fdo#109271]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-glk2/igt@i915_pm_rpm@pm-caching.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-glk5/igt@i915_pm_rpm@pm-caching.html
    - shard-iclb:         [SKIP][59] ([i915#1316]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-iclb4/igt@i915_pm_rpm@pm-caching.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-iclb2/igt@i915_pm_rpm@pm-caching.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [FAIL][61] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled:
    - shard-glk:          [FAIL][65] ([i915#52] / [i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-glk:          [FAIL][67] ([i915#49]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][71] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][73] ([i915#1559] / [i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][77] ([i915#456] / [i915#460]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@prime_vgem@sync-bsd2:
    - shard-iclb:         [SKIP][79] ([fdo#109276]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-iclb7/igt@prime_vgem@sync-bsd2.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-iclb2/igt@prime_vgem@sync-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][81] ([i915#1316] / [i915#579]) -> [SKIP][82] ([fdo#111644] / [i915#1397])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-tglb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         [SKIP][83] ([i915#1316]) -> [SKIP][84] ([fdo#110892])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-iclb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-snb:          [INCOMPLETE][85] ([i915#82]) -> [SKIP][86] ([fdo#109271])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-snb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-snb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-snb:          [SKIP][87] ([fdo#109271]) -> [INCOMPLETE][88] ([i915#82])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-snb6/igt@i915_pm_rpm@system-suspend-modeset.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-snb4/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][89] ([fdo#108145] / [i915#265]) -> [FAIL][90] ([fdo#108145] / [i915#265] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8237/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1516]: https://gitlab.freedesktop.org/drm/intel/issues/1516
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5558 -> IGTPW_4396
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8237: a9a502feaca70cf6ae0259977095244a0a33c138 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4396: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/index.html
  IGT_5558: 3b55a816300d80bc5e0b995cd41ee8c8649a1ea2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4396/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
