Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9279E10E50D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 18:32:21 +0000 (UTC)
Date: Thu, 12 Oct 2023 20:31:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231012183151.m2t7ykrdjqiv2fqc@kamilkon-desk.igk.intel.com>
References: <20231002142023.713415-1-hersenxs.wu@amd.com>
 <169712890100.25005.3437616108870757413@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169712890100.25005.3437616108870757413@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Fix_test_intermittent_failures_on_AMD_gpu?=
 =?utf-8?q?_=28rev9=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below failures are not related to kms_cursor_crc, no need
for respin of tests.

Regards,
Kamil

On 2023-10-12 at 16:41:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_cursor_crc: Fix test intermittent failures on AMD gpu (rev9)
> URL   : https://patchwork.freedesktop.org/series/124524/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13741_full -> IGTPW_9982_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9982_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9982_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9982_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_schedule@fairslice:
>     - shard-dg1:          NOTRUN -> [SKIP][1] +6 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@gem_exec_schedule@fairslice.html
> 
>   * igt@gem_exec_schedule@manyslice@bcs0:
>     - shard-dg1:          [PASS][2] -> [FAIL][3] +3 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-12/igt@gem_exec_schedule@manyslice@bcs0.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@gem_exec_schedule@manyslice@bcs0.html
> 
>   * igt@gem_softpin@allocator-fork:
>     - shard-dg1:          [PASS][4] -> [SKIP][5] +8 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-19/igt@gem_softpin@allocator-fork.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@gem_softpin@allocator-fork.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_reloc@basic-wc-cpu-active:
>     - shard-dg1:          [SKIP][6] ([i915#3281]) -> [SKIP][7] +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-19/igt@gem_exec_reloc@basic-wc-cpu-active.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@gem_exec_reloc@basic-wc-cpu-active.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>     - shard-dg1:          [SKIP][8] ([i915#4538] / [i915#5286]) -> [SKIP][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg1:          [SKIP][10] ([fdo#111615]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-dg1:          [SKIP][12] ([i915#7828]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-14/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-dg1:          [SKIP][14] ([i915#3555]) -> [SKIP][15] +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-32x32.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg1:          [SKIP][16] ([fdo#111825]) -> [SKIP][17] +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>     - shard-dg1:          [SKIP][18] ([i915#8708]) -> [SKIP][19] +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-dg1:          [SKIP][20] ([i915#3458]) -> [SKIP][21] +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-dg1:          [SKIP][22] ([i915#1072] / [i915#4078]) -> [SKIP][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-16/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc}:
>     - shard-rkl:          NOTRUN -> [SKIP][24] +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html
> 
>   * {igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf-tiled-ccs}:
>     - shard-dg1:          [SKIP][25] ([i915#5354] / [i915#6095]) -> [SKIP][26] +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-14/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf-tiled-ccs.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf-tiled-ccs.html
> 
>   * {igt@kms_feature_discovery@display}:
>     - shard-dg1:          [PASS][27] -> [SKIP][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-13/igt@kms_feature_discovery@display.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_feature_discovery@display.html
> 
>   * {igt@kms_pm_rpm@modeset-pc8-residency-stress}:
>     - shard-dg1:          NOTRUN -> [SKIP][29] +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@kms_pm_rpm@modeset-pc8-residency-stress.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_13741_full and IGTPW_9982_full:
> 
> ### New IGT tests (35) ###
> 
>   * igt@gem_ctx_shared@drrs-1p-primscrn-shrfb-msflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_ctx_shared@pipe-c-wait-idle-hang:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_ctx_shared@pipe-c-wait-idle-hang@vcs0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_ctx_shared@pipe-c-wait-idle-hang@vcs1:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_ctx_shared@pipe-c-wait-idle-hang@vecs0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_ctx_shared@pixel-format-source-clamping:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_ctx_shared@pixel-format-source-clamping@pipe-a-planes:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_ctx_shared@pixel-format-source-clamping@pipe-b-planes:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_ctx_shared@psrdrrs-rgb101010-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_ctx_shared@psrdrrs-rgb101010-draw-blt@bcs0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_eio@wait-wedge-immediate@pipe-d-hdmi-a-4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_pxp@psrdrrs-2p-primscrn-shrfb-plflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@modeset-vs-vblank-race:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@modeset-vs-vblank-race@a-hdmi-a4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@modeset-vs-vblank-race@b-hdmi-a4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@modeset-vs-vblank-race@c-hdmi-a4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@pipe-d-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@pipe-d-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@bcs0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@pipe-d-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@vcs0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@plane-downscale-factor-0-5-with-rotation:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@plane-downscale-factor-0-5-with-rotation@pipe-b-hdmi-a-4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@plane-downscale-factor-0-5-with-rotation@pipe-c-hdmi-a-4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@plane-downscale-factor-0-5-with-rotation@pipe-d-hdmi-a-4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@plane-downscale-factor-0-5-with-rotation@vcs1:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_hangman@plane-downscale-factor-0-5-with-rotation@vecs0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@cursor-random-256x85:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@cursor-random-256x85@pipe-a-hdmi-a-4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_vblank@blob-prop-core:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@prime_self_import@int-max-clock:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@prime_self_import@int-max-clock@hdmi-a-4-pipe-a:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@prime_self_import@int-max-clock@hdmi-a-4-pipe-b:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@prime_self_import@int-max-clock@hdmi-a-4-pipe-c:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@prime_self_import@int-max-clock@hdmi-a-4-pipe-d:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@testdisplay@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9982_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#8411]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6230])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@api_intel_bb@crc32.html
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#8411])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#7701]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@device_reset@cold-reset-bound.html
> 
>   * igt@drm_fdinfo@idle@rcs0:
>     - shard-rkl:          [PASS][34] -> [FAIL][35] ([i915#7742])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-rkl-1/igt@drm_fdinfo@idle@rcs0.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@drm_fdinfo@idle@rcs0.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@bcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#8414]) +4 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@drm_fdinfo@most-busy-check-all@bcs0.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
>     - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#8414]) +33 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html
> 
>   * igt@gem_bad_reloc@negative-reloc-lut:
>     - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#3281]) +16 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#9323])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#4098] / [i915#9323])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#7697]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [PASS][42] -> [FAIL][43] ([i915#6268])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@engines-hostile@vcs0:
>     - shard-mtlp:         [PASS][44] -> [FAIL][45] ([i915#2410]) +2 other tests fail
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-7/igt@gem_ctx_persistence@engines-hostile@vcs0.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-6/igt@gem_ctx_persistence@engines-hostile@vcs0.html
> 
>   * igt@gem_ctx_persistence@heartbeat-close:
>     - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#8555]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-close.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#280])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-2/igt@gem_ctx_sseu@mmap-args.html
>     - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#280])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-3/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@kms:
>     - shard-dg1:          NOTRUN -> [FAIL][49] ([i915#5784])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-13/igt@gem_eio@kms.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [PASS][50] -> [FAIL][51] ([i915#5784])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-19/igt@gem_eio@reset-stress.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-16/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-false-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4812]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@gem_exec_balancer@bonded-false-hang.html
> 
>   * igt@gem_exec_balancer@bonded-semaphore:
>     - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4812])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-2/igt@gem_exec_balancer@bonded-semaphore.html
> 
>   * igt@gem_exec_balancer@hang:
>     - shard-mtlp:         [PASS][54] -> [ABORT][55] ([i915#8104] / [i915#8865])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-5/igt@gem_exec_balancer@hang.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-8/igt@gem_exec_balancer@hang.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4036])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#8555])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@gem_exec_balancer@noheartbeat.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4525]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#6334])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#6344])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_capture@pi@vcs0:
>     - shard-mtlp:         [PASS][61] -> [FAIL][62] ([i915#4475])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-8/igt@gem_exec_capture@pi@vcs0.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-4/igt@gem_exec_capture@pi@vcs0.html
> 
>   * igt@gem_exec_fair@basic-none@bcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][63] ([i915#2842]) +4 other tests fail
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-10/igt@gem_exec_fair@basic-none@bcs0.html
> 
>   * igt@gem_exec_fair@basic-pace:
>     - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3539])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-19/igt@gem_exec_fair@basic-pace.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-rkl:          NOTRUN -> [FAIL][65] ([i915#2842]) +4 other tests fail
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_fair@basic-throttle:
>     - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3539]) +3 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3539] / [i915#4852]) +7 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-wb:
>     - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#7697])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-rkl:          NOTRUN -> [SKIP][70] ([fdo#109283])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@gem_exec_params@rsvd2-dirt.html
>     - shard-dg1:          NOTRUN -> [SKIP][71] ([fdo#109283])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_reloc@basic-write-read:
>     - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3281]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@gem_exec_reloc@basic-write-read.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3281]) +20 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4537] / [i915#4812])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts:
>     - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4812])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-19/igt@gem_exec_schedule@preempt-queue-contexts.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-tglu:         [PASS][76] -> [INCOMPLETE][77] ([i915#8797])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-tglu-7/igt@gem_exec_suspend@basic-s0@smem.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-9/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_fenced_exec_thrash@2-spare-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4860]) +3 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4860])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#4613] / [i915#7582])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#4613]) +6 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#4613])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-6/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4613]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-3/igt@gem_lmem_swapping@verify-random-ccs.html
> 
>   * igt@gem_madvise@dontneed-before-exec:
>     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3282])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-7/igt@gem_madvise@dontneed-before-exec.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#8289])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4077]) +2 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>     - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4077]) +24 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
> 
>   * igt@gem_mmap_wc@bad-object:
>     - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4083]) +11 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@gem_mmap_wc@bad-object.html
> 
>   * igt@gem_mmap_wc@write-prefaulted:
>     - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#4083])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-6/igt@gem_mmap_wc@write-prefaulted.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3282]) +11 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads.html
>     - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3282]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_pread@snoop:
>     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3282]) +10 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@gem_pread@snoop.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#4270])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-4/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>     - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4270]) +6 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-3:
>     - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#4270]) +4 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-3.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#4270])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-1/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-linear:
>     - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#8428])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-6/igt@gem_render_copy@y-tiled-ccs-to-linear.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4079])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-2/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4885])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_sync@basic-store-all:
>     - shard-mtlp:         [PASS][100] -> [ABORT][101] ([i915#9262]) +1 other test abort
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-4/igt@gem_sync@basic-store-all.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-2/igt@gem_sync@basic-store-all.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
>     - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#4077])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-1/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_tiled_pread_basic:
>     - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4079])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@gem_tiled_pread_basic.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-tglu:         NOTRUN -> [SKIP][104] ([fdo#110542])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-2/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#3297]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#3297]) +4 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3297] / [i915#4880]) +2 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#3297] / [i915#4958])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3297]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-19/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gem_userptr_blits@vma-merge:
>     - shard-dg2:          NOTRUN -> [FAIL][110] ([i915#3318])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@gem_userptr_blits@vma-merge.html
> 
>   * igt@gen7_exec_parse@bitmasks:
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([fdo#109289]) +1 other test skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@gen7_exec_parse@bitmasks.html
> 
>   * igt@gen9_exec_parse@batch-without-end:
>     - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#2527])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-17/igt@gen9_exec_parse@batch-without-end.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#2527]) +6 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#2856]) +7 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@gen9_exec_parse@bb-start-param.html
>     - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#2527] / [i915#2856])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-3/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@i915_fb_tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4881])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@i915_fb_tiling.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([fdo#109506])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#6621])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html
>     - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#6621])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-1/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#4387])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@i915_pm_sseu@full-enable.html
>     - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#4387])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4215] / [i915#5190])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#4212]) +1 other test skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
>     - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4212])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-13/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][125] ([i915#8247]) +3 other tests fail
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][126] ([i915#8247]) +3 other tests fail
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#404])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#404])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-13/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#5286]) +10 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#4538] / [i915#5286]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-tglu:         NOTRUN -> [SKIP][131] ([fdo#111615] / [i915#5286]) +2 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [PASS][132] -> [FAIL][133] ([i915#5138])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][134] ([fdo#111614]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-3/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][135] ([fdo#111614])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#3638])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][137] ([fdo#111614]) +12 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#5190]) +31 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][139] ([fdo#111614] / [i915#3638]) +7 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5190]) +10 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][141] ([fdo#110723]) +5 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4538]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][143] ([fdo#111615])
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([fdo#111615])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#6187])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         NOTRUN -> [SKIP][146] ([fdo#111615]) +2 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#2705])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#2705]) +1 other test skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-6/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#3742])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_cdclk@mode-transition.html
>     - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#3742])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-4/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#4087] / [i915#7213])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([fdo#111827]) +3 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-rkl:          NOTRUN -> [SKIP][153] ([fdo#111827]) +1 other test skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#7828]) +2 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#7828]) +20 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#7828]) +1 other test skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#7828]) +14 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#7828]) +2 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7118]) +1 other test skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3299])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#3555] / [i915#6944])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-7/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][162] ([fdo#109279] / [i915#3359])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-max-size:
>     - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#3555])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3359]) +2 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#3359]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#3359])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#3555]) +8 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-32x10.html
>     - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3555]) +3 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3359])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-tglu:         NOTRUN -> [SKIP][170] ([fdo#109274])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#3546])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#4103] / [i915#4213] / [i915#5608])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#4103])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][174] ([fdo#111825]) +9 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-rkl:          NOTRUN -> [SKIP][175] ([fdo#111767] / [fdo#111825]) +1 other test skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][176] ([fdo#109274] / [i915#5354]) +10 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-apl:          [PASS][177] -> [FAIL][178] ([i915#2346])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#4103])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#9227])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html
>     - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#9227])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html
> 
>   * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#9226] / [i915#9261]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html
>     - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#9226] / [i915#9261]) +1 other test skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#8588])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#8588])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-12/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#3804])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#1257])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#8812])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#3555] / [i915#3840])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-6/igt@kms_dsc@dsc-basic.html
>     - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#3555] / [i915#3840])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#3555] / [i915#3840])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3469])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][193] ([fdo#110189] / [i915#3955])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([fdo#109274] / [fdo#111767])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#8381]) +2 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg2:          NOTRUN -> [SKIP][196] ([fdo#109274]) +8 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#2672]) +8 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#2672]) +5 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#2672])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#2587] / [i915#2672]) +1 other test skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#2672] / [i915#3555]) +1 other test skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#2672] / [i915#3555])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>     - shard-dg2:          NOTRUN -> [FAIL][203] ([i915#6880])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#5354]) +59 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][205] ([fdo#109280]) +9 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][206] ([fdo#111825]) +11 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#5439])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>     - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#3023]) +37 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#3458]) +4 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-glk:          NOTRUN -> [SKIP][210] ([fdo#109271]) +3 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#8708]) +36 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][212] ([fdo#111825] / [i915#1825]) +56 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][213] ([fdo#110189]) +9 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#1825]) +6 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>     - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#3458]) +34 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#8708])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#6118])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglu:         [PASS][218] -> [SKIP][219] ([i915#433])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-tglu-10/igt@kms_hdmi_inject@inject-audio.html
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-10/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8228])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-6/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#3555] / [i915#8228])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#8228]) +3 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#4816])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#6301]) +1 other test skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-5/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#6301])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-dg2:          NOTRUN -> [SKIP][227] ([fdo#109289]) +9 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
>     - shard-mtlp:         NOTRUN -> [SKIP][228] ([fdo#109289])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-4/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][229] ([i915#8841]) +1 other test dmesg-warn
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-snb1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
>     - shard-apl:          [PASS][230] -> [INCOMPLETE][231] ([i915#180] / [i915#9392])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256:
>     - shard-mtlp:         [PASS][232] -> [ABORT][233] ([i915#9414])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-4/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256.html
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-3/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#8821])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#3555]) +10 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [FAIL][236] ([i915#8292])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#5176] / [i915#9423]) +1 other test skip
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:
>     - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#5235]) +23 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-snb:          NOTRUN -> [SKIP][239] ([fdo#109271]) +25 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-snb1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#5235]) +3 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#5235]) +3 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#6524] / [i915#6805])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#658]) +4 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-6/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#658]) +1 other test skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-rkl:          NOTRUN -> [SKIP][245] ([fdo#111068] / [i915#658]) +2 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg1:          NOTRUN -> [SKIP][246] ([fdo#111068] / [i915#658]) +1 other test skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-19/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@cursor_blt:
>     - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#1072]) +11 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_psr@cursor_blt.html
> 
>   * igt@kms_psr@cursor_plane_move:
>     - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#1072] / [i915#4078]) +2 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-18/igt@kms_psr@cursor_plane_move.html
> 
>   * igt@kms_psr@psr2_dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#1072]) +11 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@kms_psr@psr2_dpms.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#5461] / [i915#658])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#5461] / [i915#658]) +1 other test skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#5289])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#4235] / [i915#5190])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-rkl:          NOTRUN -> [SKIP][254] ([fdo#111615] / [i915#5289])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#4235]) +3 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][256] ([i915#8875])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#3555] / [i915#4098]) +1 other test skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3555] / [i915#4098])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-2/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#8623]) +1 other test skip
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#8623])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-tglu:         NOTRUN -> [SKIP][261] ([fdo#109309])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-5/igt@kms_tv_load_detect@load-detect.html
>     - shard-mtlp:         NOTRUN -> [SKIP][262] ([fdo#109309])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-4/igt@kms_tv_load_detect@load-detect.html
>     - shard-dg2:          NOTRUN -> [SKIP][263] ([fdo#109309])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@kms_tv_load_detect@load-detect.html
>     - shard-rkl:          NOTRUN -> [SKIP][264] ([fdo#109309])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
>     - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#4070] / [i915#6768]) +10 other tests skip
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
> 
>   * igt@kms_vblank@pipe-d-wait-idle-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#4070] / [i915#533] / [i915#6768]) +4 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_vblank@pipe-d-wait-idle-hang.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#2437]) +1 other test skip
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#2437]) +1 other test skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-2/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#2437])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-7/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#2436])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#2434])
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-2/igt@perf@mi-rpc.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          [PASS][272] -> [FAIL][273] ([i915#7484])
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@bcs0:
>     - shard-mtlp:         [PASS][274] -> [FAIL][275] ([i915#4349])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-5/igt@perf_pmu@busy-double-start@bcs0.html
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vcs1:
>     - shard-dg1:          [PASS][276] -> [FAIL][277] ([i915#4349]) +5 other tests fail
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-13/igt@perf_pmu@busy-double-start@vcs1.html
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-12/igt@perf_pmu@busy-double-start@vcs1.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          NOTRUN -> [FAIL][278] ([i915#4349]) +3 other tests fail
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@faulting-read@gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#8440])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-2/igt@perf_pmu@faulting-read@gtt.html
> 
>   * igt@perf_pmu@frequency@gt0:
>     - shard-dg2:          NOTRUN -> [FAIL][280] ([i915#6806])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@perf_pmu@frequency@gt0.html
> 
>   * igt@prime_udl:
>     - shard-dg2:          NOTRUN -> [SKIP][281] ([fdo#109291])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@prime_udl.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#3291] / [i915#3708])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-10/igt@prime_vgem@basic-write.html
>     - shard-rkl:          NOTRUN -> [SKIP][283] ([fdo#109295] / [i915#3291] / [i915#3708])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@prime_vgem@basic-write.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#3708] / [i915#4077]) +1 other test skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][285] ([fdo#109295] / [i915#3708])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#3708])
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-2/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@sysfs_preempt_timeout@timeout@vecs0:
>     - shard-mtlp:         [PASS][287] -> [ABORT][288] ([i915#8521] / [i915#8865])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-8/igt@sysfs_preempt_timeout@timeout@vecs0.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-6/igt@sysfs_preempt_timeout@timeout@vecs0.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#4818])
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html
> 
>   * igt@v3d/v3d_perfmon@get-values-valid-perfmon:
>     - shard-tglu:         NOTRUN -> [SKIP][290] ([fdo#109315] / [i915#2575]) +2 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-10/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html
> 
>   * igt@v3d/v3d_submit_cl@bad-multisync-out-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#2575]) +20 other tests skip
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-11/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html
> 
>   * igt@v3d/v3d_submit_cl@simple-flush-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][292] ([fdo#109315]) +17 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-6/igt@v3d/v3d_submit_cl@simple-flush-cache.html
> 
>   * igt@v3d/v3d_submit_csd@bad-pad:
>     - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#2575]) +3 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-14/igt@v3d/v3d_submit_csd@bad-pad.html
> 
>   * igt@v3d/v3d_wait_bo@unused-bo-0ns:
>     - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#2575]) +2 other tests skip
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-1/igt@v3d/v3d_wait_bo@unused-bo-0ns.html
> 
>   * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
>     - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#2575]) +3 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-7/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html
> 
>   * igt@vc4/vc4_perfmon@create-perfmon-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#7711])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-2/igt@vc4/vc4_perfmon@create-perfmon-0.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-purgeable:
>     - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#7711]) +11 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-1/igt@vc4/vc4_purgeable_bo@mark-purgeable.html
> 
>   * igt@vc4/vc4_tiling@get-bad-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#7711]) +15 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg2-1/igt@vc4/vc4_tiling@get-bad-modifier.html
>     - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#7711]) +2 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-12/igt@vc4/vc4_tiling@get-bad-modifier.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][300] ([i915#5784]) -> [PASS][301]
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-13/igt@gem_eio@unwedge-stress.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-15/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglu:         [FAIL][302] ([i915#2842]) -> [PASS][303] +1 other test pass
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-tglu-6/igt@gem_exec_fair@basic-flow@rcs0.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-9/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-glk:          [FAIL][304] ([i915#2842]) -> [PASS][305]
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@bcs0:
>     - shard-rkl:          [FAIL][306] ([i915#2842]) -> [PASS][307]
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [TIMEOUT][308] ([i915#5493]) -> [PASS][309]
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-mtlp:         [ABORT][310] ([i915#8489] / [i915#8668]) -> [PASS][311]
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>     - shard-dg1:          [FAIL][312] ([i915#3591]) -> [PASS][313] +1 other test pass
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-mtlp:         [FAIL][314] ([i915#5138]) -> [PASS][315]
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         [FAIL][316] ([i915#3743]) -> [PASS][317] +1 other test pass
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-apl:          [FAIL][318] ([i915#2346]) -> [PASS][319]
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@single-move@all-pipes:
>     - shard-mtlp:         [DMESG-WARN][320] ([i915#2017]) -> [PASS][321]
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-5/igt@kms_cursor_legacy@single-move@all-pipes.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64:
>     - shard-mtlp:         [ABORT][322] ([i915#9414]) -> [PASS][323] +1 other test pass
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-2/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-1/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64.html
> 
>   * {igt@kms_pm_rpm@modeset-lpsp}:
>     - shard-rkl:          [SKIP][324] ([i915#9519]) -> [PASS][325]
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * {igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4}:
>     - shard-dg1:          [FAIL][326] ([i915#9196]) -> [PASS][327]
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-16/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-16/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-tglu:         [FAIL][328] ([i915#9196]) -> [PASS][329]
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all@rcs0:
>     - shard-dg1:          [FAIL][330] ([i915#5234]) -> [PASS][331]
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-dg1-13/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
> 
>   * igt@sysfs_timeslice_duration@timeout@vecs0:
>     - shard-mtlp:         [TIMEOUT][332] ([i915#9516]) -> [PASS][333]
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-mtlp-6/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-mtlp-5/igt@sysfs_timeslice_duration@timeout@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-rkl:          [SKIP][334] ([fdo#109285] / [i915#4098]) -> [SKIP][335] ([fdo#109285])
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6118]: https://gitlab.freedesktop.org/drm/intel/issues/6118
>   [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
>   [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
>   [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#8104]: https://gitlab.freedesktop.org/drm/intel/issues/8104
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8289]: https://gitlab.freedesktop.org/drm/intel/issues/8289
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8440]: https://gitlab.freedesktop.org/drm/intel/issues/8440
>   [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
>   [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8797]: https://gitlab.freedesktop.org/drm/intel/issues/8797
>   [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
>   [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
>   [i915#8875]: https://gitlab.freedesktop.org/drm/intel/issues/8875
>   [i915#9067]: https://gitlab.freedesktop.org/drm/intel/issues/9067
>   [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
>   [i915#9226]: https://gitlab.freedesktop.org/drm/intel/issues/9226
>   [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227
>   [i915#9261]: https://gitlab.freedesktop.org/drm/intel/issues/9261
>   [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
>   [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
>   [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
>   [i915#9392]: https://gitlab.freedesktop.org/drm/intel/issues/9392
>   [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
>   [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
>   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/intel/issues/9433
>   [i915#9516]: https://gitlab.freedesktop.org/drm/intel/issues/9516
>   [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7532 -> IGTPW_9982
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_13741: 46d442e3684a03ccb1bc9e9822acdd33f264d521 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9982: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/index.html
>   IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9982/index.html
