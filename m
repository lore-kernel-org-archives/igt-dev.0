Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FDC6E1BC
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 11:01:36 +0000 (UTC)
Message-ID: <9b14035537ad07e23d93c69221b0d0ad9b06c296.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 05 Mar 2020 12:01:32 +0100
In-Reply-To: <158337788625.17237.18140931276638188563@emeril.freedesktop.org>
References: <20200304095841.8781-1-janusz.krzysztofik@linux.intel.com>
 <158337788625.17237.18140931276638188563@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_mmap-offset-invalidate_enhancements?=
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
To: igt-dev@lists.freedesktop.org
Cc: Martin Peres <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On Thu, 2020-03-05 at 03:11 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_userptr_blits: mmap-offset-invalidate enhancements
> URL   : https://patchwork.freedesktop.org/series/74253/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8062_full -> IGTPW_4254_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4254_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4254_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4254_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-hsw:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw8/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

This has nothing to do with the changes.

> 
>   * {igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt} (NEW):
>     - shard-iclb:         NOTRUN -> [SKIP][3] +3 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb8/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html
> 
>   * {igt@gem_userptr_blits@mmap-offset-invalidate-active@wc} (NEW):
>     - shard-tglb:         NOTRUN -> [SKIP][4] +3 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-tglb7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html

SKIP is expected behavior for as long as userptr MMU notifier related
lockdep loop issue exists in the driver.

> 
>   * igt@i915_pm_backlight@fade_with_dpms:
>     - shard-iclb:         [PASS][5] -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb1/igt@i915_pm_backlight@fade_with_dpms.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb7/igt@i915_pm_backlight@fade_with_dpms.html
> 
>   * igt@i915_pm_dc@dc5-dpms:
>     - shard-iclb:         NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

These two also have nothing to do with the changes.

Thanks,
Janusz


> 
>   
> #### Warnings ####
> 
>   * igt@runner@aborted:
>     - shard-hsw:          ([FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13]) ([fdo#111870] / [i915#226]) -> ([FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21]) ([fdo#111870])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw5/igt@runner@aborted.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw5/igt@runner@aborted.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw8/igt@runner@aborted.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw7/igt@runner@aborted.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw7/igt@runner@aborted.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw8/igt@runner@aborted.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw1/igt@runner@aborted.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw7/igt@runner@aborted.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw8/igt@runner@aborted.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw5/igt@runner@aborted.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw1/igt@runner@aborted.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw8/igt@runner@aborted.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw7/igt@runner@aborted.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw8/igt@runner@aborted.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@gem_userptr_blits@mmap-offset-invalidate@wb}:
>     - shard-iclb:         [SKIP][22] ([i915#1317]) -> [SKIP][23] +3 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb1/igt@gem_userptr_blits@mmap-offset-invalidate@wb.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb1/igt@gem_userptr_blits@mmap-offset-invalidate@wb.html
> 
>   * {igt@gem_userptr_blits@mmap-offset-invalidate@wc}:
>     - shard-tglb:         [SKIP][24] ([i915#1317]) -> [SKIP][25] +3 similar issues
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-tglb6/igt@gem_userptr_blits@mmap-offset-invalidate@wc.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-tglb5/igt@gem_userptr_blits@mmap-offset-invalidate@wc.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_8062_full and IGTPW_4254_full:
> 
> ### New IGT tests (5) ###
> 
>   * igt@gem_userptr_blits@mmap-offset-invalidate-active:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_userptr_blits@mmap-offset-invalidate-active@uc:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4254_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_isolation@vcs1-nonpriv:
>     - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#112080]) +7 similar issues
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
> 
>   * igt@gem_exec_schedule@implicit-read-write-bsd1:
>     - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109276] / [i915#677]) +2 similar issues
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd1.html
> 
>   * igt@gem_exec_schedule@independent-bsd2:
>     - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109276]) +19 similar issues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html
> 
>   * igt@gem_exec_schedule@preempt-self-bsd:
>     - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#112146]) +2 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb7/igt@gem_exec_schedule@preempt-self-bsd.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb4/igt@gem_exec_schedule@preempt-self-bsd.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-snb:          [PASS][34] -> [DMESG-WARN][35] ([i915#478] / [i915#793])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_userptr_blits@sync-unmap-after-close:
>     - shard-snb:          [PASS][36] -> [DMESG-WARN][37] ([fdo#111870] / [i915#478])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
> 
>   * igt@i915_pm_backlight@fade_with_dpms:
>     - shard-tglb:         [PASS][38] -> [SKIP][39] ([i915#1311])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-tglb6/igt@i915_pm_backlight@fade_with_dpms.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-tglb8/igt@i915_pm_backlight@fade_with_dpms.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-apl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180]) +2 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen:
>     - shard-kbl:          [PASS][42] -> [FAIL][43] ([i915#54])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
>     - shard-apl:          [PASS][44] -> [FAIL][45] ([i915#54])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
>     - shard-hsw:          [PASS][46] -> [DMESG-WARN][47] ([i915#478]) +1 similar issue
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
>     - shard-snb:          [PASS][48] -> [DMESG-WARN][49] ([i915#478])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#46])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-glk4/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-hsw:          [PASS][52] -> [INCOMPLETE][53] ([i915#61])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw7/igt@kms_flip@flip-vs-suspend.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw5/igt@kms_flip@flip-vs-suspend.html
>     - shard-apl:          [PASS][54] -> [INCOMPLETE][55] ([fdo#103927])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-apl2/igt@kms_flip@flip-vs-suspend.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-apl4/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#49])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
>     - shard-kbl:          [PASS][58] -> [DMESG-WARN][59] ([i915#180]) +2 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-x:
>     - shard-glk:          [PASS][60] -> [FAIL][61] ([i915#899]) +1 similar issue
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html
> 
>   * igt@kms_plane_lowres@pipe-b-tiling-x:
>     - shard-apl:          [PASS][62] -> [FAIL][63] ([i915#899])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-apl2/igt@kms_plane_lowres@pipe-b-tiling-x.html
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-apl3/igt@kms_plane_lowres@pipe-b-tiling-x.html
> 
>   * igt@kms_psr@psr2_sprite_render:
>     - shard-iclb:         [PASS][64] -> [SKIP][65] ([fdo#109441])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb1/igt@kms_psr@psr2_sprite_render.html
> 
>   * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
>     - shard-tglb:         [PASS][66] -> [SKIP][67] ([fdo#112015])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
>     - shard-hsw:          [PASS][68] -> [SKIP][69] ([fdo#109271])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
>     - shard-iclb:         [PASS][70] -> [SKIP][71] ([fdo#109278])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
>     - shard-glk:          [PASS][72] -> [SKIP][73] ([fdo#109271])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-glk7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
> 
>   * igt@perf@short-reads:
>     - shard-hsw:          [PASS][74] -> [FAIL][75] ([i915#51])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw5/igt@perf@short-reads.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw5/igt@perf@short-reads.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_persistence@legacy-engines-mixed-process@default:
>     - shard-glk:          [FAIL][76] ([i915#679]) -> [PASS][77]
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk5/igt@gem_ctx_persistence@legacy-engines-mixed-process@default.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-glk3/igt@gem_ctx_persistence@legacy-engines-mixed-process@default.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
>     - shard-glk:          [INCOMPLETE][78] ([i915#58] / [k.org#198133]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk5/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-glk3/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
> 
>   * igt@gem_ctx_shared@exec-single-timeline-bsd:
>     - shard-iclb:         [SKIP][80] ([fdo#110841]) -> [PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
> 
>   * igt@gem_exec_async@concurrent-writes-bsd:
>     - shard-iclb:         [SKIP][82] ([fdo#112146]) -> [PASS][83] +3 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb4/igt@gem_exec_async@concurrent-writes-bsd.html
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb5/igt@gem_exec_async@concurrent-writes-bsd.html
> 
>   * igt@gem_exec_schedule@implicit-read-write-bsd2:
>     - shard-iclb:         [SKIP][84] ([fdo#109276] / [i915#677]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd2.html
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd2.html
> 
>   * igt@gem_exec_schedule@pi-shared-iova-bsd:
>     - shard-iclb:         [SKIP][86] ([i915#677]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html
> 
>   * igt@gem_exec_schedule@preempt-queue-bsd1:
>     - shard-iclb:         [SKIP][88] ([fdo#109276]) -> [PASS][89] +12 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-glk:          [FAIL][90] ([i915#644]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@gem_userptr_blits@sync-unmap:
>     - shard-snb:          [DMESG-WARN][92] ([fdo#111870] / [i915#478]) -> [PASS][93] +1 similar issue
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
>     - shard-hsw:          [DMESG-WARN][94] ([fdo#111870]) -> [PASS][95] +1 similar issue
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw8/igt@gem_userptr_blits@sync-unmap.html
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw1/igt@gem_userptr_blits@sync-unmap.html
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-apl:          [DMESG-WARN][96] ([i915#180]) -> [PASS][97] +4 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-apl7/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-kbl:          [DMESG-WARN][98] ([i915#180]) -> [PASS][99] +4 similar issues
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@i915_pm_rpm@fences:
>     - shard-hsw:          [DMESG-WARN][100] ([i915#478]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw5/igt@i915_pm_rpm@fences.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw7/igt@i915_pm_rpm@fences.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-iclb:         [INCOMPLETE][102] ([i915#189]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_atomic_transition@2x-modeset-transitions-fencing:
>     - shard-hsw:          [INCOMPLETE][104] ([i915#61]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw7/igt@kms_atomic_transition@2x-modeset-transitions-fencing.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-hsw1/igt@kms_atomic_transition@2x-modeset-transitions-fencing.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>     - shard-glk:          [FAIL][106] ([i915#1119]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk9/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-glk3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
>     - shard-snb:          [DMESG-WARN][108] ([i915#478]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
>     - shard-kbl:          [FAIL][110] ([fdo#103375]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
> 
>   * igt@kms_psr@psr2_dpms:
>     - shard-iclb:         [SKIP][112] ([fdo#109441]) -> [PASS][113] +2 similar issues
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb6/igt@kms_psr@psr2_dpms.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb2/igt@kms_psr@psr2_dpms.html
> 
>   * igt@perf_pmu@busy-accuracy-98-vcs1:
>     - shard-iclb:         [SKIP][114] ([fdo#112080]) -> [PASS][115] +11 similar issues
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb6/igt@perf_pmu@busy-accuracy-98-vcs1.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb2/igt@perf_pmu@busy-accuracy-98-vcs1.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_schedule@pi-userfault-bsd1:
>     - shard-iclb:         [INCOMPLETE][116] -> [SKIP][117] ([fdo#109276])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd1.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd1.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-tglb:         [FAIL][118] -> [SKIP][119] ([i915#468])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-kbl:          [DMESG-WARN][120] ([i915#180]) -> [INCOMPLETE][121] ([fdo#103665] / [i915#600])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl6/igt@kms_flip@flip-vs-suspend.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-kbl3/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@runner@aborted:
>     - shard-snb:          ([FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136]) ([fdo#111870] / [i915#1077])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb2/igt@runner@aborted.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@runner@aborted.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb6/igt@runner@aborted.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb6/igt@runner@aborted.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@runner@aborted.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@runner@aborted.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb6/igt@runner@aborted.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb2/igt@runner@aborted.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb2/igt@runner@aborted.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb4/igt@runner@aborted.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb4/igt@runner@aborted.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb6/igt@runner@aborted.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb5/igt@runner@aborted.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb5/igt@runner@aborted.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/shard-snb6/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
>   [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
>   [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
>   [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
>   [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
>   [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
>   [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
>   [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
>   [i915#1311]: https://gitlab.freedesktop.org/drm/intel/issues/1311
>   [i915#1317]: https://gitlab.freedesktop.org/drm/intel/issues/1317
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
>   [i915#226]: https://gitlab.freedesktop.org/drm/intel/issues/226
>   [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
>   [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
>   [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
>   [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>   [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
>   [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
>   [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
>   [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
>   [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
>   [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
>   [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
>   [i915#793]: https://gitlab.freedesktop.org/drm/intel/issues/793
>   [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
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
>   * IGT: IGT_5490 -> IGTPW_4254
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_8062: 9c57d926e26eb7f9ededcdf356aef74b135af03e @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4254: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/index.html
>   IGT_5490: f98b33cbd5b57bae52b8e2fae2039e89ac877822 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4254/index.html

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
