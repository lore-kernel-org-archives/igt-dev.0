Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6055205183613261078=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 02 Aug 2023 13:50:22 -0000
Message-ID: <169098422239.6327.4280108911122438098@emeril.freedesktop.org>
References: <20230802102059.3650360-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230802102059.3650360-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIFhF?=
 =?utf-8?q?_suppor_for_display_tests_=28rev2=29?=
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

--===============6055205183613261078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add XE suppor for display tests (rev2)
URL   : https://patchwork.freedesktop.org/series/119525/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13459_full -> IGTPW_9494_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9494_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9494_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9494_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [PASS][1] -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@i915_suspend@basic-s3-without-i915.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-snb:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-snb2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb7/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-mtlp:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@perf_pmu@rc6-all-gts.html

  
Known issues
------------

  Here are the changes found in IGTPW_9494_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#8411])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][10] ([i915#6122])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@api_intel_bb@render-ccs.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2:          NOTRUN -> [FAIL][11] ([i915#6121]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#7701])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8414]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8414]) +23 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@fbdev@eof:
    - shard-dg2:          [PASS][15] -> [SKIP][16] ([i915#2582]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@fbdev@eof.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@fbdev@eof.html

  * igt@feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#4854])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#1839]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@feature_discovery@display-3x.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#3281]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@gem_bad_reloc@negative-reloc-lut.html
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#3281]) +5 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8562])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([fdo#109314])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [PASS][23] -> [FAIL][24] ([i915#2410]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-2/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8555]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#8555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#1099]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [PASS][29] -> [FAIL][30] ([i915#7816]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#4812]) +4 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#6334])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#6344])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4473] / [i915#4771]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852]) +8 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#7697]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@no-vebox:
    - shard-dg2:          [PASS][38] -> [SKIP][39] ([fdo#109283] / [i915#2575])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_exec_params@no-vebox.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([fdo#109283] / [i915#5107])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3281]) +21 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#3281]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4537] / [i915#4812]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@preempt-self:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#2575]) +427 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [PASS][45] -> [FAIL][46] ([i915#7327])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-2/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_exec_schedule@semaphore-noskip:
    - shard-dg2:          [PASS][47] -> [SKIP][48] ([i915#2575]) +135 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_exec_schedule@semaphore-noskip.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_schedule@semaphore-noskip.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4860]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4613])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#5775]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#4613]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#4613]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-apl1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#8289])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#284])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-3/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4077]) +17 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4077]) +10 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4083]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4083]) +9 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#3282]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#3282])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3282]) +9 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@gem_pread@snoop.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4270])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4270]) +6 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#4270]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-10/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4270])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#8428]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#2575] / [i915#5190]) +11 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4079])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4079])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4885])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4885])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4879])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3297]) +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#3297]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3297] / [i915#4880])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#3297] / [i915#4880])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3297] / [i915#4958])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-6/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen3_render_linear_blits:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([fdo#109289])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([fdo#109289]) +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#2856]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#2527])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#2527] / [i915#2856]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-8/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#2856]) +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_hangman@engine-engine-hang@vcs0:
    - shard-mtlp:         [PASS][86] -> [FAIL][87] ([i915#7069])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html

  * igt@i915_module_load@load:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#6227])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_module_load@load.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#7091])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#7561])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-4/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#5354] / [i915#7561]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@i915_pm_backlight@fade-with-suspend.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#658]) +7 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#5978])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][94] -> [SKIP][95] ([fdo#109271])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-apl6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-dg2:          [PASS][96] -> [SKIP][97] ([i915#1937])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
    - shard-dg1:          [PASS][98] -> [SKIP][99] ([i915#1937])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-17/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#1902])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([fdo#109289]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-10/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - shard-glk:          [PASS][102] -> [FAIL][103] ([i915#3591])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk9/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
    - shard-dg1:          [PASS][104] -> [FAIL][105] ([i915#3591])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][106] -> [SKIP][107] ([i915#5174]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [PASS][108] -> [SKIP][109] ([i915#1397]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-6/igt@i915_pm_rpm@dpms-non-lpsp.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-dg1:          [PASS][110] -> [SKIP][111] ([i915#1397]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-13/igt@i915_pm_rpm@dpms-non-lpsp.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#5174]) +6 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#1397]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#1397])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([fdo#109506]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#6621]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][117] ([i915#8320])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-6/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#8925])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@i915_pm_rps@thresholds@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#8437])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#6188])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-mtlp:         [PASS][121] -> [DMESG-FAIL][122] ([i915#7059])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@i915_selftest@live@gt_mocs.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#4212])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4215] / [i915#5190])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4212])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#8502]) +7 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc_ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#8502]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][128] ([i915#8247]) +3 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][129] ([i915#8247]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb7/igt@kms_async_flips@crc@pipe-b-vga-1.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][130] ([i915#8561]) +3 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#1769])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#1769] / [i915#3555])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#5286])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         [PASS][134] -> [FAIL][135] ([i915#3743]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [FAIL][136] ([i915#3743]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#4538] / [i915#5286])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([fdo#111614] / [i915#3638])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-tglu:         NOTRUN -> [SKIP][139] ([fdo#111614])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-5/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([fdo#111614]) +9 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([fdo#111614])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([fdo#109315] / [i915#5190]) +18 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#5190]) +22 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([fdo#111615]) +5 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([fdo#110723])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
    - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#111615])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#4538] / [i915#5190]) +12 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([fdo#111615])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#6187]) +1 similar issue
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#2705])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#3886] / [i915#6095]) +6 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3689] / [i915#3886] / [i915#5354]) +18 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#3689] / [i915#5354] / [i915#6095]) +4 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-4/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][154] ([fdo#109271] / [i915#3886]) +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-apl4/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#5354] / [i915#6095]) +4 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-7/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-9/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#5354] / [i915#6095]) +11 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-8/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#5354]) +7 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3689] / [i915#5354]) +41 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#5354] / [i915#6095]) +3 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#6095]) +15 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#4087] / [i915#7213])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([fdo#111827]) +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([fdo#111827])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7828]) +18 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#7828])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#7828])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#7828]) +3 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#7828]) +1 similar issue
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-19/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@mei_interface:
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#8063])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@srm:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#6944])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#7118])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_content_protection@uevent.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#7118])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_content_protection@uevent.html
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#6944] / [i915#7116] / [i915#7118])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([fdo#109279] / [i915#3359])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][177] ([fdo#109279] / [i915#3359])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#8814]) +1 similar issue
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#3359])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3555]) +1 similar issue
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#3555])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#3359])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#3555]) +7 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#3546])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([fdo#109274] / [i915#5354]) +4 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][187] -> [FAIL][188] ([i915#2346])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#4103] / [i915#4213]) +1 similar issue
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#8588])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#8812])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#3840]) +1 similar issue
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#4881]) +1 similar issue
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#3637]) +3 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([fdo#111825]) +3 similar issues
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-15/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([fdo#109274] / [fdo#111767])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([fdo#109274]) +8 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([fdo#111825]) +1 similar issue
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@kms_flip@2x-plain-flip.html
    - shard-tglu:         NOTRUN -> [SKIP][199] ([fdo#109274] / [i915#3637]) +1 similar issue
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
    - shard-glk:          [PASS][200] -> [FAIL][201] ([i915#2122])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk5/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-glk7/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#2587] / [i915#2672])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#2672])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#2672]) +4 similar issues
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#8810]) +1 similar issue
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][206] -> [SKIP][207] ([fdo#109315]) +27 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          NOTRUN -> [FAIL][208] ([i915#6880])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#5354]) +87 similar issues
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#8708]) +42 similar issues
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2:          NOTRUN -> [FAIL][211] ([fdo#103375]) +1 similar issue
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          [PASS][212] -> [FAIL][213] ([i915#6880])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#5460])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([fdo#111825] / [i915#1825]) +8 similar issues
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#8708]) +3 similar issues
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([fdo#109315]) +170 similar issues
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#1825]) +19 similar issues
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([fdo#109280]) +12 similar issues
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#3023]) +4 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#3458]) +32 similar issues
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#6118])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#3555] / [i915#8228]) +1 similar issue
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#8228])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-1/igt@kms_hdr@static-toggle.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#4816])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-snb:          NOTRUN -> [DMESG-WARN][226] ([i915#8841]) +7 similar issues
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#8821])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([fdo#109274])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#6953])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][230] -> [FAIL][231] ([i915#8292])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#5176]) +3 similar issues
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#5176]) +5 similar issues
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#5176]) +15 similar issues
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-15/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#5235]) +15 similar issues
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#5235]) +3 similar issues
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#5235]) +3 similar issues
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#5235]) +11 similar issues
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#5235]) +3 similar issues
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][240] ([fdo#109271]) +260 similar issues
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][241] ([fdo#109271]) +47 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-apl6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#6524])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#7011])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([fdo#111068] / [i915#658])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-tglu:         NOTRUN -> [SKIP][245] ([fdo#111068] / [i915#658])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#4348])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@basic:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#1072]) +1 similar issue
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@kms_psr@basic.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#1072]) +14 similar issues
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([fdo#110189]) +7 similar issues
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-3/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr@sprite_blt:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#1072])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_psr@sprite_blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#5461] / [i915#658])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-rkl:          [PASS][252] -> [ABORT][253] ([i915#8311])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-7/igt@kms_rotation_crc@bad-pixel-format.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#4235]) +2 similar issues
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#4235] / [i915#5190]) +1 similar issue
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-rkl:          [PASS][256] -> [ABORT][257] ([i915#8178])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-1/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#4235]) +1 similar issue
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#3555])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_format:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#8661])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@kms_selftest@drm_format.html
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#8661])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-5/igt@kms_selftest@drm_format.html

  * igt@kms_selftest@drm_plane:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#8661]) +4 similar issues
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_selftest@drm_plane.html

  * igt@kms_selftest@framebuffer:
    - shard-snb:          NOTRUN -> [SKIP][263] ([fdo#109271] / [i915#8661])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb2/igt@kms_selftest@framebuffer.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][264] ([IGT#2])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#8623]) +1 similar issue
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([fdo#109309])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-dg1:          [PASS][267] -> [DMESG-WARN][268] ([i915#4423]) +1 similar issue
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-15/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-idle:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#4070] / [i915#6768]) +2 similar issues
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@kms_vblank@pipe-c-ts-continuation-idle.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#4070] / [i915#533] / [i915#6768])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@kms_vblank@pipe-d-query-idle-hang.html

  * igt@kms_vrr@flip-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#8808])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#2437])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_writeback@writeback-check-output.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([fdo#109289]) +2 similar issues
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#2436])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#2434])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@perf@mi-rpc.html

  * igt@perf@non-system-wide-paranoid:
    - shard-dg2:          [PASS][276] -> [SKIP][277] ([i915#5608]) +4 similar issues
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@perf@non-system-wide-paranoid.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@perf@non-system-wide-paranoid.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#2433])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-1/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][279] ([i915#6806])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@interrupts:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#5608]) +25 similar issues
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@perf_pmu@interrupts.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][281] ([i915#5793] / [i915#6121])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt1:
    - shard-mtlp:         [PASS][282] -> [SKIP][283] ([i915#8537]) +2 similar issues
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@perf_pmu@rc6@runtime-pm-long-gt1.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][284] ([i915#5493])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([fdo#109291])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@prime_udl.html
    - shard-rkl:          NOTRUN -> [SKIP][286] ([fdo#109291])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@prime_udl.html
    - shard-tglu:         NOTRUN -> [SKIP][287] ([fdo#109291])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-7/igt@prime_udl.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#3291] / [i915#3708]) +2 similar issues
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#3708] / [i915#4077])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@coherency-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][290] ([i915#8445])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-1/igt@prime_vgem@coherency-blt.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#4818])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_get_bo_offset@create-get-offsets:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([fdo#109315] / [i915#2575]) +5 similar issues
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-2/igt@v3d/v3d_get_bo_offset@create-get-offsets.html

  * igt@v3d/v3d_get_param@get-bad-flags:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([fdo#109315]) +4 similar issues
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@v3d/v3d_get_param@get-bad-flags.html

  * igt@v3d/v3d_get_param@get-bad-param:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#2575]) +5 similar issues
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@v3d/v3d_get_param@get-bad-param.html

  * igt@vc4/vc4_perfmon@create-single-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#7711]) +4 similar issues
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@vc4/vc4_perfmon@create-single-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#7711])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html

  * igt@vc4/vc4_tiling@get-bad-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#7711]) +23 similar issues
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@vc4/vc4_tiling@get-bad-modifier.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#2575]) +1 similar issue
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-2/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][299] ([i915#7742]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][301] ([i915#6268]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [ABORT][303] ([i915#7975] / [i915#8213] / [i915#8398]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-10/igt@gem_eio@hibernate.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-4/igt@gem_eio@hibernate.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][305] ([i915#5784]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-15/igt@gem_eio@unwedge-stress.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@gem_eio@unwedge-stress.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [DMESG-WARN][307] ([i915#4936] / [i915#5493]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-snb:          [ABORT][309] ([i915#5161]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@i915_hangman@detector@vcs0:
    - shard-mtlp:         [FAIL][311] ([i915#8456]) -> [PASS][312] +2 similar issues
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@i915_hangman@detector@vcs0.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@i915_hangman@detector@vcs0.html

  * igt@i915_hangman@gt-engine-hang@vcs0:
    - shard-mtlp:         [FAIL][313] ([i915#7069]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@i915_hangman@gt-engine-hang@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][315] ([i915#8489] / [i915#8668]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - shard-mtlp:         [FAIL][317] ([i915#8691]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-2/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][319] ([i915#1397]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_pm_rpm@dpms-lpsp.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglu:         [FAIL][321] ([i915#7940]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-9/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][323] ([i915#1397]) -> [PASS][324] +3 similar issues
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
    - shard-dg1:          [FAIL][325] ([i915#7940]) -> [PASS][326] +1 similar issue
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][327] ([i915#1397]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@slpc:
    - shard-mtlp:         [DMESG-WARN][329] ([i915#6367]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@slpc.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@i915_selftest@live@slpc.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [DMESG-FAIL][331] ([i915#6763]) -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@workarounds.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@forcewake:
    - shard-dg2:          [FAIL][333] ([fdo#103375]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_suspend@forcewake.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][335] ([i915#5138]) -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         [FAIL][337] ([i915#3743]) -> [PASS][338] +1 similar issue
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][339] ([i915#2346]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
    - shard-glk:          [FAIL][341] ([i915#79]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-dg2:          [FAIL][343] ([i915#6880]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@perf_pmu@busy-double-start@ccs3:
    - shard-dg2:          [FAIL][345] ([i915#4349]) -> [PASS][346] +1 similar issue
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@perf_pmu@busy-double-start@ccs3.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@perf_pmu@busy-double-start@ccs3.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [FAIL][347] ([i915#4349]) -> [PASS][348] +2 similar issues
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-15/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@most-busy-check-all@bcs0:
    - shard-snb:          [ABORT][349] -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-snb5/igt@perf_pmu@most-busy-check-all@bcs0.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb5/igt@perf_pmu@most-busy-check-all@bcs0.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][351] ([i915#8411]) -> [SKIP][352] ([i915#2575]) +1 similar issue
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          [SKIP][353] ([i915#8414]) -> [SKIP][354] ([i915#5608]) +3 similar issues
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@drm_fdinfo@all-busy-idle-check-all.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [ABORT][355] ([i915#7461]) -> [SKIP][356] ([i915#2575])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          [SKIP][357] ([i915#8555]) -> [SKIP][358] ([i915#2575]) +1 similar issue
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-stop.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          [SKIP][359] ([i915#280]) -> [SKIP][360] ([i915#2575])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_ctx_sseu@mmap-args.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][361] ([i915#4771]) -> [SKIP][362] ([i915#2575])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_balancer@bonded-pair.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          [SKIP][363] ([i915#4812]) -> [SKIP][364] ([i915#2575])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_exec_balancer@bonded-semaphore.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          [SKIP][365] ([i915#3539]) -> [SKIP][366] ([i915#2575]) +1 similar issue
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          [SKIP][367] ([i915#3539] / [i915#4852]) -> [SKIP][368] ([i915#2575]) +3 similar issues
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_flush@basic-uc-rw-default.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          [SKIP][369] ([i915#3281]) -> [SKIP][370] ([i915#2575]) +8 similar issues
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [ABORT][371] ([i915#7392] / [i915#8131]) -> [TIMEOUT][372] ([i915#7392])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][373] ([i915#5493]) -> [DMESG-WARN][374] ([i915#1982] / [i915#4936] / [i915#5493])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg2:          [SKIP][375] ([i915#4077]) -> [SKIP][376] ([i915#2575]) +7 similar issues
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_mmap_gtt@fault-concurrent-y.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          [SKIP][377] ([i915#4083]) -> [SKIP][378] ([i915#2575]) +9 similar issues
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_mmap_wc@copy.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg2:          [SKIP][379] ([i915#3282]) -> [SKIP][380] ([i915#2575]) +2 similar issues
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-snoop.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          [SKIP][381] ([i915#4270]) -> [SKIP][382] ([i915#2575]) +1 similar issue
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          [SKIP][383] ([i915#5190]) -> [SKIP][384] ([i915#2575] / [i915#5190]) +5 similar issues
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          [SKIP][385] ([i915#4885]) -> [SKIP][386] ([i915#2575])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_softpin@evict-snoop.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_softpin@evict-snoop.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          [FAIL][387] ([i915#5889]) -> [SKIP][388] ([i915#2575])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          [SKIP][389] ([i915#4079]) -> [SKIP][390] ([i915#2575]) +2 similar issues
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_tiled_pread_pwrite.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          [SKIP][391] ([i915#3297]) -> [SKIP][392] ([i915#2575]) +2 similar issues
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          [SKIP][393] ([i915#3297] / [i915#4880]) -> [SKIP][394] ([i915#2575])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg2:          [SKIP][395] ([i915#2856]) -> [SKIP][396] ([i915#2575]) +2 similar issues
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gen9_exec_parse@bb-start-out.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          [SKIP][397] ([i915#7178]) -> [SKIP][398] ([i915#4423] / [i915#7178])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_module_load@resize-bar.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-17/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-dg2:          [SKIP][399] ([i915#5354] / [i915#7561]) -> [SKIP][400] ([i915#2575])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@i915_pm_backlight@basic-brightness.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][401] ([i915#1397]) -> [SKIP][402] ([i915#5174])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          [SKIP][403] ([i915#4387]) -> [SKIP][404] ([i915#2575])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@i915_pm_sseu@full-enable.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          [SKIP][405] ([i915#6188]) -> [SKIP][406] ([i915#2575])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_query@query-topology-coherent-slice-mask.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg2:          [SKIP][407] ([fdo#109303]) -> [SKIP][408] ([i915#2575])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@i915_query@query-topology-known-pci-ids.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          [SKIP][409] ([fdo#109302]) -> [SKIP][410] ([i915#2575])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_query@query-topology-unsupported.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          [SKIP][411] ([i915#4212]) -> [SKIP][412] ([i915#2575]) +1 similar issue
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_addfb_basic@clobberred-modifier.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          [SKIP][413] ([i915#6228]) -> [SKIP][414] ([i915#2575])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_async_flips@invalid-async-flip.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          [SKIP][415] ([i915#404]) -> [SKIP][416] ([i915#2575])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][417] ([fdo#111614]) -> [SKIP][418] ([fdo#109315]) +5 similar issues
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          [SKIP][419] ([i915#5190]) -> [SKIP][420] ([fdo#109315] / [i915#5190]) +3 similar issues
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          [SKIP][421] ([i915#4538] / [i915#5190]) -> [SKIP][422] ([fdo#109315] / [i915#5190]) +4 similar issues
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          [SKIP][423] ([i915#3689] / [i915#3886] / [i915#5354]) -> [SKIP][424] ([fdo#109315]) +11 similar issues
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:
    - shard-dg2:          [SKIP][425] ([i915#3689] / [i915#5354]) -> [SKIP][426] ([fdo#109315]) +22 similar issues
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          [SKIP][427] ([i915#7828]) -> [SKIP][428] ([i915#2575]) +8 similar issues
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-fast.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          [SKIP][429] ([i915#7118]) -> [SKIP][430] ([i915#2575])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@kms_content_protection@atomic.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          [SKIP][431] ([i915#3299]) -> [SKIP][432] ([i915#2575])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-1.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg1:          [SKIP][433] ([i915#7116]) -> [SKIP][434] ([fdo#109300])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-16/igt@kms_content_protection@mei_interface.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-17/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          [SKIP][435] ([i915#3359]) -> [SKIP][436] ([i915#2575])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          [SKIP][437] ([fdo#109274] / [i915#5354]) -> [SKIP][438] ([i915#2575]) +1 similar issue
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          [SKIP][439] ([fdo#109274] / [fdo#111767] / [i915#5354]) -> [SKIP][440] ([i915#2575])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [SKIP][441] ([i915#3555]) -> [SKIP][442] ([i915#2575]) +4 similar issues
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          [SKIP][443] ([i915#3555] / [i915#3840]) -> [SKIP][444] ([fdo#109315]) +1 similar issue
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_dsc@dsc-with-bpc.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          [SKIP][445] ([i915#3469]) -> [SKIP][446] ([fdo#109315])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_fbcon_fbt@psr-suspend.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          [SKIP][447] ([i915#8381]) -> [SKIP][448] ([i915#2575]) +1 similar issue
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_flip@2x-flip-vs-fences.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2:          [SKIP][449] ([fdo#109274]) -> [SKIP][450] ([i915#2575]) +2 similar issues
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][451] ([i915#5354]) -> [SKIP][452] ([fdo#109315]) +43 similar issues
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][453] ([i915#8708]) -> [SKIP][454] ([fdo#109315]) +17 similar issues
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][455] ([i915#3458]) -> [SKIP][456] ([fdo#109315]) +16 similar issues
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][457] ([i915#3555] / [i915#8228]) -> [SKIP][458] ([i915#2575]) +2 similar issues
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/index.html

--===============6055205183613261078==
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
<tr><td><b>Series:</b></td><td>Add XE suppor for display tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119525/">https://patchwork.freedesktop.org/series/119525/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13459_full -&gt; IGTPW_9494_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9494_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9494_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9494_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-snb2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb7/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@perf_pmu@rc6-all-gts.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9494_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html">FAIL</a> ([i915#6121]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> ([i915#8414]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> ([i915#8414]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@fbdev@eof.html">SKIP</a> ([i915#2582]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +1 similar issue</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-2/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> ([i915#2410]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb5/igt@gem_ctx_persistence@hostile.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> ([i915#7816]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#4473] / [i915#4771]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_exec_params@no-vebox.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283] / [i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283] / [i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> ([i915#3281]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-self:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html">SKIP</a> ([i915#2575]) +427 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-2/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> ([i915#7327])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-noskip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_exec_schedule@semaphore-noskip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_schedule@semaphore-noskip.html">SKIP</a> ([i915#2575]) +135 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#5775]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-apl1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-3/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#4077]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@gem_mmap_gtt@flink-race.html">SKIP</a> ([i915#4077]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@gem_mmap_wc@bad-offset.html">SKIP</a> ([i915#4083]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> ([i915#4083]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@gem_partial_pwrite_pread@write.html">SKIP</a> ([i915#3282]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-10/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#8428]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-6/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-8/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html">FAIL</a> ([i915#7069])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-4/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@i915_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#5354] / [i915#7561]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@i915_pm_dc@dc5-psr.html">SKIP</a> ([i915#658]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([i915#1937])</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-17/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-10/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk9/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> ([i915#3591])</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> ([i915#3591])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#5174]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-6/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#1397]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-13/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#1397]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> ([i915#5174]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#1397]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-6/igt@i915_pm_rps@reset.html">INCOMPLETE</a> ([i915#8320])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@i915_pm_rps@thresholds@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#8437])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> ([i915#7059])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc_ccs.html">SKIP</a> ([i915#8502]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html">SKIP</a> ([i915#8502]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8247]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb7/igt@kms_async_flips@crc@pipe-b-vga-1.html">FAIL</a> ([i915#8247]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@kms_async_flips@crc@pipe-d-edp-1.html">DMESG-FAIL</a> ([i915#8561]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> ([i915#3743]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-5/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> ([fdo#109315] / [i915#5190]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#110723])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([i915#6187]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#6095]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-4/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-apl4/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-7/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-9/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-8/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#5354]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +41 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#6095]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#4087] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> ([fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> ([i915#7828]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-19/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#8063])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-3/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#8814]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([i915#3546])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [i915#5354]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-15/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#111825]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([fdo#109274]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#111825]) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-5/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#109274] / [i915#3637]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk5/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-glk7/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> ([fdo#109315]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +87 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> ([fdo#103375]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([i915#5460])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109315]) +170 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> ([fdo#109280]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> ([i915#3023]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> ([i915#3458]) +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-6/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-1/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-WARN</a> ([i915#8841]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2.html">SKIP</a> ([i915#5176]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5176]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-15/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#5176]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5235]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#5235]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html">SKIP</a> ([fdo#109271]) +260 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-apl6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1.html">SKIP</a> ([fdo#109271]) +47 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_prime@d3hot.html">SKIP</a> ([i915#7011])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#4348])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@kms_psr@basic.html">SKIP</a> ([i915#1072]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([i915#1072]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-3/igt@kms_psr@psr2_sprite_render.html">SKIP</a> ([fdo#110189]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_psr@sprite_blt.html">SKIP</a> ([i915#1072])</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#5461] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-7/igt@kms_rotation_crc@bad-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@kms_rotation_crc@bad-pixel-format.html">ABORT</a> ([i915#8311])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> ([i915#4235]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@kms_rotation_crc@sprite-rotation-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-1/igt@kms_rotation_crc@sprite-rotation-90.html">ABORT</a> ([i915#8178])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> ([i915#4235]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@kms_selftest@drm_format.html">SKIP</a> ([i915#8661])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-5/igt@kms_selftest@drm_format.html">SKIP</a> ([i915#8661])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_selftest@drm_plane.html">SKIP</a> ([i915#8661]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@framebuffer:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb2/igt@kms_selftest@framebuffer.html">SKIP</a> ([fdo#109271] / [i915#8661])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-15/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">DMESG-WARN</a> ([i915#4423]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@kms_vblank@pipe-c-ts-continuation-idle.html">SKIP</a> ([i915#4070] / [i915#6768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@kms_vblank@pipe-d-query-idle-hang.html">SKIP</a> ([i915#4070] / [i915#533] / [i915#6768])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@kms_vrr@flip-suspend.html">SKIP</a> ([i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-6/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@perf@non-system-wide-paranoid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@perf@non-system-wide-paranoid.html">SKIP</a> ([i915#5608]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-1/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-2/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#6806])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@interrupts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@perf_pmu@interrupts.html">SKIP</a> ([i915#5608]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@perf_pmu@module-unload.html">FAIL</a> ([i915#5793] / [i915#6121])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">SKIP</a> ([i915#8537]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@prime_udl.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@prime_udl.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-7/igt@prime_udl.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@prime_vgem@basic-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-1/igt@prime_vgem@coherency-blt.html">FAIL</a> ([i915#8445])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_bo_offset@create-get-offsets:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-2/igt@v3d/v3d_get_bo_offset@create-get-offsets.html">SKIP</a> ([fdo#109315] / [i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-flags:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@v3d/v3d_get_param@get-bad-flags.html">SKIP</a> ([fdo#109315]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@v3d/v3d_get_param@get-bad-param.html">SKIP</a> ([i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a> ([i915#7711]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html">SKIP</a> ([i915#7711])</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-8/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> ([i915#7711]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-2/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213] / [i915#8398]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-4/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-15/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-12/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html">ABORT</a> ([i915#5161]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@detector@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@i915_hangman@detector@vcs0.html">FAIL</a> ([i915#8456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-5/igt@i915_hangman@detector@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html">FAIL</a> ([i915#7069]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@i915_hangman@gt-engine-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#8489] / [i915#8668]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-2/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">FAIL</a> ([i915#8691]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-10/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-tglu-9/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-rkl-2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> ([i915#6367]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> ([i915#6763]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-2/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_suspend@forcewake.html">FAIL</a> ([fdo#103375]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@perf_pmu@busy-double-start@ccs3.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-3/igt@perf_pmu@busy-double-start@ccs3.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-15/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-snb5/igt@perf_pmu@most-busy-check-all@bcs0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-snb5/igt@perf_pmu@most-busy-check-all@bcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> ([i915#8414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> ([i915#5608]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#7461]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#2575]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> ([i915#7392] / [i915#8131]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-priority-all.html">TIMEOUT</a> ([i915#7392])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#1982] / [i915#4936] / [i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> ([i915#2575]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#2575]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html">FAIL</a> ([i915#5889]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2856]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#7178]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-17/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#4423] / [i915#7178])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354] / [i915#7561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#5174])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#4212]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#109315]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109315] / [i915#5190]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109315] / [i915#5190]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109315]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> ([fdo#109315]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#2575]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-16/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#7116]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg1-17/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([fdo#109274] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([fdo#109315]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3469]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> ([fdo#109274]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109315]) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109315]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([fdo#109315]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9494/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6055205183613261078==--
