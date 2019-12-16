Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Dec 2019 16:44:12 -0000
Message-ID: <157651465217.5614.5096227003314482874@emeril.freedesktop.org>
References: <20191216120923.2376-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20191216120923.2376-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWxf?=
 =?utf-8?q?gpu=5Ftop_per_client_engine_busyness?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: intel_gpu_top per client engine busyness
URL   : https://patchwork.freedesktop.org/series/70980/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7573_full -> IGTPW_3865_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3865_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3865_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3865_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  
Known issues
------------

  Here are the changes found in IGTPW_3865_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#109276] / [fdo#112080])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [PASS][4] -> [INCOMPLETE][5] ([i915#456] / [i915#460] / [i915#534])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb1/igt@gem_eio@in-flight-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-tglb5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_parallel@vcs1-contexts:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7] ([i915#435])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb3/igt@gem_exec_parallel@vcs1-contexts.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-tglb4/igt@gem_exec_parallel@vcs1-contexts.html

  * igt@gem_exec_schedule@preempt-hang-bsd1:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb1/igt@gem_exec_schedule@preempt-hang-bsd1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-iclb3/igt@gem_exec_schedule@preempt-hang-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb5/igt@gem_exec_schedule@wide-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_mmap_gtt@hang:
    - shard-snb:          [PASS][12] -> [INCOMPLETE][13] ([i915#82])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-snb7/igt@gem_mmap_gtt@hang.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-snb7/igt@gem_mmap_gtt@hang.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [PASS][14] -> [FAIL][15] ([i915#520])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-hsw6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#644])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#644])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-many-each:
    - shard-tglb:         [PASS][20] -> [INCOMPLETE][21] ([i915#472] / [i915#707])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb8/igt@gem_sync@basic-many-each.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-tglb8/igt@gem_sync@basic-many-each.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][22] -> [DMESG-WARN][23] ([fdo#111870]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl1/igt@i915_suspend@forcewake.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-apl4/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#54])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#79])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [PASS][30] -> [INCOMPLETE][31] ([i915#61])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-hsw5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#49])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109642] / [fdo#111068])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109441])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-iclb3/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#31])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl4/igt@kms_setmode@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-apl8/igt@kms_setmode@basic.html
    - shard-hsw:          [PASS][42] -> [FAIL][43] ([i915#31])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-hsw5/igt@kms_setmode@basic.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-hsw1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [PASS][44] -> [INCOMPLETE][45] ([i915#456] / [i915#460]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-tglb4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#112080]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-iclb3/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [DMESG-WARN][48] ([i915#180]) -> [PASS][49] +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-apl8/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [FAIL][50] ([i915#232]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-snb7/igt@gem_eio@reset-stress.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-snb4/igt@gem_eio@reset-stress.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-tglb:         [INCOMPLETE][52] ([i915#435]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb4/igt@gem_exec_nop@basic-parallel.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-tglb1/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][54] ([fdo#112146]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * {igt@gem_exec_schedule@pi-shared-iova-bsd2}:
    - shard-iclb:         [SKIP][56] ([fdo#109276]) -> [PASS][57] +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-kbl:          [FAIL][58] ([i915#520]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-kbl4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][60] ([i915#644]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][62] ([fdo#111870]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-snb7/igt@gem_userptr_blits@sync-unmap.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * {igt@gen9_exec_parse@allowed-single}:
    - shard-apl:          [DMESG-WARN][64] ([i915#716]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-apl7/igt@gen9_exec_parse@allowed-single.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [INCOMPLETE][66] ([i915#435] / [i915#456] / [i915#460]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [INCOMPLETE][68] ([i915#474] / [i915#667]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-glk:          [FAIL][70] ([i915#49]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-iclb:         [INCOMPLETE][72] ([i915#123] / [i915#140]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [INCOMPLETE][74] ([i915#456] / [i915#460] / [i915#474]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77] +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-hsw:          [DMESG-FAIL][78] ([fdo#103166] / [i915#44]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-hsw5/igt@kms_plane_lowres@pipe-b-tiling-none.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-hsw7/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [DMESG-WARN][80] ([i915#402]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb8/igt@kms_psr@psr2_suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-tglb1/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][82] ([i915#31]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-glk1/igt@kms_setmode@basic.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-glk3/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-wait-busy-hang:
    - shard-snb:          [INCOMPLETE][84] ([i915#82]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-snb1/igt@kms_vblank@pipe-a-wait-busy-hang.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-snb6/igt@kms_vblank@pipe-a-wait-busy-hang.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][86] ([fdo#112080]) -> [PASS][87] +5 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Warnings ####

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][88] ([i915#180]) -> [DMESG-FAIL][89] ([i915#180] / [i915#54])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103166]: https://bugs.freedesktop.org/show_bug.cgi?id=103166
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#534]: https://gitlab.freedesktop.org/drm/intel/issues/534
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5349 -> IGTPW_3865
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7573: 5f2c1ea1bfb34f9777b829eec98a974edd82b885 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3865: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/index.html
  IGT_5349: 048f58513d8b8ec6bb307a939f0ac959bc0f0e10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3865/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
