Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388C97343F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Nov 2021 17:30:35 +0000 (UTC)
Date: Tue, 2 Nov 2021 19:16:29 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20211102171629.GF3598655@ideak-desk.fi.intel.com>
References: <20211026212620.2718277-1-imre.deak@intel.com>
 <163535483425.4640.14283927930893897841@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163535483425.4640.14283927930893897841@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb/tgl+=3A_Remove_CCS_FB_layout_restrictions_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juha-pekka.heikkila@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 27, 2021 at 05:13:54PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_fb/tgl+: Remove CCS FB layout restrictions (rev2)
> URL   : https://patchwork.freedesktop.org/series/96316/
> State : failure

Thanks for the reviews, patchset is pushed.

> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10796_full -> IGTPW_6356_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6356_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6356_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/index.html
> 
> Participating hosts (10 -> 7)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6356_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-iclb:         NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

<3> [91.477021] i915 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad4003ff)
<3> [91.477091] i915 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: not done (status 0xad4003ff)
> 
>   * igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge:
>     - shard-iclb:         [PASS][2] -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-iclb4/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb7/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html

<3> [214.182023] i915 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad4003ff)

Both of the above are from the same machine/CI run, where nothing seems
to be connected to port B (native DP/HDMI). Regardless of this, in the
middle of modesetting port A, there is an AUX transfer attempt on port
B. No idea why, as I understand this shouldn't happen if the HPD live
state for port B shows a disconnected state correctly.

Anyway, doesn't seem to be related to the changes in the patchset.

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6356_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@feature_discovery@psr2:
>     - shard-iclb:         [PASS][4] -> [SKIP][5] ([i915#658])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-iclb2/igt@feature_discovery@psr2.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb5/igt@feature_discovery@psr2.html
> 
>   * igt@gem_create@create-massive:
>     - shard-iclb:         NOTRUN -> [DMESG-WARN][6] ([i915#3002])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb5/igt@gem_create@create-massive.html
>     - shard-snb:          NOTRUN -> [DMESG-WARN][7] ([i915#3002])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-snb6/igt@gem_create@create-massive.html
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][8] ([i915#3002])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl3/igt@gem_create@create-massive.html
>     - shard-tglb:         NOTRUN -> [DMESG-WARN][9] ([i915#3002])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb3/igt@gem_create@create-massive.html
>     - shard-glk:          NOTRUN -> [DMESG-WARN][10] ([i915#3002])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk7/igt@gem_create@create-massive.html
>     - shard-apl:          NOTRUN -> [DMESG-WARN][11] ([i915#3002])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-apl3/igt@gem_create@create-massive.html
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-tglb:         [PASS][12] -> [TIMEOUT][13] ([i915#3063])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-tglb8/igt@gem_eio@in-flight-contexts-10ms.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb1/igt@gem_eio@in-flight-contexts-10ms.html
>     - shard-iclb:         [PASS][14] -> [TIMEOUT][15] ([i915#3070])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-iclb5/igt@gem_eio@in-flight-contexts-10ms.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb1/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          NOTRUN -> [FAIL][16] ([i915#2846])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk4/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#2842])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#2842])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#2842])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vcs1:
>     - shard-iclb:         NOTRUN -> [FAIL][23] ([i915#2842])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][24] ([i915#2842])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb5/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#109283])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb2/igt@gem_exec_params@rsvd2-dirt.html
>     - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109283])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb3/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-apl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#2190])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-apl1/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_pxp@create-protected-buffer:
>     - shard-snb:          NOTRUN -> [SKIP][28] ([fdo#109271]) +61 similar issues
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-snb7/igt@gem_pxp@create-protected-buffer.html
>     - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#4270])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb4/igt@gem_pxp@create-protected-buffer.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#4270]) +3 similar issues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb6/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#2856])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb6/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109506] / [i915#2411])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp:
>     - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#3049])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-iclb1/igt@i915_pm_rpm@modeset-lpsp.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109303])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@i915_query@query-topology-unsupported:
>     - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#109302])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb3/igt@i915_query@query-topology-unsupported.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-tglb:         [PASS][37] -> [INCOMPLETE][38] ([i915#456] / [i915#750])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-tglb3/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb7/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-kbl1/igt@i915_suspend@sysfs-reader.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl1/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_atomic_interruptible@legacy-cursor@edp-1-pipe-a:
>     - shard-iclb:         [PASS][41] -> [DMESG-WARN][42] ([i915#1226])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-iclb5/igt@kms_atomic_interruptible@legacy-cursor@edp-1-pipe-a.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb3/igt@kms_atomic_interruptible@legacy-cursor@edp-1-pipe-a.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-0:
>     - shard-glk:          [PASS][43] -> [DMESG-WARN][44] ([i915#118]) +2 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111614]) +2 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3777])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3777])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-apl2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>     - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3777]) +1 similar issue
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>     - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111615]) +5 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271]) +76 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
>     - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#3886]) +3 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
>     - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#3886]) +10 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#3689] / [i915#3886]) +1 similar issue
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb7/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3689]) +3 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb5/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html
> 
>   * igt@kms_chamelium@dp-crc-fast:
>     - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-snb6/igt@kms_chamelium@dp-crc-fast.html
>     - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb5/igt@kms_chamelium@dp-crc-fast.html
> 
>   * igt@kms_chamelium@dp-crc-multiple:
>     - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +6 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-apl8/igt@kms_chamelium@dp-crc-multiple.html
> 
>   * igt@kms_chamelium@hdmi-aspect-ratio:
>     - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +10 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk3/igt@kms_chamelium@hdmi-aspect-ratio.html
> 
>   * igt@kms_chamelium@vga-hpd-for-each-pipe:
>     - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109284] / [fdo#111827]) +8 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb2/igt@kms_chamelium@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-0-25:
>     - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [fdo#111827]) +15 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl1/igt@kms_color_chamelium@pipe-b-ctm-0-25.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-kbl:          NOTRUN -> [TIMEOUT][62] ([i915#1319])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl1/igt@kms_content_protection@lic.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111828])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb3/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
>     - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3319])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][65] ([i915#180]) +5 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3359]) +3 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding:
>     - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278]) +2 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding.html
>     - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109279] / [i915#3359]) +1 similar issue
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#4103]) +1 similar issue
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_dp_tiled_display@basic-test-pattern:
>     - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#426])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern.html
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#426])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109274])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
>     - shard-glk:          [PASS][73] -> [FAIL][74] ([i915#79]) +1 similar issue
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>     - shard-apl:          [PASS][75] -> [DMESG-WARN][76] ([i915#180]) +1 similar issue
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
>     - shard-iclb:         [PASS][77] -> [INCOMPLETE][78] ([i915#2910])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-iclb5/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-edp1:
>     - shard-tglb:         [PASS][79] -> [INCOMPLETE][80] ([i915#456])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-tglb2/igt@kms_flip@flip-vs-suspend@a-edp1.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb7/igt@kms_flip@flip-vs-suspend@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109280]) +5 similar issues
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>     - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#111825]) +20 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271]) +220 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglb:         [PASS][84] -> [SKIP][85] ([i915#433])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
>     - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#533]) +1 similar issue
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
>     - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#533])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk5/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
>     - shard-kbl:          NOTRUN -> [FAIL][88] ([fdo#108145] / [i915#265]) +1 similar issue
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
>     - shard-glk:          NOTRUN -> [FAIL][89] ([fdo#108145] / [i915#265])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
>     - shard-apl:          NOTRUN -> [FAIL][90] ([fdo#108145] / [i915#265])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>     - shard-kbl:          NOTRUN -> [FAIL][91] ([i915#265])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
> 
>   * igt@kms_plane_cursor@pipe-d-viewport-size-256:
>     - shard-glk:          NOTRUN -> [SKIP][92] ([fdo#109271]) +70 similar issues
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk6/igt@kms_plane_cursor@pipe-d-viewport-size-256.html
> 
>   * igt@kms_plane_lowres@pipe-b-tiling-y:
>     - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#3536])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb8/igt@kms_plane_lowres@pipe-b-tiling-y.html
> 
>   * igt@kms_plane_lowres@pipe-c-tiling-yf:
>     - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#3536])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb5/igt@kms_plane_lowres@pipe-c-tiling-yf.html
> 
>   * igt@kms_plane_lowres@pipe-d-tiling-yf:
>     - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#112054]) +2 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb2/igt@kms_plane_lowres@pipe-d-tiling-yf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
>     - shard-kbl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#658]) +2 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
>     - shard-apl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#658])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
>     - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2920]) +1 similar issue
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
>     - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#658])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
> 
>   * igt@kms_psr@psr2_cursor_plane_onoff:
>     - shard-tglb:         NOTRUN -> [FAIL][100] ([i915#132] / [i915#3467]) +2 similar issues
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb8/igt@kms_psr@psr2_cursor_plane_onoff.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         [PASS][101] -> [SKIP][102] ([fdo#109441]) +1 similar issue
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@kms_psr@psr2_primary_render:
>     - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109441])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb1/igt@kms_psr@psr2_primary_render.html
> 
>   * igt@kms_vblank@pipe-a-ts-continuation-suspend:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][104] ([i915#180] / [i915#295])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-kbl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#2437])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl6/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-glk:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2437])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk4/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@nouveau_crc@pipe-b-ctx-flip-detection:
>     - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#2530])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb3/igt@nouveau_crc@pipe-b-ctx-flip-detection.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#109289])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb7/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-iclb:         [PASS][109] -> [DMESG-WARN][110] ([i915#262])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-iclb5/igt@perf_pmu@module-unload.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb2/igt@perf_pmu@module-unload.html
> 
>   * igt@prime_nv_test@i915_import_gtt_mmap:
>     - shard-tglb:         NOTRUN -> [SKIP][111] ([fdo#109291])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb7/igt@prime_nv_test@i915_import_gtt_mmap.html
>     - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109291])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb1/igt@prime_nv_test@i915_import_gtt_mmap.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#109295])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb6/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@sysfs_clients@fair-3:
>     - shard-kbl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#2994]) +2 similar issues
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl6/igt@sysfs_clients@fair-3.html
> 
>   * igt@sysfs_clients@pidname:
>     - shard-tglb:         NOTRUN -> [SKIP][115] ([i915#2994])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb7/igt@sysfs_clients@pidname.html
> 
>   * igt@sysfs_clients@split-25:
>     - shard-glk:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#2994]) +2 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk8/igt@sysfs_clients@split-25.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_isolation@preservation-s3@vecs0:
>     - shard-kbl:          [DMESG-WARN][117] ([i915#180]) -> [PASS][118] +4 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html
> 
>   * igt@gem_ctx_shared@q-smoketest-all:
>     - shard-glk:          [DMESG-WARN][119] ([i915#118]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-glk6/igt@gem_ctx_shared@q-smoketest-all.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk5/igt@gem_ctx_shared@q-smoketest-all.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-kbl:          [FAIL][121] ([i915#2842]) -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-tglb:         [FAIL][123] ([i915#2842]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-tglb1/igt@gem_exec_fair@basic-pace@vecs0.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb1/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          [FAIL][125] ([i915#2842]) -> [PASS][126] +1 similar issue
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-snb:          [INCOMPLETE][127] ([i915#3921]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-snb6/igt@i915_selftest@live@hangcheck.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-snb5/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-tglb:         [INCOMPLETE][129] ([i915#456]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-tglb7/igt@i915_suspend@debugfs-reader.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-tglb5/igt@i915_suspend@debugfs-reader.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-glk:          [FAIL][131] ([i915#1888]) -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-glk6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-glk:          [FAIL][133] ([i915#72]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-iclb:         [FAIL][135] ([i915#2346]) -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-kbl:          [INCOMPLETE][137] ([i915#180] / [i915#636]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-edp1:
>     - shard-tglb:
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6356/index.html
