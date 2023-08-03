Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5743630859358468141=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Date: Thu, 03 Aug 2023 02:45:28 -0000
Message-ID: <169103072882.5270.9702621302794774066@emeril.freedesktop.org>
References: <20230802211958.7027-1-robdclark@gmail.com>
In-Reply-To: <20230802211958.7027-1-robdclark@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?msm=3A_Add_submitoverhead_benchmark?=
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

--===============5743630859358468141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/msm: Add submitoverhead benchmark
URL   : https://patchwork.freedesktop.org/series/121909/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13463_full -> IGTPW_9499_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9499_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9499_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9499_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [PASS][3] -> [WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-3/igt@i915_suspend@basic-s3-without-i915.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@test-cursor:
    - shard-dg2:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_async_flips@test-cursor.html

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-vga-1:
    - shard-snb:          [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-snb6/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-vga-1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb7/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-vga-1.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@tools_test@tools_test.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@tools_test@tools_test.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13463_full and IGTPW_9499_full:

### New IGT tests (1) ###

  * igt@kms_prime@basic-crc-vgem@second-to-first:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9499_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@busy-idle-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#8414]) +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@drm_fdinfo@busy-idle-check-all@ccs0.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8414]) +19 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@fbdev@info:
    - shard-dg2:          [PASS][12] -> [SKIP][13] ([i915#1849] / [i915#2582])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@fbdev@info.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@fbdev@info.html

  * igt@fbdev@pan:
    - shard-dg2:          [PASS][14] -> [SKIP][15] ([i915#2582])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@fbdev@pan.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@fbdev@pan.html

  * igt@fbdev@read:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#2582])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@fbdev@read.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#4873])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#3555] / [i915#5325])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#3555] / [i915#5325])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#5325])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-16/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#5325])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#5325])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [PASS][23] -> [FAIL][24] ([i915#6268])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html
    - shard-mtlp:         [PASS][25] -> [FAIL][26] ([i915#6121] / [i915#7916])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-7/igt@gem_ctx_exec@basic-nohangcheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          NOTRUN -> [DMESG-WARN][27] ([i915#8841]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([fdo#109314])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#1099]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb4/igt@gem_ctx_persistence@engines-hang.html

  * igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
    - shard-mtlp:         [PASS][30] -> [FAIL][31] ([i915#2410])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-1/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-1/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [PASS][32] -> [FAIL][33] ([i915#7816]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4771])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4771])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-1/igt@gem_exec_balancer@bonded-pair.html
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4771])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-16/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_capture@capture@vcs1-smem:
    - shard-mtlp:         [PASS][37] -> [DMESG-WARN][38] ([i915#5591])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-6/igt@gem_exec_capture@capture@vcs1-smem.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@gem_exec_capture@capture@vcs1-smem.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-rkl:          [PASS][39] -> [FAIL][40] ([i915#2842])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@gem_exec_flush@basic-wb-ro-before-default.html
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-12/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#7697])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3281]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3281]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3281]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3281]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4812])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4860])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4860])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-dg2:          [PASS][51] -> [SKIP][52] ([i915#5775])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@gem_lmem_evict@dontneed-evict-race.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4613]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-2/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#4613])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4565])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#5775]) +5 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][57] -> [DMESG-WARN][58] ([i915#4936] / [i915#5493])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledx:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4077]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-13/igt@gem_mmap_gtt@basic-small-bo-tiledx.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4077]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4077]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_wc@copy:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4083]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@gem_mmap_wc@copy.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4270]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3282]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#2575] / [i915#5190])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#8428]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4079])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3282])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4079]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@access-control:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3297])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#3297] / [i915#4880])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3297] / [i915#4880])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([fdo#109289]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@gen7_exec_parse@chained-batch.html
    - shard-dg1:          NOTRUN -> [SKIP][75] ([fdo#109289]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][76] -> [ABORT][77] ([i915#5566]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#2856]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#2527])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#2527])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#2856])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - shard-mtlp:         [PASS][82] -> [FAIL][83] ([i915#8691])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-2/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][84] -> [FAIL][85] ([i915#3989] / [i915#454])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-4/igt@i915_pm_dc@dc6-dpms.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-9/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#8399])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#8399])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#6645])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_api@freq-suspend@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#8805])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@i915_pm_freq_api@freq-suspend@gt1.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-tglu:         [PASS][90] -> [FAIL][91] ([i915#7940]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-10/igt@i915_pm_rpm@basic-pci-d3-state.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-3/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [PASS][92] -> [SKIP][93] ([i915#1397])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg1-13/igt@i915_pm_rpm@dpms-non-lpsp.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#5174])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:
    - shard-dg1:          [PASS][95] -> [FAIL][96] ([i915#7940])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg1-17/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-dg2:          [PASS][97] -> [SKIP][98] ([i915#5174]) +4 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@i915_pm_rpm@sysfs-read.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#8925])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#8925]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_selftest@live@requests:
    - shard-mtlp:         [PASS][101] -> [DMESG-FAIL][102] ([i915#8497])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-3/igt@i915_selftest@live@requests.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - shard-mtlp:         [PASS][103] -> [DMESG-WARN][104] ([i915#6367])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-3/igt@i915_selftest@live@slpc.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [PASS][105] -> [FAIL][106] ([fdo#103375]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#4212])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#4212])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-mtlp:         [PASS][109] -> [FAIL][110] ([i915#2521])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#8502] / [i915#8709]) +11 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#8502]) +3 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#8502]) +7 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#1769] / [i915#3555])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb:
    - shard-snb:          NOTRUN -> [INCOMPLETE][115] ([i915#2295])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb6/igt@kms_big_fb.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#5286])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4538] / [i915#5286])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#5286])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#5286])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [PASS][120] -> [FAIL][121] ([i915#5138])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([fdo#111614]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][123] ([fdo#111614] / [i915#3638]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#3638]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-17/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         [PASS][125] -> [FAIL][126] ([i915#3743]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2:          [PASS][127] -> [SKIP][128] ([fdo#109315]) +25 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#6187])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#5190]) +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4538] / [i915#5190])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][132] ([fdo#110723])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([fdo#111615])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#3689] / [i915#3886] / [i915#5354])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#3886] / [i915#5354] / [i915#6095])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-18/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#3886] / [i915#6095]) +4 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#3734] / [i915#5354] / [i915#6095])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-6/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#3689] / [i915#5354] / [i915#6095]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#6095]) +11 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_mtl_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#5354] / [i915#6095])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-6/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#5354] / [i915#6095])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#3689] / [i915#5354]) +8 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#3689] / [i915#5354] / [i915#6095])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-4/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#5354]) +4 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#4087] / [i915#7213]) +3 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#3742])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#3742])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-17/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#4087]) +3 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([fdo#111827])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#7828]) +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@kms_chamelium_frames@dp-frame-dump.html
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#7828]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_chamelium_frames@dp-frame-dump.html
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#7828]) +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#7828]) +3 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#3299])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#3359])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#8814])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#3359])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][160] -> [FAIL][161] ([i915#72])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#4103] / [i915#4213]) +1 similar issue
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#4103]) +1 similar issue
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#4103] / [i915#4213]) +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([fdo#111825]) +3 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#3546])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([fdo#111767] / [i915#3546])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
    - shard-tglu:         NOTRUN -> [SKIP][168] ([fdo#109274] / [fdo#111767])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][169] -> [FAIL][170] ([i915#2346])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [PASS][171] -> [FAIL][172] ([i915#2346])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#3555])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3804])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglu:         [PASS][175] -> [FAIL][176] ([i915#4767])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([fdo#109274]) +3 similar issues
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-10/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3637]) +1 similar issue
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][179] -> [FAIL][180] ([i915#2122])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([fdo#111767] / [i915#3637])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([fdo#109274] / [i915#3637])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][183] ([fdo#103375]) +2 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-mtlp:         [PASS][184] -> [DMESG-WARN][185] ([i915#1982])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#2587] / [i915#2672])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#2672]) +3 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#2672]) +2 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#2672])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#2587] / [i915#2672])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([fdo#109315]) +18 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([fdo#109315] / [i915#5190]) +6 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#1825]) +11 similar issues
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2:          [PASS][194] -> [FAIL][195] ([fdo#103375]) +1 similar issue
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([fdo#111825]) +10 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([fdo#109280]) +2 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#5354]) +5 similar issues
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#8708]) +4 similar issues
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#8708]) +4 similar issues
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#8708]) +1 similar issue
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([fdo#110189])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([fdo#111825] / [i915#1825]) +6 similar issues
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3458]) +2 similar issues
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3023]) +2 similar issues
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#3458]) +2 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-dg2:          [PASS][207] -> [SKIP][208] ([i915#2575]) +161 similar issues
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@kms_getfb@getfb2-accept-ccs.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8228]) +1 similar issue
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#4816])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([fdo#109289])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([fdo#109289])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([fdo#109289]) +3 similar issues
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][214] ([i915#8292])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#5176]) +3 similar issues
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#5176]) +23 similar issues
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#5176]) +3 similar issues
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#5235]) +15 similar issues
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#5235]) +11 similar issues
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][220] ([fdo#109271]) +201 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#2575]) +138 similar issues
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#5235]) +7 similar issues
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#658])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#658])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-12/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#658]) +1 similar issue
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([fdo#111068] / [i915#658])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([fdo#111068] / [i915#658])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#1072]) +2 similar issues
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#1072])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-6/igt@kms_psr@sprite_plane_onoff.html
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#1072] / [i915#4078])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-13/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#4235]) +1 similar issue
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#4235])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#5030]) +3 similar issues
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html

  * igt@kms_selftest@drm_format_helper:
    - shard-snb:          NOTRUN -> [SKIP][234] ([fdo#109271] / [i915#8661])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb2/igt@kms_selftest@drm_format_helper.html
    - shard-glk:          NOTRUN -> [SKIP][235] ([fdo#109271] / [i915#8661])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk5/igt@kms_selftest@drm_format_helper.html

  * igt@kms_vblank@pipe-a-wait-idle-hang:
    - shard-apl:          [PASS][236] -> [SKIP][237] ([fdo#109271])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-apl2/igt@kms_vblank@pipe-a-wait-idle-hang.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-apl2/igt@kms_vblank@pipe-a-wait-idle-hang.html
    - shard-glk:          [PASS][238] -> [SKIP][239] ([fdo#109271])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk4/igt@kms_vblank@pipe-a-wait-idle-hang.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk8/igt@kms_vblank@pipe-a-wait-idle-hang.html

  * igt@kms_vrr@flip-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#8808])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#3555]) +1 similar issue
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#3555]) +1 similar issue
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_vrr@negative-basic.html

  * igt@perf@blocking-parameterized:
    - shard-dg2:          [PASS][243] -> [SKIP][244] ([i915#5608]) +5 similar issues
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@perf@blocking-parameterized.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@perf@blocking-parameterized.html

  * igt@perf@stress-open-close:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#5608]) +11 similar issues
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@perf@stress-open-close.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][246] ([i915#4349]) +3 similar issues
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@prime_vgem@coherency-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#3708] / [i915#4077])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@prime_vgem@coherency-gtt.html

  * igt@v3d/v3d_job_submission@array-job-submission:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#2575]) +3 similar issues
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-18/igt@v3d/v3d_job_submission@array-job-submission.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([fdo#109315] / [i915#2575]) +1 similar issue
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-7/igt@v3d/v3d_job_submission@array-job-submission.html

  * igt@v3d/v3d_mmap@mmap-bad-flags:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([fdo#109315]) +1 similar issue
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@v3d/v3d_mmap@mmap-bad-flags.html

  * igt@v3d/v3d_submit_csd@bad-pad:
    - shard-glk:          NOTRUN -> [SKIP][251] ([fdo#109271]) +29 similar issues
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk9/igt@v3d/v3d_submit_csd@bad-pad.html

  * igt@v3d/v3d_submit_csd@job-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#2575]) +6 similar issues
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-5/igt@v3d/v3d_submit_csd@job-perfmon.html

  * igt@vc4/vc4_label_bo@set-bad-name:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#7711]) +1 similar issue
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-5/igt@vc4/vc4_label_bo@set-bad-name.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#7711]) +2 similar issues
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@vc4/vc4_mmap@mmap-bo.html
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#7711]) +1 similar issue
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@vc4/vc4_mmap@mmap-bo.html
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#7711]) +1 similar issue
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_wait_bo@bad-pad:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#2575])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-9/igt@vc4/vc4_wait_bo@bad-pad.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2:          [SKIP][258] ([i915#6767]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@core_hotunplug@unbind-rebind.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@core_hotunplug@unbind-rebind.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][260] ([i915#7742]) -> [PASS][261] +1 similar issue
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][262] ([i915#2582]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@fbdev@nullptr.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@fbdev@nullptr.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          [INCOMPLETE][264] ([i915#4793]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk9/igt@gem_ctx_isolation@preservation-s3@bcs0.html
    - shard-dg2:          [FAIL][266] ([fdo#103375]) -> [PASS][267] +1 similar issue
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-10/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@engines-hang@vcs0:
    - shard-mtlp:         [FAIL][268] ([i915#2410]) -> [PASS][269] +3 similar issues
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-7/igt@gem_ctx_persistence@engines-hang@vcs0.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@gem_ctx_persistence@engines-hang@vcs0.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [FAIL][270] ([i915#5784]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@gem_eio@reset-stress.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][272] ([i915#2846]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [FAIL][274] ([i915#2842]) -> [PASS][275]
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglu:         [FAIL][276] ([i915#2842]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-dg2:          [SKIP][278] ([fdo#109283] / [i915#2575]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_params@no-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [ABORT][280] ([i915#7975] / [i915#8213]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-12/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [TIMEOUT][282] ([i915#7392]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][284] ([i915#8489] / [i915#8668]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][286] ([fdo#109271]) -> [PASS][287]
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-apl4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-dg2:          [SKIP][288] ([i915#1937]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          [FAIL][290] ([i915#3591]) -> [PASS][291] +1 similar issue
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][292] ([i915#1397]) -> [PASS][293] +2 similar issues
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-4/igt@i915_pm_rpm@dpms-lpsp.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress@smem0:
    - shard-dg1:          [FAIL][294] ([i915#7940]) -> [PASS][295] +1 similar issue
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg1-17/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-dg2:          [SKIP][296] ([i915#5174]) -> [PASS][297] +1 similar issue
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_rpm@system-suspend-devices.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-mtlp:         [DMESG-FAIL][298] ([i915#7059]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-3/igt@i915_selftest@live@gt_mocs.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          [WARN][300] -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - shard-dg2:          [SKIP][302] ([i915#2575] / [i915#5190]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][304] ([i915#79]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][306] ([fdo#109315]) -> [PASS][307] +30 similar issues
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][308] ([i915#433]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][310] ([IGT#2]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@kms_sysfs_edid_timing.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_sysfs_edid_timing.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [SKIP][312] ([i915#5608]) -> [PASS][313] +5 similar issues
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [FAIL][314] ([i915#4349]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@syncobj_timeline@device-submit-unordered:
    - shard-mtlp:         [DMESG-WARN][316] ([i915#2017]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-7/igt@syncobj_timeline@device-submit-unordered.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-2/igt@syncobj_timeline@device-submit-unordered.html

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - shard-dg2:          [SKIP][318] ([i915#2575]) -> [PASS][319] +191 similar issues
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html

  * igt@sysfs_heartbeat_interval@nopreempt@vecs0:
    - shard-mtlp:         [FAIL][320] ([i915#6015]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][322] ([i915#2575]) -> [SKIP][323] ([i915#8411]) +1 similar issue
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          [FAIL][324] ([i915#6121]) -> [SKIP][325] ([i915#7701])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@device_reset@cold-reset-bound.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          [SKIP][326] ([i915#8414]) -> [SKIP][327] ([i915#5608]) +1 similar issue
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@drm_fdinfo@virtual-busy-idle-all.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@feature_discovery@display-2x:
    - shard-dg2:          [SKIP][328] ([i915#2575]) -> [SKIP][329] ([i915#1839])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@feature_discovery@display-2x.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@psr1:
    - shard-dg2:          [SKIP][330] ([i915#658]) -> [SKIP][331] ([i915#2575])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@feature_discovery@psr1.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@feature_discovery@psr1.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          [SKIP][332] ([i915#2575]) -> [SKIP][333] ([i915#7697]) +1 similar issue
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [ABORT][334] ([i915#7461]) -> [SKIP][335] ([i915#2575])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          [SKIP][336] ([i915#2575]) -> [SKIP][337] ([i915#8555]) +1 similar issue
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          [SKIP][338] ([i915#280]) -> [SKIP][339] ([i915#2575])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          [SKIP][340] ([i915#2575]) -> [SKIP][341] ([i915#280]) +1 similar issue
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [ABORT][342] ([i915#7975] / [i915#8213]) -> [SKIP][343] ([i915#2575])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@gem_eio@hibernate.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          [SKIP][344] ([i915#4812]) -> [SKIP][345] ([i915#2575])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@gem_exec_balancer@bonded-false-hang.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][346] ([i915#2575]) -> [SKIP][347] ([i915#4812]) +1 similar issue
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          [SKIP][348] ([i915#3539]) -> [SKIP][349] ([i915#2575])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@gem_exec_fair@basic-throttle.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          [SKIP][350] ([i915#2575]) -> [SKIP][351] ([i915#3539] / [i915#4852]) +2 similar issues
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          [SKIP][352] ([i915#3539] / [i915#4852]) -> [SKIP][353] ([i915#2575]) +3 similar issues
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@gem_exec_flush@basic-uc-ro-default.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][354] ([i915#2575]) -> [SKIP][355] ([i915#3539])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          [SKIP][356] ([fdo#109283] / [i915#2575]) -> [SKIP][357] ([fdo#109283] / [i915#5107])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          [SKIP][358] ([fdo#112283]) -> [SKIP][359] ([i915#2575]) +1 similar issue
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_exec_params@secure-non-master.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          [SKIP][360] ([i915#3281]) -> [SKIP][361] ([i915#2575]) +12 similar issues
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@gem_exec_reloc@basic-softpin.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          [SKIP][362] ([i915#2575]) -> [SKIP][363] ([i915#3281]) +15 similar issues
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          [SKIP][364] ([i915#2575]) -> [SKIP][365] ([i915#4860]) +1 similar issue
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          [SKIP][366] ([i915#4860]) -> [SKIP][367] ([i915#2575])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          [SKIP][368] ([i915#8289]) -> [SKIP][369] ([i915#2575])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@gem_media_fill@media-fill.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-dg2:          [SKIP][370] ([i915#2575]) -> [SKIP][371] ([i915#284])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_media_vme.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          [SKIP][372] ([i915#2575]) -> [SKIP][373] ([i915#4077]) +7 similar issues
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          [SKIP][374] ([i915#4077]) -> [SKIP][375] ([i915#2575]) +9 similar issues
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          [SKIP][376] ([i915#2575]) -> [SKIP][377] ([i915#4083]) +4 similar issues
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_mmap_wc@bad-object.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-dg2:          [SKIP][378] ([i915#4083]) -> [SKIP][379] ([i915#2575]) +6 similar issues
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@gem_mmap_wc@write-read-distinct.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          [SKIP][380] ([i915#3282]) -> [SKIP][381] ([i915#2575]) +6 similar issues
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_partial_pwrite_pread@reads.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          [SKIP][382] ([i915#2575]) -> [SKIP][383] ([i915#3282]) +6 similar issues
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_pread@snoop.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gem_pread@snoop.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          [SKIP][384] ([i915#2575]) -> [SKIP][385] ([i915#4270]) +3 similar issues
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-dg2:          [SKIP][386] ([i915#4270]) -> [SKIP][387] ([i915#2575]) +3 similar issues
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-3/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-dg2:          [SKIP][388] ([i915#2575] / [i915#5190]) -> [SKIP][389] ([i915#5190]) +7 similar issues
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-10/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          [SKIP][390] ([i915#5190]) -> [SKIP][391] ([i915#2575] / [i915#5190]) +4 similar issues
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          [SKIP][392] ([i915#2575]) -> [SKIP][393] ([i915#4079])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_render_tiled_blits@basic.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          [SKIP][394] ([i915#4079]) -> [SKIP][395] ([i915#2575]) +1 similar issue
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          [SKIP][396] ([i915#2575]) -> [SKIP][397] ([i915#4885])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          [SKIP][398] ([i915#2575]) -> [SKIP][399] ([i915#4879])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_unfence_active_buffers.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          [SKIP][400] ([i915#2575]) -> [SKIP][401] ([i915#3297]) +2 similar issues
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_userptr_blits@coherency-sync.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          [SKIP][402] ([i915#3297]) -> [SKIP][403] ([i915#2575]) +2 similar issues
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_userptr_blits@dmabuf-unsync.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          [SKIP][404] ([i915#3297] / [i915#4958]) -> [SKIP][405] ([i915#2575])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          [FAIL][406] ([i915#3318]) -> [SKIP][407] ([i915#2575])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-2/igt@gem_userptr_blits@vma-merge.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          [SKIP][408] ([i915#2575]) -> [SKIP][409] ([fdo#109289]) +1 similar issue
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gen7_exec_parse@bitmasks.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg2:          [SKIP][410] ([i915#2856]) -> [SKIP][411] ([i915#2575]) +4 similar issues
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-2/igt@gen9_exec_parse@allowed-all.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-dg2:          [SKIP][412] ([i915#2575]) -> [SKIP][413] ([i915#2856]) +2 similar issues
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gen9_exec_parse@basic-rejected.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [WARN][414] ([i915#7356]) -> [DMESG-WARN][415] ([i915#7061] / [i915#8617])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-dg2:          [SKIP][416] ([i915#5354] / [i915#7561]) -> [SKIP][417] ([i915#2575]) +1 similar issue
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@i915_pm_backlight@basic-brightness.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_backlight@fade:
    - shard-dg2:          [SKIP][418] ([i915#2575]) -> [SKIP][419] ([i915#5354] / [i915#7561])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_backlight@fade.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@i915_pm_backlight@fade.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          [SKIP][420] ([i915#2575]) -> [SKIP][421] ([i915#658])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-10/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-dg2:          [SKIP][422] ([i915#2575]) -> [SKIP][423] ([i915#5978])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_dc@dc6-dpms.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-dg2:          [SKIP][424] ([i915#5174]) -> [SKIP][425] ([i915#4077])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_rpm@gem-evict-pwrite.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@i2c:
    - shard-dg2:          [FAIL][426] ([i915#8717]) -> [SKIP][427] ([i915#5174])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-2/igt@i915_pm_rpm@i2c.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][428] ([i915#5174]) -> [SKIP][429] ([i915#1397]) +1 similar issue
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          [SKIP][430] ([i915#6621]) -> [SKIP][431] ([i915#2575])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@i915_pm_rps@basic-api.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          [SKIP][432] ([i915#2575]) -> [SKIP][433] ([i915#6621]) +1 similar issue
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          [SKIP][434] ([i915#4387]) -> [SKIP][435] ([i915#2575])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-3/igt@i915_pm_sseu@full-enable.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          [SKIP][436] ([i915#6188]) -> [SKIP][437] ([i915#2575])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-2/igt@i915_query@query-topology-coherent-slice-mask.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          [SKIP][438] ([fdo#109302]) -> [SKIP][439] ([i915#2575])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@i915_query@query-topology-unsupported.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          [SKIP][440] ([i915#2575]) -> [SKIP][441] ([i915#4212]) +3 similar issues
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_async_flips@crc@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-FAIL][442] ([i915#8561]) -> [DMESG-FAIL][443] ([i915#1982] / [i915#8561])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-6/igt@kms_async_flips@crc@pipe-a-edp-1.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@kms_async_flips@crc@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][444] ([i915#1769] / [i915#3555]) -> [SKIP][445] ([i915#2575])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][446] ([fdo#109315]) -> [SKIP][447] ([fdo#111614]) +6 similar issues
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          [SKIP][448] ([fdo#111614]) -> [SKIP][449] ([fdo#109315]) +3 similar issues
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          [SKIP][450] ([i915#5190]) -> [SKIP][451] ([fdo#109315] / [i915#5190]) +8 similar issues
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][452] ([fdo#109315] / [i915#5190]) -> [SKIP][453] ([i915#5190]) +5 similar issues
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2:          [SKIP][454] ([fdo#109315] / [i915#5190]) -> [SKIP][455] ([i915#4538] / [i915#5190]) +5 similar issues
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          [SKIP][456] ([i915#4538] / [i915#5190]) -> [SKIP][457] ([fdo#109315] / [i915#5190]) +2 similar issues
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2:          [SKIP][458] ([i915#2705]) -> [SKIP][459] ([fdo#109315])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@kms_big_joiner@invalid-modeset.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_mtl_rc_ccs:
    - shard-dg2:          [SKIP][460] ([i915#5354]) -> [SKIP][461] ([i915#2575]) +19 similar issues
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_mtl_rc_ccs.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          [SKIP][462] ([i915#3689] / [i915#3886] / [i915#5354]) -> [SKIP][463] ([i915#2575]) +10 similar issues
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:
    - shard-dg2:          [SKIP][464] ([i915#2575]) -> [SKIP][465] ([i915#5354]) +22 similar issues
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-dg2:          [SKIP][466] ([i915#2575]) -> [SKIP][467] ([i915#3689] / [i915#3886] / [i915#5354]) +13 similar issues
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:
    - shard-dg2:          [SKIP][468] ([i915#2575]) -> [SKIP][469] ([i915#3689] / [i915#5354]) +17 similar issues
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:
    - shard-dg2:          [SKIP][470] ([i915#3689] / [i915#5354]) -> [SKIP][471] ([i915#2575]) +27 similar issues
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2:          [SKIP][472] ([fdo#111827]) -> [SKIP][473] ([i915#2575])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-2/igt@kms_chamelium_color@ctm-0-75.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          [SKIP][474] ([i915#2575]) -> [SKIP][475] ([fdo#111827]) +3 similar issues
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_chamelium_color@degamma.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2:          [SKIP][476] ([i915#2575]) -> [SKIP][477] ([i915#7828]) +6 similar issues
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg2:          [SKIP][478] ([i915#7828]) -> [SKIP][479] ([i915#2575]) +11 similar issues
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [SKIP][480] ([i915#2575]) -> [SKIP][481] ([i915#3555]) +3 similar issues
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/index.html

--===============5743630859358468141==
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
<tr><td><b>Series:</b></td><td>tests/msm: Add submitoverhead benchmark</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121909/">https://patchwork.freedesktop.org/series/121909/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13463_full -&gt; IGTPW_9499_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9499_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9499_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9499_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_async_flips@test-cursor.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-snb6/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb7/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-vga-1.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@tools_test@tools_test:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@tools_test@tools_test.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@tools_test@tools_test.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13463_full and IGTPW_9499_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_prime@basic-crc-vgem@second-to-first:<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9499_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@drm_fdinfo@busy-idle-check-all@ccs0.html">SKIP</a> ([i915#8414]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@drm_fdinfo@busy-idle@bcs0.html">SKIP</a> ([i915#8414]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@fbdev@info.html">SKIP</a> ([i915#1849] / [i915#2582])</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@fbdev@pan.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@fbdev@read.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@gem_caching@read-writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#5325])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#5325])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-16/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#5325])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#5325])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#5325])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-7/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6121] / [i915#7916])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG-WARN</a> ([i915#8841]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb4/igt@gem_ctx_persistence@engines-hang.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@bsd1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-1/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-1/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html">FAIL</a> ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> ([i915#7816]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-1/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-16/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vcs1-smem:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-6/igt@gem_exec_capture@capture@vcs1-smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@gem_exec_capture@capture@vcs1-smem.html">DMESG-WARN</a> ([i915#5591])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> ([i915#3539] / [i915#4852])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-12/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> ([i915#3539] / [i915#4852])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@gem_exec_reloc@basic-active.html">SKIP</a> ([i915#3281]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> ([i915#3281]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@gem_exec_reloc@basic-wc.html">SKIP</a> ([i915#3281]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@gem_exec_reloc@basic-write-cpu-active.html">SKIP</a> ([i915#3281]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@gem_lmem_evict@dontneed-evict-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> ([i915#5775])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-2/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_lmem_swapping@massive-random.html">SKIP</a> ([i915#5775]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo-tiledx:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-13/igt@gem_mmap_gtt@basic-small-bo-tiledx.html">SKIP</a> ([i915#4077]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html">SKIP</a> ([i915#4077]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gem_mmap_gtt@big-copy-odd.html">SKIP</a> ([i915#4077]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@gem_readwrite@read-bad-handle.html">SKIP</a> ([i915#3282]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-y-tiled.html">SKIP</a> ([i915#2575] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#3282])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk8/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk4/igt@gen9_exec_parse@allowed-all.html">ABORT</a> ([i915#5566]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-2/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">FAIL</a> ([i915#8691])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-4/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-9/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#3989] / [i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@i915_pm_freq_api@freq-suspend@gt0.html">SKIP</a> ([i915#6645])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@i915_pm_freq_api@freq-suspend@gt1.html">SKIP</a> ([i915#8805])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-10/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-3/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> ([i915#7940]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg1-13/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#5174])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg1-17/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">FAIL</a> ([i915#7940])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> ([i915#5174]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> ([i915#8925]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-3/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> ([i915#8497])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-3/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> ([i915#6367])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> ([fdo#103375]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">FAIL</a> ([i915#2521])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html">SKIP</a> ([i915#8502] / [i915#8709]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html">SKIP</a> ([i915#8502]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html">SKIP</a> ([i915#8502]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb6/igt@kms_big_fb.html">INCOMPLETE</a> ([i915#2295])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> ([i915#5286])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5286])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-17/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#3638]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#109315]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#5190]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#110723])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#5354] / [i915#6095])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-18/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#6095]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-6/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([i915#3734] / [i915#5354] / [i915#6095])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> ([i915#6095]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-6/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> ([i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-4/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#5354]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#4087] / [i915#7213]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-17/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#4087]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> ([i915#7828]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> ([i915#7828]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> ([i915#7828]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">FAIL</a> ([i915#72])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> ([fdo#111825]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> ([i915#3546])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> ([fdo#111767] / [i915#3546])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#111767])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-3/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> ([i915#4767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-10/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([fdo#111767] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> ([fdo#109274] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">FAIL</a> ([fdo#103375]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> ([fdo#109315]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([fdo#109315] / [i915#5190]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> ([fdo#103375]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> ([fdo#111825]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109280]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> ([i915#5354]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +4 similar issues</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#110189])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> ([fdo#111825] / [i915#1825]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> ([i915#3458]) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> ([i915#3023]) +2 similar issues</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> ([i915#3458]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@kms_getfb@getfb2-accept-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> ([i915#2575]) +161 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> ([fdo#109289]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#5176]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#5176]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#5176]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#5235]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#5235]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html">SKIP</a> ([fdo#109271]) +201 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> ([i915#2575]) +138 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#5235]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#658])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-12/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-19/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([i915#1072]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-6/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> ([i915#1072])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-13/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> ([i915#1072] / [i915#4078])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> ([i915#4235]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html">SKIP</a> ([i915#5030]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format_helper:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-snb2/igt@kms_selftest@drm_format_helper.html">SKIP</a> ([fdo#109271] / [i915#8661])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk5/igt@kms_selftest@drm_format_helper.html">SKIP</a> ([fdo#109271] / [i915#8661])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-wait-idle-hang:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-apl2/igt@kms_vblank@pipe-a-wait-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-apl2/igt@kms_vblank@pipe-a-wait-idle-hang.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk4/igt@kms_vblank@pipe-a-wait-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk8/igt@kms_vblank@pipe-a-wait-idle-hang.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-8/igt@kms_vrr@flip-basic.html">SKIP</a> ([i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@perf@blocking-parameterized.html">SKIP</a> ([i915#5608]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@perf@stress-open-close.html">SKIP</a> ([i915#5608]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@array-job-submission:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-18/igt@v3d/v3d_job_submission@array-job-submission.html">SKIP</a> ([i915#2575]) +3 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-7/igt@v3d/v3d_job_submission@array-job-submission.html">SKIP</a> ([fdo#109315] / [i915#2575]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_mmap@mmap-bad-flags:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@v3d/v3d_mmap@mmap-bad-flags.html">SKIP</a> ([fdo#109315]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-pad:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk9/igt@v3d/v3d_submit_csd@bad-pad.html">SKIP</a> ([fdo#109271]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@job-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-5/igt@v3d/v3d_submit_csd@job-perfmon.html">SKIP</a> ([i915#2575]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-bad-name:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-5/igt@vc4/vc4_label_bo@set-bad-name.html">SKIP</a> ([i915#7711]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> ([i915#7711]) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> ([i915#7711]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-15/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> ([i915#7711]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@bad-pad:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-9/igt@vc4/vc4_wait_bo@bad-pad.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@core_hotunplug@unbind-rebind.html">SKIP</a> ([i915#6767]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@fbdev@nullptr.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCOMPLETE</a> ([i915#4793]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk9/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a></p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@gem_ctx_isolation@preservation-s3@bcs0.html">FAIL</a> ([fdo#103375]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-10/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-7/igt@gem_ctx_persistence@engines-hang@vcs0.html">FAIL</a> ([i915#2410]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@gem_ctx_persistence@engines-hang@vcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_exec_params@no-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-12/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html">TIMEOUT</a> ([i915#7392]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#8489] / [i915#8668]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([i915#1937]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-rkl-4/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@smem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg1-17/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html">FAIL</a> ([i915#7940]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-3/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> ([i915#7059]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> ([i915#2575] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@device-submit-unordered:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-7/igt@syncobj_timeline@device-submit-unordered.html">DMESG-WARN</a> ([i915#2017]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-2/igt@syncobj_timeline@device-submit-unordered.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-for-submit-delayed-submit:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html">PASS</a> +191 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html">FAIL</a> ([i915#6015]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@device_reset@cold-reset-bound.html">FAIL</a> ([i915#6121]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#8414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#5608]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@feature_discovery@psr1.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@feature_discovery@psr1.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#7461]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_eio@hibernate.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283] / [i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> ([i915#2575]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> ([i915#4860]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_media_vme.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#4077]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#2575]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#4083]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read-distinct:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@gem_mmap_wc@write-read-distinct.html">SKIP</a> ([i915#4083]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_mmap_wc@write-read-distinct.html">SKIP</a> ([i915#2575]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#2575]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_pread@snoop.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-3/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#2575] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-10/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#5190]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gem_userptr_blits@vma-merge.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-1/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-2/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">WARN</a> ([i915#7356]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#7061] / [i915#8617])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354] / [i915#7561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_backlight@fade.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-6/igt@i915_pm_backlight@fade.html">SKIP</a> ([i915#5354] / [i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-10/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-2/igt@i915_pm_rpm@i2c.html">FAIL</a> ([i915#8717]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_rpm@i2c.html">SKIP</a> ([i915#5174])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#1397]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-3/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-2/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-5/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-mtlp-6/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> ([i915#8561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-mtlp-7/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> ([i915#1982] / [i915#8561])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#109315]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#109315] / [i915#5190]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109315] / [i915#5190]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-10/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#2575]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#2575]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> ([i915#5354]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-8/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#2575]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-2/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> ([fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_chamelium_color@degamma.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-8/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> ([i915#7828]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-1/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9499/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#2575]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/shard-dg2-11/igt@kms_c">SKIP</a> ([i915#2575]) -&gt; [SKIP][481] ([i915#3555]) +3 similar issues</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5743630859358468141==--
