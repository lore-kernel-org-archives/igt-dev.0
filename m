Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6B66E2DF
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 06:58:52 +0000 (UTC)
Date: Tue, 5 Oct 2021 10:02:21 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YVv4fS0FmebkgsbU@platvala-desk.ger.corp.intel.com>
References: <20210903123027.1433-1-contact@emersion.fr>
 <163336783774.1478.7849799296571463872@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163336783774.1478.7849799296571463872@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Flease=3A_add_empty_lease_test_=28rev2=29?=
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
Cc: Simon Ser <contact@emersion.fr>
List-ID: <igt-dev@lists.freedesktop.org>

Meh, invalid-create-leases didn't get to execute...

Nevertheless, merged.


-- 
Petri Latvala


On Mon, Oct 04, 2021 at 05:17:17PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_lease: add empty lease test (rev2)
> URL   : https://patchwork.freedesktop.org/series/94323/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_6229_full -> IGTPW_6279_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/index.html
> 
> New tests
> ---------
> 
>   New tests have been introduced between IGT_6229_full and IGTPW_6279_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_lease@empty_lease:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6279_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_persistence@legacy-engines-queued:
>     - shard-snb:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +7 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html
> 
>   * igt@gem_eio@in-flight-contexts-immediate:
>     - shard-tglb:         [PASS][2] -> [TIMEOUT][3] ([i915#3063])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb1/igt@gem_eio@in-flight-contexts-immediate.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb5/igt@gem_eio@in-flight-contexts-immediate.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-tglb:         NOTRUN -> [TIMEOUT][4] ([i915#2369] / [i915#3063] / [i915#3648])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb7/igt@gem_eio@unwedge-stress.html
>     - shard-snb:          NOTRUN -> [FAIL][5] ([i915#3354])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-snb2/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-apl:          NOTRUN -> [FAIL][6] ([i915#2846])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl8/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#2842])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#2842]) +1 similar issue
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl6/igt@gem_exec_fair@basic-none@rcs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs1:
>     - shard-iclb:         NOTRUN -> [FAIL][11] ([i915#2842])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][12] ([i915#2842]) +1 similar issue
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vcs0:
>     - shard-kbl:          [PASS][13] -> [SKIP][14] ([fdo#109271])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][15] ([i915#2842])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
>     - shard-iclb:         NOTRUN -> [FAIL][16] ([i915#2849])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-snb:          NOTRUN -> [SKIP][17] ([fdo#109271]) +487 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>     - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109313])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>     - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109313])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-tglb:         [PASS][20] -> [SKIP][21] ([i915#2190])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb5/igt@gem_huc_copy@huc-copy.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb6/igt@gem_huc_copy@huc-copy.html
>     - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#2190])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl8/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-linear:
>     - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#768]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb7/igt@gem_render_copy@y-tiled-to-vebox-linear.html
> 
>   * igt@gem_userptr_blits@input-checking:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][24] ([i915#3002])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl8/igt@gem_userptr_blits@input-checking.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#109289]) +2 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb1/igt@gen3_render_linear_blits.html
> 
>   * igt@gen3_render_mixed_blits:
>     - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109289])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb2/igt@gen3_render_mixed_blits.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#2856])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb3/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-kbl:          NOTRUN -> [FAIL][28] ([i915#454])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html
>     - shard-tglb:         NOTRUN -> [FAIL][29] ([i915#454])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-tglb:         NOTRUN -> [WARN][30] ([i915#2681] / [i915#2684])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109293] / [fdo#109506])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
>     - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109506] / [i915#2411])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-tglb:         [PASS][33] -> [INCOMPLETE][34] ([i915#2411] / [i915#456])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb7/igt@i915_pm_rpm@system-suspend.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb7/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][35] ([i915#180])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#1769])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-180:
>     - shard-glk:          [PASS][37] -> [DMESG-WARN][38] ([i915#118] / [i915#95])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#110725] / [fdo#111614])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111614]) +1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110723])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3777]) +3 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_joiner@2x-modeset:
>     - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#2705])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb8/igt@kms_big_joiner@2x-modeset.html
>     - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#2705])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb1/igt@kms_big_joiner@2x-modeset.html
> 
>   * igt@kms_busy@basic@modeset:
>     - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#1385])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl3/igt@kms_busy@basic@modeset.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl6/igt@kms_busy@basic@modeset.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3689] / [i915#3886]) +1 similar issue
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
>     - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886]) +8 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl1/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +15 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689]) +13 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb8/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
>     - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3886])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-glk2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
>     - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [i915#3886])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_chamelium@dp-hpd-fast:
>     - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-glk1/igt@kms_chamelium@dp-hpd-fast.html
> 
>   * igt@kms_chamelium@hdmi-audio:
>     - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +7 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb3/igt@kms_chamelium@hdmi-audio.html
> 
>   * igt@kms_chamelium@hdmi-edid-change-during-suspend:
>     - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +27 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl1/igt@kms_chamelium@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium@vga-hpd-without-ddc:
>     - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +28 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html
> 
>   * igt@kms_color@pipe-d-ctm-blue-to-red:
>     - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278] / [i915#1149])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb1/igt@kms_color@pipe-d-ctm-blue-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-a-degamma:
>     - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +17 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl6/igt@kms_color_chamelium@pipe-a-degamma.html
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
>     - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109284] / [fdo#111827]) +11 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
>     - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278] / [fdo#109284] / [fdo#111827])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html
> 
>   * igt@kms_concurrent@pipe-d:
>     - shard-tglb:         NOTRUN -> [FAIL][61] ([i915#1385])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb3/igt@kms_concurrent@pipe-d.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-kbl:          NOTRUN -> [TIMEOUT][62] ([i915#1319]) +1 similar issue
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl7/igt@kms_content_protection@legacy.html
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111828]) +1 similar issue
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb1/igt@kms_content_protection@legacy.html
>     - shard-apl:          NOTRUN -> [TIMEOUT][64] ([i915#1319])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl7/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
>     - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278] / [fdo#109279]) +2 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb2/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-kbl:          [PASS][66] -> [INCOMPLETE][67] ([i915#155] / [i915#2828])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>     - shard-apl:          [PASS][68] -> [DMESG-WARN][69] ([i915#180])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
>     - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3359]) +3 similar issues
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-512x170-random:
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109279] / [i915#3359]) +2 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
>     - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#3319]) +4 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-random.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
>     - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271]) +210 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl3/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html
> 
>   * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][74] ([i915#62] / [i915#92]) +2 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl6/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
> 
>   * igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:
>     - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109278]) +23 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb7/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-kbl:          [PASS][76] -> [DMESG-WARN][77] ([i915#533] / [i915#62] / [i915#92])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109274] / [fdo#109278]) +4 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111825]) +35 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
>     - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3788])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb3/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-iclb:         NOTRUN -> [DMESG-WARN][81] ([i915#1226])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb1/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109274]) +6 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-edp1:
>     - shard-iclb:         [PASS][83] -> [DMESG-WARN][84] ([i915#2867])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb8/igt@kms_flip@flip-vs-suspend@c-edp1.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb3/igt@kms_flip@flip-vs-suspend@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
>     - shard-iclb:         [PASS][85] -> [SKIP][86] ([i915#3701])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109280]) +18 similar issues
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>     - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#533]) +1 similar issue
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
>     - shard-kbl:          [PASS][89] -> [DMESG-WARN][90] ([i915#180]) +3 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
>     - shard-apl:          NOTRUN -> [FAIL][91] ([fdo#108145] / [i915#265]) +2 similar issues
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
>     - shard-kbl:          NOTRUN -> [DMESG-FAIL][92] ([fdo#108145] / [i915#265] / [i915#62])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>     - shard-glk:          NOTRUN -> [FAIL][93] ([i915#265])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
>     - shard-apl:          NOTRUN -> [FAIL][94] ([i915#265])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
>     - shard-kbl:          NOTRUN -> [FAIL][95] ([i915#265])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
>     - shard-kbl:          NOTRUN -> [FAIL][96] ([fdo#108145] / [i915#265]) +3 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
>     - shard-glk:          NOTRUN -> [FAIL][97] ([fdo#108145] / [i915#265]) +1 similar issue
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
> 
>   * igt@kms_plane_cursor@pipe-d-viewport-size-256:
>     - shard-glk:          NOTRUN -> [SKIP][98] ([fdo#109271]) +70 similar issues
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-glk7/igt@kms_plane_cursor@pipe-d-viewport-size-256.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-y:
>     - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#3536]) +1 similar issue
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb7/igt@kms_plane_lowres@pipe-a-tiling-y.html
> 
>   * igt@kms_plane_lowres@pipe-b-tiling-none:
>     - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#3536]) +3 similar issues
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb8/igt@kms_plane_lowres@pipe-b-tiling-none.html
> 
>   * igt@kms_properties@invalid-properties-legacy:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][101] ([i915#165])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl2/igt@kms_properties@invalid-properties-legacy.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
>     - shard-glk:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#658])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-glk3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
>     - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2920]) +2 similar issues
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
>     - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#658]) +4 similar issues
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
>     - shard-kbl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#658]) +1 similar issue
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
> 
>   * igt@kms_psr@psr2_no_drrs:
>     - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109441]) +2 similar issues
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb5/igt@kms_psr@psr2_no_drrs.html
> 
>   * igt@kms_psr@psr2_sprite_mmap_cpu:
>     - shard-tglb:         NOTRUN -> [FAIL][107] ([i915#132] / [i915#3467]) +2 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb7/igt@kms_psr@psr2_sprite_mmap_cpu.html
> 
>   * igt@kms_psr@psr2_sprite_plane_onoff:
>     - shard-iclb:         [PASS][108] -> [SKIP][109] ([fdo#109441]) +1 similar issue
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb4/igt@kms_psr@psr2_sprite_plane_onoff.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#111615]) +6 similar issues
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_setmode@basic:
>     - shard-snb:          NOTRUN -> [FAIL][111] ([i915#31])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-snb2/igt@kms_setmode@basic.html
> 
>   * igt@kms_vblank@pipe-a-ts-continuation-suspend:
>     - shard-apl:          [PASS][112] -> [DMESG-WARN][113] ([i915#180] / [i915#295])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
> 
>   * igt@kms_vblank@pipe-b-wait-idle-hang:
>     - shard-kbl:          [PASS][114] -> [DMESG-WARN][115] ([i915#62] / [i915#92]) +3 similar issues
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@kms_vblank@pipe-b-wait-idle-hang.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl6/igt@kms_vblank@pipe-b-wait-idle-hang.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-idle:
>     - shard-apl:          NOTRUN -> [SKIP][116] ([fdo#109271]) +303 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl3/igt@kms_vblank@pipe-d-ts-continuation-idle.html
> 
>   * igt@kms_vblank@pipe-d-wait-idle:
>     - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#533]) +2 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-kbl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#2437])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl7/igt@kms_writeback@writeback-pixel-formats.html
>     - shard-apl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2437])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@nouveau_crc@pipe-c-source-rg:
>     - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#2530]) +1 similar issue
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb8/igt@nouveau_crc@pipe-c-source-rg.html
>     - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#2530])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb8/igt@nouveau_crc@pipe-c-source-rg.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#112283])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb6/igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@prime_nv_pcopy@test3_5:
>     - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#109291]) +2 similar issues
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb3/igt@prime_nv_pcopy@test3_5.html
> 
>   * igt@sysfs_clients@fair-0:
>     - shard-apl:          NOTRUN -> [SKIP][124] ([fdo#109271] / [i915#2994])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-apl6/igt@sysfs_clients@fair-0.html
> 
>   * igt@sysfs_clients@fair-3:
>     - shard-kbl:          NOTRUN -> [SKIP][125] ([fdo#109271] / [i915#2994])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl3/igt@sysfs_clients@fair-3.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-iclb:         [TIMEOUT][126] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb5/igt@gem_eio@unwedge-stress.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb1/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-kbl:          [FAIL][128] ([i915#2842]) -> [PASS][129] +1 similar issue
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html
>     - shard-tglb:         [FAIL][130] ([i915#2842]) -> [PASS][131] +1 similar issue
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb5/igt@gem_exec_fair@basic-pace@rcs0.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html
>     - shard-glk:          [FAIL][132] ([i915#2842]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-iclb:         [FAIL][134] ([i915#2842]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-iclb:         [SKIP][136] -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/shard-iclb7/igt@i915_pm_
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6279/index.html
