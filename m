Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3773914166122566682=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Date: Wed, 02 Aug 2023 12:50:33 -0000
Message-ID: <169098063317.6326.9758605961387819811@emeril.freedesktop.org>
References: <20230802083900.1175872-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230802083900.1175872-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_xe/xe=5Fsysfs=3A_Updated_tests?=
 =?utf-8?q?_to_use_xe=5Fsysfs=5Fgt=5Fopen?=
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

--===============3773914166122566682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] xe/xe_sysfs: Updated tests to use xe_sysfs_gt_open
URL   : https://patchwork.freedesktop.org/series/121877/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13459_full -> IGTPW_9493_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9493_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9493_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9493_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@suspend:
    - shard-dg1:          [PASS][1] -> [DMESG-WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-16/igt@gem_eio@suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-19/igt@gem_eio@suspend.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-dg2:          NOTRUN -> [SKIP][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_psr@psr2_suspend:
    - shard-mtlp:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_psr@psr2_suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_9493_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@default-alignment:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([fdo#109315]) +123 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@api_intel_allocator@default-alignment.html

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][8] ([i915#6122])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@api_intel_bb@render-ccs.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2:          NOTRUN -> [FAIL][9] ([i915#6121]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#7701])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8414]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-5/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414]) +42 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@fbdev@info:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#1849] / [i915#2582])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#2582])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@fbdev@nullptr.html

  * igt@fbdev@read:
    - shard-dg2:          [PASS][15] -> [SKIP][16] ([i915#2582])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@fbdev@read.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@fbdev@read.html

  * igt@feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#4854])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-10/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#1839]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@feature_discovery@display-3x.html

  * igt@feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#658]) +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@feature_discovery@psr1.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#3281]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-16/igt@gem_bad_reloc@negative-reloc-lut.html
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#3281]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8562])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_param@invalid-param-set:
    - shard-dg2:          [PASS][24] -> [SKIP][25] ([i915#2575]) +169 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_ctx_param@invalid-param-set.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_ctx_param@invalid-param-set.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#8555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#8555])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#1099]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglu:         [PASS][32] -> [TIMEOUT][33] ([i915#3063] / [i915#7941])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-5/igt@gem_eio@unwedge-stress.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4771])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4812])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#6334])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#6344])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#6344])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#2842]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3539])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-rkl:          [PASS][42] -> [FAIL][43] ([i915#2842])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4473] / [i915#4771]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#7697]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@no-vebox:
    - shard-dg2:          [PASS][47] -> [SKIP][48] ([fdo#109283] / [i915#2575])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_exec_params@no-vebox.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([fdo#109283] / [i915#2575])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3281]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +14 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4537] / [i915#4812]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@preempt-self:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#2575]) +557 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][54] ([i915#7975] / [i915#8213])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-tglu:         [PASS][55] -> [INCOMPLETE][56] ([i915#6755] / [i915#7392])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-7/igt@gem_exec_whisper@basic-fds-priority-all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-2/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4613])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#5775]) +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4613]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#4613])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#4613]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#8289])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#284])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4077]) +13 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4077]) +10 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4083]) +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4083]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-1/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3282]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-4/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3282]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3282]) +11 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_pread@snoop.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4270])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4270])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-1/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#4270]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#8428]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#2575] / [i915#5190]) +12 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4079])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4079]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4885])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3297])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#3297]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3297] / [i915#4880])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3297] / [i915#4880])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3297]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3297] / [i915#4958])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#3297])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([fdo#109289]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#2856]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#2856]) +6 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#2527])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#2527] / [i915#2856]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-2/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_hangman@engine-engine-hang@vcs0:
    - shard-mtlp:         [PASS][93] -> [FAIL][94] ([i915#7069])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html

  * igt@i915_module_load@load:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#6227])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_module_load@load.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#7091])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_backlight@fade:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#5354] / [i915#7561])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@i915_pm_backlight@fade.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#7561])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][99] -> [SKIP][100] ([fdo#109271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-dg1:          [PASS][101] -> [SKIP][102] ([i915#1937])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([fdo#109289]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - shard-tglu:         NOTRUN -> [SKIP][104] ([fdo#109289]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-dg1:          [PASS][105] -> [FAIL][106] ([i915#3591])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@i915_pm_rpm@basic-rte:
    - shard-dg1:          [PASS][107] -> [FAIL][108] ([i915#7940]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_rpm@basic-rte.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-16/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][109] -> [SKIP][110] ([i915#1397]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [PASS][111] -> [SKIP][112] ([i915#1397])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-6/igt@i915_pm_rpm@dpms-non-lpsp.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#5174]) +3 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@gem-execbuf@smem0:
    - shard-tglu:         [PASS][114] -> [FAIL][115] ([i915#7940]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-2/igt@i915_pm_rpm@gem-execbuf@smem0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@i915_pm_rpm@gem-execbuf@smem0.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#1397]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][117] -> [SKIP][118] ([i915#5174]) +5 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([fdo#109506])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-dg1:          [PASS][120] -> [DMESG-WARN][121] ([i915#4391])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-16/igt@i915_pm_rpm@system-suspend.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-19/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#6621]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#8925])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@i915_pm_rps@thresholds-idle-park@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#8437])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#6188])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-mtlp:         [PASS][126] -> [DMESG-FAIL][127] ([i915#7059])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_suspend@sysfs-reader:
    - shard-dg2:          NOTRUN -> [FAIL][128] ([fdo#103375])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4212])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#4212])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#8502]) +3 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#8502]) +7 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][133] ([i915#8247]) +3 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-13/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][134] ([i915#8247]) +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb2/igt@kms_async_flips@crc@pipe-b-vga-1.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][135] ([i915#8561]) +3 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#1769])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#1769] / [i915#3555])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([fdo#111614]) +7 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#5286])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-3/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         [PASS][140] -> [FAIL][141] ([i915#3743])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [FAIL][142] ([i915#3743]) +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4538] / [i915#5286])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([fdo#111614] / [i915#3638])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-tglu:         NOTRUN -> [SKIP][145] ([fdo#111614])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-7/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-mtlp:         [PASS][146] -> [FAIL][147] ([i915#5138])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([fdo#111614])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([fdo#109315] / [i915#5190]) +16 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([fdo#111615]) +5 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#5190]) +27 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4538] / [i915#5190]) +10 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][153] ([fdo#110723]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([fdo#111615])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([fdo#111615])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#6187]) +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#2705]) +1 similar issue
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#3886] / [i915#6095]) +5 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#3689] / [i915#5354] / [i915#6095]) +3 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-2/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][160] ([fdo#109271] / [i915#3886]) +1 similar issue
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl1/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#5354] / [i915#6095]) +4 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-4/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#3689] / [i915#3886] / [i915#5354]) +12 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#5354] / [i915#6095]) +11 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-7/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#5354]) +8 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#3689] / [i915#5354]) +35 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#5354] / [i915#6095]) +3 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#6095]) +12 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#4087] / [i915#7213])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-snb:          NOTRUN -> [SKIP][171] ([fdo#109271]) +233 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb6/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([fdo#111827])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#7828]) +16 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#7828])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#7828])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#7828]) +3 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#7828]) +1 similar issue
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-14/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@mei_interface:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#8063])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@srm:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#6944])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#7118])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-10/igt@kms_content_protection@uevent.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#7118])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_content_protection@uevent.html
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#6944] / [i915#7116] / [i915#7118])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([fdo#109279] / [i915#3359])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][184] ([fdo#109279] / [i915#3359])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#3359]) +3 similar issues
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#8814]) +2 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#3555]) +9 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3555]) +1 similar issue
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#3555])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
    - shard-apl:          [PASS][190] -> [ABORT][191] ([i915#180])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#4103] / [i915#4213])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-mtlp:         [PASS][194] -> [FAIL][195] ([i915#8248])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#3546])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([fdo#109274] / [i915#5354]) +8 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][198] -> [FAIL][199] ([i915#2346])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#8588])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#8812])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#3840]) +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#4881])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#3637]) +3 similar issues
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([fdo#111825]) +3 similar issues
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-13/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([fdo#109274]) +8 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([fdo#109274] / [fdo#111767])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([fdo#111825])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_flip@2x-plain-flip.html
    - shard-tglu:         NOTRUN -> [SKIP][209] ([fdo#109274] / [i915#3637]) +1 similar issue
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#8381])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][211] ([i915#8841]) +6 similar issues
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#2587] / [i915#2672])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#2672])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#2672]) +6 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#8810]) +1 similar issue
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([fdo#109285])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][217] -> [SKIP][218] ([fdo#109315]) +23 similar issues
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [FAIL][219] ([i915#6880])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#5354]) +76 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#8708]) +37 similar issues
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          [PASS][222] -> [FAIL][223] ([i915#6880])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#5460])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([fdo#111825] / [i915#1825]) +8 similar issues
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#8708]) +3 similar issues
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#1825]) +18 similar issues
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([fdo#109280]) +12 similar issues
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3023]) +5 similar issues
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#3458]) +27 similar issues
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#3555] / [i915#8228]) +1 similar issue
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#8228])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@kms_hdr@static-toggle.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#4816])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
    - shard-mtlp:         [PASS][234] -> [FAIL][235] ([i915#1623])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#8821])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#8806])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([fdo#109274])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#6953])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#5176]) +3 similar issues
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#5176]) +19 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#5176]) +9 similar issues
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#5235]) +3 similar issues
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#5235]) +5 similar issues
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#5235]) +3 similar issues
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#5235]) +15 similar issues
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#5235]) +7 similar issues
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][248] ([fdo#109271]) +45 similar issues
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#6524])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#6524] / [i915#6805])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([fdo#111068] / [i915#658])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-tglu:         NOTRUN -> [SKIP][252] ([fdo#111068] / [i915#658])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#4348])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@basic:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#1072]) +1 similar issue
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-18/igt@kms_psr@basic.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#1072]) +11 similar issues
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([fdo#110189]) +7 similar issues
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-7/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr@sprite_blt:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#1072])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-1/igt@kms_psr@sprite_blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#5461] / [i915#658])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#4235] / [i915#5190]) +1 similar issue
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#4235]) +1 similar issue
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#3555])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_format:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#8661])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@kms_selftest@drm_format.html
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#8661])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@kms_selftest@drm_format.html

  * igt@kms_selftest@drm_plane:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#8661]) +4 similar issues
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_selftest@drm_plane.html

  * igt@kms_selftest@framebuffer:
    - shard-snb:          NOTRUN -> [SKIP][265] ([fdo#109271] / [i915#8661])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb2/igt@kms_selftest@framebuffer.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][266] ([i915#5465]) +1 similar issue
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][267] ([IGT#2])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#8623]) +1 similar issue
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@pipe-c-ts-continuation-idle:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#4070] / [i915#6768]) +1 similar issue
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_vblank@pipe-c-ts-continuation-idle.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#4070] / [i915#533] / [i915#6768])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-4/igt@kms_vblank@pipe-d-query-idle-hang.html

  * igt@kms_vrr@flip-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#8808])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_vrr@flip-suspend.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([fdo#109289]) +2 similar issues
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#2436])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#2433])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg2:          [PASS][275] -> [SKIP][276] ([i915#5608]) +3 similar issues
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@perf_pmu@all-busy-check-all.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][277] ([i915#6806])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@interrupts:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#5608]) +26 similar issues
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@perf_pmu@interrupts.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][279] ([i915#5793] / [i915#6121])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#8516])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt1:
    - shard-mtlp:         [PASS][281] -> [SKIP][282] ([i915#8537]) +2 similar issues
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@perf_pmu@rc6@runtime-pm-long-gt1.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([fdo#109291])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@prime_udl.html
    - shard-rkl:          NOTRUN -> [SKIP][284] ([fdo#109291])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@prime_udl.html
    - shard-tglu:         NOTRUN -> [SKIP][285] ([fdo#109291])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@prime_udl.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#3708] / [i915#4077])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#3291] / [i915#3708])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][288] ([i915#8445])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@prime_vgem@coherency-blt.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-mtlp:         [PASS][289] -> [ABORT][290] ([i915#8521])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-1/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-5/igt@sysfs_preempt_timeout@timeout@vecs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#2575] / [i915#4818])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_get_bo_offset@create-get-offsets:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([fdo#109315] / [i915#2575]) +5 similar issues
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@v3d/v3d_get_bo_offset@create-get-offsets.html

  * igt@v3d/v3d_get_param@get-bad-flags:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([fdo#109315]) +4 similar issues
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-1/igt@v3d/v3d_get_param@get-bad-flags.html

  * igt@v3d/v3d_get_param@get-bad-param:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#2575]) +4 similar issues
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@v3d/v3d_get_param@get-bad-param.html

  * igt@vc4/vc4_perfmon@create-single-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#7711]) +4 similar issues
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@vc4/vc4_perfmon@create-single-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#7711])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html

  * igt@vc4/vc4_tiling@get-bad-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#7711]) +23 similar issues
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@vc4/vc4_tiling@get-bad-modifier.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#2575]) +1 similar issue
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-8/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][299] ([i915#6268]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [ABORT][301] ([i915#7975] / [i915#8213] / [i915#8398]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-10/igt@gem_eio@hibernate.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-6/igt@gem_eio@hibernate.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][303] ([i915#5784]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-15/igt@gem_eio@unwedge-stress.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [FAIL][305] ([fdo#103375] / [i915#8011]) -> [PASS][306] +1 similar issue
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][307] ([i915#5493]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [ABORT][309] ([i915#5566]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl6/igt@gen9_exec_parse@allowed-single.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl1/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_hangman@detector@vcs0:
    - shard-mtlp:         [FAIL][311] ([i915#8456]) -> [PASS][312] +2 similar issues
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@i915_hangman@detector@vcs0.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html

  * igt@i915_hangman@gt-engine-hang@vcs0:
    - shard-mtlp:         [FAIL][313] ([i915#7069]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@i915_hangman@gt-engine-hang@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][315] ([i915#8489] / [i915#8668]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglu:         [FAIL][317] ([i915#7940]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][319] ([i915#1397]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
    - shard-dg1:          [FAIL][321] ([i915#7940]) -> [PASS][322] +1 similar issue
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][323] ([i915#1397]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [FAIL][325] ([i915#6537]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl6/igt@i915_pm_rps@engine-order.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl3/igt@i915_pm_rps@engine-order.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][327] ([i915#5138]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         [FAIL][329] ([i915#3743]) -> [PASS][330] +1 similar issue
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][331] ([i915#2346]) -> [PASS][332] +1 similar issue
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
    - shard-glk:          [FAIL][333] ([i915#79]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
    - shard-dg2:          [FAIL][335] ([fdo#103375]) -> [PASS][336] +2 similar issues
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-dg2:          [FAIL][337] ([i915#6880]) -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@perf_pmu@busy-double-start@ccs3:
    - shard-dg2:          [FAIL][339] ([i915#4349]) -> [PASS][340] +5 similar issues
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@perf_pmu@busy-double-start@ccs3.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@perf_pmu@busy-double-start@ccs3.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [FAIL][341] ([i915#4349]) -> [PASS][342] +2 similar issues
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][343] ([i915#8411]) -> [SKIP][344] ([i915#2575])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          [SKIP][345] ([i915#8414]) -> [SKIP][346] ([i915#5608]) +1 similar issue
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@drm_fdinfo@virtual-busy-idle-all.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          [SKIP][347] ([i915#3936]) -> [SKIP][348] ([i915#2575])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_busy@semaphore.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_busy@semaphore.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          [SKIP][349] ([i915#8555]) -> [SKIP][350] ([i915#2575])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hostile.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          [SKIP][351] ([i915#4812]) -> [SKIP][352] ([i915#2575])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_exec_balancer@bonded-semaphore.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          [SKIP][353] ([i915#3539]) -> [SKIP][354] ([i915#2575]) +1 similar issue
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          [SKIP][355] ([i915#3539] / [i915#4852]) -> [SKIP][356] ([i915#2575]) +3 similar issues
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_flush@basic-uc-rw-default.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-dg2:          [SKIP][357] ([i915#7697]) -> [SKIP][358] ([i915#2575]) +1 similar issue
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_gttfill@multigpu-basic.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          [SKIP][359] ([fdo#112283]) -> [SKIP][360] ([i915#2575])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_exec_params@secure-non-master.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          [SKIP][361] ([i915#3281]) -> [SKIP][362] ([i915#2575]) +16 similar issues
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          [SKIP][363] ([i915#4537] / [i915#4812]) -> [SKIP][364] ([i915#2575])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_schedule@reorder-wide.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [ABORT][365] ([i915#7392] / [i915#8131]) -> [TIMEOUT][366] ([i915#7392])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          [SKIP][367] ([i915#4860]) -> [SKIP][368] ([i915#2575]) +2 similar issues
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-y.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          [SKIP][369] ([i915#4083]) -> [SKIP][370] ([i915#2575]) +4 similar issues
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@gem_mmap@big-bo.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg2:          [SKIP][371] ([i915#4077]) -> [SKIP][372] ([i915#2575]) +7 similar issues
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_mmap_gtt@fault-concurrent-y.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          [SKIP][373] ([i915#3282]) -> [SKIP][374] ([i915#2575]) +5 similar issues
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@gem_pwrite@basic-random.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          [SKIP][375] ([i915#4270]) -> [SKIP][376] ([i915#2575]) +2 similar issues
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - shard-dg2:          [SKIP][377] ([i915#5190]) -> [SKIP][378] ([i915#2575] / [i915#5190]) +2 similar issues
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          [SKIP][379] ([i915#3297]) -> [SKIP][380] ([i915#2575])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          [SKIP][381] ([i915#3297] / [i915#4880]) -> [SKIP][382] ([i915#2575])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-dg2:          [SKIP][383] ([fdo#109289]) -> [SKIP][384] ([i915#2575]) +3 similar issues
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gen7_exec_parse@basic-offset.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg2:          [SKIP][385] ([i915#2856]) -> [SKIP][386] ([i915#2575]) +1 similar issue
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gen9_exec_parse@bb-large.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gen9_exec_parse@bb-large.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-dg2:          [SKIP][387] ([i915#5354] / [i915#7561]) -> [SKIP][388] ([i915#2575]) +1 similar issue
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@i915_pm_backlight@basic-brightness.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-mtlp:         [SKIP][389] ([fdo#109289]) -> [SKIP][390] ([fdo#109289] / [i915#8403])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-dg2:          [SKIP][391] ([i915#4077]) -> [SKIP][392] ([i915#5174])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@i915_pm_rpm@fences-dpms.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          [SKIP][393] ([fdo#109302]) -> [SKIP][394] ([i915#2575])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_query@query-topology-unsupported.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          [SKIP][395] ([i915#4212]) -> [SKIP][396] ([i915#2575])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_addfb_basic@clobberred-modifier.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          [SKIP][397] ([fdo#111614]) -> [SKIP][398] ([fdo#109315]) +5 similar issues
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][399] ([i915#5190]) -> [SKIP][400] ([fdo#109315] / [i915#5190]) +5 similar issues
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2:          [SKIP][401] ([i915#4538] / [i915#5190]) -> [SKIP][402] ([fdo#109315] / [i915#5190]) +6 similar issues
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          [SKIP][403] ([i915#3689] / [i915#3886] / [i915#5354]) -> [SKIP][404] ([i915#2575]) +12 similar issues
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:
    - shard-dg2:          [SKIP][405] ([i915#5354]) -> [SKIP][406] ([i915#2575]) +16 similar issues
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          [SKIP][407] ([i915#3689] / [i915#5354]) -> [SKIP][408] ([i915#2575]) +24 similar issues
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          [SKIP][409] ([fdo#111827]) -> [SKIP][410] ([i915#2575]) +1 similar issue
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_chamelium_color@degamma.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg2:          [SKIP][411] ([i915#7828]) -> [SKIP][412] ([i915#2575]) +7 similar issues
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          [SKIP][413] ([i915#3299]) -> [SKIP][414] ([i915#2575])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-1.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          [SKIP][415] ([i915#7118]) -> [SKIP][416] ([i915#2575]) +3 similar issues
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_content_protection@mei_interface.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2:          [SKIP][417] ([i915#3555]) -> [SKIP][418] ([i915#2575]) +4 similar issues
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_cursor_crc@cursor-random-32x32.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          [SKIP][419] ([i915#3359]) -> [SKIP][420] ([i915#2575])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          [SKIP][421] ([fdo#109274] / [i915#5354]) -> [SKIP][422] ([i915#2575]) +4 similar issues
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          [SKIP][423] ([i915#4103] / [i915#4213]) -> [SKIP][424] ([i915#2575]) +2 similar issues
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          [SKIP][425] ([fdo#109274] / [fdo#111767] / [i915#5354]) -> [SKIP][426] ([i915#2575])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][427] ([fdo#110189] / [i915#3955]) -> [SKIP][428] ([i915#3955])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@kms_fbcon_fbt@psr.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          [SKIP][429] ([fdo#109274]) -> [SKIP][430] ([i915#2575]) +9 similar issues
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_flip@2x-absolute-wf_vblank.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][431] ([i915#5354]) -> [SKIP][432] ([fdo#109315]) +29 similar issues
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
    - shard-dg2:          [SKIP][433] ([i915#8708]) -> [SKIP][434] ([fdo#109315]) +16 similar issues
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          [SKIP][435] ([i915#3458]) -> [SKIP][436] ([fdo#109315]) +23 similar issues
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [SKIP][437] ([i915#3555] / [i915#8228]) -> [SKIP][438] ([i915#2575])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          [SKIP][439] ([i915#6301]) -> [SKIP][440] ([i915#2575])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_panel_fitting@legacy.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          [SKIP][441] ([i915#3555] / [i915#8806]) -> [SKIP][442] ([i915#2575])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_plane_multiple@tiling-yf.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          [SKIP][443] ([i915#6524] / [i915#6805]) -> [SKIP][444] ([i915#7011])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_prime@basic-modeset-hybrid.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          [SKIP][445] ([i915#658]) -> [SKIP][446] ([fdo#109315])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_psr2_su@page_flip-nv12.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-dg2:          [SKIP][447] ([i915#1072]) -> [SKIP][448] ([fdo#109315]) +8 similar issues
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          [SKIP][449] ([i915#2437]) -> [SKIP][450] ([i915#2575])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_writeback@writeback-fb-id.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          [SKIP][451] ([i915#7387]) -> [SKIP][452] ([i915#5608])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@perf@global-sseu-config-invalid.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@perf@global-sseu-config-invalid.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          [SKIP][453] ([i915#3708] / [i915#4077]) -> [SKIP][454] ([i915#2575])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@prime_vgem@coherency-gtt.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          [SKIP][455] ([i915#3708]) -> [SKIP][456] ([i915#2575])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@prime_vgem@fence-flip-hang.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedeskt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html

--===============3773914166122566682==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] xe/xe_sysfs: Updated tests to use xe_sysfs_gt_open</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121877/">https://patchwork.freedesktop.org/series/121877/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13459_full -&gt; IGTPW_9493_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9493_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9493_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9493_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-16/igt@gem_eio@suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-19/igt@gem_eio@suspend.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_psr@psr2_suspend.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9493_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_allocator@default-alignment:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@api_intel_allocator@default-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +123 similar issues</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html">FAIL</a> ([i915#6121]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-5/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> ([i915#8414]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@fbdev@info.html">SKIP</a> ([i915#1849] / [i915#2582])</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@fbdev@nullptr.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@fbdev@read.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-10/igt@feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@feature_discovery@psr1.html">SKIP</a> ([i915#658]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-16/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +1 similar issue</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-param-set:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_ctx_param@invalid-param-set.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_ctx_param@invalid-param-set.html">SKIP</a> ([i915#2575]) +169 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb4/igt@gem_ctx_persistence@hostile.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-7/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-5/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#3063] / [i915#7941])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@gem_exec_fair@basic-pace.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#4473] / [i915#4771]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_exec_params@no-vebox.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_params@no-vebox.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a> / [i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a> / [i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> ([i915#3281]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-self:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html">SKIP</a> ([i915#2575]) +557 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-7/igt@gem_exec_whisper@basic-fds-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-2/igt@gem_exec_whisper@basic-fds-priority-all.html">INCOMPLETE</a> ([i915#6755] / [i915#7392])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#5775]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#4077]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@gem_mmap_gtt@flink-race.html">SKIP</a> ([i915#4077]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#4083]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-1/igt@gem_mmap_wc@bad-offset.html">SKIP</a> ([i915#4083]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-4/igt@gem_partial_pwrite_pread@write.html">SKIP</a> ([i915#3282]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> ([i915#3282]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-1/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#8428]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2856]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-2/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html">FAIL</a> ([i915#7069])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@i915_pm_backlight@fade.html">SKIP</a> ([i915#5354] / [i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">FAIL</a> ([i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-16/igt@i915_pm_rpm@basic-rte.html">FAIL</a> ([i915#7940]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#1397]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-6/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([i915#5174]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf@smem0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-2/igt@i915_pm_rpm@gem-execbuf@smem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@i915_pm_rpm@gem-execbuf@smem0.html">FAIL</a> ([i915#7940]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#1397]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#5174]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-16/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-19/igt@i915_pm_rpm@system-suspend.html">DMESG-WARN</a> ([i915#4391])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@i915_pm_rps@thresholds-idle-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#8437])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> ([i915#7059])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@i915_suspend@sysfs-reader.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html">SKIP</a> ([i915#8502]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html">SKIP</a> ([i915#8502]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-13/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html">FAIL</a> ([i915#8247]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb2/igt@kms_async_flips@crc@pipe-b-vga-1.html">FAIL</a> ([i915#8247]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_async_flips@crc@pipe-d-edp-1.html">DMESG-FAIL</a> ([i915#8561]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-3/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743]) +2 similar issues</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-7/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@kms_big_fb@linear-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@kms_big_fb@linear-8bpp-rotate-0.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / [i915#5190]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#5190]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +10 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedeskt">fdo#110723</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([i915#6187]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#6095]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-2/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl1/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-4/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-7/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#5354]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#6095]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#4087] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb6/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +233 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> ([i915#7828]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-14/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#8063])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-10/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-4/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / [i915#3359])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / [i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#8814]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +9 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html">ABORT</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [fdo#111767] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#8248])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([i915#3546])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#5354]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-13/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#111825]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#111825])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#3637]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> ([i915#8841]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +76 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([i915#5460])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> ([i915#3023]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> ([i915#3458]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">FAIL</a> ([i915#1623])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> ([i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5176]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#5176]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-2.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#5235]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#5235]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#4348])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-18/igt@kms_psr@basic.html">SKIP</a> ([i915#1072]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([i915#1072]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-7/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-1/igt@kms_psr@sprite_blt.html">SKIP</a> ([i915#1072])</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#5461] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> ([i915#4235]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@kms_selftest@drm_format.html">SKIP</a> ([i915#8661])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-10/igt@kms_selftest@drm_format.html">SKIP</a> ([i915#8661])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_selftest@drm_plane.html">SKIP</a> ([i915#8661]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@framebuffer:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb2/igt@kms_selftest@framebuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#8661])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#5465]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-7/igt@kms_vblank@pipe-c-ts-continuation-idle.html">SKIP</a> ([i915#4070] / [i915#6768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-4/igt@kms_vblank@pipe-d-query-idle-hang.html">SKIP</a> ([i915#4070] / [i915#533] / [i915#6768])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_vrr@flip-suspend.html">SKIP</a> ([i915#8808])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 similar issues</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@perf_pmu@all-busy-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html">SKIP</a> ([i915#5608]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#6806])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@interrupts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@perf_pmu@interrupts.html">SKIP</a> ([i915#5608]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@perf_pmu@module-unload.html">FAIL</a> ([i915#5793] / [i915#6121])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-3/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">SKIP</a> ([i915#8537]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@prime_udl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@prime_udl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@prime_udl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@prime_vgem@basic-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-2/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@prime_vgem@coherency-blt.html">FAIL</a> ([i915#8445])</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-1/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-5/igt@sysfs_preempt_timeout@timeout@vecs0.html">ABORT</a> ([i915#8521])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#2575] / [i915#4818])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_bo_offset@create-get-offsets:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-5/igt@v3d/v3d_get_bo_offset@create-get-offsets.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / [i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-flags:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-1/igt@v3d/v3d_get_param@get-bad-flags.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@v3d/v3d_get_param@get-bad-param.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a> ([i915#7711]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-2/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html">SKIP</a> ([i915#7711])</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> ([i915#7711]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-8/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213] / [i915#8398]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-6/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-15/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-18/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a> / [i915#8011]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl6/igt@gen9_exec_parse@allowed-single.html">ABORT</a> ([i915#5566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl1/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@detector@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@i915_hangman@detector@vcs0.html">FAIL</a> ([i915#8456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html">FAIL</a> ([i915#7069]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-2/igt@i915_hangman@gt-engine-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#8489] / [i915#8668]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-tglu-2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl6/igt@i915_pm_rps@engine-order.html">FAIL</a> ([i915#6537]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl3/igt@i915_pm_rps@engine-order.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@perf_pmu@busy-double-start@ccs3.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-6/igt@perf_pmu@busy-double-start@ccs3.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#8414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#5608]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_busy@semaphore.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#2575]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> ([i915#7392] / [i915#8131]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html">TIMEOUT</a> ([i915#7392])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@gem_mmap@big-bo.html">SKIP</a> ([i915#4083]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_mmap@big-bo.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> ([i915#2575]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html">SKIP</a> ([i915#2575] / [i915#5190]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2856]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354] / [i915#7561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a> / [i915#8403])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> ([i915#5174])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109302">fdo#109302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#4212]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / [i915#5190]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / [i915#5190]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#2575]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#2575]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#2575]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_chamelium_color@degamma.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#2575]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [fdo#111767] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / [i915#3955]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([i915#2575]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#7011])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([i915#1072]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@perf@global-sseu-config-invalid.html">SKIP</a> ([i915#7387]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@perf@global-sseu-config-invalid.html">SKIP</a> ([i915#5608])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3773914166122566682==--
