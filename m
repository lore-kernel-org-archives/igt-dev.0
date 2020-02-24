Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2D289686
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2020 11:16:19 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 24 Feb 2020 11:16:16 +0000
Message-ID: <38296d3140bf312a50c6250c3e0bd6baf5c56b20.camel@intel.com>
References: <20200218092308.29434-1-mika.kahola@intel.com>
 <158216429754.17406.2947168063780581057@emeril.freedesktop.org>
In-Reply-To: <158216429754.17406.2947168063780581057@emeril.freedesktop.org>
Content-Language: en-US
Content-ID: <B4F09DB4949CBB4AAB07DD9087DF98BE@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_Remove_unnecessary_defines?=
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 2020-02-20 at 02:04 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_ccs: Remove unnecessary defines
> URL   : https://patchwork.freedesktop.org/series/73563/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_7960_full -> IGTPW_4175_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4175_full absolutely need
> to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the
> changes
>   introduced in IGTPW_4175_full, please notify your bug team to allow
> them
>   to document this new failure mode, which will reduce false
> positives in CI.
> 
>   External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in
> IGTPW_4175_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@prime_vgem@basic-sync-default:
>     - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb5/igt@prime_vgem@basic-sync-default.html
>    [2]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb6/igt@prime_vgem@basic-sync-default.html

Seems unrelated to kms_ccs change.
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4175_full that come from known
> issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_busy@busy-vcs1:
>     - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +12
> similar issues
>    [3]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb2/igt@gem_busy@busy-vcs1.html
>    [4]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb5/igt@gem_busy@busy-vcs1.html
> 
>   * igt@gem_caching@reads:
>     - shard-hsw:          [PASS][5] -> [FAIL][6] ([i915#694])
>    [5]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw8/igt@gem_caching@reads.html
>    [6]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-hsw7/igt@gem_caching@reads.html
> 
>   * igt@gem_ctx_isolation@rcs0-s3:
>     - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180])
> +5 similar issues
>    [7]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
>    [8]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
> 
>   * igt@gem_exec_balancer@smoke:
>     - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110854])
>    [9]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb1/igt@gem_exec_balancer@smoke.html
>    [10]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb6/igt@gem_exec_balancer@smoke.html
> 
>   * igt@gem_exec_schedule@preempt-queue-bsd1:
>     - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +16
> similar issues
>    [11]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
>    [12]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
> 
>   * igt@gem_exec_schedule@preemptive-hang-bsd:
>     - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +8
> similar issues
>    [13]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html
>    [14]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#454])
>    [15]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html
>    [16]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180])
> +3 similar issues
>    [17]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl1/igt@i915_suspend@sysfs-reader.html
>    [18]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-apl1/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding:
>     - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54])
>    [19]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html
>    [20]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html
>     - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#54])
>    [21]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html
>    [22]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html
>     - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#54])
>    [23]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html
>    [24]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#72])
>    [25]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [26]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>     - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#34])
>    [27]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
>    [28]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-glk6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2
> similar issues
>    [29]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [30]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@perf@gen12-mi-rpc:
>     - shard-tglb:         [PASS][31] -> [TIMEOUT][32] ([fdo#112271] /
> [i915#1085])
>    [31]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-tglb1/igt@perf@gen12-mi-rpc.html
>    [32]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-tglb5/igt@perf@gen12-mi-rpc.html
> 
>   * igt@perf@short-reads:
>     - shard-hsw:          [PASS][33] -> [TIMEOUT][34] ([fdo#112271] /
> [i915#51])
>    [33]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw5/igt@perf@short-reads.html
>    [34]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-hsw5/igt@perf@short-reads.html
> 
>   
> #### Possible fixes ####
> 
>   * {igt@gem_ctx_persistence@close-replace-race}:
>     - shard-apl:          [FAIL][35] ([i915#1241]) -> [PASS][36]
>    [35]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl4/igt@gem_ctx_persistence@close-replace-race.html
>    [36]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-apl8/igt@gem_ctx_persistence@close-replace-race.html
>     - shard-glk:          [FAIL][37] ([i915#1241]) -> [PASS][38]
>    [37]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html
>    [38]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-glk4/igt@gem_ctx_persistence@close-replace-race.html
> 
>   * igt@gem_ctx_shared@exec-single-timeline-bsd:
>     - shard-iclb:         [SKIP][39] ([fdo#110841]) -> [PASS][40]
>    [39]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
>    [40]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
> 
>   * igt@gem_exec_async@concurrent-writes-bsd:
>     - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +3
> similar issues
>    [41]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html
>    [42]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb8/igt@gem_exec_async@concurrent-writes-bsd.html
> 
>   * igt@gem_exec_schedule@pi-shared-iova-bsd:
>     - shard-iclb:         [SKIP][43] ([i915#677]) -> [PASS][44]
>    [43]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html
>    [44]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46]
> +2 similar issues
>    [45]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
>    [46]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>     - shard-hsw:          [FAIL][47] ([i915#694]) -> [PASS][48] +1
> similar issue
>    [47]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
>    [48]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-iclb:         [INCOMPLETE][49] ([fdo#109100]) ->
> [PASS][50]
>    [49]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb3/igt@gem_softpin@noreloc-s3.html
>    [50]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb6/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@gem_tiled_blits@normal:
>     - shard-hsw:          [FAIL][51] ([i915#818]) -> [PASS][52]
>    [51]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw2/igt@gem_tiled_blits@normal.html
>    [52]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-hsw5/igt@gem_tiled_blits@normal.html
> 
>   * igt@i915_pm_dc@dc5-dpms:
>     - shard-iclb:         [FAIL][53] ([i915#447]) -> [PASS][54]
>    [53]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
>    [54]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html
> 
>   * igt@i915_selftest@live_gt_heartbeat:
>     - shard-apl:          [DMESG-FAIL][55] ([i915#541]) -> [PASS][56]
>    [55]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl2/igt@i915_selftest@live_gt_heartbeat.html
>    [56]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-apl6/igt@i915_selftest@live_gt_heartbeat.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-glk:          [FAIL][57] ([i915#79]) -> [PASS][58]
>    [57]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [58]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60]
> +1 similar issue
>    [59]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [60]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms
> _frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
>     - shard-apl:          [FAIL][61] ([i915#49]) -> [PASS][62]
>    [61]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
>    [62]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
>     - shard-kbl:          [FAIL][63] ([i915#49]) -> [PASS][64]
>    [63]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
>    [64]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-x:
>     - shard-glk:          [FAIL][65] ([i915#899]) -> [PASS][66]
>    [65]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
>    [66]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
> 
>   * igt@kms_psr@psr2_primary_mmap_gtt:
>     - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68]
>    [67]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html
>    [68]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
> 
>   * igt@kms_setmode@basic:
>     - shard-kbl:          [FAIL][69] ([i915#31]) -> [PASS][70]
>    [69]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-kbl3/igt@kms_setmode@basic.html
>    [70]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-kbl7/igt@kms_setmode@basic.html
> 
>   * igt@perf_pmu@busy-vcs1:
>     - shard-iclb:         [SKIP][71] ([fdo#112080]) -> [PASS][72] +10
> similar issues
>    [71]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb8/igt@perf_pmu@busy-vcs1.html
>    [72]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb1/igt@perf_pmu@busy-vcs1.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-hsw:          [INCOMPLETE][73] ([i915#1176] / [i915#61])
> -> [PASS][74]
>    [73]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw6/igt@perf_pmu@cpu-hotplug.html
>    [74]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-hsw1/igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@prime_vgem@fence-wait-bsd2:
>     - shard-iclb:         [SKIP][75] ([fdo#109276]) -> [PASS][76] +20
> similar issues
>    [75]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
>    [76]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_tiled_blits@interruptible:
>     - shard-hsw:          [FAIL][77] ([i915#694]) -> [FAIL][78]
> ([i915#818])
>    [77]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw7/igt@gem_tiled_blits@interruptible.html
>    [78]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-hsw1/igt@gem_tiled_blits@interruptible.html
> 
>   * igt@gem_userptr_blits@sync-unmap-cycles:
>     - shard-snb:          [DMESG-WARN][79] ([fdo#111870] /
> [i915#478]) -> [DMESG-WARN][80] ([fdo#110789] / [fdo#111870] /
> [i915#478])
>    [79]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-snb7/igt@gem_userptr_blits@sync-unmap-cycles.html
>    [80]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-tglb:         [FAIL][81] ([i915#454]) -> [SKIP][82]
> ([i915#468])
>    [81]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html
>    [82]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when
> computing
>           the status of the difference (SUCCESS, WARNING, or
> FAILURE).
> 
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
>   [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
>   [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
>   [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
>   [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
>   [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
>   [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
>   [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
>   [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
>   [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
>   [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
>   [i915#1197]: https://gitlab.freedesktop.org/drm/intel/issues/1197
>   [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
>   [i915#1241]: https://gitlab.freedesktop.org/drm/intel/issues/1241
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
>   [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
>   [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
>   [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>   [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
>   [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
>   [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
>   [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
>   [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
>   [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
>   [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
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
>   * IGT: IGT_5447 -> IGTPW_4175
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_7960: b86443a3c1d1b32a03f381c9198eed9243f06d18 @
> git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4175: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/index.html
>   IGT_5447: 8d6b2500e44d3dc78b5eac8798f0de42f2ff9014 @
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
> git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4175/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
