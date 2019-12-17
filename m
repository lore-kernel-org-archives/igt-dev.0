Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F3A89A76
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 11:30:04 +0000 (UTC)
Date: Tue, 17 Dec 2019 13:29:36 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20191217112936.GA31722@ideak-desk.fi.intel.com>
References: <20191216235407.23070-1-imre.deak@intel.com>
 <157657245649.21846.11034394164348922712@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157657245649.21846.11034394164348922712@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_Add_support_for_the_gen12_media_compressed_modifier_?=
 =?utf-8?b?KHJldjMp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 08:47:36AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_fb: Add support for the gen12 media compressed modifier (rev3)
> URL   : https://patchwork.freedesktop.org/series/71012/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_7578_full -> IGTPW_3869_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_3869_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_3869_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_3869_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-hsw:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-hsw6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-hsw4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

There is no compression support on HSW, so the changes in the patch are
unrelated to the above failure.

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_3869_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_isolation@rcs0-s3:
>     - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +5 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
> 
>   * igt@gem_exec_schedule@fifo-bsd1:
>     - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb4/igt@gem_exec_schedule@fifo-bsd1.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-iclb3/igt@gem_exec_schedule@fifo-bsd1.html
> 
>   * igt@gem_exec_schedule@preempt-queue-bsd:
>     - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain-bsd1:
>     - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([fdo#111606] / [fdo#111677])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb8/igt@gem_exec_schedule@preempt-queue-chain-bsd1.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb6/igt@gem_exec_schedule@preempt-queue-chain-bsd1.html
> 
>   * igt@gem_persistent_relocs@forked-thrashing:
>     - shard-tglb:         [PASS][11] -> [TIMEOUT][12] ([i915#530])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb4/igt@gem_persistent_relocs@forked-thrashing.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb1/igt@gem_persistent_relocs@forked-thrashing.html
>     - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#520])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-hsw7/igt@gem_persistent_relocs@forked-thrashing.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-hsw6/igt@gem_persistent_relocs@forked-thrashing.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#644])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
>     - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#644])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@gem_sync@basic-many-each:
>     - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#472] / [i915#707])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb5/igt@gem_sync@basic-many-each.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb8/igt@gem_sync@basic-many-each.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
>     - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#817])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-hsw1/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-hsw4/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl2/igt@gem_workarounds@suspend-resume-fd.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@i915_pm_rpm@cursor:
>     - shard-apl:          [PASS][25] -> [SKIP][26] ([fdo#109271])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl3/igt@i915_pm_rpm@cursor.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-apl2/igt@i915_pm_rpm@cursor.html
> 
>   * igt@i915_selftest@live_hangcheck:
>     - shard-tglb:         [PASS][27] -> [INCOMPLETE][28] ([i915#435])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb2/igt@i915_selftest@live_hangcheck.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb8/igt@i915_selftest@live_hangcheck.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#49])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
>     - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#474] / [i915#667]) +1 similar issue
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_plane@pixel-format-pipe-b-planes:
>     - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([fdo#103665] / [i915#648] / [i915#667])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-kbl6/igt@kms_plane@pixel-format-pipe-b-planes.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-kbl4/igt@kms_plane@pixel-format-pipe-b-planes.html
> 
>   * igt@kms_setmode@basic:
>     - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#31])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl8/igt@kms_setmode@basic.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-apl3/igt@kms_setmode@basic.html
> 
>   * igt@perf@oa-exponents:
>     - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#84])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb4/igt@perf@oa-exponents.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb6/igt@perf@oa-exponents.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-tglb:         [PASS][39] -> [DMESG-WARN][40] ([i915#799])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb5/igt@perf_pmu@cpu-hotplug.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb5/igt@perf_pmu@cpu-hotplug.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_busy@close-race:
>     - shard-tglb:         [INCOMPLETE][41] ([i915#435]) -> [PASS][42] +1 similar issue
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb6/igt@gem_busy@close-race.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb4/igt@gem_busy@close-race.html
> 
>   * igt@gem_ctx_isolation@bcs0-s3:
>     - shard-tglb:         [INCOMPLETE][43] ([i915#456]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb5/igt@gem_ctx_isolation@bcs0-s3.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb9/igt@gem_ctx_isolation@bcs0-s3.html
> 
>   * igt@gem_ctx_persistence@vcs0-mixed-process:
>     - shard-apl:          [FAIL][45] ([i915#679]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl3/igt@gem_ctx_persistence@vcs0-mixed-process.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-apl3/igt@gem_ctx_persistence@vcs0-mixed-process.html
> 
>   * igt@gem_eio@banned:
>     - shard-tglb:         [INCOMPLETE][47] ([i915#476]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb6/igt@gem_eio@banned.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb9/igt@gem_eio@banned.html
> 
>   * igt@gem_eio@suspend:
>     - shard-tglb:         [INCOMPLETE][49] ([i915#460]) -> [PASS][50] +1 similar issue
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb2/igt@gem_eio@suspend.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb5/igt@gem_eio@suspend.html
> 
>   * igt@gem_exec_schedule@preempt-other-chain-bsd2:
>     - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +1 similar issue
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd2.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd2.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-vebox:
>     - shard-tglb:         [INCOMPLETE][53] ([fdo#111677]) -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb1/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html
> 
>   * igt@gem_exec_schedule@preemptive-hang-bsd:
>     - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
> 
>   * {igt@gen9_exec_parse@allowed-single}:
>     - shard-glk:          [DMESG-WARN][57] ([i915#716]) -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-glk9/igt@gen9_exec_parse@allowed-single.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-glk3/igt@gen9_exec_parse@allowed-single.html
>     - shard-apl:          [DMESG-WARN][59] ([i915#716]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl7/igt@gen9_exec_parse@allowed-single.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-apl8/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +3 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
>     - shard-hsw:          [DMESG-WARN][63] ([IGT#6]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-tglb:         [INCOMPLETE][65] ([i915#456] / [i915#460]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-suspend:
>     - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-apl:          [FAIL][71] ([i915#79]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-tglb:         [INCOMPLETE][73] ([i915#460] / [i915#516]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb3/igt@kms_flip@flip-vs-suspend.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb9/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-glk:          [FAIL][75] ([i915#49]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-tglb:         [FAIL][77] ([i915#49]) -> [PASS][78] +1 similar issue
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ctx_isolation@vcs2-dirty-create:
>     - shard-tglb:         [SKIP][79] ([fdo#111912] / [fdo#112080]) -> [SKIP][80] ([fdo#112080])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb6/igt@gem_ctx_isolation@vcs2-dirty-create.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/shard-tglb9/igt@gem_ctx_isolation@vcs2-dirty-create.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>   [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
>   [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
>   [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
>   [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
>   [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
>   [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
>   [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
>   [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
>   [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
>   [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
>   [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>   [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
>   [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
>   [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
>   [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
>   [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
>   [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
>   [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
>   [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#799]: https://gitlab.freedesktop.org/drm/intel/issues/799
>   [i915#817]: https://gitlab.freedesktop.org/drm/intel/issues/817
>   [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
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
>   * IGT: IGT_5349 -> IGTPW_3869
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_7578: cc329d389f5609d2969d0797bc96f754adb26d62 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_3869: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/index.html
>   IGT_5349: 048f58513d8b8ec6bb307a939f0ac959bc0f0e10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3869/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
