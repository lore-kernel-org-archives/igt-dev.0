Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1515500624144327198=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Wed, 02 Aug 2023 21:32:18 -0000
Message-ID: <169101193897.6327.14849767493566134264@emeril.freedesktop.org>
References: <20230802170437.7-1-francois.dugast@intel.com>
In-Reply-To: <20230802170437.7-1-francois.dugast@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgeGU6IFJl?=
 =?utf-8?q?name_engine_to_exec=5Fqueue_=28rev2=29?=
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

--===============1515500624144327198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: Rename engine to exec_queue (rev2)
URL   : https://patchwork.freedesktop.org/series/121884/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13462_full -> IGTPW_9497_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9497_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9497_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/index.html

Participating hosts (9 -> 10)
------------------------------

  Additional (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9497_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-snb:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-snb2/igt@gem_mmap_gtt@medium-copy-xy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb4/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@i915_selftest@perf@region:
    - shard-dg2:          [PASS][5] -> [FAIL][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-2/igt@i915_selftest@perf@region.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_selftest@perf@region.html

  * igt@kms_async_flips@test-cursor:
    - shard-dg2:          NOTRUN -> [SKIP][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_async_flips@test-cursor.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-edp-1:
    - shard-mtlp:         [PASS][8] -> [FAIL][9] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-edp-1.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][10] -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-2/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2.html

  
#### Warnings ####

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-snb:          [SKIP][12] ([fdo#109271]) -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-snb4/igt@gem_pxp@fail-invalid-protected-context.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb7/igt@gem_pxp@fail-invalid-protected-context.html

  
Known issues
------------

  Here are the changes found in IGTPW_9497_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8411])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-12/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@drm_buddy@drm_buddy_test:
    - shard-snb:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#8661])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb5/igt@drm_buddy@drm_buddy_test.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#8414]) +11 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-1/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [PASS][18] -> [FAIL][19] ([i915#7742])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8414]) +20 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@fbdev@unaligned-write:
    - shard-dg2:          [PASS][21] -> [SKIP][22] ([i915#2582])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@fbdev@unaligned-write.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@fbdev@unaligned-write.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#3281]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-12/igt@gem_bad_reloc@negative-reloc-lut.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#3281]) +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#4873])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#5325])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [PASS][27] -> [FAIL][28] ([i915#6268])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-8/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          NOTRUN -> [DMESG-WARN][29] ([i915#8841]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [PASS][30] -> [FAIL][31] ([i915#2410]) +6 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-6/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#8555]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8555])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#1099]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb1/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hang@bsd2:
    - shard-mtlp:         [PASS][35] -> [ABORT][36] ([i915#8865])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-4/igt@gem_ctx_persistence@legacy-engines-hang@bsd2.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hang@bsd2.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [PASS][37] -> [FAIL][38] ([i915#7816]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#280])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][40] -> [FAIL][41] ([i915#5784])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@gem_eio@reset-stress.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][42] -> [FAIL][43] ([i915#5784])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-15/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#6334])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#6344])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-flow:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4473] / [i915#4771])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@gem_exec_fair@basic-flow.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#2842]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3539] / [i915#4852])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#7697])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3281]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#3281]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_schedule@preempt-self:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#2575]) +146 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][55] ([fdo#103375])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][56] ([i915#7975] / [i915#8213])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4613]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#4613])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#5775]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][60] -> [TIMEOUT][61] ([i915#5493])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#284])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-8/igt@gem_media_vme.html

  * igt@gem_mmap@bad-size:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4083]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@gem_mmap@bad-size.html

  * igt@gem_mmap@short-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4083])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4077]) +9 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3282]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-snb:          [PASS][67] -> [DMESG-FAIL][68] ([i915#8295])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_pwrite@basic-random:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#3282]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_pwrite@basic-random.html

  * igt@gem_pwrite_snooped:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3282]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-16/igt@gem_pwrite_snooped.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4270])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-off-3.html
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4270])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4270]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4270]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-9/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#4270])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@new-obj:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3282])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#8428]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4885])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-1/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_fence_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4077]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4079])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_tiled_pread_basic.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4077]) +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3297])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3297] / [i915#4880])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@mmap-offset-banned@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3297]) +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@gem_userptr_blits@mmap-offset-banned@gtt.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3297] / [i915#4958])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][87] ([i915#2724])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb2/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([fdo#109289]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([fdo#109289])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#2527] / [i915#2856])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-8/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#2856]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#2856]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gen9_exec_parse@secure-batches.html
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#2527])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - shard-mtlp:         [PASS][94] -> [FAIL][95] ([i915#8691])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#7561])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-2/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([fdo#109289]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-dg1:          [PASS][98] -> [FAIL][99] ([i915#3591])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][100] -> [SKIP][101] ([i915#1397])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#5174]) +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#1397])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][104] -> [SKIP][105] ([i915#1397]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg1:          [PASS][106] -> [SKIP][107] ([i915#1397]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-16/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#6621])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#8925])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#8437])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@i915_pm_sseu@full-enable.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4215] / [i915#5190])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#8709]) +11 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#8502]) +7 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][114] ([i915#8247]) +3 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][115] ([i915#8561]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][116] ([i915#8247]) +3 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-16/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][117] ([i915#1769])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([fdo#109315]) +21 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4538] / [i915#5286]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([fdo#111614]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#5286])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-5/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [FAIL][122] ([i915#3743]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([fdo#111614] / [i915#3638])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([fdo#111614]) +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3638])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([fdo#109315] / [i915#5190]) +4 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#5190]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([fdo#111615]) +6 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4538] / [i915#5190]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][130] ([fdo#110723]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4538]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-15/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#6187]) +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#3689] / [i915#5354]) +6 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#3886] / [i915#6095]) +4 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-13/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#3689] / [i915#5354] / [i915#6095])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-7/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-yf_tiled_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#3689] / [i915#5354] / [i915#6095])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-15/igt@kms_ccs@pipe-b-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#5354]) +17 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_ccs@pipe-b-ccs-on-another-bo-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#5354] / [i915#6095]) +5 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#5354] / [i915#6095]) +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-16/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3689] / [i915#3886] / [i915#5354]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-7/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#5354] / [i915#6095]) +4 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-4/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#6095]) +15 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#5354]) +6 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-2/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([fdo#111827])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([fdo#111827])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7828]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-17/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#7828]) +1 similar issue
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#7828]) +2 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#3299])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#8063])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@srm:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#6944]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#7118])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#3359])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][156] ([fdo#109279] / [i915#3359])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#8814])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3555]) +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#3359])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#3546]) +1 similar issue
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][161] -> [FAIL][162] ([i915#2346])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#4213])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3804])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3555]) +2 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#8812])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#3637]) +3 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([fdo#111825]) +8 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-16/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][169] -> [FAIL][170] ([i915#79])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#8381])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([fdo#109274] / [i915#3637])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-10/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([fdo#109274]) +1 similar issue
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([fdo#111825]) +1 similar issue
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#2672]) +6 similar issues
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#2587] / [i915#2672]) +1 similar issue
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#8810]) +1 similar issue
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#2672]) +1 similar issue
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#2672] / [i915#3555])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][180] -> [SKIP][181] ([fdo#109315]) +26 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#1825]) +17 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#8708]) +1 similar issue
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([fdo#109280]) +4 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#5460])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([fdo#111825] / [i915#1825]) +7 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#3458]) +2 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#8708]) +3 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#8708]) +5 similar issues
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#3023]) +5 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#3458]) +5 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#8228])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([fdo#109274] / [i915#5354])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#5176]) +3 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#5176]) +7 similar issues
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#5176]) +11 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][197] ([fdo#109271]) +252 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb2/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#5235]) +5 similar issues
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#5235]) +7 similar issues
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#5235]) +15 similar issues
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#5235]) +7 similar issues
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#658]) +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][203] ([fdo#111068] / [i915#658])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#4348]) +1 similar issue
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@basic:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#1072]) +2 similar issues
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-16/igt@kms_psr@basic.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#1072]) +1 similar issue
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([fdo#110189]) +3 similar issues
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-7/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr@sprite_blt:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#1072])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-2/igt@kms_psr@sprite_blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg1:          [PASS][209] -> [DMESG-WARN][210] ([i915#1982])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-19/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#4235])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_selftest@drm_format:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#8661])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_selftest@drm_format.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#8661])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_selftest@drm_format.html

  * igt@kms_vblank@pipe-c-query-forked-busy-hang:
    - shard-dg2:          [PASS][214] -> [SKIP][215] ([i915#2575]) +162 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_vblank@pipe-c-query-forked-busy-hang.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_vblank@pipe-c-query-forked-busy-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-idle:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#4070] / [i915#6768]) +2 similar issues
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@kms_vblank@pipe-c-ts-continuation-idle.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#4070] / [i915#533] / [i915#6768])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_vblank@pipe-d-query-idle-hang.html

  * igt@kms_vrr@flip-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#8808])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@kms_vrr@flip-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#5608]) +10 similar issues
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@perf@gen12-mi-rpc.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([fdo#109289]) +3 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][221] ([i915#7484])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#2433])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [PASS][223] -> [SKIP][224] ([i915#5608]) +5 similar issues
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@perf_pmu@all-busy-idle-check-all.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][225] ([i915#5793] / [i915#6121])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@perf_pmu@module-unload.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([fdo#109291])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@prime_udl.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#3291] / [i915#3708])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][228] ([i915#8445])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@prime_vgem@coherency-blt.html

  * igt@v3d/v3d_get_param@get-bad-flags:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([fdo#109315]) +4 similar issues
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@v3d/v3d_get_param@get-bad-flags.html

  * igt@v3d/v3d_get_param@get-bad-param:
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#2575]) +6 similar issues
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@v3d/v3d_get_param@get-bad-param.html

  * igt@v3d/v3d_submit_csd@job-perfmon:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#2575]) +2 similar issues
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-12/igt@v3d/v3d_submit_csd@job-perfmon.html

  * igt@v3d/v3d_wait_bo@bad-bo:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([fdo#109315] / [i915#2575]) +1 similar issue
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-3/igt@v3d/v3d_wait_bo@bad-bo.html

  * igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#7711])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html

  * igt@vc4/vc4_perfmon@create-single-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#7711]) +4 similar issues
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@vc4/vc4_perfmon@create-single-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#7711]) +1 similar issue
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#7711])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#2575])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-10/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2:          [SKIP][238] ([i915#6767]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@core_hotunplug@unbind-rebind.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@core_hotunplug@unbind-rebind.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][240] ([i915#7742]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][242] ([i915#6268]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-mtlp:         [ABORT][244] ([i915#7941]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-8/igt@gem_eio@in-flight-contexts-10ms.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][246] ([i915#5784]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-18/igt@gem_eio@reset-stress.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [FAIL][248] ([i915#2842]) -> [PASS][249] +1 similar issue
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][250] ([i915#2842]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-dg2:          [SKIP][252] ([fdo#109283] / [i915#2575]) -> [PASS][253] +1 similar issue
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_params@no-bsd.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_exec_params@no-bsd.html

  * igt@gem_vm_create@execbuf:
    - shard-dg2:          [SKIP][254] ([i915#2575]) -> [PASS][255] +231 similar issues
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_vm_create@execbuf.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@gem_vm_create@execbuf.html

  * igt@i915_hangman@gt-engine-error@vcs0:
    - shard-mtlp:         [FAIL][256] ([i915#7069]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-5/igt@i915_hangman@gt-engine-error@vcs0.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@i915_hangman@gt-engine-error@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][258] ([i915#7061] / [i915#8617]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-dg1:          [SKIP][260] ([i915#1937]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-12/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-dg1:          [FAIL][262] ([i915#3591]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-dg1:          [FAIL][264] ([i915#7691]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-15/igt@i915_pm_rpm@basic-pci-d3-state.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@gem-execbuf-stress@lmem0:
    - shard-dg1:          [FAIL][266] ([i915#7940]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-12/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg1:          [SKIP][268] ([i915#1397]) -> [PASS][269]
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-dg2:          [SKIP][270] ([i915#5174]) -> [PASS][271] +2 similar issues
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_rpm@system-suspend.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@i915_pm_rpm@system-suspend.html
    - shard-tglu:         [FAIL][272] ([i915#7940]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-tglu-9/igt@i915_pm_rpm@system-suspend.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-7/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@live@migrate:
    - shard-dg2:          [FAIL][274] ([i915#7913]) -> [PASS][275] +15 similar issues
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_selftest@live@migrate.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [FAIL][276] -> [PASS][277] +20 similar issues
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_selftest@live@objects.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@i915_selftest@live@objects.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         [FAIL][278] ([i915#3743]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [FAIL][280] ([i915#5138]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][282] ([i915#2346]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          [FAIL][284] ([i915#6880]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][286] ([fdo#109315]) -> [PASS][287] +30 similar issues
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_plane@pixel-format@pipe-b-planes:
    - shard-mtlp:         [FAIL][288] ([i915#1623]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-4/igt@kms_plane@pixel-format@pipe-b-planes.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@kms_plane@pixel-format@pipe-b-planes.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][290] ([IGT#2]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@kms_sysfs_edid_timing.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_sysfs_edid_timing.html

  * igt@perf@non-system-wide-paranoid:
    - shard-dg2:          [SKIP][292] ([i915#5608]) -> [PASS][293] +7 similar issues
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@perf@non-system-wide-paranoid.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@perf@non-system-wide-paranoid.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [FAIL][294] ([i915#4349]) -> [PASS][295] +2 similar issues
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-18/igt@perf_pmu@busy-double-start@vcs1.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@sysfs_heartbeat_interval@nopreempt@rcs0:
    - shard-glk:          [FAIL][296] -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-glk7/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-glk3/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html
    - shard-mtlp:         [FAIL][298] ([i915#6015]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          [SKIP][300] ([i915#2575]) -> [SKIP][301] ([i915#8411])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          [SKIP][302] ([i915#8411]) -> [SKIP][303] ([i915#2575])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@api_intel_bb@object-reloc-purge-cache.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          [SKIP][304] ([i915#2575]) -> [FAIL][305] ([i915#6122])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@api_intel_bb@render-ccs.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@api_intel_bb@render-ccs.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-dg2:          [SKIP][306] ([i915#8414]) -> [SKIP][307] ([i915#5608])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@drm_fdinfo@all-busy-check-all.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-dg2:          [SKIP][308] ([i915#5608]) -> [SKIP][309] ([i915#8414]) +1 similar issue
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@drm_fdinfo@virtual-busy.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@drm_fdinfo@virtual-busy.html

  * igt@feature_discovery@psr1:
    - shard-dg2:          [SKIP][310] ([i915#2575]) -> [SKIP][311] ([i915#658])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@feature_discovery@psr1.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@feature_discovery@psr1.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          [SKIP][312] ([i915#7697]) -> [SKIP][313] ([i915#2575])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@gem_basic@multigpu-create-close.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          [SKIP][314] ([i915#8555]) -> [SKIP][315] ([i915#2575]) +3 similar issues
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-hostile.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          [SKIP][316] ([i915#2575]) -> [SKIP][317] ([i915#8555]) +1 similar issue
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][318] ([i915#2575]) -> [SKIP][319] ([i915#280])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_ctx_sseu@engines.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          [SKIP][320] ([i915#280]) -> [SKIP][321] ([i915#2575]) +1 similar issue
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [ABORT][322] ([i915#7975] / [i915#8213]) -> [SKIP][323] ([i915#2575])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@gem_eio@hibernate.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          [SKIP][324] ([i915#2575]) -> [FAIL][325] ([i915#5784])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_eio@kms.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          [SKIP][326] ([i915#4771]) -> [SKIP][327] ([i915#2575])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@gem_exec_balancer@bonded-dual.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          [SKIP][328] ([i915#4812]) -> [SKIP][329] ([i915#2575]) +1 similar issue
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][330] ([i915#2575]) -> [SKIP][331] ([i915#4812]) +1 similar issue
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          [SKIP][332] ([i915#4036]) -> [SKIP][333] ([i915#2575])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          [SKIP][334] ([i915#3539]) -> [SKIP][335] ([i915#2575]) +1 similar issue
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@gem_exec_fair@basic-throttle.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][336] ([i915#2575]) -> [SKIP][337] ([i915#3539]) +2 similar issues
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          [SKIP][338] ([i915#3539] / [i915#4852]) -> [SKIP][339] ([i915#2575]) +2 similar issues
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@gem_exec_flush@basic-wb-prw-default.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          [SKIP][340] ([i915#2575]) -> [SKIP][341] ([i915#3539] / [i915#4852]) +2 similar issues
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-default.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-dg2:          [SKIP][342] ([i915#2575]) -> [SKIP][343] ([i915#7697])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          [SKIP][344] ([fdo#112283]) -> [SKIP][345] ([i915#2575])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@gem_exec_params@secure-non-master.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-dg2:          [SKIP][346] ([i915#3281]) -> [SKIP][347] ([i915#2575]) +11 similar issues
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@gem_exec_reloc@basic-cpu-noreloc.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          [SKIP][348] ([i915#2575]) -> [SKIP][349] ([i915#3281]) +14 similar issues
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          [SKIP][350] ([i915#4537] / [i915#4812]) -> [SKIP][351] ([i915#2575])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          [SKIP][352] ([i915#2575]) -> [SKIP][353] ([i915#4537] / [i915#4812]) +1 similar issue
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [ABORT][354] ([i915#7392] / [i915#8131]) -> [TIMEOUT][355] ([i915#7392])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          [SKIP][356] ([i915#2575]) -> [SKIP][357] ([i915#4860]) +3 similar issues
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_media_vme:
    - shard-dg2:          [SKIP][358] ([i915#284]) -> [SKIP][359] ([i915#2575])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@gem_media_vme.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg2:          [SKIP][360] ([i915#2575]) -> [SKIP][361] ([i915#4077]) +13 similar issues
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-y.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          [SKIP][362] ([i915#4083]) -> [SKIP][363] ([i915#2575]) +7 similar issues
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-2/igt@gem_mmap_wc@bad-object.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          [SKIP][364] ([i915#2575]) -> [SKIP][365] ([i915#4083]) +4 similar issues
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_mmap_wc@copy.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          [SKIP][366] ([i915#2575]) -> [SKIP][367] ([i915#3282]) +5 similar issues
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-uncached.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-dg2:          [SKIP][368] ([i915#3282]) -> [SKIP][369] ([i915#2575]) +2 similar issues
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-2/igt@gem_pread@exhaustion.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg2:          [SKIP][370] ([i915#4270]) -> [SKIP][371] ([i915#2575]) +2 similar issues
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@gem_pxp@create-protected-buffer.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          [SKIP][372] ([i915#2575]) -> [SKIP][373] ([i915#4270]) +5 similar issues
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          [SKIP][374] ([i915#2575] / [i915#5190]) -> [SKIP][375] ([i915#5190]) +10 similar issues
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-dg2:          [SKIP][376] ([i915#5190]) -> [SKIP][377] ([i915#2575] / [i915#5190]) +4 similar issues
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-1/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          [SKIP][378] ([i915#2575]) -> [SKIP][379] ([i915#4079])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_render_tiled_blits@basic.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          [SKIP][380] ([i915#4079]) -> [SKIP][381] ([i915#2575]) +3 similar issues
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@gem_tiled_pread_pwrite.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiled_wb:
    - shard-dg2:          [SKIP][382] ([i915#4077]) -> [SKIP][383] ([i915#2575]) +10 similar issues
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@gem_tiled_wb.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_tiled_wb.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-dg2:          [SKIP][384] ([i915#3297]) -> [SKIP][385] ([i915#2575])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@gem_userptr_blits@dmabuf-sync.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          [SKIP][386] ([i915#2575]) -> [SKIP][387] ([i915#3297]) +1 similar issue
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_userptr_blits@dmabuf-unsync.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          [SKIP][388] ([i915#2575]) -> [SKIP][389] ([i915#3297] / [i915#4880])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          [SKIP][390] ([i915#3297] / [i915#4880]) -> [SKIP][391] ([i915#2575])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          [SKIP][392] ([fdo#109289]) -> [SKIP][393] ([i915#2575]) +1 similar issue
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-1/igt@gen7_exec_parse@basic-rejected.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          [SKIP][394] ([i915#2575]) -> [SKIP][395] ([fdo#109289]) +3 similar issues
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gen7_exec_parse@bitmasks.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          [SKIP][396] ([i915#2575]) -> [SKIP][397] ([i915#2856]) +4 similar issues
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gen9_exec_parse@bb-start-far.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          [SKIP][398] ([i915#2856]) -> [SKIP][399] ([i915#2575]) +2 similar issues
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@gen9_exec_parse@valid-registers.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_backlight@fade-with-suspend:
    - shard-dg2:          [SKIP][400] ([i915#2575]) -> [SKIP][401] ([i915#5354] / [i915#7561]) +1 similar issue
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_backlight@fade-with-suspend.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@i915_pm_backlight@fade-with-suspend.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-dg2:          [SKIP][402] ([i915#658]) -> [SKIP][403] ([i915#2575])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@i915_pm_dc@dc5-psr.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][404] ([i915#5174]) -> [SKIP][405] ([i915#1397])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_rpm@dpms-lpsp.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-dg2:          [SKIP][406] ([i915#5174]) -> [SKIP][407] ([i915#4077]) +1 similar issue
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_rpm@gem-evict-pwrite.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          [SKIP][408] ([fdo#109506]) -> [SKIP][409] ([i915#5174])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         [FAIL][410] ([i915#7940]) -> [SKIP][411] ([fdo#111644] / [i915#1397])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-tglu-2/igt@i915_pm_rpm@modeset-non-lpsp.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-8/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-dg2:          [SKIP][412] ([i915#5174]) -> [SKIP][413] ([fdo#109506])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          [SKIP][414] ([i915#6621]) -> [SKIP][415] ([i915#2575]) +1 similar issue
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-1/igt@i915_pm_rps@min-max-config-idle.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          [SKIP][416] ([i915#2575]) -> [SKIP][417] ([i915#4387])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_sseu@full-enable.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          [SKIP][418] ([i915#2575]) -> [SKIP][419] ([i915#6188])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          [SKIP][420] ([i915#2575]) -> [SKIP][421] ([fdo#109302])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_query@query-topology-unsupported.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          [SKIP][422] ([i915#4212]) -> [SKIP][423] ([i915#2575])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          [SKIP][424] ([i915#2575]) -> [SKIP][425] ([i915#4212])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          [SKIP][426] -> [SKIP][427] ([i915#6228])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][428] ([i915#1769] / [i915#3555]) -> [SKIP][429] ([i915#2575])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][430] ([fdo#111614]) -> [SKIP][431] ([fdo#109315]) +2 similar issues
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][432] ([fdo#109315]) -> [SKIP][433] ([fdo#111614]) +3 similar issues
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          [SKIP][434] ([fdo#109315] / [i915#5190]) -> [SKIP][435] ([i915#5190]) +7 similar issues
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          [SKIP][436] ([i915#5190]) -> [SKIP][437] ([fdo#109315] / [i915#5190]) +5 similar issues
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][438] ([i915#4538] / [i915#5190]) -> [SKIP][439] ([fdo#109315] / [i915#5190]) +4 similar issues
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][440] ([fdo#109315] / [i915#5190]) -> [SKIP][441] ([i915#4538] / [i915#5190]) +8 similar issues
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          [SKIP][442] ([i915#2705]) -> [SKIP][443] ([fdo#109315])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_big_joiner@basic.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-dg2:          [SKIP][444] ([i915#2575]) -> [SKIP][445] ([i915#3689] / [i915#3886] / [i915#5354]) +16 similar issues
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          [SKIP][446] ([i915#3689] / [i915#3886] / [i915#5354]) -> [SKIP][447] ([i915#2575]) +4 similar issues
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          [SKIP][448] ([i915#3689] / [i915#5354]) -> [SKIP][449] ([i915#2575]) +26 similar issues
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-1/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs:
    - shard-dg2:          [SKIP][450] ([i915#5354]) -> [SKIP][451] ([i915#2575]) +19 similar issues
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
    - shard-dg2:          [SKIP][452] ([i915#2575]) -> [SKIP][453] ([i915#5354]) +20 similar issues
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-dg2:          [SKIP][454] ([i915#2575]) -> [SKIP][455] ([i915#3689] / [i915#5354]) +23 similar issues
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          [SKIP][456] ([i915#2575]) -> [SKIP][457] ([fdo#111827]) +1 similar issue
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_chamelium_color@degamma.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2:          [SKIP][458] ([fdo#111827]) -> [SKIP][459] ([i915#2575]) +1 similar issue
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@kms_chamelium_color@gamma.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          [SKIP][460] ([i915#7828]) -> [SKIP][461] ([i915#2575]) +6 similar issues
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-fast.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          [SKIP][462] ([i915#2575]) -> [SKIP][463] ([i915#7828]) +9 similar issues
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_chamelium_frames@dp-frame-dump.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          [SKIP][464] ([i915#2575]) -> [SKIP][465] ([i915#3299])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_content_protection@dp-mst-type-0.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          [SKIP][466] ([i915#2575]) -> [SKIP][467] ([i915#7118])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_content_protection@mei_interface.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][468] ([i915#7118]) -> [SKIP][469] ([i915#2575]) +2 similar issues
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_content_protection@type1.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          [SKIP][470] ([i915#3359]) -> [SKIP][471] ([i915#2575])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          [SKIP][472] ([i915#2575]) -> [SKIP][473] ([i915#3359]) +1 similar issue
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x512.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][474] ([i915#2575]) -> [SKIP][475] ([i915#3555]) +8 similar issues
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/index.html

--===============1515500624144327198==
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
<tr><td><b>Series:</b></td><td>xe: Rename engine to exec_queue (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121884/">https://patchwork.freedesktop.org/series/121884/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13462_full -&gt; IGTPW_9497_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9497_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9497_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/index.html</p>
<h2>Participating hosts (9 -&gt; 10)</h2>
<p>Additional (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9497_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-snb2/igt@gem_mmap_gtt@medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb4/igt@gem_mmap_gtt@medium-copy-xy.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@region:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-2/igt@i915_selftest@perf@region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_selftest@perf@region.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_async_flips@test-cursor.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-edp-1.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-2/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_pxp@fail-invalid-protected-context:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-snb4/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb7/igt@gem_pxp@fail-invalid-protected-context.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9497_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-12/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</p>
</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy_test:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb5/igt@drm_buddy@drm_buddy_test.html">SKIP</a> ([fdo#109271] / [i915#8661])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-1/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> ([i915#8414]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> ([i915#8414]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@fbdev@unaligned-write.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-12/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +1 similar issue</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_caching@read-writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#5325])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-8/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG-WARN</a> ([i915#8841]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-6/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> ([i915#2410]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb1/igt@gem_ctx_persistence@hostile.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@bsd2:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-4/igt@gem_ctx_persistence@legacy-engines-hang@bsd2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hang@bsd2.html">ABORT</a> ([i915#8865])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> ([i915#7816]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-17/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-15/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_exec_balancer@sliced.html">SKIP</a> ([i915#4812]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@gem_exec_fair@basic-flow.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gem_exec_flush@basic-wb-set-default.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> ([i915#3281]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> ([i915#3281]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-self:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html">SKIP</a> ([i915#2575]) +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_exec_suspend@basic-s3@lmem0.html">FAIL</a> ([fdo#103375])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_lmem_swapping@random.html">SKIP</a> ([i915#5775]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-8/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@gem_mmap@bad-size.html">SKIP</a> ([i915#4083]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@short-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@gem_mmap@short-mmap.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@gem_mmap_gtt@fault-concurrent.html">SKIP</a> ([i915#4077]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@gem_partial_pwrite_pread@write.html">SKIP</a> ([i915#3282]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL</a> ([i915#8295])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#3282]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-16/igt@gem_pwrite_snooped.html">SKIP</a> ([i915#3282]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-9/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_readwrite@new-obj.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#8428]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-1/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@gem_tiled_fence_blits@basic.html">SKIP</a> ([i915#4077]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> ([i915#4077]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-banned@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@gem_userptr_blits@mmap-offset-banned@gtt.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-8/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2856]) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">FAIL</a> ([i915#8691])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-2/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">FAIL</a> ([i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#5174]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-16/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#1397]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#8437])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc.html">SKIP</a> ([i915#8709]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html">SKIP</a> ([i915#8502]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8247]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@kms_async_flips@crc@pipe-d-edp-1.html">DMESG-FAIL</a> ([i915#8561]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-16/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html">FAIL</a> ([i915#8247]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#109315]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5286]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-5/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> ([fdo#109315] / [i915#5190]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#5190]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-15/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#4538]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([i915#6187]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#6095]) +4 similar issues</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-13/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-7/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-15/igt@kms_ccs@pipe-b-bad-pixel-format-yf_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_ccs@pipe-b-ccs-on-another-bo-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-16/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-7/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-4/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([i915#6095]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-2/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#5354]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_chamelium_color@ctm-max.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-17/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#8063])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-1/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#3359])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([i915#3546]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> ([i915#3555]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-16/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#111825]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-10/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> ([fdo#109274] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#111825]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> ([fdo#109315]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> ([fdo#109280]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([i915#5460])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> ([i915#8708]) +5 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> ([i915#3023]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> ([i915#3458]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#109274] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#5176]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#5176]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-snb2/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html">SKIP</a> ([fdo#109271]) +252 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#5235]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#4348]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-16/igt@kms_psr@basic.html">SKIP</a> ([i915#1072]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([i915#1072]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-7/igt@kms_psr@psr2_sprite_render.html">SKIP</a> ([fdo#110189]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-2/igt@kms_psr@sprite_blt.html">SKIP</a> ([i915#1072])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-19/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_selftest@drm_format.html">SKIP</a> ([i915#8661])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_selftest@drm_format.html">SKIP</a> ([i915#8661])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-busy-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_vblank@pipe-c-query-forked-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_vblank@pipe-c-query-forked-busy-hang.html">SKIP</a> ([i915#2575]) +162 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@kms_vblank@pipe-c-ts-continuation-idle.html">SKIP</a> ([i915#4070] / [i915#6768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@kms_vblank@pipe-d-query-idle-hang.html">SKIP</a> ([i915#4070] / [i915#533] / [i915#6768])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@kms_vrr@flip-suspend.html">SKIP</a> ([i915#8808])</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@perf@gen12-mi-rpc.html">SKIP</a> ([i915#5608]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> ([i915#7484])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html">SKIP</a> ([i915#5608]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@perf_pmu@module-unload.html">FAIL</a> ([i915#5793] / [i915#6121])</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@prime_udl.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@prime_vgem@coherency-blt.html">FAIL</a> ([i915#8445])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-flags:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-6/igt@v3d/v3d_get_param@get-bad-flags.html">SKIP</a> ([fdo#109315]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-6/igt@v3d/v3d_get_param@get-bad-param.html">SKIP</a> ([i915#2575]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@job-perfmon:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-12/igt@v3d/v3d_submit_csd@job-perfmon.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@bad-bo:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-3/igt@v3d/v3d_wait_bo@bad-bo.html">SKIP</a> ([fdo#109315] / [i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-18/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html">SKIP</a> ([i915#7711])</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a> ([i915#7711]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html">SKIP</a> ([i915#7711]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html">SKIP</a> ([i915#7711])</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-10/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@core_hotunplug@unbind-rebind.html">SKIP</a> ([i915#6767]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-8/igt@gem_eio@in-flight-contexts-10ms.html">ABORT</a> ([i915#7941]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-18/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_exec_params@no-bsd.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@execbuf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_vm_create@execbuf.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@gem_vm_create@execbuf.html">PASS</a> +231 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-5/igt@i915_hangman@gt-engine-error@vcs0.html">FAIL</a> ([i915#7069]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@i915_hangman@gt-engine-error@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#7061] / [i915#8617]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-12/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([i915#1937]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-15/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> ([i915#7691]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-12/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_rpm@system-suspend.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@i915_pm_rpm@system-suspend.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-tglu-9/igt@i915_pm_rpm@system-suspend.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-7/igt@i915_pm_rpm@system-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_selftest@live@migrate.html">FAIL</a> ([i915#7913]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@i915_selftest@live@migrate.html">PASS</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_selftest@live@objects.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@i915_selftest@live@objects.html">PASS</a> +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-planes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-4/igt@kms_plane@pixel-format@pipe-b-planes.html">FAIL</a> ([i915#1623]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-5/igt@kms_plane@pixel-format@pipe-b-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@perf@non-system-wide-paranoid.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@perf@non-system-wide-paranoid.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg1-18/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-glk7/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-glk3/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html">FAIL</a> ([i915#6015]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@api_intel_bb@render-ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a> ([i915#8414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a> ([i915#5608])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@drm_fdinfo@virtual-busy.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@drm_fdinfo@virtual-busy.html">SKIP</a> ([i915#8414]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@feature_discovery@psr1.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_eio@hibernate.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_eio@kms.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_eio@kms.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-3/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> ([i915#2575]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> ([i915#7392] / [i915#8131]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html">TIMEOUT</a> ([i915#7392])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@gem_media_vme.html">SKIP</a> ([i915#284]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_media_vme.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> ([i915#4077]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-2/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#4083]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#2575]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-2/igt@gem_pread@exhaustion.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_pread@exhaustion.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-1/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_wb:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-8/igt@gem_tiled_wb.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_tiled_wb.html">SKIP</a> ([i915#2575]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-1/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@i915_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#5354] / [i915#7561]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@i915_pm_dc@dc5-psr.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_pm_dc@dc5-psr.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> ([i915#4077]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([i915#5174])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-tglu-2/igt@i915_pm_rpm@modeset-non-lpsp.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-tglu-8/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-1/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#109315]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#5190]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109315] / [i915#5190]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#109315] / [i915#5190]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-1/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#2575]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#2575]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-1/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_chamelium_color@degamma.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-10/igt@kms_chamelium_color@gamma.html">SKIP</a> ([fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_chamelium_color@gamma.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#2575]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> ([i915#7828]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-8/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_content_protection@type1.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13462/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9497/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2:</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1515500624144327198==--
