Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0675302008844780203=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Sat, 01 Jul 2023 07:40:58 -0000
Message-ID: <168819725880.27404.16259010383737666181@emeril.freedesktop.org>
References: <20230628122744.2810365-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230628122744.2810365-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2tt?=
 =?utf-8?q?s=3A_Fix_the_missing_documentaion_for_KMS_library?=
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

--===============0675302008844780203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: Fix the missing documentaion for KMS library
URL   : https://patchwork.freedesktop.org/series/119973/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7354_full -> IGTPW_9294_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9294_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9294_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9294_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_panel_fitting@atomic-fastset.html

  
#### Warnings ####

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          [SKIP][2] ([i915#4579]) -> [SKIP][3] +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html
    - shard-rkl:          [SKIP][4] ([i915#4579]) -> [SKIP][5] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@kms_plane_lowres@tiling-yf.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html
    - shard-tglu:         [SKIP][6] ([i915#4579]) -> [SKIP][7] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-10/igt@kms_plane_lowres@tiling-yf.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-9/igt@kms_plane_lowres@tiling-yf.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - {shard-dg1}:        NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_plane_lowres@tiling-yf:
    - {shard-dg1}:        [SKIP][9] ([i915#4579]) -> [SKIP][10] +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg1-16/igt@kms_plane_lowres@tiling-yf.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-18/igt@kms_plane_lowres@tiling-yf.html

  
Known issues
------------

  Here are the changes found in IGTPW_9294_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#7701])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#7701])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-hang@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8414] / [i915#8761])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@drm_fdinfo@busy-hang@ccs0.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#8414]) +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][17] -> [FAIL][18] ([i915#7742])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#658])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-8/igt@feature_discovery@psr2.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#5325])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-mtlp:         [PASS][21] -> [FAIL][22] ([i915#6121] / [i915#7916])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-mtlp:         [PASS][23] -> [ABORT][24] ([i915#7941])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-3/igt@gem_eio@in-flight-contexts-10ms.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_await@wide-contexts:
    - shard-dg2:          [PASS][25] -> [FAIL][26] ([i915#5892])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-6/igt@gem_exec_await@wide-contexts.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#4812])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#4525])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#6334] / [i915#8761])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#2846])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk8/igt@gem_exec_fair@basic-deadline.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][32] ([i915#2842])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglu:         [PASS][33] -> [FAIL][34] ([i915#2842])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4473] / [i915#4771])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-rkl:          [PASS][36] -> [FAIL][37] ([i915#2842]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3539] / [i915#4852]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-rkl:          NOTRUN -> [SKIP][39] ([fdo#109313])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#3281]) +6 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3281]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@gem_exec_reloc@basic-softpin.html
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#3281]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_schedule@deep@vcs0:
    - shard-mtlp:         [PASS][43] -> [FAIL][44] ([i915#8545])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-5/igt@gem_exec_schedule@deep@vcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_exec_schedule@deep@vcs0.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [PASS][45] -> [FAIL][46] ([i915#7327])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-3/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-mtlp:         [PASS][47] -> [TIMEOUT][48] ([i915#8628])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-mtlp:         NOTRUN -> [FAIL][49] ([i915#6363])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-mtlp:         [PASS][50] -> [FAIL][51] ([i915#6363]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-3/igt@gem_exec_whisper@basic-queues-priority-all.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4860]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4860]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_flink_basic@bad-flink:
    - shard-mtlp:         [PASS][54] -> [DMESG-WARN][55] ([i915#2017])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-2/igt@gem_flink_basic@bad-flink.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_flink_basic@bad-flink.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4613]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-9/igt@gem_lmem_swapping@random.html

  * igt@gem_mmap@bad-size:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4083]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_mmap@bad-size.html

  * igt@gem_mmap_gtt@basic-write-read:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4077]) +6 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-read.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4083]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-11/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3282])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#3282]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4270])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@gem_pxp@fail-invalid-protected-context.html
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4270])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#4270])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4270])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#8428]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4885])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4077]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3282]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4079])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#3297])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@gem_userptr_blits@coherency-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3297]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@nohangcheck:
    - shard-mtlp:         NOTRUN -> [FAIL][74] ([i915#7916])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@gem_userptr_blits@nohangcheck.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3297])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@gem_userptr_blits@unsync-overlap.html
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3297])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([fdo#109289])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([fdo#109289]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@gen7_exec_parse@bitmasks.html
    - shard-rkl:          NOTRUN -> [SKIP][79] ([fdo#109289]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#2856])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-11/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#2527])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#2527] / [i915#2856])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#2856]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#7707])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@i915_hwmon@hwmon-read.html

  * igt@i915_module_load@load:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#6227])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@i915_module_load@load.html
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#6227])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][87] -> [ABORT][88] ([i915#8489])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][89] -> [SKIP][90] ([i915#4281])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-10/igt@i915_pm_dc@dc9-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][91] -> [SKIP][92] ([i915#1397])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([fdo#111644] / [i915#1397])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#1397]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-dg2:          [PASS][95] -> [FAIL][96] ([fdo#103375])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@i915_pm_rpm@system-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][97] ([i915#8346])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-mtlp:         [PASS][98] -> [DMESG-FAIL][99] ([i915#7059])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@i915_selftest@live@gt_mocs.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#5286])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([fdo#111615] / [i915#5286]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         [PASS][102] -> [FAIL][103] ([i915#3743]) +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([fdo#111614])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([fdo#111614])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][106] ([fdo#111614] / [i915#3638])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([fdo#111614]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#5190]) +3 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([fdo#111615])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([fdo#111615]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][111] ([fdo#111615]) +7 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#4538] / [i915#5190])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-rkl:          NOTRUN -> [SKIP][113] ([fdo#110723])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#2705])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#6095]) +16 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#3734] / [i915#5354] / [i915#6095])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#3689] / [i915#3886] / [i915#5354]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#3886] / [i915#5354] / [i915#6095])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#3886]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl2/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#5354] / [i915#6095]) +5 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-10/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#3886] / [i915#6095]) +4 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#5354]) +10 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#3689] / [i915#5354] / [i915#6095]) +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#3689] / [i915#5354]) +8 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#5354] / [i915#6095]) +6 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-8/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#3742])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#4087]) +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#4087] / [i915#8761])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_cdclk@plane-scaling@pipe-d-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4087]) +4 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#7828]) +3 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([fdo#111827])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-rkl:          NOTRUN -> [SKIP][133] ([fdo#111827])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([fdo#111827])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-9/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([fdo#111827])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#7828]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#7828]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#7828])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@lic:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#6944] / [i915#7116] / [i915#7118])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-8/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@lic@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [TIMEOUT][140] ([i915#7173]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@kms_content_protection@lic@pipe-a-dp-2.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#7118])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3555]) +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([fdo#109274] / [i915#5354])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#3546])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][145] -> [FAIL][146] ([i915#2346])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#8588])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fence_pin_leak:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#4881])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([fdo#109274]) +1 similar issue
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([fdo#109274] / [i915#3637])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#3637]) +1 similar issue
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][152] -> [FAIL][153] ([i915#79])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([fdo#111825]) +2 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#8381])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#2672])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#8761]) +16 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#2587] / [i915#2672])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([fdo#109285] / [i915#4098])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#5274])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2:          [PASS][161] -> [FAIL][162] ([i915#6880])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#1825]) +26 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#5460])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#3458]) +2 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#5354]) +8 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][167] ([fdo#111825] / [i915#1825]) +8 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][168] ([fdo#109280]) +10 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#8708]) +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#8708]) +3 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3023]) +4 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([fdo#110189]) +9 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#433])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#3555]) +2 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#6403]) +2 similar issues
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#6403] / [i915#8761])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#6301]) +1 similar issue
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [FAIL][178] ([fdo#103375])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html

  * igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#3582]) +2 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@kms_plane_lowres@tiling-4@pipe-c-edp-1.html

  * igt@kms_plane_lowres@tiling-4@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#3582] / [i915#8761])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@kms_plane_lowres@tiling-4@pipe-d-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][181] ([i915#8292])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][182] ([i915#8292])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#5176]) +7 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-dp-4.html

  * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#5176]) +1 similar issue
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#5176]) +3 similar issues
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-dp-2:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#5235]) +15 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-dp-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#5235]) +5 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][188] ([fdo#109271]) +29 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-snb1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#5235]) +2 similar issues
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#5235] / [i915#8761])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1.html

  * igt@kms_prime@d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#6524])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_prime@d3hot.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#4348])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([fdo#109642] / [fdo#111068] / [i915#658]) +1 similar issue
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@primary_page_flip:
    - shard-apl:          NOTRUN -> [SKIP][194] ([fdo#109271]) +26 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl6/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#1072]) +3 similar issues
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@sprite_blt:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#1072]) +3 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@kms_psr@sprite_blt.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#4235])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#5289])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#3555]) +1 similar issue
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#4070] / [i915#533] / [i915#6768]) +1 similar issue
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@perf@mi-rpc:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#2434])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][202] ([i915#4349])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#8516])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#8516])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#3708])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@prime_vgem@fence-flip-hang.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-mtlp:         [PASS][206] -> [ABORT][207] ([i915#8521])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-5/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@sysfs_preempt_timeout@timeout@vecs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#4818])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@tools_test@sysfs_l3_parity.html
    - shard-rkl:          NOTRUN -> [SKIP][209] ([fdo#109307])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_mmap@mmap-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#2575]) +6 similar issues
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@v3d/v3d_mmap@mmap-bo.html

  * igt@v3d/v3d_perfmon@create-perfmon-0:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([fdo#109315]) +4 similar issues
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@v3d/v3d_perfmon@create-perfmon-0.html

  * igt@v3d/v3d_submit_cl@valid-submission:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([fdo#109315] / [i915#2575]) +4 similar issues
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-8/igt@v3d/v3d_submit_cl@valid-submission.html

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#2575]) +3 similar issues
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@v3d/v3d_submit_csd@single-out-sync.html

  * igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#7711]) +5 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#7711])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#7711])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html

  * igt@vc4/vc4_purgeable_bo@mark-purgeable:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#2575]) +2 similar issues
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-3/igt@vc4/vc4_purgeable_bo@mark-purgeable.html

  
#### Possible fixes ####

  * igt@gem_barrier_race@remote-request@rcs0:
    - shard-mtlp:         [ABORT][218] ([i915#6333] / [i915#8234]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-2/igt@gem_barrier_race@remote-request@rcs0.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][220] ([i915#6268]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [FAIL][222] ([i915#7816]) -> [PASS][223] +2 similar issues
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_eio@kms:
    - shard-dg2:          [DMESG-WARN][224] -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@gem_eio@kms.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@gem_eio@kms.html
    - {shard-dg1}:        [FAIL][226] ([i915#5784]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg1-12/igt@gem_eio@kms.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-17/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [FAIL][228] ([i915#5784]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-6/igt@gem_eio@reset-stress.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-dg2:          [FAIL][230] ([i915#6032]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@gem_exec_balancer@full-pulse.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-apl:          [FAIL][232] ([i915#2842]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-mtlp:         [FAIL][234] ([i915#6363]) -> [PASS][235] +1 similar issue
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@gem_exec_whisper@basic-queues-all.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][236] ([i915#5493]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - {shard-dg1}:        [DMESG-WARN][238] ([i915#4936] / [i915#5493]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@i915_hangman@engine-engine-hang@vcs0:
    - shard-mtlp:         [FAIL][240] ([i915#7069]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-8/igt@i915_hangman@engine-engine-hang@vcs0.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@i915_hangman@engine-engine-hang@vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - {shard-dg1}:        [FAIL][242] ([i915#3591]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [SKIP][244] ([i915#1397]) -> [PASS][245] +1 similar issue
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][246] ([i915#1397]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
    - {shard-dg1}:        [SKIP][248] ([i915#1397]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [DMESG-FAIL][250] ([i915#6763]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@i915_selftest@live@workarounds.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [ABORT][252] ([i915#180]) -> [PASS][253] +1 similar issue
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          [FAIL][254] ([i915#6880]) -> [PASS][255] +2 similar issues
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][256] ([i915#8292]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-dg2:          [FAIL][258] ([fdo#103375]) -> [PASS][259] +1 similar issue
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf_pmu@busy-idle@ccs0:
    - shard-mtlp:         [FAIL][260] ([i915#4349]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-4/igt@perf_pmu@busy-idle@ccs0.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@perf_pmu@busy-idle@ccs0.html

  * igt@perf_pmu@busy-idle@vecs1:
    - shard-dg2:          [FAIL][262] ([i915#4349]) -> [PASS][263] +4 similar issues
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@perf_pmu@busy-idle@vecs1.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@perf_pmu@busy-idle@vecs1.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-mtlp:         [FAIL][264] ([i915#8553]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-8/igt@perf_pmu@rc6-all-gts.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@perf_pmu@rc6-all-gts.html

  
#### Warnings ####

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         [SKIP][266] ([i915#4579] / [i915#8414]) -> [SKIP][267] ([i915#8414] / [i915#8761]) +6 similar issues
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@most-busy-check-all@ccs3:
    - shard-dg2:          [SKIP][268] ([i915#4579] / [i915#8414]) -> [SKIP][269] ([i915#8414]) +7 similar issues
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@drm_fdinfo@most-busy-check-all@ccs3.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@drm_fdinfo@most-busy-check-all@ccs3.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][270] ([i915#4579] / [i915#5325]) -> [SKIP][271] ([i915#5325])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][272] ([i915#3555] / [i915#4579] / [i915#5325]) -> [SKIP][273] ([i915#3555] / [i915#5325]) +1 similar issue
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html
    - shard-tglu:         [SKIP][274] ([i915#3555] / [i915#4579] / [i915#5325]) -> [SKIP][275] ([i915#3555] / [i915#5325]) +1 similar issue
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          [SKIP][276] ([i915#4098] / [i915#4579] / [i915#5325]) -> [SKIP][277] ([i915#4098] / [i915#5325])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         [SKIP][278] ([i915#4579] / [i915#5325]) -> [SKIP][279] ([i915#5325]) +2 similar issues
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-4/igt@gem_ccs@suspend-resume.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@hog-create@smem0:
    - shard-dg2:          [FAIL][280] ([i915#5892] / [i915#7679]) -> [FAIL][281] ([i915#5892])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-11/igt@gem_create@hog-create@smem0.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@gem_create@hog-create@smem0.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
    - shard-mtlp:         [SKIP][282] ([i915#4579] / [i915#5882]) -> [SKIP][283] ([i915#5882] / [i915#8761])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3:
    - shard-dg2:          [SKIP][284] ([i915#4579] / [i915#5882]) -> [SKIP][285] ([i915#5882])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          [SKIP][286] ([fdo#109271] / [i915#4579] / [i915#6334]) -> [SKIP][287] ([fdo#109271] / [i915#6334])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk7/igt@gem_exec_capture@capture-invisible@smem0.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-dg2:          [SKIP][288] ([i915#4579] / [i915#6334]) -> [SKIP][289] ([i915#6334])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-5/igt@gem_exec_capture@capture-invisible@smem0.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-11/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-rkl:          [SKIP][290] ([i915#4579] / [i915#6334]) -> [SKIP][291] ([i915#6334])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-tglu:         [SKIP][292] ([i915#4579] / [i915#6334]) -> [SKIP][293] ([i915#6334])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-9/igt@gem_exec_capture@capture-invisible@smem0.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-3/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-apl:          [SKIP][294] ([fdo#109271] / [i915#4579] / [i915#6334]) -> [SKIP][295] ([fdo#109271] / [i915#6334])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl3/igt@gem_exec_capture@capture-invisible@smem0.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl7/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [ABORT][296] ([i915#8131]) -> [TIMEOUT][297] ([i915#7392])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][298] ([i915#7061]) -> [WARN][299] ([i915#6596] / [i915#7356])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          [SKIP][300] ([i915#4579] / [i915#6590]) -> [SKIP][301] ([i915#6590])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@i915_pm_freq_mult@media-freq@gt0.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         [SKIP][302] ([i915#4579] / [i915#6590]) -> [SKIP][303] ([i915#6590])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-3/igt@i915_pm_freq_mult@media-freq@gt0.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          [SKIP][304] ([fdo#109271] / [i915#1937] / [i915#4579]) -> [SKIP][305] ([fdo#109271] / [i915#1937])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          [SKIP][306] ([fdo#109271] / [i915#1937] / [i915#4579]) -> [SKIP][307] ([fdo#109271] / [i915#1937])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
    - shard-dg2:          [SKIP][308] ([i915#1937] / [i915#4579]) -> [SKIP][309] ([i915#1937])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
    - shard-rkl:          [SKIP][310] ([i915#1937] / [i915#4579]) -> [SKIP][311] ([i915#1937])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglu:         [FAIL][312] ([i915#3591]) -> [WARN][313] ([i915#2681])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - shard-tglu:         [FAIL][314] ([i915#2681] / [i915#3591]) -> [WARN][315] ([i915#2681]) +1 similar issue
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          [SKIP][316] ([fdo#109271] / [i915#1769] / [i915#4579]) -> [SKIP][317] ([fdo#109271] / [i915#1769]) +1 similar issue
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          [SKIP][318] ([i915#1769] / [i915#3555] / [i915#4579]) -> [SKIP][319] ([i915#1769] / [i915#3555]) +1 similar issue
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          [SKIP][320] ([i915#1769] / [i915#3555] / [i915#4579]) -> [SKIP][321] ([i915#1769] / [i915#3555]) +1 similar issue
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-snb:          [SKIP][322] ([fdo#109271] / [i915#1769] / [i915#4579]) -> [SKIP][323] ([fdo#109271] / [i915#1769]) +1 similar issue
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         [SKIP][324] ([i915#1769] / [i915#3555] / [i915#4579]) -> [SKIP][325] ([i915#1769] / [i915#3555]) +1 similar issue
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-apl:          [SKIP][326] ([fdo#109271] / [i915#1769] / [i915#4579]) -> [SKIP][327] ([fdo#109271] / [i915#1769]) +1 similar issue
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_cdclk@mode-transition@pipe-d-edp-1:
    - shard-mtlp:         [SKIP][328] ([i915#4579] / [i915#7213]) -> [SKIP][329] ([i915#7213] / [i915#8761])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-7/igt@kms_cdclk@mode-transition@pipe-d-edp-1.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_cdclk@mode-transition@pipe-d-edp-1.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][330] ([i915#4579] / [i915#7118]) -> [SKIP][331] ([i915#7118]) +8 similar issues
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@kms_content_protection@srm.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][332] ([i915#4579] / [i915#7118]) -> [SKIP][333] ([i915#7118]) +5 similar issues
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-6/igt@kms_content_protection@type1.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@kms_content_protection@type1.html
    - shard-tglu:         [SKIP][334] ([i915#4579] / [i915#6944] / [i915#7116] / [i915#7118]) -> [SKIP][335] ([i915#6944] / [i915#7116] / [i915#7118]) +7 similar issues
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-8/igt@kms_content_protection@type1.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-9/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         [SKIP][336] ([i915#4579]) -> [SKIP][337] ([i915#8761]) +73 similar issues
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          [SKIP][338] ([fdo#109271] / [i915#4579]) -> [SKIP][339] ([fdo#109271]) +97 similar issues
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk3/igt@kms_cursor_crc@cursor-random-max-size.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk7/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][340] ([i915#3555] / [i915#4579]) -> [SKIP][341] ([i915#3555]) +31 similar issues
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [DMESG-FAIL][342] ([i915#1982] / [i915#2017] / [i915#5954]) -> [FAIL][343] ([i915#2346])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          [SKIP][344] ([i915#3840] / [i915#4579]) -> [SKIP][345] ([i915#3840]) +2 similar issues
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-3/igt@kms_dsc@dsc-basic.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          [SKIP][346] ([i915#3840] / [i915#4579]) -> [SKIP][347] ([i915#3840]) +2 similar issues
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@kms_dsc@dsc-basic.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_dsc@dsc-basic.html
    - shard-tglu:         [SKIP][348] ([i915#3840] / [i915#4579]) -> [SKIP][349] ([i915#3840]) +2 similar issues
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-2/igt@kms_dsc@dsc-basic.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         [SKIP][350] ([i915#2587] / [i915#2672] / [i915#4579]) -> [SKIP][351] ([i915#2587] / [i915#2672]) +21 similar issues
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][352] ([i915#2672] / [i915#4579]) -> [SKIP][353] ([i915#2672]) +22 similar issues
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          [SKIP][354] ([i915#2672] / [i915#4579]) -> [SKIP][355] ([i915#2672]) +17 similar issues
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          [SKIP][356] ([i915#2672] / [i915#3555] / [i915#4579]) -> [SKIP][357] ([i915#2672] / [i915#3555])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          [SKIP][358] ([i915#4579] / [i915#6953] / [i915#8228]) -> [SKIP][359] ([i915#6953] / [i915#8228])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-6/igt@kms_hdr@invalid-hdr.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          [SKIP][360] ([i915#4579] / [i915#6953] / [i915#8228]) -> [SKIP][361] ([i915#6953] / [i915#8228])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         [SKIP][362] ([i915#4579] / [i915#6953] / [i915#8228]) -> [SKIP][363] ([i915#6953] / [i915#8228])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-9/igt@kms_hdr@invalid-metadata-sizes.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         [SKIP][364] ([i915#4579] / [i915#6301]) -> [SKIP][365] ([i915#6301]) +1 similar issue
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-4/igt@kms_panel_fitting@legacy.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:
    - shard-mtlp:         [SKIP][366] ([i915#3582] / [i915#4579]) -> [SKIP][367] ([i915#3582] / [i915#8761]) +1 similar issue
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          [SKIP][368] ([i915#4579] / [i915#6953]) -> [SKIP][369] ([i915#6953])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          [SKIP][370] ([i915#3555] / [i915#4579]) -> [SKIP][371] ([i915#3555]) +31 similar issues
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         [SKIP][372] ([i915#4579] / [i915#5176]) -> [SKIP][373] ([i915#5176] / [i915#8761]) +3 similar issues
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          [SKIP][374] ([i915#4579] / [i915#5176]) -> [SKIP][375] ([i915#5176])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-hdmi-a-3.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][376] ([i915#4579] / [i915#5176]) -> [SKIP][377] ([i915#5176]) +6 similar issues
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1:
    - shard-tglu:         [SKIP][378] ([i915#4579] / [i915#5176]) -> [SKIP][379] ([i915#5176]) +6 similar issues
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          [SKIP][380] ([i915#4579] / [i915#5235]) -> [SKIP][381] ([i915#5235]) +1 similar issue
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
    - shard-snb:          [SKIP][382] ([fdo#109271] / [i915#4579]) -> [SKIP][383] ([fdo#109271]) +145 similar issues
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-snb7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:
    - shard-mtlp:         [SKIP][384] ([i915#4579] / [i915#5235]) -> [SKIP][385] ([i915#5235] / [i915#8761]) +11 similar issues
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][386] ([i915#4579] / [i915#5235]) -> [SKIP][387] ([i915#5235]) +2 similar issues
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-tglu:         [SKIP][388] ([i915#4579] / [i915#5235]) -> [SKIP][389] ([i915#5235]) +5 similar issues
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-apl:          [SKIP][390] ([fdo#109271] / [i915#4579]) -> [SKIP][391] ([fdo#109271]) +88 similar issues
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl2/igt@kms_scaling_modes@scaling-mode-center.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl6/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         [SKIP][392] ([i915#3555] / [i915#4579]) -> [SKIP][393] ([i915#3555]) +36 similar issues
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:
    - shard-mtlp:         [SKIP][394] ([i915#4579] / [i915#5030]) -> [SKIP][395] ([i915#5030] / [i915#8761])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          [SKIP][396] ([i915#3555] / [i915#4098] / [i915#4579]) -> [SKIP][397] ([i915#3555] / [i915#4098]) +3 similar issues
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          [SKIP][398] ([fdo#112283] / [i915#4579]) -> [SKIP][399] ([fdo#112283])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@perf_pmu@event-wait@rcs0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@perf_pmu@event-wait@rcs0.html
    - shard-rkl:          [SKIP][400] ([fdo#112283] / [i915#4579]) -> [SKIP][401] ([fdo#112283])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-2/igt@perf_pmu@event-wait@rcs0.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglu:         [SKIP][402] ([fdo#112283] / [i915#4579]) -> [SKIP][403] ([fdo#112283])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-3/igt@perf_pmu@event-wait@rcs0.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-3/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          [INCOMPLETE][404] ([i915#5493]) -> [CRASH][405] ([i915#7331])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/intel/issues/3582
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5460]: https://gitlab.freedesktop.org/drm/intel/issues/5460
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
  [i915#5892]: https://gitlab.freedesktop.org/drm/intel/issues/5892
  [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
  [i915#6032]: https://gitlab.freedesktop.org/drm/intel/issues/6032
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6333]: https://gitlab.freedesktop.org/drm/intel/issues/6333
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6363]: https://gitlab.freedesktop.org/drm/intel/issues/6363
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6596]: https://gitlab.freedesktop.org/drm/intel/issues/6596
  [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7327]: https://gitlab.freedesktop.org/drm/intel/issues/7327
  [i915#7331]: https://gitlab.freedesktop.org/drm/intel/issues/7331
  [i915#7356]: https://gitlab.freedesktop.org/drm/intel/issues/7356
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7679]: https://gitlab.freedesktop.org/drm/intel/issues/7679
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7916]: https://gitlab.freedesktop.org/drm/intel/issues/7916
  [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
  [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8346]: https://gitlab.freedesktop.org/drm/intel/issues/8346
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
  [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
  [i915#8545]: https://gitlab.freedesktop.org/drm/intel/issues/8545
  [i915#8553]: https://gitlab.freedesktop.org/drm/intel/issues/8553
  [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
  [i915#8621]: https://gitlab.freedesktop.org/drm/intel/issues/8621
  [i915#8628]: https://gitlab.freedesktop.org/drm/intel/issues/8628
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8761]: https://gitlab.freedesktop.org/drm/intel/issues/8761


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7354 -> IGTPW_9294

  CI-20190529: 20190529
  CI_DRM_13330: dd3ec2080383e2bf738c6640aca4183997cf2dde @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9294: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/index.html
  IGT_7354: 07fe9ec40f779a788946ad371b0b683cab3c2536 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/index.html

--===============0675302008844780203==
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
<tr><td><b>Series:</b></td><td>lib/kms: Fix the missing documentaion for KMS library</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119973/">https://patchwork.freedesktop.org/series/119973/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7354_full -&gt; IGTPW_9294_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9294_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9294_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9294_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_panel_fitting@atomic-fastset:<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> +5 similar issues</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-10/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-9/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg1-16/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-18/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9294_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@drm_fdinfo@busy-hang@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-8/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7916">i915#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-3/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_eio@in-flight-contexts-10ms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7941">i915#7941</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_await@wide-contexts:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-6/igt@gem_exec_await@wide-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@gem_exec_await@wide-contexts.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5892">i915#5892</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk8/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109313">fdo#109313</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-5/igt@gem_exec_schedule@deep@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_exec_schedule@deep@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8545">i915#8545</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-3/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7327">i915#7327</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8628">i915#8628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@gem_exec_whisper@basic-normal.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6363">i915#6363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-3/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_exec_whisper@basic-queues-priority-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6363">i915#6363</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-2/igt@gem_flink_basic@bad-flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_flink_basic@bad-flink.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-9/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gem_mmap@bad-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-11/igt@gem_mmap_wc@copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@nohangcheck:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@gem_userptr_blits@nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7916">i915#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-11/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8489">i915#8489</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-10/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@i915_pm_rpm@system-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8346">i915#8346</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 similar issue</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_big_joiner@2x-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl2/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-10/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-8/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_cdclk@plane-scaling@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-9/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-8/igt@kms_content_protection@lic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@kms_content_protection@lic@pipe-a-dp-2.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8588">i915#8588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460">i915#5460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +8 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6403">i915#6403</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6403">i915#6403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@kms_plane_lowres@tiling-4@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3582">i915#3582</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@kms_plane_lowres@tiling-4@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3582">i915#3582</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-snb1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4348">i915#4348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl6/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@kms_psr@sprite_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-5/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@sysfs_preempt_timeout@timeout@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8521">i915#8521</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109307">fdo#109307</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_mmap@mmap-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@v3d/v3d_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-perfmon-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@v3d/v3d_perfmon@create-perfmon-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@valid-submission:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-8/igt@v3d/v3d_submit_cl@valid-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +5 similar issues</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-purgeable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-3/igt@vc4/vc4_purgeable_bo@mark-purgeable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-2/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6333">i915#6333</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8234">i915#8234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7816">i915#7816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@gem_eio@kms.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@gem_eio@kms.html">PASS</a></p>
</li>
<li>
<p>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg1-12/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-17/igt@gem_eio@kms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-6/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-pulse:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@gem_exec_balancer@full-pulse.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6032">i915#6032</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@gem_exec_balancer@full-pulse.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@gem_exec_whisper@basic-queues-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6363">i915#6363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@gem_exec_whisper@basic-queues-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></p>
</li>
<li>
<p>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4936">i915#4936</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-8/igt@i915_hangman@engine-engine-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-2/igt@i915_hangman@engine-engine-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></p>
</li>
<li>
<p>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6763">i915#6763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-4/igt@perf_pmu@busy-idle@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@perf_pmu@busy-idle@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@perf_pmu@busy-idle@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@perf_pmu@busy-idle@vecs1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-8/igt@perf_pmu@rc6-all-gts.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8553">i915#8553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@perf_pmu@rc6-all-gts.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@drm_fdinfo@most-busy-check-all@ccs3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@drm_fdinfo@most-busy-check-all@ccs3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-4/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_create@hog-create@smem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-11/igt@gem_create@hog-create@smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5892">i915#5892</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7679">i915#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@gem_create@hog-create@smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5892">i915#5892</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk7/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-5/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-11/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-9/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-3/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl3/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl7/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8131">i915#8131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-priority-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7061">i915#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-12/igt@i915_module_load@reload-with-fault-injection.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6596">i915#6596</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7356">i915#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-3/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>) +1 similar issue</p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-7/igt@kms_cdclk@mode-transition@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-7/igt@kms_cdclk@mode-transition@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-8/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-9/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-glk3/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-glk7/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +97 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-9/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-2/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3582">i915#3582</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3582">i915#3582</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-snb7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +145 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-apl2/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-apl6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +88 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5030">i915#5030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5030">i915#5030</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-7/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-rkl-2/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-rkl-4/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-tglu-3/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-tglu-3/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7331">i915#7331</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7354 -&gt; IGTPW_9294</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13330: dd3ec2080383e2bf738c6640aca4183997cf2dde @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9294: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/index.html<br />
  IGT_7354: 07fe9ec40f779a788946ad371b0b683cab3c2536 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0675302008844780203==--
