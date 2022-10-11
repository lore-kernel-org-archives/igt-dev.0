Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D36D10E514
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 09:02:55 +0000 (UTC)
Date: Tue, 11 Oct 2022 11:02:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0UxM0bZFwZTuklD@kamilkon-desk1>
References: <20221007220221.3189750-1-jfree@freebsd.org>
 <166534080833.23515.15377650043227017257@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166534080833.23515.15377650043227017257@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fmmap=5F*=3A_Add_NULL_to_ptrace=28=29_calls_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>,
 Jake Freeland <jake@technologyfriends.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On 2022-10-09 at 18:40:08 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/i915/gem_mmap_*: Add NULL to ptrace() calls (rev2)
> URL   : https://patchwork.freedesktop.org/series/109495/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12226_full -> IGTPW_7930_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7930_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7930_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/index.html
> 
> Participating hosts (9 -> 6)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7930_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-suspend:
>     - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-tglb5/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
> 

These are unrelated to changes in
 tests/i915/gem_mmap_gtt.c
 tests/i915/gem_mmap_offset.c

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7930_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_busy@close-race:
>     - shard-snb:          [PASS][3] -> [TIMEOUT][4] ([i915#5748])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-snb7/igt@gem_busy@close-race.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-snb5/igt@gem_busy@close-race.html
> 
>   * igt@gem_ccs@block-copy-inplace:
>     - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#3555] / [i915#5325])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb2/igt@gem_ccs@block-copy-inplace.html
>     - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#5327])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb7/igt@gem_ccs@block-copy-inplace.html
> 
>   * igt@gem_ctx_persistence@engines-cleanup:
>     - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +2 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-snb7/igt@gem_ctx_persistence@engines-cleanup.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2842])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
>     - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271]) +68 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-snb4/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-iclb:         NOTRUN -> [SKIP][11] ([fdo#109313])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>     - shard-tglb:         NOTRUN -> [SKIP][12] ([fdo#109313])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-iclb:         NOTRUN -> [SKIP][13] ([fdo#112283])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb1/igt@gem_exec_params@secure-non-root.html
>     - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#112283])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb5/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gen7_exec_parse@basic-offset:
>     - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#109289])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb8/igt@gen7_exec_parse@basic-offset.html
>     - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#109289])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb1/igt@gen7_exec_parse@basic-offset.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#5566] / [i915#716])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-glk3/igt@gen9_exec_parse@allowed-single.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-glk2/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@unaligned-access:
>     - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#2527] / [i915#2856])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb8/igt@gen9_exec_parse@unaligned-access.html
>     - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#2856])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb3/igt@gen9_exec_parse@unaligned-access.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([i915#4528])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-iclb:         [PASS][23] -> [SKIP][24] ([i915#4281])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#109303])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb2/igt@i915_query@query-topology-known-pci-ids.html
>     - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109303])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb7/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@kms_3d:
>     - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#118] / [i915#1888])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-glk2/igt@kms_3d.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-glk1/igt@kms_3d.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#111614])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>     - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#110725] / [fdo#111614])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111615])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#3689] / [i915#6095])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#6095]) +1 similar issue
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109278] / [i915#3886]) +1 similar issue
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
>     - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3886]) +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-apl7/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
>     - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3886]) +1 similar issue
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-glk8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109278]) +5 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb2/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_chamelium@dp-audio:
>     - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109284] / [fdo#111827]) +4 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb3/igt@kms_chamelium@dp-audio.html
> 
>   * igt@kms_chamelium@dp-hpd-fast:
>     - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827]) +4 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb3/igt@kms_chamelium@dp-hpd-fast.html
> 
>   * igt@kms_chamelium@hdmi-crc-fast:
>     - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +4 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-glk9/igt@kms_chamelium@hdmi-crc-fast.html
> 
>   * igt@kms_color_chamelium@ctm-red-to-blue:
>     - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +4 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-apl3/igt@kms_color_chamelium@ctm-red-to-blue.html
>     - shard-snb:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-snb4/igt@kms_color_chamelium@ctm-red-to-blue.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109274])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
>     - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109274] / [fdo#111825] / [i915#3637])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#2122])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a1-hdmi-a2.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-glk9/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
>     - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +1 similar issue
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#2587] / [i915#2672]) +1 similar issue
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#2672] / [i915#3555]) +1 similar issue
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#2672]) +4 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#6497]) +2 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
>     - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271]) +25 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-glk7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109280]) +4 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
>     - shard-iclb:         [PASS][55] -> [FAIL][56] ([i915#1888])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109280] / [fdo#111825]) +3 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-iclb:         [PASS][58] -> [SKIP][59] ([i915#433])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb3/igt@kms_hdmi_inject@inject-audio.html
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html
>     - shard-snb:          [PASS][60] -> [SKIP][61] ([fdo#109271])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-snb6/igt@kms_hdmi_inject@inject-audio.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-snb4/igt@kms_hdmi_inject@inject-audio.html
>     - shard-tglb:         [PASS][62] -> [SKIP][63] ([i915#433])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3555]) +1 similar issue
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb3/igt@kms_hdr@static-swap.html
>     - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#3555])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb8/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_psr@psr2_cursor_plane_onoff:
>     - shard-tglb:         NOTRUN -> [FAIL][66] ([i915#132] / [i915#3467])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb1/igt@kms_psr@psr2_cursor_plane_onoff.html
>     - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109441])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html
> 
>   * igt@kms_psr@psr2_cursor_render:
>     - shard-iclb:         [PASS][68] -> [SKIP][69] ([fdo#109441]) +1 similar issue
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
> 
>   * igt@kms_selftest@all:
>     - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271]) +25 similar issues
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-apl7/igt@kms_selftest@all.html
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#6433])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb1/igt@kms_selftest@all.html
>     - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#6433])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb7/igt@kms_selftest@all.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#109309])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb1/igt@kms_tv_load_detect@load-detect.html
>     - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109309])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb1/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vblank@pipe-d-wait-idle:
>     - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#533])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html
>     - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#533])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-glk8/igt@kms_vblank@pipe-d-wait-idle.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_balancer@parallel-bb-first:
>     - shard-iclb:         [SKIP][77] ([i915#4525]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglb:         [FAIL][79] ([i915#2842]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          [FAIL][81] ([i915#2842]) -> [PASS][82] +1 similar issue
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@i915_pm_rps@engine-order:
>     - shard-apl:          [FAIL][83] ([i915#6537]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-apl6/igt@i915_pm_rps@engine-order.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-apl7/igt@i915_pm_rps@engine-order.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-snb:          [INCOMPLETE][85] ([i915#6992]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-snb6/igt@i915_selftest@live@hangcheck.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-snb4/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
>     - shard-glk:          [FAIL][87] ([i915#79]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
>     - shard-iclb:         [SKIP][89] ([i915#5235]) -> [PASS][90] +2 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +2 similar issues
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-iclb:         [SKIP][93] ([i915#658]) -> [SKIP][94] ([i915#588])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-iclb:         [SKIP][95] ([i915#2920]) -> [SKIP][96] ([fdo#111068] / [i915#658])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-iclb:         [SKIP][97] ([fdo#111068] / [i915#658]) -> [SKIP][98] ([i915#2920]) +1 similar issue
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-iclb:         [SKIP][99] ([i915#2920]) -> [SKIP][100] ([i915#658])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][101], [FAIL][102]) ([i915#3002] / [i915#4312]) -> ([FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106]) ([i915#180] / [i915#3002] / [i915#4312])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-apl2/igt@runner@aborted.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/shard-apl6/igt@runner@aborted.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-apl6/igt@runner@aborted.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-apl1/igt@runner@aborted.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-apl1/igt@runner@aborted.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/shard-apl3/igt@runner@aborted.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5748]: https://gitlab.freedesktop.org/drm/intel/issues/5748
>   [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6992]: https://gitlab.freedesktop.org/drm/intel/issues/6992
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7003 -> IGTPW_7930
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_12226: bcc9e3eb1e7ba32651eae68b842df07db01e63be @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7930: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/index.html
>   IGT_7003: 1ea9ec5e7295fbc1cb784be4692971fd342bea53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/index.html
