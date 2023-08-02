Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3410658148931244668=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Wed, 02 Aug 2023 14:41:20 -0000
Message-ID: <169098728018.6324.16320892712272993616@emeril.freedesktop.org>
References: <20230802110750.7-1-francois.dugast@intel.com>
In-Reply-To: <20230802110750.7-1-francois.dugast@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgeGU6IFJl?=
 =?utf-8?q?name_engine_to_exec=5Fqueue?=
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

--===============3410658148931244668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: Rename engine to exec_queue
URL   : https://patchwork.freedesktop.org/series/121884/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13459_full -> IGTPW_9495_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9495_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9495_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9495_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [TIMEOUT][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@gem_partial_pwrite_pread@reads.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [PASS][4] -> [FAIL][5] +20 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_selftest@live@objects.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_selftest@live@objects.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          NOTRUN -> [WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_async_flips@test-cursor:
    - shard-dg2:          NOTRUN -> [SKIP][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-dg2:          [PASS][8] -> [TIMEOUT][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_atomic@atomic_plane_damage.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-mtlp:         [PASS][10] -> [TIMEOUT][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          [SKIP][12] ([i915#6228]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_async_flips@invalid-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg2:          [SKIP][14] ([i915#7828]) -> [TIMEOUT][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@kms_chamelium_hpd@dp-hpd-storm.html

  
Known issues
------------

  Here are the changes found in IGTPW_9495_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#8411])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][17] ([i915#6122])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@api_intel_bb@render-ccs.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2:          NOTRUN -> [FAIL][18] ([i915#6121]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#7701]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#8414]) +5 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8414]) +22 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@fbdev@pan:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#2582])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@fbdev@pan.html

  * igt@fbdev@read:
    - shard-dg2:          [PASS][23] -> [SKIP][24] ([i915#2582]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@fbdev@read.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@fbdev@read.html

  * igt@feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#4854])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#1839])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@feature_discovery@display-3x.html

  * igt@feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#658]) +10 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@feature_discovery@psr1.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#3281]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-13/igt@gem_bad_reloc@negative-reloc-lut.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#3281]) +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#7697])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [PASS][31] -> [FAIL][32] ([i915#6268])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
    - shard-mtlp:         [PASS][33] -> [FAIL][34] ([i915#6121] / [i915#7916])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#8555])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#8555])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#1099]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb1/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [PASS][38] -> [FAIL][39] ([i915#7816]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#280])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg2:          NOTRUN -> [FAIL][41] ([i915#5784])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_await@wide-contexts:
    - shard-dg2:          NOTRUN -> [TIMEOUT][42] ([i915#5892])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4771])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#8555])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#6334]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#6344])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu:         NOTRUN -> [SKIP][48] ([i915#6344])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@bcs0-smem:
    - shard-mtlp:         [PASS][49] -> [TIMEOUT][50] ([i915#7941])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-1/igt@gem_exec_capture@capture@bcs0-smem.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@gem_exec_capture@capture@bcs0-smem.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-mtlp:         [PASS][51] -> [FAIL][52] ([i915#4475])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@gem_exec_capture@pi@vcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4473] / [i915#4771]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3539])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852]) +7 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#7697]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@no-blt:
    - shard-dg2:          [PASS][57] -> [SKIP][58] ([fdo#109283] / [i915#2575])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_exec_params@no-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([fdo#109283] / [i915#5107])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([fdo#112283])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3281]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3281]) +15 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4537] / [i915#4812]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-mtlp:         [PASS][64] -> [TIMEOUT][65] ([i915#7392] / [i915#8628])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4860]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#4613]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#5775]) +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#4613])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#4613]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#8289])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#284])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4077]) +17 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4077]) +10 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4083]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-1/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4083]) +8 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3282]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#3282]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3282]) +9 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_pread@snoop.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4270]) +7 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4270])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#4270])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#4270]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#8428])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#2575] / [i915#5190]) +6 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4079])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4079]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#4885])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-13/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#3297]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3297] / [i915#4880])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@nohangcheck:
    - shard-mtlp:         [PASS][92] -> [FAIL][93] ([i915#7916])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-5/igt@gem_userptr_blits@nohangcheck.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@gem_userptr_blits@nohangcheck.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#4958])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3297]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#3297])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          NOTRUN -> [FAIL][97] ([i915#3318])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([fdo#109289]) +6 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([fdo#109289]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-5/igt@gen9_exec_parse@allowed-all.html
    - shard-apl:          [PASS][101] -> [ABORT][102] ([i915#5566])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#2856]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#2527])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#2856]) +7 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@load:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#6227])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - shard-dg1:          [PASS][107] -> [DMESG-WARN][108] ([i915#4391] / [i915#4423]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-14/igt@i915_module_load@reload.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-16/igt@i915_module_load@reload.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          [PASS][109] -> [SKIP][110] ([i915#5775])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_module_load@resize-bar.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#7561])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-6/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#5354] / [i915#7561]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@i915_pm_backlight@fade-with-suspend.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#5978])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-dg2:          [PASS][114] -> [SKIP][115] ([i915#1937])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
    - shard-dg1:          [PASS][116] -> [SKIP][117] ([i915#1937])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-16/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([fdo#109289]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - shard-tglu:         NOTRUN -> [SKIP][119] ([fdo#109289]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-dg1:          [PASS][120] -> [FAIL][121] ([i915#3591])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][122] -> [SKIP][123] ([i915#1397])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-16/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [PASS][124] -> [SKIP][125] ([i915#1397])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-6/igt@i915_pm_rpm@dpms-non-lpsp.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#1397]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#5174]) +8 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-dg2:          [PASS][128] -> [SKIP][129] ([i915#5174]) +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@i915_pm_rpm@reg-read-ioctl.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [PASS][130] -> [FAIL][131] ([fdo#103375])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@i915_pm_rpm@system-suspend-modeset.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#6621])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#8925])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@i915_pm_rps@thresholds-idle-park@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#8437])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#6188])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@live@migrate:
    - shard-dg2:          [PASS][136] -> [FAIL][137] ([i915#7913]) +15 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_selftest@live@migrate.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - shard-mtlp:         [PASS][138] -> [DMESG-FAIL][139] ([i915#8497])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@requests.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [PASS][140] -> [FAIL][141] ([fdo#103375])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#4212])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#4212]) +1 similar issue
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#4215] / [i915#5190])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#8502]) +7 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][146] ([i915#8247]) +3 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][147] ([i915#8247]) +1 similar issue
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html
    - shard-snb:          NOTRUN -> [FAIL][148] ([i915#8247]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb1/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][149] ([i915#8561]) +3 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#1769])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#1769] / [i915#3555])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#5286])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [PASS][153] -> [FAIL][154] ([i915#5138])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         [PASS][155] -> [FAIL][156] ([i915#3743]) +2 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [FAIL][157] ([i915#3743]) +1 similar issue
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#4538] / [i915#5286])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([fdo#111614] / [i915#3638])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([fdo#111614])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-3/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([fdo#111614]) +7 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-dg2:          [PASS][162] -> [SKIP][163] ([fdo#109315]) +19 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([fdo#111614])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([fdo#109315] / [i915#5190]) +14 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([fdo#111615]) +5 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#5190]) +29 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#4538] / [i915#5190]) +7 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][169] ([fdo#110723]) +1 similar issue
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([fdo#111615])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([fdo#111615])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-18/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#6187]) +1 similar issue
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#2705])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#3886] / [i915#6095]) +6 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#3689] / [i915#5354] / [i915#6095]) +4 similar issues
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][176] ([fdo#109271] / [i915#3886]) +1 similar issue
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl4/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#5354] / [i915#6095]) +5 similar issues
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3689] / [i915#3886] / [i915#5354]) +14 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#5354] / [i915#6095]) +11 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#3689] / [i915#5354]) +38 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#5354]) +8 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#5354] / [i915#6095]) +3 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-15/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#6095]) +14 similar issues
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#4087] / [i915#7213])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([fdo#111827])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#7828]) +15 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#7828])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#7828])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-9/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#7828]) +3 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#7828]) +1 similar issue
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-12/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3299])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#8063])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@srm:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#6944])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#7118]) +2 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#7118])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@kms_content_protection@uevent.html
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#6944] / [i915#7116] / [i915#7118])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([fdo#109279] / [i915#3359])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][200] ([fdo#109279] / [i915#3359])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#8814]) +1 similar issue
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#3359])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3359]) +3 similar issues
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#3555]) +2 similar issues
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#3555])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#3555]) +9 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([fdo#109274] / [fdo#111767] / [i915#5354]) +1 similar issue
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#3546])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([fdo#109274] / [i915#5354]) +6 similar issues
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][210] -> [FAIL][211] ([i915#2346])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#4103] / [i915#4213])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#8588])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#8812])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#3555] / [i915#3840])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#4881]) +1 similar issue
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#3637]) +3 similar issues
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([fdo#111825]) +3 similar issues
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-16/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#8381])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([fdo#109274] / [fdo#111767])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([fdo#109274]) +12 similar issues
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([fdo#111825]) +1 similar issue
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@kms_flip@2x-plain-flip.html
    - shard-tglu:         NOTRUN -> [SKIP][223] ([fdo#109274] / [i915#3637]) +1 similar issue
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [PASS][224] -> [FAIL][225] ([i915#79])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#2587] / [i915#2672])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#2672])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#2672]) +8 similar issues
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#8810]) +1 similar issue
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([fdo#109285])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [FAIL][231] ([i915#6880]) +1 similar issue
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([fdo#109315]) +122 similar issues
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#8708]) +35 similar issues
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#5460])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([fdo#111825] / [i915#1825]) +7 similar issues
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#5460])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#8708]) +3 similar issues
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#1825]) +16 similar issues
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#5354]) +81 similar issues
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([fdo#109280]) +10 similar issues
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#3023]) +5 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#3458]) +26 similar issues
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#6118])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228]) +1 similar issue
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#8228])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_hdr@static-toggle.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#4816])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
    - shard-mtlp:         [PASS][247] -> [FAIL][248] ([i915#1623])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-snb:          NOTRUN -> [DMESG-WARN][249] ([i915#8841]) +5 similar issues
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#8821])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#3555] / [i915#8821])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([fdo#109274])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#6953])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][254] ([i915#8292])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#5176]) +11 similar issues
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#5176]) +3 similar issues
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#5176]) +7 similar issues
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#5235]) +5 similar issues
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#5235]) +3 similar issues
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#5235]) +7 similar issues
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#5235]) +7 similar issues
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][262] ([fdo#109271]) +229 similar issues
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#5235]) +11 similar issues
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][264] ([fdo#109271]) +46 similar issues
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#6524])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#6524] / [i915#6805])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([fdo#111068] / [i915#658])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-tglu:         NOTRUN -> [SKIP][268] ([fdo#111068] / [i915#658])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#4348])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@basic:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#1072]) +1 similar issue
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-15/igt@kms_psr@basic.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#1072]) +10 similar issues
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([fdo#110189]) +7 similar issues
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-3/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr@sprite_blt:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#1072])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_psr@sprite_blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#5461] / [i915#658])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#4235]) +1 similar issue
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#4235] / [i915#5190]) +1 similar issue
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#4235]) +1 similar issue
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#3555])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-19/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_format:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#8661])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-6/igt@kms_selftest@drm_format.html

  * igt@kms_selftest@drm_plane:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#8661]) +3 similar issues
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_selftest@drm_plane.html

  * igt@kms_selftest@framebuffer:
    - shard-snb:          NOTRUN -> [SKIP][281] ([fdo#109271] / [i915#8661])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb4/igt@kms_selftest@framebuffer.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][282] ([IGT#2])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#8623])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([fdo#109309])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-dg2:          NOTRUN -> [FAIL][285] ([fdo#103375])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-idle:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#4070] / [i915#6768]) +2 similar issues
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_vblank@pipe-c-ts-continuation-idle.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#4070] / [i915#533] / [i915#6768])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_vblank@pipe-d-query-idle-hang.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-mtlp:         [PASS][288] -> [DMESG-WARN][289] ([i915#2017])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-1/igt@kms_vblank@pipe-d-ts-continuation-idle.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vrr@flip-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#8808])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_vrr@flip-suspend.html

  * igt@perf@create-destroy-userspace-config:
    - shard-dg2:          [PASS][291] -> [SKIP][292] ([i915#5608]) +4 similar issues
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@perf@create-destroy-userspace-config.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@perf@create-destroy-userspace-config.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#2434])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#2433])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#8850])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][296] ([i915#6806])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@interrupts:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#5608]) +19 similar issues
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@perf_pmu@interrupts.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][298] ([i915#5793] / [i915#6121])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#8516])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([fdo#109291])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@prime_udl.html
    - shard-rkl:          NOTRUN -> [SKIP][301] ([fdo#109291])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@prime_udl.html
    - shard-tglu:         NOTRUN -> [SKIP][302] ([fdo#109291])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-9/igt@prime_udl.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#3708] / [i915#4077])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#3708] / [i915#4077])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#3291] / [i915#3708])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#3708])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@prime_vgem@fence-read-hang.html

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - shard-dg2:          [PASS][307] -> [SKIP][308] ([i915#2575]) +151 similar issues
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html

  * igt@sysfs_heartbeat_interval@mixed@ccs0:
    - shard-mtlp:         [PASS][309] -> [ABORT][310] ([i915#8552])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@sysfs_heartbeat_interval@mixed@ccs0.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@sysfs_heartbeat_interval@mixed@ccs0.html

  * igt@sysfs_heartbeat_interval@mixed@vecs0:
    - shard-mtlp:         [PASS][311] -> [FAIL][312] ([i915#1731])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@sysfs_heartbeat_interval@mixed@vecs0.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@sysfs_heartbeat_interval@mixed@vecs0.html

  * igt@sysfs_preempt_timeout@timeout@vecs1:
    - shard-dg2:          NOTRUN -> [ABORT][313] ([i915#7941])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@sysfs_preempt_timeout@timeout@vecs1.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-mtlp:         [PASS][314] -> [TIMEOUT][315] ([i915#6950])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@sysfs_timeslice_duration@timeout@vecs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#4818])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_get_bo_offset@create-get-offsets:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([fdo#109315] / [i915#2575]) +4 similar issues
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@v3d/v3d_get_bo_offset@create-get-offsets.html

  * igt@v3d/v3d_get_param@get-bad-flags:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([fdo#109315]) +4 similar issues
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@v3d/v3d_get_param@get-bad-flags.html

  * igt@v3d/v3d_get_param@get-bad-param:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#2575]) +5 similar issues
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@v3d/v3d_get_param@get-bad-param.html

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#2575]) +492 similar issues
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@v3d/v3d_submit_csd@single-out-sync.html

  * igt@vc4/vc4_perfmon@create-single-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#7711]) +4 similar issues
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@vc4/vc4_perfmon@create-single-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#7711])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html

  * igt@vc4/vc4_tiling@get-bad-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#7711]) +21 similar issues
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@vc4/vc4_tiling@get-bad-modifier.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#2575]) +1 similar issue
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-2/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][325] ([i915#7742]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [ABORT][327] ([i915#7975] / [i915#8213] / [i915#8398]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-10/igt@gem_eio@hibernate.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-5/igt@gem_eio@hibernate.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][329] ([i915#2842]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [FAIL][331] ([fdo#103375] / [i915#8011]) -> [PASS][332] +1 similar issue
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][333] ([i915#5493]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          [DMESG-WARN][335] ([i915#4936] / [i915#5493]) -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-snb:          [ABORT][337] ([i915#5161]) -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [ABORT][339] ([i915#5566]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl6/igt@gen9_exec_parse@allowed-single.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl3/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_hangman@gt-engine-hang@vcs0:
    - shard-mtlp:         [FAIL][341] ([i915#7069]) -> [PASS][342] +1 similar issue
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@i915_hangman@gt-engine-hang@vcs0.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-rkl:          [SKIP][343] ([i915#1937]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-dg1:          [FAIL][345] ([i915#7691]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-12/igt@i915_pm_rpm@basic-pci-d3-state.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-19/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglu:         [FAIL][347] ([i915#7940]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][349] ([i915#1397]) -> [PASS][350] +2 similar issues
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
    - shard-dg1:          [FAIL][351] ([i915#7940]) -> [PASS][352] +1 similar issue
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][353] ([i915#1397]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@slpc:
    - shard-mtlp:         [DMESG-WARN][355] ([i915#6367]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@slpc.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@i915_selftest@live@slpc.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         [FAIL][357] ([i915#3743]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][359] ([i915#5138]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][361] ([i915#2346]) -> [PASS][362] +1 similar issue
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
    - shard-glk:          [FAIL][363] ([i915#79]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
    - shard-dg2:          [FAIL][365] ([fdo#103375]) -> [PASS][366] +2 similar issues
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-dg2:          [FAIL][367] ([i915#6880]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@perf_pmu@busy-double-start@ccs3:
    - shard-dg2:          [FAIL][369] ([i915#4349]) -> [PASS][370] +1 similar issue
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@perf_pmu@busy-double-start@ccs3.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@perf_pmu@busy-double-start@ccs3.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [FAIL][371] ([i915#4349]) -> [PASS][372] +2 similar issues
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-18/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@most-busy-check-all@bcs0:
    - shard-snb:          [ABORT][373] ([i915#8852]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-snb5/igt@perf_pmu@most-busy-check-all@bcs0.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb1/igt@perf_pmu@most-busy-check-all@bcs0.html

  
#### Warnings ####

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          [SKIP][375] ([i915#8414]) -> [SKIP][376] ([i915#5608]) +1 similar issue
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@drm_fdinfo@virtual-busy-idle-all.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@feature_discovery@display-2x:
    - shard-dg2:          [SKIP][377] ([i915#1839]) -> [SKIP][378] ([i915#2575])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@feature_discovery@display-2x.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@feature_discovery@display-2x.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          [SKIP][379] ([i915#8555]) -> [SKIP][380] ([i915#2575])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hostile.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [ABORT][381] ([i915#7975] / [i915#8213]) -> [SKIP][382] ([i915#2575])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_eio@hibernate.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          [SKIP][383] ([i915#4771]) -> [SKIP][384] ([i915#2575]) +1 similar issue
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_exec_balancer@bonded-sync.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          [SKIP][385] ([i915#4036]) -> [SKIP][386] ([i915#2575])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-dg2:          [SKIP][387] ([i915#3539]) -> [SKIP][388] ([i915#2575])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_fair@basic-pace-solo.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          [SKIP][389] ([i915#4812]) -> [SKIP][390] ([i915#2575]) +1 similar issue
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_fence@submit67.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          [SKIP][391] ([i915#3539] / [i915#4852]) -> [SKIP][392] ([i915#2575]) +1 similar issue
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_flush@basic-uc-rw-default.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-dg2:          [SKIP][393] ([i915#7697]) -> [SKIP][394] ([i915#2575])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_gttfill@multigpu-basic.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          [SKIP][395] ([fdo#112283]) -> [SKIP][396] ([i915#2575])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_exec_params@secure-non-master.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          [SKIP][397] ([i915#3281]) -> [SKIP][398] ([i915#2575]) +9 similar issues
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_reloc@basic-wc.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [ABORT][399] ([i915#7392] / [i915#8131]) -> [TIMEOUT][400] ([i915#7392])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          [SKIP][401] ([i915#4860]) -> [SKIP][402] ([i915#2575])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-y.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_media_vme:
    - shard-dg2:          [SKIP][403] ([i915#284]) -> [SKIP][404] ([i915#2575])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_media_vme.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg2:          [SKIP][405] ([i915#4077]) -> [SKIP][406] ([i915#2575]) +11 similar issues
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          [SKIP][407] ([i915#4083]) -> [SKIP][408] ([i915#2575]) +5 similar issues
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_mmap_wc@copy.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_mmap_wc@copy.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          [SKIP][409] ([i915#4270]) -> [SKIP][410] ([i915#2575]) +5 similar issues
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_readwrite@read-write:
    - shard-dg2:          [SKIP][411] ([i915#3282]) -> [SKIP][412] ([i915#2575]) +3 similar issues
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_readwrite@read-write.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          [SKIP][413] ([i915#5190]) -> [SKIP][414] ([i915#2575] / [i915#5190]) +7 similar issues
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          [SKIP][415] ([i915#4079]) -> [SKIP][416] ([i915#2575])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          [FAIL][417] ([i915#5889]) -> [SKIP][418] ([i915#2575])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          [SKIP][419] ([i915#3297]) -> [SKIP][420] ([i915#2575]) +3 similar issues
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-dg2:          [SKIP][421] ([fdo#109289]) -> [SKIP][422] ([i915#2575]) +4 similar issues
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gen7_exec_parse@basic-offset.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          [SKIP][423] ([i915#2856]) -> [SKIP][424] ([i915#2575]) +5 similar issues
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gen9_exec_parse@bb-start-far.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-dg2:          [SKIP][425] ([i915#5354] / [i915#7561]) -> [SKIP][426] ([i915#2575])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@i915_pm_backlight@basic-brightness.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglu:         [WARN][427] ([i915#2681]) -> [FAIL][428] ([i915#3591])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - shard-tglu:         [WARN][429] ([i915#2681]) -> [FAIL][430] ([i915#2681] / [i915#3591])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-dg2:          [SKIP][431] ([i915#4077]) -> [SKIP][432] ([i915#5174]) +2 similar issues
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@i915_pm_rpm@fences-dpms.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rpm@i2c:
    - shard-dg1:          [DMESG-WARN][433] ([i915#4391] / [i915#4423]) -> [DMESG-WARN][434] ([i915#1982] / [i915#4391] / [i915#4423])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-14/igt@i915_pm_rpm@i2c.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-14/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu:         [SKIP][435] ([fdo#111644] / [i915#1397]) -> [FAIL][436] ([i915#7940])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          [SKIP][437] ([i915#4387]) -> [SKIP][438] ([i915#2575])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@i915_pm_sseu@full-enable.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_pm_sseu@full-enable.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2:          [SKIP][439] ([i915#4212]) -> [SKIP][440] ([i915#2575]) +1 similar issue
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          [SKIP][441] ([fdo#111614]) -> [SKIP][442] ([fdo#109315]) +5 similar issues
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          [SKIP][443] ([i915#5190]) -> [SKIP][444] ([fdo#109315] / [i915#5190]) +5 similar issues
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2:          [SKIP][445] ([i915#4538] / [i915#5190]) -> [SKIP][446] ([fdo#109315] / [i915#5190]) +2 similar issues
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:
    - shard-dg2:          [SKIP][447] ([i915#5354]) -> [SKIP][448] ([i915#2575]) +12 similar issues
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          [SKIP][449] ([i915#3689] / [i915#3886] / [i915#5354]) -> [SKIP][450] ([i915#2575]) +5 similar issues
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:
    - shard-dg2:          [SKIP][451] ([i915#3689] / [i915#5354]) -> [SKIP][452] ([i915#2575]) +17 similar issues
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2:          [SKIP][453] ([fdo#111827]) -> [SKIP][454] ([i915#2575]) +2 similar issues
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_chamelium_color@ctm-0-50.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          [SKIP][455] ([i915#7828]) -> [SKIP][456] ([i915#2575]) +6 similar issues
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          [SKIP][457] ([i915#3299]) -> [SKIP][458] ([i915#2575])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          [SKIP][459] ([i915#7118]) -> [SKIP][460] ([i915#2575]) +1 similar issue
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_content_protection@mei_interface.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_content_protection@mei_interface.html
    - shard-dg1:          [SKIP][461] ([i915#7116]) -> [SKIP][462] ([fdo#109300])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-16/igt@kms_content_protection@mei_interface.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-12/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg2:          [SKIP][463] ([i915#3555]) -> [SKIP][464]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/index.html

--===============3410658148931244668==
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
<tr><td><b>Series:</b></td><td>xe: Rename engine to exec_queue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121884/">https://patchwork.freedesktop.org/series/121884/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13459_full -&gt; IGTPW_9495_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9495_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9495_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9495_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@gem_partial_pwrite_pread@reads.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_selftest@live@objects.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_selftest@live@objects.html">FAIL</a> +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_async_flips@test-cursor.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_atomic@atomic_plane_damage.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@kms_atomic@atomic_plane_damage.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@kms_chamelium_hpd@dp-hpd-storm.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9495_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html">FAIL</a> ([i915#6121]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> ([i915#8414]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@fbdev@pan.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@fbdev@read.html">SKIP</a> ([i915#2582]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@feature_discovery@psr1.html">SKIP</a> ([i915#658]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-13/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +1 similar issue</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6121] / [i915#7916])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb1/igt@gem_ctx_persistence@hostile.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> ([i915#7816]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_await@wide-contexts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@gem_exec_await@wide-contexts.html">TIMEOUT</a> ([i915#5892])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> ([i915#6334]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@bcs0-smem:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-1/igt@gem_exec_capture@capture@bcs0-smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@gem_exec_capture@capture@bcs0-smem.html">TIMEOUT</a> ([i915#7941])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@gem_exec_capture@pi@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@gem_exec_capture@pi@vcs0.html">FAIL</a> ([i915#4475])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#4473] / [i915#4771]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_exec_params@no-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283] / [i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283] / [i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> ([i915#3281]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html">TIMEOUT</a> ([i915#7392] / [i915#8628])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#5775]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#4077]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@gem_mmap_gtt@flink-race.html">SKIP</a> ([i915#4077]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-1/igt@gem_mmap_wc@bad-offset.html">SKIP</a> ([i915#4083]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> ([i915#4083]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@gem_partial_pwrite_pread@write.html">SKIP</a> ([i915#3282]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> ([i915#3282]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#2575] / [i915#5190]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-13/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-5/igt@gem_userptr_blits@nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@gem_userptr_blits@nohangcheck.html">FAIL</a> ([i915#7916])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-5/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2527] / [i915#2856])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl1/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl6/igt@gen9_exec_parse@allowed-all.html">ABORT</a> ([i915#5566])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-14/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-16/igt@i915_module_load@reload.html">DMESG-WARN</a> ([i915#4391] / [i915#4423]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_module_load@resize-bar.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#5775])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-6/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@i915_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#5354] / [i915#7561]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([i915#1937])</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-16/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> ([i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-16/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-6/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#1397]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([i915#5174]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([i915#5174]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@i915_pm_rpm@system-suspend-modeset.html">FAIL</a> ([fdo#103375])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@i915_pm_rps@thresholds-idle-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#8437])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_selftest@live@migrate.html">FAIL</a> ([i915#7913]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> ([i915#8497])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> ([fdo#103375])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-10/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc_ccs.html">SKIP</a> ([i915#8502]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8247]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#8247]) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb1/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#8247]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_async_flips@crc@pipe-d-edp-1.html">DMESG-FAIL</a> ([i915#8561]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> ([i915#3743]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-3/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">SKIP</a> ([fdo#109315]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([fdo#109315] / [i915#5190]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#5190]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-18/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([i915#6187]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#6095]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl4/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#5354]) +38 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#5354]) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-15/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#6095]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#4087] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> ([i915#7828]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-9/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-12/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#8063])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#8814]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +2 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#5354]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([i915#3546])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> ([fdo#109274] / [i915#5354]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-16/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#111825]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([fdo#109274]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#111825]) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#109274] / [i915#3637]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">FAIL</a> ([i915#6880]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109315]) +122 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([i915#5460])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#5460])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +81 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> ([fdo#109280]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> ([i915#3023]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> ([i915#3458]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">FAIL</a> ([i915#1623])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-WARN</a> ([i915#8841]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5176]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5176]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html">SKIP</a> ([fdo#109271]) +229 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5235]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1.html">SKIP</a> ([fdo#109271]) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#4348])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-15/igt@kms_psr@basic.html">SKIP</a> ([i915#1072]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([i915#1072]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-3/igt@kms_psr@psr2_sprite_render.html">SKIP</a> ([fdo#110189]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_psr@sprite_blt.html">SKIP</a> ([i915#1072])</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#5461] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> ([i915#4235]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> ([i915#4235]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-19/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-6/igt@kms_selftest@drm_format.html">SKIP</a> ([i915#8661])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_selftest@drm_plane.html">SKIP</a> ([i915#8661]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@framebuffer:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb4/igt@kms_selftest@framebuffer.html">SKIP</a> ([fdo#109271] / [i915#8661])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">FAIL</a> ([fdo#103375])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_vblank@pipe-c-ts-continuation-idle.html">SKIP</a> ([i915#4070] / [i915#6768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@kms_vblank@pipe-d-query-idle-hang.html">SKIP</a> ([i915#4070] / [i915#533] / [i915#6768])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-1/igt@kms_vblank@pipe-d-ts-continuation-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@kms_vblank@pipe-d-ts-continuation-idle.html">DMESG-WARN</a> ([i915#2017])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_vrr@flip-suspend.html">SKIP</a> ([i915#8808])</li>
</ul>
</li>
<li>
<p>igt@perf@create-destroy-userspace-config:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@perf@create-destroy-userspace-config.html">SKIP</a> ([i915#5608]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-6/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#6806])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@interrupts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@perf_pmu@interrupts.html">SKIP</a> ([i915#5608]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@perf_pmu@module-unload.html">FAIL</a> ([i915#5793] / [i915#6121])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@prime_udl.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@prime_udl.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-9/igt@prime_udl.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@prime_vgem@basic-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-for-submit-delayed-submit:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html">SKIP</a> ([i915#2575]) +151 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@sysfs_heartbeat_interval@mixed@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@sysfs_heartbeat_interval@mixed@ccs0.html">ABORT</a> ([i915#8552])</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@sysfs_heartbeat_interval@mixed@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@sysfs_heartbeat_interval@mixed@vecs0.html">FAIL</a> ([i915#1731])</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@sysfs_preempt_timeout@timeout@vecs1.html">ABORT</a> ([i915#7941])</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-6/igt@sysfs_timeslice_duration@timeout@vecs0.html">TIMEOUT</a> ([i915#6950])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-3/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_bo_offset@create-get-offsets:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-10/igt@v3d/v3d_get_bo_offset@create-get-offsets.html">SKIP</a> ([fdo#109315] / [i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-flags:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@v3d/v3d_get_param@get-bad-flags.html">SKIP</a> ([fdo#109315]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-7/igt@v3d/v3d_get_param@get-bad-param.html">SKIP</a> ([i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-2/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> ([i915#2575]) +492 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a> ([i915#7711]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-1/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html">SKIP</a> ([i915#7711])</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> ([i915#7711]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-2/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213] / [i915#8398]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-5/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> ([fdo#103375] / [i915#8011]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html">ABORT</a> ([i915#5161]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl6/igt@gen9_exec_parse@allowed-single.html">ABORT</a> ([i915#5566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl3/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html">FAIL</a> ([i915#7069]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@i915_hangman@gt-engine-hang@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([i915#1937]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-12/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> ([i915#7691]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-19/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-8/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> ([i915#6367]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-4/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html">FAIL</a> ([fdo#103375]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@perf_pmu@busy-double-start@ccs3.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-8/igt@perf_pmu@busy-double-start@ccs3.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-18/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-snb5/igt@perf_pmu@most-busy-check-all@bcs0.html">ABORT</a> ([i915#8852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-snb1/igt@perf_pmu@most-busy-check-all@bcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#8414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#5608]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_eio@hibernate.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-2/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> ([i915#3539]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_exec_reloc@basic-wc.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_exec_reloc@basic-wc.html">SKIP</a> ([i915#2575]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> ([i915#7392] / [i915#8131]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html">TIMEOUT</a> ([i915#7392])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_media_vme.html">SKIP</a> ([i915#284]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_media_vme.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a> ([i915#2575]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@gem_readwrite@read-write.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_readwrite@read-write.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html">FAIL</a> ([i915#5889]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354] / [i915#7561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a> ([i915#2681]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> ([i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">WARN</a> ([i915#2681]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> ([i915#2681] / [i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-1/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> ([i915#5174]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-14/igt@i915_pm_rpm@i2c.html">DMESG-WARN</a> ([i915#4391] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-14/igt@i915_pm_rpm@i2c.html">DMESG-WARN</a> ([i915#1982] / [i915#4391] / [i915#4423])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-tglu-8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-tglu-8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">FAIL</a> ([i915#7940])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#109315]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#109315] / [i915#5190]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#109315] / [i915#5190]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-8/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#2575]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-6/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#2575]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-3/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> ([fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> ([i915#2575]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg2-10/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg2-11/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#2575]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/shard-dg1-16/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#7116]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9495/shard-dg1-12/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg2:          [SKIP][463] ([i915#3555]) -&gt; [SKIP][464]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3410658148931244668==--
