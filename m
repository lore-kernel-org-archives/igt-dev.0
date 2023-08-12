Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5515273887576793416=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Sat, 12 Aug 2023 15:04:35 -0000
Message-ID: <169185267559.8159.5460799751472095775@emeril.freedesktop.org>
References: <20230811111026.1327273-1-anshuman.gupta@intel.com>
In-Reply-To: <20230811111026.1327273-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHZy?=
 =?utf-8?q?am=5Fd3cold=5Fthreshold_test_=28rev3=29?=
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

--===============5515273887576793416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add vram_d3cold_threshold test (rev3)
URL   : https://patchwork.freedesktop.org/series/122154/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13507_full -> IGTPW_9576_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9576_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9576_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9576_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-dg2:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [TIMEOUT][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_ccs.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          [SKIP][4] ([i915#3281]) -> [TIMEOUT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-1/igt@gem_exec_reloc@basic-softpin.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@gem_exec_reloc@basic-softpin.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs:
    - shard-dg2:          [SKIP][6] ([i915#3689] / [i915#5354]) -> [TIMEOUT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][8] ([i915#5354]) -> [TIMEOUT][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13507_full and IGTPW_9576_full:

### New IGT tests (2) ###

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9576_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8411])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#7456])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#7701])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#7701])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@virtual-busy-hang-all:
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8414]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-hang-all.html

  * igt@drm_read@empty-nonblock:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982] / [i915#8585])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-apl2/igt@drm_read@empty-nonblock.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl4/igt@drm_read@empty-nonblock.html

  * igt@feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#1839])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#1839])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-9/igt@feature_discovery@display-2x.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8562])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-mtlp:         [PASS][21] -> [FAIL][22] ([i915#6121])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@hang:
    - shard-snb:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#1099])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#8555])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#280])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#280]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [PASS][27] -> [ABORT][28] ([i915#7975] / [i915#8213])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-11/igt@gem_eio@hibernate.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-snb:          [PASS][29] -> [FAIL][30] ([i915#8764])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-snb5/igt@gem_eio@kms.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb6/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg2:          [PASS][31] -> [FAIL][32] ([i915#5784])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-12/igt@gem_eio@unwedge-stress.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gem_eio@unwedge-stress.html
    - shard-dg1:          [PASS][33] -> [FAIL][34] ([i915#5784])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-18/igt@gem_eio@unwedge-stress.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_await@wide-contexts:
    - shard-dg2:          [PASS][35] -> [TIMEOUT][36] ([i915#5892])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-11/igt@gem_exec_await@wide-contexts.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4812])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@hang:
    - shard-mtlp:         [PASS][38] -> [ABORT][39] ([i915#8104] / [i915#8865])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-5/igt@gem_exec_balancer@hang.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-4/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4036])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4525])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][42] -> [FAIL][43] ([i915#2846])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-rkl:          [PASS][44] -> [FAIL][45] ([i915#2842])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][46] -> [FAIL][47] ([i915#2842])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][48] -> [FAIL][49] ([i915#2842])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4812]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#3711])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-apl:          [PASS][53] -> [DMESG-WARN][54] ([i915#8585]) +8 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#3281]) +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3281]) +13 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3281])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4537] / [i915#4812]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4860]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#2190])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4613])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-3/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][62] -> [TIMEOUT][63] ([i915#5493])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-12/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4613])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@gem_lmem_swapping@verify.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4077]) +7 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4077])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@gem_mmap_gtt@medium-copy.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4083])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4083]) +6 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3282]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3282]) +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@gem_pread@snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3282]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4270]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4270]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4270])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#8428]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4885])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][77] ([fdo#109312])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-10/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#3297])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          NOTRUN -> [FAIL][79] ([i915#3318])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@gem_userptr_blits@vma-merge.html
    - shard-tglu:         NOTRUN -> [FAIL][80] ([i915#3318])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-3/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_mixed_blits:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([fdo#109289]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([fdo#109289]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#2527] / [i915#2856])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-8/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#2856])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#2856]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#2527]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_hangman@gt-engine-hang@vcs0:
    - shard-mtlp:         [PASS][87] -> [FAIL][88] ([i915#7069])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-6/igt@i915_hangman@gt-engine-hang@vcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@i915_hangman@gt-engine-hang@vcs0.html

  * igt@i915_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#7707])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-10/igt@i915_hwmon@hwmon-read.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#7091])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#7561])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#5354] / [i915#7561])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@i915_pm_backlight@fade-with-suspend.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][93] -> [FAIL][94] ([i915#3989] / [i915#454])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-tglu-9/igt@i915_pm_dc@dc6-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-9/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#3361])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          [PASS][96] -> [FAIL][97] ([i915#3591])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][98] -> [SKIP][99] ([i915#1397])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-16/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#1397])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([fdo#109506])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:
    - shard-tglu:         [PASS][102] -> [FAIL][103] ([i915#7940])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-tglu-10/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][104] -> [SKIP][105] ([i915#1397])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#1397])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-5/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([fdo#111644] / [i915#1397])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([fdo#109293])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#6621])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#8925]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#7984])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@i915_power@sanity.html

  * igt@i915_selftest@live@slpc:
    - shard-mtlp:         [PASS][112] -> [DMESG-WARN][113] ([i915#6367])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@i915_selftest@live@slpc.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          NOTRUN -> [FAIL][114] ([fdo#103375])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#4212])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4212]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-apl:          NOTRUN -> [SKIP][117] ([fdo#109271]) +32 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-4-4-mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#8709]) +11 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-4-4-mc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][119] ([i915#8247]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#6229])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#1769] / [i915#3555])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#5286])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#5286])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([fdo#111614] / [i915#3638]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3638])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-16/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([fdo#111614]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([fdo#111614])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         [PASS][128] -> [FAIL][129] ([i915#3743]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#5190]) +13 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([fdo#111615]) +3 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([fdo#110723]) +2 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4538] / [i915#5190]) +5 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([fdo#111615])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#2705])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#3734] / [i915#5354] / [i915#6095]) +3 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-9/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#6095]) +11 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#3689] / [i915#5354] / [i915#6095]) +6 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-5/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][141] ([fdo#109271] / [i915#3886]) +2 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl3/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_mtl_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#5354] / [i915#6095]) +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#5354] / [i915#6095]) +4 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#5354]) +11 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#3886] / [i915#6095])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#3689] / [i915#3886] / [i915#5354]) +9 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#5354]) +41 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#3689] / [i915#5354]) +31 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#4087] / [i915#7213]) +3 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([fdo#111827]) +1 similar issue
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([fdo#111827])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-8/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([fdo#111827])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#7828]) +8 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#7828]) +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#7828]) +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-5/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#7828]) +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@deep-color:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3555]) +2 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#3299])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7118]) +2 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#7118] / [i915#7162])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#7116])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-15/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3555]) +1 similar issue
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3359])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][164] ([i915#8841]) +2 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#3546]) +1 similar issue
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#4103] / [i915#4213]) +2 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#4103])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-mtlp:         [PASS][168] -> [FAIL][169] ([i915#8248])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([fdo#109274])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([fdo#109274] / [i915#5354]) +3 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-mtlp:         [PASS][172] -> [FAIL][173] ([i915#2346])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#4213])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#4103])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#3804])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3555] / [i915#3840])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_dsc@dsc-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3555] / [i915#3840])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3555] / [i915#3840])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3469])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_fence_pin_leak:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#4881])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([fdo#109274]) +11 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3637]) +3 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-snb:          NOTRUN -> [SKIP][184] ([fdo#109271] / [fdo#111767])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([fdo#109274] / [i915#3637]) +1 similar issue
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([fdo#111825]) +2 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#2672]) +1 similar issue
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#2672])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#2587] / [i915#2672]) +1 similar issue
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#5274])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-dg2:          NOTRUN -> [FAIL][191] ([i915#6880])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-dg2:          [PASS][192] -> [FAIL][193] ([i915#6880])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#3023]) +4 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#8708]) +17 similar issues
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([fdo#111825] / [i915#1825]) +15 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([fdo#109280]) +7 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#8708])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#3458]) +19 similar issues
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#1825]) +10 similar issues
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([fdo#111825])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#6118])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3555] / [i915#8228]) +1 similar issue
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3555] / [i915#8228]) +1 similar issue
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#8228])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#6953])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][207] ([i915#8292])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
    - shard-dg1:          NOTRUN -> [FAIL][208] ([i915#8292])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#5176]) +11 similar issues
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#5176]) +3 similar issues
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#5176]) +11 similar issues
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#5176]) +3 similar issues
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#5235]) +3 similar issues
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#5235]) +5 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#5235]) +3 similar issues
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#5235]) +15 similar issues
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#5235]) +11 similar issues
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-15/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#658]) +1 similar issue
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#658])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#658]) +3 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_psr2_su@page_flip-nv12.html
    - shard-tglu:         NOTRUN -> [SKIP][221] ([fdo#109642] / [fdo#111068] / [i915#658])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@kms_psr2_su@page_flip-nv12.html
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#4348])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@primary_mmap_cpu:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#1072]) +9 similar issues
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_psr@primary_mmap_cpu.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([fdo#110189]) +6 similar issues
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-6/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-snb:          NOTRUN -> [SKIP][225] ([fdo#109271]) +186 similar issues
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb4/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr@sprite_blt:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#1072]) +4 similar issues
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_psr@sprite_blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#5461] / [i915#658])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#5461] / [i915#658]) +1 similar issue
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#4235] / [i915#5190])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#4235])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_selftest@drm_damage:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#8661]) +1 similar issue
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_selftest@drm_damage.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#3555]) +3 similar issues
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][233] ([i915#5465]) +1 similar issue
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#3555] / [i915#4098])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#4070] / [i915#6768]) +1 similar issue
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-d-query-forked:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#4070] / [i915#533] / [i915#6768]) +1 similar issue
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_vblank@pipe-d-query-forked.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#2437]) +1 similar issue
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_writeback@writeback-pixel-formats.html
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#2437])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([fdo#109289]) +1 similar issue
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          [PASS][240] -> [FAIL][241] ([i915#7484])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#2433])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-idle-check-all@ccs0:
    - shard-mtlp:         [PASS][243] -> [FAIL][244] ([i915#4521]) +3 similar issues
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-5/igt@perf_pmu@busy-idle-check-all@ccs0.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-4/igt@perf_pmu@busy-idle-check-all@ccs0.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - shard-dg1:          [PASS][245] -> [FAIL][246] ([i915#4521]) +2 similar issues
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-15/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vecs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#8516])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-5/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][248] ([i915#5493])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#3291] / [i915#3708]) +2 similar issues
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([fdo#109295] / [i915#3291] / [i915#3708])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([fdo#109295] / [i915#3708])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][252] ([i915#6015]) +5 similar issues
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html

  * igt@v3d/v3d_submit_cl@multiple-job-submission:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([fdo#109315] / [i915#2575]) +1 similar issue
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-7/igt@v3d/v3d_submit_cl@multiple-job-submission.html

  * igt@v3d/v3d_submit_cl@simple-flush-cache:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#2575]) +14 similar issues
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@v3d/v3d_submit_cl@simple-flush-cache.html

  * igt@v3d/v3d_submit_cl@single-out-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#2575]) +1 similar issue
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@v3d/v3d_submit_cl@single-out-sync.html

  * igt@v3d/v3d_submit_csd@bad-extension:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([fdo#109315]) +2 similar issues
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@v3d/v3d_submit_csd@bad-extension.html

  * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#7711]) +2 similar issues
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html

  * igt@vc4/vc4_label_bo@set-bad-handle:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#2575]) +2 similar issues
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-9/igt@vc4/vc4_label_bo@set-bad-handle.html

  * igt@vc4/vc4_perfmon@create-perfmon-exceed:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#7711]) +1 similar issue
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@vc4/vc4_perfmon@create-perfmon-exceed.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#7711]) +10 similar issues
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][261] ([i915#7742]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][263] ([i915#6268]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [FAIL][265] ([i915#2410]) -> [PASS][266] +5 similar issues
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][267] ([i915#5784]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-6/igt@gem_eio@kms.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][269] ([i915#5784]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-13/igt@gem_eio@reset-stress.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-16/igt@gem_eio@reset-stress.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-mtlp:         [FAIL][271] ([i915#4475]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-8/igt@gem_exec_capture@pi@vcs0.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-rkl:          [FAIL][273] ([i915#2842]) -> [PASS][274] +1 similar issue
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_schedule@preempt-engines@ccs0:
    - shard-mtlp:         [FAIL][275] -> [PASS][276] +5 similar issues
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@gem_exec_schedule@preempt-engines@ccs0.html

  * igt@gem_exec_schedule@preempt-engines@rcs0:
    - shard-mtlp:         [DMESG-FAIL][277] -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@rcs0.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@gem_exec_schedule@preempt-engines@rcs0.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [FAIL][279] ([i915#9051]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-2/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          [ABORT][281] ([i915#7975] / [i915#8213]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_spin_batch@spin-each:
    - shard-mtlp:         [DMESG-FAIL][283] ([i915#8962]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-4/igt@gem_spin_batch@spin-each.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-5/igt@gem_spin_batch@spin-each.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [ABORT][285] ([i915#5566]) -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-apl1/igt@gen9_exec_parse@allowed-single.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl3/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - shard-mtlp:         [FAIL][287] ([i915#8691]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-mtlp:         [SKIP][289] ([i915#8403]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - shard-dg1:          [FAIL][291] ([i915#3591]) -> [PASS][292] +1 similar issue
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
    - shard-dg1:          [FAIL][293] ([i915#7940]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][295] ([i915#1397]) -> [PASS][296] +1 similar issue
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg1:          [SKIP][297] ([i915#1397]) -> [PASS][298] +1 similar issue
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-mtlp:         [DMESG-FAIL][299] ([i915#7059]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][301] ([i915#2521]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
    - shard-glk:          [FAIL][303] ([i915#2521]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         [FAIL][305] ([i915#3743]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [FAIL][307] ([i915#2346]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [FAIL][309] ([i915#6880]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@perf_pmu@busy-double-start@ccs3:
    - shard-dg2:          [FAIL][311] ([i915#4349]) -> [PASS][312] +7 similar issues
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-10/igt@perf_pmu@busy-double-start@ccs3.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@perf_pmu@busy-double-start@ccs3.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [FAIL][313] ([i915#4349]) -> [PASS][314] +2 similar issues
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-16/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@rc6-suspend:
    - shard-tglu:         [ABORT][315] ([i915#5122] / [i915#5251]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-tglu-8/igt@perf_pmu@rc6-suspend.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-6/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt1:
    - shard-mtlp:         [SKIP][317] ([i915#8537]) -> [PASS][318] +2 similar issues
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-7/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@perf_pmu@rc6@runtime-pm-long-gt1.html

  * igt@sysfs_heartbeat_interval@mixed@ccs0:
    - shard-mtlp:         [ABORT][319] ([i915#8552]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-7/igt@sysfs_heartbeat_interval@mixed@ccs0.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@ccs0.html

  * igt@sysfs_heartbeat_interval@mixed@vecs0:
    - shard-mtlp:         [FAIL][321] ([i915#1731]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-7/igt@sysfs_heartbeat_interval@mixed@vecs0.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@vecs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-tglu:         [WARN][323] ([i915#2681]) -> [FAIL][324] ([i915#2681] / [i915#3591])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_async_flips@crc@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-FAIL][325] ([i915#1982] / [i915#8561]) -> [DMESG-FAIL][326] ([i915#8561])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@kms_async_flips@crc@pipe-a-edp-1.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@kms_async_flips@crc@pipe-a-edp-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg1:          [SKIP][327] ([fdo#109300]) -> [SKIP][328] ([i915#7116])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-13/igt@kms_content_protection@mei_interface.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-16/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [FAIL][329] ([i915#2346]) -> [DMESG-FAIL][330] ([i915#2017] / [i915#5954])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][331] ([fdo#110189] / [i915#3955]) -> [SKIP][332] ([i915#3955])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-2/igt@kms_fbcon_fbt@psr.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_psr@cursor_plane_move:
    - shard-dg1:          [SKIP][333] ([i915#1072]) -> [SKIP][334] ([i915#1072] / [i915#4078])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-17/igt@kms_psr@cursor_plane_move.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-13/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - shard-dg1:          [SKIP][335] ([i915#1072] / [i915#4078]) -> [SKIP][336] ([i915#1072])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-18/igt@kms_psr@sprite_plane_onoff.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@kms_psr@sprite_plane_onoff.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
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
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3711]: https://gitlab.freedesktop.org/drm/intel/issues/3711
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
  [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5251]: https://gitlab.freedesktop.org/drm/intel/issues/5251
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5892]: https://gitlab.freedesktop.org/drm/intel/issues/5892
  [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/intel/issues/6118
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6229]: https://gitlab.freedesktop.org/drm/intel/issues/6229
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7091]: https://gitlab.freedesktop.org/drm/intel/issues/7091
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/intel/issues/7984
  [i915#8104]: https://gitlab.freedesktop.org/drm/intel/issues/8104
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8248]: https://gitlab.freedesktop.org/drm/intel/issues/8248
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
  [i915#8537]: https://gitlab.freedesktop.org/drm/intel/issues/8537
  [i915#8552]: https://gitlab.freedesktop.org/drm/intel/issues/8552
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
  [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8691]: https://gitlab.freedesktop.org/drm/intel/issues/8691
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8764]: https://gitlab.freedesktop.org/drm/intel/issues/8764
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
  [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
  [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
  [i915#9051]: https://gitlab.freedesktop.org/drm/intel/issues/9051


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7430 -> IGTPW_9576
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13507: 836bdeb32920259516f05778a43cb80302e83e15 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9576: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/index.html
  IGT_7430: 7430
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/index.html

--===============5515273887576793416==
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
<tr><td><b>Series:</b></td><td>Add vram_d3cold_threshold test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122154/">https://patchwork.freedesktop.org/series/122154/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13507_full -&gt; IGTPW_9576_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9576_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9576_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9576_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_ccs.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-1/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@gem_exec_reloc@basic-softpin.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13507_full and IGTPW_9576_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9576_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@drm_read@empty-nonblock:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-apl2/igt@drm_read@empty-nonblock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl4/igt@drm_read@empty-nonblock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-9/igt@feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb7/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-11/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-snb5/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb6/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8764">i915#8764</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-12/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-18/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_await@wide-contexts:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-11/igt@gem_exec_await@wide-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@gem_exec_await@wide-contexts.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5892">i915#5892</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hang:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-5/igt@gem_exec_balancer@hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-4/igt@gem_exec_balancer@hang.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8104">i915#8104</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8865">i915#8865</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3711">i915#3711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl4/igt@gem_exec_reloc@basic-concurrent16.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@gem_exec_reloc@basic-write-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-3/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-12/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@gem_mmap_gtt@medium-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +4 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@gem_pxp@create-regular-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4885">i915#4885</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-10/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109312">fdo#109312</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-3/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@gen3_render_mixed_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-8/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-6/igt@i915_hangman@gt-engine-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@i915_hangman@gt-engine-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-10/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7091">i915#7091</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@i915_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-tglu-9/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-9/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@i915_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-16/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-tglu-10/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-5/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-4-4-mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-4-4-mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6229">i915#6229</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-16/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@kms_big_joiner@2x-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-9/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-5/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl3/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +41 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-8/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-5/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162">i915#7162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-15/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8248">i915#8248</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-stridechange.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6118">i915#6118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-15/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4348">i915#4348</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_psr@primary_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-6/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb4/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +186 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_psr@sprite_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5461">i915#5461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5461">i915#5461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-12/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_selftest@drm_damage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@kms_vblank@pipe-d-query-forked.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7484">i915#7484</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-5/igt@perf_pmu@busy-idle-check-all@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-4/igt@perf_pmu@busy-idle-check-all@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-15/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-5/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@multiple-job-submission:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-7/igt@v3d/v3d_submit_cl@multiple-job-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@simple-flush-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@v3d/v3d_submit_cl@simple-flush-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@single-out-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@v3d/v3d_submit_cl@single-out-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-extension:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@v3d/v3d_submit_csd@bad-extension.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-bad-handle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-9/igt@vc4/vc4_label_bo@set-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-perfmon-exceed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@vc4/vc4_perfmon@create-perfmon-exceed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +10 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-6/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-13/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-16/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-8/igt@gem_exec_capture@pi@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4475">i915#4475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-2/igt@gem_exec_capture@pi@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-4/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@gem_exec_schedule@preempt-engines@ccs0.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@rcs0.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@gem_exec_schedule@preempt-engines@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-2/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9051">i915#9051</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-1/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-each:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-4/igt@gem_spin_batch@spin-each.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8962">i915#8962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-5/igt@gem_spin_batch@spin-each.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-apl1/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl3/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8691">i915#8691</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8403">i915#8403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg2-10/igt@perf_pmu@busy-double-start@ccs3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg2-11/igt@perf_pmu@busy-double-start@ccs3.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-16/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-tglu-8/igt@perf_pmu@rc6-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5251">i915#5251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-6/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-7/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8537">i915#8537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-8/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-7/igt@sysfs_heartbeat_interval@mixed@ccs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8552">i915#8552</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-7/igt@sysfs_heartbeat_interval@mixed@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8561">i915#8561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-3/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8561">i915#8561</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-13/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-16/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-rkl-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-17/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-13/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13507/shard-dg1-18/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/shard-dg1-19/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7430 -&gt; IGTPW_9576</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13507: 836bdeb32920259516f05778a43cb80302e83e15 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9576: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9576/index.html<br />
  IGT_7430: 7430<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5515273887576793416==--
