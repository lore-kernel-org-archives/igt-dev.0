Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Nov 2020 07:15:34 -0000
Message-ID: <160516533466.29796.14866607907337572978@emeril.freedesktop.org>
References: <20201112044920.28130-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20201112044920.28130-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Frender=5Flinear=5Fblits=3A_Add_test_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1541497012=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1541497012==
Content-Type: multipart/alternative;
 boundary="===============2440603440392864126=="

--===============2440603440392864126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_render_linear_blits: Add test description
URL   : https://patchwork.freedesktop.org/series/83748/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9312_full -> IGTPW_5156_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5156_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5156_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5156_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk1/igt@gem_exec_flush@basic-uc-prw-default.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk2/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-snb:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-snb7/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-snb:          [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb2/igt@kms_frontbuffer_tracking@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-snb7/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][6], [FAIL][7], [FAIL][8]) ([i915#1814] / [i915#2439] / [i915#483]) -> ([FAIL][9], [FAIL][10]) ([i915#2439])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb6/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb3/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb2/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb2/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb2/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9312_full and IGTPW_5156_full:

### New IGT tests (1) ###

  * igt@sysfs_defaults@readonly:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5156_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_read@empty-nonblock:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk3/igt@drm_read@empty-nonblock.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk1/igt@drm_read@empty-nonblock.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#2389])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#2261])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw6/igt@gem_partial_pwrite_pread@reads-display.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw1/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-hsw:          [PASS][17] -> [INCOMPLETE][18] ([i915#2055] / [i915#2637])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb5/igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-tglb6/igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-iclb:         [PASS][21] -> [INCOMPLETE][22] ([i915#1185])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb2/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-apl:          [PASS][23] -> [INCOMPLETE][24] ([i915#1635] / [i915#2635])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-glk:          [PASS][25] -> [INCOMPLETE][26] ([i915#2635])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk7/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#155])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-vga1:
    - shard-hsw:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-vga1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-snb:          [PASS][31] -> [FAIL][32] ([i915#2546])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1635] / [i915#1982]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html

  * igt@kms_vblank@pipe-c-wait-busy:
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb1/igt@kms_vblank@pipe-c-wait-busy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb7/igt@kms_vblank@pipe-c-wait-busy.html
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl2/igt@kms_vblank@pipe-c-wait-busy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl3/igt@kms_vblank@pipe-c-wait-busy.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          [DMESG-WARN][41] ([i915#2635]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk4/igt@gem_eio@in-flight-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_create@basic:
    - shard-snb:          [FAIL][43] ([i915#1037]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb7/igt@gem_exec_create@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-snb7/igt@gem_exec_create@basic.html

  * igt@gem_exec_create@forked:
    - shard-hsw:          [FAIL][45] -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@gem_exec_create@forked.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw4/igt@gem_exec_create@forked.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-hsw:          [FAIL][47] ([i915#1888]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw8/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][49] ([i915#2521]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-tglb7/igt@kms_async_flips@alternate-sync-async-flip.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][51] ([i915#2521]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk7/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +7 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - shard-apl:          [DMESG-WARN][55] ([i915#1635] / [i915#1982]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl2/igt@kms_flip@basic-plain-flip@a-dp1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl2/igt@kms_flip@basic-plain-flip@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-kbl:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-snb:          [FAIL][59] ([i915#2546]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][61] ([i915#1982]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_plane@plane-position-hole-pipe-a-planes:
    - shard-apl:          [FAIL][63] ([i915#1635] / [i915#2472]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl6/igt@kms_plane@plane-position-hole-pipe-a-planes.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl8/igt@kms_plane@plane-position-hole-pipe-a-planes.html
    - shard-kbl:          [FAIL][65] ([i915#2472]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl7/igt@kms_plane@plane-position-hole-pipe-a-planes.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl2/igt@kms_plane@plane-position-hole-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_vblank@pipe-c-query-forked-busy:
    - shard-hsw:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw4/igt@kms_vblank@pipe-c-query-forked-busy.html
    - shard-iclb:         [DMESG-WARN][71] ([i915#1982]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb7/igt@kms_vblank@pipe-c-query-forked-busy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb2/igt@kms_vblank@pipe-c-query-forked-busy.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][73] ([i915#1185]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-kbl:          [INCOMPLETE][75] ([i915#155]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-hsw:          [INCOMPLETE][77] ([i915#2637]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-glk:          [INCOMPLETE][79] ([i915#2635]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-apl:          [INCOMPLETE][81] ([i915#1635] / [i915#2635]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][83] ([i915#1354]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb7/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-tglb2/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@invalid-oa-exponent:
    - shard-hsw:          [SKIP][85] ([fdo#109271]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@perf@invalid-oa-exponent.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw4/igt@perf@invalid-oa-exponent.html
    - shard-iclb:         [SKIP][87] ([i915#1354]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb8/igt@perf@invalid-oa-exponent.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb7/igt@perf@invalid-oa-exponent.html

  * igt@perf@non-system-wide-paranoid:
    - shard-apl:          [SKIP][89] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@perf@non-system-wide-paranoid.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl3/igt@perf@non-system-wide-paranoid.html
    - shard-glk:          [SKIP][91] ([fdo#109271] / [i915#1354]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@perf@non-system-wide-paranoid.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk5/igt@perf@non-system-wide-paranoid.html
    - shard-kbl:          [SKIP][93] ([fdo#109271] / [i915#1354]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl6/igt@perf@non-system-wide-paranoid.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl1/igt@perf@non-system-wide-paranoid.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [INCOMPLETE][95] ([i915#1436] / [i915#456]) -> [DMESG-WARN][96] ([i915#2411]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb7/igt@gem_eio@in-flight-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-tglb6/igt@gem_eio@in-flight-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][97] ([i915#1515]) -> [FAIL][98] ([i915#1515])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-tglb:         [DMESG-WARN][99] ([i915#2411]) -> [DMESG-WARN][100] ([i915#1982] / [i915#2411])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb2/igt@i915_pm_rpm@dpms-lpsp.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-tglb7/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [DMESG-WARN][101] ([i915#2411]) -> [INCOMPLETE][102] ([i915#1436] / [i915#456])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][103] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [SKIP][104] ([fdo#109271] / [i915#1635])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl7/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-glk:          [SKIP][105] ([fdo#109271] / [i915#1354]) -> [SKIP][106] ([fdo#109271])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk5/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-iclb:         [SKIP][107] ([i915#1354]) -> [SKIP][108] ([fdo#109289])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb5/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-kbl:          [SKIP][109] ([fdo#109271] / [i915#1354]) -> [SKIP][110] ([fdo#109271])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl6/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl6/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][111], [FAIL][112]) ([i915#1436] / [i915#2439] / [i915#483]) -> [FAIL][113] ([i915#2439])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw4/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][114], [FAIL][115]) ([i915#1436] / [i915#1611] / [i915#1814] / [i915#2439] / [i915#483]) -> [FAIL][116] ([i915#1611] / [i915#2439] / [i915#483])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl3/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][117], [FAIL][118], [FAIL][119]) ([i915#1610] / [i915#1611] / [i915#1635] / [i915#1814] / [i915#2439]) -> ([FAIL][120], [FAIL][121]) ([i915#1611] / [i915#1635] / [i915#2439])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl3/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl3/igt@runner@aborted.html
    - shard-glk:          ([FAIL][122], [FAIL][123], [FAIL][124]) ([i915#1611] / [i915#1814] / [i915#2439] / [k.org#202321]) -> ([FAIL][125], [FAIL][126]) ([i915#1611] / [i915#2439] / [i915#483] / [k.org#202321])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk4/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk6/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk7/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2261]: https://gitlab.freedesktop.org/drm/intel/issues/2261
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2472]: https://gitlab.freedesktop.org/drm/intel/issues/2472
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5847 -> IGTPW_5156
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9312: 88b74d59a27aa168f7cd2dec199c33ee71fe8bb0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5156: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/index.html
  IGT_5847: 8cffaebec5228a5042cc6928ac582a0589e2de3e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/index.html

--===============2440603440392864126==
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
<tr><td><b>Series:</b></td><td>i915/gem_render_linear_blits: Add test descr=
iption</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83748/">https://patchwork.freedesktop.org/series/83748/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5156/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5156/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9312_full -&gt; IGTPW_5156_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5156_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5156_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5156=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk1/igt@gem_exec_flush@basic-uc-prw-default.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/sh=
ard-glk2/igt@gem_exec_flush@basic-uc-prw-default.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5156/shard-snb7/igt@gem_exec_reloc@basic-concurrent0.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-s=
nb7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_9312/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb3/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_9312/shard-iclb2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-=
iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5156/shard-iclb2/igt@runner@aborted.html">FAIL</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#243=
9</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9312_full and IGTPW_5156_f=
ull:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@sysfs_defaults@readonly:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5156_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_read@empty-nonblock:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk3/igt@drm_read@empty-nonblock.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk1/igt=
@drm_read@empty-nonblock.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/=
shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw6/igt@gem_partial_pwrite_pread@reads-display.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156=
/shard-hsw1/igt@gem_partial_pwrite_pread@reads-display.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2261">i915#2261</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw4/igt@i915_suspend@fence-restore-tiled2untiled.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
56/shard-hsw4/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915=
#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637=
">i915#2637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb5/igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5156/shard-tglb6/igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb2/=
igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl3/ig=
t@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk7/ig=
t@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl6/ig=
t@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-vg=
a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5156/shard-hsw1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-vga=
1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mma=
p-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5156/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mm=
ap-wc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-=
iclb3/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl6/igt@kms_universal_plane@universal-plane-gen9-featur=
es-pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5156/shard-apl6/igt@kms_universal_plane@universal-plane-gen9-=
features-pipe-b.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-busy:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb1/igt@kms_vblank@pipe-c-wait-busy.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-iclb=
7/igt@kms_vblank@pipe-c-wait-busy.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl2/igt@kms_vblank@pipe-c-wait-busy.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl3/=
igt@kms_vblank@pipe-c-wait-busy.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk4/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/=
shard-glk6/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb7/igt@gem_exec_create@basic.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-sn=
b7/igt@gem_exec_create@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw8/igt@gem_exec_create@forked.html">FAIL</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-hsw4/igt@=
gem_exec_create@forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw8/igt@gem_userptr_blits@unsync-unmap-cycles.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i91=
5#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5156/shard-hsw8/igt@gem_userptr_blits@unsync-unmap-cycles.html">PASS</a> +=
1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2521=
">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5156/shard-tglb7/igt@kms_async_flips@alternate-sync-async-flip.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk1/igt@kms_async_flips@async-flip-with-page-flip-event=
s.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5156/shard-glk7/igt@kms_async_flips@async-flip-with-page-flip-e=
vents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5156/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-64x64-right-e=
dge.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl2/igt@kms_flip@basic-plain-flip@a-dp1.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/198=
2">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5156/shard-apl2/igt@kms_flip@basic-plain-flip@a-dp1.html">PASS</a> +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-in=
dfb-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl4/igt@kms_frontbuffer_trackin=
g@fbc-1p-offscren-pri-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-c=
pu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5156/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-m=
map-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5156/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.=
html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-pipe-a-planes:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl6/igt@kms_plane@plane-position-hole-pipe-a-planes.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635=
">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5156/shard-apl8/igt@kms_plane@plane-position-hole-pipe-a-planes=
.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl7/igt@kms_plane@plane-position-hole-pipe-a-planes.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2472=
">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5156/shard-kbl2/igt@kms_plane@plane-position-hole-pipe-a-planes.html"=
>PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
56/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a> +1 simila=
r issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-busy:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5156/shard-hsw4/igt@kms_vblank@pipe-c-query-forked-busy.html">PASS</a> =
+2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb7/igt@kms_vblank@pipe-c-query-forked-busy.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982"=
>i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5156/shard-iclb2/igt@kms_vblank@pipe-c-query-forked-busy.html">PASS</a=
> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5156/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-dpms=
-suspend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5156/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-sus=
pend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5156/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-dpms-s=
uspend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5156/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-dpms-s=
uspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5156/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-=
dpms-suspend.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb7/igt@perf@gen12-unprivileged-single-ctx-counters.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
54">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5156/shard-tglb2/igt@perf@gen12-unprivileged-single-ctx-counters.ht=
ml">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-exponent:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw8/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-=
hsw4/igt@perf@invalid-oa-exponent.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb8/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-i=
clb7/igt@perf@invalid-oa-exponent.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl8/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915=
#1354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635=
">i915#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5156/shard-apl3/igt@perf@non-system-wide-paranoid.html">PASS</a> +1 s=
imilar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk8/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915=
#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5156/shard-glk5/igt@perf@non-system-wide-paranoid.html">PASS</a> +1 similar=
 issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl6/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915=
#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5156/shard-kbl1/igt@perf@non-system-wide-paranoid.html">PASS</a> +1 similar=
 issue</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#143=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i91=
5#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5156/shard-tglb6/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/=
shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb2/igt@i915_pm_rpm@dpms-lpsp.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/sha=
rd-tglb7/igt@i915_pm_rpm@dpms-lpsp.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#241=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156=
/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</=
li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl8/igt@perf@gen12-unprivileged-single-ctx-counters.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1635">i915#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5156/shard-apl7/igt@perf@gen12-unprivileged-single-ctx-=
counters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk8/igt@perf@gen12-unprivileged-single-ctx-counters.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5156/shard-glk5/igt@perf@gen12-unprivileged-single-ctx-counte=
rs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb8/igt@perf@gen12-unprivileged-single-ctx-counters.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/135=
4">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5156/shard-iclb5/igt@perf@gen12-unprivileged-single-ctx-counters.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
89">fdo#109289</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl6/igt@perf@gen12-unprivileged-single-ctx-counters.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5156/shard-kbl6/igt@perf@gen12-unprivileged-single-ctx-counte=
rs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5156/shard-hsw4/igt@runner@aborted.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439<=
/a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-kbl3/igt@runner@aborted.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611=
">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9312/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#=
2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5156/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/shard-apl3/igt@runner@aborted.html">=
FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611"=
>i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9312/shard-glk6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <=
a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#20232=
1</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_515=
6/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5156/shard-glk7/igt@runner@aborted.html">FAI=
L</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i9=
15#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/24=
39">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/483">i915#483</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi=
?id=3D202321">k.org#202321</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5847 -&gt; IGTPW_5156</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9312: 88b74d59a27aa168f7cd2dec199c33ee71fe8bb0 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5156: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5156/index.htm=
l<br />
  IGT_5847: 8cffaebec5228a5042cc6928ac582a0589e2de3e @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2440603440392864126==--

--===============1541497012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1541497012==--
