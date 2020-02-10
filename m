Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A89F8933D
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 14:12:08 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 10 Feb 2020 14:12:04 +0000
Message-ID: <2db6416a5342608c29abb4458b0755101c59539f.camel@intel.com>
References: <20200207115834.26620-1-mika.kahola@intel.com>
 <158134253382.3098.16536805190378810624@emeril.freedesktop.org>
In-Reply-To: <158134253382.3098.16536805190378810624@emeril.freedesktop.org>
Content-Language: en-US
Content-ID: <5E4336A5BC561F43BA81CC785FF4DD17@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_Simplify_FB_width_check?=
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

On Mon, 2020-02-10 at 13:48 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_ccs: Simplify FB width check
> URL   : https://patchwork.freedesktop.org/series/73136/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5425_full -> IGTPW_4111_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4111_full absolutely need
> to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the
> changes
>   introduced in IGTPW_4111_full, please notify your bug team to allow
> them
>   to document this new failure mode, which will reduce false
> positives in CI.
> 
>   External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in
> IGTPW_4111_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_backlight@fade_with_suspend:
>     - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb6/igt@i915_pm_backlight@fade_with_suspend.html
>    [2]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb5/igt@i915_pm_backlight@fade_with_suspend.html
> 
>   * igt@kms_color@pipe-a-legacy-gamma:
>     - shard-tglb:         [PASS][3] -> [FAIL][4]
>    [3]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb1/igt@kms_color@pipe-a-legacy-gamma.html
>    [4]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb7/igt@kms_color@pipe-a-legacy-gamma.html

These are not related to the patch that made changes in kms_ccs.
 
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4111_full that come from known
> issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_balancer@hang:
>     - shard-iclb:         [PASS][5] -> [TIMEOUT][6] ([fdo#112271])
>    [5]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb8/igt@gem_exec_balancer@hang.html
>    [6]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb2/igt@gem_exec_balancer@hang.html
> 
>   * igt@gem_exec_balancer@smoke:
>     - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
>    [7]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb1/igt@gem_exec_balancer@smoke.html
>    [8]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb6/igt@gem_exec_balancer@smoke.html
> 
>   * igt@gem_exec_parallel@vcs1-fds:
>     - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +7
> similar issues
>    [9]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
>    [10]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
> 
>   * igt@gem_exec_schedule@pi-common-bsd:
>     - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
>    [11]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
>    [12]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-bsd1:
>     - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +21
> similar issues
>    [13]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html
>    [14]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html
> 
>   * igt@gem_exec_schedule@reorder-wide-bsd:
>     - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +9
> similar issues
>    [15]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html
>    [16]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - shard-kbl:          [PASS][17] -> [INCOMPLETE][18]
> ([fdo#103665])
>    [17]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
>    [18]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#694]) +1
> similar issue
>    [19]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-hsw2/igt@gem_partial_pwrite_pread@reads-uncached.html
>    [20]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-hsw5/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-snb:          [PASS][21] -> [DMESG-WARN][22]
> ([fdo#111870] / [i915#478])
>    [21]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
>    [22]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180])
> +2 similar issues
>    [23]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
>    [24]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#716])
>    [25]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-glk9/igt@gen9_exec_parse@allowed-all.html
>    [26]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-glk5/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-0:
>     - shard-iclb:         [PASS][27] -> [SKIP][28] ([i915#1140])
>    [27]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb8/igt@kms_big_fb@linear-64bpp-rotate-0.html
>    [28]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb2/igt@kms_big_fb@linear-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#1172]) +1
> similar issue
>    [29]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [30]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
>     - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#70])
>    [31]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
>    [32]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb2/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
>     - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#559])
>    [33]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
>    [34]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled:
>     - shard-tglb:         [PASS][35] -> [DMESG-FAIL][36] ([i915#402])
> +1 similar issue
>    [35]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html
>    [36]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>     - shard-tglb:         [PASS][37] -> [SKIP][38] ([i915#668]) +4
> similar issues
>    [37]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>    [38]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>   * igt@kms_plane_cursor@pipe-a-viewport-size-256:
>     - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#1139]) +1
> similar issue
>    [39]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
>    [40]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-x:
>     - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#899])
>    [41]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
>    [42]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
> 
>   * igt@kms_psr@psr2_cursor_mmap_cpu:
>     - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2
> similar issues
>    [43]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
>    [44]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#65])
>    [45]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [46]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_vblank@pipe-a-ts-continuation-suspend:
>     - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180])
> +3 similar issues
>    [47]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-apl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
>    [48]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
> 
>   * igt@prime_mmap_coherency@ioctl-errors:
>     - shard-hsw:          [PASS][49] -> [FAIL][50] ([i915#831])
>    [49]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
>    [50]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_isolation@rcs0-s3:
>     - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52]
> +6 similar issues
>    [51]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
>    [52]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
> 
>   * igt@gem_ctx_shared@exec-single-timeline-bsd:
>     - shard-iclb:         [SKIP][53] ([fdo#110841]) -> [PASS][54]
>    [53]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
>    [54]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
> 
>   * igt@gem_exec_schedule@out-order-bsd2:
>     - shard-iclb:         [SKIP][55] ([fdo#109276]) -> [PASS][56] +16
> similar issues
>    [55]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb6/igt@gem_exec_schedule@out-order-bsd2.html
>    [56]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb2/igt@gem_exec_schedule@out-order-bsd2.html
> 
>   * igt@gem_exec_schedule@pi-distinct-iova-vebox:
>     - shard-glk:          [FAIL][57] ([i915#859]) -> [PASS][58]
>    [57]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-glk9/igt@gem_exec_schedule@pi-distinct-iova-vebox.html
>    [58]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-glk5/igt@gem_exec_schedule@pi-distinct-iova-vebox.html
> 
>   * igt@gem_exec_schedule@pi-shared-iova-bsd:
>     - shard-iclb:         [SKIP][59] ([i915#677]) -> [PASS][60]
>    [59]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
>    [60]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
> 
>   * igt@gem_exec_schedule@preempt-other-chain-bsd:
>     - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +4
> similar issues
>    [61]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
>    [62]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-tglb:         [FAIL][63] ([i915#413]) -> [PASS][64]
>    [63]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb2/igt@i915_pm_rps@waitboost.html
>    [64]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb8/igt@i915_pm_rps@waitboost.html
> 
>   * igt@i915_selftest@live_gtt:
>     - shard-kbl:          [TIMEOUT][65] ([fdo#112271]) -> [PASS][66]
>    [65]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-kbl3/igt@i915_selftest@live_gtt.html
>    [66]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-kbl1/igt@i915_selftest@live_gtt.html
>     - shard-apl:          [TIMEOUT][67] ([fdo#112271]) -> [PASS][68]
>    [67]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-apl3/igt@i915_selftest@live_gtt.html
>    [68]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-apl3/igt@i915_selftest@live_gtt.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180:
>     - shard-tglb:         [DMESG-FAIL][69] ([i915#402]) -> [PASS][70]
> +2 similar issues
>    [69]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html
>    [70]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
>     - shard-tglb:         [FAIL][71] ([fdo#111703]) -> [PASS][72]
>    [71]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
>    [72]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:
>     - shard-tglb:         [FAIL][73] ([i915#559]) -> [PASS][74]
>    [73]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html
>    [74]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
>     - shard-snb:          [DMESG-WARN][75] ([i915#478]) -> [PASS][76]
>    [75]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-snb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
>    [76]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-glk:          [FAIL][77] ([i915#79]) -> [PASS][78]
>    [77]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [78]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
>     - shard-hsw:          [DMESG-WARN][79] ([i915#44]) -> [PASS][80]
>    [79]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-hsw5/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
>    [80]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-hsw7/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
>     - shard-tglb:         [FAIL][81] ([i915#1183]) -> [PASS][82]
>    [81]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb8/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
>    [82]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
>     - shard-tglb:         [FAIL][83] ([i915#1184]) -> [PASS][84]
>    [83]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
>    [84]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb5/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
> 
>   * igt@kms_plane_cursor@pipe-a-overlay-size-256:
>     - shard-tglb:         [FAIL][85] ([i915#1139]) -> [PASS][86]
>    [85]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
>    [86]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb8/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-none:
>     - shard-tglb:         [FAIL][87] ([i915#899]) -> [PASS][88]
>    [87]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-none.html
>    [88]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-none.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +3
> similar issues
>    [89]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [90]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@kms_setmode@basic:
>     - shard-hsw:          [FAIL][91] ([i915#31]) -> [PASS][92]
>    [91]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-hsw1/igt@kms_setmode@basic.html
>    [92]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-hsw7/igt@kms_setmode@basic.html
> 
>   * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
>     - shard-kbl:          [INCOMPLETE][93] ([fdo#103665]) ->
> [PASS][94]
>    [93]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
>    [94]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@pipe-b-wait-forked:
>     - shard-snb:          [SKIP][95] ([fdo#109271]) -> [PASS][96] +1
> similar issue
>    [95]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-snb2/igt@kms_vblank@pipe-b-wait-forked.html
>    [96]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-snb4/igt@kms_vblank@pipe-b-wait-forked.html
> 
>   * igt@perf@gen12-mi-rpc:
>     - shard-tglb:         [TIMEOUT][97] ([fdo#112271] / [i915#1085] /
> [i915#472]) -> [PASS][98]
>    [97]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb2/igt@perf@gen12-mi-rpc.html
>    [98]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-tglb5/igt@perf@gen12-mi-rpc.html
> 
>   * igt@perf_pmu@busy-no-semaphores-vcs1:
>     - shard-iclb:         [SKIP][99] ([fdo#112080]) -> [PASS][100]
> +11 similar issues
>    [99]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html
>    [100]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
>     - shard-iclb:         [SKIP][101] ([fdo#112080]) -> [FAIL][102]
> ([IGT#28])
>    [101]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
>    [102]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
> 
>   * igt@gem_tiled_blits@normal:
>     - shard-hsw:          [FAIL][103] ([i915#818]) -> [FAIL][104]
> ([i915#694])
>    [103]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-hsw2/igt@gem_tiled_blits@normal.html
>    [104]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-hsw5/igt@gem_tiled_blits@normal.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp:
>     - shard-snb:          [SKIP][105] ([fdo#109271]) ->
> [INCOMPLETE][106] ([i915#82])
>    [105]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-snb2/igt@i915_pm_rpm@modeset-lpsp.html
>    [106]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-snb5/igt@i915_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_dp_dsc@basic-dsc-enable-edp:
>     - shard-iclb:         [DMESG-WARN][107] ([fdo#107724]) ->
> [SKIP][108] ([fdo#109349])
>    [107]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
>    [108]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
> 
>   
>   [IGT#28]: 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
>   [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>   [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
>   [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
>   [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
>   [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
>   [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
>   [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
>   [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
>   [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
>   [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
>   [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
>   [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
>   [i915#1183]: https://gitlab.freedesktop.org/drm/intel/issues/1183
>   [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
>   [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
>   [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
>   [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
>   [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
>   [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
>   [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
>   [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
>   [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
>   [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
>   [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
>   [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
>   [i915#859]: https://gitlab.freedesktop.org/drm/intel/issues/859
>   [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
> 
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5425 -> IGTPW_4111
> 
>   CI-20190529: 20190529
>   CI_DRM_7885: fc2806bc441bfc6b44cf4713f3c6b820d73c3534 @
> git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4111: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/index.html
>   IGT_5425: ad4542ef1adbaa1227bc9ba9e24bb0e0f6dd408d @
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
