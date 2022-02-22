Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B1210E6F8
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Feb 2022 10:28:04 +0000 (UTC)
Date: Tue, 22 Feb 2022 11:27:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YhS6rcATcZWxB3HW@kamilkon-DESK1>
References: <20220218194651.25977-1-kamil.konieczny@linux.intel.com>
 <164528343086.29214.8298382784916087189@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <164528343086.29214.8298382784916087189@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/api=5Fintel=5Fallocator=3A__change_copy_instruction_for_ne?=
 =?utf-8?q?w_gens?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Dnia 2022-02-19 at 15:10:30 -0000, Patchwork napisał(a):
> == Series Details ==
> 
> Series: tests/i915/api_intel_allocator: change copy instruction for new gens
> URL   : https://patchwork.freedesktop.org/series/100424/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11251_full -> IGTPW_6654_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6654_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6654_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/index.html
> 
> Participating hosts (13 -> 8)
> ------------------------------
> 
>   Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6654_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
>     - shard-glk:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
> 

Unrelated to the change (api_intel_allocator).

--
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6654_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_persistence@engines-hostile:
>     - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb2/igt@gem_ctx_persistence@engines-hostile.html
> 
>   * igt@gem_exec_balancer@parallel-keep-in-fence:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][4] ([i915#5076])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@gem_exec_balancer@parallel-keep-in-fence.html
> 
>   * igt@gem_exec_capture@pi@vecs0:
>     - shard-tglb:         NOTRUN -> [INCOMPLETE][5] ([i915#1373] / [i915#3371])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@gem_exec_capture@pi@vecs0.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-iclb:         NOTRUN -> [FAIL][6] ([i915#2842]) +5 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
>     - shard-glk:          NOTRUN -> [FAIL][7] ([i915#2842])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][8] ([i915#2842]) +5 similar issues
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2842])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#2842])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-kbl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4613]) +2 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-random.html
>     - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#4613]) +2 similar issues
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4613])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb3/igt@gem_lmem_swapping@random-engines.html
>     - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4613])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl8/igt@gem_lmem_swapping@random-engines.html
>     - shard-glk:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4613])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk9/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#4270]) +2 similar issues
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_render_copy@linear-to-vebox-y-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#768]) +2 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb3/igt@gem_render_copy@linear-to-vebox-y-tiled.html
> 
>   * igt@gem_softpin@evict-snoop:
>     - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109312])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@gem_softpin@evict-snoop.html
>     - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109312])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@gem_softpin@evict-snoop.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#3297])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@input-checking:
>     - shard-tglb:         NOTRUN -> [DMESG-WARN][23] ([i915#4991])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@gem_userptr_blits@input-checking.html
>     - shard-iclb:         NOTRUN -> [DMESG-WARN][24] ([i915#4991])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb7/igt@gem_userptr_blits@input-checking.html
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][25] ([i915#4991])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl7/igt@gem_userptr_blits@input-checking.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#3297]) +1 similar issue
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gen7_exec_parse@basic-rejected:
>     - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109289])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@gen7_exec_parse@basic-rejected.html
>     - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109289])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@gen7_exec_parse@basic-rejected.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-tglb:         [PASS][29] -> [TIMEOUT][30] ([i915#3953])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-tglb1/igt@i915_module_load@reload-with-fault-injection.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#1904])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
>     - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#658])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109293] / [fdo#109506])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
>     - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109506] / [i915#2411])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111644] / [i915#1397] / [i915#2411])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>     - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110892])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +2 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-kbl4/igt@i915_suspend@sysfs-reader.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#1769])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110725] / [fdo#111614]) +2 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-180:
>     - shard-glk:          [PASS][41] -> [DMESG-WARN][42] ([i915#118]) +1 similar issue
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111614]) +3 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3777]) +1 similar issue
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>     - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3777])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615]) +4 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3777]) +5 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886]) +15 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
>     - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [i915#3886]) +6 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +5 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk2/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3886]) +7 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3689] / [i915#3886]) +4 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3689]) +5 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111615] / [i915#3689]) +4 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html
> 
>   * igt@kms_chamelium@hdmi-audio:
>     - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +11 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl2/igt@kms_chamelium@hdmi-audio.html
> 
>   * igt@kms_color@pipe-d-ctm-0-5:
>     - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278] / [i915#1149]) +1 similar issue
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb2/igt@kms_color@pipe-d-ctm-0-5.html
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
>     - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +6 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
>     - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +20 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
>     - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109284] / [fdo#111827]) +7 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
>     - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +6 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk9/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-max:
>     - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#109284] / [fdo#111827]) +13 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-max.html
> 
>   * igt@kms_content_protection@content_type_change:
>     - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109300] / [fdo#111066]) +2 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@kms_content_protection@content_type_change.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3116] / [i915#3299])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271]) +60 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk7/igt@kms_content_protection@srm.html
>     - shard-kbl:          NOTRUN -> [TIMEOUT][65] ([i915#1319])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_content_protection@srm.html
>     - shard-apl:          NOTRUN -> [TIMEOUT][66] ([i915#1319])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl1/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#1063]) +2 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][68] ([i915#180]) +2 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
>     - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3359]) +5 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3319])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109279] / [i915#3359]) +6 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
>     - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109278]) +23 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#4103])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109274] / [fdo#109278]) +2 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@pipe-d-torture-bo:
>     - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#533])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109274]) +4 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#109274] / [fdo#111825]) +12 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>     - shard-apl:          [PASS][78] -> [DMESG-WARN][79] ([i915#180]) +1 similar issue
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#2587])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>     - shard-glk:          [PASS][81] -> [FAIL][82] ([i915#4911])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-kbl:          [PASS][83] -> [DMESG-WARN][84] ([i915#180] / [i915#1982])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109280]) +14 similar issues
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>     - shard-snb:          NOTRUN -> [SKIP][86] ([fdo#109271]) +116 similar issues
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>     - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109280] / [fdo#111825]) +29 similar issues
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271]) +259 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#1187])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#1839]) +1 similar issue
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
>     - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#533]) +2 similar issues
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
>     - shard-apl:          NOTRUN -> [FAIL][92] ([fdo#108145] / [i915#265]) +1 similar issue
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
>     - shard-glk:          NOTRUN -> [FAIL][93] ([fdo#108145] / [i915#265])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
>     - shard-kbl:          NOTRUN -> [FAIL][94] ([i915#265])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>     - shard-apl:          NOTRUN -> [FAIL][95] ([i915#265])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
>     - shard-kbl:          NOTRUN -> [FAIL][96] ([fdo#108145] / [i915#265]) +1 similar issue
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
> 
>   * igt@kms_plane_lowres@pipe-d-tiling-none:
>     - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#3536])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-none.html
> 
>   * igt@kms_plane_lowres@pipe-d-tiling-yf:
>     - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#111615] / [fdo#112054]) +1 similar issue
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-yf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#1911])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#658]) +2 similar issues
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-glk:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#658]) +1 similar issue
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-iclb:         NOTRUN -> [FAIL][102] ([i915#4148])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#658]) +1 similar issue
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@psr2_basic:
>     - shard-tglb:         NOTRUN -> [FAIL][104] ([i915#132] / [i915#3467]) +4 similar issues
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_psr@psr2_basic.html
> 
>   * igt@kms_psr@psr2_primary_mmap_gtt:
>     - shard-iclb:         [PASS][105] -> [SKIP][106] ([fdo#109441]) +1 similar issue
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109441]) +2 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_vblank@pipe-d-wait-forked-hang:
>     - shard-apl:          NOTRUN -> [SKIP][108] ([fdo#109271]) +138 similar issues
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@kms_vblank@pipe-d-wait-forked-hang.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-apl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2437])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@kms_writeback@writeback-check-output.html
>     - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#2437])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@kms_writeback@writeback-check-output.html
>     - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2437])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@kms_writeback@writeback-check-output.html
>     - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#2437])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk7/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-kbl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#2437]) +1 similar issue
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@nouveau_crc@pipe-d-source-rg:
>     - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2530])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@nouveau_crc@pipe-d-source-rg.html
> 
>   * igt@prime_nv_pcopy@test1_macro:
>     - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109291]) +6 similar issues
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@prime_nv_pcopy@test1_macro.html
> 
>   * igt@prime_nv_pcopy@test3_3:
>     - shard-iclb:         NOTRUN -> [SKIP][116] ([fdo#109291]) +6 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@prime_nv_pcopy@test3_3.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109295])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb4/igt@prime_vgem@fence-flip-hang.html
>     - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#109295])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@syncobj_timeline@invalid-transfer-non-existent-point:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][119] ([i915#5098])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
> 
>   * igt@syncobj_timeline@transfer-timeline-point:
>     - shard-apl:          NOTRUN -> [DMESG-FAIL][120] ([i915#5098])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@syncobj_timeline@transfer-timeline-point.html
> 
>   * igt@sysfs_clients@fair-7:
>     - shard-kbl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#2994])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@sysfs_clients@fair-7.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_persistence@many-contexts:
>     - shard-tglb:         [FAIL][122] ([i915#2410]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@gem_ctx_persistence@many-contexts.html
> 
>   * igt@gem_eio@in-flight-contexts-1us:
>     - shard-snb:          [FAIL][124] -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-snb7/igt@gem_eio@in-flight-contexts-1us.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb7/igt@gem_eio@in-flight-contexts-1us.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-kbl:          [FAIL][126] ([i915#2842]) -> [PASS][127] +1 similar issue
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-kbl3/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@gem_exec_fair@basic-none-share@rcs0.html
>     - shard-iclb:         [FAIL][128] ([i915#2842]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-glk:          [FAIL][130] ([i915
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/index.html
