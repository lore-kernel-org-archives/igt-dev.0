Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Jan 2020 23:54:04 -0000
Message-ID: <157844124416.8941.14581208065467226572@emeril.freedesktop.org>
References: <20200107151906.10098-1-ramalingam.c@intel.com>
In-Reply-To: <20200107151906.10098-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15/intel=5Fmemory=5Fregion=3A_wrappers_for_memory_regions_ops_?=
 =?utf-8?b?KHJldjIp?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/i915/intel_memory_region: wrappers for memory regions ops (rev2)
URL   : https://patchwork.freedesktop.org/series/71687/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7695_full -> IGTPW_3903_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/index.html

Known issues
------------

  Here are the changes found in IGTPW_3903_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +9 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb7/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#461])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb5/igt@gem_ctx_shared@q-smoketest-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_exec_nop@basic-series:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#435] / [i915#472])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb2/igt@gem_exec_nop@basic-series.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb6/igt@gem_exec_nop@basic-series.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +17 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#472]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb7/igt@gem_sync@basic-store-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb6/igt@gem_sync@basic-store-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#716])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-kbl4/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#46])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-glk1/igt@kms_flip@flip-vs-expired-vblank.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-iclb:         [PASS][23] -> [DMESG-WARN][24] ([fdo#111764])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#49]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([fdo#103665])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_blits@basic:
    - shard-kbl:          [DMESG-WARN][33] ([i915#836]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-kbl2/igt@gem_blits@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-kbl4/igt@gem_blits@basic.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][37] ([fdo#109276] / [fdo#112080]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb5/igt@gem_ctx_isolation@vcs1-clean.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-kbl:          [INCOMPLETE][39] ([fdo#103665]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-kbl4/igt@gem_ctx_isolation@vecs0-s3.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-kbl2/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_exec_balancer@smoke:
    - shard-tglb:         [INCOMPLETE][41] ([fdo#111593] / [i915#472]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb4/igt@gem_exec_balancer@smoke.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][43] ([fdo#108838] / [i915#435] / [i915#472]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb7/igt@gem_exec_create@forked.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb5/igt@gem_exec_create@forked.html

  * igt@gem_exec_parallel@basic:
    - shard-tglb:         [INCOMPLETE][45] ([i915#472] / [i915#476]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb3/igt@gem_exec_parallel@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb1/igt@gem_exec_parallel@basic.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][47] ([fdo#112080]) -> [PASS][48] +9 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_reuse@single:
    - shard-tglb:         [INCOMPLETE][49] ([i915#435] / [i915#472]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb6/igt@gem_exec_reuse@single.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb2/igt@gem_exec_reuse@single.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#112146]) -> [PASS][52] +8 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb7/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-render:
    - shard-tglb:         [INCOMPLETE][53] ([fdo#111677] / [i915#472]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb5/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-iclb:         [TIMEOUT][55] ([i915#530]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb6/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb8/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-tglb:         [INCOMPLETE][57] ([i915#470]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb9/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb2/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][59] ([i915#644]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][61] ([i915#454]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-apl6/igt@i915_suspend@fence-restore-untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-apl2/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][65] ([i915#72]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [FAIL][67] ([i915#49]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][69] ([fdo#109276]) -> [PASS][70] +15 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][71] ([fdo#109276] / [fdo#112080]) -> [FAIL][72] ([IGT#28]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][73] ([i915#82]) -> [DMESG-WARN][74] ([i915#444])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-snb4/igt@gem_eio@kms.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-snb5/igt@gem_eio@kms.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][75] ([i915#818]) -> [FAIL][76] ([i915#694])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-hsw7/igt@gem_tiled_blits@normal.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-hsw8/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][77] ([fdo#111870]) -> [DMESG-WARN][78] ([fdo#110789] / [fdo#111870])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking:
    - shard-tglb:         [SKIP][79] ([fdo#112016] / [fdo#112021]) -> [SKIP][80] ([fdo#112021])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-tglb5/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][81] ([fdo#111093]) -> [FAIL][82] ([fdo#110275] / [fdo#111093])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/shard-iclb6/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/shard-iclb2/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110275]: https://bugs.freedesktop.org/show_bug.cgi?id=110275
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#836]: https://gitlab.freedesktop.org/drm/intel/issues/836


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3903
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7695: 8df346a062d56d97ab53555d3f5829c26f950233 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3903: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
