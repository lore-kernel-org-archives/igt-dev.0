Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C34610E7E6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 07:34:56 +0000 (UTC)
Date: Fri, 14 Jul 2023 09:34:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230714073450.nx3u3ht2dw4hjety@kamilkon-desk1>
References: <20230705193454.14033-1-ville.syrjala@linux.intel.com>
 <168859885711.24207.12650319988805573531@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168859885711.24207.12650319988805573531@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=5Fpm=5Frpm=3A_Try_the_standard_=22ddc=22_symlink_for_i2c_r?=
 =?utf-8?q?ead?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2023-07-05 at 23:14:17 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/i915_pm_rpm: Try the standard "ddc" symlink for i2c read
> URL   : https://patchwork.freedesktop.org/series/120250/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7372_full -> IGTPW_9345_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9345_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9345_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9345_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_content_protection@lic:
>     - shard-mtlp:         NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@kms_content_protection@lic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr@psr2_primary_mmap_gtt:
>     - shard-mtlp:         [SKIP][2] ([i915#4077]) -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-4/igt@kms_psr@psr2_primary_mmap_gtt.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@kms_psr@psr2_primary_mmap_gtt.html
> 

It seems unrelated to change, please supress.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9345_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#6230])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-1/igt@api_intel_bb@crc32.html
>     - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#6230])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-2/igt@api_intel_bb@crc32.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#7701])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-1/igt@device_reset@cold-reset-bound.html
> 
>   * igt@drm_fdinfo@busy-idle-check-all@vcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8414]) +9 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@drm_fdinfo@busy-idle-check-all@vcs0.html
> 
>   * igt@drm_fdinfo@isolation@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#8414]) +5 similar issues
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-5/igt@drm_fdinfo@isolation@rcs0.html
> 
>   * igt@drm_fdinfo@virtual-idle:
>     - shard-rkl:          NOTRUN -> [FAIL][9] ([i915#7742])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-4/igt@drm_fdinfo@virtual-idle.html
> 
>   * igt@feature_discovery@display-4x:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#1839])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-6/igt@feature_discovery@display-4x.html
>     - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#1839])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-7/igt@feature_discovery@display-4x.html
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - shard-tglu:         [PASS][12] -> [ABORT][13] ([i915#8234])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-tglu-3/igt@gem_barrier_race@remote-request@rcs0.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-6/igt@gem_barrier_race@remote-request@rcs0.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#7697]) +1 similar issue
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-3/igt@gem_basic@multigpu-create-close.html
>     - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#7697])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-5/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#5325])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#6335])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-mtlp:         [PASS][18] -> [FAIL][19] ([i915#6121] / [i915#7916])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-3/igt@gem_ctx_exec@basic-nohangcheck.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-3/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@engines-hang@vcs0:
>     - shard-mtlp:         [PASS][20] -> [FAIL][21] ([i915#2410])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-2/igt@gem_ctx_persistence@engines-hang@vcs0.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-4/igt@gem_ctx_persistence@engines-hang@vcs0.html
> 
>   * igt@gem_ctx_persistence@engines-hang@vcs1:
>     - shard-mtlp:         [PASS][22] -> [ABORT][23] ([i915#8217])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-2/igt@gem_ctx_persistence@engines-hang@vcs1.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-4/igt@gem_ctx_persistence@engines-hang@vcs1.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#8555])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_persistence@heartbeat-many:
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#8555])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-many.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#280])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@gem_ctx_sseu@engines.html
>     - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#280])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-4/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#280])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@in-flight-contexts-immediate:
>     - shard-mtlp:         [PASS][29] -> [ABORT][30] ([i915#8503])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-3/igt@gem_eio@in-flight-contexts-immediate.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@gem_eio@in-flight-contexts-immediate.html
> 
>   * igt@gem_eio@kms:
>     - shard-dg2:          [PASS][31] -> [INCOMPLETE][32] ([i915#7892])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-1/igt@gem_eio@kms.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-1/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4812]) +2 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4036])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#2842]) +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#2842])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
>     - shard-tglu:         [PASS][39] -> [FAIL][40] ([i915#2842])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-6/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fence@submit67:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4812]) +2 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-3/igt@gem_exec_fence@submit67.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852]) +2 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539]) +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#7697]) +2 similar issues
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@gem_exec_gttfill@multigpu-basic.html
>     - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#7697])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-7/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3281]) +4 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read:
>     - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3281]) +4 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-read.html
>     - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3281]) +6 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html
> 
>   * igt@gem_exec_whisper@basic-contexts-forked-all:
>     - shard-mtlp:         [PASS][49] -> [ABORT][50] ([i915#8131])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-1/igt@gem_exec_whisper@basic-contexts-forked-all.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-forked-all.html
> 
>   * igt@gem_exec_whisper@basic-fds-priority-all:
>     - shard-tglu:         [PASS][51] -> [INCOMPLETE][52] ([i915#6755] / [i915#7392])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-tglu-7/igt@gem_exec_whisper@basic-fds-priority-all.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-2/igt@gem_exec_whisper@basic-fds-priority-all.html
> 
>   * igt@gem_exec_whisper@basic-forked:
>     - shard-mtlp:         [PASS][53] -> [FAIL][54] ([i915#6363])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-7/igt@gem_exec_whisper@basic-forked.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@gem_exec_whisper@basic-forked.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4860])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-y:
>     - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4860])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@gem_fence_thrash@bo-write-verify-y.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#4613])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-apl4/igt@gem_lmem_swapping@basic.html
>     - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#4613])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-glk3/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613]) +1 similar issue
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-6/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@massive-random:
>     - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#4613])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-4/igt@gem_lmem_swapping@massive-random.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4613]) +2 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-3/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][62] ([i915#4936] / [i915#5493])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_mmap@short-mmap:
>     - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4083]) +2 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@gem_mmap@short-mmap.html
> 
>   * igt@gem_mmap_gtt@close-race:
>     - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4077])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-3/igt@gem_mmap_gtt@close-race.html
> 
>   * igt@gem_mmap_wc@fault-concurrent:
>     - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4083]) +1 similar issue
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@gem_mmap_wc@fault-concurrent.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3282]) +3 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_pread@bench:
>     - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3282]) +2 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@gem_pread@bench.html
> 
>   * igt@gem_pxp@create-regular-context-2:
>     - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4270])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-4/igt@gem_pxp@create-regular-context-2.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4270]) +1 similar issue
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html
>     - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4270]) +1 similar issue
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-1/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#4270])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-4/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_readwrite@read-write:
>     - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3282]) +3 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@gem_readwrite@read-write.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#8428]) +5 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-linear:
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#5190]) +8 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-linear.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3297]) +1 similar issue
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@gem_userptr_blits@create-destroy-unsync.html
>     - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#3297]) +2 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-2/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3297])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gem_userptr_blits@vma-merge:
>     - shard-rkl:          NOTRUN -> [FAIL][78] ([i915#3318])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@gem_userptr_blits@vma-merge.html
> 
>   * igt@gen7_exec_parse@basic-rejected:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([fdo#109289]) +2 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-3/igt@gen7_exec_parse@basic-rejected.html
>     - shard-rkl:          NOTRUN -> [SKIP][80] ([fdo#109289]) +3 similar issues
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-7/igt@gen7_exec_parse@basic-rejected.html
> 
>   * igt@gen7_exec_parse@oacontrol-tracking:
>     - shard-tglu:         NOTRUN -> [SKIP][81] ([fdo#109289])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-10/igt@gen7_exec_parse@oacontrol-tracking.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#2527]) +2 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-1/igt@gen9_exec_parse@bb-oversize.html
>     - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#2527] / [i915#2856])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-2/igt@gen9_exec_parse@bb-oversize.html
>     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#2856]) +1 similar issue
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#2856]) +1 similar issue
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-3/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@i915_hangman@engine-engine-hang@vcs0:
>     - shard-mtlp:         [PASS][86] -> [FAIL][87] ([i915#7069])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-4/igt@i915_hangman@engine-engine-hang@vcs0.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@i915_hangman@engine-engine-hang@vcs0.html
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#658])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-3/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@i915_pm_dc@dc5-psr:
>     - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#658]) +2 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-11/igt@i915_pm_dc@dc5-psr.html
> 
>   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>     - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#1937])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-rkl:          [PASS][91] -> [SKIP][92] ([i915#1397])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@i915_pm_rpm@fences-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4077]) +7 similar issues
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-1/igt@i915_pm_rpm@fences-dpms.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-dg2:          [PASS][94] -> [SKIP][95] ([i915#1397]) +3 similar issues
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_rpm@pc8-residency:
>     - shard-mtlp:         NOTRUN -> [SKIP][96] ([fdo#109293])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@i915_pm_rpm@pc8-residency.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-mtlp:         NOTRUN -> [FAIL][97] ([i915#8346])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#6245])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@i915_query@hwconfig_table.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4212])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#4212])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#8502]) +3 similar issues
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-glk:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#1769])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>     - shard-apl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#1769])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-apl2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][104] ([fdo#111614]) +1 similar issue
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#5286]) +2 similar issues
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>     - shard-tglu:         NOTRUN -> [SKIP][106] ([fdo#111615] / [i915#5286])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>     - shard-mtlp:         [PASS][107] -> [FAIL][108] ([i915#5138])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-mtlp:         [PASS][109] -> [FAIL][110] ([i915#3743]) +1 similar issue
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][111] ([fdo#111614])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-6/igt@kms_big_fb@linear-16bpp-rotate-270.html
>     - shard-rkl:          NOTRUN -> [SKIP][112] ([fdo#111614] / [i915#3638])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-7/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][113] ([fdo#111615]) +6 similar issues
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][114] ([fdo#111615])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][115] ([fdo#110723]) +1 similar issue
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4538] / [i915#5190]) +2 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-rkl:          NOTRUN -> [SKIP][117] ([fdo#111615])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#2705])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
>     - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#5354] / [i915#6095]) +5 similar issues
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#3734] / [i915#5354] / [i915#6095]) +2 similar issues
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#3689] / [i915#5354] / [i915#6095]) +4 similar issues
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-10/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#5354] / [i915#6095]) +4 similar issues
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-9/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>     - shard-apl:          NOTRUN -> [SKIP][124] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-apl6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
>     - shard-glk:          NOTRUN -> [SKIP][125] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-glk2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
>     - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#3886] / [i915#6095]) +4 similar issues
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-7/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
>     - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#5354]) +16 similar issues
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-4/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#3689] / [i915#3886] / [i915#5354]) +5 similar issues
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][130] ([fdo#109271]) +38 similar issues
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-glk4/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#6095]) +9 similar issues
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#3689] / [i915#5354]) +9 similar issues
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-12/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#7213]) +3 similar issues
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4087]) +7 similar issues
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-mtlp:         NOTRUN -> [SKIP][135] ([fdo#111827])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-2/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#7828]) +2 similar issues
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>     - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#7828]) +2 similar issues
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_frames@dp-crc-single:
>     - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#7828]) +1 similar issue
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-2/igt@kms_chamelium_frames@dp-crc-single.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#7828]) +4 similar issues
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#3555] / [i915#7118])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#3359])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3555]) +5 similar issues
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#3555]) +6 similar issues
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][144] ([fdo#109274] / [fdo#111767] / [i915#5354]) +1 similar issue
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#3546]) +2 similar issues
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-rkl:          NOTRUN -> [SKIP][146] ([fdo#111767] / [fdo#111825])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([fdo#109274] / [i915#5354]) +5 similar issues
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-12/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#8588])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-3/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#8588])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#3555]) +6 similar issues
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][151] ([fdo#111767] / [i915#3637])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#3637]) +4 similar issues
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#8381])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([fdo#109274]) +3 similar issues
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][155] ([fdo#111825]) +12 similar issues
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@kms_flip@2x-plain-flip.html
>     - shard-tglu:         NOTRUN -> [SKIP][156] ([fdo#109274] / [i915#3637]) +1 similar issue
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-10/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@flip-vs-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#8381])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-6/igt@kms_flip@flip-vs-fences.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-edp1:
>     - shard-mtlp:         [PASS][158] -> [FAIL][159] ([fdo#103375] / [i915#6121]) +3 similar issues
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-2/igt@kms_flip@flip-vs-suspend@b-edp1.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-2/igt@kms_flip@flip-vs-suspend@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#2672]) +3 similar issues
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#2672])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
>     - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#2587] / [i915#2672])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#2672]) +1 similar issue
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#2672] / [i915#3555])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-mtlp:         NOTRUN -> [SKIP][165] ([fdo#109285])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#8708]) +2 similar issues
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
>     - shard-dg2:          [PASS][167] -> [FAIL][168] ([i915#6880])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2:          [PASS][169] -> [FAIL][170] ([fdo#103375] / [i915#6121]) +2 similar issues
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3023]) +9 similar issues
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#8708]) +10 similar issues
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-tglu:         NOTRUN -> [SKIP][173] ([fdo#109280]) +9 similar issues
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#1825]) +18 similar issues
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][175] ([fdo#111825] / [i915#1825]) +17 similar issues
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#5354]) +23 similar issues
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>     - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3458]) +7 similar issues
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>     - shard-tglu:         NOTRUN -> [SKIP][178] ([fdo#110189]) +2 similar issues
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3555] / [i915#6301])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-7/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
>     - shard-mtlp:         NOTRUN -> [SKIP][180] ([fdo#109289])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-2/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-256:
>     - shard-mtlp:         [PASS][181] -> [DMESG-WARN][182] ([i915#1982])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-3/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-256.html
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-256.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#5176]) +11 similar issues
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#5176]) +3 similar issues
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:
>     - shard-snb:          NOTRUN -> [SKIP][185] ([fdo#109271]) +49 similar issues
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-snb4/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#5235]) +1 similar issue
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#5235]) +7 similar issues
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#5235]) +15 similar issues
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#6524])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#658]) +1 similar issue
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-7/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>     - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#2920])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][192] ([fdo#111068] / [i915#658]) +1 similar issue
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
>     - shard-tglu:         NOTRUN -> [SKIP][193] ([fdo#111068] / [i915#658]) +1 similar issue
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#1072]) +4 similar issues
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@kms_psr@dpms.html
> 
>   * igt@kms_psr@psr2_no_drrs:
>     - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#1072]) +1 similar issue
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-4/igt@kms_psr@psr2_no_drrs.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#5461] / [i915#658])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#5461] / [i915#658])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#4235])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#4235])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][200] ([fdo#111615] / [i915#5289])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_vblank@pipe-c-query-forked-busy-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#4070] / [i915#6768]) +2 similar issues
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-1/igt@kms_vblank@pipe-c-query-forked-busy-hang.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#4070] / [i915#533] / [i915#6768]) +3 similar issues
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#2437])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          [PASS][204] -> [FAIL][205] ([i915#7484])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-rkl:          NOTRUN -> [SKIP][206] ([fdo#112283] / [i915#3555])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@perf_pmu@event-wait@rcs0.html
>     - shard-tglu:         NOTRUN -> [SKIP][207] ([fdo#112283] / [i915#3555])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-9/igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][208] ([i915#5493])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3708] / [i915#4077])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#3291] / [i915#3708])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-12/igt@prime_vgem@basic-write.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][211] ([fdo#109295] / [i915#3708])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-1/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@sysfs_timeslice_duration@timeout@vecs0:
>     - shard-mtlp:         [PASS][212] -> [ABORT][213] ([i915#8521])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-6/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-5/igt@sysfs_timeslice_duration@timeout@vecs0.html
> 
>   * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
>     - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#2575]) +6 similar issues
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html
> 
>   * igt@v3d/v3d_perfmon@get-values-valid-perfmon:
>     - shard-tglu:         NOTRUN -> [SKIP][215] ([fdo#109315] / [i915#2575]) +2 similar issues
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-8/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html
> 
>   * igt@v3d/v3d_submit_csd@job-perfmon:
>     - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#2575]) +5 similar issues
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-5/igt@v3d/v3d_submit_csd@job-perfmon.html
>     - shard-rkl:          NOTRUN -> [SKIP][217] ([fdo#109315]) +5 similar issues
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@v3d/v3d_submit_csd@job-perfmon.html
> 
>   * igt@v3d/v3d_submit_csd@multi-and-single-sync:
>     - shard-apl:          NOTRUN -> [SKIP][218] ([fdo#109271]) +42 similar issues
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-apl3/igt@v3d/v3d_submit_csd@multi-and-single-sync.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
>     - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#2575])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-6/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html
> 
>   * igt@vc4/vc4_wait_bo@unused-bo-1ns:
>     - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#7711]) +4 similar issues
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@vc4/vc4_wait_bo@unused-bo-1ns.html
> 
>   * igt@vc4/vc4_wait_bo@used-bo:
>     - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#7711]) +2 similar issues
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@vc4/vc4_wait_bo@used-bo.html
> 
>   * igt@vc4/vc4_wait_bo@used-bo-0ns:
>     - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#7711]) +4 similar issues
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-2/igt@vc4/vc4_wait_bo@used-bo-0ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - shard-rkl:          [ABORT][223] ([i915#7461] / [i915#8211]) -> [PASS][224]
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-rkl-2/igt@gem_barrier_race@remote-request@rcs0.html
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-4/igt@gem_barrier_race@remote-request@rcs0.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [FAIL][225] ([i915#6268]) -> [PASS][226]
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-tglu-5/igt@gem_ctx_exec@basic-nohangcheck.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile@vecs0:
>     - shard-mtlp:         [FAIL][227] ([i915#7816]) -> [PASS][228] +2 similar issues
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
> 
>   * igt@gem_eio@hibernate:
>     - {shard-dg1}:        [ABORT][229] ([i915#4391] / [i915#7975] / [i915#8213]) -> [PASS][230]
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg1-14/igt@gem_eio@hibernate.html
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg1-18/igt@gem_eio@hibernate.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg2:          [FAIL][231] ([i915#5784]) -> [PASS][232]
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-12/igt@gem_eio@reset-stress.html
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-6/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@full-pulse:
>     - shard-dg2:          [FAIL][233] ([i915#6032]) -> [PASS][234]
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-11/igt@gem_exec_balancer@full-pulse.html
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@gem_exec_balancer@full-pulse.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          [FAIL][235] ([i915#2846]) -> [PASS][236]
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-glk2/igt@gem_exec_fair@basic-deadline.html
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-glk3/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-glk:          [FAIL][237] ([i915#2842]) -> [PASS][238]
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html
>     - shard-rkl:          [FAIL][239] ([i915#2842]) -> [PASS][240] +1 similar issue
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_schedule@deep@vecs0:
>     - shard-mtlp:         [FAIL][241] ([i915#8606]) -> [PASS][242]
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-3/igt@gem_exec_schedule@deep@vecs0.html
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@gem_exec_schedule@deep@vecs0.html
> 
>   * igt@gem_exec_whisper@basic-forked-all:
>     - shard-mtlp:         [FAIL][243] ([i915#6363]) -> [PASS][244] +1 similar issue
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-3/igt@gem_exec_whisper@basic-forked-all.html
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@gem_exec_whisper@basic-forked-all.html
> 
>   * igt@gem_flink_race@flink_close:
>     - shard-dg2:          [FAIL][245] ([i915#6121] / [i915#7951]) -> [PASS][246]
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-8/igt@gem_flink_race@flink_close.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-11/igt@gem_flink_race@flink_close.html
>     - {shard-dg1}:        [FAIL][247] ([i915#7951]) -> [PASS][248]
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg1-14/igt@gem_flink_race@flink_close.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg1-12/igt@gem_flink_race@flink_close.html
>     - shard-mtlp:         [FAIL][249] ([i915#7951]) -> [PASS][250]
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-5/igt@gem_flink_race@flink_close.html
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@gem_flink_race@flink_close.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - {shard-dg1}:        [TIMEOUT][251] ([i915#5493]) -> [PASS][252]
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [ABORT][253] ([i915#5566]) -> [PASS][254]
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-glk2/igt@gen9_exec_parse@allowed-single.html
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-glk7/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_hangman@gt-engine-hang@vcs0:
>     - shard-mtlp:         [FAIL][255] ([i915#7069]) -> [PASS][256]
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-7/igt@i915_hangman@gt-engine-hang@vcs0.html
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-5/igt@i915_hangman@gt-engine-hang@vcs0.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-apl:          [SKIP][257] ([fdo#109271]) -> [PASS][258]
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_rc6_residency@rc6-accuracy:
>     - shard-mtlp:         [SKIP][259] ([fdo#109289] / [i915#8403]) -> [PASS][260]
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>     - {shard-dg1}:        [SKIP][261] ([i915#1397]) -> [PASS][262]
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg1-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-dg2:          [SKIP][263] ([i915#1397]) -> [PASS][264]
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp.html
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          [SKIP][265] ([i915#1397]) -> [PASS][266] +1 similar issue
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [INCOMPLETE][267] ([i915#7790]) -> [PASS][268]
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-snb6/igt@i915_pm_rps@reset.html
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-snb4/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_selftest@live@requests:
>     - shard-mtlp:         [DMESG-FAIL][269] ([i915#8497]) -> [PASS][270]
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-1/igt@i915_selftest@live@requests.html
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_selftest@live@slpc:
>     - shard-mtlp:         [DMESG-WARN][271] ([i915#6367]) -> [PASS][272]
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-1/igt@i915_selftest@live@slpc.html
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - shard-mtlp:         [DMESG-FAIL][273] ([i915#6763]) -> [PASS][274]
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-1/igt@i915_selftest@live@workarounds.html
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [FAIL][275] ([i915#5138]) -> [PASS][276] +1 similar issue
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-mtlp:         [FAIL][277] ([i915#3743]) -> [PASS][278]
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-apl:          [FAIL][279] ([i915#2346]) -> [PASS][280] +1 similar issue
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@single-move@all-pipes:
>     - shard-mtlp:         [DMESG-WARN][281] ([i915#2017]) -> [PASS][282]
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-3/igt@kms_cursor_legacy@single-move@all-pipes.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:
>     - shard-mtlp:         [DMESG-WARN][283] ([i915#1982]) -> [PASS][284]
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-1/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-2/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-rkl:          [ABORT][285] ([i915#7461]) -> [PASS][286]
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-rkl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@perf_pmu@busy-idle-check-all@bcs0:
>     - shard-mtlp:         [FAIL][287] ([i915#4521]) -> [PASS][288] +4 similar issues
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@bcs0.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-1/igt@perf_pmu@busy-idle-check-all@bcs0.html
> 
>   * igt@perf_pmu@busy-idle-check-all@vcs0:
>     - shard-dg2:          [FAIL][289] ([i915#4521]) -> [PASS][290] +7 similar issues
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vcs0.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-6/igt@perf_pmu@busy-idle-check-all@vcs0.html
> 
>   * igt@perf_pmu@busy-idle-check-all@vecs0:
>     - {shard-dg1}:        [FAIL][291] ([i915#4521]) -> [PASS][292] +2 similar issues
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vecs0.html
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg1-12/igt@perf_pmu@busy-idle-check-all@vecs0.html
> 
>   * igt@perf_pmu@busy-idle@ccs0:
>     - shard-dg2:          [FAIL][293] ([i915#4349]) -> [PASS][294] +3 similar issues
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-8/igt@perf_pmu@busy-idle@ccs0.html
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@perf_pmu@busy-idle@ccs0.html
>     - shard-mtlp:         [FAIL][295] ([i915#4349]) -> [PASS][296]
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-1/igt@perf_pmu@busy-idle@ccs0.html
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-7/igt@perf_pmu@busy-idle@ccs0.html
> 
>   * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
>     - shard-mtlp:         [FAIL][297] ([i915#6015]) -> [PASS][298] +5 similar issues
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-4/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
> 
>   * igt@sysfs_preempt_timeout@timeout@vecs0:
>     - shard-mtlp:         [ABORT][299] ([i915#8521]) -> [PASS][300]
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-2/igt@sysfs_preempt_timeout@timeout@vecs0.html
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-8/igt@sysfs_preempt_timeout@timeout@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@content_type_change:
>     - shard-dg2:          [SKIP][301] ([i915#3555] / [i915#7118] / [i915#7162]) -> [SKIP][302] ([i915#3555] / [i915#7118])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-dg2-12/igt@kms_content_protection@content_type_change.html
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-dg2-7/igt@kms_content_protection@content_type_change.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-mtlp:         [DMESG-FAIL][303] ([i915#2017] / [i915#5954]) -> [FAIL][304] ([i915#2346])
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-rkl:          [SKIP][305] ([i915#3955]) -> [SKIP][306] ([fdo#110189] / [i915#3955])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-rkl:          [SKIP][307] ([fdo#109285]) -> [SKIP][308] ([fdo#109285] / [i915#4098])
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
>   [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
>   [i915#6032]: https://gitlab.freedesktop.org/drm/intel/issues/6032
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
>   [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
>   [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
>   [i915#6363]: https://gitlab.freedesktop.org/drm/intel/issues/6363
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#6755]: https://gitlab.freedesktop.org/drm/intel/issues/6755
>   [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
>   [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7892]: https://gitlab.freedesktop.org/drm/intel/issues/7892
>   [i915#7916]: https://gitlab.freedesktop.org/drm/intel/issues/7916
>   [i915#7951]: https://gitlab.freedesktop.org/drm/intel/issues/7951
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
>   [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8217]: https://gitlab.freedesktop.org/drm/intel/issues/8217
>   [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8346]: https://gitlab.freedesktop.org/drm/intel/issues/8346
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
>   [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
>   [i915#8503]: https://gitlab.freedesktop.org/drm/intel/issues/8503
>   [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
>   [i915#8537]: https://gitlab.freedesktop.org/drm/intel/issues/8537
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8606]: https://gitlab.freedesktop.org/drm/intel/issues/8606
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7372 -> IGTPW_9345
> 
>   CI-20190529: 20190529
>   CI_DRM_13346: c5442b2363bf5ad916805d105ff03ce5805070e5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9345: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/index.html
>   IGT_7372: c25f0c2ed0d9b44dcd48f4ba93bdc1fc0dfec625 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/index.html
