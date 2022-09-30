Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345EF10E1A9
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 07:11:43 +0000 (UTC)
Date: Fri, 30 Sep 2022 09:11:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YzaWqtnN+rjnvgzz@kamilkon-desk1>
References: <20220830084836.12231-1-kamil.konieczny@linux.intel.com>
 <166451682848.23341.16020747044895338482@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166451682848.23341.16020747044895338482@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fhangman=3A_fail_only_after_freeing_spinners_=28rev5=29?=
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

Hi Lakshmi,

On 2022-09-30 at 05:47:08 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: i915/i915_hangman: fail only after freeing spinners (rev5)
> URL   : https://patchwork.freedesktop.org/series/106946/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12197_full -> IGTPW_7883_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7883_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7883_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.html
> 
> Participating hosts (12 -> 6)
> ------------------------------
> 
>   Missing    (6): pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7883_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_addfb_basic@legacy-format:
>     - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_addfb_basic@legacy-format.html

These are unrelated to changes in i915_hangman,

Regards,
Kamil

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7883_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_balancer@parallel-keep-in-fence:
>     - shard-iclb:         [PASS][2] -> [SKIP][3] ([i915#4525]) +2 similar issues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [PASS][4] -> [FAIL][5] ([i915#2842])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][6] ([i915#2842])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html
>     - shard-glk:          NOTRUN -> [FAIL][7] ([i915#2842])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html
>     - shard-iclb:         NOTRUN -> [FAIL][8] ([i915#2842])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2842])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk5/igt@gem_exec_fair@basic-none@vecs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#2842]) +1 similar issue
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_params@no-bsd:
>     - shard-iclb:         NOTRUN -> [SKIP][13] ([fdo#109283])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@gem_exec_params@no-bsd.html
>     - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#109283])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@gem_exec_params@no-bsd.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify:
>     - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@gem_lmem_swapping@parallel-random-verify.html
>     - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#4613]) +2 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@gem_lmem_swapping@parallel-random-verify.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - shard-glk:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk1/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_lmem_swapping@verify:
>     - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#4613]) +2 similar issues
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@gem_lmem_swapping@verify.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4270])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_pxp@protected-raw-src-copy-not-readible.html
>     - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#4270])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#768])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#3297])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_userptr_blits@dmabuf-unsync.html
>     - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#3297])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][24] ([i915#5566] / [i915#716])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#5566] / [i915#716])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk7/igt@gen9_exec_parse@allowed-single.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@unaligned-jump:
>     - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#2856])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gen9_exec_parse@unaligned-jump.html
>     - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#2527] / [i915#2856])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@gen9_exec_parse@unaligned-jump.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@i915_suspend@forcewake.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_suspend@forcewake.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>     - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#5286])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
>     - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#5286])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#110725] / [fdo#111614])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html
>     - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111614])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
>     - shard-glk:          [PASS][35] -> [DMESG-FAIL][36] ([i915#118] / [i915#1888])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615]) +2 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>     - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3886]) +5 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278]) +7 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
>     - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3689] / [i915#6095]) +1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3886]) +10 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
>     - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3689] / [i915#3886])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
>     - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278] / [i915#3886]) +2 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3689]) +2 similar issues
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615] / [i915#3689]) +2 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html
> 
>   * igt@kms_chamelium@dp-hpd:
>     - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +4 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@kms_chamelium@dp-hpd.html
> 
>   * igt@kms_chamelium@hdmi-audio:
>     - shard-snb:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +4 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb4/igt@kms_chamelium@hdmi-audio.html
>     - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_chamelium@hdmi-audio.html
> 
>   * igt@kms_chamelium@hdmi-cmp-planar-formats:
>     - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_chamelium@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_color@ctm-0-75@pipe-a-edp-1:
>     - shard-iclb:         NOTRUN -> [FAIL][50] ([i915#315] / [i915#6946]) +2 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_color@ctm-0-75@pipe-a-edp-1.html
> 
>   * igt@kms_color@ctm-0-75@pipe-c-edp-1:
>     - shard-tglb:         NOTRUN -> [FAIL][51] ([i915#315]) +3 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_color@ctm-0-75@pipe-c-edp-1.html
> 
>   * igt@kms_color_chamelium@ctm-0-50:
>     - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +6 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_color_chamelium@ctm-0-50.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-apl:          NOTRUN -> [FAIL][53] ([i915#2105])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb@atomic:
>     - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109274]) +5 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_cursor_legacy@cursora-vs-flipb@atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb@varying-size:
>     - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109274] / [fdo#111825]) +5 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_cursor_legacy@cursora-vs-flipb@varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>     - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#2346]) +1 similar issue
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#2672]) +3 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#2587] / [i915#2672]) +2 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#3555])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#2672] / [i915#3555])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109280] / [fdo#111825]) +11 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:
>     - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109280]) +11 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#6497]) +4 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
>     - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109289])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
>     - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109289])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:
>     - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#6988]) +34 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
>     - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +236 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:
>     - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#6988]) +34 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>     - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#658])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-iclb:         [PASS][71] -> [SKIP][72] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html
>     - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#658])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr2_primary_page_flip:
>     - shard-iclb:         [PASS][74] -> [SKIP][75] ([fdo#109441]) +1 similar issue
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
> 
>   * igt@kms_vblank@pipe-d-wait-idle:
>     - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#533])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2437])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@nouveau_crc@pipe-b-source-outp-inactive:
>     - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#6971]) +47 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-inactive.html
> 
>   * igt@nouveau_crc@pipe-d-ctx-flip-detection:
>     - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271]) +163 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-tglb:         [PASS][80] -> [DMESG-WARN][81] ([i915#2867])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb1/igt@perf_pmu@module-unload.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@perf_pmu@module-unload.html
> 
>   * igt@prime_nv_pcopy@test3_5:
>     - shard-snb:          NOTRUN -> [SKIP][82] ([fdo#109271]) +192 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb2/igt@prime_nv_pcopy@test3_5.html
> 
>   * igt@prime_nv_test@i915_blt_fill_nv_read:
>     - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#6971]) +47 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@prime_nv_test@i915_blt_fill_nv_read.html
> 
>   * igt@sysfs_clients@sema-25:
>     - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@sysfs_clients@sema-25.html
>     - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#2994]) +1 similar issue
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@sysfs_clients@sema-25.html
>     - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@sysfs_clients@sema-25.html
> 
>   * igt@sysfs_clients@split-10:
>     - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#2994]) +1 similar issue
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@sysfs_clients@split-10.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-iclb:         [SKIP][88] ([i915#4525]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@gem_exec_balancer@parallel.html
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-tglb:         [FAIL][90] ([i915#2842]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
>     - shard-glk:          [FAIL][92] ([i915#2842]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [DMESG-WARN][94] ([i915#5566] / [i915#716]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk5/igt@gen9_exec_parse@allowed-all.html
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_module_load@reload-no-display:
>     - shard-snb:          [DMESG-WARN][96] ([i915#4528]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-snb5/igt@i915_module_load@reload-no-display.html
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb4/igt@i915_module_load@reload-no-display.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-iclb:         [FAIL][98] ([i915#3989] / [i915#454]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rps@engine-order:
>     - shard-apl:          [FAIL][100] ([i915#6537]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl7/igt@i915_pm_rps@engine-order.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_pm_rps@engine-order.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-apl:          [DMESG-WARN][102] ([i915#180]) -> [PASS][103] +2 similar issues
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl6/igt@i915_suspend@sysfs-reader.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>     - shard-iclb:         [SKIP][104] ([i915#5235]) -> [PASS][105] +2 similar issues
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
> 
>   * igt@kms_psr@psr2_cursor_mmap_gtt:
>     - shard-iclb:         [SKIP][106] ([fdo#109441]) -> [PASS][107] +1 similar issue
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_gtt.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
> 
>   * igt@perf@polling-small-buf:
>     - shard-tglb:         [FAIL][108] ([i915#1722]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb8/igt@perf@polling-small-buf.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@perf@polling-small-buf.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-iclb:         [FAIL][110] ([i915#6117]) -> [SKIP][111] ([i915#4525])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-iclb:         [SKIP][112] ([i915#658]) -> [SKIP][113] ([i915#588])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-iclb:         [SKIP][114] ([i915#2920]) -> [SKIP][115] ([i915#658]) +1 similar issue
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-iclb:         [SKIP][116] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][117] ([i915#5939])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb7/igt@kms_psr2_su@page_flip-p010.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123]) ([i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl6/igt@runner@aborted.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@runner@aborted.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl2/igt@runner@aborted.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@runner@aborted.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@runner@aborted.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@runner@aborted.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@runner@aborted.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@runner@aborted.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
>   [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
>   [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
>   [i915#6971]: https://gitlab.freedesktop.org/drm/intel/issues/6971
>   [i915#6988]: https://gitlab.freedesktop.org/drm/intel/issues/6988
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6668 -> IGTPW_7883
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_12197: cafa326de8e7860d45639e61bf66ec9c218207b1 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7883: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.html
>   IGT_6668: 5f29c9369550164b35b65baaaeba4b370f434cf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.html
