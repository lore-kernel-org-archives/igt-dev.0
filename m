Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 22 Dec 2019 11:48:09 -0000
Message-ID: <157701528900.8700.6684346051008081007@emeril.freedesktop.org>
References: <20191220144852.14098-1-imre.deak@intel.com>
In-Reply-To: <20191220144852.14098-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_Disable_GEN12_media_compression_YUV_tests?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_plane: Disable GEN12 media compression YUV tests
URL   : https://patchwork.freedesktop.org/series/71214/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7614_full -> IGTPW_3881_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3881_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3881_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3881_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-hsw7/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-snb:          [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb2/igt@i915_pm_rps@reset.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb5/igt@i915_pm_rps@reset.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][6], [FAIL][7]) ([i915#716]) -> [FAIL][8]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-apl4/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-apl8/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-apl6/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_3881_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb5/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#679])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-glk1/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-glk1/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd1:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +10 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd1.html

  * igt@gem_eio@suspend:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#460])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-tglb3/igt@gem_eio@suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-tglb7/igt@gem_eio@suspend.html

  * igt@gem_exec_nop@basic-series:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#435]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-tglb1/igt@gem_exec_nop@basic-series.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-tglb6/igt@gem_exec_nop@basic-series.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#112146]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd2:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([fdo#111677])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-tglb9/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-tglb6/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#112080]) +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb2/igt@gem_exec_store@cachelines-vcs1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb5/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#520])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_sync@basic-each:
    - shard-tglb:         [PASS][29] -> [INCOMPLETE][30] ([i915#472] / [i915#707])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-tglb4/igt@gem_sync@basic-each.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-tglb4/igt@gem_sync@basic-each.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][31] -> [DMESG-WARN][32] ([fdo#111870]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([fdo#111764])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb2/igt@i915_pm_rpm@system-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb2/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#123] / [i915#140])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_plane@pixel-format-pipe-c-planes:
    - shard-iclb:         [PASS][39] -> [INCOMPLETE][40] ([i915#140] / [i915#246])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb8/igt@kms_plane@pixel-format-pipe-c-planes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb5/igt@kms_plane@pixel-format-pipe-c-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-tglb:         [PASS][41] -> [INCOMPLETE][42] ([i915#456] / [i915#460]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-tglb9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][45] ([fdo#109276] / [fdo#112080]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +14 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb6/igt@gem_exec_schedule@promotion-bsd1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb4/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_schedule@wide-render:
    - shard-kbl:          [INCOMPLETE][51] ([fdo#103665]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-kbl7/igt@gem_exec_schedule@wide-render.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-kbl3/igt@gem_exec_schedule@wide-render.html

  * igt@gem_persistent_relocs@interruptible:
    - shard-snb:          [DMESG-WARN][53] ([i915#478]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-snb4/igt@gem_persistent_relocs@interruptible.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-snb5/igt@gem_persistent_relocs@interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][55] ([fdo#111870]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * {igt@gen9_exec_parse@allowed-all}:
    - shard-glk:          [DMESG-WARN][57] ([i915#716]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * {igt@gen9_exec_parse@allowed-single}:
    - shard-apl:          [DMESG-WARN][59] ([i915#716]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-apl8/igt@gen9_exec_parse@allowed-single.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-apl8/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][61] ([i915#454]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-apl:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][65] ([i915#456] / [i915#460]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled:
    - shard-tglb:         [INCOMPLETE][67] ([i915#435] / [i915#667]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-apl8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         [FAIL][71] ([i915#49]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-apl:          [FAIL][73] ([i915#49]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-x:
    - shard-snb:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-snb2/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-snb4/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +7 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][81] ([i915#460]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [PASS][84] +7 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb5/igt@perf_pmu@init-busy-vcs1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][85] ([IGT#28]) -> [SKIP][86] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [INCOMPLETE][87] ([i915#61]) -> [FAIL][88] ([i915#832])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-hsw4/igt@gem_tiled_blits@interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-snb:          [INCOMPLETE][89] ([i915#82]) -> [SKIP][90] ([fdo#109271])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-snb5/igt@i915_pm_dc@dc5-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-snb4/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_selftest@mock_requests:
    - shard-kbl:          [DMESG-WARN][91] -> [INCOMPLETE][92] ([fdo#103665])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-kbl3/igt@i915_selftest@mock_requests.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-kbl6/igt@i915_selftest@mock_requests.html
    - shard-iclb:         [DMESG-WARN][93] -> [INCOMPLETE][94] ([i915#140])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb6/igt@i915_selftest@mock_requests.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb6/igt@i915_selftest@mock_requests.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][95] ([fdo#111093]) -> ([FAIL][96], [FAIL][97]) ([fdo#108654] / [fdo#111093])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7614/shard-iclb6/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb2/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/shard-iclb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108654]: https://bugs.freedesktop.org/show_bug.cgi?id=108654
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#246]: https://gitlab.freedesktop.org/drm/intel/issues/246
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#832]: https://gitlab.freedesktop.org/drm/intel/issues/832


Participating hosts (9 -> 8)
------------------------------

  Missing    (1): pig-skl-6260u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5351 -> IGTPW_3881
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7614: edcf3d79c200934a49a962bebc4d19f8a4849540 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3881: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/index.html
  IGT_5351: e7fdcef72d1d6b3bb9f3003bbc37571959e6e8bb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3881/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
