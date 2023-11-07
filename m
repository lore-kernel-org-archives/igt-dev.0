Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5265858876390788171=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Tue, 07 Nov 2023 19:49:20 -0000
Message-ID: <169938656011.21168.6930591858356104756@emeril.freedesktop.org>
References: <20231107083023.751059-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20231107083023.751059-1-janga.rahul.kumar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/xe=5Fvm=3A_Correct_stride_to_avoid_address_range_collisio?=
 =?utf-8?q?n?=
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

--===============5265858876390788171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Correct stride to avoid address range collision
URL   : https://patchwork.freedesktop.org/series/126059/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13845_full -> IGTPW_10125_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10125_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10125_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10125_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_offset@close-race:
    - shard-snb:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-snb6/igt@gem_mmap_offset@close-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb4/igt@gem_mmap_offset@close-race.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-dg2:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-7/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  
Known issues
------------

  Here are the changes found in IGTPW_10125_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#8414]) +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-13/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8414]) +10 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@drm_fdinfo@busy@ccs0.html

  * igt@drm_fdinfo@idle@rcs0:
    - shard-rkl:          [PASS][7] -> [FAIL][8] ([i915#7742]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#8414])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-5/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-idle:
    - shard-rkl:          NOTRUN -> [FAIL][10] ([i915#7742])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html

  * igt@drm_read@short-buffer-block:
    - shard-rkl:          [PASS][11] -> [SKIP][12] ([i915#4098]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@drm_read@short-buffer-block.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@drm_read@short-buffer-block.html

  * igt@fbdev@eof:
    - shard-rkl:          [PASS][13] -> [SKIP][14] ([i915#2582])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@fbdev@eof.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@fbdev@eof.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#3281]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#7697])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#4873])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#3555])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-2/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][20] ([i915#7297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [PASS][21] -> [FAIL][22] ([i915#9561])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-10/igt@gem_ctx_freq@sysfs@gt0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8555]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@gem_ctx_sseu@invalid-args.html
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#280])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#280])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@suspend:
    - shard-mtlp:         [PASS][27] -> [ABORT][28] ([i915#9414])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-mtlp-8/igt@gem_eio@suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@gem_eio@suspend.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4771])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@fairslice:
    - shard-dg1:          [PASS][30] -> [DMESG-WARN][31] ([i915#4423])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-16/igt@gem_exec_balancer@fairslice.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#4036])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4525])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#6334])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk8/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4473])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-7/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][36] ([i915#2842])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk3/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3539] / [i915#4852])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-16/igt@gem_exec_fair@basic-none-vip.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [PASS][38] -> [FAIL][39] ([i915#2842]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-rkl:          [PASS][40] -> [SKIP][41] ([i915#9591])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@gem_exec_fair@basic-pace@bcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4812]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([fdo#109313])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([fdo#109283] / [i915#5107])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([fdo#112283])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3281])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@gem_exec_reloc@basic-cpu-read-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3281]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-write-cpu:
    - shard-rkl:          [PASS][50] -> [SKIP][51] ([i915#3281]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@gem_exec_reloc@basic-write-cpu.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_exec_reloc@basic-write-cpu.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3281]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4537] / [i915#4812])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#7276])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4537] / [i915#4812])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s3-devices@smem:
    - shard-mtlp:         [PASS][56] -> [FAIL][57] ([i915#5115])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-mtlp-5/igt@gem_exec_suspend@basic-s3-devices@smem.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-5/igt@gem_exec_suspend@basic-s3-devices@smem.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4860]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#4613]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl7/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4613])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#4613]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk7/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@gem_lmem_swapping@parallel-multi.html
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#4613]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-3/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4077])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-16/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4077])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4077]) +17 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4083]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4083]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#3282]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3282]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3282])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@snoop:
    - shard-rkl:          [PASS][72] -> [SKIP][73] ([i915#3282])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@gem_pread@snoop.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-random:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#3282])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#4270])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_pxp@create-regular-context-1.html
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#4270])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-10/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4270]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271]) +107 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#8428]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#768]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4079])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-8/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4079])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3297]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#3297]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#3323])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3297] / [i915#4880])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][88] ([i915#2724])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb2/igt@gem_userptr_blits@vma-merge.html
    - shard-tglu:         NOTRUN -> [FAIL][89] ([i915#3318])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([fdo#109289]) +7 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([fdo#109289]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gen7_exec_parse@chained-batch.html
    - shard-tglu:         NOTRUN -> [SKIP][92] ([fdo#109289]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-5/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][93] -> [INCOMPLETE][94] ([i915#5566])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-glk3/igt@gen9_exec_parse@allowed-single.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk9/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#2856]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-3/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-rkl:          [PASS][97] -> [SKIP][98] ([i915#2527])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-rkl:          [PASS][99] -> [SKIP][100] ([i915#9588])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@i915_hangman@gt-engine-error@bcs0.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#8399])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-8/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rps@thresholds@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#8925])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@i915_pm_rps@thresholds@gt0.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([fdo#109303])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-7/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4212]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][105] ([i915#8247]) +3 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][106] ([i915#8247]) +3 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#1769] / [i915#3555])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#1769] / [i915#3555])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#1845] / [i915#4098]) +17 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][110] -> [FAIL][111] ([i915#5138]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([fdo#111614]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([fdo#111614] / [i915#3638])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([fdo#111614]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#3638])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#5190]) +16 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu:         [PASS][117] -> [FAIL][118] ([i915#3743])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([fdo#111615]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([fdo#110723])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([fdo#111615]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4538] / [i915#5190]) +6 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#2705])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@kms_big_joiner@basic.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4087] / [i915#7213]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([fdo#111827])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([fdo#111827]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([fdo#111827]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-10/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#7828]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#7828]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-2/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#7828]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#7828]) +8 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#7828])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-16/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#7118]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][134] ([i915#1339])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl7/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#3555] / [i915#8814])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#3555]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#4098]) +33 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#3359])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#3359])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][140] ([i915#8841]) +1 other test dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb2/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#4103] / [i915#4213] / [i915#5608])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#3546])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([fdo#109274] / [i915#5354]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([fdo#111767] / [i915#3546])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [PASS][146] -> [SKIP][147] ([i915#1845] / [i915#4098]) +29 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][148] -> [FAIL][149] ([i915#2346])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#3555]) +13 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_dirtyfb@dirtyfb-ioctl.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#8812])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3555] / [i915#3840]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#8381]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#3637]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([fdo#111825]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([fdo#109274]) +6 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([fdo#109274] / [i915#3637])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3637] / [i915#4098]) +12 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-dg2:          [PASS][159] -> [FAIL][160] ([fdo#103375]) +2 other tests fail
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-7/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#2672]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#2672])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#2672]) +5 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#2587] / [i915#2672]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#2672] / [i915#3555])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [PASS][166] -> [SKIP][167] ([i915#1849] / [i915#4098]) +21 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#5354]) +43 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#1825]) +9 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2:          [PASS][170] -> [FAIL][171] ([i915#6880])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#1849] / [i915#4098]) +8 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#8708]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#8708]) +20 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#8708]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#5460])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#3023]) +9 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#3458]) +25 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([fdo#110189]) +10 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([fdo#111825] / [i915#1825]) +8 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([fdo#109280]) +14 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][182] ([fdo#109271]) +88 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [PASS][183] -> [SKIP][184] ([i915#433])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-tglu-7/igt@kms_hdmi_inject@inject-audio.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-9/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#3555] / [i915#8228])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3555] / [i915#8228]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3555] / [i915#8228])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-htotal:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3555] / [i915#4098]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#4816])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#6301])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - shard-apl:          [PASS][191] -> [INCOMPLETE][192] ([i915#180] / [i915#9392])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#4098] / [i915#8825])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3555] / [i915#8821])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#3555] / [i915#4098] / [i915#8152])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#5176] / [i915#9423]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#5176] / [i915#9423]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#5235]) +7 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#5235]) +5 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#8152]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#5235]) +7 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#4098] / [i915#6953] / [i915#8152]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#6524] / [i915#6805])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-rkl:          [PASS][205] -> [SKIP][206] ([i915#1849])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@kms_properties@crtc-properties-atomic.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#658])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][208] ([fdo#109271] / [i915#658])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][209] ([fdo#109271] / [i915#658])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#658]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@cursor_blt:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#1072] / [i915#4078])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@kms_psr@cursor_blt.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#1072]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#1072]) +10 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#5461] / [i915#658])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#5289])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-9/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-rkl:          [PASS][216] -> [INCOMPLETE][217] ([i915#8875] / [i915#9475] / [i915#9569])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_rotation_crc@primary-rotation-90.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#4235] / [i915#5190]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([fdo#111615] / [i915#5289])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#4098])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#8623])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:
    - shard-snb:          [PASS][222] -> [FAIL][223] ([i915#9196])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-snb4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#3555]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-check-output:
    - shard-glk:          NOTRUN -> [SKIP][225] ([fdo#109271] / [i915#2437])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk5/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#2437]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][227] ([fdo#109271] / [i915#2437])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl3/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#2437])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@gen12-group-exclusive-stream-ctx-handle:
    - shard-rkl:          [PASS][229] -> [SKIP][230] ([fdo#109289])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@perf@gen12-group-exclusive-stream-ctx-handle.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-ctx-handle.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#7387])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@perf@global-sseu-config.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][232] ([i915#4349]) +3 other tests fail
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#8850])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@perf_pmu@cpu-hotplug.html
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#8850])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          [PASS][235] -> [FAIL][236] ([i915#6806])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-17/igt@perf_pmu@frequency@gt0.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@perf_pmu@frequency@gt0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3708])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#3291] / [i915#3708])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#3708])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-16/igt@prime_vgem@fence-read-hang.html

  * igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted:
    - shard-glk:          NOTRUN -> [FAIL][240] ([i915#9583])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk2/igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted.html

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:
    - shard-apl:          NOTRUN -> [FAIL][241] ([i915#9583])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl2/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html
    - shard-dg2:          NOTRUN -> [FAIL][242] ([i915#9583]) +1 other test fail
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html
    - shard-rkl:          NOTRUN -> [FAIL][243] ([i915#9583])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html

  * igt@syncobj_timeline@invalid-single-wait-available-unsubmitted:
    - shard-dg2:          NOTRUN -> [FAIL][244] ([i915#9582])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@syncobj_timeline@invalid-single-wait-available-unsubmitted.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([fdo#109307])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-10/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#2575]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-19/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html

  * igt@v3d/v3d_perfmon@create-perfmon-exceed:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([fdo#109315] / [i915#2575])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-7/igt@v3d/v3d_perfmon@create-perfmon-exceed.html

  * igt@v3d/v3d_submit_cl@bad-pad:
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#2575]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-7/igt@v3d/v3d_submit_cl@bad-pad.html

  * igt@v3d/v3d_submit_cl@valid-multisync-submission:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([fdo#109315]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@v3d/v3d_submit_cl@valid-multisync-submission.html

  * igt@v3d/v3d_submit_csd@job-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#2575]) +12 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@v3d/v3d_submit_csd@job-perfmon.html

  * igt@vc4/vc4_create_bo@create-bo-zeroed:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#7711]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@vc4/vc4_create_bo@create-bo-zeroed.html

  * igt@vc4/vc4_perfmon@create-single-perfmon:
    - shard-snb:          NOTRUN -> [SKIP][252] ([fdo#109271]) +47 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb7/igt@vc4/vc4_perfmon@create-single-perfmon.html
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#2575]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-6/igt@vc4/vc4_perfmon@create-single-perfmon.html

  * igt@vc4/vc4_tiling@get-bad-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#7711]) +12 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@vc4/vc4_tiling@get-bad-modifier.html

  * igt@vc4/vc4_wait_bo@used-bo-1ns:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#7711]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@vc4/vc4_wait_bo@used-bo-1ns.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#7711]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-8/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html

  
#### Possible fixes ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          [SKIP][257] ([i915#8411]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@api_intel_bb@object-reloc-purge-cache.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@fbdev@unaligned-write:
    - shard-dg2:          [SKIP][259] ([i915#2582]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@fbdev@unaligned-write.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@fbdev@unaligned-write.html

  * igt@gem_barrier_race@remote-request@rcs0:
    - shard-apl:          [ABORT][261] ([i915#8190]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-apl1/igt@gem_barrier_race@remote-request@rcs0.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl3/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [INCOMPLETE][263] ([i915#9364]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_exec_await@wide-contexts:
    - shard-dg2:          [INCOMPLETE][265] -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-7/igt@gem_exec_await@wide-contexts.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][267] ([i915#2846]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-rkl:          [FAIL][269] ([i915#2842]) -> [PASS][270] +1 other test pass
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fence@invalid-fence-array:
    - shard-dg2:          [SKIP][271] ([i915#2575]) -> [PASS][272] +14 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_exec_fence@invalid-fence-array.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_exec_fence@invalid-fence-array.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][273] ([i915#3281]) -> [PASS][274] +11 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          [SKIP][275] ([i915#3282]) -> [PASS][276] +4 other tests pass
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@gem_pwrite@basic-random.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_pwrite@basic-random.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          [SKIP][277] ([i915#2527]) -> [PASS][278] +2 other tests pass
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@gen9_exec_parse@batch-without-end.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          [FAIL][279] ([i915#3591]) -> [PASS][280] +1 other test pass
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][281] ([i915#4387]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@i915_pm_sseu@full-enable.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-dg1:          [DMESG-WARN][283] ([i915#4391] / [i915#4423]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-18/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [FAIL][285] ([i915#3743]) -> [PASS][286] +2 other tests pass
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][287] ([i915#1845] / [i915#4098]) -> [PASS][288] +8 other tests pass
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * {igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-rc-ccs-cc}:
    - shard-rkl:          [SKIP][289] ([i915#4098]) -> [PASS][290] +1 other test pass
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * {igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs}:
    - shard-dg2:          [SKIP][291] ([fdo#109315]) -> [PASS][292] +4 other tests pass
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][293] ([i915#2346]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][295] ([i915#79]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg2:          [FAIL][297] ([i915#6880]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-rkl:          [SKIP][299] ([i915#1849] / [i915#4098]) -> [PASS][300] +4 other tests pass
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * {igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a}:
    - shard-dg2:          [FAIL][301] ([fdo#103375]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * {igt@kms_pm_rpm@dpms-mode-unset-lpsp}:
    - shard-rkl:          [SKIP][303] ([i915#9519]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * {igt@kms_pm_rpm@modeset-non-lpsp-stress}:
    - shard-dg1:          [SKIP][305] ([i915#9519]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@perf@polling-parameterized:
    - shard-dg2:          [SKIP][307] ([i915#5608]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@perf@polling-parameterized.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@perf@polling-parameterized.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [FAIL][309] ([i915#4349]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@frequency@gt0:
    - shard-mtlp:         [SKIP][311] ([i915#9432]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-mtlp-2/igt@perf_pmu@frequency@gt0.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@perf_pmu@frequency@gt0.html
    - shard-apl:          [SKIP][313] ([fdo#109271]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-apl7/igt@perf_pmu@frequency@gt0.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl7/igt@perf_pmu@frequency@gt0.html
    - shard-glk:          [SKIP][315] ([fdo#109271]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-glk2/igt@perf_pmu@frequency@gt0.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk5/igt@perf_pmu@frequency@gt0.html
    - shard-snb:          [SKIP][317] ([fdo#109271]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-snb6/igt@perf_pmu@frequency@gt0.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb6/igt@perf_pmu@frequency@gt0.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          [SKIP][319] ([i915#2575]) -> [SKIP][320] ([i915#8411])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][321] ([i915#3555]) -> [SKIP][322] ([i915#7957]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][323] ([i915#2575]) -> [SKIP][324] ([i915#280])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_ctx_sseu@engines.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-dg2:          [SKIP][325] ([i915#2575]) -> [SKIP][326] ([i915#3539] / [i915#4852])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_exec_fair@basic-pace-share.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][327] ([i915#5493]) -> [DMESG-WARN][328] ([i915#4936] / [i915#5493])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          [DMESG-WARN][329] ([i915#4936] / [i915#5493]) -> [TIMEOUT][330] ([i915#5493])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          [SKIP][331] ([i915#4423] / [i915#4565]) -> [SKIP][332] ([i915#4565])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg2:          [SKIP][333] ([i915#2575]) -> [SKIP][334] ([i915#3282]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-snoop.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          [SKIP][335] ([i915#2575] / [i915#5190]) -> [SKIP][336] ([i915#5190])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-dg2:          [SKIP][337] ([i915#2575]) -> [SKIP][338] ([i915#4077])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_tiled_partial_pwrite_pread@reads.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-dg2:          [SKIP][339] ([i915#2575]) -> [SKIP][340] ([i915#2856])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gen9_exec_parse@basic-rejected.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          [SKIP][341] ([i915#2527]) -> [SKIP][342] ([i915#2532])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@gen9_exec_parse@bb-oversize.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          [SKIP][343] ([i915#9641]) -> [SKIP][344] ([fdo#109293] / [fdo#109506])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-snb:          [INCOMPLETE][345] -> [DMESG-WARN][346] ([i915#8841])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          [SKIP][347] ([i915#9531]) -> [SKIP][348] ([i915#1845] / [i915#4098])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][349] ([i915#5286]) -> [SKIP][350] ([i915#4098]) +4 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][351] ([i915#4098]) -> [SKIP][352] ([i915#5286]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2:          [SKIP][353] ([fdo#109315]) -> [SKIP][354] ([fdo#111614])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][355] ([fdo#111614] / [i915#3638]) -> [SKIP][356] ([i915#1845] / [i915#4098]) +4 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          [SKIP][357] ([fdo#109315] / [i915#5190]) -> [SKIP][358] ([i915#5190]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [INCOMPLETE][359] ([i915#9538]) -> [SKIP][360] ([i915#1845] / [i915#4098])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][361] ([fdo#110723]) -> [SKIP][362] ([i915#1845] / [i915#4098]) +3 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-rkl:          [SKIP][363] ([fdo#111615]) -> [SKIP][364] ([i915#1845] / [i915#4098])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][365] ([i915#1845] / [i915#4098]) -> [SKIP][366] ([fdo#110723])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2:          [SKIP][367] ([i915#2575]) -> [SKIP][368] ([i915#7828])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          [SKIP][369] ([i915#7118]) -> [SKIP][370] ([i915#1845] / [i915#4098])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_content_protection@atomic.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          [SKIP][371] ([i915#3116]) -> [SKIP][372] ([i915#1845] / [i915#4098])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          [SKIP][373] ([i915#1845] / [i915#4098]) -> [SKIP][374] ([i915#7118])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_content_protection@type1.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          [SKIP][375] ([i915#2575]) -> [SKIP][376] ([i915#3359])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][377] ([i915#3555]) -> [SKIP][378] ([i915#4098]) +2 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][379] ([i915#3359]) -> [SKIP][380] ([i915#4098]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2:          [SKIP][381] ([i915#2575]) -> [SKIP][382] ([i915#3555])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][383] ([fdo#111767] / [fdo#111825]) -> [SKIP][384] ([i915#1845] / [i915#4098]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][385] ([fdo#111825]) -> [SKIP][386] ([i915#1845] / [i915#4098]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          [SKIP][387] ([i915#4103]) -> [SKIP][388] ([i915#1845] / [i915#4098]) +2 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-rkl:          [SKIP][389] ([i915#1845] / [i915#4098]) -> [SKIP][390] ([fdo#111825]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          [SKIP][391] ([i915#2575]) -> [SKIP][392] ([i915#4103] / [i915#4213])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][393] ([i915#3555] / [i915#3840]) -> [SKIP][394] ([i915#4098])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          [SKIP][395] ([fdo#111825] / [i915#4423]) -> [SKIP][396] ([fdo#111825]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-19/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2:          [SKIP][397] ([fdo#109315]) -> [SKIP][398] ([i915#8708]) +2 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][399] ([i915#1849] / [i915#4098]) -> [SKIP][400] ([i915#3023]) +2 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-dg2:          [SKIP][401] ([fdo#109315]) -> [SKIP][402] ([i915#3458]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][403] ([i915#5439]) -> [SKIP][404] ([i915#1849] / [i915#4098])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2:          [SKIP][405] ([fdo#109315]) -> [SKIP][406] ([i915#5354]) +5 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][407] ([fdo#111825] / [i915#1825]) -> [SKIP][408] ([i915#1849] / [i915#4098]) +44 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-rkl:          [SKIP][409] ([i915#1849] / [i915#4098]) -> [SKIP][410] ([fdo#111825] / [i915#1825]) +11 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-rkl:          [SKIP][411] ([i915#3023]) -> [SKIP][412] ([i915#1849] / [i915#4098]) +30 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [SKIP][413] ([i915#1845] / [i915#4098]) -> [SKIP][414] ([i915#3555] / [i915#8228])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          [SKIP][415] ([i915#3555] / [i915#8228]) -> [SKIP][416] ([i915#1845] / [i915#4098]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_hdr@static-swap.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_hdr@static-swap.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][417] ([i915#4816]) -> [SKIP][418] ([i915#4070] / [i915#4816])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          [SKIP][419] ([i915#2575]) -> [SKIP][420] ([i915#6301])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_panel_fitting@legacy.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-rkl:          [SKIP][421] ([fdo#111825]) -> [SKIP][422] ([fdo#111825] / [i915#8152])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr@psr2_dpms:
    - shard-dg2:          [SKIP][423] ([fdo#109315]) -> [SKIP][424] ([i915#1072])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_psr@psr2_dpms.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_psr@psr2_dpms.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          [SKIP][425] ([i915#2575]) -> [SKIP][426] ([i915#4235])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_rotation_crc@exhaust-fences.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-rkl:          [INCOMPLETE][427] ([i915#9569]) -> [SKIP][428] ([i915#1845] / [i915#4098])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][429] ([i915#5289]) -> [SKIP][430] ([i915#4098]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][431] ([fdo#111615] / [i915#5289]) -> [SKIP][432] ([i915#1845] / [i915#4098])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2:          [SKIP][433] ([i915#2575]) -> [SKIP][434] ([fdo#109309])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_tv_load_detect@load-detect.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          [SKIP][435] ([i915#3555]) -> [SKIP][436] ([i915#1845] / [i915#4098]) +1 other test skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_vrr@flip-basic.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          [SKIP][437] ([i915#1845] / [i915#4098]) -> [SKIP][438] ([i915#3555])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_vrr@flip-suspend.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_vrr@flip-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1339]: https://gitlab.freedesktop.org/drm/intel/issues/1339
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4036]: https://git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/index.html

--===============5265858876390788171==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Correct stride to avoid address range collision</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126059/">https://patchwork.freedesktop.org/series/126059/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13845_full -&gt; IGTPW_10125_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10125_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10125_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/index.html</p>
<h2>Participating hosts (10 -&gt; 11)</h2>
<p>Additional (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10125_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_mmap_offset@close-race:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-snb6/igt@gem_mmap_offset@close-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb4/igt@gem_mmap_offset@close-race.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-7/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10125_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-13/igt@drm_fdinfo@busy-hang@bcs0.html">SKIP</a> ([i915#8414]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@drm_fdinfo@busy@ccs0.html">SKIP</a> ([i915#8414]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> ([i915#7742]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-5/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@drm_read@short-buffer-block.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@drm_read@short-buffer-block.html">SKIP</a> ([i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@gem_caching@read-writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-2/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-10/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> ([i915#9561])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-mtlp-8/igt@gem_eio@suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@gem_eio@suspend.html">ABORT</a> ([i915#9414])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-16/igt@gem_exec_balancer@fairslice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@gem_exec_balancer@fairslice.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://git">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk8/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-7/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> ([i915#4473])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-16/igt@gem_exec_fair@basic-none-vip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html">SKIP</a> ([i915#9591])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#4812]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109313">fdo#109313</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a> / [i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@gem_exec_reloc@basic-cpu-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@gem_exec_reloc@basic-write-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_exec_reloc@basic-write-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#7276])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4537] / [i915#4812])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices@smem:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-mtlp-5/igt@gem_exec_suspend@basic-s3-devices@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-5/igt@gem_exec_suspend@basic-s3-devices@smem.html">FAIL</a> ([i915#5115])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl7/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@gem_lmem_swapping@basic.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk7/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613]) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-3/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-16/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> ([i915#4077]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_mmap_wc@write-gtt-read-wc.html">SKIP</a> ([i915#4083]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read-distinct:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@gem_mmap_wc@write-read-distinct.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@gem_partial_pwrite_pread@reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +5 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@gem_pread@snoop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gem_pxp@create-regular-context-1.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-10/igt@gem_pxp@create-regular-context-1.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +107 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#8428]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> ([i915#768]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-8/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk4/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-5/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-glk3/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk9/igt@gen9_exec_parse@allowed-single.html">INCOMPLETE</a> ([i915#5566])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +4 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-3/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP</a> ([i915#9588])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-8/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@i915_pm_rps@thresholds@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-7/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@kms_async_flips@crc@pipe-d-edp-1.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5190]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> ([i915#4087] / [i915#7213]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-10/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +3 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-2/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-16/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl7/igt@kms_content_protection@uevent@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1339">i915#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">SKIP</a> ([i915#4098]) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb2/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html">DMESG-WARN</a> ([i915#8841]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213] / [i915#5608])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#5354]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_dirtyfb@dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-1/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_flip@dpms-off-confusion-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a> / [i915#4098]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-7/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#5460])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-tglu-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-9/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) +4 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_invalid_mode@bad-htotal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / [i915#9392])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> ([i915#4098] / [i915#8825])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#4098] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html">SKIP</a> ([i915#5176] / [i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> ([i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#4098] / [i915#6953] / [i915#8152]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@kms_properties@crtc-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_properties@crtc-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#658]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@kms_psr@cursor_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#4078])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#5461] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-9/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_rotation_crc@primary-rotation-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@kms_rotation_crc@primary-rotation-90.html">INCOMPLETE</a> ([i915#8875] / [i915#9475] / [i915#9569])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190]) +2 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#5289])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-snb4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk5/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-ctx-handle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@perf@gen12-group-exclusive-stream-ctx-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-ctx-handle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@perf@global-sseu-config.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-17/igt@perf_pmu@frequency@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#6806])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-16/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk2/igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted.html">FAIL</a> ([i915#9583])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl2/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html">FAIL</a> ([i915#9583])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html">FAIL</a> ([i915#9583]) +1 other test fail</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html">FAIL</a> ([i915#9583])</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-single-wait-available-unsubmitted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@syncobj_timeline@invalid-single-wait-available-unsubmitted.html">FAIL</a> ([i915#9582])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-10/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109307">fdo#109307</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-19/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-perfmon-exceed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-7/igt@v3d/v3d_perfmon@create-perfmon-exceed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-pad:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-7/igt@v3d/v3d_submit_cl@bad-pad.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@valid-multisync-submission:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@v3d/v3d_submit_cl@valid-multisync-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@job-perfmon:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@v3d/v3d_submit_csd@job-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_create_bo@create-bo-zeroed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@vc4/vc4_create_bo@create-bo-zeroed.html">SKIP</a> ([i915#7711]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-single-perfmon:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb7/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +47 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-6/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> ([i915#7711]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@used-bo-1ns:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@vc4/vc4_wait_bo@used-bo-1ns.html">SKIP</a> ([i915#7711]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-8/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> ([i915#7711]) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-apl1/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> ([i915#8190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl3/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html">INCOMPLETE</a> ([i915#9364]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_await@wide-contexts:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-7/igt@gem_exec_await@wide-contexts.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_exec_await@wide-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@invalid-fence-array:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_exec_fence@invalid-fence-array.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@gem_exec_fence@invalid-fence-array.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_pwrite@basic-random.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-18/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#4391] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-17/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-rc-ccs-cc}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@dpms-mode-unset-lpsp}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-non-lpsp-stress}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@perf@polling-parameterized.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-2/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-mtlp-2/igt@perf_pmu@frequency@gt0.html">SKIP</a> ([i915#9432]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-mtlp-2/igt@perf_pmu@frequency@gt0.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-apl7/igt@perf_pmu@frequency@gt0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-apl7/igt@perf_pmu@frequency@gt0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-glk2/igt@perf_pmu@frequency@gt0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-glk5/igt@perf_pmu@frequency@gt0.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-snb6/igt@perf_pmu@frequency@gt0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb6/igt@perf_pmu@frequency@gt0.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#7957]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493])</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html">SKIP</a> ([i915#4423] / [i915#4565]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-15/igt@gem_lmem_swapping@verify-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a> / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#5190])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gem_tiled_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@gem_tiled_partial_pwrite_pread@reads.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2532">i915#2532</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([i915#9641]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-snb6/igt@i915_suspend@basic-s3-without-i915.html">DMESG-WARN</a> ([i915#8841])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#4098]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a> ([i915#9538]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg1-19/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> ([i915#5354]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4070] / [i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-5/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> ([i915#9569]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#5289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-dg2-11/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-dg2-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-2/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13845/shard-rkl-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10125/shard-rkl-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============5265858876390788171==--
