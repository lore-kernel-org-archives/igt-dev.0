Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BB86EB1B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 May 2021 15:01:06 +0000 (UTC)
Date: Tue, 4 May 2021 18:00:58 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20210504150058.GB30246@ideak-desk.fi.intel.com>
References: <20210429192628.4056795-1-imre.deak@intel.com>
 <161974412821.17884.14333591157395148453@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161974412821.17884.14333591157395148453@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_A_few_changes_to_fix_test_runs_on_ADL=5FP?=
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
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 12:55:28AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_fb: A few changes to fix test runs on ADL_P
> URL   : https://patchwork.freedesktop.org/series/89668/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10028_full -> IGTPW_5771_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5771_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5771_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5771_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@pixel-format-pipe-a-planes:
>     - shard-tglb:         [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-tglb3/igt@kms_plane@pixel-format-pipe-a-planes.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb7/igt@kms_plane@pixel-format-pipe-a-planes.html

Test requirement not met in function test_format_plane, file ../tests/kms_plane.c:912:
Test requirement: num_unique_crcs(ref_crc[PLANAR_CRC_SET], data->num_colors) > 1

after a bunch of CRC mismatches, so I suppose the CRC generation gets
stuck at one point.

It's on the same path this patchset changes, however on TGL the patchset
should have no functional change: the stride calculated by
__intel_buf_init() and the stride passed to it by
igt_fb_create_intel_buf() always match based on my tests. After testing
the same CI testlist locally on 2 TGLs, I also rerun the testlist where
this problem didn't happen:

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5781/shard-tglb2/igt@kms_plane@pixel-format-pipe-a-planes.html

>   * igt@kms_vblank@pipe-d-wait-forked:
>     - shard-tglb:         [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-tglb2/igt@kms_vblank@pipe-d-wait-forked.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb5/igt@kms_vblank@pipe-d-wait-forked.html

<7> [18.622058] i915 0000:00:02.0: [drm:drm_dp_dpcd_access] AUX A/DDI A/PHY A: Too many retries, giving up. First error: -110
<3> [18.622083] i915 0000:00:02.0: [drm] *ERROR* Failed to read DPCD register 0x60

This happens already during boot-up on the same machine. Can't see how
it's related to the changes in this patchset, also happened already
earlier on the same machine:

https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10015/shard-tglb5/boot10.txt

But I couldn't find the same issue happening on any of the other 7 TGLs
in shard. Looks like something with the panel, or shard-tglb5.

> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium}:
>     - shard-tglb:         NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-iclb:         NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_5771_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@feature_discovery@chamelium:
>     - shard-iclb:         NOTRUN -> [SKIP][7] ([fdo#111827])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb8/igt@feature_discovery@chamelium.html
> 
>   * igt@gem_create@create-massive:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][8] ([i915#3002])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-snb2/igt@gem_create@create-massive.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-tglb:         NOTRUN -> [SKIP][9] ([fdo#109314])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb6/igt@gem_ctx_param@set-priority-not-supported.html
>     - shard-iclb:         NOTRUN -> [SKIP][10] ([fdo#109314])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb7/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_persistence@idempotent:
>     - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +5 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-snb5/igt@gem_ctx_persistence@idempotent.html
> 
>   * igt@gem_ctx_persistence@many-contexts:
>     - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2410])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-tglb8/igt@gem_ctx_persistence@many-contexts.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb8/igt@gem_ctx_persistence@many-contexts.html
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2842])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk1/igt@gem_exec_fair@basic-none@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][15] ([i915#2842]) +4 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb8/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-iclb:         NOTRUN -> [FAIL][16] ([i915#2842]) +3 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb8/igt@gem_exec_fair@basic-none@vecs0.html
>     - shard-kbl:          NOTRUN -> [FAIL][17] ([i915#2842])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#2842]) +2 similar issues
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_reloc@basic-wide-active@vcs1:
>     - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2389])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html
> 
>   * igt@gem_exec_whisper@basic-contexts-all:
>     - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#118] / [i915#95]) +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-glk2/igt@gem_exec_whisper@basic-contexts-all.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk9/igt@gem_exec_whisper@basic-contexts-all.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-tglb:         NOTRUN -> [WARN][23] ([i915#2658])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb3/igt@gem_pread@exhaustion.html
>     - shard-glk:          NOTRUN -> [WARN][24] ([i915#2658])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk3/igt@gem_pread@exhaustion.html
>     - shard-apl:          NOTRUN -> [WARN][25] ([i915#2658])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl2/igt@gem_pread@exhaustion.html
>     - shard-iclb:         NOTRUN -> [WARN][26] ([i915#2658])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb6/igt@gem_pread@exhaustion.html
>     - shard-kbl:          NOTRUN -> [WARN][27] ([i915#2658])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl6/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-snb:          NOTRUN -> [WARN][28] ([i915#2658]) +1 similar issue
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-snb6/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#768]) +1 similar issue
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#3323])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gen3_render_tiledx_blits:
>     - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109289]) +1 similar issue
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb1/igt@gen3_render_tiledx_blits.html
>     - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109289])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb1/igt@gen3_render_tiledx_blits.html
> 
>   * igt@gen7_exec_parse@basic-offset:
>     - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271]) +248 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl7/igt@gen7_exec_parse@basic-offset.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#112306])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb2/igt@gen9_exec_parse@allowed-all.html
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#112306])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb5/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-iclb:         [PASS][36] -> [FAIL][37] ([i915#454])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-tglb:         NOTRUN -> [FAIL][38] ([i915#454])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>     - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#1937])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
>     - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#1937])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
> 
>   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>     - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#1937])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][42] ([i915#2782])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-snb6/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-apl6/igt@i915_suspend@sysfs-reader.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl8/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615]) +5 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_chamelium@dp-crc-multiple:
>     - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +20 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl7/igt@kms_chamelium@dp-crc-multiple.html
> 
>   * igt@kms_chamelium@hdmi-audio-edid:
>     - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl1/igt@kms_chamelium@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium@hdmi-mode-timings:
>     - shard-snb:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +20 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-snb6/igt@kms_chamelium@hdmi-mode-timings.html
> 
>   * igt@kms_color@pipe-a-degamma:
>     - shard-tglb:         NOTRUN -> [FAIL][49] ([i915#1149])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb6/igt@kms_color@pipe-a-degamma.html
>     - shard-iclb:         NOTRUN -> [FAIL][50] ([i915#1149])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb7/igt@kms_color@pipe-a-degamma.html
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
>     - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +4 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
>     - shard-glk:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
>     - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827]) +4 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
>     - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278] / [fdo#109284] / [fdo#111827])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-apl:          NOTRUN -> [TIMEOUT][55] ([i915#1319])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl1/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-apl:          NOTRUN -> [FAIL][56] ([i915#2105])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl8/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
>     - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278] / [fdo#109279])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html
>     - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109279] / [i915#3359])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][59] ([i915#180])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
>     - shard-kbl:          NOTRUN -> [SKIP][60] ([fdo#109271]) +51 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html
>     - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3319]) +1 similar issue
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-dpms:
>     - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278]) +12 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-dpms.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3359]) +1 similar issue
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109274] / [fdo#109278])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][65] -> [FAIL][66] ([i915#79])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109274]) +1 similar issue
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][68] -> [FAIL][69] ([i915#2122])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
>     - shard-apl:          NOTRUN -> [FAIL][70] ([i915#79])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
>     - shard-kbl:          [PASS][71] -> [DMESG-WARN][72] ([i915#180])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
>     - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#2587])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
>     - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2672])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271]) +45 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
>     - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109280]) +13 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
>     - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111825]) +17 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#1187])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb2/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
>     - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#533]) +1 similar issue
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
>     - shard-apl:          NOTRUN -> [FAIL][80] ([fdo#108145] / [i915#265]) +1 similar issue
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
>     - shard-kbl:          NOTRUN -> [FAIL][81] ([fdo#108145] / [i915#265])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
>     - shard-glk:          NOTRUN -> [FAIL][82] ([fdo#108145] / [i915#265])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
>     - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#658]) +4 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
>     - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#658]) +1 similar issue
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
>     - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#658]) +1 similar issue
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
>     - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#658]) +1 similar issue
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
> 
>   * igt@kms_psr2_su@page_flip:
>     - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#1911])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb6/igt@kms_psr2_su@page_flip.html
>     - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb8/igt@kms_psr2_su@page_flip.html
> 
>   * igt@kms_psr@psr2_primary_page_flip:
>     - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109441]) +1 similar issue
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
> 
>   * igt@kms_psr@psr2_sprite_mmap_gtt:
>     - shard-iclb:         [PASS][90] -> [SKIP][91] ([fdo#109441]) +1 similar issue
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html
> 
>   * igt@kms_psr@psr2_sprite_render:
>     - shard-tglb:         NOTRUN -> [FAIL][92] ([i915#132]) +1 similar issue
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb5/igt@kms_psr@psr2_sprite_render.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109309])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb3/igt@kms_tv_load_detect@load-detect.html
>     - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109309])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb1/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-suspend:
>     - shard-kbl:          NOTRUN -> [INCOMPLETE][95] ([i915#155] / [i915#2828])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
> 
>   * igt@kms_vblank@pipe-d-query-forked-hang:
>     - shard-snb:          NOTRUN -> [SKIP][96] ([fdo#109271]) +378 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-snb2/igt@kms_vblank@pipe-d-query-forked-hang.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109502])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb4/igt@kms_vrr@flip-suspend.html
>     - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109502])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb1/igt@kms_vrr@flip-suspend.html
> 
>   * igt@nouveau_crc@pipe-a-source-rg:
>     - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#2530])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb6/igt@nouveau_crc@pipe-a-source-rg.html
>     - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#2530]) +1 similar issue
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb8/igt@nouveau_crc@pipe-a-source-rg.html
> 
>   * igt@nouveau_crc@pipe-d-source-outp-complete:
>     - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109278] / [i915#2530])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb3/igt@nouveau_crc@pipe-d-source-outp-complete.html
> 
>   * igt@prime_nv_api@nv_self_import:
>     - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109291]) +2 similar issues
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb7/igt@prime_nv_api@nv_self_import.html
> 
>   * igt@prime_nv_pcopy@test1_macro:
>     - shard-tglb:         NOTRUN -> [SKIP][103] ([fdo#109291]) +1 similar issue
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb3/igt@prime_nv_pcopy@test1_macro.html
> 
>   * igt@sysfs_clients@create:
>     - shard-glk:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2994])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk1/igt@sysfs_clients@create.html
>     - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#2994]) +1 similar issue
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb8/igt@sysfs_clients@create.html
>     - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2994]) +2 similar issues
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl8/igt@sysfs_clients@create.html
>     - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#2994]) +1 similar issue
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb8/igt@sysfs_clients@create.html
>     - shard-kbl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2994])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl7/igt@sysfs_clients@create.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_isolation@preservation-s3@vcs1:
>     - shard-tglb:         [INCOMPLETE][109] -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-tglb6/igt@gem_ctx_isolation@preservation-s3@vcs1.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb1/igt@gem_ctx_isolation@preservation-s3@vcs1.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-apl:          [DMESG-WARN][111] ([i915#180]) -> [PASS][112] +1 similar issue
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-apl2/igt@gem_eio@in-flight-suspend.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl7/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-tglb:         [TIMEOUT][113] ([i915#2369] / [i915#3063]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-tglb3/igt@gem_eio@unwedge-stress.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb8/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglb:         [FAIL][115] ([i915#2842]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-apl:          [SKIP][117] ([fdo#109271]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-apl8/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_whisper@basic-fds-forked-all:
>     - shard-glk:          [DMESG-WARN][119] ([i915#118] / [i915#95]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-glk6/igt@gem_exec_whisper@basic-fds-forked-all.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk7/igt@gem_exec_whisper@basic-fds-forked-all.html
> 
>   * igt@gem_mmap_gtt@big-copy:
>     - shard-glk:          [FAIL][121] ([i915#307]) -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-glk4/igt@gem_mmap_gtt@big-copy.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-glk6/igt@gem_mmap_gtt@big-copy.html
> 
>   * igt@gem_mmap_gtt@big-copy-odd:
>     - shard-kbl:          [FAIL][123] ([i915#2428] / [i915#307]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-kbl6/igt@gem_mmap_gtt@big-copy-odd.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-kbl3/igt@gem_mmap_gtt@big-copy-odd.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-xy:
>     - shard-iclb:         [FAIL][125] ([i915#307]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-tglb:         [FAIL][127] -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-tglb2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_psr@psr2_cursor_blt:
>     - shard-iclb:         [SKIP][129] ([fdo#109441]) -> [PASS][130] +2 similar issues
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
>     - shard-iclb:         [INCOMPLETE][131] ([i915#1185] / [i915#1373] / [i915#2828]) -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-iclb:         [SKIP][133] ([i915#658]) -> [SKIP][134] ([i915#588])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-iclb:         [WARN][135] ([i915#2684]) -> [WARN][136] ([i915#1804] / [i915#2684])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@kms_dp_dsc@basic-dsc-enable-edp:
>     - shard-iclb:         [DMESG-WARN][137] ([i915#1226]) -> [SKIP][138] ([fdo#109349])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
>     - shard-iclb:         [SKIP][139] ([i915#2920]) -> [SKIP][140] ([i915#658])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
> 
>   * igt@runner@aborted:
>     - shard-kbl:          ([FAIL][141], [FAIL][142]) ([i915#2505] / [i915#3002]) -> ([FAIL][143], [FAIL][144], [FAIL][1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
