Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86AC112A15
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 18:10:30 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: BUG Filing - GSE OSGC <d848a5c3.intel.onmicrosoft.com@amer.teams.ms>
Date: Tue, 14 Jun 2022 20:10:26 +0200
Message-ID: <3837814.aeNJFYEL58@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <165522645434.12484.661970920418643896@emeril.freedesktop.org>
References: <20220610113335.573064-1-janusz.krzysztofik@linux.intel.com>
 <165522645434.12484.661970920418643896@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fmemory=5Fregion=3A_Fix_missing_header_inclusion?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, 14 June 2022 19:07:34 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_memory_region: Fix missing header inclusion
> URL   : https://patchwork.freedesktop.org/series/104980/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11753_full -> IGTPW_7283_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7283_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7283_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/index.html
> 
> Participating hosts (13 -> 10)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7283_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_mmap_offset@clear:
>     - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb2/igt@gem_mmap_offset@clear.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-iclb:         NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

My change was fixing potential future build issues, I can't imagine how it 
could impact results of existing tests.  Those must be either known or new 
unrelated but not yet discovered issues, I believe.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7283_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@feature_discovery@psr2:
>     - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#658])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb7/igt@feature_discovery@psr2.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#3555] / [i915#5325])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb7/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_eio@in-flight-contexts-immediate:
>     - shard-tglb:         NOTRUN -> [TIMEOUT][5] ([i915#3063])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb6/igt@gem_eio@in-flight-contexts-immediate.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-tglb:         [PASS][6] -> [TIMEOUT][7] ([i915#3063])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb6/igt@gem_eio@unwedge-stress.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb6/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@parallel-contexts:
>     - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#4525]) +1 similar issue
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb7/igt@gem_exec_balancer@parallel-contexts.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglb:         [PASS][10] -> [FAIL][11] ([i915#2842])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2842])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs1:
>     - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2842])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +2 similar issues
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>     - shard-apl:          [PASS][16] -> [FAIL][17] ([i915#2842])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vcs0:
>     - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#2842])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb3/igt@gem_exec_fair@basic-pace@vcs0.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl7/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_pxp@create-regular-context-2:
>     - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#4270]) +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb6/igt@gem_pxp@create-regular-context-2.html
>     - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#4270])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb3/igt@gem_pxp@create-regular-context-2.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][23] ([fdo#109271]) +84 similar issues
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
>     - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#768])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
> 
>   * igt@gem_softpin@evict-single-offset:
>     - shard-apl:          NOTRUN -> [FAIL][25] ([i915#4171])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl7/igt@gem_softpin@evict-single-offset.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#3323])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@input-checking:
>     - shard-iclb:         NOTRUN -> [DMESG-WARN][27] ([i915#4991])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb6/igt@gem_userptr_blits@input-checking.html
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][28] ([i915#4991])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl1/igt@gem_userptr_blits@input-checking.html
>     - shard-snb:          NOTRUN -> [DMESG-WARN][29] ([i915#4991])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-snb5/igt@gem_userptr_blits@input-checking.html
>     - shard-apl:          NOTRUN -> [DMESG-WARN][30] ([i915#4991])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl4/igt@gem_userptr_blits@input-checking.html
>     - shard-tglb:         NOTRUN -> [DMESG-WARN][31] ([i915#4991])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb7/igt@gem_userptr_blits@input-checking.html
>     - shard-glk:          NOTRUN -> [DMESG-WARN][32] ([i915#4991])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk6/igt@gem_userptr_blits@input-checking.html
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][33] ([i915#180])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@gen9_exec_parse@basic-rejected-ctx-param:
>     - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#2527] / [i915#2856]) +1 similar issue
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb6/igt@gen9_exec_parse@basic-rejected-ctx-param.html
> 
>   * igt@i915_module_load@reload:
>     - shard-iclb:         [PASS][35] -> [DMESG-WARN][36] ([i915#2867]) +4 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb4/igt@i915_module_load@reload.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb8/igt@i915_module_load@reload.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111644] / [i915#1397] / [i915#2411])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-tglb:         [PASS][38] -> [DMESG-WARN][39] ([i915#5591])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb7/igt@i915_selftest@live@hangcheck.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-kbl1/igt@i915_suspend@sysfs-reader.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl4/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>     - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#5286]) +2 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111614]) +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-tglb:         [PASS][44] -> [FAIL][45] ([i915#3743])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886]) +5 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
>     - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278] / [i915#3886]) +1 similar issue
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb5/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
>     - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +1 similar issue
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#6095]) +4 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3689] / [i915#3886]) +1 similar issue
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
>     - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#3886]) +3 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl4/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
>     - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3689]) +2 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111615] / [i915#3689]) +1 similar issue
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html
> 
>   * igt@kms_chamelium@common-hpd-after-suspend:
>     - shard-snb:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-snb6/igt@kms_chamelium@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium@dp-hpd-enable-disable-mode:
>     - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +6 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk6/igt@kms_chamelium@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium@dp-hpd-with-enabled-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827]) +2 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb5/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
> 
>   * igt@kms_chamelium@hdmi-audio:
>     - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +7 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb7/igt@kms_chamelium@hdmi-audio.html
> 
>   * igt@kms_color@pipe-d-ctm-red-to-blue:
>     - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [i915#1149])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb6/igt@kms_color@pipe-d-ctm-red-to-blue.html
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
>     - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +13 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-0-75:
>     - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [fdo#109284] / [fdo#111827])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-75.html
>     - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl6/igt@kms_color_chamelium@pipe-d-ctm-0-75.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-max-size-random:
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3359]) +2 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-max-size-random.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
>     - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3319])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-32x32-random.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109279] / [i915#3359]) +1 similar issue
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen:
>     - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278]) +14 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen:
>     - shard-snb:          NOTRUN -> [SKIP][67] ([fdo#109271]) +129 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-snb6/igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-iclb:         [PASS][68] -> [FAIL][69] ([i915#2346])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled:
>     - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#5287])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled.html
> 
>   * igt@kms_flip@2x-flip-vs-fences:
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109274] / [fdo#111825]) +4 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb1/igt@kms_flip@2x-flip-vs-fences.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109274]) +1 similar issue
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb1/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>     - shard-iclb:         [PASS][73] -> [SKIP][74] ([i915#3701])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#2587])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109280] / [fdo#111825]) +16 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>     - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109280]) +7 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_invalid_mode@clock-too-high:
>     - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#4278])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb3/igt@kms_invalid_mode@clock-too-high.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
>     - shard-apl:          [PASS][79] -> [DMESG-WARN][80] ([i915#180]) +2 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
>     - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#533]) +2 similar issues
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
>     - shard-glk:          NOTRUN -> [FAIL][82] ([fdo#108145] / [i915#265])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
> 
>   * igt@kms_plane_lowres@pipe-b-tiling-none:
>     - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#3536]) +1 similar issue
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-none.html
>     - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#3536])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb2/igt@kms_plane_lowres@pipe-b-tiling-none.html
> 
>   * igt@kms_plane_multiple@atomic-pipe-d-tiling-4:
>     - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#5288]) +1 similar issue
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
>     - shard-iclb:         [PASS][86] -> [SKIP][87] ([i915#5235]) +2 similar issues
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:
>     - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#5235]) +3 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1:
>     - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271]) +178 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>     - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#658])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk1/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#658])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl3/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@cursor_render:
>     - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271]) +43 similar issues
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl7/igt@kms_psr@cursor_render.html
> 
>   * igt@kms_psr@psr2_cursor_blt:
>     - shard-iclb:         [PASS][93] -> [SKIP][94] ([fdo#109441]) +2 similar issues
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html
> 
>   * igt@kms_psr@psr2_cursor_mmap_cpu:
>     - shard-tglb:         NOTRUN -> [FAIL][95] ([i915#132] / [i915#3467]) +1 similar issue
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@kms_psr@psr2_cursor_mmap_cpu.html
> 
>   * igt@kms_psr@psr2_cursor_render:
>     - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109441])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb3/igt@kms_psr@psr2_cursor_render.html
> 
>   * igt@kms_vblank@pipe-d-wait-idle:
>     - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#533])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk2/igt@kms_vblank@pipe-d-wait-idle.html
>     - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#533])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl7/igt@kms_vblank@pipe-d-wait-idle.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#3555])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@kms_vrr@flip-suspend.html
>     - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#3555])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb8/igt@kms_vrr@flip-suspend.html
> 
>   * igt@nouveau_crc@pipe-b-source-rg:
>     - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#2530]) +1 similar issue
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@nouveau_crc@pipe-b-source-rg.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109289]) +1 similar issue
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#112283])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb1/igt@perf_pmu@event-wait@rcs0.html
>     - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#112283])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@prime_nv_test@i915_nv_sharing:
>     - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109291])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@prime_nv_test@i915_nv_sharing.html
> 
>   * igt@sw_sync@sync_multi_timeline_wait:
>     - shard-iclb:         NOTRUN -> [FAIL][106] ([i915#6140])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb8/igt@sw_sync@sync_multi_timeline_wait.html
>     - shard-kbl:          NOTRUN -> [FAIL][107] ([i915#6140])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl4/igt@sw_sync@sync_multi_timeline_wait.html
>     - shard-snb:          NOTRUN -> [FAIL][108] ([i915#6140])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-snb7/igt@sw_sync@sync_multi_timeline_wait.html
>     - shard-apl:          NOTRUN -> [FAIL][109] ([i915#6140])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl7/igt@sw_sync@sync_multi_timeline_wait.html
>     - shard-tglb:         NOTRUN -> [FAIL][110] ([i915#6140])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@sw_sync@sync_multi_timeline_wait.html
>     - shard-glk:          NOTRUN -> [FAIL][111] ([i915#6140])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk4/igt@sw_sync@sync_multi_timeline_wait.html
> 
>   * igt@sysfs_clients@pidname:
>     - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk4/igt@sysfs_clients@pidname.html
> 
>   * igt@sysfs_clients@split-25:
>     - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#2994])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb4/igt@sysfs_clients@split-25.html
>     - shard-kbl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#2994])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl3/igt@sysfs_clients@split-25.html
>     - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2994])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl4/igt@sysfs_clients@split-25.html
>     - shard-tglb:         NOTRUN -> [SKIP][116] ([i915#2994])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb1/igt@sysfs_clients@split-25.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@kms:
>     - shard-tglb:         [TIMEOUT][117] ([i915#3063]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb1/igt@gem_eio@kms.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb6/igt@gem_eio@kms.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - {shard-rkl}:        [TIMEOUT][119] ([i915#3063]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-1/igt@gem_eio@unwedge-stress.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-2/igt@gem_eio@unwedge-stress.html
>     - {shard-tglu}:       [TIMEOUT][121] ([i915#3063]) -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglu-5/igt@gem_eio@unwedge-stress.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglu-3/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@parallel-bb-first:
>     - shard-iclb:         [SKIP][123] ([i915#4525]) -> [PASS][124] +1 similar issue
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html
> 
>   * igt@gem_exec_fair@basic-none@vcs1:
>     - shard-kbl:          [FAIL][125] ([i915#2842]) -> [PASS][126] +4 similar issues
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl3/igt@gem_exec_fair@basic-none@vcs1.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - {shard-tglu}:       [FAIL][127] ([i915#2842]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglu-3/igt@gem_exec_fair@basic-pace@rcs0.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglu-4/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-iclb:         [FAIL][129] ([i915#2849]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_linear_blits@normal:
>     - shard-tglb:         [INCOMPLETE][131] -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb6/igt@gem_linear_blits@normal.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb5/igt@gem_linear_blits@normal.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-apl:          [DMESG-WARN][133] ([i915#5566] / [i915#716]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-apl1/igt@gen9_exec_parse@allowed-single.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl8/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - shard-tglb:         [INCOMPLETE][135] ([i915#2411]) -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb6/igt@i915_pm_rpm@basic-rte.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb6/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@i915_pm_rpm@cursor:
>     - {shard-rkl}:        [SKIP][137] ([i915#1849]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-1/igt@i915_pm_rpm@cursor.html
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-6/igt@i915_pm_rpm@cursor.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - {shard-dg1}:        [FAIL][139] ([i915#4032]) -> [PASS][140]
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-dg1-16/igt@i915_pm_rps@basic-api.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-dg1-13/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-snb:          [INCOMPLETE][141] ([i915#3921]) -> [PASS][142]
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-snb7/igt@i915_selftest@live@hangcheck.html
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-snb7/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - {shard-dg1}:        [SKIP][143] ([i915#1836]) -> [PASS][144] +2 similar issues
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-dg1-16/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-dg1-16/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>     - shard-glk:          [FAIL][145] ([i915#1888] / [i915#5138]) -> [PASS][146]
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-glk7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-glk7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-tglb:         [FAIL][147] ([i915#3743]) -> [PASS][148]
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_color@pipe-c-invalid-ctm-matrix-sizes:
>     - {shard-rkl}:        [SKIP][149] ([i915#4070]) -> [PASS][150] +2 similar issues
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-1/igt@kms_color@pipe-c-invalid-ctm-matrix-sizes.html
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-4/igt@kms_color@pipe-c-invalid-ctm-matrix-sizes.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-128x42-rapid-movement:
>     - {shard-rkl}:        [SKIP][151] ([fdo#112022] / [i915#4070]) -> [PASS][152] +3 similar issues
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-1/igt@kms_cursor_crc@pipe-a-cursor-128x42-rapid-movement.html
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-128x42-rapid-movement.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-suspend:
>     - shard-apl:          [DMESG-WARN][153] ([i915#180]) -> [PASS][154]
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - {shard-dg1}:        [FAIL][155] ([i915#5972]) -> [PASS][156]
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-dg1-16/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-dg1-16/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
>     - {shard-rkl}:        [SKIP][157] ([fdo#111825] / [i915#4070]) -> [PASS][158] +2 similar issues
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
>     - {shard-rkl}:        [SKIP][159] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][160] +2 similar issues
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [INCOMPLETE][161] ([i915#180] / [i915#1982]) -> [PASS][162]
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-iclb:         [SKIP][163] ([i915#3701]) -> [PASS][164] +1 similar issue
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - {shard-dg1}:        [SKIP][165] ([i915#5721]) -> [PASS][166]
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - {shard-rkl}:        [SKIP][167] ([i915#1849] / [i915#4098]) -> [PASS][168] +9 similar issues
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_invalid_mode@zero-clock:
>     - {shard-dg1}:        [WARN][169] ([i915#5971]) -> [PASS][170]
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-dg1-16/igt@kms_invalid_mode@zero-clock.html
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-dg1-12/igt@kms_invalid_mode@zero-clock.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>     - {shard-rkl}:        [SKIP][171] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][172]
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
> 
>   * igt@kms_plane_cursor@pipe-a-viewport-size-256:
>     - {shard-rkl}:        [SKIP][173] ([i915#1845] / [i915#4098]) -> [PASS][174] +13 similar issues
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
> 
>   * igt@kms_psr@psr2_primary_blt:
>     - shard-iclb:         [SKIP][175] ([fdo#109441]) -> [PASS][176] +1 similar issue
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb3/igt@kms_psr@psr2_primary_blt.html
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
> 
>   * igt@kms_psr@sprite_render:
>     - {shard-rkl}:        [SKIP][177] ([i915#1072]) -> [PASS][178]
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-1/igt@kms_psr@sprite_render.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-6/igt@kms_psr@sprite_render.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-iclb:         [SKIP][179] ([i915#5519]) -> [PASS][180]
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_universal_plane@universal-plane-pipe-a-sanity:
>     - {shard-rkl}:        [SKIP][181] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][182]
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-a-sanity.html
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-a-sanity.html
> 
>   * igt@kms_vblank@pipe-a-query-forked-hang:
>     - {shard-dg1}:        [FAIL][183] ([i915#4241]) -> [PASS][184] +1 similar issue
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-dg1-16/igt@kms_vblank@pipe-a-query-forked-hang.html
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-dg1-12/igt@kms_vblank@pipe-a-query-forked-hang.html
> 
>   * igt@sysfs_timeslice_duration@timeout@vecs0:
>     - shard-apl:          [FAIL][185] ([i915#1755]) -> [PASS][186]
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-apl2/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-apl2/igt@sysfs_timeslice_duration@timeout@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-iclb:         [FAIL][187] ([i915#2842]) -> [FAIL][188] ([i915#2852])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-tglb:         [SKIP][189] ([i915#2848]) -> [FAIL][190] ([i915#2842])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@bcs0:
>     - shard-tglb:         [FAIL][191] ([i915#2842]) -> [SKIP][192] ([i915#2848]) +4 similar issues
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html
> 
>   * igt@kms_content_protection@mei_interface:
>     - shard-tglb:         [SKIP][193] ([i915#1063]) -> [SKIP][194] ([fdo#109300])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-tglb6/igt@kms_content_protection@mei_interface.html
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-tglb7/igt@kms_content_protection@mei_interface.html
>     - shard-iclb:         [SKIP][195] ([fdo#109300] / [fdo#111066]) -> [SKIP][196] ([fdo#109300])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb2/igt@kms_content_protection@mei_interface.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb8/igt@kms_content_protection@mei_interface.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-iclb:         [SKIP][197] ([i915#2920]) -> [SKIP][198] ([i915#658])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-iclb:         [SKIP][199] ([i915#2920]) -> [SKIP][200] ([fdo#111068] / [i915#658])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@runner@aborted:
>     - shard-kbl:          [FAIL][201] ([i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][202], [FAIL][203], [FAIL][204]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11753/shard-kbl6/igt@runner@aborted.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl1/igt@runner@aborted.html
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl1/igt@runner@aborted.html
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/shard-kbl4/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
>   [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
>   [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
>   [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
>   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
>   [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
>   [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
>   [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2848]: https://gitlab.freedesktop.org/drm/intel/issues/2848
>   [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
>   [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
>   [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
>   [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
>   [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
>   [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
>   [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
>   [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4241]: https://gitlab.freedesktop.org/drm/intel/issues/4241
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
>   [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
>   [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
>   [i915#5266]: https://gitlab.freedesktop.org/drm/intel/issues/5266
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5357]: https://gitlab.freedesktop.org/drm/intel/issues/5357
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
>   [i915#5721]: https://gitlab.freedesktop.org/drm/intel/issues/5721
>   [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
>   [i915#5971]: https://gitlab.freedesktop.org/drm/intel/issues/5971
>   [i915#5972]: https://gitlab.freedesktop.org/drm/intel/issues/5972
>   [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6518 -> IGTPW_7283
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_11753: cb89eb64792fd1a78c5ffc473f7e208b88e62fad @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7283: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/index.html
>   IGT_6518: 0189ca288f7188e60f5eda356b190040bf8ec704 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7283/index.html
> 



