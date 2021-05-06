Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCAE6E5A4
 for <igt-dev@lists.freedesktop.org>; Thu,  6 May 2021 14:41:10 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 06 May 2021 16:41:06 +0200
Message-ID: <9967816.qUNvkh4Gvn@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <162030745901.15691.6434907596630075529@emeril.freedesktop.org>
References: <20210506065709.345576-1-janusz.krzysztofik@linux.intel.com>
 <162030745901.15691.6434907596630075529@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_Fix_non-card0_processing_=28rev5=29?=
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
Cc: Latvala Petri <petri.latvala@intel.com>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On czwartek, 6 maja 2021 15:24:19 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: lib/i915/perf: Fix non-card0 processing (rev5)
> URL   : https://patchwork.freedesktop.org/series/89701/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10051_full -> IGTPW_5787_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5787_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5787_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in 
CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/
index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in 
IGTPW_5787_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-0:
>     - shard-tglb:         [PASS][1] -> [FAIL][2] +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-tglb1/
igt@kms_big_fb@linear-16bpp-rotate-0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb1/
igt@kms_big_fb@linear-16bpp-rotate-0.html

No perf nor core_hotunplug tests which use the library helper affected by the 
change were executed in the same run, no reason to blame the change for the 
failure, I believe.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_5787_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_create@create-massive:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][3] ([i915#3002]) +1 similar 
issue
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb5/
igt@gem_create@create-massive.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@vcs0:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][4] ([i915#180]) +2 similar 
issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/
igt@gem_ctx_isolation@preservation-s3@vcs0.html
> 
>   * igt@gem_ctx_persistence@clone:
>     - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) 
+6 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb5/
igt@gem_ctx_persistence@clone.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-kbl:          NOTRUN -> [FAIL][6] ([i915#2846])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl7/
igt@gem_exec_fair@basic-deadline.html
>     - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2846])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk5/
igt@gem_exec_fair@basic-deadline.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk5/
igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-kbl:          NOTRUN -> [FAIL][9] ([i915#2842]) +3 similar 
issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/
igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vcs1:
>     - shard-iclb:         [PASS][10] -> [FAIL][11] ([i915#2842])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb2/
igt@gem_exec_fair@basic-pace@vcs1.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/
igt@gem_exec_fair@basic-pace@vcs1.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2842]) +2 similar 
issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk3/
igt@gem_exec_fair@basic-pace@vecs0.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk7/
igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_reloc@basic-wide-active@bcs0:
>     - shard-apl:          NOTRUN -> [FAIL][14] ([i915#2389]) +3 similar 
issues
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl7/
igt@gem_exec_reloc@basic-wide-active@bcs0.html
> 
>   * igt@gem_exec_whisper@basic-forked-all:
>     - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / 
[i915#95])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk6/
igt@gem_exec_whisper@basic-forked-all.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk6/
igt@gem_exec_whisper@basic-forked-all.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#307]) +1 similar 
issue
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb1/
igt@gem_mmap_gtt@cpuset-big-copy-odd.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb1/
igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#3323])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl1/
igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#3297])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb8/
igt@gem_userptr_blits@readonly-pwrite-unsync.html
>     - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#3297])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb6/
igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_userptr_blits@set-cache-level:
>     - shard-kbl:          NOTRUN -> [FAIL][22] ([i915#3324])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl4/
igt@gem_userptr_blits@set-cache-level.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#2527])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb5/
igt@gen9_exec_parse@bb-oversize.html
>     - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#2527])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb7/
igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-tglb:         NOTRUN -> [FAIL][25] ([i915#454])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb3/
igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#111644] / [i915#1397] / 
[i915#2411])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb8/
igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>     - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#110892])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb7/
igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271]) +166 similar 
issues
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl3/
igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#110725] / [fdo#111614])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb3/
igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>     - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#111614])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb2/
igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111615])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb2/
igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_chamelium@hdmi-edid-change-during-suspend:
>     - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827]) 
+18 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl8/
igt@kms_chamelium@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_color@pipe-d-ctm-green-to-red:
>     - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109278] / [i915#1149])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb8/
igt@kms_color@pipe-d-ctm-green-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-0-25:
>     - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) 
+5 similar issues
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/
igt@kms_color_chamelium@pipe-b-ctm-0-25.html
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
>     - shard-snb:          NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) 
+21 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb2/
igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3116])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb3/
igt@kms_content_protection@dp-mst-type-0.html
>     - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#3116])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb1/
igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-apl:          NOTRUN -> [TIMEOUT][38] ([i915#1319])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl7/
igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
>     - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278] / [fdo#109279]) 
+1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb1/
igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-size-change:
>     - shard-tglb:         [PASS][40] -> [FAIL][41] ([i915#2124])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-tglb2/
igt@kms_cursor_crc@pipe-a-cursor-size-change.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb7/
igt@kms_cursor_crc@pipe-a-cursor-size-change.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
>     - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109279] / [i915#3359]) 
+2 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb3/
igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html
>     - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271]) +26 similar 
issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk3/
igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html
> 
>   * igt@kms_dp_tiled_display@basic-test-pattern:
>     - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#426])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb3/
igt@kms_dp_tiled_display@basic-test-pattern.html
>     - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#426])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb6/
igt@kms_dp_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [PASS][46] -> [INCOMPLETE][47] ([i915#180] / 
[i915#1982])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-apl3/
igt@kms_fbcon_fbt@fbc-suspend.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl6/
igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-busy-flip:
>     - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +58 similar 
issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl7/
igt@kms_flip@2x-busy-flip.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109274]) +2 similar 
issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/
igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
>     - shard-apl:          NOTRUN -> [FAIL][50] ([i915#79])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl7/
igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>     - shard-apl:          [PASS][51] -> [DMESG-WARN][52] ([i915#180])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-apl2/
igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl2/
igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
>     - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#2642]) 
+1 similar issue
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl7/
igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#49])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk2/
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk7/
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
>     - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111825]) +11 similar 
issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb3/
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>     - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271]) +443 similar 
issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb6/
igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109280]) +8 similar 
issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb7/
igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-kbl:          [PASS][59] -> [DMESG-WARN][60] ([i915#180]) +4 
similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl6/
igt@kms_hdr@bpc-switch-suspend.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3/
igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
>     - shard-apl:          NOTRUN -> [FAIL][61] ([i915#265])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl2/
igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>     - shard-apl:          NOTRUN -> [FAIL][62] ([fdo#108145] / [i915#265]) 
+1 similar issue
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl2/
igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
>     - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#658])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb7/
igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
>     - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#658])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk1/
igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
>     - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#658]) 
+3 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl6/
igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
>     - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#658])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl2/
igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
> 
>   * igt@kms_psr@psr2_no_drrs:
>     - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#109441])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb2/
igt@kms_psr@psr2_no_drrs.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/
igt@kms_psr@psr2_no_drrs.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
>     - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278]) +3 similar 
issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb8/
igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html
> 
>   * igt@kms_vblank@pipe-d-wait-idle:
>     - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#533])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl8/
igt@kms_vblank@pipe-d-wait-idle.html
> 
>   * igt@nouveau_crc@pipe-c-source-outp-inactive:
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#2530]) +1 similar 
issue
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb3/
igt@nouveau_crc@pipe-c-source-outp-inactive.html
>     - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#2530]) +1 similar 
issue
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb8/
igt@nouveau_crc@pipe-c-source-outp-inactive.html
> 
>   * igt@runner@aborted:
>     - shard-snb:          NOTRUN -> ([FAIL][73], [FAIL][74]) ([i915#3002] / 
[i915#698])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb5/
igt@runner@aborted.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb5/
igt@runner@aborted.html
> 
>   * igt@sysfs_clients@create:
>     - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2994]) 
+1 similar issue
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl2/
igt@sysfs_clients@create.html
> 
>   * igt@sysfs_clients@fair-0:
>     - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#2994])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb1/
igt@sysfs_clients@fair-0.html
>     - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2994])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk7/
igt@sysfs_clients@fair-0.html
>     - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#2994])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/
igt@sysfs_clients@fair-0.html
>     - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#2994])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl6/
igt@sysfs_clients@fair-0.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-tglb:         [TIMEOUT][80] ([i915#2369] / [i915#3063]) -> 
[PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-tglb1/
igt@gem_eio@unwedge-stress.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb8/
igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          [FAIL][82] ([i915#2842]) -> [PASS][83] +2 similar 
issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk2/
igt@gem_exec_fair@basic-none-rrul@rcs0.html
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk5/
igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-iclb:         [FAIL][84] ([i915#2842]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb6/
igt@gem_exec_fair@basic-none-share@rcs0.html
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb2/
igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-kbl:          [FAIL][86] ([i915#2842]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl3/
igt@gem_exec_fair@basic-pace@rcs0.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl6/
igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-sync@rcs0:
>     - shard-kbl:          [SKIP][88] ([fdo#109271]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl6/
igt@gem_exec_fair@basic-sync@rcs0.html
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/
igt@gem_exec_fair@basic-sync@rcs0.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-tglb:         [SKIP][90] ([i915#2190]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-tglb6/
igt@gem_huc_copy@huc-copy.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb5/
igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-xy:
>     - shard-glk:          [FAIL][92] ([i915#307]) -> [PASS][93] +1 similar 
issue
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk9/
igt@gem_mmap_gtt@cpuset-big-copy-xy.html
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk4/
igt@gem_mmap_gtt@cpuset-big-copy-xy.html
> 
>   * igt@gem_mmap_gtt@cpuset-medium-copy:
>     - shard-iclb:         [FAIL][94] ([i915#307]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb8/
igt@gem_mmap_gtt@cpuset-medium-copy.html
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb6/
igt@gem_mmap_gtt@cpuset-medium-copy.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-snb:          [INCOMPLETE][96] ([i915#2880]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-snb6/
igt@i915_module_load@reload-with-fault-injection.html
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb6/
igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-kbl:          [DMESG-WARN][98] ([i915#180]) -> [PASS][99] +2 
similar issues
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl1/
igt@i915_suspend@debugfs-reader.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl7/
igt@i915_suspend@debugfs-reader.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-stridechange:
>     - shard-glk:          [FAIL][100] ([i915#49]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk2/
igt@kms_frontbuffer_tracking@fbc-stridechange.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk6/
igt@kms_frontbuffer_tracking@fbc-stridechange.html
> 
>   * igt@kms_properties@connector-properties-atomic:
>     - shard-glk:          [DMESG-WARN][102] ([i915#118] / [i915#95]) -> 
[PASS][103] +3 similar issues
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk2/
igt@kms_properties@connector-properties-atomic.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk3/
igt@kms_properties@connector-properties-atomic.html
> 
>   * igt@kms_psr@psr2_sprite_render:
>     - shard-iclb:         [SKIP][104] ([fdo#109441]) -> [PASS][105] +1 
similar issue
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb8/
igt@kms_psr@psr2_sprite_render.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb2/
igt@kms_psr@psr2_sprite_render.html
> 
>   * igt@perf@polling-parameterized:
>     - shard-glk:          [FAIL][106] ([i915#1542]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk1/
igt@perf@polling-parameterized.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk2/
igt@perf@polling-parameterized.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-iclb:         [FAIL][108] ([i915#2849]) -> [FAIL][109] 
([i915#2842])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb8/
igt@gem_exec_fair@basic-throttle@rcs0.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb6/
igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
>     - shard-iclb:         [SKIP][110] ([i915#2920]) -> [SKIP][111] 
([i915#658]) +1 similar issue
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb2/
igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/
igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
>     - shard-iclb:         [SKIP][112] ([i915#658]) -> [SKIP][113] 
([i915#2920]) +1 similar issue
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb5/
igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb2/
igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
> 
>   * igt@runner@aborted:
>     - shard-kbl:          ([FAIL][114], [FAIL][115], [FAIL][116], [FAIL]
[117], [FAIL][118]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> 
([FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], 
[FAIL][125]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / 
[i915#3002] / [i915#3363])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl2/
igt@runner@aborted.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl1/
igt@runner@aborted.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl1/
igt@runner@aborted.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl7/
igt@runner@aborted.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl1/
igt@runner@aborted.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/
igt@runner@aborted.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/
igt@runner@aborted.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl6/
igt@runner@aborted.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3/
igt@runner@aborted.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3/
igt@runner@aborted.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl2/
igt@runner@aborted.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3/
igt@runner@aborted.html
>     - shard-apl:          ([FAIL][126], [FAIL][127]) ([i915#1814] / 
[i915#3002] / [i915#3363]) -> ([FAIL][128], [FAIL][129], [FAIL][130]) 
([i915#180] / [i915#3002] / [i915#3363])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-apl1/
igt@runner@aborted.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-apl1/
igt@runner@aborted.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl8/
igt@runner@aborted.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl2/
igt@runner@aborted.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl6/
igt@runner@aborted.html
> 
>   
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2124]: https://gitlab.freedesktop.org/drm/intel/issues/2124
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
>   [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
>   [i915#2642]: https://gitlab.freedesktop.org/drm/intel/issues/2642
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
>   [i915#2880]: https://gitlab.freedesktop.org/drm/intel/issues/2880
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
>   [i915#307]: https://gitlab.freedesktop.org/drm/intel/issues/307
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3324]: https://gitlab.freedesktop.org/drm/intel/issues/3324
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
>   [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
> 
> 
> Participating hosts (11 -> 8)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6080 -> IGTPW_5787
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/
index.html
> 




_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
