Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61D86EA20
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Nov 2021 08:32:39 +0000 (UTC)
Date: Thu, 18 Nov 2021 10:31:34 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZYPZkgFJJz84CcW@platvala-desk.ger.corp.intel.com>
References: <20211117104229.18663-1-petri.latvala@intel.com>
 <163717870568.18222.17798606406278004574@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163717870568.18222.17798606406278004574@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaWd0X2Nv?=
 =?utf-8?q?re=3A_Fix_docs_for_SLOW=5FQUICK?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 07:51:45PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: igt_core: Fix docs for SLOW_QUICK
> URL   : https://patchwork.freedesktop.org/series/97014/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10891_full -> IGTPW_6409_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6409_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6409_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/index.html
> 
> Participating hosts (11 -> 7)
> ------------------------------
> 
>   Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6409_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-tglb:         NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb8/igt@gem_lmem_swapping@random.html

Lakshmi, false positive above.


-- 
Petri Latvala


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6409_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_create@create-massive:
>     - shard-tglb:         NOTRUN -> [DMESG-WARN][2] ([i915#3002])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb3/igt@gem_create@create-massive.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@bcs0:
>     - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-persistence:
>     - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-snb7/igt@gem_ctx_persistence@legacy-engines-persistence.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#4525]) +1 similar issue
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb2/igt@gem_exec_balancer@parallel-balancer.html
>     - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#4525])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-kbl:          NOTRUN -> [FAIL][8] ([i915#2842]) +1 similar issue
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#2842]) +1 similar issue
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][11] ([i915#2842])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb3/igt@gem_exec_fair@basic-throttle@rcs0.html
>     - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#2849])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_media_vme:
>     - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#284])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb6/igt@gem_media_vme.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>     - shard-kbl:          NOTRUN -> [SKIP][15] ([fdo#109271]) +200 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>     - shard-glk:          NOTRUN -> [SKIP][16] ([fdo#109271]) +28 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
>     - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#768]) +1 similar issue
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-kbl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#3323])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#3297])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb2/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gen7_exec_parse@basic-offset:
>     - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#109289]) +1 similar issue
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb6/igt@gen7_exec_parse@basic-offset.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#2856])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb8/igt@gen9_exec_parse@allowed-single.html
>     - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#2856])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb4/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-tglb:         NOTRUN -> [FAIL][23] ([i915#454])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#454])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#109506] / [i915#2411]) +1 similar issue
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
>     - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109293] / [fdo#109506])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@i915_selftest@live@gem_contexts:
>     - shard-tglb:         [PASS][28] -> [DMESG-WARN][29] ([i915#2867]) +14 similar issues
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-tglb2/igt@i915_selftest@live@gem_contexts.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb5/igt@i915_selftest@live@gem_contexts.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-snb:          [PASS][30] -> [INCOMPLETE][31] ([i915#3921])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-snb6/igt@i915_selftest@live@hangcheck.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-snb5/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +3 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#1769])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#1769])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271]) +112 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl1/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-0:
>     - shard-glk:          [PASS][37] -> [DMESG-WARN][38] ([i915#118])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-0.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#110725] / [fdo#111614])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb2/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111614]) +1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
>     - shard-glk:          NOTRUN -> [DMESG-WARN][41] ([i915#118])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3777])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-glk1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>     - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3777])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>     - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3777]) +1 similar issue
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615]) +2 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
>     - shard-snb:          NOTRUN -> [SKIP][46] ([fdo#109271]) +57 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-snb4/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl3/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>     - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886]) +6 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111615] / [i915#3689]) +1 similar issue
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689]) +4 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb5/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3689] / [i915#3886])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [i915#3886])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb1/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_chamelium@hdmi-mode-timings:
>     - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +17 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl3/igt@kms_chamelium@hdmi-mode-timings.html
> 
>   * igt@kms_chamelium@vga-edid-read:
>     - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +7 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl8/igt@kms_chamelium@vga-edid-read.html
> 
>   * igt@kms_color@pipe-d-ctm-green-to-red:
>     - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [i915#1149])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb8/igt@kms_color@pipe-d-ctm-green-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-green-to-red:
>     - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +1 similar issue
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb5/igt@kms_color_chamelium@pipe-a-ctm-green-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-a-gamma:
>     - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb3/igt@kms_color_chamelium@pipe-a-gamma.html
>     - shard-snb:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-snb7/igt@kms_color_chamelium@pipe-a-gamma.html
>     - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-glk4/igt@kms_color_chamelium@pipe-a-gamma.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111828])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][61] ([i915#180]) +2 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3319]) +1 similar issue
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109279] / [i915#3359])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3359])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
>     - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278]) +7 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109274] / [fdo#109278]) +1 similar issue
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@pipe-d-torture-bo:
>     - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#533])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html
> 
>   * igt@kms_dp_tiled_display@basic-test-pattern:
>     - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#426])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pattern.html
>     - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#426])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb8/igt@kms_dp_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_dsc@xrgb8888-dsc-compression:
>     - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3828])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb6/igt@kms_dsc@xrgb8888-dsc-compression.html
>     - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#3828])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb1/igt@kms_dsc@xrgb8888-dsc-compression.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-kbl:          [PASS][72] -> [INCOMPLETE][73] ([i915#180] / [i915#636])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-fences:
>     - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109274]) +1 similar issue
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb6/igt@kms_flip@2x-flip-vs-fences.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][75] -> [FAIL][76] ([i915#2122])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>     - shard-tglb:         [PASS][77] -> [INCOMPLETE][78] ([i915#2411] / [i915#456])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-dp1:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][79] ([i915#180])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-edp1:
>     - shard-tglb:         [PASS][80] -> [DMESG-WARN][81] ([i915#2411] / [i915#2867])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-tglb3/igt@kms_flip@flip-vs-suspend@c-edp1.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb5/igt@kms_flip@flip-vs-suspend@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
>     - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#2672])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
>     - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#111825]) +21 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>     - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109280]) +10 similar issues
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-tglb:         NOTRUN -> [INCOMPLETE][85] ([i915#2411] / [i915#456])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglb:         [PASS][86] -> [SKIP][87] ([i915#433])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109289]) +2 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
>     - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#533]) +1 similar issue
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl7/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
>     - shard-tglb:         [PASS][90] -> [INCOMPLETE][91] ([i915#456])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
>     - shard-kbl:          NOTRUN -> [FAIL][92] ([fdo#108145] / [i915#265])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
>     - shard-apl:          NOTRUN -> [FAIL][93] ([fdo#108145] / [i915#265])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
> 
>   * igt@kms_prime@basic-crc@first-to-second:
>     - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#1836])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@kms_prime@basic-crc@first-to-second.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
>     - shard-kbl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#658]) +4 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
>     - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#658]) +2 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
> 
>   * igt@kms_psr2_su@page_flip:
>     - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#658])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-glk3/igt@kms_psr2_su@page_flip.html
>     - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#1911])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb3/igt@kms_psr2_su@page_flip.html
>     - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb6/igt@kms_psr2_su@page_flip.html
> 
>   * igt@kms_psr@psr2_cursor_plane_onoff:
>     - shard-tglb:         NOTRUN -> [FAIL][100] ([i915#132] / [i915#3467])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb8/igt@kms_psr@psr2_cursor_plane_onoff.html
>     - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109441])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb5/igt@kms_psr@psr2_cursor_plane_onoff.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         [PASS][102] -> [SKIP][103] ([fdo#109441]) +1 similar issue
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_setmode@basic:
>     - shard-apl:          [PASS][104] -> [FAIL][105] ([i915#31])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-apl4/igt@kms_setmode@basic.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl2/igt@kms_setmode@basic.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-apl:          NOTRUN -> [FAIL][106] ([IGT#2])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl1/igt@kms_sysfs_edid_timing.html
>     - shard-kbl:          NOTRUN -> [FAIL][107] ([IGT#2])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl1/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
>     - shard-kbl:          NOTRUN -> [INCOMPLETE][108] ([i915#2828])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#109502])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-kbl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#2437])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl1/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@nouveau_crc@pipe-a-source-outp-inactive:
>     - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#2530])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb4/igt@nouveau_crc@pipe-a-source-outp-inactive.html
> 
>   * igt@nouveau_crc@pipe-c-source-rg:
>     - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#2530]) +1 similar issue
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@nouveau_crc@pipe-c-source-rg.html
> 
>   * igt@sysfs_clients@fair-0:
>     - shard-tglb:         NOTRUN -> [SKIP][113] ([i915#2994])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@sysfs_clients@fair-0.html
>     - shard-glk:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#2994])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-glk1/igt@sysfs_clients@fair-0.html
>     - shard-iclb:         NOTRUN -> [SKIP][115] ([i915#2994])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb3/igt@sysfs_clients@fair-0.html
> 
>   * igt@sysfs_clients@pidname:
>     - shard-apl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl2/igt@sysfs_clients@pidname.html
> 
>   * igt@sysfs_clients@sema-25:
>     - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#2994]) +3 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl6/igt@sysfs_clients@sema-25.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_isolation@preservation-s3@vcs0:
>     - shard-kbl:          [DMESG-WARN][118] ([i915#180]) -> [PASS][119] +3 similar issues
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html
> 
>   * igt@gem_exec_capture@pi@bcs0:
>     - shard-tglb:         [INCOMPLETE][120] ([i915#2369] / [i915#3371] / [i915#3731]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-tglb7/igt@gem_exec_capture@pi@bcs0.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb7/igt@gem_exec_capture@pi@bcs0.html
> 
>   * igt@gem_exec_capture@pi@rcs0:
>     - shard-iclb:         [INCOMPLETE][122] ([i915#2369]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-iclb3/igt@gem_exec_capture@pi@rcs0.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-iclb3/igt@gem_exec_capture@pi@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglb:         [FAIL][124] ([i915#2842]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vcs1:
>     - shard-kbl:          [FAIL][126] ([i915#2842]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-kbl:          [SKIP][128] ([fdo#109271]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          [FAIL][130] ([i915#2842]) -> [PASS][131] +1 similar issue
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - shard-apl:          [DMESG-WARN][132] ([i915#180]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-apl3/igt@gem_exec_suspend@basic-s3.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-apl7/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
>     - shard-glk:          [FAIL][134] ([i915#1888] / [i915#3451]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [INCOMPLETE][136] ([i915#180] / [i915#1982]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10891/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/shar
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6409/index.html
