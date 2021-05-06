Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942D06E128
 for <igt-dev@lists.freedesktop.org>; Thu,  6 May 2021 10:41:15 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 06 May 2021 12:41:07 +0200
Message-ID: <2063837.K71DO8KEF6@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <162029057563.15690.18220796691062482558@emeril.freedesktop.org>
References: <20210506065709.345576-1-janusz.krzysztofik@linux.intel.com>
 <162029057563.15690.18220796691062482558@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_Fix_non-card0_processing_=28rev4=29?=
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
Cc: "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On czwartek, 6 maja 2021 10:42:55 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: lib/i915/perf: Fix non-card0 processing (rev4)
> URL   : https://patchwork.freedesktop.org/series/89701/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_6080_full -> IGTPW_5786_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5786_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5786_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in 
CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/
index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in 
IGTPW_5786_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-tglb:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-tglb6/
igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb5/
igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:
>     - shard-apl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-apl2/
igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl8/
igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
>     - shard-kbl:          [PASS][5] -> [FAIL][6] +1 similar issue
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl2/
igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl2/
igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html

The change only affects two tests which are calling intel_perf_for_fd(): perf 
and core_hotunplug.  In the two latter cases reported above, none of those two 
tests were executed in the same run before the reported failure occurred so 
there is no way for the change to be responsible for that failure.

In the first case of the above three, a perf test was indeed executed a few 
steps before the reported failure occurred, but for me it's hard to understand 
how that could be the reason of that failure, close to impossible.  Lakshmi, 
can we please retry?

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_5786_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_isolation@preservation-s3@vcs0:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][7] ([i915#180])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl1/
igt@gem_ctx_isolation@preservation-s3@vcs0.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-mixed:
>     - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) 
+4 similar issues
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-snb2/
igt@gem_ctx_persistence@legacy-engines-mixed.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-iclb:         [PASS][9] -> [TIMEOUT][10] ([i915#2369] / 
[i915#2481] / [i915#3070])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb7/
igt@gem_eio@unwedge-stress.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb4/
igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-kbl:          NOTRUN -> [FAIL][11] ([i915#2846])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl2/
igt@gem_exec_fair@basic-deadline.html
>     - shard-apl:          NOTRUN -> [FAIL][12] ([i915#2846])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl6/
igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2842]) +4 similar 
issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-glk5/
igt@gem_exec_fair@basic-none-rrul@rcs0.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk4/
igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs1:
>     - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2842])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb4/
igt@gem_exec_fair@basic-none@vcs1.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2842])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb2/
igt@gem_exec_fair@basic-pace@rcs0.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb7/
igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-kbl:          [PASS][18] -> [SKIP][19] ([fdo#109271])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl7/
igt@gem_exec_fair@basic-pace@vecs0.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl1/
igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_mmap_offset@clear:
>     - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#3160])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-glk8/
igt@gem_mmap_offset@clear.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk9/
igt@gem_mmap_offset@clear.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-kbl:          NOTRUN -> [WARN][22] ([i915#2658])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl4/
igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-linear:
>     - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#768])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb7/
igt@gem_render_copy@y-tiled-to-vebox-linear.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#3297])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb1/
igt@gem_userptr_blits@readonly-pwrite-unsync.html
>     - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#3297])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb3/
igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-kbl:          [PASS][26] -> [INCOMPLETE][27] ([i915#155] / 
[i915#2405])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl6/
igt@gem_workarounds@suspend-resume-fd.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl2/
igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109289]) +1 similar 
issue
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb5/
igt@gen3_render_linear_blits.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#112306]) +1 similar 
issue
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb6/
igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#2527])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb2/
igt@gen9_exec_parse@bb-oversize.html
>     - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#2527])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb5/
igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-iclb:         NOTRUN -> [FAIL][32] ([i915#454])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb5/
igt@i915_pm_dc@dc6-psr.html
>     - shard-tglb:         NOTRUN -> [FAIL][33] ([i915#454])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb2/
igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111644] / [i915#1397] / 
[i915#2411])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb7/
igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>     - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110892])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb1/
igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-kbl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +1 
similar issue
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl4/
igt@i915_suspend@forcewake.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl1/
igt@i915_suspend@forcewake.html
> 
>   * igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs:
>     - shard-glk:          [PASS][38] -> [DMESG-FAIL][39] ([i915#118] / 
[i915#95])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-glk8/
igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk9/
igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110725] / [fdo#111614]) 
+1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb5/
igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111614])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb7/
igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111615])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb7/
igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#110723])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb1/
igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@pipe-a-ccs-on-another-bo:
>     - shard-snb:          NOTRUN -> [SKIP][44] ([fdo#109271]) +366 similar 
issues
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-snb2/
igt@kms_ccs@pipe-a-ccs-on-another-bo.html
> 
>   * igt@kms_chamelium@vga-hpd-without-ddc:
>     - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) 
+13 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-snb7/
igt@kms_chamelium@vga-hpd-without-ddc.html
> 
>   * igt@kms_color@pipe-d-ctm-green-to-red:
>     - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [i915#1149])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb1/
igt@kms_color@pipe-d-ctm-green-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
>     - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) 
+1 similar issue
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb1/
igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-0-25:
>     - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) 
+14 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl3/
igt@kms_color_chamelium@pipe-c-ctm-0-25.html
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-0-5:
>     - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) 
+2 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk3/
igt@kms_color_chamelium@pipe-c-ctm-0-5.html
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-negative:
>     - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) 
+10 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl3/
igt@kms_color_chamelium@pipe-c-ctm-negative.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-0-25:
>     - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278] / [fdo#109284] 
/ [fdo#111827])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb2/
igt@kms_color_chamelium@pipe-d-ctm-0-25.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-apl:          NOTRUN -> [TIMEOUT][52] ([i915#1319])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl8/
igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3116])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb3/
igt@kms_content_protection@dp-mst-type-0.html
>     - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#3116])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb8/
igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
>     - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [fdo#109279]) 
+2 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb7/
igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
>     - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271]) +88 similar 
issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl7/
igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
>     - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109279] / [i915#3359]) 
+2 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb1/
igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html
>     - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271]) +60 similar 
issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk7/
igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html
> 
>   * igt@kms_cursor_legacy@pipe-d-torture-bo:
>     - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#533])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl1/
igt@kms_cursor_legacy@pipe-d-torture-bo.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109274]) +4 similar 
issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb1/
igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
>     - shard-glk:          [PASS][61] -> [FAIL][62] ([i915#79])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-glk5/
igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk5/
igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111825]) +10 similar 
issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb6/
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
>     - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109280]) +15 similar 
issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb3/
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
>     - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#533])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk3/
igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
>     - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#533]) 
+1 similar issue
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl2/
igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
> 
>   * igt@kms_plane@pixel-format-pipe-a-planes-source-clamping:
>     - shard-tglb:         [PASS][67] -> [FAIL][68] ([i915#2839])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-tglb2/
igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb1/
igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
>     - shard-apl:          [PASS][69] -> [DMESG-WARN][70] ([i915#180]) +1 
similar issue
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-apl6/
igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl1/
igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>     - shard-apl:          NOTRUN -> [FAIL][71] ([fdo#108145] / [i915#265]) 
+1 similar issue
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl1/
igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>     - shard-apl:          NOTRUN -> [FAIL][72] ([i915#265]) +1 similar issue
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl8/
igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
> 
>   * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-
clipping-clamping:
>     - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2733])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl8/
igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-
clipping-clamping.html
>     - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2733])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl2/
igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-
clipping-clamping.html
> 
>   * igt@kms_prime@basic-crc@first-to-second:
>     - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#1836])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb1/
igt@kms_prime@basic-crc@first-to-second.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#658]) 
+2 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl2/
igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
>     - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#658])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb6/
igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
>     - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658]) 
+6 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl7/
igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
>     - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) 
+1 similar issue
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk7/
igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
> 
>   * igt@kms_psr2_su@page_flip:
>     - shard-iclb:         [PASS][80] -> [SKIP][81] ([fdo#109642] / 
[fdo#111068] / [i915#658])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb2/
igt@kms_psr2_su@page_flip.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb7/
igt@kms_psr2_su@page_flip.html
> 
>   * igt@kms_psr@psr2_sprite_mmap_gtt:
>     - shard-iclb:         [PASS][82] -> [SKIP][83] ([fdo#109441]) +1 similar 
issue
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb2/
igt@kms_psr@psr2_sprite_mmap_gtt.html
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb3/
igt@kms_psr@psr2_sprite_mmap_gtt.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
>     - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278]) +8 similar 
issues
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb1/
igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#2437])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb6/
igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2437]) 
+1 similar issue
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl1/
igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2437])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk1/
igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
>     - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271]) +213 similar 
issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl6/
igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html
> 
>   * igt@nouveau_crc@pipe-c-source-outp-inactive:
>     - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2530]) +1 similar 
issue
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb2/
igt@nouveau_crc@pipe-c-source-outp-inactive.html
>     - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#2530]) +1 similar 
issue
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb5/
igt@nouveau_crc@pipe-c-source-outp-inactive.html
> 
>   * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
>     - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109291]) +1 similar 
issue
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb8/
igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html
> 
>   * igt@sysfs_clients@fair-0:
>     - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#2994])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb7/
igt@sysfs_clients@fair-0.html
>     - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#2994]) 
+2 similar issues
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk3/
igt@sysfs_clients@fair-0.html
>     - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#2994])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb1/
igt@sysfs_clients@fair-0.html
> 
>   * igt@sysfs_clients@fair-1:
>     - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2994]) 
+2 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl1/
igt@sysfs_clients@fair-1.html
> 
>   * igt@sysfs_clients@sema-25:
>     - shard-kbl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2994]) 
+2 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl4/
igt@sysfs_clients@sema-25.html
> 
>   * igt@sysfs_heartbeat_interval@mixed@bcs0:
>     - shard-glk:          NOTRUN -> [FAIL][97] ([i915#1731])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk7/
igt@sysfs_heartbeat_interval@mixed@bcs0.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@feature_discovery@psr2:
>     - shard-iclb:         [SKIP][98] ([i915#658]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb3/
igt@feature_discovery@psr2.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb2/
igt@feature_discovery@psr2.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-iclb:         [FAIL][100] ([i915#2842]) -> [PASS][101] +1 
similar issue
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb4/
igt@gem_exec_fair@basic-none-share@rcs0.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb7/
igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-kbl:          [FAIL][102] ([i915#2842]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl2/
igt@gem_exec_fair@basic-none@vecs0.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl4/
igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [FAIL][104] ([i915#2842]) -> [PASS][105] +1 
similar issue
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-glk3/
igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk9/
igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_vm_create@destroy-race:
>     - shard-tglb:         [TIMEOUT][106] ([i915#2795]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-tglb2/
igt@gem_vm_create@destroy-race.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-tglb3/
igt@gem_vm_create@destroy-race.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-suspend:
>     - shard-kbl:          [INCOMPLETE][108] ([i915#155] / [i915#2405]) -> 
[PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl2/
igt@kms_cursor_crc@pipe-b-cursor-suspend.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl3/
igt@kms_cursor_crc@pipe-b-cursor-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp1:
>     - shard-kbl:          [DMESG-WARN][110] ([i915#180]) -> [PASS][111] +4 
similar issues
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl1/
igt@kms_flip@flip-vs-suspend@c-dp1.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl3/
igt@kms_flip@flip-vs-suspend@c-dp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-stridechange:
>     - shard-glk:          [FAIL][112] ([i915#49]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-glk2/
igt@kms_frontbuffer_tracking@fbc-stridechange.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk9/
igt@kms_frontbuffer_tracking@fbc-stridechange.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
>     - shard-kbl:          [DMESG-WARN][114] ([i915#180] / [i915#533]) -> 
[PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl1/
igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl6/
igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
> 
>   * igt@kms_properties@connector-properties-atomic:
>     - shard-glk:          [DMESG-WARN][116] ([i915#118] / [i915#95]) -> 
[PASS][117] +3 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-glk2/
igt@kms_properties@connector-properties-atomic.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-glk8/
igt@kms_properties@connector-properties-atomic.html
> 
>   * igt@kms_psr2_su@frontbuffer:
>     - shard-iclb:         [SKIP][118] ([fdo#109642] / [fdo#111068] / 
[i915#658]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb4/
igt@kms_psr2_su@frontbuffer.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb2/
igt@kms_psr2_su@frontbuffer.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         [SKIP][120] ([fdo#109441]) -> [PASS][121] +2 
similar issues
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb8/
igt@kms_psr@psr2_primary_mmap_cpu.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb2/
igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_fair@basic-pace@vcs1:
>     - shard-kbl:          [SKIP][122] ([fdo#109271]) -> [FAIL][123] 
([i915#2842])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl7/
igt@gem_exec_fair@basic-pace@vcs1.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl1/
igt@gem_exec_fair@basic-pace@vcs1.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-iclb:         [FAIL][124] ([i915#2842]) -> [FAIL][125] 
([i915#2849])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb6/
igt@gem_exec_fair@basic-throttle@rcs0.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb8/
igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-iclb:         [WARN][126] ([i915#2684]) -> [WARN][127] 
([i915#1804] / [i915#2684])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb8/
igt@i915_pm_rc6_residency@rc6-idle.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb3/
igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
>     - shard-iclb:         [SKIP][128] ([i915#658]) -> [SKIP][129] 
([i915#2920]) +1 similar issue
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb5/
igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb2/
igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
>     - shard-iclb:         [SKIP][130] ([i915#2920]) -> [SKIP][131] 
([i915#658]) +1 similar issue
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-iclb2/
igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-iclb4/
igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
> 
>   * igt@runner@aborted:
>     - shard-kbl:          ([FAIL][132], [FAIL][133], [FAIL][134], [FAIL]
[135], [FAIL][136], [FAIL][137]) ([i915#180] / [i915#1814] / [i915#2292] / 
[i915#3002] / [i915#3363]) -> ([FAIL][138], [FAIL][139], [FAIL][140], [FAIL]
[141]) ([i915#180] / [i915#3002] / [i915#3363])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl1/
igt@runner@aborted.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl3/
igt@runner@aborted.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl3/
igt@runner@aborted.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl1/
igt@runner@aborted.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl1/
igt@runner@aborted.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-kbl1/
igt@runner@aborted.html
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl1/
igt@runner@aborted.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl1/
igt@runner@aborted.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl1/
igt@runner@aborted.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-kbl7/
igt@runner@aborted.html
>     - shard-apl:          ([FAIL][142], [FAIL][143]) ([i915#3002] / 
[i915#3363]) -> ([FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147]) 
([i915#180] / [i915#1814] / [i915#3002] / [i915#3363])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-apl7/
igt@runner@aborted.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6080/shard-apl3/
igt@runner@aborted.html
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl1/
igt@runner@aborted.html
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/shard-apl1/
igt@runner@aborted.html
>    [146]: https://intel-gfx-ci.01.org/tree/
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5786/
index.html
> 




_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
