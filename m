Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31A110E1ED
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 08:48:19 +0000 (UTC)
Date: Fri, 18 Nov 2022 10:48:32 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y3dG4JrDxKeVzLhd@platvala-desk.ger.corp.intel.com>
References: <20221116111140.2516606-1-petri.latvala@intel.com>
 <166871175469.12189.766214117162298275@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166871175469.12189.766214117162298275@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Don=27t_read_journal_at_all_if_socket_comms_are_used_=28rev?=
 =?utf-8?q?2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 07:02:34PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Don't read journal at all if socket comms are used (rev2)
> URL   : https://patchwork.freedesktop.org/series/110962/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7064_full -> IGTPW_8123_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8123_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8123_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/index.html
> 
> Participating hosts (6 -> 6)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8123_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_whisper@basic-contexts-priority-all:
>     - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb2/igt@gem_exec_whisper@basic-contexts-priority-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb7/igt@gem_exec_whisper@basic-contexts-priority-all.html
> 
>   * igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs:
>     - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-tglb7/igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb8/igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs.html

To the best of my understanding these (and the incompletes from the
previous run) are not caused by the patch. The machines just died,
without any reasonable cause logged anywhere.


-- 
Petri Latvala


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8123_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_balancer@parallel-keep-in-fence:
>     - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#4525])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html
> 
>   * igt@gem_exec_balancer@parallel-out-fence:
>     - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#4525])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#2846])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-glk5/igt@gem_exec_fair@basic-deadline.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk6/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-pace@vcs1:
>     - shard-tglb:         NOTRUN -> [FAIL][10] ([i915#2842]) +4 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb2/igt@gem_exec_fair@basic-pace@vcs1.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-iclb:         NOTRUN -> [FAIL][11] ([i915#2842]) +4 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_lmem_swapping@parallel-random:
>     - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#4613]) +1 similar issue
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb8/igt@gem_lmem_swapping@parallel-random.html
>     - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl8/igt@gem_lmem_swapping@parallel-random.html
>     - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#4613]) +1 similar issue
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb7/igt@gem_lmem_swapping@parallel-random.html
>     - shard-glk:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk1/igt@gem_lmem_swapping@parallel-random.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-3:
>     - shard-snb:          NOTRUN -> [SKIP][16] ([fdo#109271]) +83 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-snb7/igt@gem_pxp@reject-modify-context-protection-off-3.html
>     - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#4270])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb6/igt@gem_pxp@reject-modify-context-protection-off-3.html
>     - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#4270])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-off-3.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#768])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb6/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html
> 
>   * igt@gem_userptr_blits@vma-merge:
>     - shard-apl:          NOTRUN -> [FAIL][20] ([i915#3318])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl1/igt@gem_userptr_blits@vma-merge.html
>     - shard-snb:          NOTRUN -> [FAIL][21] ([i915#2724])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-snb4/igt@gem_userptr_blits@vma-merge.html
>     - shard-tglb:         NOTRUN -> [FAIL][22] ([i915#3318])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb2/igt@gem_userptr_blits@vma-merge.html
>     - shard-glk:          NOTRUN -> [FAIL][23] ([i915#3318])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk8/igt@gem_userptr_blits@vma-merge.html
>     - shard-iclb:         NOTRUN -> [FAIL][24] ([i915#3318])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb7/igt@gem_userptr_blits@vma-merge.html
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#2527] / [i915#2856])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb2/igt@gen9_exec_parse@bb-oversize.html
>     - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#2856])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb7/igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>     - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#5286])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
>     - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#5286])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111614])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb2/igt@kms_big_fb@linear-64bpp-rotate-90.html
>     - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#110725] / [fdo#111614])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111615]) +2 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>     - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#110723])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111615] / [i915#3689]) +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb1/igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>     - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>     - shard-glk:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
>     - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109278] / [i915#3886]) +2 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3689] / [i915#6095])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#6095]) +1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb6/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109278]) +9 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3689]) +1 similar issue
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb2/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_chamelium@dp-edid-read:
>     - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk5/igt@kms_chamelium@dp-edid-read.html
>     - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb6/igt@kms_chamelium@dp-edid-read.html
> 
>   * igt@kms_chamelium@hdmi-edid-change-during-suspend:
>     - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-snb4/igt@kms_chamelium@hdmi-edid-change-during-suspend.html
>     - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html
>     - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#7118])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb1/igt@kms_content_protection@legacy.html
>     - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#7118])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb1/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-1:
>     - shard-apl:          NOTRUN -> [TIMEOUT][50] ([i915#7173])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl6/igt@kms_content_protection@legacy@pipe-a-dp-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-max-size:
>     - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3555]) +2 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb3/igt@kms_cursor_crc@cursor-offscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-max-size:
>     - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#3555]) +4 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb5/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:
>     - shard-tglb:         [PASS][53] -> [DMESG-WARN][54] ([i915#2411] / [i915#2867])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-tglb5/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb2/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@toggle:
>     - shard-iclb:         [PASS][55] -> [FAIL][56] ([i915#2346]) +3 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb5/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][57] -> [FAIL][58] ([i915#407])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-glk8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-hdmi-a1-hdmi-a2.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk9/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109274]) +1 similar issue
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb7/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#2587] / [i915#2672])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#2672]) +2 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#2587] / [i915#2672]) +3 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-iclb:         [PASS][64] -> [SKIP][65] ([i915#3555])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2672] / [i915#3555])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109280] / [fdo#111825]) +12 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#6497])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:
>     - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109280]) +12 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271]) +46 similar issues
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109289])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb8/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
>     - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109289])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1:
>     - shard-iclb:         [PASS][73] -> [SKIP][74] ([i915#5176]) +2 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1:
>     - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271]) +64 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1.html
> 
>   * igt@kms_psr@psr2_primary_blt:
>     - shard-tglb:         NOTRUN -> [FAIL][76] ([i915#132] / [i915#3467])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb2/igt@kms_psr@psr2_primary_blt.html
>     - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109441])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb6/igt@kms_psr@psr2_primary_blt.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         [PASS][78] -> [SKIP][79] ([fdo#109441]) +2 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#5289])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>     - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#5289])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-snb:          [PASS][82] -> [DMESG-WARN][83] ([i915#4528])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-snb5/igt@perf_pmu@module-unload.html
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-snb6/igt@perf_pmu@module-unload.html
> 
>   * igt@sysfs_clients@fair-3:
>     - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#2994])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl2/igt@sysfs_clients@fair-3.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglb:         [FAIL][85] ([i915#2842]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_gttfill@basic:
>     - shard-glk:          [DMESG-WARN][87] ([i915#118]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-glk6/igt@gem_exec_gttfill@basic.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk5/igt@gem_exec_gttfill@basic.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-tglb:         [SKIP][89] ([i915#2190]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-tglb7/igt@gem_huc_copy@huc-copy.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb3/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-apl:          [SKIP][91] ([fdo#109271]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-180:
>     - shard-glk:          [DMESG-FAIL][93] ([i915#118] / [i915#5138]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-glk9/igt@kms_big_fb@linear-16bpp-rotate-180.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk3/igt@kms_big_fb@linear-16bpp-rotate-180.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a2:
>     - shard-glk:          [FAIL][95] ([i915#407]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-glk2/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a2.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk8/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a2.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
>     - shard-apl:          [DMESG-WARN][97] ([i915#180]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
>     - shard-iclb:         [SKIP][99] ([i915#5176]) -> [PASS][100] +1 similar issue
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
> 
>   * igt@kms_psr@psr2_no_drrs:
>     - shard-iclb:         [SKIP][101] ([fdo#109441]) -> [PASS][102] +1 similar issue
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb6/igt@kms_psr@psr2_no_drrs.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglb:         [SKIP][103] ([i915#5519]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-iclb:         [SKIP][105] ([i915#5519]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_vblank@pipe-a-wait-idle:
>     - shard-snb:          [SKIP][107] ([fdo#109271]) -> [PASS][108] +2 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-snb2/igt@kms_vblank@pipe-a-wait-idle.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-snb6/igt@kms_vblank@pipe-a-wait-idle.html
> 
>   * igt@kms_vblank@pipe-b-accuracy-idle:
>     - shard-glk:          [FAIL][109] ([i915#43]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk6/igt@kms_vblank@pipe-b-accuracy-idle.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_pread@exhaustion:
>     - shard-tglb:         [INCOMPLETE][111] ([i915#7248]) -> [WARN][112] ([i915#2658])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-tglb2/igt@gem_pread@exhaustion.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-tglb3/igt@gem_pread@exhaustion.html
>     - shard-glk:          [INCOMPLETE][113] ([i915#7248]) -> [WARN][114] ([i915#2658])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-glk1/igt@gem_pread@exhaustion.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk9/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-apl:          [WARN][115] ([i915#2658]) -> [INCOMPLETE][116] ([i915#7248])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-apl1/igt@gem_pwrite@basic-exhaustion.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl6/igt@gem_pwrite@basic-exhaustion.html
>     - shard-glk:          [WARN][117] ([i915#2658]) -> [INCOMPLETE][118] ([i915#7248])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-glk6/igt@gem_pwrite@basic-exhaustion.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-glk7/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - shard-iclb:         [FAIL][119] ([i915#2684]) -> [WARN][120] ([i915#2684])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
>     - shard-apl:          [FAIL][121] ([i915#4573]) -> [DMESG-FAIL][122] ([IGT#6]) +1 similar issue
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-iclb:         [SKIP][123] ([i915#658]) -> [SKIP][124] ([i915#2920])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-iclb:         [SKIP][125] ([fdo#111068] / [i915#658]) -> [SKIP][126] ([i915#2920])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-iclb:         [SKIP][127] ([i915#2920]) -> [SKIP][128] ([i915#658])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>     - shard-iclb:         [SKIP][129] ([i915#2920]) -> [SKIP][130] ([fdo#111068] / [i915#658])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][131], [FAIL][132], [FAIL][133]) ([i915#3002] / [i915#4312]) -> ([FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-apl2/igt@runner@aborted.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-apl7/igt@runner@aborted.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7064/shard-apl7/igt@runner@aborted.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl1/igt@runner@aborted.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl1/igt@runner@aborted.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl7/igt@runner@aborted.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/shard-apl7/igt@runner@aborted.html
> 
>   
>   [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
>   [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
>   [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7248]: https://gitlab.freedesktop.org/drm/intel/issues/7248
>   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7064 -> IGTPW_8123
> 
>   CI-20190529: 20190529
>   CI_DRM_12391: c413e36ac30e0c84e28f5e9add894346b9450755 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8123: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/index.html
>   IGT_7064: f5cc3abb3d99e9ab5da2285b184e045da95c35a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8123/index.html
