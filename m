Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD2B6E23D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2020 10:21:31 +0000 (UTC)
Message-ID: <85f19da47ee15a30f88dd08d4a9b870c7de7fcf4.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 02 Mar 2020 11:21:27 +0100
In-Reply-To: <158301305998.19636.13646736187771088706@emeril.freedesktop.org>
References: <20200228084636.30045-1-janusz.krzysztofik@linux.intel.com>
 <158301305998.19636.13646736187771088706@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Enhance_invalid_mapping_exercise_=28re?=
 =?utf-8?b?djQp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

On Sat, 2020-02-29 at 21:50 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_userptr_blits: Enhance invalid mapping exercise (rev4)
> URL   : https://patchwork.freedesktop.org/series/72411/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8025_full -> IGTPW_4236_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4236_full absolutely need to be
>   verified manually.
> 
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4236_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/index.html

For your convenience, I'm using the following link to see relevant 
results:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shards-all.html?testfilter=gem_userptr_blits@invalid

> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4236_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@gem_userptr_blits@invalid-mmap-offset-sync@gtt} (NEW):
>     - shard-hsw:          NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-hsw4/igt@gem_userptr_blits@invalid-mmap-offset-sync@gtt.html

Is that lockdep report sufficient for what you expected from 
userptr(mmap-offset) exercise?  Or should we still try to find out how 
to anger lockdep on platforms other than hsw and snb?

>   * {igt@gem_userptr_blits@invalid-mmap-offset-sync@uc} (NEW):
>     - shard-apl:          NOTRUN -> [WARN][2] +3 similar issues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-apl7/igt@gem_userptr_blits@invalid-mmap-offset-sync@uc.html
>     - shard-glk:          NOTRUN -> [WARN][3] +3 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-glk4/igt@gem_userptr_blits@invalid-mmap-offset-sync@uc.html
>     - shard-iclb:         NOTRUN -> [WARN][4] +3 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb5/igt@gem_userptr_blits@invalid-mmap-offset-sync@uc.html
> 
>   * {igt@gem_userptr_blits@invalid-mmap-offset-sync@wb} (NEW):
>     - shard-snb:          NOTRUN -> [WARN][5] +2 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-snb6/igt@gem_userptr_blits@invalid-mmap-offset-sync@wb.html
>     - shard-tglb:         NOTRUN -> [WARN][6] +3 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-tglb3/igt@gem_userptr_blits@invalid-mmap-offset-sync@wb.html
>     - shard-kbl:          NOTRUN -> [WARN][7] +3 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl2/igt@gem_userptr_blits@invalid-mmap-offset-sync@wb.html
> 
>   * {igt@gem_userptr_blits@invalid-mmap-offset-sync@wc} (NEW):
>     - shard-hsw:          NOTRUN -> [WARN][8] +2 similar issues
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-hsw4/igt@gem_userptr_blits@invalid-mmap-offset-sync@wc.html

All those WARNs are artificial and can be dropped, especially if 
DMESG-WARNs from hsw and snb are sufficient.

If you are not satisfied with results, could we please at least have 
patch 1/2 (unsync variant of invalid-mmap-offset dynamic subtest,
replacing former invalid-gtt-mapping) merged?

Thanks,
Janusz


> 
>   * igt@perf_pmu@rc6-runtime-pm:
>     - shard-apl:          [PASS][9] -> [DMESG-WARN][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-apl1/igt@perf_pmu@rc6-runtime-pm.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-apl4/igt@perf_pmu@rc6-runtime-pm.html
>     - shard-kbl:          [PASS][11] -> [DMESG-WARN][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-kbl2/igt@perf_pmu@rc6-runtime-pm.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl6/igt@perf_pmu@rc6-runtime-pm.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-tglb:         [SKIP][13] ([fdo#109289] / [fdo#111719]) -> [INCOMPLETE][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-tglb8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-tglb6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_8025_full and IGTPW_4236_full:
> 
> ### New IGT tests (13) ###
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-sync:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-sync@gtt:
>     - Statuses : 2 dmesg-warn(s) 5 warn(s)
>     - Exec time: [0.01, 0.02] s
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-sync@uc:
>     - Statuses : 7 warn(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-sync@wb:
>     - Statuses : 7 warn(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-sync@wc:
>     - Statuses : 7 warn(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync@gtt:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync@wb:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync@wc:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@i915_selftest@mock:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_selftest@perf:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_selftest@all:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4236_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_blits@basic:
>     - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#836])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-kbl6/igt@gem_blits@basic.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl7/igt@gem_blits@basic.html
> 
>   * igt@gem_ctx_persistence@close-replace-race:
>     - shard-apl:          [PASS][17] -> [INCOMPLETE][18] ([fdo#103927] / [i915#1291])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
> 
>   * igt@gem_ctx_shared@exec-single-timeline-bsd:
>     - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#110841])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
> 
>   * igt@gem_exec_schedule@implicit-read-write-bsd1:
>     - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109276] / [i915#677]) +2 similar issues
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd1.html
> 
>   * igt@gem_exec_schedule@pi-distinct-iova-bsd:
>     - shard-iclb:         [PASS][23] -> [SKIP][24] ([i915#677]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
> 
>   * igt@gem_exec_schedule@preempt-other-chain-bsd:
>     - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#112146]) +4 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
> 
>   * igt@gem_exec_schedule@preempt-queue-bsd1:
>     - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109276]) +16 similar issues
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#644])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@gem_userptr_blits@sync-unmap-after-close:
>     - shard-hsw:          [PASS][31] -> [DMESG-WARN][32] ([fdo#111870])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-hsw7/igt@gem_userptr_blits@sync-unmap-after-close.html
>     - shard-snb:          [PASS][33] -> [DMESG-WARN][34] ([fdo#111870] / [i915#478])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#454]) +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#39])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-glk6/igt@i915_pm_rps@waitboost.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-glk5/igt@i915_pm_rps@waitboost.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-suspend:
>     - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#54])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
>     - shard-kbl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#180] / [i915#54])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +4 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglb:         [PASS][47] -> [SKIP][48] ([i915#433])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-x:
>     - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#899])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
> 
>   * igt@kms_psr@no_drrs:
>     - shard-tglb:         [PASS][51] -> [SKIP][52] ([i915#668]) +5 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-tglb7/igt@kms_psr@no_drrs.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-tglb5/igt@kms_psr@no_drrs.html
> 
>   * igt@kms_psr@psr2_sprite_plane_onoff:
>     - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb4/igt@kms_psr@psr2_sprite_plane_onoff.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
>     - shard-kbl:          [PASS][55] -> [INCOMPLETE][56] ([fdo#103665])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
> 
>   * igt@perf_pmu@busy-no-semaphores-vcs1:
>     - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#112080]) +8 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_busy@busy-vcs1:
>     - shard-iclb:         [SKIP][59] ([fdo#112080]) -> [PASS][60] +16 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb5/igt@gem_busy@busy-vcs1.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb4/igt@gem_busy@busy-vcs1.html
> 
>   * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
>     - shard-tglb:         [INCOMPLETE][61] ([i915#1239]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-tglb3/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-tglb7/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
> 
>   * igt@gem_ctx_persistence@engines-mixed-process@rcs0:
>     - shard-tglb:         [FAIL][63] ([i915#679]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-tglb3/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-tglb7/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html
> 
>   * igt@gem_exec_balancer@hang:
>     - shard-tglb:         [FAIL][65] ([i915#1277]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-tglb2/igt@gem_exec_balancer@hang.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-tglb2/igt@gem_exec_balancer@hang.html
> 
>   * igt@gem_exec_schedule@implicit-read-write-bsd2:
>     - shard-iclb:         [SKIP][67] ([fdo#109276] / [i915#677]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd2.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd2.html
> 
>   * igt@gem_exec_schedule@pi-common-bsd:
>     - shard-iclb:         [SKIP][69] ([i915#677]) -> [PASS][70] +2 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html
> 
>   * igt@gem_exec_schedule@preempt-bsd:
>     - shard-iclb:         [SKIP][71] ([fdo#112146]) -> [PASS][72] +5 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html
> 
>   * igt@gem_exec_whisper@basic-contexts-forked:
>     - shard-glk:          [INCOMPLETE][73] ([i915#58] / [k.org#198133]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked.html
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +6 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-apl7/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@kms_color@pipe-a-gamma:
>     - shard-tglb:         [FAIL][77] ([i915#1149]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-tglb8/igt@kms_color@pipe-a-gamma.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-tglb6/igt@kms_color@pipe-a-gamma.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +2 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
>     - shard-apl:          [FAIL][81] ([i915#54]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
>     - shard-kbl:          [FAIL][83] ([i915#54]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-hsw:          [FAIL][85] ([IGT#5]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-hsw4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-hsw7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-glk:          [FAIL][87] ([i915#79]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-kbl:          [DMESG-WARN][89] ([i915#1297]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     - shard-apl:          [DMESG-WARN][91] ([i915#1297]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +3 similar issues
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@perf@gen12-mi-rpc:
>     - shard-tglb:         [FAIL][95] ([i915#1085]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-tglb6/igt@perf@gen12-mi-rpc.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-tglb5/igt@perf@gen12-mi-rpc.html
> 
>   * igt@prime_busy@hang-bsd2:
>     - shard-iclb:         [SKIP][97] ([fdo#109276]) -> [PASS][98] +17 similar issues
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb5/igt@prime_busy@hang-bsd2.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb1/igt@prime_busy@hang-bsd2.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
>     - shard-iclb:         [SKIP][99] ([fdo#112080]) -> [FAIL][100] ([IGT#28])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
>     - shard-hsw:          [DMESG-WARN][101] ([fdo#111870]) -> [DMESG-WARN][102] ([fdo#110789] / [fdo#111870])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
>     - shard-snb:          [DMESG-WARN][103] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][104] ([fdo#110789] / [fdo#111870] / [i915#478])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-snb:          [SKIP][105] ([fdo#109271]) -> [INCOMPLETE][106] ([i915#82])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-snb2/igt@i915_pm_rpm@dpms-non-lpsp.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-snb2/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - shard-tglb:         [DMESG-FAIL][107] ([i915#1233]) -> [INCOMPLETE][108] ([i915#1233])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-tglb6/igt@i915_selftest@live@gt_lrc.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-tglb5/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@kms_dp_dsc@basic-dsc-enable-edp:
>     - shard-iclb:         [SKIP][109] ([fdo#109349]) -> [DMESG-WARN][110] ([i915#1226])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-kbl:          [DMESG-WARN][111] ([i915#180]) -> [INCOMPLETE][112] ([fdo#103665])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@runner@aborted:
>     - shard-kbl:          [FAIL][113] ([i915#92]) -> ([FAIL][114], [FAIL][115]) ([i915#836] / [i915#92])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8025/shard-kbl6/igt@runner@aborted.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl6/igt@runner@aborted.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/shard-kbl7/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
>   [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
>   [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
>   [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
>   [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
>   [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
>   [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
>   [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
>   [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
>   [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
>   [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
>   [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
>   [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
>   [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
>   [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
>   [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
>   [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
>   [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
>   [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
>   [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
>   [i915#836]: https://gitlab.freedesktop.org/drm/intel/issues/836
>   [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
>   [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
>   [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
> 
> 
> Participating hosts (10 -> 8)
> ------------------------------
> 
>   Missing    (2): pig-skl-6260u pig-glk-j5005 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5474 -> IGTPW_4236
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_8025: 576ef251e04072e92ed85a5fc4c5e3600b4f8d62 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4236: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/index.html
>   IGT_5474: 1be610f852de155cd915e7cda65cb2737adf04d4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4236/index.html

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
