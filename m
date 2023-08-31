Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3468286260682929673=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 31 Aug 2023 12:20:21 -0000
Message-ID: <169348442174.12508.17306134317004672748@emeril.freedesktop.org>
References: <20230831060243.1048579-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230831060243.1048579-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmV2ZXJ0?=
 =?utf-8?q?_=22tests/intel-ci=3A_Drop_tiling_tests_from_xe_blocklist=22?=
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

--===============3468286260682929673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "tests/intel-ci: Drop tiling tests from xe blocklist"
URL   : https://patchwork.freedesktop.org/series/123095/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13578_full -> IGTPW_9689_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9689_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9689_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9689_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128:
    - shard-mtlp:         [PASS][1] -> [FAIL][2] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-5/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-3/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128.html

  * igt@kms_vblank@pipe-a-query-idle-hang:
    - shard-mtlp:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@kms_vblank@pipe-a-query-idle-hang.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@kms_vblank@pipe-a-query-idle-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_9689_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][6] ([i915#6122])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@api_intel_bb@render-ccs.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8414]) +20 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [PASS][8] -> [FAIL][9] ([i915#7742])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#3555] / [i915#5325])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#7697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [PASS][12] -> [FAIL][13] ([i915#6268])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#1099])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb2/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8555])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#8555])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
    - shard-mtlp:         [PASS][17] -> [FAIL][18] ([i915#2410])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-3/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
    - shard-mtlp:         NOTRUN -> [FAIL][19] ([i915#2410]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-rkl:          [PASS][20] -> [FAIL][21] ([i915#5099])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-4/igt@gem_ctx_persistence@smoketest.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [PASS][23] -> [ABORT][24] ([i915#7975] / [i915#8213] / [i915#8398])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-tglu-8/igt@gem_eio@hibernate.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-10/igt@gem_eio@hibernate.html
    - shard-dg2:          NOTRUN -> [ABORT][25] ([i915#7975] / [i915#8213])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-mtlp:         [PASS][26] -> [ABORT][27] ([i915#7941])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-3/igt@gem_eio@in-flight-contexts-10ms.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@kms:
    - shard-dg1:          [PASS][28] -> [FAIL][29] ([i915#5784])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg1-14/igt@gem_eio@kms.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][30] ([i915#8898])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4771])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-10/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@hog:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4812])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][33] -> [FAIL][34] ([i915#2846])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglu:         [PASS][35] -> [FAIL][36] ([i915#2842]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-tglu-3/igt@gem_exec_fair@basic-flow@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-8/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][37] ([i915#2842])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-rkl:          [PASS][38] -> [FAIL][39] ([i915#2842]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#2842]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fence@parallel@bcs0:
    - shard-mtlp:         [PASS][42] -> [DMESG-FAIL][43] ([i915#8962] / [i915#9121]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@gem_exec_fence@parallel@bcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@gem_exec_fence@parallel@bcs0.html

  * igt@gem_exec_fence@parallel@vcs0:
    - shard-mtlp:         [PASS][44] -> [DMESG-FAIL][45] ([i915#9121])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@gem_exec_fence@parallel@vcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@gem_exec_fence@parallel@vcs0.html

  * igt@gem_exec_fence@parallel@vecs0:
    - shard-mtlp:         [PASS][46] -> [FAIL][47] ([i915#8957]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@gem_exec_fence@parallel@vecs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4812])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([fdo#112283]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3281]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3281]) +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#3281]) +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@gem_exec_reloc@basic-write-cpu-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4860])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#284])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4077]) +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@gem_mmap_gtt@bad-object.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4077]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4077]) +10 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@copy:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4083]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4083]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3282]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3282]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3282]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4270]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4270])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4270])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#8428]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-3/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4079]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_userptr_blits@mmap-offset-banned@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3297]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@gem_userptr_blits@mmap-offset-banned@gtt.html

  * igt@gem_userptr_blits@nohangcheck:
    - shard-mtlp:         [PASS][73] -> [FAIL][74] ([i915#6268])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-3/igt@gem_userptr_blits@nohangcheck.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_userptr_blits@nohangcheck.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3297])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@gem_userptr_blits@unsync-overlap.html
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3297])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][77] ([i915#2724])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb4/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([fdo#109289]) +4 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-10/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([fdo#109289])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#2527]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-16/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#2856]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_fb_tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4881])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@i915_fb_tiling.html

  * igt@i915_module_load@load:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#6227])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@i915_module_load@load.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#8436])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#1937])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#8430])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][87] -> [SKIP][88] ([i915#1397])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          [PASS][89] -> [SKIP][90] ([i915#1397]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg1-12/igt@i915_pm_rpm@modeset-non-lpsp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#6621])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#8925])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@i915_pm_rps@thresholds@gt0.html

  * igt@i915_selftest@live@migrate:
    - shard-mtlp:         [PASS][93] -> [DMESG-FAIL][94] ([i915#7699])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@i915_selftest@live@migrate.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-3/igt@i915_selftest@live@migrate.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-snb:          NOTRUN -> [DMESG-WARN][95] ([i915#8841])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb4/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-mtlp:         [PASS][96] -> [FAIL][97] ([i915#2521])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#8502]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#8709]) +11 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [FAIL][100] ([i915#8247]) +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#6228])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#1769] / [i915#3555])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([fdo#111614]) +5 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4538] / [i915#5286]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         [PASS][105] -> [FAIL][106] ([i915#3743])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [PASS][107] -> [FAIL][108] ([i915#5138])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3638])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([fdo#111614]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-mtlp:         NOTRUN -> [FAIL][111] ([i915#3743]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([fdo#111615])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#5190]) +5 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#4538] / [i915#5190]) +5 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([fdo#111615])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([fdo#110723])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#2705])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-10/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#3886] / [i915#6095]) +3 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-18/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#3689] / [i915#5354]) +14 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#6095]) +9 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#3689] / [i915#5354] / [i915#6095]) +5 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#5354]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#3689] / [i915#3886] / [i915#5354]) +4 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#5354] / [i915#6095])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-9/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#5354] / [i915#6095]) +5 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#4087]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([fdo#111827])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([fdo#111827])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([fdo#111827])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#7828]) +5 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#7828])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#7828])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#7828])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#7828]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#7118]) +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_content_protection@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#7118])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei_interface:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#8063])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([fdo#109279] / [i915#3359])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#3359]) +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#3359]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#3555]) +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([fdo#109274] / [i915#5354]) +2 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([fdo#111825])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][145] ([fdo#109274])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4103] / [i915#4213]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][148] -> [FAIL][149] ([i915#2346])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#8812])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#3555] / [i915#3840])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-mtlp:         [PASS][152] -> [DMESG-WARN][153] ([i915#1982])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@kms_fbcon_fbt@psr-suspend.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([fdo#109274]) +2 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-plain-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#3637]) +2 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#8381])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][157] ([fdo#103375]) +1 similar issue
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-dg2:          [PASS][158] -> [FAIL][159] ([fdo#103375]) +2 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#2672] / [i915#3555])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#2587] / [i915#2672])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#2672])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#5354]) +32 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#8708]) +10 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([fdo#111825] / [i915#1825]) +3 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#8708]) +5 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#5439])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-dg2:          [PASS][168] -> [FAIL][169] ([i915#6880])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#3458]) +5 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([fdo#111825]) +12 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#1825]) +13 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#3458]) +11 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][174] ([fdo#109271]) +200 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#6118])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3555] / [i915#8228])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3555] / [i915#8228]) +1 similar issue
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([fdo#109289]) +1 similar issue
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#8821])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#5176]) +5 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#5176]) +3 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#5176]) +3 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#5176]) +15 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#5235]) +15 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#5235]) +23 similar issues
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#5235]) +3 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#6524] / [i915#6805])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#658]) +1 similar issue
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@primary_render:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#1072]) +1 similar issue
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-16/igt@kms_psr@primary_render.html

  * igt@kms_psr@sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#1072]) +4 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@kms_psr@sprite_plane_move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([fdo#111615] / [i915#5289])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-tglu:         NOTRUN -> [SKIP][192] ([fdo#111615] / [i915#5289])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#4235])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3555]) +1 similar issue
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_selftest@drm_cmdline:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#8661])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_selftest@drm_cmdline.html

  * igt@kms_selftest@drm_format:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#8661])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@kms_selftest@drm_format.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][197] ([i915#5465]) +1 similar issue
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#3555] / [i915#4098])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#8623])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-apl:          [PASS][200] -> [ABORT][201] ([i915#180])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#2437])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@kms_writeback@writeback-check-output.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#2434])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#2435])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#8516])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt1:
    - shard-mtlp:         [PASS][206] -> [SKIP][207] ([i915#8537]) +2 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-5/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-3/igt@perf_pmu@rc6@runtime-pm-long-gt1.html

  * igt@prime_vgem@basic-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][208] ([i915#8445])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@prime_vgem@basic-blt.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3291] / [i915#3708])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#3708])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@prime_vgem@basic-write.html

  * igt@sysfs_heartbeat_interval@mixed@ccs0:
    - shard-mtlp:         [PASS][211] -> [ABORT][212] ([i915#8552])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@sysfs_heartbeat_interval@mixed@ccs0.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@ccs0.html

  * igt@sysfs_heartbeat_interval@mixed@vecs0:
    - shard-mtlp:         [PASS][213] -> [FAIL][214] ([i915#1731])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@sysfs_heartbeat_interval@mixed@vecs0.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@vecs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-mtlp:         [PASS][215] -> [TIMEOUT][216] ([i915#6950])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@sysfs_timeslice_duration@timeout@vecs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#4818])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#2575]) +4 similar issues
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html

  * igt@v3d/v3d_submit_cl@bad-bo:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#2575]) +7 similar issues
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@v3d/v3d_submit_cl@bad-bo.html

  * igt@v3d/v3d_submit_cl@valid-multisync-submission:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([fdo#109315])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-4/igt@v3d/v3d_submit_cl@valid-multisync-submission.html

  * igt@v3d/v3d_wait_bo@map-bo-0ns:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#2575]) +6 similar issues
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-5/igt@v3d/v3d_wait_bo@map-bo-0ns.html

  * igt@vc4/vc4_label_bo@set-kernel-name:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#7711]) +3 similar issues
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-16/igt@vc4/vc4_label_bo@set-kernel-name.html

  * igt@vc4/vc4_tiling@get-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#7711]) +7 similar issues
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@vc4/vc4_tiling@get-bad-handle.html

  * igt@vc4/vc4_wait_bo@used-bo-1ns:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#7711]) +1 similar issue
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@vc4/vc4_wait_bo@used-bo-1ns.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [FAIL][225] ([i915#2410]) -> [PASS][226] +2 similar issues
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-mtlp:         [FAIL][227] ([i915#4475]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-7/igt@gem_exec_capture@pi@vcs0.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][229] ([i915#2846]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-glk6/igt@gem_exec_fair@basic-deadline.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-glk2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][231] ([i915#2842]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-rkl:          [FAIL][233] ([i915#2842]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [FAIL][235] ([i915#9051]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-5/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [DMESG-WARN][237] ([i915#4936] / [i915#5493]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          [TIMEOUT][239] ([i915#5493]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_spin_batch@user-each:
    - shard-mtlp:         [DMESG-FAIL][241] ([i915#8962] / [i915#9121]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@gem_spin_batch@user-each.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@gem_spin_batch@user-each.html

  * igt@i915_hangman@engine-engine-error@vcs0:
    - shard-mtlp:         [FAIL][243] ([i915#7069]) -> [PASS][244] +1 similar issue
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-5/igt@i915_hangman@engine-engine-error@vcs0.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@i915_hangman@engine-engine-error@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][245] ([i915#7061] / [i915#8617]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][247] ([i915#8489] / [i915#8668]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][249] ([i915#4281]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-tglu-7/igt@i915_pm_dc@dc9-dpms.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-rkl:          [SKIP][251] ([i915#1937]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][253] ([i915#1397]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         [FAIL][255] ([i915#3743]) -> [PASS][256] +1 similar issue
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][257] ([i915#5138]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][259] ([i915#8787]) -> [PASS][260] +1 similar issue
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-edp-1.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [FAIL][261] ([i915#2346]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][263] ([i915#2346]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          [FAIL][265] ([i915#6880]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-dg2:          [FAIL][267] ([fdo#103375]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-dg2:          [FAIL][269] ([i915#4349]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-2/igt@perf_pmu@busy-double-start@ccs0.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-mtlp:         [FAIL][271] ([i915#4349]) -> [PASS][272] +2 similar issues
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@perf_pmu@busy-double-start@vcs1.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-mtlp:         [FAIL][273] ([i915#8332]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-3/igt@sysfs_heartbeat_interval@precise@vecs0.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-mtlp:         [FAIL][275] ([i915#5138]) -> [DMESG-WARN][276] ([i915#1982])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
    - shard-snb:          [DMESG-WARN][277] ([i915#8841]) -> [INCOMPLETE][278] ([i915#7882])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-snb6/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb7/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [DMESG-FAIL][279] ([i915#1982] / [i915#2017] / [i915#5954]) -> [DMESG-FAIL][280] ([i915#2017] / [i915#5954])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][281] ([i915#3955]) -> [SKIP][282] ([fdo#110189] / [i915#3955])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][283] ([fdo#110189] / [i915#3955]) -> [SKIP][284] ([i915#3955])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_psr@sprite_plane_onoff:
    - shard-dg1:          [SKIP][285] ([i915#1072] / [i915#4078]) -> [SKIP][286] ([i915#1072])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg1-18/igt@kms_psr@sprite_plane_onoff.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@kms_psr@sprite_plane_onoff.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          [INCOMPLETE][287] ([i915#5493]) -> [CRASH][288] ([i915#7331])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][289], [FAIL][290]) ([i915#7812] / [i915#8848]) -> [FAIL][291] ([i915#7812])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-snb7/igt@runner@aborted.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-snb7/igt@runner@aborted.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb2/igt@runner@aborted.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-mtlp:         [ABORT][292] ([i915#8521] / [i915#8865]) -> [TIMEOUT][293] ([i915#8521])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@sysfs_preempt_timeout@timeout@vecs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/intel/issues/6118
  [i915#6122]: https://gitlab.freedesktop.org/drm/intel/issues/6122
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6228]: https://gitlab.freedesktop.org/drm/intel/issues/6228
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6950]: https://gitlab.freedesktop.org/drm/intel/issues/6950
  [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7331]: https://gitlab.freedesktop.org/drm/intel/issues/7331
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7812]: https://gitlab.freedesktop.org/drm/intel/issues/7812
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/intel/issues/7882
  [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8063]: https://gitlab.freedesktop.org/drm/intel/issues/8063
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8332]: https://gitlab.freedesktop.org/drm/intel/issues/8332
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8398]: https://gitlab.freedesktop.org/drm/intel/issues/8398
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/intel/issues/8430
  [i915#8436]: https://gitlab.freedesktop.org/drm/intel/issues/8436
  [i915#8445]: https://gitlab.freedesktop.org/drm/intel/issues/8445
  [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
  [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
  [i915#8537]: https://gitlab.freedesktop.org/drm/intel/issues/8537
  [i915#8552]: https://gitlab.freedesktop.org/drm/intel/issues/8552
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
  [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8787]: https://gitlab.freedesktop.org/drm/intel/issues/8787
  [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
  [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8848]: https://gitlab.freedesktop.org/drm/intel/issues/8848
  [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
  [i915#8898]: https://gitlab.freedesktop.org/drm/intel/issues/8898
  [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
  [i915#8957]: https://gitlab.freedesktop.org/drm/intel/issues/8957
  [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
  [i915#9051]: https://gitlab.freedesktop.org/drm/intel/issues/9051
  [i915#9121]: https://gitlab.freedesktop.org/drm/intel/issues/9121
  [i915#9226]: https://gitlab.freedesktop.org/drm/intel/issues/9226
  [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7459 -> IGTPW_9689
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13578: 14f06805d217f849b16778b5051b69e27759a0f6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9689: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/index.html
  IGT_7459: 7459
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/index.html

--===============3468286260682929673==
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
<tr><td><b>Series:</b></td><td>Revert &quot;tests/intel-ci: Drop tiling tests from xe blocklist&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123095/">https://patchwork.freedesktop.org/series/123095/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13578_full -&gt; IGTPW_9689_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9689_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9689_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9689_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-5/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-3/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-idle-hang:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@kms_vblank@pipe-a-query-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@kms_vblank@pipe-a-query-idle-hang.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9689_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@api_intel_bb@render-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6122">i915#6122</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb2/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@bsd1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-3/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@vebox:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-4/igt@gem_ctx_persistence@smoketest.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@gem_ctx_persistence@smoketest.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5099">i915#5099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-tglu-8/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8398">i915#8398</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-3/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_eio@in-flight-contexts-10ms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7941">i915#7941</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg1-14/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb5/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8898">i915#8898</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-10/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@gem_exec_balancer@hog.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-tglu-3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-8/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@gem_exec_fence@parallel@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@gem_exec_fence@parallel@bcs0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8962">i915#8962</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9121">i915#9121</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@gem_exec_fence@parallel@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@gem_exec_fence@parallel@vcs0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9121">i915#9121</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@gem_exec_fence@parallel@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8957">i915#8957</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@gem_exec_fence@submit67.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@gem_exec_flush@basic-wb-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@gem_exec_reloc@basic-write-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@gem_mmap_gtt@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@gem_mmap_gtt@medium-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@gem_mmap_wc@copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc-unflushed:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-3/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-banned@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@gem_userptr_blits@mmap-offset-banned@gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-3/igt@gem_userptr_blits@nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_userptr_blits@nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb4/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-10/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-16/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@i915_fb_tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8436">i915#8436</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg1-12/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@i915_pm_rps@thresholds@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-3/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb4/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6228">i915#6228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-10/igt@kms_big_joiner@2x-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-18/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-9/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8063">i915#8063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@kms_fbcon_fbt@psr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +200 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6118">i915#6118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-16/igt@kms_psr@primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@kms_psr@sprite_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-3/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-5/igt@kms_selftest@drm_cmdline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@kms_selftest@drm_format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-5/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-3/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8537">i915#8537</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@prime_vgem@basic-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8445">i915#8445</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@sysfs_heartbeat_interval@mixed@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@ccs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8552">i915#8552</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@sysfs_heartbeat_interval@mixed@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@sysfs_heartbeat_interval@mixed@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@sysfs_timeslice_duration@timeout@vecs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6950">i915#6950</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-perfmon:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-17/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@v3d/v3d_submit_cl@bad-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@valid-multisync-submission:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-4/igt@v3d/v3d_submit_cl@valid-multisync-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@map-bo-0ns:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-5/igt@v3d/v3d_wait_bo@map-bo-0ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-kernel-name:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-16/igt@vc4/vc4_label_bo@set-kernel-name.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-handle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-11/igt@vc4/vc4_tiling@get-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@used-bo-1ns:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@vc4/vc4_wait_bo@used-bo-1ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-7/igt@gem_exec_capture@pi@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4475">i915#4475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@gem_exec_capture@pi@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-glk6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-5/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9051">i915#9051</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4936">i915#4936</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@user-each:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@gem_spin_batch@user-each.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8962">i915#8962</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9121">i915#9121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@gem_spin_batch@user-each.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-5/igt@i915_hangman@engine-engine-error@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@i915_hangman@engine-engine-error@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7061">i915#7061</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8617">i915#8617</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8489">i915#8489</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-tglu-7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8787">i915#8787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-edp-1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-2/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-8/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-8/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8332">i915#8332</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-3/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-snb6/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb7/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg1-18/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg1-19/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-dg2-12/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7331">i915#7331</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-snb:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-snb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-snb7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7812">i915#7812</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8848">i915#8848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-snb2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7812">i915#7812</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8521">i915#8521</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8865">i915#8865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/shard-mtlp-7/igt@sysfs_preempt_timeout@timeout@vecs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8521">i915#8521</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7459 -&gt; IGTPW_9689</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13578: 14f06805d217f849b16778b5051b69e27759a0f6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9689: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9689/index.html<br />
  IGT_7459: 7459<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3468286260682929673==--
