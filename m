Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2831164008850664203=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/i915=5Fsuspend?=
 =?utf-8?q?=3A_Fix_WARN_of_invalid_fd_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 09 Jan 2024 15:34:09 -0000
Message-ID: <170481444921.215423.14818765328553989972@5338d5abeb45>
References: <20240109102703.2529736-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240109102703.2529736-1-bhanuprakash.modem@intel.com>
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

--===============2831164008850664203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_suspend: Fix WARN of invalid fd (rev2)
URL   : https://patchwork.freedesktop.org/series/128364/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14100_full -> IGTPW_10494_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10494_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10494_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/index.html

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10494_full:

### IGT changes ###

#### Possible regressions ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@device_reset@unbind-reset-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb2/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb1/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html

  * igt@runner@aborted:
    - shard-glk:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_10494_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-3/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#6230])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#7701])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-15/igt@device_reset@cold-reset-bound.html
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#7701])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@device_reset@cold-reset-bound.html
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#7701])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8414]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-5/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@fbdev@info:
    - shard-dg2:          [PASS][14] -> [SKIP][15] ([i915#1849] / [i915#2582])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@fbdev@info.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@fbdev@info.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          [PASS][16] -> [SKIP][17] ([i915#2582]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@fbdev@unaligned-read.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@fbdev@unaligned-read.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#3281]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#3281]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][20] ([i915#7297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-14/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_compute@compute-square:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#9310])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#6335])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_param@invalid-param-set:
    - shard-dg2:          [PASS][24] -> [SKIP][25] ([i915#2575]) +205 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@gem_ctx_param@invalid-param-set.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_ctx_param@invalid-param-set.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#8555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-dg1:          [PASS][27] -> [ABORT][28] ([i915#9854])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-18/igt@gem_ctx_persistence@many-contexts.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-5/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#4036])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4525])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#6334])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk8/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#6344])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@many-4k-zero:
    - shard-rkl:          NOTRUN -> [FAIL][36] ([i915#9606])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@gem_exec_capture@many-4k-zero.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4473])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][38] ([i915#2842]) +3 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk4/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#2842])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [PASS][41] -> [FAIL][42] ([i915#2842]) +4 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#7697])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglu:         NOTRUN -> [SKIP][47] ([fdo#109283])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([fdo#112283])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3281]) +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-write-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#3281]) +7 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4537] / [i915#4812])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4812])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][54] -> [INCOMPLETE][55] ([i915#9275])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_exec_suspend@basic-s0@smem.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-rkl:          NOTRUN -> [ABORT][56] ([i915#7975] / [i915#8213])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4860])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@gem_fence_thrash@bo-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4860]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#2190])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#4613]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk9/igt@gem_lmem_swapping@random-engines.html
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][63] -> [TIMEOUT][64] ([i915#5493])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#4613])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@gem_lmem_swapping@verify.html
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4613])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#9643]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#284])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@gem_media_vme.html

  * igt@gem_mmap@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4083]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4077]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@gem_mmap_gtt@hang.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4077]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@gem_mmap_gtt@medium-copy-odd.html
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4077])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4083]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4083])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-16/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3282]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#4270]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4270]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-4/igt@gem_pxp@create-regular-context-1.html
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#4270])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-6/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4270]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-15/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4270]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#3282]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@gem_readwrite@new-obj.html
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3282]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-16/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#8428])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@gem_render_copy@yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#2575] / [i915#5190]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#8411])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#3282]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([fdo#110542])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3297]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3323])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3297] / [i915#4958])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3297]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][94] ([fdo#109271]) +62 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb2/igt@gem_vm_create@invalid-create.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([fdo#109289]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#2527]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#2856])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#2527]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2856]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_fb_tiling:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4881])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@i915_fb_tiling.html

  * igt@i915_module_load@load:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#6227])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][102] -> [ABORT][103] ([i915#9820])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [INCOMPLETE][104] ([i915#9200])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-dg2:          [PASS][105] -> [SKIP][106] ([i915#9980])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#8925])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([fdo#109303])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([fdo#109302])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][110] ([i915#9311])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4212])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#4212])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#8709]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@crc@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][114] ([i915#8561]) +1 other test dmesg-fail
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_async_flips@crc@pipe-a-edp-1.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][115] ([i915#8247]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][116] ([i915#8247]) +3 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-16/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#6228])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#1769] / [i915#3555])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([fdo#112022] / [i915#2575])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#5286]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [PASS][121] -> [FAIL][122] ([i915#5138])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5286]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - shard-tglu:         NOTRUN -> [SKIP][124] ([fdo#111615] / [i915#5286]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3638]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-tglu:         NOTRUN -> [SKIP][126] ([fdo#111614]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([fdo#111614]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([fdo#111614]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([fdo#111614] / [i915#3638]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#5190]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4538]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([fdo#110723]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([fdo#109315] / [i915#5190]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([fdo#111615])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#4538] / [i915#5190]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([fdo#111615]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#2705])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf-tiled-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#5354] / [i915#6095]) +23 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@kms_ccs@pipe-a-random-ccs-data-yf-tiled-ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-4-tiled-mtl-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#5354] / [i915#6095]) +23 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-6/igt@kms_ccs@pipe-b-bad-aux-stride-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#5354] / [i915#6095]) +13 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@kms_ccs@pipe-b-ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#5354]) +43 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#5354]) +17 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#5354] / [i915#6095]) +18 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-glk:          NOTRUN -> [SKIP][144] ([fdo#109271]) +230 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk9/igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4087] / [i915#7213])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-10/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4087]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([fdo#111827])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([fdo#111827]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([fdo#111827]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([fdo#111827])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-3/igt@kms_chamelium_color@ctm-max.html
    - shard-dg1:          NOTRUN -> [SKIP][151] ([fdo#111827])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#7828]) +6 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#7828]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#7828]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#7828]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#7828]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#7118]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#9424])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#3116])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#3116] / [i915#3299])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#7118]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#3359])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#8814])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#3555]) +5 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#3359]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#3555] / [i915#8814])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#4213])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#4103] / [i915#4213]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#4103] / [i915#4213])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#4103])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([fdo#109274] / [i915#5354]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][173] ([fdo#109274])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#9809]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([fdo#111767] / [fdo#111825])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#4103])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#9723])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html

  * igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-1-pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][178] ([i915#9841]) +3 other tests fail
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb7/igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-1-pipe-b-vga-1.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#8588])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3804])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#8812])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#3555] / [i915#8812])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#8812])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#4854])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#1839])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#1839])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#658])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([fdo#109274] / [i915#3637])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#3637]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#8381])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([fdo#111825]) +7 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([fdo#111825] / [i915#9934]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([fdo#109274]) +6 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#2587] / [i915#2672])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#2672]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#2672] / [i915#3555])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#2672])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#2672]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][199] -> [SKIP][200] ([fdo#109315]) +52 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([fdo#111825] / [i915#1825]) +25 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([fdo#111825]) +20 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
    - shard-snb:          [PASS][203] -> [SKIP][204] ([fdo#109271]) +6 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2:          [PASS][205] -> [FAIL][206] ([i915#6880])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#3458]) +10 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([fdo#110189]) +7 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3458]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#8708]) +6 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#1825]) +12 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#9766])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#8708]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#3023]) +18 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([fdo#109315]) +76 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#8708]) +11 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([fdo#109280]) +9 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3555] / [i915#8228]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#4070] / [i915#4816])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([fdo#109289]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
    - shard-dg1:          NOTRUN -> [SKIP][221] ([fdo#109289])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
    - shard-tglu:         NOTRUN -> [SKIP][222] ([fdo#109289])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-7/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][223] ([i915#7862]) +1 other test fail
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#3582]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][225] ([i915#8292])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#9423]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#9423]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#9423]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#9423]) +19 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#2575] / [i915#9423]) +15 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#5235]) +11 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#5235]) +7 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#3555] / [i915#5235])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#5235]) +6 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#5235]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][236] -> [SKIP][237] ([i915#4281])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#8430])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][239] -> [FAIL][240] ([i915#8717])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_pm_rpm@i2c.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#9980]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#9519])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#9519])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][244] -> [SKIP][245] ([i915#9519]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([fdo#109293] / [fdo#109506])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([fdo#109293] / [fdo#109506]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-16/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#9683])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([fdo#111068] / [i915#9683])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#9683])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([fdo#111068] / [i915#9683]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-15/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#4235])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#4235] / [i915#5190])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-rkl:          NOTRUN -> [SKIP][254] ([fdo#111615] / [i915#5289])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#3555]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#3555]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8809])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([fdo#109309])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][259] ([i915#9196])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-3:
    - shard-dg2:          [PASS][260] -> [FAIL][261] ([i915#9196])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-3.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-3.html

  * igt@kms_vrr@flip-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#3555] / [i915#8808])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#3555]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#2437])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#2437])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][266] ([fdo#109271] / [i915#2437])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk4/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2437])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [PASS][268] -> [SKIP][269] ([i915#5608]) +9 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@perf@invalid-remove-userspace-config.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@oa-exponents:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#5608]) +18 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@perf@oa-exponents.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][271] ([i915#4349]) +3 other tests fail
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#8516])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@render-node-busy-idle@ccs0:
    - shard-mtlp:         [PASS][273] -> [FAIL][274] ([i915#4349])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-mtlp-4/igt@perf_pmu@render-node-busy-idle@ccs0.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@perf_pmu@render-node-busy-idle@ccs0.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#3708] / [i915#4077])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([fdo#109295])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#3708])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#9917])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@v3d/v3d_perfmon@get-values-invalid-pad:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#2575]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-14/igt@v3d/v3d_perfmon@get-values-invalid-pad.html
    - shard-tglu:         NOTRUN -> [SKIP][280] ([fdo#109315] / [i915#2575]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-9/igt@v3d/v3d_perfmon@get-values-invalid-pad.html

  * igt@v3d/v3d_submit_cl@bad-multisync-pad:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#2575]) +5 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@v3d/v3d_submit_cl@bad-multisync-pad.html

  * igt@v3d/v3d_submit_cl@multi-and-single-sync:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([fdo#109315]) +11 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@v3d/v3d_submit_cl@multi-and-single-sync.html

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#2575]) +253 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@v3d/v3d_submit_csd@single-out-sync.html

  * igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#7711]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-15/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html

  * igt@vc4/vc4_perfmon@destroy-valid-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#7711]) +10 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html

  * igt@vc4/vc4_tiling@get-bad-flags:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#7711]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@vc4/vc4_tiling@get-bad-flags.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#2575]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#7711]) +4 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-6/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][289] ([i915#7742]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][291] ([i915#7297]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][293] ([i915#5784]) -> [PASS][294] +1 other test pass
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-19/igt@gem_eio@unwedge-stress.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-rkl:          [FAIL][295] ([i915#2842]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [INCOMPLETE][297] ([i915#9200] / [i915#9849]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          [INCOMPLETE][299] ([i915#9849]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          [INCOMPLETE][301] ([i915#9849]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [FAIL][303] ([i915#3591]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [FAIL][305] ([i915#10031]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         [FAIL][307] ([i915#3743]) -> [PASS][308] +3 other tests pass
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [DMESG-WARN][309] ([i915#10007]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          [FAIL][311] ([i915#6880]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][313] ([fdo#109271]) -> [PASS][314] +11 other tests pass
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][315] ([i915#9295]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][317] ([i915#9519]) -> [PASS][318] +2 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-snb:          [FAIL][319] ([i915#9196]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-dg1:          [FAIL][321] ([i915#9593]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  
#### Warnings ####

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          [FAIL][323] ([i915#6122]) -> [SKIP][324] ([i915#2575])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@api_intel_bb@render-ccs.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@api_intel_bb@render-ccs.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          [SKIP][325] ([i915#8414]) -> [SKIP][326] ([i915#5608]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@drm_fdinfo@virtual-busy-hang.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          [SKIP][327] ([i915#3936]) -> [SKIP][328] ([i915#2575])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_busy@semaphore.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_busy@semaphore.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [INCOMPLETE][329] ([i915#9364]) -> [SKIP][330] ([i915#2575])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          [SKIP][331] ([i915#8562]) -> [SKIP][332] ([i915#2575])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_create@create-ext-set-pat.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          [SKIP][333] ([i915#8555]) -> [SKIP][334] ([i915#2575]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          [SKIP][335] ([i915#280]) -> [SKIP][336] ([i915#2575])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][337] ([i915#4771]) -> [SKIP][338] ([i915#2575])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-dg2:          [SKIP][339] ([i915#3539] / [i915#4852]) -> [SKIP][340] ([i915#2575]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@gem_exec_fair@basic-pace-share.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          [SKIP][341] ([i915#4812]) -> [SKIP][342] ([i915#2575]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@gem_exec_fence@concurrent.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][343] ([i915#3539]) -> [SKIP][344] ([i915#2575])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-3/igt@gem_exec_flush@basic-uc-set-default.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          [SKIP][345] ([i915#3281]) -> [SKIP][346] ([i915#2575]) +12 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          [SKIP][347] ([i915#4537] / [i915#4812]) -> [SKIP][348] ([i915#2575]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          [SKIP][349] ([i915#4860]) -> [SKIP][350] ([i915#2575]) +4 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-y.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_media_vme:
    - shard-dg2:          [SKIP][351] ([i915#284]) -> [SKIP][352] ([i915#2575])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@gem_media_vme.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          [SKIP][353] ([i915#4077]) -> [SKIP][354] ([i915#2575]) +16 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@gem_mmap_gtt@big-copy-odd.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          [SKIP][355] ([i915#4083]) -> [SKIP][356] ([i915#2575]) +6 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_mmap_wc@bad-size.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_mmap_wc@bad-size.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          [SKIP][357] ([i915#3282]) -> [SKIP][358] ([i915#2575]) +4 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          [WARN][359] ([i915#2658]) -> [INCOMPLETE][360] ([i915#10042])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-glk8/igt@gem_pread@exhaustion.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk9/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-dg2:          [SKIP][361] ([i915#4270]) -> [SKIP][362] ([i915#2575]) +3 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          [SKIP][363] ([i915#5190]) -> [SKIP][364] ([i915#2575] / [i915#5190]) +8 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg2:          [SKIP][365] ([i915#4079]) -> [SKIP][366] ([i915#2575]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@gem_set_tiling_vs_gtt.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          [SKIP][367] ([i915#4885]) -> [SKIP][368] ([i915#2575])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          [FAIL][369] ([i915#5889]) -> [SKIP][370] ([i915#2575])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          [SKIP][371] ([i915#4879]) -> [SKIP][372] ([i915#2575])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-3/igt@gem_unfence_active_buffers.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          [SKIP][373] ([i915#3297] / [i915#4880]) -> [SKIP][374] ([i915#2575]) +2 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-dg2:          [SKIP][375] ([i915#3297]) -> [SKIP][376] ([i915#2575]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@gem_userptr_blits@readonly-pwrite-unsync.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          [SKIP][377] ([i915#2856]) -> [SKIP][378] ([i915#2575]) +5 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@gen9_exec_parse@valid-registers.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu:         [FAIL][379] ([i915#3591]) -> [WARN][380] ([i915#2681])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          [SKIP][381] ([i915#6621]) -> [SKIP][382] ([i915#2575])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@i915_pm_rps@basic-api.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@i915_pm_rps@basic-api.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          [SKIP][383] ([i915#6188]) -> [SKIP][384] ([i915#2575])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@i915_query@query-topology-coherent-slice-mask.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          [SKIP][385] ([i915#4215] / [i915#5190]) -> [SKIP][386] ([i915#2575] / [i915#5190])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          [SKIP][387] ([i915#4212]) -> [SKIP][388] ([i915#2575]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@kms_addfb_basic@clobberred-modifier.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][389] ([fdo#111614]) -> [SKIP][390] ([fdo#109315]) +7 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          [SKIP][391] ([i915#5190]) -> [SKIP][392] ([fdo#109315] / [i915#5190]) +8 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-dg2:          [SKIP][393] ([i915#4538] / [i915#5190]) -> [SKIP][394] ([fdo#109315] / [i915#5190]) +8 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          [SKIP][395] ([i915#2705]) -> [SKIP][396] ([fdo#109315])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-3/igt@kms_big_joiner@basic.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2:          [SKIP][397] ([fdo#111827]) -> [SKIP][398] ([i915#2575]) +3 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_chamelium_color@ctm-0-25.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          [SKIP][399] ([i915#7828]) -> [SKIP][400] ([i915#2575]) +10 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          [SKIP][401] ([i915#3299]) -> [SKIP][402] ([i915#2575])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-0.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          [SKIP][403] ([i915#9424]) -> [SKIP][404] ([i915#2575])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-3/igt@kms_content_protection@mei-interface.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          [SKIP][405] ([i915#9433]) -> [SKIP][406] ([i915#9424])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-12/igt@kms_content_protection@mei-interface.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-16/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][407] ([i915#7118]) -> [SKIP][408] ([i915#2575]) +3 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@kms_content_protection@type1.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_content_protection@type1.html
    - shard-snb:          [SKIP][409] ([fdo#109271]) -> [INCOMPLETE][410] ([i915#8816])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb1/igt@kms_content_protection@type1.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          [SKIP][411] ([i915#3359]) -> [SKIP][412] ([i915#2575]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          [SKIP][413] ([fdo#109274] / [i915#5354]) -> [SKIP][414] ([i915#2575]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2:          [SKIP][415] ([fdo#109274] / [fdo#111767] / [i915#5354]) -> [SKIP][416] ([i915#2575])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          [SKIP][417] ([i915#4103] / [i915#4213]) -> [SKIP][418] ([i915#2575])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          [SKIP][419] ([i915#3555] / [i915#3840]) -> [SKIP][420] ([fdo#109315]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_dsc@dsc-basic.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          [SKIP][421] ([i915#3840]) -> [SKIP][422] ([fdo#109315])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          [SKIP][423] ([i915#3840] / [i915#9053]) -> [SKIP][424] ([fdo#109315])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          [SKIP][425] ([i915#3469]) -> [SKIP][426] ([fdo#109315])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_fbcon_fbt@psr.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][427] ([i915#3955]) -> [SKIP][428] ([fdo#110189] / [i915#3955])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          [SKIP][429] ([i915#4854]) -> [SKIP][430] ([i915#2575])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@kms_feature_discovery@chamelium.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          [SKIP][431] ([i915#9337]) -> [SKIP][432] ([i915#2575])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@kms_feature_discovery@dp-mst.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2:          [SKIP][433] ([i915#658]) -> [SKIP][434] ([i915#2575])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@kms_feature_discovery@psr2.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          [SKIP][435] ([fdo#109274]) -> [SKIP][436] ([i915#2575]) +8 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          [SKIP][437] ([fdo#109274] / [fdo#111767]) -> [SKIP][438] ([i915#2575])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg2:          [SKIP][439] ([i915#8381]) -> [SKIP][440] ([i915#2575])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [FAIL][441] ([i915#6880]) -> [SKIP][442] ([fdo#109315])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          [SKIP][443] ([i915#5354]) -> [SKIP][444] ([fdo#109315]) +113 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          [SKIP][445] -> [SKIP][446] ([fdo#109315])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][447] ([i915#8708]) -> [SKIP][448] ([fdo#109315]) +22 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          [SKIP][449] ([i915#3458]) -> [SKIP][450] ([fdo#109315]) +28 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][451] ([i915#3555] / [i915#8228]) -> [SKIP][452] ([i915#2575]) +3 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          [SKIP][453] ([i915#4816]) -> [SKIP][454] ([i915#2575])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-t

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/index.html

--===============2831164008850664203==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_suspend: Fix WARN of invalid fd (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128364/">https://patchwork.freedesktop.org/series/128364/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14100_full -&gt; IGTPW_10494_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10494_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10494_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/index.html</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10494_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb2/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb1/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk1/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10494_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-3/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-15/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-5/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> ([i915#8414]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@fbdev@info.html">SKIP</a> ([i915#1849] / [i915#2582])</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@fbdev@unaligned-read.html">SKIP</a> ([i915#2582]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-14/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@gem_compute@compute-square.html">SKIP</a> ([i915#9310])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-param-set:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@gem_ctx_param@invalid-param-set.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_ctx_param@invalid-param-set.html">SKIP</a> ([i915#2575]) +205 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-18/igt@gem_ctx_persistence@many-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@gem_ctx_persistence@many-contexts.html">ABORT</a> ([i915#9854])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-5/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk8/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([fdo#109271] / [i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> ([i915#4473])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk4/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-6/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@gem_exec_reloc@basic-active.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> ([i915#9275])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk4/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk9/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613]) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@gem_lmem_swapping@verify.html">SKIP</a> ([i915#4613])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@gem_lmem_swapping@verify.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#9643]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@gem_mmap@bad-offset.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@gem_mmap_gtt@hang.html">SKIP</a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-odd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@gem_mmap_gtt@medium-copy-odd.html">SKIP</a> ([i915#4077]) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@gem_mmap_gtt@medium-copy-odd.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> ([i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read-distinct:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-16/igt@gem_mmap_wc@write-read-distinct.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@gem_partial_pwrite_pread@write.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-4/igt@gem_pxp@create-regular-context-1.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-6/igt@gem_pxp@create-regular-context-1.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-15/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@gem_readwrite@new-obj.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-16/igt@gem_readwrite@new-obj.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@gem_render_copy@yf-tiled.html">SKIP</a> ([i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@invalid-create:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb2/igt@gem_vm_create@invalid-create.html">SKIP</a> ([fdo#109271]) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9200])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-forcewake-user:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> ([i915#9980])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> ([i915#8561]) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_async_flips@crc@pipe-d-edp-1.html">FAIL</a> ([i915#8247]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-16/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html">SKIP</a> ([fdo#112022] / [i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> ([i915#5286]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#111615] / [i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#5190]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#4538]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#109315] / [i915#5190]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#111615]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@kms_ccs@pipe-a-random-ccs-data-yf-tiled-ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-6/igt@kms_ccs@pipe-b-bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@kms_ccs@pipe-b-ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> ([i915#5354]) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> ([i915#5354]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk9/igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> ([fdo#109271]) +230 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-10/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#4087] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> ([fdo#111827]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> ([fdo#111827]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-3/igt@kms_chamelium_color@ctm-max.html">SKIP</a> ([fdo#111827])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@kms_chamelium_color@ctm-max.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_content_protection@lic.html">SKIP</a> ([i915#7118]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> ([i915#3555]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4213])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [i915#5354]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([i915#9809]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> ([fdo#111767] / [fdo#111825])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-1-pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb7/igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-1-pipe-b-vga-1.html">FAIL</a> ([i915#9841]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#3555] / [i915#8812])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([fdo#109274] / [i915#3637])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#111825]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> ([fdo#111825] / [i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> ([fdo#109274]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> ([fdo#109315]) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825]) +20 other tests skip</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109271]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#3458]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#110189]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([i915#3023]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109315]) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> ([fdo#109280]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4070] / [i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-1/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> ([fdo#109289]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> ([fdo#109289])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-7/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#7862]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html">SKIP</a> ([i915#3582]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#9423]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html">SKIP</a> ([i915#9423]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#2575] / [i915#9423]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#5235]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> ([i915#3555] / [i915#5235])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> ([i915#5235]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@kms_pm_rpm@i2c.html">FAIL</a> ([i915#8717])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9980]) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109293] / [fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-16/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109293] / [fdo#109506]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-15/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#9683]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#4235] / [i915#5190])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([fdo#111615] / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-3.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@kms_vrr@flip-dpms.html">SKIP</a> ([i915#3555] / [i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-7/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk4/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@perf@invalid-remove-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html">SKIP</a> ([i915#5608]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@perf@oa-exponents.html">SKIP</a> ([i915#5608]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-mtlp-4/igt@perf_pmu@render-node-busy-idle@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@perf_pmu@render-node-busy-idle@ccs0.html">FAIL</a> ([i915#4349])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-19/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-pad:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-14/igt@v3d/v3d_perfmon@get-values-invalid-pad.html">SKIP</a> ([i915#2575]) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-9/igt@v3d/v3d_perfmon@get-values-invalid-pad.html">SKIP</a> ([fdo#109315] / [i915#2575]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-pad:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-8/igt@v3d/v3d_submit_cl@bad-multisync-pad.html">SKIP</a> ([i915#2575]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@multi-and-single-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@v3d/v3d_submit_cl@multi-and-single-sync.html">SKIP</a> ([fdo#109315]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-1/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> ([i915#2575]) +253 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-15/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html">SKIP</a> ([i915#7711]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-6/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html">SKIP</a> ([i915#7711]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-flags:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@vc4/vc4_tiling@get-bad-flags.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-3/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-mtlp-6/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a> ([i915#7711]) +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#7297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-19/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-18/igt@gem_eio@unwedge-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9200] / [i915#9849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> ([i915#10031]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> ([i915#10007]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#9593]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@api_intel_bb@render-ccs.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> ([i915#8414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> ([i915#5608]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_busy@semaphore.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html">INCOMPLETE</a> ([i915#9364]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> ([i915#3539] / [i915#4852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> ([i915#2575]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@gem_exec_fence@concurrent.html">SKIP</a> ([i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_fence@concurrent.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-3/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#2575]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#2575]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@gem_media_vme.html">SKIP</a> ([i915#284]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_media_vme.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-odd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@gem_mmap_gtt@big-copy-odd.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_mmap_gtt@big-copy-odd.html">SKIP</a> ([i915#2575]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_mmap_wc@bad-size.html">SKIP</a> ([i915#4083]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_mmap_wc@bad-size.html">SKIP</a> ([i915#2575]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#2575]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-glk8/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-glk9/igt@gem_pread@exhaustion.html">INCOMPLETE</a> ([i915#10042])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#2575]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html">FAIL</a> ([i915#5889]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-3/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#2575]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([i915#3297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2575]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a> ([i915#2681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#2575] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#4212]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#109315]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109315] / [i915#5190]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#109315] / [i915#5190]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-3/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> ([fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> ([i915#2575]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> ([i915#2575]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-3/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#2575])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg1-12/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg1-16/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_content_protection@type1.html">SKIP</a> ([i915#2575]) +3 other tests skip</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-snb1/igt@kms_content_protection@type1.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-snb7/igt@kms_content_protection@type1.html">INCOMPLETE</a> ([i915#8816])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([i915#2575]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> ([fdo#109315]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([fdo#110189] / [i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-11/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([i915#2575]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([fdo#109274] / [fdo#111767]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> ([fdo#109315]) +113 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109315]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> ([fdo#109315]) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10494/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#2575]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14100/shard-dg2-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-t">SKIP</a> ([i915#2575])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2831164008850664203==--
