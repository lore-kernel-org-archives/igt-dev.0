Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109EE6E0C4
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 10:18:41 +0000 (UTC)
Date: Fri, 8 Oct 2021 13:22:12 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YWAb1EIeES2bb6gz@platvala-desk.ger.corp.intel.com>
References: <20211007172011.16871-1-igormtorrente@gmail.com>
 <163364551577.5188.7014432892948444348@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163364551577.5188.7014432892948444348@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fwriteback=2Ec=3A_fix_the_=60fill=5Ffb=60_function_=28rev2?=
 =?utf-8?q?=29?=
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
Cc: Igor Torrente <igormtorrente@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 07, 2021 at 10:25:15PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_writeback.c: fix the `fill_fb` function (rev2)
> URL   : https://patchwork.freedesktop.org/series/95459/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10696_full -> IGTPW_6299_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6299_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6299_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6299_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@kms_invalid_mode@clock-too-high:
>     - shard-tglb:         NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb6/igt@kms_invalid_mode@clock-too-high.html
> 

Lakshmi, false positives here.

-- 
Petri Latvala



>   
> #### Warnings ####
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-iclb:         [SKIP][4] ([i915#2437]) -> [SKIP][5] +3 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-iclb8/igt@kms_writeback@writeback-check-output.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb3/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-tglb:         [SKIP][6] ([i915#2437]) -> [SKIP][7] +3 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-tglb3/igt@kms_writeback@writeback-invalid-parameters.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb5/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6299_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@feature_discovery@chamelium:
>     - shard-tglb:         NOTRUN -> [SKIP][8] ([fdo#111827])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb1/igt@feature_discovery@chamelium.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-queued:
>     - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099]) +2 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-snb5/igt@gem_ctx_persistence@legacy-engines-queued.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#280])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb8/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-tglb:         NOTRUN -> [TIMEOUT][11] ([i915#3063])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb6/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   * igt@gem_eio@in-flight-contexts-1us:
>     - shard-tglb:         [PASS][12] -> [TIMEOUT][13] ([i915#3063])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-tglb2/igt@gem_eio@in-flight-contexts-1us.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb2/igt@gem_eio@in-flight-contexts-1us.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-tglb:         [PASS][14] -> [TIMEOUT][15] ([i915#2369] / [i915#3063] / [i915#3648])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-tglb7/igt@gem_eio@unwedge-stress.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb1/igt@gem_eio@unwedge-stress.html
>     - shard-iclb:         [PASS][16] -> [TIMEOUT][17] ([i915#2369] / [i915#2481] / [i915#3070])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-iclb3/igt@gem_eio@unwedge-stress.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb8/igt@gem_eio@unwedge-stress.html
>     - shard-snb:          NOTRUN -> [FAIL][18] ([i915#3354])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-snb2/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-pace@bcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2842]) +4 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#2842]) +1 similar issue
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_whisper@basic-normal:
>     - shard-glk:          NOTRUN -> [DMESG-WARN][22] ([i915#118])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-glk4/igt@gem_exec_whisper@basic-normal.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-snb:          NOTRUN -> [WARN][23] ([i915#2658])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-snb5/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-apl:          NOTRUN -> [WARN][24] ([i915#2658])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl1/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#4270]) +3 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#768])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_userptr_blits@access-control:
>     - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#3297])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb1/igt@gem_userptr_blits@access-control.html
> 
>   * igt@gem_userptr_blits@input-checking:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][28] ([i915#3002])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl3/igt@gem_userptr_blits@input-checking.html
>     - shard-snb:          NOTRUN -> [DMESG-WARN][29] ([i915#3002])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-snb2/igt@gem_userptr_blits@input-checking.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109289]) +6 similar issues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb6/igt@gen3_render_linear_blits.html
> 
>   * igt@gen9_exec_parse@batch-invalid-length:
>     - shard-snb:          NOTRUN -> [SKIP][31] ([fdo#109271]) +369 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-snb5/igt@gen9_exec_parse@batch-invalid-length.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#2856]) +4 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb5/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#2856])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb7/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-tglb:         NOTRUN -> [FAIL][34] ([i915#454])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111644] / [i915#1397] / [i915#2411])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#109506] / [i915#2411])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@i915_pm_rpm@system-suspend-modeset:
>     - shard-tglb:         NOTRUN -> [INCOMPLETE][37] ([i915#2411] / [i915#456])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb7/igt@i915_pm_rpm@system-suspend-modeset.html
> 
>   * igt@i915_query@query-topology-unsupported:
>     - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109302])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb5/igt@i915_query@query-topology-unsupported.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111614]) +1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3777])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3777]) +1 similar issue
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3777])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-glk4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>     - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#110723])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111615]) +11 similar issues
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +4 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-glk6/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>     - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3886]) +10 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>     - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886]) +5 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl7/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689]) +12 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3689] / [i915#3886]) +3 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb3/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_chamelium@dp-hpd-storm-disable:
>     - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-glk9/igt@kms_chamelium@dp-hpd-storm-disable.html
> 
>   * igt@kms_chamelium@hdmi-crc-fast:
>     - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +16 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl6/igt@kms_chamelium@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
>     - shard-snb:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +13 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium@hdmi-hpd-storm:
>     - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +7 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl6/igt@kms_chamelium@hdmi-hpd-storm.html
> 
>   * igt@kms_chamelium@vga-hpd-for-each-pipe:
>     - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +12 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb6/igt@kms_chamelium@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
>     - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109284] / [fdo#111827])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-0-25:
>     - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278] / [fdo#109284] / [fdo#111827])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111828])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb1/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3359]) +3 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
>     - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109279] / [i915#3359]) +3 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
>     - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#3319]) +4 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-suspend:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][61] ([i915#180])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen:
>     - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278]) +1 similar issue
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111825]) +46 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@pipe-d-torture-bo:
>     - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#533]) +1 similar issue
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl2/igt@kms_cursor_legacy@pipe-d-torture-bo.html
>     - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#533])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-glk3/igt@kms_cursor_legacy@pipe-d-torture-bo.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#4103])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
>     - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3788])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb5/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-tglb:         [PASS][68] -> [INCOMPLETE][69] ([i915#456])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html
>     - shard-kbl:          NOTRUN -> [INCOMPLETE][70] ([i915#180] / [i915#636])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109274])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb5/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>     - shard-kbl:          [PASS][72] -> [DMESG-WARN][73] ([i915#180]) +4 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
>     - shard-iclb:         [PASS][74] -> [SKIP][75] ([i915#3701]) +1 similar issue
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
>     - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#2672])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271]) +263 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-tglb:         [PASS][78] -> [INCOMPLETE][79] ([i915#2411] / [i915#456])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
>     - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271]) +115 similar issues
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109280]) +2 similar issues
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
>     - shard-kbl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#533]) +1 similar issue
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl7/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
>     - shard-kbl:          NOTRUN -> [DMESG-WARN][83] ([i915#180]) +1 similar issue
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
>     - shard-tglb:         [PASS][84] -> [INCOMPLETE][85] ([i915#2828] / [i915#456])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>     - shard-apl:          NOTRUN -> [FAIL][86] ([fdo#108145] / [i915#265]) +2 similar issues
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
>     - shard-kbl:          NOTRUN -> [FAIL][87] ([fdo#108145] / [i915#265])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
> 
>   * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
>     - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2733])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl7/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
>     - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#2733])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
>     - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2733])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-glk9/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
>     - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#658])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
>     - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#658]) +4 similar issues
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
>     - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2920]) +1 similar issue
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
> 
>   * igt@kms_psr@psr2_primary_mmap_gtt:
>     - shard-iclb:         [PASS][94] -> [SKIP][95] ([fdo#109441]) +1 similar issue
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb7/igt@kms_psr@psr2_primary_mmap_gtt.html
> 
>   * igt@kms_psr@psr2_sprite_blt:
>     - shard-tglb:         NOTRUN -> [FAIL][96] ([i915#132] / [i915#3467]) +3 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb8/igt@kms_psr@psr2_sprite_blt.html
>     - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109441])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-glk:          NOTRUN -> [SKIP][98] ([fdo#109271]) +52 similar issues
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-glk8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@nouveau_crc@pipe-c-source-outp-complete:
>     - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#2530]) +3 similar issues
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb7/igt@nouveau_crc@pipe-c-source-outp-complete.html
> 
>   * igt@prime_nv_pcopy@test3_1:
>     - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109291]) +6 similar issues
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb3/igt@prime_nv_pcopy@test3_1.html
> 
>   * igt@prime_nv_test@i915_nv_sharing:
>     - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109291])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb7/igt@prime_nv_test@i915_nv_sharing.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109295]) +1 similar issue
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb6/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@sysfs_clients@create:
>     - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2994]) +2 similar issues
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb3/igt@sysfs_clients@create.html
>     - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2994]) +4 similar issues
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl3/igt@sysfs_clients@create.html
> 
>   * igt@sysfs_clients@recycle:
>     - shard-glk:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#2994])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-glk8/igt@sysfs_clients@recycle.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@feature_discovery@psr2:
>     - shard-iclb:         [SKIP][106] ([i915#658]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-iclb8/igt@feature_discovery@psr2.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb2/igt@feature_discovery@psr2.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglb:         [FAIL][108] ([i915#2842]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-apl:          [FAIL][110] ([i915#2842]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-kbl:          [FAIL][112] ([i915#2842]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [FAIL][114] ([i915#2842]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_sync@basic-many-each:
>     - shard-apl:          [INCOMPLETE][116] ([i915#4274]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-apl1/igt@gem_sync@basic-many-each.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl8/igt@gem_sync@basic-many-each.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-iclb:         [FAIL][118] ([i915#4275]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-snb:          [INCOMPLETE][120] ([i915#3921]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-snb2/igt@i915_selftest@live@hangcheck.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-snb2/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-tglb:         [INCOMPLETE][122] ([i915#2411] / [i915#456]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-tglb7/igt@i915_suspend@forcewake.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb8/igt@i915_suspend@forcewake.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-0:
>     - shard-glk:          [DMESG-WARN][124] ([i915#118]) -> [PASS][125] +1 similar issue
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-0.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-suspend:
>     - shard-tglb:         [INCOMPLETE][126] ([i915#2411] / [i915#4211]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-dp1:
>     - shard-apl:          [DMESG-WARN][128] ([i915#180] / [i915#1982]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-edp1:
>     - shard-tglb:         [INCOMPLETE][130] ([i915#456]) -> [PASS][131] +1 similar issue
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-tglb7/igt@kms_flip@flip-vs-suspend@a-edp1.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-tglb2/igt@kms_flip@flip-vs-suspend@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp1:
>     - shard-kbl:          [DMESG-WARN][132] ([i915#180]) -> [PASS][133] +2 similar issues
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-apl:          [DMESG-WARN][134] ([i915#180]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10696/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/shard-apl7/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * ig
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6299/index.html
