Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4034457649739144674=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Date: Wed, 12 Jul 2023 17:50:14 -0000
Message-ID: <168918421448.17979.12547596154941494903@emeril.freedesktop.org>
References: <20230712123313.27999-1-lukasz.laguna@intel.com>
In-Reply-To: <20230712123313.27999-1-lukasz.laguna@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/igt=5Faux=3A_use_proper_di?=
 =?utf-8?q?rectory_for_=22pm=5Fdebug=5Fmessages=22_read?=
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

--===============4034457649739144674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/igt_aux: use proper directory for "pm_debug_messages" read
URL   : https://patchwork.freedesktop.org/series/120610/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7382_full -> IGTPW_9391_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9391_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9391_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9391_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-rkl:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@kms_rotation_crc@multiplane-rotation.html

  
New tests
---------

  New tests have been introduced between IGT_7382_full and IGTPW_9391_full:

### New IGT tests (4) ###

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9391_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][2] ([i915#8411])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][3] ([i915#7456])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8414]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-8/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@drm_fdinfo@most-busy-check-all@vcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8414]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@drm_fdinfo@most-busy-check-all@vcs0.html

  * igt@gem_busy@close-race:
    - shard-glk:          [PASS][6] -> [ABORT][7] ([i915#6016])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-glk6/igt@gem_busy@close-race.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-glk4/igt@gem_busy@close-race.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#7697])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][9] ([i915#7975] / [i915#8213])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-10/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#4771])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-dg2:          [PASS][11] -> [FAIL][12] ([i915#6032])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-6/igt@gem_exec_balancer@full-pulse.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_balancer@hang:
    - shard-mtlp:         [PASS][13] -> [ABORT][14] ([i915#8104])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-3/igt@gem_exec_balancer@hang.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-1/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_capture@pi@ccs0:
    - shard-mtlp:         [PASS][15] -> [FAIL][16] ([i915#7765])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-4/igt@gem_exec_capture@pi@ccs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@gem_exec_capture@pi@ccs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-rkl:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#3539])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#3539] / [i915#4852])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#3281]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#3281]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#3281]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#4812]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         NOTRUN -> [ABORT][27] ([i915#8131])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-mtlp:         [PASS][28] -> [FAIL][29] ([i915#6363]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-4/igt@gem_exec_whisper@basic-normal-all.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@gem_exec_whisper@basic-normal-all.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4860])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#4860])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl4/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4613] / [i915#7582])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][35] -> [TIMEOUT][36] ([i915#5493])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4083]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@gem_mmap@bad-size.html

  * igt@gem_mmap_gtt@basic-small-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4077]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-6/igt@gem_mmap_gtt@basic-small-copy-xy.html

  * igt@gem_mmap_gtt@hang-user:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4077]) +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-5/igt@gem_mmap_gtt@hang-user.html

  * igt@gem_mmap_wc@bad-object:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4083]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@gem_mmap_wc@bad-object.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#3282]) +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3282])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4270])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4270])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#8428])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-5/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4079])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4885])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-10/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4079])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3297]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3297])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][51] ([i915#3318])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl7/igt@gem_userptr_blits@vma-merge.html
    - shard-dg2:          NOTRUN -> [FAIL][52] ([i915#3318])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-10/igt@gem_userptr_blits@vma-merge.html
    - shard-rkl:          NOTRUN -> [FAIL][53] ([i915#3318])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([fdo#109289]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#2856])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#2856]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#2527] / [i915#2856]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-2/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - shard-mtlp:         [PASS][58] -> [FAIL][59] ([i915#8691])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271]) +33 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl4/igt@i915_pm_backlight@fade-with-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#7561])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#5354] / [i915#7561]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-10/igt@i915_pm_backlight@fade-with-suspend.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#3361])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#1937])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#1937])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#1937])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-tglu:         [PASS][67] -> [FAIL][68] ([i915#7940]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-tglu-5/igt@i915_pm_rpm@cursor-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-8/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#1397])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#1397])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([fdo#109293])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [PASS][72] -> [FAIL][73] ([fdo#103375]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-6/igt@i915_pm_rpm@system-suspend-modeset.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][74] -> [INCOMPLETE][75] ([i915#7790])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-snb1/igt@i915_pm_rps@reset.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb6/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [PASS][76] -> [DMESG-FAIL][77] ([i915#5334])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4212])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#8502]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][80] ([i915#8247]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#404])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#5286]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([fdo#111614])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([fdo#111615] / [i915#5286])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([fdo#111614]) +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([fdo#111614])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([fdo#111615]) +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#5190]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4538] / [i915#5190])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][90] ([fdo#111615])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3689] / [i915#3886] / [i915#5354]) +4 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3689] / [i915#5354]) +8 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#3886] / [i915#5354] / [i915#6095])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3734] / [i915#5354] / [i915#6095])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-7/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#5354] / [i915#6095]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#6095]) +15 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#3886] / [i915#6095]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#3886])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl3/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-7/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_mtl_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#5354] / [i915#6095]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-7/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#5354]) +16 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#5354]) +4 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4087] / [i915#7213]) +3 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-c-dp-2:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4087]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@kms_cdclk@plane-scaling@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([fdo#111827]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#7828]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#7828]) +4 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#7828]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#7118])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content_type_change:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#6944])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#7118] / [i915#7162])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [FAIL][112] ([i915#1339])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#3555]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][114] ([fdo#109271]) +3 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-glk8/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][115] ([i915#8841]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb2/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-apl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [fdo#111767]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
    - shard-dg2:          NOTRUN -> [SKIP][117] ([fdo#109274] / [fdo#111767] / [i915#5354]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][118] ([fdo#111767] / [fdo#111825]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#4213]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#3546]) +3 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([fdo#109274] / [i915#5354])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][122] -> [FAIL][123] ([i915#2346])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [PASS][124] -> [FAIL][125] ([i915#2346])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#3555] / [i915#3840])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#3555] / [i915#3840])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-snb:          NOTRUN -> [SKIP][128] ([fdo#109271] / [fdo#111767]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#8381])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([fdo#109274]) +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][131] ([fdo#111825])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#3637])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#2672])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#2672])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#2672]) +4 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][136] -> [FAIL][137] ([i915#6880])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#8708])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([fdo#111825] / [i915#1825]) +4 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#1825]) +16 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([fdo#109280])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#3458]) +6 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#3023]) +6 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#8708]) +5 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#3555] / [i915#8228])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#3555] / [i915#8228])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-6/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#3555] / [i915#8228])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#3582]) +3 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#8821])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#6953])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#5176]) +3 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-a-dp-2.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#5176]) +3 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][153] ([fdo#109271]) +82 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb5/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#5235]) +19 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#5235]) +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_psr@cursor_mmap_cpu:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([fdo#110189]) +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-4/igt@kms_psr@cursor_mmap_cpu.html

  * igt@kms_psr@psr2_dpms:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#1072]) +2 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-6/igt@kms_psr@psr2_dpms.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#4235]) +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#4235] / [i915#5190])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3555]) +2 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#8623])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#4070] / [i915#6768])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-c.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([fdo#109289])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-10/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@ccs3:
    - shard-dg2:          [PASS][164] -> [FAIL][165] ([i915#4349]) +2 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-11/igt@perf_pmu@busy-double-start@ccs3.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@perf_pmu@busy-double-start@ccs3.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#8807])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#3708])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@prime_vgem@fence-flip-hang.html

  * igt@runner@aborted:
    - shard-snb:          NOTRUN -> [FAIL][168] ([i915#7812] / [i915#8848])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb7/igt@runner@aborted.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - shard-mtlp:         [PASS][169] -> [FAIL][170] ([i915#6015]) +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-2/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-mtlp:         [PASS][171] -> [FAIL][172] ([i915#8332])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-2/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@sysfs_heartbeat_interval@precise@vecs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-mtlp:         [PASS][173] -> [TIMEOUT][174] ([i915#6950])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-1/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@sysfs_timeslice_duration@timeout@vecs0.html

  * igt@v3d/v3d_submit_cl@multi-and-single-sync:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([fdo#109315] / [i915#2575]) +1 similar issue
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-6/igt@v3d/v3d_submit_cl@multi-and-single-sync.html

  * igt@v3d/v3d_submit_csd@bad-flag:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#2575]) +4 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@v3d/v3d_submit_csd@bad-flag.html

  * igt@v3d/v3d_submit_csd@bad-multisync-pad:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([fdo#109315]) +1 similar issue
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@v3d/v3d_submit_csd@bad-multisync-pad.html

  * igt@v3d/v3d_wait_bo@used-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#2575]) +5 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@v3d/v3d_wait_bo@used-bo.html

  * igt@vc4/vc4_perfmon@destroy-valid-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7711])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#7711])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html

  * igt@vc4/vc4_purgeable_bo@free-purged-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#7711]) +2 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@vc4/vc4_purgeable_bo@free-purged-bo.html

  
#### Possible fixes ####

  * igt@gem_barrier_race@remote-request@rcs0:
    - shard-glk:          [ABORT][182] ([i915#7461] / [i915#8211]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-glk4/igt@gem_barrier_race@remote-request@rcs0.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-glk9/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
    - shard-mtlp:         [FAIL][184] ([i915#2410]) -> [PASS][185] +2 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [FAIL][186] ([i915#7816]) -> [PASS][187] +2 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_eio@kms:
    - {shard-dg1}:        [FAIL][188] ([i915#5784]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-16/igt@gem_eio@kms.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-rkl:          [FAIL][190] ([i915#2842]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_schedule@deep@vcs1:
    - shard-mtlp:         [FAIL][192] ([i915#8606]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-1/igt@gem_exec_schedule@deep@vcs1.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@gem_exec_schedule@deep@vcs1.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [FAIL][194] ([i915#7327]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-8/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-mtlp:         [FAIL][196] ([i915#6363]) -> [PASS][197] +2 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-1/igt@gem_exec_whisper@basic-queues-all.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-1/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [ABORT][198] ([i915#5566]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl6/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_hangman@gt-engine-error@vcs0:
    - shard-mtlp:         [FAIL][200] ([i915#7069]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-1/igt@i915_hangman@gt-engine-error@vcs0.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@i915_hangman@gt-engine-error@vcs0.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [ABORT][202] ([i915#4528] / [i915#8393]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-snb5/igt@i915_module_load@reload-no-display.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb4/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - {shard-dg1}:        [FAIL][204] ([i915#3591]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][206] ([i915#1397]) -> [PASS][207] +1 similar issue
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-tglu:         [FAIL][208] ([i915#7940]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-tglu-2/igt@i915_pm_rpm@fences-dpms.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-7/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
    - {shard-dg1}:        [INCOMPLETE][210] -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - {shard-dg1}:        [FAIL][212] ([i915#7940]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-15/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][214] ([i915#1397]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - {shard-dg1}:        [SKIP][216] ([i915#1397]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - {shard-dg1}:        [DMESG-WARN][218] ([i915#4391] / [i915#4423]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-16/igt@i915_suspend@basic-s2idle-without-i915.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-14/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         [FAIL][220] ([i915#3743]) -> [PASS][221] +1 similar issue
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_color@ctm-max@pipe-a:
    - shard-mtlp:         [DMESG-WARN][222] ([i915#1982]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-8/igt@kms_color@ctm-max@pipe-a.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@kms_color@ctm-max@pipe-a.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][224] ([i915#2346]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          [FAIL][226] ([i915#6880]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_vblank@pipe-c-query-idle-hang:
    - shard-apl:          [SKIP][228] ([fdo#109271]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-apl1/igt@kms_vblank@pipe-c-query-idle-hang.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl1/igt@kms_vblank@pipe-c-query-idle-hang.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          [FAIL][230] ([i915#7484]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@stress-open-close@0-rcs0:
    - shard-mtlp:         [ABORT][232] ([i915#7941] / [i915#8746]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-4/igt@perf@stress-open-close@0-rcs0.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@perf@stress-open-close@0-rcs0.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-dg2:          [FAIL][234] ([i915#4349]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-11/igt@perf_pmu@busy-double-start@rcs0.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-dg2:          [FAIL][236] ([i915#4521]) -> [PASS][237] +7 similar issues
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-7/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - {shard-dg1}:        [FAIL][238] ([i915#4521]) -> [PASS][239] +2 similar issues
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-15/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-12/igt@perf_pmu@busy-idle-check-all@vecs0.html

  * igt@perf_pmu@busy-no-semaphores@vcs0:
    - shard-snb:          [ABORT][240] -> [PASS][241] +1 similar issue
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-snb7/igt@perf_pmu@busy-no-semaphores@vcs0.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb6/igt@perf_pmu@busy-no-semaphores@vcs0.html

  * {igt@perf_pmu@rc6@runtime-pm-long-gt1}:
    - shard-mtlp:         [SKIP][242] ([i915#8537]) -> [PASS][243] +2 similar issues
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-2/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-1/igt@perf_pmu@rc6@runtime-pm-long-gt1.html

  * igt@perf_pmu@render-node-busy-idle@ccs0:
    - shard-mtlp:         [FAIL][244] ([i915#4349]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle@ccs0.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@perf_pmu@render-node-busy-idle@ccs0.html

  * igt@perf_pmu@render-node-busy-idle@vcs0:
    - {shard-dg1}:        [FAIL][246] ([i915#4349]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-17/igt@perf_pmu@render-node-busy-idle@vcs0.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-12/igt@perf_pmu@render-node-busy-idle@vcs0.html

  
#### Warnings ####

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-mtlp:         [TIMEOUT][248] ([i915#8628]) -> [ABORT][249] ([i915#8131])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-mtlp:         [SKIP][250] ([fdo#109289] / [i915#8403]) -> [SKIP][251] ([fdo#109289])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglu:         [FAIL][252] ([i915#2681] / [i915#3591]) -> [WARN][253] ([i915#2681]) +1 similar issue
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@kms_async_flips@crc@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-FAIL][254] ([i915#8561]) -> [DMESG-FAIL][255] ([i915#1982] / [i915#8561])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-3/igt@kms_async_flips@crc@pipe-a-edp-1.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-5/igt@kms_async_flips@crc@pipe-a-edp-1.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][256] ([i915#3955]) -> [SKIP][257] ([fdo#110189] / [i915#3955])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-rkl-7/igt@kms_fbcon_fbt@psr.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_fbcon_fbt@psr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1339]: https://gitlab.freedesktop.org/drm/intel/issues/1339
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/intel/issues/3582
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6016]: https://gitlab.freedesktop.org/drm/intel/issues/6016
  [i915#6032]: https://gitlab.freedesktop.org/drm/intel/issues/6032
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6363]: https://gitlab.freedesktop.org/drm/intel/issues/6363
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6950]: https://gitlab.freedesktop.org/drm/intel/issues/6950
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7327]: https://gitlab.freedesktop.org/drm/intel/issues/7327
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7765]: https://gitlab.freedesktop.org/drm/intel/issues/7765
  [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
  [i915#7812]: https://gitlab.freedesktop.org/drm/intel/issues/7812
  [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8104]: https://gitlab.freedesktop.org/drm/intel/issues/8104
  [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8332]: https://gitlab.freedesktop.org/drm/intel/issues/8332
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8393]: https://gitlab.freedesktop.org/drm/intel/issues/8393
  [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8537]: https://gitlab.freedesktop.org/drm/intel/issues/8537
  [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
  [i915#8606]: https://gitlab.freedesktop.org/drm/intel/issues/8606
  [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
  [i915#8628]: https://gitlab.freedesktop.org/drm/intel/issues/8628
  [i915#8691]: https://gitlab.freedesktop.org/drm/intel/issues/8691
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8746]: https://gitlab.freedesktop.org/drm/intel/issues/8746
  [i915#8807]: https://gitlab.freedesktop.org/drm/intel/issues/8807
  [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8848]: https://gitlab.freedesktop.org/drm/intel/issues/8848


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7382 -> IGTPW_9391

  CI-20190529: 20190529
  CI_DRM_13375: 003f860e5577c437023b2b7552e3091dc07c8501 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9391: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/index.html
  IGT_7382: 1016723d49ff0ce3326af31468245f7b56930cc4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/index.html

--===============4034457649739144674==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib/igt_aux: use proper directory for &quot;pm_debug_messages&quot; read</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/120610/">https://patchwork.freedesktop.org/series/120610/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7382_full -&gt; IGTPW_9391_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9391_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9391_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9391_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_rotation_crc@multiplane-rotation:<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@kms_rotation_crc@multiplane-rotation.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7382_full and IGTPW_9391_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9391_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-8/igt@drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@drm_fdinfo@most-busy-check-all@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-glk6/igt@gem_busy@close-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-glk4/igt@gem_busy@close-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6016">i915#6016</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-10/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-pulse:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-6/igt@gem_exec_balancer@full-pulse.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@gem_exec_balancer@full-pulse.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6032">i915#6032</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hang:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-3/igt@gem_exec_balancer@hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-1/igt@gem_exec_balancer@hang.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8104">i915#8104</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-4/igt@gem_exec_capture@pi@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@gem_exec_capture@pi@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7765">i915#7765</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@gem_exec_reloc@basic-write-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8131">i915#8131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-4/igt@gem_exec_whisper@basic-normal-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@gem_exec_whisper@basic-normal-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6363">i915#6363</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl4/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7582">i915#7582</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@gem_mmap@bad-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-6/igt@gem_mmap_gtt@basic-small-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-user:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-5/igt@gem_mmap_gtt@hang-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@gem_mmap_wc@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@gem_partial_pwrite_pread@reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@gem_pxp@create-regular-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-5/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-10/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-10/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@gen3_render_tiledy_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-2/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8691">i915#8691</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl4/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +33 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-10/igt@i915_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-tglu-5/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-8/igt@i915_pm_rpm@cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-6/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@i915_pm_rpm@system-suspend-modeset.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-snb1/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb6/igt@i915_pm_rps@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7790">i915#7790</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/404">i915#404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-7/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl3/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-7/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-7/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +16 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@kms_cdclk@plane-scaling@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@kms_content_protection@content_type_change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162">i915#7162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1339">i915#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-glk8/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb2/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>) +1 similar issue</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +6 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3582">i915#3582</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-12/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb5/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +82 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-4/igt@kms_psr@cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-6/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-10/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-11/igt@perf_pmu@busy-double-start@ccs3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@perf_pmu@busy-double-start@ccs3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-7/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8807">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7812">i915#7812</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8848">i915#8848</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-2/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-2/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8332">i915#8332</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-1/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@sysfs_timeslice_duration@timeout@vecs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6950">i915#6950</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@multi-and-single-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-6/igt@v3d/v3d_submit_cl@multi-and-single-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-flag:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@v3d/v3d_submit_csd@bad-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-pad:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@v3d/v3d_submit_csd@bad-multisync-pad.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@used-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@v3d/v3d_wait_bo@used-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-11/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@free-purged-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@vc4/vc4_purgeable_bo@free-purged-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-glk4/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8211">i915#8211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-glk9/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@vebox:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-2/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7816">i915#7816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-16/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-18/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-1/igt@gem_exec_schedule@deep@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8606">i915#8606</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@gem_exec_schedule@deep@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-8/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7327">i915#7327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-1/igt@gem_exec_whisper@basic-queues-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6363">i915#6363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-1/igt@gem_exec_whisper@basic-queues-all.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-apl7/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl6/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-1/igt@i915_hangman@gt-engine-error@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@i915_hangman@gt-engine-error@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-snb5/igt@i915_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8393">i915#8393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb4/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-tglu-2/igt@i915_pm_rpm@fences-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-7/igt@i915_pm_rpm@fences-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-15/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></p>
</li>
<li>
<p>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-16/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-14/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-8/igt@kms_color@ctm-max@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-8/igt@kms_color@ctm-max@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-idle-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-apl1/igt@kms_vblank@pipe-c-query-idle-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-apl1/igt@kms_vblank@pipe-c-query-idle-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7484">i915#7484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-3/igt@perf@non-zero-reason@0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close@0-rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-4/igt@perf@stress-open-close@0-rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7941">i915#7941</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8746">i915#8746</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@perf@stress-open-close@0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-11/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg2-7/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg2-5/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-15/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-12/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-no-semaphores@vcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-snb7/igt@perf_pmu@busy-no-semaphores@vcs0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-snb6/igt@perf_pmu@busy-no-semaphores@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@perf_pmu@rc6@runtime-pm-long-gt1}:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-2/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8537">i915#8537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-1/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-6/igt@perf_pmu@render-node-busy-idle@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-dg1-17/igt@perf_pmu@render-node-busy-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-dg1-12/igt@perf_pmu@render-node-busy-idle@vcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8628">i915#8628</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8131">i915#8131</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8403">i915#8403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-mtlp-3/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8561">i915#8561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-mtlp-5/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8561">i915#8561</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7382/shard-rkl-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7382 -&gt; IGTPW_9391</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13375: 003f860e5577c437023b2b7552e3091dc07c8501 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9391: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9391/index.html<br />
  IGT_7382: 1016723d49ff0ce3326af31468245f7b56930cc4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4034457649739144674==--
