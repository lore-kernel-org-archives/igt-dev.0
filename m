Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03F56E8C4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 14:23:32 +0000 (UTC)
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Date: Fri, 13 Dec 2019 14:23:23 +0000
Message-ID: <4dfe25e9c0036e2352c1cbe30c56e0945ea269f5.camel@intel.com>
References: <20191205132208.23450-1-stanislav.lisovskiy@intel.com>
 <157590598645.14783.13452233865138494940@emeril.freedesktop.org>
In-Reply-To: <157590598645.14783.13452233865138494940@emeril.freedesktop.org>
Content-Language: en-US
Content-ID: <BB3A3E505D2B7F4687B87050774CB1B8@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdG9vbHM6?=
 =?utf-8?q?_Add_an_intel=5Fdbuf=5Fmap_tool_=28rev2=29?=
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
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 2019-12-09 at 15:39 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools: Add an intel_dbuf_map tool (rev2)
> URL   : https://patchwork.freedesktop.org/series/70493/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_7516_full -> IGTPW_3828_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_3828_full absolutely need
> to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the
> changes
>   introduced in IGTPW_3828_full, please notify your bug team to allow
> them
>   to document this new failure mode, which will reduce false
> positives in CI.
> 
>   External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in
> IGTPW_3828_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-rte:
>     - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
>    [2]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

Seems to be one more false positive, as this patch contains
a new tool for IGT, which can't affect that anyhow.

Stan

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or
> statuses.
>   They do not affect the overall result.
> 
>   * {igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled}:
>     - shard-iclb:         NOTRUN -> [SKIP][3] +4 similar issues
>    [3]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_3828_full that come from known
> issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_persistence@vcs1-queued:
>     - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] /
> [fdo#112080]) +1 similar issue
>    [4]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html
>    [5]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html
> 
>   * igt@gem_eio@in-flight-contexts-1us:
>     - shard-hsw:          [PASS][6] -> [INCOMPLETE][7] ([i915#61])
>    [6]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-hsw4/igt@gem_eio@in-flight-contexts-1us.html
>    [7]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-hsw7/igt@gem_eio@in-flight-contexts-1us.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-apl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180])
>    [8]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-apl2/igt@gem_eio@in-flight-suspend.html
>    [9]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-apl3/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-snb:          [PASS][10] -> [FAIL][11] ([i915#232])
>    [10]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-snb1/igt@gem_eio@reset-stress.html
>    [11]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb1/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_schedule@smoketest-blt:
>     - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([i915#470])
>    [12]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-tglb4/igt@gem_exec_schedule@smoketest-blt.html
>    [13]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb6/igt@gem_exec_schedule@smoketest-blt.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#644])
>    [14]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [15]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-kbl:          [PASS][16] -> [DMESG-WARN][17] ([i915#183])
>    [16]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-kbl1/igt@gem_tiled_swapping@non-threaded.html
>    [17]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl7/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-busy:
>     - shard-snb:          [PASS][18] -> [DMESG-WARN][19]
> ([fdo#110789] / [fdo#111870])
>    [18]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
>    [19]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
> 
>   * igt@gem_userptr_blits@sync-unmap-cycles:
>     - shard-snb:          [PASS][20] -> [DMESG-WARN][21]
> ([fdo#111870]) +1 similar issue
>    [20]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
>    [21]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
> 
>   * igt@i915_hangman@error-state-capture-vcs1:
>     - shard-iclb:         [PASS][22] -> [SKIP][23] ([fdo#112080]) +6
> similar issues
>    [22]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-iclb2/igt@i915_hangman@error-state-capture-vcs1.html
>    [23]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb5/igt@i915_hangman@error-state-capture-vcs1.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-tglb:         [PASS][24] -> [INCOMPLETE][25] ([i915#435]
> / [i915#460])
>    [24]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-tglb9/igt@i915_pm_rpm@system-suspend.html
>    [25]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb7/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_selftest@mock_sanitycheck:
>     - shard-hsw:          [PASS][26] -> [DMESG-WARN][27] ([i915#747])
>    [26]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-hsw1/igt@i915_selftest@mock_sanitycheck.html
>    [27]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-hsw4/igt@i915_selftest@mock_sanitycheck.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#79])
>    [28]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [29]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#49]) +2
> similar issues
>    [30]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
>    [31]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
>     - shard-tglb:         [PASS][32] -> [INCOMPLETE][33] ([i915#474]
> / [i915#667])
>    [32]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
>    [33]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
>     - shard-tglb:         [PASS][34] -> [FAIL][35] ([i915#49]) +1
> similar issue
>    [34]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
>    [35]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
> 
>   * igt@kms_plane@pixel-format-pipe-b-planes:
>     - shard-kbl:          [PASS][36] -> [INCOMPLETE][37]
> ([fdo#103665])
>    [36]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-kbl2/igt@kms_plane@pixel-format-pipe-b-planes.html
>    [37]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
>     - shard-tglb:         [PASS][38] -> [INCOMPLETE][39] ([i915#456]
> / [i915#460]) +2 similar issues
>    [38]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-tglb9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
>    [39]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441])
>    [40]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [41]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-suspend:
>     - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180])
>    [42]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
>    [43]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
> 
>   * igt@prime_busy@after-bsd2:
>     - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109276]) +8
> similar issues
>    [44]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-iclb4/igt@prime_busy@after-bsd2.html
>    [45]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb6/igt@prime_busy@after-bsd2.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_isolation@rcs0-s3:
>     - shard-kbl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47]
> +12 similar issues
>    [46]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
>    [47]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
> 
>   * {igt@gem_exec_balancer@bonded-chain}:
>     - shard-iclb:         [FAIL][48] ([i915#669]) -> [PASS][49]
>    [48]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-iclb2/igt@gem_exec_balancer@bonded-chain.html
>    [49]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb3/igt@gem_exec_balancer@bonded-chain.html
> 
>   * igt@gem_exec_parallel@vcs0:
>     - shard-tglb:         [INCOMPLETE][50] ([fdo#111593]) ->
> [PASS][51]
>    [50]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-tglb4/igt@gem_exec_parallel@vcs0.html
>    [51]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb6/igt@gem_exec_parallel@vcs0.html
> 
>   * igt@gem_exec_parallel@vcs0-contexts:
>     - shard-hsw:          [FAIL][52] -> [PASS][53]
>    [52]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-hsw6/igt@gem_exec_parallel@vcs0-contexts.html
>    [53]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-hsw7/igt@gem_exec_parallel@vcs0-contexts.html
> 
>   * igt@gem_exec_schedule@preempt-queue-bsd2:
>     - shard-iclb:         [SKIP][54] ([fdo#109276]) -> [PASS][55] +2
> similar issues
>    [54]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd2.html
>    [55]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd2.html
> 
>   * igt@gem_exec_schedule@promotion-bsd:
>     - shard-iclb:         [SKIP][56] ([fdo#112146]) -> [PASS][57]
>    [56]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-iclb4/igt@gem_exec_schedule@promotion-bsd.html
>    [57]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb8/igt@gem_exec_schedule@promotion-bsd.html
> 
>   * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
>     - shard-hsw:          [TIMEOUT][58] ([i915#530]) -> [PASS][59]
>    [58]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-hsw8/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
>    [59]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-hsw8/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-kbl:          [FAIL][60] ([i915#644]) -> [PASS][61]
>    [60]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [61]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@gem_sync@basic-each:
>     - shard-tglb:         [INCOMPLETE][62] ([i915#472] / [i915#707])
> -> [PASS][63]
>    [62]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-tglb8/igt@gem_sync@basic-each.html
>    [63]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb9/igt@gem_sync@basic-each.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-snb:          [DMESG-WARN][64] ([fdo#110789] /
> [fdo#111870]) -> [PASS][65] +1 similar issue
>    [64]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html
>    [65]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
>     - shard-hsw:          [DMESG-WARN][66] ([IGT#6]) -> [PASS][67]
>    [66]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
>    [67]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
>     - shard-glk:          [FAIL][68] ([i915#54]) -> [PASS][69]
>    [68]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
>    [69]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
>     - shard-apl:          [FAIL][70] ([i915#54]) -> [PASS][71]
>    [70]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
>    [71]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
>     - shard-kbl:          [FAIL][72] ([i915#54]) -> [PASS][73] +1
> similar issue
>    [72]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
>    [73]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-hsw:          [FAIL][74] ([i915#96]) -> [PASS][75]
>    [74]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [75]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-apl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77]
> +2 similar issues
>    [76]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [77]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
>     - shard-tglb:         [INCOMPLETE][78] ([i915#474] / [i915#667])
> -> [PASS][79]
>    [78]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
>    [79]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms
> _frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-snb:          [DMESG-WARN][80] -> [PASS][81]
>    [80]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
>    [81]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms
> _frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-glk:          [FAIL][82] ([i915#49]) -> [PASS][83]
>    [82]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [83]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-iclb:         [DMESG-WARN][84] ([fdo#111764]) ->
> [PASS][85]
>    [84]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [85]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms
> _frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>     - shard-iclb:         [FAIL][86] ([i915#49]) -> [PASS][87] +2
> similar issues
>    [86]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
>    [87]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen
> :
>     - shard-tglb:         [INCOMPLETE][88] ([i915#435] / [i915#667])
> -> [PASS][89]
>    [88]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
>    [89]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_plane@pixel-format-pipe-a-planes:
>     - shard-kbl:          [INCOMPLETE][90] ([fdo#103665]) ->
> [PASS][91]
>    [90]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-kbl4/igt@kms_plane@pixel-format-pipe-a-planes.html
>    [91]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-kbl1/igt@kms_plane@pixel-format-pipe-a-planes.html
> 
>   * igt@kms_setmode@basic:
>     - shard-apl:          [FAIL][92] ([i915#31]) -> [PASS][93]
>    [92]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-apl6/igt@kms_setmode@basic.html
>    [93]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-apl4/igt@kms_setmode@basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ctx_isolation@vcs2-clean:
>     - shard-tglb:         [SKIP][94] ([fdo#112080]) -> [SKIP][95]
> ([fdo#111912] / [fdo#112080])
>    [94]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7516/shard-tglb9/igt@gem_ctx_isolation@vcs2-clean.html
>    [95]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/shard-tglb7/igt@gem_ctx_isolation@vcs2-clean.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when
> computing
>           the status of the difference (SUCCESS, WARNING, or
> FAILURE).
> 
>   [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
>   [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
>   [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
>   [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
>   [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
>   [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
>   [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
>   [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#183]: https://gitlab.freedesktop.org/drm/intel/issues/183
>   [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
>   [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
>   [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
>   [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
>   [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
>   [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
>   [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>   [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
>   [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
>   [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
>   [i915#669]: https://gitlab.freedesktop.org/drm/intel/issues/669
>   [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
>   [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
> 
> 
> Participating hosts (11 -> 8)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5340 -> IGTPW_3828
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_7516: 048eafd9f22bdd5fd3673e3ce827142864fa9b0b @
> git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_3828: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/index.html
>   IGT_5340: 1b21dc2c399805f8580e000346ff457fe50f12fa @
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
> git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3828/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
