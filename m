Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1687638332074165247=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/xe=5Fmmap=3A_sa?=
 =?utf-8?q?nity_check_partial_munmap?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 08 Dec 2023 06:30:04 -0000
Message-ID: <170201700484.7327.15088315862752881932@emeril.freedesktop.org>
References: <20231207152546.360422-1-matthew.auld@intel.com>
In-Reply-To: <20231207152546.360422-1-matthew.auld@intel.com>
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

--===============1687638332074165247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_mmap: sanity check partial munmap
URL   : https://patchwork.freedesktop.org/series/127503/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13995_full -> IGTPW_10368_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10368_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10368_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10368_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_gttfill@all-engines:
    - shard-snb:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb1/igt@gem_exec_gttfill@all-engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb4/igt@gem_exec_gttfill@all-engines.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rps@reset:
    - shard-tglu:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-2/igt@i915_pm_rps@reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@i915_pm_rps@reset.html

  * igt@kms_sequence@get-forked@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-3/igt@kms_sequence@get-forked@pipe-b-hdmi-a-2.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          [SKIP][8] ([fdo#109271]) -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb6/igt@kms_content_protection@atomic-dpms.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb7/igt@kms_content_protection@atomic-dpms.html

  
Known issues
------------

  Here are the changes found in IGTPW_10368_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8411])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][11] ([i915#9618])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414]) +20 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8414]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@fbdev@pan:
    - shard-snb:          [PASS][14] -> [FAIL][15] ([i915#4435])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb5/igt@fbdev@pan.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb7/igt@fbdev@pan.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#4873])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-6/igt@gem_caching@writes.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#7697])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_compute@compute-square:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#9310])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@gem_compute@compute-square.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#280]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [PASS][25] -> [ABORT][26] ([i915#7975] / [i915#8213])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-11/igt@gem_eio@hibernate.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          [PASS][27] -> [FAIL][28] ([i915#5784])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-5/igt@gem_eio@kms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4812])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#4771])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-6/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_fair@basic-flow:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#4473] / [i915#4771])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@gem_exec_fair@basic-flow.html

  * igt@gem_exec_fair@basic-none-share:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_exec_fair@basic-none-share.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][33] ([i915#2842])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [PASS][34] -> [FAIL][35] ([i915#2842]) +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][36] ([i915#2842]) +2 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglu:         [PASS][37] -> [FAIL][38] ([i915#2842])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3539])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fence@submit:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4812])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@gem_exec_fence@submit.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#7697])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#5107])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-3/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3281]) +9 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#3281]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4537] / [i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4537] / [i915#4812])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4860]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-x.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4860])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4613])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#4613]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#284])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@gem_media_vme.html
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#284])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4077]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-5/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4077]) +10 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4077])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-15/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4083]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4083]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@gem_mmap_wc@read-write.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3282]) +8 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pread@display:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3282]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@gem_pread@display.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4270])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4270]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4270]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4270])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#8428]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#5190]) +15 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4079]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4079]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-6/igt@gem_tiled_pread_basic.html
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3282])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3297])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297] / [i915#4880])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3297] / [i915#4880])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@mmap-offset-banned@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3297]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@gem_userptr_blits@mmap-offset-banned@gtt.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3297] / [i915#4958])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3297]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap.html
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#3297])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap.html
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#3297])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-tglu:         NOTRUN -> [FAIL][77] ([i915#3318])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@gem_userptr_blits@vma-merge.html
    - shard-dg2:          NOTRUN -> [FAIL][78] ([i915#3318])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([fdo#109289]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@gen7_exec_parse@basic-allowed.html
    - shard-dg1:          NOTRUN -> [SKIP][80] ([fdo#109289])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-18/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([fdo#109289]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gen7_exec_parse@bitmasks.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([fdo#109289]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-5/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#2856])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#2527] / [i915#2856]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#2856]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#2527])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][87] -> [ABORT][88] ([i915#9697])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#8399])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [PASS][90] -> [FAIL][91] ([i915#3591])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#8431])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#6621]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#6621])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][95] -> [SKIP][96] ([i915#7984])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-6/igt@i915_power@sanity.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@i915_power@sanity.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#6188])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][98] ([i915#7443])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#3826])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#8709]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#8709]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][102] ([i915#8247]) +3 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_async_flips@crc@pipe-c-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#5286]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#5286])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([fdo#111615] / [i915#5286]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([fdo#111614]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-tglu:         NOTRUN -> [SKIP][107] ([fdo#111614]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [PASS][108] -> [FAIL][109] ([i915#3743])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([fdo#111615]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4538] / [i915#5190]) +10 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([fdo#111615]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4538])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#5354] / [i915#6095]) +33 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-9/igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#5354] / [i915#6095]) +6 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf-tiled-ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#5354] / [i915#6095]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-13/igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#5354]) +100 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#5354] / [i915#6095]) +25 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_ccs@pipe-d-bad-rotation-90-yf-tiled-ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#5354]) +8 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-3/igt@kms_ccs@pipe-d-crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][120] ([fdo#109271]) +50 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk9/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4087] / [i915#7213]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([fdo#111827]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([fdo#111827])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-17/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([fdo#111827]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#7828]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-6/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#7828])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-18/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#7828]) +9 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#7828]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#3555])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-19/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#7116])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#3116] / [i915#3299])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#6944] / [i915#7116] / [i915#7118]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#6944])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#9424])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#7118]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#3359]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#3359])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#3359])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#3555] / [i915#8814]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#3359])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3555]) +7 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([fdo#109274] / [i915#5354]) +11 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([fdo#111825]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([fdo#109274]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-snb:          [PASS][145] -> [SKIP][146] ([fdo#109271] / [fdo#111767])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][147] -> [FAIL][148] ([i915#2346])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - shard-mtlp:         [PASS][149] -> [DMESG-WARN][150] ([i915#2017])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-2/igt@kms_cursor_legacy@single-move@all-pipes.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#9723])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#9227])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#1257])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#3555] / [i915#3840]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-7/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3555] / [i915#3840])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#3840] / [i915#9688])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3955])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#3469])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#4854])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#658])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_fence_pin_leak:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#4881])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([fdo#109274] / [fdo#111767])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#8381])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#3637]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([fdo#109274]) +10 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([fdo#109274] / [i915#3637]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#2587] / [i915#2672]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#2672]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#2672] / [i915#3555])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#2672]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#2672] / [i915#3555])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([fdo#109285])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#8708]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#8708]) +19 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-snb:          [PASS][175] -> [SKIP][176] ([fdo#109271]) +10 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3458]) +23 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3023]) +6 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3458]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#8708])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([fdo#111825] / [i915#1825]) +8 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([fdo#109280]) +27 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([fdo#111825])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#5460])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#9766])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#9766])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#9653])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([fdo#110189]) +17 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#1825]) +19 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#3555] / [i915#8228])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-12/igt@kms_hdr@bpc-switch.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3555] / [i915#8228])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#8228]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_hdr@static-swap.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#6301])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3555] / [i915#8821])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#9423]) +11 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#9423]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#9423]) +15 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#5176] / [i915#9423]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#5235]) +7 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#5235]) +6 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3555] / [i915#5235])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#5235]) +19 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#5235]) +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#5235]) +7 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-3.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#9812])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][206] -> [FAIL][207] ([i915#9295])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#9685])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#4281])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#9340])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][211] -> [SKIP][212] ([i915#9519])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#9519])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#9519])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][215] -> [SKIP][216] ([i915#9519]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([fdo#109293] / [fdo#109506])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-2/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([fdo#109293] / [fdo#109506])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#6524])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#6524] / [i915#6805]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#9683]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#9683]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][223] ([fdo#109642] / [fdo#111068] / [i915#9683])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#4235])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#4235] / [i915#5190])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#4235]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#3555]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-snb:          NOTRUN -> [SKIP][228] ([fdo#109271])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#8623])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#8623])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([fdo#109309])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_tv_load_detect@load-detect.html
    - shard-dg2:          NOTRUN -> [SKIP][232] ([fdo#109309])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][233] -> [FAIL][234] ([i915#9196]) +1 other test fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#3555])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@kms_vrr@negative-basic.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#7387])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@perf@global-sseu-config-invalid.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#2433])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][238] -> [FAIL][239] ([i915#4349]) +2 other tests fail
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-1/igt@perf_pmu@busy-double-start@rcs0.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([fdo#112283])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#3708])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#3291] / [i915#3708])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#3708])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-6/igt@prime_vgem@fence-flip-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#4818])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_perfmon@destroy-valid-perfmon:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([fdo#109315] / [i915#2575]) +8 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@v3d/v3d_perfmon@destroy-valid-perfmon.html

  * igt@v3d/v3d_submit_cl@bad-multisync-pad:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#2575]) +6 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-3/igt@v3d/v3d_submit_cl@bad-multisync-pad.html

  * igt@v3d/v3d_submit_cl@bad-perfmon:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([fdo#109315]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@v3d/v3d_submit_cl@bad-perfmon.html

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#2575]) +10 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@v3d/v3d_submit_csd@single-out-sync.html

  * igt@v3d/v3d_wait_bo@map-bo-0ns:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#2575])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@v3d/v3d_wait_bo@map-bo-0ns.html

  * igt@vc4/vc4_perfmon@create-perfmon-0:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#2575]) +5 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@vc4/vc4_perfmon@create-perfmon-0.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#7711]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html

  * igt@vc4/vc4_tiling@set-bad-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#7711]) +9 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@vc4/vc4_tiling@set-bad-modifier.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][253] ([i915#7742]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_barrier_race@remote-request@rcs0:
    - shard-glk:          [ABORT][255] ([i915#8190]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-glk9/igt@gem_barrier_race@remote-request@rcs0.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk7/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][257] ([i915#7297]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][259] ([i915#6268]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-3/igt@gem_ctx_exec@basic-nohangcheck.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][261] ([i915#2842]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglu:         [FAIL][263] ([i915#2842]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-3/igt@gem_exec_fair@basic-pace@rcs0.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [FAIL][265] ([i915#2842]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][267] -> [PASS][268] +1 other test pass
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-10/igt@gem_exec_suspend@basic-s0@smem.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_mmap_offset@clear@smem0:
    - shard-mtlp:         [ABORT][269] -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-2/igt@gem_mmap_offset@clear@smem0.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-5/igt@gem_mmap_offset@clear@smem0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          [FAIL][271] ([i915#3591]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rps@thresholds-idle-park@gt0:
    - shard-tglu:         [INCOMPLETE][273] -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-4/igt@i915_pm_rps@thresholds-idle-park@gt0.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-9/igt@i915_pm_rps@thresholds-idle-park@gt0.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [FAIL][275] ([fdo#103375]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         [FAIL][277] ([i915#3743]) -> [PASS][278] +1 other test pass
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][279] ([fdo#109271]) -> [PASS][280] +13 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][281] ([i915#9519]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][283] ([i915#9519]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-tglu:         [FAIL][285] ([i915#9196]) -> [PASS][286] +1 other test pass
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-tglu:         [FAIL][287] ([i915#2842]) -> [FAIL][288] ([i915#2876])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-3/igt@gem_exec_fair@basic-pace@vcs0.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [INCOMPLETE][289] -> [INCOMPLETE][290] ([i915#9820])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu:         [WARN][291] ([i915#2681]) -> [FAIL][292] ([i915#2681] / [i915#3591])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][293] ([i915#9424]) -> [SKIP][294] ([i915#8063])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-5/igt@kms_content_protection@mei-interface.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          [SKIP][295] ([i915#9424]) -> [SKIP][296] ([i915#9433])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg1-18/igt@kms_content_protection@mei-interface.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         [SKIP][297] ([i915#9424]) -> [SKIP][298] ([i915#8063])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-9/igt@kms_content_protection@mei-interface.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-10/igt@kms_content_protection@mei-interface.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][299] ([i915#4816]) -> [SKIP][300] ([i915#4070] / [i915#4816])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          [SKIP][301] ([i915#3361]) -> [FAIL][302] ([i915#9295])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4435]: https://gitlab.freedesktop.org/drm/intel/issues/4435
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5460]: https://gitlab.freedesktop.org/drm/intel/issues/5460
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6188]: https://gitlab.freedesktop.org/drm/intel/issues/6188
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7297]: https://gitlab.freedesktop.org/drm/intel/issues/7297
  [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
  [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/intel/issues/7984
  [i915#8063]: https://gitlab.freedesktop.org/drm/intel/issues/8063
  [i915#8190]: https://gitlab.freedesktop.org/drm/intel/issues/8190
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8431]: https://gitlab.freedesktop.org/drm/intel/issues/8431
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
  [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
  [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227
  [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
  [i915#9310]: https://gitlab.freedesktop.org/drm/intel/issues/9310
  [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/intel/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/intel/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
  [i915#9618]: https://gitlab.freedesktop.org/drm/intel/issues/9618
  [i915#9653]: https://gitlab.freedesktop.org/drm/intel/issues/9653
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/intel/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
  [i915#9697]: https://gitlab.freedesktop.org/drm/intel/issues/9697
  [i915#9723]: https://gitlab.freedesktop.org/drm/intel/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/intel/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/intel/issues/9808
  [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
  [i915#9820]: https://gitlab.freedesktop.org/drm/intel/issues/9820


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7628 -> IGTPW_10368
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13995: 3cc95cce53f9379460ae504a1481a80faf02b33d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10368: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/index.html
  IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/index.html

--===============1687638332074165247==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_mmap: sanity check partial munmap</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127503/">https://patchwork.freedesktop.org/series/127503/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13995_full -&gt; IGTPW_10368_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10368_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10368_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10368_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@all-engines:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb1/igt@gem_exec_gttfill@all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb4/igt@gem_exec_gttfill@all-engines.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-2/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@i915_pm_rps@reset.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-3/igt@kms_sequence@get-forked@pipe-b-hdmi-a-2.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@atomic-dpms:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb7/igt@kms_content_protection@atomic-dpms.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10368_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9618">i915#9618</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb5/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb7/igt@fbdev@pan.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4435">i915#4435</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-6/igt@gem_caching@writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@gem_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9310">i915#9310</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-11/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-5/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-6/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@gem_exec_fair@basic-flow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_exec_fair@basic-none-share.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@gem_exec_fence@submit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-3/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-5/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@gem_mmap_gtt@basic-small-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo-tiledy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-15/igt@gem_mmap_gtt@big-bo-tiledy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@gem_mmap_wc@read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_partial_pwrite_pread@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-banned@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@gem_userptr_blits@mmap-offset-banned@gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-18/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-5/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9697">i915#9697</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8431">i915#8431</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-6/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3826">i915#3826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_async_flips@crc@pipe-c-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-9/igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-13/igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +100 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_ccs@pipe-d-bad-rotation-90-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-3/igt@kms_ccs@pipe-d-crc-primary-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk9/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-17/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-6/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-18/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-19/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_content_protection@lic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-2/igt@kms_cursor_legacy@single-move@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9227">i915#9227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +27 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460">i915#5460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9766">i915#9766</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9766">i915#9766</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9653">i915#9653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-12/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9295">i915#9295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-2/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-7/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6805">i915#6805</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-1/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@v3d/v3d_perfmon@destroy-valid-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-pad:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-3/igt@v3d/v3d_submit_cl@bad-multisync-pad.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-perfmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@v3d/v3d_submit_cl@bad-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@map-bo-0ns:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@v3d/v3d_wait_bo@map-bo-0ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-perfmon-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-7/igt@vc4/vc4_perfmon@create-perfmon-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-8/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-bad-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-10/igt@vc4/vc4_tiling@set-bad-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-glk9/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8190">i915#8190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk7/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7297">i915#7297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-11/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-10/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear@smem0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-mtlp-2/igt@gem_mmap_offset@clear@smem0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-mtlp-5/igt@gem_mmap_offset@clear@smem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-4/igt@i915_pm_rps@thresholds-idle-park@gt0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-9/igt@i915_pm_rps@thresholds-idle-park@gt0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-3/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-4/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2876">i915#2876</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9820">i915#9820</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8063">i915#8063</a>)</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-dg1-18/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-dg1-14/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9433">i915#9433</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-tglu-9/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-tglu-10/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8063">i915#8063</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13995/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9295">i915#9295</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7628 -&gt; IGTPW_10368</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13995: 3cc95cce53f9379460ae504a1481a80faf02b33d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10368: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10368/index.html<br />
  IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1687638332074165247==--
