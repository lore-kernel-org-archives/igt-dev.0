Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CCC6F8AD
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Nov 2021 08:46:12 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 19 Nov 2021 09:46:05 +0100
Message-ID: <2082523.irdbgypaU6@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <163725785600.10079.14264459625271780764@emeril.freedesktop.org>
References: <20211118084140.120777-1-janusz.krzysztofik@linux.intel.com>
 <163725785600.10079.14264459625271780764@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Show_device_PCI_bus_address_on_errors?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thursday, 18 November 2021 18:50:56 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_hotunplug: Show device PCI bus address on errors
> URL   : https://patchwork.freedesktop.org/series/97057/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10898_full -> IGTPW_6413_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6413_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6413_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/index.html
> 
> Participating hosts (11 -> 7)
> ------------------------------
> 
>   Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6413_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>     - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

Not the test modified by the change -- looks like a false positive.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6413_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@feature_discovery@display-4x:
>     - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#1839])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb3/igt@feature_discovery@display-4x.html
>     - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#1839])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb6/igt@feature_discovery@display-4x.html
> 
>   * igt@gem_create@create-massive:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][5] ([i915#3002])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl2/igt@gem_create@create-massive.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-tglb:         NOTRUN -> [SKIP][6] ([fdo#109314])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb5/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#280])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_exec_balancer@parallel-keep-in-fence:
>     - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#4525]) +1 similar issue
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb5/igt@gem_exec_balancer@parallel-keep-in-fence.html
> 
>   * igt@gem_exec_capture@pi@rcs0:
>     - shard-iclb:         [PASS][9] -> [INCOMPLETE][10] ([i915#2369])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-iclb6/igt@gem_exec_capture@pi@rcs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb2/igt@gem_exec_capture@pi@rcs0.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2842])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2842]) +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
>     - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2842])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
>     - shard-tglb:         NOTRUN -> [FAIL][15] ([i915#2842])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-kbl:          NOTRUN -> [FAIL][16] ([i915#2842])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842]) +2 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-glk5/igt@gem_exec_fair@basic-pace@vecs0.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk5/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_params@no-blt:
>     - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109283])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb6/igt@gem_exec_params@no-blt.html
>     - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109283])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb5/igt@gem_exec_params@no-blt.html
> 
>   * igt@gem_exec_whisper@basic-fds-forked-all:
>     - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#118])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-glk4/igt@gem_exec_whisper@basic-fds-forked-all.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk3/igt@gem_exec_whisper@basic-fds-forked-all.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#4555])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb1/igt@gem_lmem_swapping@heavy-random.html
>     - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#4555] / [i915#4565])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb6/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi:
>     - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#4555])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-multi.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#644])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#4270])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#768])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#3297])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen7_exec_parse@oacontrol-tracking:
>     - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109289]) +2 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb5/igt@gen7_exec_parse@oacontrol-tracking.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#2856]) +2 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#2856]) +1 similar issue
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb3/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>     - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#1937])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-tglb:         NOTRUN -> [WARN][35] ([i915#2681] / [i915#2684])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110892])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111644] / [i915#1397] / [i915#2411])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#4387])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb3/igt@i915_pm_sseu@full-enable.html
>     - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#4387])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb6/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-tglb:         [PASS][40] -> [INCOMPLETE][41] ([i915#456])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-tglb8/igt@i915_suspend@fence-restore-untiled.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110725] / [fdo#111614])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111614]) +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3777])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#110723])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615]) +3 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3689] / [i915#3886]) +5 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb3/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
>     - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886]) +3 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +6 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111615] / [i915#3689]) +2 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>     - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3886]) +9 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [i915#3886]) +3 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3689]) +2 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>     - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278]) +10 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb3/igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3742])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium@dp-hpd-fast:
>     - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-snb5/igt@kms_chamelium@dp-hpd-fast.html
> 
>   * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
>     - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +13 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl4/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-green-to-red:
>     - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk5/igt@kms_color_chamelium@pipe-a-ctm-green-to-red.html
>     - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +10 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-green-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-a-gamma:
>     - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109284] / [fdo#111827]) +5 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb1/igt@kms_color_chamelium@pipe-a-gamma.html
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-0-75:
>     - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#109284] / [fdo#111827]) +16 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-kbl:          NOTRUN -> [TIMEOUT][62] ([i915#1319])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl6/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-kbl:          NOTRUN -> [FAIL][63] ([i915#2105])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl7/igt@kms_content_protection@uevent.html
>     - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111828])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb6/igt@kms_content_protection@uevent.html
>     - shard-apl:          NOTRUN -> [FAIL][65] ([i915#2105])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl7/igt@kms_content_protection@uevent.html
>     - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109300] / [fdo#111066])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb5/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
>     - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3319]) +1 similar issue
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
>     - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109279] / [i915#3359]) +5 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:
>     - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3359]) +5 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109274] / [fdo#109278]) +1 similar issue
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-tglb:         [PASS][71] -> [FAIL][72] ([i915#2346] / [i915#533])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#4103])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>     - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109274])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#111825]) +36 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb5/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>     - shard-tglb:         [PASS][76] -> [INCOMPLETE][77] ([i915#2411] / [i915#456])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
>     - shard-apl:          [PASS][78] -> [DMESG-WARN][79] ([i915#180]) +2 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
> 
>   * igt@kms_flip@plain-flip-ts-check@b-hdmi-a2:
>     - shard-glk:          [PASS][80] -> [FAIL][81] ([i915#2122])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-glk4/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk6/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
>     - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#2587])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
>     - shard-iclb:         [PASS][83] -> [SKIP][84] ([i915#3701])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
>     - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#2672])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
>     - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2672])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>     - shard-glk:          [PASS][87] -> [FAIL][88] ([i915#1888] / [i915#2546])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
>     - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109280]) +10 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
>     - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271]) +44 similar issues
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>     - shard-snb:          NOTRUN -> [SKIP][91] ([fdo#109271]) +89 similar issues
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-snb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
>     - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109289])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-d:
>     - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#533])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-d.html
>     - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#533]) +1 similar issue
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-d.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][95] ([i915#180])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>     - shard-apl:          NOTRUN -> [FAIL][96] ([fdo#108145] / [i915#265]) +2 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
>     - shard-glk:          NOTRUN -> [FAIL][97] ([fdo#108145] / [i915#265])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
>     - shard-kbl:          NOTRUN -> [FAIL][98] ([fdo#108145] / [i915#265]) +1 similar issue
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
> 
>   * igt@kms_prime@basic-crc@first-to-second:
>     - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#1836])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb6/igt@kms_prime@basic-crc@first-to-second.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
>     - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#658]) +1 similar issue
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
>     - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#658])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
>     - shard-glk:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#658])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
>     - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#658]) +1 similar issue
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
>     - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#2920])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
> 
>   * igt@kms_psr@psr2_sprite_render:
>     - shard-tglb:         NOTRUN -> [FAIL][105] ([i915#132] / [i915#3467]) +2 similar issues
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb8/igt@kms_psr@psr2_sprite_render.html
>     - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109441])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb7/igt@kms_psr@psr2_sprite_render.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-apl:          NOTRUN -> [FAIL][107] ([IGT#2])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl2/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-suspend:
>     - shard-kbl:          [PASS][108] -> [DMESG-WARN][109] ([i915#180])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
> 
>   * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
>     - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#2530])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb7/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html
> 
>   * igt@nouveau_crc@pipe-b-ctx-flip-detection:
>     - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2530]) +1 similar issue
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@nouveau_crc@pipe-b-ctx-flip-detection.html
> 
>   * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
>     - shard-apl:          NOTRUN -> [SKIP][112] ([fdo#109271]) +153 similar issues
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html
> 
>   * igt@perf@polling-parameterized:
>     - shard-apl:          [PASS][113] -> [FAIL][114] ([i915#1542])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-apl2/igt@perf@polling-parameterized.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl8/igt@perf@polling-parameterized.html
> 
>   * igt@prime_nv_api@i915_self_import_to_different_fd:
>     - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109291])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@prime_nv_api@i915_self_import_to_different_fd.html
>     - shard-iclb:         NOTRUN -> [SKIP][116] ([fdo#109291])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb6/igt@prime_nv_api@i915_self_import_to_different_fd.html
> 
>   * igt@prime_nv_pcopy@test2:
>     - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271]) +204 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl1/igt@prime_nv_pcopy@test2.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#111656])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb7/igt@prime_vgem@coherency-gtt.html
>     - shard-iclb:         NOTRUN -> [SKIP][119] ([fdo#109292])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb8/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@sysfs_clients@fair-1:
>     - shard-tglb:         NOTRUN -> [SKIP][120] ([i915#2994]) +2 similar issues
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb2/igt@sysfs_clients@fair-1.html
> 
>   * igt@sysfs_clients@recycle-many:
>     - shard-apl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#2994])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl8/igt@sysfs_clients@recycle-many.html
>     - shard-kbl:          NOTRUN -> [SKIP][122] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl7/igt@sysfs_clients@recycle-many.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-iclb:         NOTRUN -> [SKIP][123] ([fdo#109307])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb8/igt@tools_test@sysfs_l3_parity.html
>     - shard-tglb:         NOTRUN -> [SKIP][124] ([fdo#109307])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-tglb5/igt@tools_test@sysfs_l3_parity.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@feature_discovery@psr2:
>     - shard-iclb:         [SKIP][125] ([i915#658]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-iclb3/igt@feature_discovery@psr2.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-iclb2/igt@feature_discovery@psr2.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-kbl:          [FAIL][127] ([i915#2846]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-kbl4/igt@gem_exec_fair@basic-deadline.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-apl:          [FAIL][129] ([i915#2842] / [i915#3468]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [FAIL][131] ([i915#2842]) -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vcs0:
>     - shard-iclb:         [FAIL][133]
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6413/index.html
> 



