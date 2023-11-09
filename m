Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6940478740231775040=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Date: Thu, 09 Nov 2023 17:02:36 -0000
Message-ID: <169954935666.26588.10726177385307635754@emeril.freedesktop.org>
References: <20231109065147.9479-1-lukasz.laguna@intel.com>
In-Reply-To: <20231109065147.9479-1-lukasz.laguna@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW5pdGlh?=
 =?utf-8?q?l_SR-IOV_validation_=28rev2=29?=
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

--===============6940478740231775040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial SR-IOV validation (rev2)
URL   : https://patchwork.freedesktop.org/series/126034/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7578_full -> IGTPW_10143_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10143_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10143_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/index.html

Participating hosts (10 -> 10)
------------------------------

  Additional (1): shard-tglu0 
  Missing    (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10143_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion:
    - shard-rkl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@core_getversion.html

  * igt@gem_spin_batch@spin-each:
    - shard-apl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-apl2/igt@gem_spin_batch@spin-each.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl2/igt@gem_spin_batch@spin-each.html

  * {igt@sriov_basic@bind-unbind-vf} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][5] +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@sriov_basic@bind-unbind-vf.html
    - shard-dg1:          NOTRUN -> [SKIP][6] +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@sriov_basic@bind-unbind-vf.html
    - shard-tglu:         NOTRUN -> [SKIP][7] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-5/igt@sriov_basic@bind-unbind-vf.html

  * {igt@sriov_basic@enable-vfs-bind-all-unbind-all} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][8] +4 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@sriov_basic@enable-vfs-bind-all-unbind-all.html

  
#### Warnings ####

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          [SKIP][9] ([i915#6412]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@i915_module_load@resize-bar.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@i915_module_load@resize-bar.html

  
New tests
---------

  New tests have been introduced between IGT_7578_full and IGTPW_10143_full:

### New IGT tests (5) ###

  * igt@sriov_basic@bind-unbind-vf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sriov_basic@enable-vfs-bind-all-unbind-all:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10143_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          [PASS][11] -> [SKIP][12] ([i915#8411]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#6230])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-8/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-rkl:          [PASS][14] -> [FAIL][15] ([i915#4778])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@device_reset@unbind-reset-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@isolation@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#8414]) +17 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-8/igt@drm_fdinfo@isolation@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8414]) +10 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@gem_bad_reloc@negative-reloc-bltcopy:
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#3281]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@gem_bad_reloc@negative-reloc-bltcopy.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#3936])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_busy@semaphore.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - shard-rkl:          [PASS][20] -> [SKIP][21] ([i915#6252])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_ctx_persistence@engines-hang@bcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#8555]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8555]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#5882]) +9 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#280]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#4812]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4036])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#6334]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#6334])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl2/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-rkl:          [PASS][30] -> [SKIP][31] ([i915#9591])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_exec_endless@dispatch@bcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-pace:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4473] / [i915#4771])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-8/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [PASS][33] -> [FAIL][34] ([i915#2842])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4812]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3281])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-16/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [PASS][38] -> [SKIP][39] ([i915#3281]) +13 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3281]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-scanout@bcs0:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3639]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_reloc@basic-scanout@bcs0.html

  * igt@gem_exec_reloc@basic-write-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3281]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@gem_exec_reloc@basic-write-cpu.html

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][43] ([fdo#103375])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][44] ([i915#7975] / [i915#8213])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4860]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_lmem_swapping@verify:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#4613]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk5/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4613])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#4613]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4083]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@basic-small-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4077]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@gem_mmap_gtt@basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4077]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4077]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_offset@ptrace:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([fdo#109315]) +12 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_mmap_offset@ptrace.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4083]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@copy:
    - shard-rkl:          [PASS][55] -> [SKIP][56] ([fdo#109315]) +9 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_mmap_wc@copy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3282]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#3282]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@gem_pread@exhaustion.html

  * igt@gem_pread@self:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#3282]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gem_pread@self.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4270])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4270])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_readwrite@read-write:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3282])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271]) +58 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#8428]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#768]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#8411]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          [PASS][67] -> [SKIP][68] ([i915#3282]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          NOTRUN -> [FAIL][69] ([i915#5889])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4879])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3297]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3297]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-7/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-glk:          NOTRUN -> [FAIL][73] ([i915#3318])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk3/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([fdo#109289]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][75] -> [ABORT][76] ([i915#5566])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-apl4/igt@gen9_exec_parse@allowed-single.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#2856]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#2856]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#2527])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-18/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          [PASS][80] -> [SKIP][81] ([i915#2527]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#2527]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-rkl:          [PASS][83] -> [SKIP][84] ([i915#9588])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@i915_hangman@gt-engine-error@bcs0.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][85] ([i915#9407])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([fdo#109293] / [fdo#109506])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#6621])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#8925])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_rps@thresholds-idle@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3555] / [i915#8925])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@i915_pm_rps@thresholds-idle@gt1.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [PASS][90] -> [SKIP][91] ([i915#4387])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@i915_pm_sseu@full-enable.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          [PASS][92] -> [SKIP][93] ([i915#7984])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@i915_power@sanity.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@i915_power@sanity.html

  * igt@i915_query@query-topology-unsupported:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([fdo#109302])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4212])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#4212])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4212])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-13/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271]) +85 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#1845] / [i915#4098]) +12 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][100] ([i915#8247]) +3 other tests fail
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-18/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#1769] / [i915#3555])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [FAIL][102] ([i915#5138])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#5286])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([fdo#111615] / [i915#5286])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([fdo#111614]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([fdo#111614] / [i915#3638])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([fdo#111614])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-mtlp:         [PASS][108] -> [FAIL][109] ([i915#5138]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         [PASS][110] -> [FAIL][111] ([i915#3743]) +2 other tests fail
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#5190]) +10 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#6187])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([fdo#110723]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([fdo#111615]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([fdo#111615])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-17/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4538] / [i915#5190]) +6 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#2705])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_big_joiner@basic.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-mtlp:         [PASS][119] -> [ABORT][120] ([i915#9414]) +1 other test abort
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4087] / [i915#7213])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#7213]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#4087]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([fdo#111827])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([fdo#111827]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#7828]) +8 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#7828]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-7/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#7828]) +7 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#7828])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color@ctm-0-50@pipe-b:
    - shard-rkl:          [PASS][130] -> [SKIP][131] ([i915#4098]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_color@ctm-0-50@pipe-b.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-b.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][132] ([i915#7173])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#3116])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#3299])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#7118])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#2575]) +6 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-64x64.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#3555])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#3359]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#3359]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#3359])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-rkl:          [PASS][141] -> [SKIP][142] ([i915#1845] / [i915#4098]) +14 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#3546]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([fdo#109274] / [i915#5354]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][145] -> [FAIL][146] ([i915#2346])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          [PASS][147] -> [FAIL][148] ([i915#2346])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-mtlp:         [PASS][149] -> [DMESG-WARN][150] ([i915#2017])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-7/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#4213])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4103] / [i915#4213]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#3555]) +8 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#4098]) +13 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#8812])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#3469]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([fdo#109274]) +6 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([fdo#111767] / [fdo#111825]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([fdo#111825]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([fdo#109274] / [fdo#111767])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([fdo#109274] / [fdo#111767] / [i915#3637])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-snb:          NOTRUN -> [SKIP][162] ([fdo#109271]) +10 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-snb5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3637] / [i915#4098]) +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#8381])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#3555] / [i915#8810])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#2672]) +6 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#2672]) +5 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#2672]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [PASS][169] -> [FAIL][170] ([i915#6880])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [PASS][171] -> [SKIP][172] ([i915#1849] / [i915#4098]) +10 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([fdo#111825]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#5354]) +29 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([fdo#111825] / [i915#1825]) +11 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#1849] / [i915#4098]) +7 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([fdo#110189]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#8708]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3458]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3023]) +6 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#3458]) +17 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([fdo#109280])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#1825]) +7 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#8708]) +26 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_getfb@getfb-addfb-different-handles:
    - shard-rkl:          [PASS][185] -> [SKIP][186] ([i915#2575]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_getfb@getfb-addfb-different-handles.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_getfb@getfb-addfb-different-handles.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#6118])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#3555] / [i915#8228])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-17/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#3555] / [i915#8228]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-htotal:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#3555] / [i915#4098]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#9457]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#1839])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([fdo#109289]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [INCOMPLETE][194] ([i915#9392])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html

  * igt@kms_plane@pixel-format:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#4098] / [i915#8825]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane@pixel-format.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#3555] / [i915#8821])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#8806])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#3555] / [i915#8806])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][199] ([i915#8292])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
    - shard-tglu:         [PASS][200] -> [FAIL][201] ([i915#8292])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#5176] / [i915#9423]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#5235]) +15 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#6953] / [i915#8152])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#5235]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#8152])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#5235]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#4098] / [i915#6953] / [i915#8152])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#5235]) +6 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#3555] / [i915#5235])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#6524] / [i915#6805])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-glk:          NOTRUN -> [SKIP][213] ([fdo#109271] / [i915#658])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk9/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#658])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#658]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][216] ([fdo#109271] / [i915#658])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([fdo#111068] / [i915#658])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#1072]) +7 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr@sprite_mmap_gtt:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#1072]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_psr@sprite_mmap_gtt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#4235]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#4235] / [i915#5190])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#3555]) +8 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#3555] / [i915#4098]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#8623])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([fdo#109309])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-tglu:         [PASS][226] -> [FAIL][227] ([i915#9196]) +2 other tests fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][228] ([i915#8841]) +5 other tests dmesg-warn
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-snb5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#2437])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_writeback@writeback-fb-id.html
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#2437])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][231] ([fdo#109271] / [i915#2437])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl2/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#2437])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#2434])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@perf@mi-rpc.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][234] ([i915#7484])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([fdo#109289]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [PASS][236] -> [FAIL][237] ([i915#4349])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-idle:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#5608])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@perf_pmu@busy-idle.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-dg1:          [PASS][239] -> [FAIL][240] ([i915#4349]) +1 other test fail
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#8850])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][242] ([i915#6806])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#5608] / [i915#8516])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#8516])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#3708] / [i915#4077])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          [PASS][246] -> [SKIP][247] ([fdo#109295] / [i915#3291] / [i915#3708])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@prime_vgem@basic-read.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([fdo#109295] / [i915#3708])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@prime_vgem@fence-write-hang.html

  * igt@runner@aborted:
    - shard-snb:          NOTRUN -> [FAIL][249] ([i915#7812])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-snb2/igt@runner@aborted.html

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted:
    - shard-dg2:          NOTRUN -> [FAIL][250] ([i915#9583]) +1 other test fail
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted.html

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:
    - shard-rkl:          NOTRUN -> [FAIL][251] ([i915#9583])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html

  * igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted:
    - shard-mtlp:         NOTRUN -> [FAIL][252] ([i915#9582])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted.html
    - shard-glk:          NOTRUN -> [FAIL][253] ([i915#9582])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk2/igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted.html
    - shard-dg2:          NOTRUN -> [FAIL][254] ([i915#9582])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted.html

  * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([fdo#109315] / [i915#2575]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-9/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html

  * igt@v3d/v3d_wait_bo@bad-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#2575]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@v3d/v3d_wait_bo@bad-bo.html

  * igt@v3d/v3d_wait_bo@used-bo-1ns:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#2575]) +10 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@v3d/v3d_wait_bo@used-bo-1ns.html

  * igt@vc4/vc4_label_bo@set-bad-name:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#7711])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-15/igt@vc4/vc4_label_bo@set-bad-name.html

  * igt@vc4/vc4_perfmon@create-perfmon-exceed:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#7711]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@vc4/vc4_perfmon@create-perfmon-exceed.html

  * igt@vc4/vc4_tiling@get-bad-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#7711]) +9 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@vc4/vc4_tiling@get-bad-modifier.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#7711]) +4 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - shard-rkl:          [FAIL][262] ([i915#7742]) -> [PASS][263] +1 other test pass
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html

  * igt@fbdev@nullptr:
    - shard-rkl:          [SKIP][264] ([i915#2582]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@fbdev@nullptr.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@fbdev@nullptr.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          [SKIP][266] ([i915#3281]) -> [PASS][267] +3 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [FAIL][268] ([i915#6268]) -> [PASS][269]
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-dg2:          [INCOMPLETE][270] ([i915#9162]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg2-1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [ABORT][272] ([i915#7892] / [i915#9414]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-8/igt@gem_eio@in-flight-suspend.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][274] ([i915#5784]) -> [PASS][275] +1 other test pass
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-16/igt@gem_eio@unwedge-stress.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_eio@wait-immediate:
    - shard-mtlp:         [ABORT][276] ([i915#9414]) -> [PASS][277] +1 other test pass
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-7/igt@gem_eio@wait-immediate.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@gem_eio@wait-immediate.html

  * igt@gem_exec_balancer@fairslice:
    - shard-rkl:          [SKIP][278] ([Intel XE#874]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_exec_balancer@fairslice.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-rkl:          [FAIL][280] ([i915#2842]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@gem_exec_fair@basic-none@vecs0.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-rkl:          [SKIP][282] ([fdo#109313]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [DMESG-WARN][284] ([i915#4936] / [i915#5493]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-rkl:          [SKIP][286] ([i915#1850]) -> [PASS][287]
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          [SKIP][288] ([i915#3282]) -> [PASS][289] +7 other tests pass
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_partial_pwrite_pread@reads.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_partial_pwrite_pread@reads.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          [SKIP][290] ([i915#2527]) -> [PASS][291] +2 other tests pass
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gen9_exec_parse@bb-start-far.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][292] ([i915#9559]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          [FAIL][294] ([i915#3591]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][296] ([i915#5138]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [FAIL][298] ([i915#3743]) -> [PASS][299] +1 other test pass
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-10/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * {igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs}:
    - shard-rkl:          [SKIP][300] ([i915#4098]) -> [PASS][301] +15 other tests pass
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][302] ([i915#72]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-glk2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-glk:          [INCOMPLETE][304] -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-glk5/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk5/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][306] ([i915#1845] / [i915#4098]) -> [PASS][307] +20 other tests pass
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][308] ([i915#2346]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [FAIL][310] ([i915#2346]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-modeset-vs-hang@a-edp1:
    - shard-mtlp:         [INCOMPLETE][312] -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-4/igt@kms_flip@flip-vs-modeset-vs-hang@a-edp1.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@kms_flip@flip-vs-modeset-vs-hang@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-rkl:          [SKIP][314] ([i915#1849] / [i915#4098]) -> [PASS][315] +10 other tests pass
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - shard-apl:          [INCOMPLETE][316] ([i915#9392]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  * {igt@kms_pm_dc@dc6-dpms}:
    - shard-tglu:         [FAIL][318] ([i915#9295]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html

  * {igt@kms_pm_rpm@dpms-mode-unset-non-lpsp}:
    - shard-dg1:          [SKIP][320] ([i915#9519]) -> [PASS][321] +1 other test pass
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-19/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * {igt@kms_pm_rpm@modeset-non-lpsp}:
    - shard-rkl:          [SKIP][322] ([i915#9519]) -> [PASS][323] +2 other tests pass
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * {igt@kms_pm_rpm@pm-tiling}:
    - shard-rkl:          [SKIP][324] ([fdo#109308]) -> [PASS][325] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_pm_rpm@pm-tiling.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_pm_rpm@pm-tiling.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][326] ([IGT#2]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg2-6/igt@kms_sysfs_edid_timing.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:
    - shard-rkl:          [FAIL][328] ([i915#9196]) -> [PASS][329] +1 other test pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:
    - shard-snb:          [FAIL][330] ([i915#9196]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html

  * igt@perf@gen12-group-exclusive-stream-sample-oa:
    - shard-rkl:          [SKIP][332] ([fdo#109289]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-sample-oa.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@perf@gen12-group-exclusive-stream-sample-oa.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][334] ([i915#2436]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [FAIL][336] ([i915#4349]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-rkl:          [SKIP][338] ([fdo#109295] / [i915#3708] / [i915#4098]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@prime_vgem@basic-fence-flip.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][340] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@prime_vgem@basic-write.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          [SKIP][342] ([fdo#109295] / [fdo#111656] / [i915#3708]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@prime_vgem@coherency-gtt.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@prime_vgem@coherency-gtt.html

  
#### Warnings ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          [SKIP][344] ([i915#6230]) -> [SKIP][345] ([fdo#109315])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@api_intel_bb@crc32.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          [INCOMPLETE][346] ([i915#9408]) -> [ABORT][347] ([i915#9618])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-15/igt@device_reset@unbind-reset-rebind.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][348] ([i915#7957]) -> [SKIP][349] ([i915#3555])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          [SKIP][350] ([i915#3555]) -> [SKIP][351] ([i915#7957])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          [SKIP][352] ([i915#7957]) -> [SKIP][353] ([i915#4098] / [i915#9323])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          [SKIP][354] ([i915#4525]) -> [SKIP][355] ([fdo#109315])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [FAIL][356] ([i915#2842]) -> [SKIP][357] ([i915#9591])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-rkl:          [SKIP][358] ([i915#7697]) -> [SKIP][359] ([fdo#109315])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_exec_gttfill@multigpu-basic.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-rkl:          [SKIP][360] ([i915#3281]) -> [SKIP][361] ([fdo#109315])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-noreloc.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_pread@exhaustion:
    - shard-rkl:          [SKIP][362] ([i915#3282]) -> [WARN][363] ([i915#2658]) +1 other test warn
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_pread@exhaustion.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-rkl:          [SKIP][364] ([i915#3282]) -> [SKIP][365] ([fdo#109315])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_pread@snoop.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_pread@snoop.html

  * igt@kms_async_flips@crc@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][366] ([i915#8247]) -> [DMESG-FAIL][367] ([i915#8561]) +2 other tests dmesg-fail
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-3/igt@kms_async_flips@crc@pipe-b-edp-1.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@kms_async_flips@crc@pipe-b-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][368] ([i915#1845] / [i915#4098]) -> [SKIP][369] ([i915#1769] / [i915#3555])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][370] ([i915#1845] / [i915#4098]) -> [SKIP][371] ([i915#5286]) +7 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][372] ([i915#5286]) -> [SKIP][373] ([i915#1845] / [i915#4098]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][374] ([i915#5286]) -> [SKIP][375] ([fdo#109315]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][376] ([fdo#111614] / [i915#3638]) -> [SKIP][377] ([i915#1845] / [i915#4098]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][378] ([i915#1845] / [i915#4098]) -> [SKIP][379] ([fdo#111614] / [i915#3638]) +2 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          [SKIP][380] ([i915#1845] / [i915#4098]) -> [SKIP][381] ([fdo#110723]) +4 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][382] ([fdo#110723]) -> [SKIP][383] ([i915#1845] / [i915#4098]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-rkl:          [SKIP][384] ([fdo#111615]) -> [SKIP][385] ([i915#1845] / [i915#4098])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][386] ([fdo#110723]) -> [SKIP][387] ([fdo#109315])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-rkl:          [SKIP][388] ([fdo#111827]) -> [SKIP][389] ([i915#2575])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_chamelium_color@ctm-red-to-blue.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          [SKIP][390] ([i915#7828]) -> [SKIP][391] ([i915#2575]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_color@deep-color:
    - shard-rkl:          [SKIP][392] ([i915#9608]) -> [SKIP][393] ([i915#3555])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_color@deep-color.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-2/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          [SKIP][394] ([i915#7118]) -> [SKIP][395] ([i915#1845] / [i915#4098]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_content_protection@atomic.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][396] ([i915#1845] / [i915#4098]) -> [SKIP][397] ([i915#7118]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_content_protection@srm.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][398] ([i915#1845] / [i915#4098]) -> [SKIP][399] ([fdo#109279] / [i915#3359])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          [SKIP][400] ([i915#3359]) -> [SKIP][401] ([i915#1845] / [i915#4098]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][402] ([i915#3555]) -> [SKIP][403] ([i915#1845] / [i915#4098]) +3 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][404] ([i915#1845] / [i915#4098]) -> [SKIP][405] ([i915#3555]) +7 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-rkl:          [SKIP][406] ([fdo#111825]) -> [SKIP][407] ([i915#1845] / [i915#4098]) +3 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][408] ([i915#1845] / [i915#4098]) -> [SKIP][409] ([fdo#111825]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-rkl:          [SKIP][410] ([fdo#111767] / [fdo#111825]) -> [SKIP][411] ([i915#1845] / [i915#4098])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          [SKIP][412] ([i915#1845] / [i915#4098]) -> [SKIP][413] ([i915#4103])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][414] ([i915#3555] / [i915#3840]) -> [SKIP][415] ([i915#4098])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_dsc@dsc-basic.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][416] ([i915#3555] / [i915#3840]) -> [SKIP][417] ([i915#1845] / [i915#4098])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_dsc@dsc-with-bpc.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][418] ([i915#4098]) -> [SKIP][419] ([i915#3555] / [i915#3840])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][420] ([i915#3955]) -> [SKIP][421] ([fdo#110189] / [i915#3955])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-rkl:          [SKIP][422] ([fdo#111825]) -> [SKIP][423] ([i915#2575])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][424] ([fdo#109285]) -> [SKIP][425] ([fdo#109285] / [i915#4098])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][426] ([fdo#111825]) -> [SKIP][427] ([i915#1849] / [i915#4098])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          [SKIP][428] ([i915#3023]) -> [SKIP][429] ([fdo#109315])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][430] ([i915#1849] / [i915#4098]) -> [SKIP][431] ([fdo#111825])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][432] ([fdo#111825] / [i915#1825]) -> [SKIP][433] ([i915#1849] / [i915#4098]) +35 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][434] ([i915#1849] / [i915#4098]) -> [SKIP][435] ([fdo#111825] / [i915#1825]) +39 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-rkl:          [SKIP][436] ([fdo#111825] / [i915#1825]) -> [SKIP][437] ([fdo#109315]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-rkl:          [SKIP][438] ([i915#3023]) -> [SKIP][439] ([i915#1849] / [i915#4098]) +15 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][440] ([i915#5439]) -> [SKIP][441] ([i915#1849] / [i915#4098])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-rkl:          [SKIP][442] ([i915#1849] / [i915#4098]) -> [SKIP][443] ([fdo#109315])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          [SKIP][444] ([i915#1849] / [i915#4098]) -> [SKIP][445] ([i915#3023]) +22 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-suspend.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          [SKIP][446] ([i915#1845] / [i915#4098]) -> [SKIP][447] ([i915#3555] / [i915#8228]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_hdr@static-swap.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_hdr@static-swap.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][448] ([i915#1845] / [i915#4098]) -> [SKIP][449] ([i915#6301])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][450] ([i915#6301]) -> [SKIP][451] ([i915#1845] / [i915#4098])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_panel_fitting@legacy.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@overlay:
    - shard-rkl:          [SKIP][452] ([i915#1845] / [i915#4098]) -> [SKIP][453] ([i915#2575]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_plane_cursor@overlay.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-rkl:          [SKIP][454] ([fdo#111825]) -> [SKIP][455] ([fdo#111825] / [i915#8152])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr@no_drrs:
    - shard-rkl:          [SKIP][456] ([i915#1072]) -> [SKIP][457] ([fdo#109315]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_psr@no_drrs.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_psr@no_drrs.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          [SKIP][458] ([i915#5289]) -> [SKIP][459] ([i915#1845] / [i915#4098])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-rkl:          [SKIP][460] ([i915#1845] / [i915#4098]) -> [INCOMPLETE][461] ([i915#8875] / [i915#9569])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          [SKIP][462] ([fdo#111615] / [i915#5289]) -> [SKIP][463] ([i915#1845] / [i915#4098])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@prime_mmap@test_aperture_limit@test_ape

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/index.html

--===============6940478740231775040==
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
<tr><td><b>Series:</b></td><td>Initial SR-IOV validation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126034/">https://patchwork.freedesktop.org/series/126034/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7578_full -&gt; IGTPW_10143_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10143_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10143_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>Additional (1): shard-tglu0 <br />
  Missing    (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10143_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@core_getversion.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-each:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-apl2/igt@gem_spin_batch@spin-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl2/igt@gem_spin_batch@spin-each.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@sriov_basic@bind-unbind-vf} (NEW):</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> +4 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> +4 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-5/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@sriov_basic@enable-vfs-bind-all-unbind-all} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@sriov_basic@enable-vfs-bind-all-unbind-all.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@resize-bar:<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@i915_module_load@resize-bar.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7578_full and IGTPW_10143_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-all-unbind-all:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10143_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-8/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html">FAIL</a> ([i915#4778])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-8/igt@drm_fdinfo@isolation@rcs0.html">SKIP</a> ([i915#8414]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> ([i915#8414]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-bltcopy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_ctx_persistence@engines-hang@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html">SKIP</a> ([i915#6252])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-7/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html">SKIP</a> ([i915#5882]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl2/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([fdo#109271] / [i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html">SKIP</a> ([i915#9591])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-8/igt@gem_exec_fair@basic-pace.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@gem_exec_fence@concurrent.html">SKIP</a> ([i915#4812]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-16/igt@gem_exec_reloc@basic-cpu-read.html">SKIP</a> ([i915#3281])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> ([i915#3281]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_reloc@basic-scanout@bcs0.html">SKIP</a> ([i915#3639]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@gem_exec_reloc@basic-write-cpu.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html">FAIL</a> ([fdo#103375])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk5/igt@gem_lmem_swapping@verify.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@gem_mmap@bad-offset.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@gem_mmap_gtt@basic-small-copy-xy.html">SKIP</a> ([i915#4077]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> ([i915#4077]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@ptrace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_mmap_offset@ptrace.html">SKIP</a> ([fdo#109315]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_mmap_wc@copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_mmap_wc@copy.html">SKIP</a> ([fdo#109315]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@gem_pread@exhaustion.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@self:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gem_pread@self.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@gem_readwrite@read-write.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([fdo#109271]) +58 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#8428]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_spin_batch@spin-all-new.html">FAIL</a> ([i915#5889])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-7/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk3/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@gen3_render_tiledy_blits.html">SKIP</a> ([fdo#109289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-apl4/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl7/igt@gen9_exec_parse@allowed-single.html">ABORT</a> ([i915#5566])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-18/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP</a> ([i915#9588])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> ([i915#9407])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@i915_pm_rps@thresholds-idle@gt1.html">SKIP</a> ([i915#3555] / [i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-13/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271]) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_async_flips@crc.html">SKIP</a> ([i915#1845] / [i915#4098]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-18/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#111615] / [i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> ([i915#3743]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> ([fdo#110723]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#111615]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-17/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html">ABORT</a> ([i915#9414]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#4087] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> ([fdo#111827]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +8 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-7/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_color@ctm-0-50@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-b.html">SKIP</a> ([i915#4098]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-64x64.html">SKIP</a> ([i915#2575]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> ([i915#1845] / [i915#4098]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([i915#3546]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [i915#5354]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-7/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> ([i915#2017])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> ([i915#3555]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#4098]) +13 other tests skip</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([fdo#111767] / [fdo#111825]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#111825]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-snb5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> ([fdo#109271]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> ([i915#3637] / [i915#4098]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#111825]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#111825] / [i915#1825]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> ([i915#1849] / [i915#4098]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">SKIP</a> ([fdo#110189]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([i915#3458]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#3023]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> ([i915#3458]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> ([fdo#109280])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([i915#1825]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-addfb-different-handles:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_getfb@getfb-addfb-different-handles.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_getfb@getfb-addfb-different-handles.html">SKIP</a> ([i915#2575]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-17/igt@kms_hdr@invalid-hdr.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_invalid_mode@bad-htotal.html">SKIP</a> ([i915#3555] / [i915#4098]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> ([i915#9457]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> ([fdo#109289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">INCOMPLETE</a> ([i915#9392])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane@pixel-format.html">SKIP</a> ([i915#4098] / [i915#8825]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> ([i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-dp-4.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html">SKIP</a> ([i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([i915#4098] / [i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1.html">SKIP</a> ([i915#5235]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1.html">SKIP</a> ([i915#3555] / [i915#5235])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk9/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#658]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> ([i915#1072]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_mmap_gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_psr@sprite_mmap_gtt.html">SKIP</a> ([i915#1072]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> ([i915#4235]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> ([i915#3555]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#9196]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-snb5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1.html">DMESG-WARN</a> ([i915#8841]) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> ([i915#7484])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([fdo#109289]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> ([i915#4349])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@perf_pmu@busy-idle.html">SKIP</a> ([i915#5608])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> ([i915#4349]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#6806])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#5608] / [i915#8516])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@prime_vgem@basic-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@prime_vgem@basic-read.html">SKIP</a> ([fdo#109295] / [i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-snb2/igt@runner@aborted.html">FAIL</a> ([i915#7812])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-1/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted.html">FAIL</a> ([i915#9583]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html">FAIL</a> ([i915#9583])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-1/igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted.html">FAIL</a> ([i915#9582])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk2/igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted.html">FAIL</a> ([i915#9582])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted.html">FAIL</a> ([i915#9582])</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-perfmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-9/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html">SKIP</a> ([fdo#109315] / [i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@bad-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@v3d/v3d_wait_bo@bad-bo.html">SKIP</a> ([i915#2575]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@used-bo-1ns:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@v3d/v3d_wait_bo@used-bo-1ns.html">SKIP</a> ([i915#2575]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-bad-name:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-15/igt@vc4/vc4_label_bo@set-bad-name.html">SKIP</a> ([i915#7711])</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-perfmon-exceed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@vc4/vc4_perfmon@create-perfmon-exceed.html">SKIP</a> ([i915#7711]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-2/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> ([i915#7711]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> ([i915#7711]) +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@fbdev@nullptr.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg2-1/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCOMPLETE</a> ([i915#9162]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-6/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-8/igt@gem_eio@in-flight-suspend.html">ABORT</a> ([i915#7892] / [i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-16/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-18/igt@gem_eio@unwedge-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-immediate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-7/igt@gem_eio@wait-immediate.html">ABORT</a> ([i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-3/igt@gem_eio@wait-immediate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_exec_balancer@fairslice.html">SKIP</a> ([Intel XE#874]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gem_exec_balancer@fairslice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> ([i915#1850]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@gem_mmap_wc@set-cache-level.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_partial_pwrite_pread@reads.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2527]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#9559]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-10/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-glk2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">FAIL</a> ([i915#72]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-glk5/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk5/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-4/igt@kms_flip@flip-vs-modeset-vs-hang@a-edp1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@kms_flip@flip-vs-modeset-vs-hang@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">INCOMPLETE</a> ([i915#9392]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc6-dpms}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@dpms-mode-unset-non-lpsp}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-19/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-non-lpsp}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@pm-tiling}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_pm_rpm@pm-tiling.html">SKIP</a> ([fdo#109308]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_pm_rpm@pm-tiling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg2-6/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg2-11/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-sample-oa.html">SKIP</a> ([fdo#109289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@perf@gen12-group-exclusive-stream-sample-oa.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-5/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@prime_vgem@basic-fence-flip.html">SKIP</a> ([fdo#109295] / [i915#3708] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@prime_vgem@basic-fence-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@prime_vgem@basic-write.html">SKIP</a> ([fdo#109295] / [i915#3291] / [i915#3708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@prime_vgem@basic-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#109295] / [fdo#111656] / [i915#3708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@prime_vgem@coherency-gtt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@api_intel_bb@crc32.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-dg1-15/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#9408]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#9618])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#7957]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#7957])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#7957]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#4098] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> ([i915#4525]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html">SKIP</a> ([i915#9591])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-noreloc.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-noreloc.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_pread@exhaustion.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@gem_pread@snoop.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-mtlp-3/igt@kms_async_flips@crc@pipe-b-edp-1.html">FAIL</a> ([i915#8247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-mtlp-2/igt@kms_async_flips@crc@pipe-b-edp-1.html">DMESG-FAIL</a> ([i915#8561]) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#5286]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#1845] / [i915#4098]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#109315]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> ([fdo#110723]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#110723]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([fdo#111615]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#110723]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_color@deep-color.html">SKIP</a> ([i915#9608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-2/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_content_protection@srm.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#1845] / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> ([fdo#111825]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#111767] / [fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([fdo#110189] / [i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> ([fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([i915#3023]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#111825])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825] / [i915#1825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> ([fdo#111825] / [i915#1825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> ([fdo#109315]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> ([i915#3023]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#1849] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> ([i915#3023]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-1/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_plane_cursor@overlay.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_cursor@overlay.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#111825] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-1/igt@kms_psr@no_drrs.html">SKIP</a> ([i915#1072]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_psr@no_drrs.html">SKIP</a> ([fdo#109315]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> ([i915#5289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">INCOMPLETE</a> ([i915#8875] / [i915#9569])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([fdo#111615] / [i915#5289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10143/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_ape</p>
</li>
</ul>

</body>
</html>

--===============6940478740231775040==--
