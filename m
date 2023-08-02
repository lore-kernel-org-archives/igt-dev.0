Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3681767499121407393=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Albert Esteve" <aesteve@redhat.com>
Date: Wed, 02 Aug 2023 16:34:10 -0000
Message-ID: <169099405020.6327.5029220852418217183@emeril.freedesktop.org>
References: <20230802111229.105472-1-aesteve@redhat.com>
In-Reply-To: <20230802111229.105472-1-aesteve@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGF0?=
 =?utf-8?q?omic_DRM_cursor_hotspot_test_=28rev4=29?=
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

--===============3681767499121407393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add atomic DRM cursor hotspot test (rev4)
URL   : https://patchwork.freedesktop.org/series/121225/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13460_full -> IGTPW_9496_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9496_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9496_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9496_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@test-cursor:
    - shard-dg2:          NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_async_flips@test-cursor.html

  * {igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot} (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-mtlp:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-snb:          [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-snb1/igt@prime_busy@hang-wait@bcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb7/igt@prime_busy@hang-wait@bcs0.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@tools_test@tools_test.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@tools_test@tools_test.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          [SKIP][10] ([i915#6228]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13460_full and IGTPW_9496_full:

### New IGT tests (1) ###

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9496_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-3/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2:          [PASS][13] -> [FAIL][14] ([i915#6121])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@core_setmaster@master-drop-set-root.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8414]) +11 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8414]) +9 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@drm_fdinfo@busy-idle-check-all@vcs0.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8414]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@fbdev@eof:
    - shard-dg2:          [PASS][18] -> [SKIP][19] ([i915#2582]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@fbdev@eof.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@fbdev@eof.html

  * igt@gem_bad_reloc@negative-reloc-bltcopy:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#3281])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_bad_reloc@negative-reloc-bltcopy.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3281]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-18/igt@gem_bad_reloc@negative-reloc-lut.html
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#3281]) +5 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#4873])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#5325])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-mtlp:         [PASS][25] -> [FAIL][26] ([i915#6121] / [i915#7916])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#8555]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8555])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#1099])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb4/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#2575]) +117 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][32] ([i915#8898])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#4812]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#6334])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#6344])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][36] -> [FAIL][37] ([i915#2846])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#2846])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-glk3/igt@gem_exec_fair@basic-deadline.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk5/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4473] / [i915#4771]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#7697]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@no-bsd:
    - shard-dg2:          [PASS][42] -> [SKIP][43] ([fdo#109283] / [i915#2575])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@gem_exec_params@no-bsd.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3281]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4860]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#4613])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk2/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@basic:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#4613])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl4/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4613]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#4613])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#4613])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#5775]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#284])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-5/igt@gem_media_vme.html

  * igt@gem_mmap@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4083])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_mmap@bad-object.html

  * igt@gem_mmap@bad-size:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4083]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@gem_mmap@bad-size.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4077]) +12 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3282]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][57] ([i915#2658])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb7/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][58] ([i915#2658])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3282]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4270])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4270]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4270])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4270])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@new-obj:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3282])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#8428]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4079])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4885])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-7/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4077]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3297])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3297] / [i915#4880])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@mmap-offset-banned@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3297]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@gem_userptr_blits@mmap-offset-banned@gtt.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#3297])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen3_render_linear_blits:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([fdo#109289])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#2527] / [i915#2856])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][75] ([fdo#109271]) +177 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#2856]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#2527])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#2527])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-18/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          [PASS][79] -> [SKIP][80] ([i915#5775])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-10/igt@i915_module_load@resize-bar.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#7091])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#7561])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-5/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][83] -> [SKIP][84] ([fdo#109271])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([fdo#109289]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - shard-dg1:          NOTRUN -> [SKIP][86] ([fdo#109289])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-15/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          [PASS][87] -> [FAIL][88] ([i915#3591])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][89] -> [SKIP][90] ([i915#5174]) +6 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#5174])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#1397])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-15/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg1:          [PASS][93] -> [FAIL][94] ([i915#7940])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-18/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-tglu:         [PASS][95] -> [FAIL][96] ([i915#7940])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-tglu-10/igt@i915_pm_rpm@system-suspend-execbuf.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-9/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#6621])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#8437])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#6188])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-snb:          NOTRUN -> [DMESG-WARN][100] ([i915#8841]) +7 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#4212])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#2575] / [i915#5190])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - shard-dg2:          [PASS][103] -> [SKIP][104] ([i915#2575] / [i915#5190])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4212])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#8502] / [i915#8709]) +11 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][107] ([i915#8247]) +3 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][108] ([i915#8561]) +3 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#1769])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([fdo#111614]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#5286])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         [PASS][112] -> [FAIL][113] ([i915#3743])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [FAIL][114] ([i915#3743]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4538] / [i915#5286])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([fdo#111614] / [i915#3638])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#3638])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [PASS][118] -> [SKIP][119] ([fdo#109315]) +28 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([fdo#111615]) +8 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4538] / [i915#5190])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][122] ([fdo#110723]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4538])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-15/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([fdo#111615])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-16/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#6187]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#3886] / [i915#6095]) +6 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#3689] / [i915#5354] / [i915#6095])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-8/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][128] ([fdo#109271] / [i915#3886]) +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#5354])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@kms_ccs@pipe-b-bad-aux-stride-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#5354] / [i915#6095]) +5 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#3689] / [i915#5354] / [i915#6095]) +3 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#5354] / [i915#6095]) +9 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-2/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#3689] / [i915#3886] / [i915#5354])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#5354] / [i915#6095]) +5 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-3/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#5354]) +8 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#6095]) +20 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([fdo#111827])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#7828])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#7828]) +2 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#7828]) +4 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#7828])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#6944])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][145] ([i915#7173])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl2/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#8063])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#7118])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@kms_content_protection@uevent.html
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7116])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-15/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([fdo#109279] / [i915#3359])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#3359])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#3359]) +1 similar issue
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#8814]) +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3555]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#3555]) +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-snb:          NOTRUN -> [SKIP][155] ([fdo#109271] / [fdo#111767]) +2 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-mtlp:         [PASS][156] -> [FAIL][157] ([i915#8248]) +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#3546]) +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#8812])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#3637]) +4 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([fdo#109274] / [i915#3637])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([fdo#111825]) +1 similar issue
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-mtlp:         [PASS][163] -> [DMESG-WARN][164] ([i915#1982])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#2587] / [i915#2672])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([fdo#109315]) +9 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#8810]) +1 similar issue
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#2672]) +4 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([fdo#109315] / [i915#5190]) +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#2672]) +1 similar issue
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][171] -> [SKIP][172] ([fdo#109271])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#1825]) +25 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([fdo#109280]) +3 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#5460])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([fdo#111825]) +12 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#8708])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([fdo#111825] / [i915#1825]) +8 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-apl:          NOTRUN -> [SKIP][179] ([fdo#109271]) +13 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3458]) +1 similar issue
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#3458]) +2 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#8708]) +3 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#8708])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#3023]) +5 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-dg2:          [PASS][185] -> [SKIP][186] ([i915#2575]) +199 similar issues
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_getfb@getfb2-accept-ccs.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@static-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#8228])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#8821])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][189] ([i915#8292])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#5176]) +7 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#5176]) +15 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#5176]) +7 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#5235]) +7 similar issues
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#5235]) +11 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#5235]) +7 similar issues
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#5235]) +23 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][197] ([fdo#109271]) +56 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#6524])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#2920])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-glk:          NOTRUN -> [SKIP][200] ([fdo#109271] / [i915#658])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([fdo#111068] / [i915#658])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][202] ([fdo#111068] / [i915#658])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#4348]) +1 similar issue
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@kms_psr2_su@page_flip-nv12.html
    - shard-apl:          NOTRUN -> [SKIP][204] ([fdo#109271] / [i915#658])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@basic:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#1072]) +2 similar issues
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@kms_psr@basic.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([fdo#110189]) +3 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-3/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr@sprite_blt:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#1072])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_psr@sprite_blt.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#4235]) +1 similar issue
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_selftest@drm_format:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#8661])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-2/igt@kms_selftest@drm_format.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#8661])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-16/igt@kms_selftest@drm_format.html

  * igt@kms_selftest@drm_format_helper:
    - shard-glk:          NOTRUN -> [SKIP][211] ([fdo#109271] / [i915#8661])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk6/igt@kms_selftest@drm_format_helper.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-dg2:          [PASS][212] -> [FAIL][213] ([fdo#103375])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-idle:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#4070] / [i915#6768]) +2 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_vblank@pipe-c-ts-continuation-idle.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#4070] / [i915#533] / [i915#6768])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_vblank@pipe-d-query-idle-hang.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglu:         [PASS][216] -> [ABORT][217] ([i915#5122])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-tglu-8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-3/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  * igt@kms_vrr@flip-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#8808])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-7/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][219] ([fdo#109271] / [i915#2437])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk8/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([fdo#109289]) +3 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#2433])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html
    - shard-dg1:          NOTRUN -> [SKIP][222] ([fdo#109289] / [i915#2433])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@frequency:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#5608]) +9 similar issues
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@perf_pmu@frequency.html

  * igt@perf_pmu@invalid-open:
    - shard-dg2:          [PASS][224] -> [SKIP][225] ([i915#5608]) +2 similar issues
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@perf_pmu@invalid-open.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@perf_pmu@invalid-open.html

  * igt@prime_udl:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([fdo#109291])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@prime_udl.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([fdo#109291])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@prime_udl.html

  * igt@prime_vgem@coherency-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][228] ([i915#8445])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@prime_vgem@coherency-blt.html

  * igt@v3d/v3d_get_bo_offset@create-get-offsets:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#2575]) +3 similar issues
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@v3d/v3d_get_bo_offset@create-get-offsets.html

  * igt@v3d/v3d_get_param@get-bad-flags:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([fdo#109315]) +4 similar issues
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-7/igt@v3d/v3d_get_param@get-bad-flags.html

  * igt@v3d/v3d_get_param@get-bad-param:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#2575]) +8 similar issues
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@v3d/v3d_get_param@get-bad-param.html

  * igt@v3d/v3d_wait_bo@bad-bo:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([fdo#109315] / [i915#2575]) +1 similar issue
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-2/igt@v3d/v3d_wait_bo@bad-bo.html

  * igt@vc4/vc4_perfmon@create-single-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#7711]) +4 similar issues
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@vc4/vc4_perfmon@create-single-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#7711])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#7711])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#2575])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-7/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#7711])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html

  
#### Possible fixes ####

  * igt@api_intel_allocator@default-alignment:
    - shard-dg2:          [SKIP][238] ([fdo#109315]) -> [PASS][239] +26 similar issues
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@api_intel_allocator@default-alignment.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@api_intel_allocator@default-alignment.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2:          [SKIP][240] ([i915#6767]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@core_hotunplug@unbind-rebind.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@core_hotunplug@unbind-rebind.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][242] ([i915#7742]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@fbdev@pan:
    - shard-dg2:          [SKIP][244] ([i915#2582]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@fbdev@pan.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@fbdev@pan.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-dg2:          [FAIL][246] ([fdo#103375]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][248] ([i915#4391] / [i915#7975] / [i915#8213]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-14/igt@gem_eio@hibernate.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-mtlp:         [ABORT][250] ([i915#7941]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-6/igt@gem_eio@in-flight-contexts-10ms.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][252] ([i915#5784]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-15/igt@gem_eio@reset-stress.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@gem_eio@reset-stress.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-dg2:          [TIMEOUT][254] ([i915#3778] / [i915#7016] / [i915#7921]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-3/igt@gem_exec_endless@dispatch@bcs0.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-10/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-rkl:          [FAIL][256] ([i915#2842]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-rkl-2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][258] ([i915#2842]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-dg2:          [SKIP][260] ([fdo#109283] / [i915#2575]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_params@no-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@gem_exec_params@no-blt.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-dg2:          [SKIP][262] ([i915#5775]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_lmem_evict@dontneed-evict-race.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][264] ([i915#5493]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_vm_create@execbuf:
    - shard-dg2:          [SKIP][266] ([i915#2575]) -> [PASS][267] +210 similar issues
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_vm_create@execbuf.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_vm_create@execbuf.html

  * igt@i915_hangman@gt-engine-hang@vcs0:
    - shard-mtlp:         [FAIL][268] ([i915#7069]) -> [PASS][269] +1 similar issue
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@i915_hangman@gt-engine-hang@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][270] ([i915#8489] / [i915#8668]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - shard-dg1:          [FAIL][272] ([i915#3591]) -> [PASS][273] +1 similar issue
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [SKIP][274] ([i915#1397]) -> [PASS][275]
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress@lmem0:
    - shard-dg1:          [FAIL][276] ([i915#7940]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-15/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][278] ([i915#1397]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-dg2:          [SKIP][280] ([i915#5174]) -> [PASS][281] +6 similar issues
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-3/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-tglu:         [FAIL][282] ([i915#7940]) -> [PASS][283] +2 similar issues
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-tglu-2/igt@i915_pm_rpm@system-suspend-devices.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_selftest@live@slpc:
    - shard-mtlp:         [DMESG-WARN][284] ([i915#6367]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-2/igt@i915_selftest@live@slpc.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@i915_selftest@live@slpc.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][286] ([i915#5138]) -> [PASS][287] +1 similar issue
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-mtlp:         [FAIL][288] ([i915#3743]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-edp-1:
    - shard-mtlp:         [DMESG-WARN][290] ([i915#1982]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-edp-1.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][292] ([i915#2346]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][294] ([i915#2346]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [FAIL][296] ([i915#79]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][298] ([IGT#2]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_sysfs_edid_timing.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          [FAIL][300] ([IGT#2] / [i915#6493]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-14/igt@kms_sysfs_edid_timing.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@kms_sysfs_edid_timing.html

  * igt@perf@create-destroy-userspace-config:
    - shard-dg2:          [SKIP][302] ([i915#5608]) -> [PASS][303] +5 similar issues
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@perf@create-destroy-userspace-config.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@perf@create-destroy-userspace-config.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [FAIL][304] ([i915#4349]) -> [PASS][305] +2 similar issues
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@perf_pmu@busy-double-start@vcs1.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][306] ([i915#2575]) -> [SKIP][307] ([i915#8411])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          [FAIL][308] -> [SKIP][309] ([i915#7701])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          [SKIP][310] ([i915#5608]) -> [SKIP][311] ([i915#8414]) +1 similar issue
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@drm_fdinfo@virtual-busy-all.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          [SKIP][312] ([i915#8414]) -> [SKIP][313] ([i915#5608]) +2 similar issues
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@drm_fdinfo@virtual-busy-hang.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@feature_discovery@display-2x:
    - shard-dg2:          [SKIP][314] ([i915#1839]) -> [SKIP][315] ([i915#2575])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@feature_discovery@display-2x.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@feature_discovery@display-2x.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          [SKIP][316] ([i915#2575]) -> [SKIP][317] ([i915#3936])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_busy@semaphore.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_busy@semaphore.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          [SKIP][318] ([i915#7697]) -> [SKIP][319] ([i915#2575])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@gem_close_race@multigpu-basic-process.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          [SKIP][320] ([i915#2575]) -> [SKIP][321] ([i915#7697]) +1 similar issue
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          [SKIP][322] ([i915#2575]) -> [SKIP][323] ([i915#8555])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          [SKIP][324] ([i915#280]) -> [SKIP][325] ([i915#2575])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          [SKIP][326] ([i915#4812]) -> [SKIP][327] ([i915#2575]) +2 similar issues
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][328] ([i915#4771]) -> [SKIP][329] ([i915#2575])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          [SKIP][330] ([i915#2575]) -> [SKIP][331] ([i915#4771])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][332] ([i915#2575]) -> [SKIP][333] ([i915#4812]) +2 similar issues
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          [SKIP][334] ([i915#4036]) -> [SKIP][335] ([i915#2575])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@gem_exec_balancer@invalid-bonds.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_fair@basic-none-vip:
    - shard-dg2:          [SKIP][336] ([i915#2575]) -> [SKIP][337] ([i915#3539] / [i915#4852])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_fair@basic-none-vip.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@gem_exec_fair@basic-none-vip.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglu:         [FAIL][338] ([i915#2876]) -> [FAIL][339] ([i915#2842])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-tglu-5/igt@gem_exec_fair@basic-pace@vcs1.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          [SKIP][340] ([i915#3539]) -> [SKIP][341] ([i915#2575])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_exec_fair@basic-throttle.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          [SKIP][342] ([i915#3539] / [i915#4852]) -> [SKIP][343] ([i915#2575]) +7 similar issues
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-10/igt@gem_exec_flush@basic-uc-ro-default.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          [SKIP][344] ([i915#2575]) -> [SKIP][345] ([i915#3281]) +11 similar issues
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          [SKIP][346] ([i915#3281]) -> [SKIP][347] ([i915#2575]) +13 similar issues
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@gem_exec_reloc@basic-write-read-active.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          [SKIP][348] ([i915#2575]) -> [SKIP][349] ([i915#4537] / [i915#4812])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          [SKIP][350] ([i915#4537] / [i915#4812]) -> [SKIP][351] ([i915#2575]) +1 similar issue
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [ABORT][352] ([i915#7392] / [i915#8131]) -> [TIMEOUT][353] ([i915#7392])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-6/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          [SKIP][354] ([i915#2575]) -> [SKIP][355] ([i915#4860]) +2 similar issues
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          [SKIP][356] ([i915#4860]) -> [SKIP][357] ([i915#2575]) +3 similar issues
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-10/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          [SKIP][358] ([i915#2575]) -> [SKIP][359] ([i915#8289])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_media_fill@media-fill.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          [SKIP][360] ([i915#4077]) -> [SKIP][361] ([i915#2575]) +19 similar issues
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          [SKIP][362] ([i915#4083]) -> [SKIP][363] ([i915#2575]) +4 similar issues
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@gem_mmap_wc@bad-object.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          [SKIP][364] ([i915#2575]) -> [SKIP][365] ([i915#4083]) +3 similar issues
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_mmap_wc@close.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@gem_mmap_wc@close.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          [SKIP][366] ([i915#3282]) -> [SKIP][367] ([i915#2575]) +5 similar issues
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@gem_partial_pwrite_pread@reads.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg2:          [SKIP][368] ([i915#2575]) -> [SKIP][369] ([i915#3282]) +4 similar issues
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_pwrite@basic-exhaustion.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-dg2:          [SKIP][370] ([i915#4270]) -> [SKIP][371] ([i915#2575]) +5 similar issues
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@gem_pxp@create-regular-context-2.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          [SKIP][372] ([i915#2575]) -> [SKIP][373] ([i915#4270]) +4 similar issues
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_pxp@display-protected-crc.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_pxp@display-protected-crc.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          [SKIP][374] ([i915#2575] / [i915#5190]) -> [SKIP][375] ([i915#5190]) +8 similar issues
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          [SKIP][376] ([i915#2575]) -> [SKIP][377] ([i915#4079]) +1 similar issue
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          [FAIL][378] ([i915#5889]) -> [SKIP][379] ([i915#2575])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_spin_batch@spin-all-new.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_tiled_blits@basic:
    - shard-dg2:          [SKIP][380] ([i915#2575]) -> [SKIP][381] ([i915#4077]) +10 similar issues
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_tiled_blits@basic.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-3/igt@gem_tiled_blits@basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          [SKIP][382] ([i915#4879]) -> [SKIP][383] ([i915#2575])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_unfence_active_buffers.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          [SKIP][384] ([i915#2575]) -> [SKIP][385] ([i915#3297]) +3 similar issues
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_userptr_blits@dmabuf-unsync.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          [SKIP][386] ([i915#3297] / [i915#4880]) -> [SKIP][387] ([i915#2575])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          [SKIP][388] ([i915#2575]) -> [SKIP][389] ([i915#3297] / [i915#4880])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          [SKIP][390] ([i915#2575]) -> [SKIP][391] ([i915#3297] / [i915#4958])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_userptr_blits@sd-probe.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          [SKIP][392] ([i915#3297]) -> [SKIP][393] ([i915#2575]) +1 similar issue
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          [FAIL][394] ([i915#3318]) -> [SKIP][395] ([i915#2575])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_userptr_blits@vma-merge.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_tiledx_blits:
    - shard-dg2:          [SKIP][396] ([i915#2575]) -> [SKIP][397] ([fdo#109289]) +4 similar issues
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gen3_render_tiledx_blits.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg2:          [SKIP][398] ([i915#2856]) -> [SKIP][399] ([i915#2575]) +2 similar issues
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@gen9_exec_parse@allowed-all.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          [SKIP][400] ([i915#2575]) -> [SKIP][401] ([i915#2856]) +5 similar issues
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_fb_tiling:
    - shard-dg2:          [SKIP][402] ([i915#4881]) -> [SKIP][403] ([i915#2575])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@i915_fb_tiling.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_fb_tiling.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-dg2:          [SKIP][404] ([i915#2575]) -> [SKIP][405] ([i915#5354] / [i915#7561])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@i915_pm_backlight@bad-brightness.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-dg2:          [SKIP][406] ([i915#5354] / [i915#7561]) -> [SKIP][407] ([i915#2575]) +1 similar issue
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@i915_pm_backlight@basic-brightness.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          [SKIP][408] ([i915#658]) -> [SKIP][409] ([i915#2575])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [SKIP][411] ([i915#658]) +1 similar issue
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@i915_pm_dc@dc5-psr.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-tglu:         [WARN][412] ([i915#2681]) -> [FAIL][413] ([i915#2681] / [i915#3591])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@fences:
    - shard-dg2:          [SKIP][414] ([i915#4077]) -> [SKIP][415] ([i915#5174]) +2 similar issues
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@i915_pm_rpm@fences.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][416] ([i915#5174]) -> [SKIP][417] ([i915#1397]) +1 similar issue
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          [SKIP][418] ([i915#6621]) -> [SKIP][419] ([i915#2575])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@i915_pm_rps@min-max-config-loaded.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          [SKIP][420] ([i915#2575]) -> [SKIP][421] ([i915#4387])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@i915_pm_sseu@full-enable.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg2:          [SKIP][422] ([fdo#109303]) -> [SKIP][423] ([i915#2575])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@i915_query@query-topology-known-pci-ids.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          [SKIP][424] ([i915#5190]) -> [SKIP][425] ([i915#2575] / [i915#5190]) +13 similar issues
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          [SKIP][426] ([i915#2575]) -> [SKIP][427] ([i915#4212])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-10/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          [SKIP][428] ([i915#2575] / [i915#5190]) -> [SKIP][429] ([i915#4215] / [i915#5190])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          [SKIP][430] ([i915#4212]) -> [SKIP][431] ([i915#2575])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          [SKIP][432] ([i915#404]) -> [SKIP][433] ([i915#2575])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][434] ([i915#1769] / [i915#3555]) -> [SKIP][435] ([i915#2575])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2:          [SKIP][436] ([fdo#111614]) -> [SKIP][437] ([fdo#109315]) +1 similar issue
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-10/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][438] ([fdo#109315]) -> [SKIP][439] ([fdo#111614]) +5 similar issues
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          [SKIP][440] ([fdo#109315] / [i915#5190]) -> [SKIP][441] ([i915#5190]) +6 similar issues
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          [SKIP][442] ([i915#5190]) -> [SKIP][443] ([fdo#109315] / [i915#5190]) +7 similar issues
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2:          [SKIP][444] ([i915#4538] / [i915#5190]) -> [SKIP][445] ([fdo#109315] / [i915#5190]) +6 similar issues
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][446] ([fdo#109315] / [i915#5190]) -> [SKIP][447] ([i915#4538] / [i915#5190]) +6 similar issues
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          [SKIP][448] ([i915#2705]) -> [SKIP][449] ([fdo#109315]) +1 similar issue
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@kms_big_joiner@basic.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          [SKIP][450] ([i915#2575]) -> [SKIP][451] ([i915#3689] / [i915#5354]) +19 similar issues
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
    - shard-dg2:          [SKIP][452] ([i915#5354]) -> [SKIP][453] ([i915#2575]) +23 similar issues
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          [SKIP][454] ([i915#2575]) -> [SKIP][455] ([i915#3689] / [i915#3886] / [i915#5354]) +10 similar issues
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-dg2:          [SKIP][456] ([i915#3689] / [i915#3886] / [i915#5354]) -> [SKIP][457] ([i915#2575]) +6 similar issues
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:
    - shard-dg2:          [SKIP][458] ([i915#3689] / [i915#5354]) -> [SKIP][459] ([i915#2575]) +26 similar issues
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
    - shard-dg2:          [SKIP][460] ([i915#2575]) -> [SKIP][461] ([i915#5354]) +21 similar issues
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2:          [SKIP][462] ([fdo#111827]) -> [SKIP][463] ([i915#2575]) +1 similar issue
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-10/igt@kms_chamelium_color@ctm-0-50.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2:          [SKIP][464] ([i915#2575]) -> [SKIP][465] ([fdo#111827])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_chamelium_color@ctm-red-to-blue.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          [SKIP][466] ([i915#2575]) -> [SKIP][467] ([i915#7828]) +10 similar issues
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-10/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2:          [SKIP][468] ([i915#7828]) -> [SKIP][469] ([i915#2575]) +9 similar issues
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          [SKIP][470] ([i915#3299]) -> [SKIP][471] ([i915#2575])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          [SKIP][472] ([i915#2575]) -> [SKIP][473] ([i915#3299])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_content_protection@dp-mst-type-1.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          [SKIP][474] ([i915#2575]) -> [SKIP][475] ([i915#7118]) +1 similar issue
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_content_protection@mei_interface.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@kms_content_pro

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/index.html

--===============3681767499121407393==
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
<tr><td><b>Series:</b></td><td>Add atomic DRM cursor hotspot test (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121225/">https://patchwork.freedesktop.org/series/121225/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13460_full -&gt; IGTPW_9496_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9496_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9496_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9496_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_async_flips@test-cursor.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot} (NEW):</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a></p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a></p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a></p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-snb1/igt@prime_busy@hang-wait@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb7/igt@prime_busy@hang-wait@bcs0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@tools_test@tools_test:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@tools_test@tools_test.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@tools_test@tools_test.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_async_flips@invalid-async-flip:<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13460_full and IGTPW_9496_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9496_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-3/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html">FAIL</a> ([i915#6121])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> ([i915#8414]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@drm_fdinfo@busy-idle-check-all@vcs0.html">SKIP</a> ([i915#8414]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@drm_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> ([i915#8414]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@fbdev@eof.html">SKIP</a> ([i915#2582]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-bltcopy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> ([i915#3281])</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-18/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +2 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@gem_caching@read-writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#5325])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6121] / [i915#7916])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb4/igt@gem_ctx_persistence@processes.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> ([i915#2575]) +117 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb5/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#8898])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@gem_exec_balancer@sliced.html">SKIP</a> ([i915#4812]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-glk3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk5/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#4473] / [i915#4771]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@gem_exec_params@no-bsd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283] / [i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> ([i915#3281]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk2/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl4/igt@gem_lmem_swapping@basic.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#5775]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_mmap@bad-object.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@gem_mmap@bad-size.html">SKIP</a> ([i915#4083]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@gem_mmap_gtt@flink-race.html">SKIP</a> ([i915#4077]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@gem_partial_pwrite_pread@write.html">SKIP</a> ([i915#3282]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#3282]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@gem_readwrite@new-obj.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#8428]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-7/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> ([i915#4077]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-banned@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@gem_userptr_blits@mmap-offset-banned@gtt.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([fdo#109271]) +177 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-18/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-10/igt@i915_module_load@resize-bar.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#5775])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-5/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-15/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> ([i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#5174]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#5174])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-15/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-18/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">FAIL</a> ([i915#7940])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-tglu-10/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-9/igt@i915_pm_rpm@system-suspend-execbuf.html">FAIL</a> ([i915#7940])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#8437])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb4/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#8841]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">SKIP</a> ([i915#2575] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> ([i915#2575] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html">SKIP</a> ([i915#8502] / [i915#8709]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8247]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_async_flips@crc@pipe-d-edp-1.html">DMESG-FAIL</a> ([i915#8561]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743]) +2 similar issues</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([i915#3638])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#109315]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-15/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#4538])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-16/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([i915#6187]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#6095]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-8/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@kms_ccs@pipe-b-bad-aux-stride-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +5 similar issues</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-2/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-3/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#5354]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([i915#6095]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl2/igt@kms_content_protection@legacy@pipe-a-dp-1.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#8063])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-15/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#8814]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109271] / [fdo#111767]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#8248]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([i915#3546]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> ([fdo#109274] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#111825]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> ([fdo#109315]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([fdo#109315] / [i915#5190]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> ([fdo#109280]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([i915#5460])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> ([fdo#111825]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html">SKIP</a> ([i915#3458]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> ([i915#3023]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_getfb@getfb2-accept-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> ([i915#2575]) +199 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5176]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html">SKIP</a> ([i915#5235]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5235]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html">SKIP</a> ([fdo#109271]) +56 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#4348]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@kms_psr@basic.html">SKIP</a> ([i915#1072]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-3/igt@kms_psr@psr2_sprite_render.html">SKIP</a> ([fdo#110189]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_psr@sprite_blt.html">SKIP</a> ([i915#1072])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> ([i915#4235]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-2/igt@kms_selftest@drm_format.html">SKIP</a> ([i915#8661])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-16/igt@kms_selftest@drm_format.html">SKIP</a> ([i915#8661])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format_helper:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk6/igt@kms_selftest@drm_format_helper.html">SKIP</a> ([fdo#109271] / [i915#8661])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">FAIL</a> ([fdo#103375])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_vblank@pipe-c-ts-continuation-idle.html">SKIP</a> ([i915#4070] / [i915#6768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@kms_vblank@pipe-d-query-idle-hang.html">SKIP</a> ([i915#4070] / [i915#533] / [i915#6768])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-tglu-8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-3/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">ABORT</a> ([i915#5122])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-7/igt@kms_vrr@flip-suspend.html">SKIP</a> ([i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk8/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289] / [i915#2433])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@perf_pmu@frequency.html">SKIP</a> ([i915#5608]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@invalid-open:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@perf_pmu@invalid-open.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@perf_pmu@invalid-open.html">SKIP</a> ([i915#5608]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@prime_udl.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@prime_udl.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@prime_vgem@coherency-blt.html">FAIL</a> ([i915#8445])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_bo_offset@create-get-offsets:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-14/igt@v3d/v3d_get_bo_offset@create-get-offsets.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-flags:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-7/igt@v3d/v3d_get_param@get-bad-flags.html">SKIP</a> ([fdo#109315]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-2/igt@v3d/v3d_get_param@get-bad-param.html">SKIP</a> ([i915#2575]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@bad-bo:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-2/igt@v3d/v3d_wait_bo@bad-bo.html">SKIP</a> ([fdo#109315] / [i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-1/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a> ([i915#7711]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-1/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html">SKIP</a> ([i915#7711])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-17/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html">SKIP</a> ([i915#7711])</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-7/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> ([i915#7711])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_allocator@default-alignment:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@api_intel_allocator@default-alignment.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@api_intel_allocator@default-alignment.html">PASS</a> +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@core_hotunplug@unbind-rebind.html">SKIP</a> ([i915#6767]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@fbdev@pan.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_ctx_isolation@preservation-s3@vcs1.html">FAIL</a> ([fdo#103375]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_ctx_isolation@preservation-s3@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a> ([i915#4391] / [i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-6/igt@gem_eio@in-flight-contexts-10ms.html">ABORT</a> ([i915#7941]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-15/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-3/igt@gem_exec_endless@dispatch@bcs0.html">TIMEOUT</a> ([i915#3778] / [i915#7016] / [i915#7921]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-10/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-rkl-2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@gem_exec_params@no-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> ([i915#5775]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_lmem_evict@dontneed-evict-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@execbuf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_vm_create@execbuf.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_vm_create@execbuf.html">PASS</a> +210 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-3/igt@i915_hangman@gt-engine-hang@vcs0.html">FAIL</a> ([i915#7069]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-6/igt@i915_hangman@gt-engine-hang@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#8489] / [i915#8668]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-15/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-19/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-3/igt@i915_pm_rpm@sysfs-read.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-tglu-2/igt@i915_pm_rpm@system-suspend-devices.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> ([i915#6367]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-5/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-edp-1.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_sysfs_edid_timing.html">PASS</a></p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-14/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2] / [i915#6493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-13/igt@kms_sysfs_edid_timing.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@create-destroy-userspace-config:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@perf@create-destroy-userspace-config.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@perf@create-destroy-userspace-config.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg1-12/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> ([i915#8414]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> ([i915#8414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> ([i915#5608]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_busy@semaphore.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_fair@basic-none-vip.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@gem_exec_fair@basic-none-vip.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-tglu-5/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2876]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-10/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#2575]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#3281]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#2575]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-mtlp-6/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> ([i915#7392] / [i915#8131]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-priority-all.html">TIMEOUT</a> ([i915#7392])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-10/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#2575]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#4083]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_mmap_wc@close.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@gem_mmap_wc@close.html">SKIP</a> ([i915#4083]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> ([i915#3282]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#2575]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_spin_batch@spin-all-new.html">FAIL</a> ([i915#5889]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_tiled_blits@basic.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-3/igt@gem_tiled_blits@basic.html">SKIP</a> ([i915#4077]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gem_userptr_blits@vma-merge.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gen3_render_tiledx_blits.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@gen3_render_tiledx_blits.html">SKIP</a> ([fdo#109289]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_fb_tiling.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@i915_pm_backlight@bad-brightness.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-8/igt@i915_pm_backlight@bad-brightness.html">SKIP</a> ([i915#5354] / [i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354] / [i915#7561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@i915_pm_dc@dc5-psr.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@i915_pm_dc@dc5-psr.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a> ([i915#2681]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> ([i915#2681] / [i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@i915_pm_rpm@fences.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_rpm@fences.html">SKIP</a> ([i915#5174]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#1397]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#2575] / [i915#5190]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-10/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#2575] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-10/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#109315]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#5190]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#109315] / [i915#5190]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> ([fdo#109315] / [i915#5190]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109315]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#2575]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#2575]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-2/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#2575]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-10/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> ([fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-10/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> ([i915#2575]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13460/shard-dg2-11/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9496/shard-dg2-2/igt@kms_content_pro">SKIP</a> ([i915#7118]) +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3681767499121407393==--
