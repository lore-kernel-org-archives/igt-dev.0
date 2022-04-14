Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E926C10E076
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 15:49:19 +0000 (UTC)
Date: Thu, 14 Apr 2022 18:49:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YlhCepvgmQ5TS9+R@platvala-desk.ger.corp.intel.com>
References: <cover.1649939026.git.mchehab@kernel.org>
 <164994915667.1346.9758304664888394327@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164994915667.1346.9758304664888394327@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgY29kZSBj?=
 =?utf-8?q?overage=3A_some_improvements_=28rev4=29?=
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
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 03:12:36PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: code coverage: some improvements (rev4)
> URL   : https://patchwork.freedesktop.org/series/102136/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11499_full -> IGTPW_6933_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6933_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6933_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Additional (3): shard-rkl shard-dg1 shard-tglu 
>   Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6933_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
>     - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-tglb6/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb6/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
> 
>   * igt@kms_hdmi_inject@inject-4k:
>     - shard-iclb:         [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-iclb5/igt@kms_hdmi_inject@inject-4k.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb4/igt@kms_hdmi_inject@inject-4k.html

Unrelated failures. Series merged.


-- 
Petri Latvala


> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - {shard-dg1}:        NOTRUN -> [FAIL][5] +2 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-dg1-16/igt@gem_ccs@block-copy-compressed.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6933_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@feature_discovery@display-4x:
>     - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#1839])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb5/igt@feature_discovery@display-4x.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#5325])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb5/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_ctx_persistence@engines-queued:
>     - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +1 similar issue
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-snb4/igt@gem_ctx_persistence@engines-queued.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-apl:          NOTRUN -> [SKIP][9] ([fdo#109271]) +121 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl7/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglb:         NOTRUN -> [FAIL][10] ([i915#2842]) +5 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#2842]) +1 similar issue
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs1:
>     - shard-kbl:          NOTRUN -> [FAIL][13] ([i915#2842])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-iclb:         NOTRUN -> [FAIL][14] ([i915#2842]) +3 similar issues
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-glk:          NOTRUN -> [FAIL][15] ([i915#2842]) +2 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_flush@basic-wb-set-default:
>     - shard-snb:          [PASS][16] -> [SKIP][17] ([fdo#109271]) +3 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-snb2/igt@gem_exec_flush@basic-wb-set-default.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-snb6/igt@gem_exec_flush@basic-wb-set-default.html
> 
>   * igt@gem_exec_params@no-blt:
>     - shard-tglb:         NOTRUN -> [SKIP][18] ([fdo#109283])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb2/igt@gem_exec_params@no-blt.html
>     - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#109283])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb4/igt@gem_exec_params@no-blt.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-tglb:         [PASS][20] -> [SKIP][21] ([i915#2190])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-tglb2/igt@gem_huc_copy@huc-copy.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb6/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl3/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#4613]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb3/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl3/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-kbl:          NOTRUN -> [WARN][25] ([i915#2658])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl1/igt@gem_pread@exhaustion.html
>     - shard-tglb:         NOTRUN -> [WARN][26] ([i915#2658])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb5/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4270]) +2 similar issues
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb3/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-1:
>     - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#4270])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#768]) +1 similar issue
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb3/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][30] ([i915#180])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl2/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#3323])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#3323])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb7/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#3323])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl3/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#3323])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb1/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3323])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl3/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3297])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb1/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#5566] / [i915#716])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-apl1/igt@gen9_exec_parse@allowed-all.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl3/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@batch-zero-length:
>     - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#2527] / [i915#2856]) +2 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb3/igt@gen9_exec_parse@batch-zero-length.html
>     - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#2856]) +1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb8/igt@gen9_exec_parse@batch-zero-length.html
> 
>   * igt@i915_pm_backlight@bad-brightness:
>     - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271]) +59 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-glk1/igt@i915_pm_backlight@bad-brightness.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-tglb:         NOTRUN -> [WARN][42] ([i915#2681] / [i915#2684])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#110892])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>     - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111644] / [i915#1397] / [i915#2411])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109506] / [i915#2411])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - shard-tglb:         NOTRUN -> [DMESG-FAIL][46] ([i915#2373])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb5/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - shard-tglb:         NOTRUN -> [DMESG-FAIL][47] ([i915#1759])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb5/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][48] ([i915#3921])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-snb7/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#1769])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb1/igt@kms_atomic_transition@plane-all-modeset-transition.html
>     - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#1769])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#5286]) +3 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#5286]) +3 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111614]) +1 similar issue
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb2/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-0:
>     - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#1888] / [i915#5138])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-glk4/igt@kms_big_fb@linear-8bpp-rotate-0.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-glk6/igt@kms_big_fb@linear-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#110725] / [fdo#111614])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3777]) +5 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3777]) +1 similar issue
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3777])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-glk4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#110723]) +2 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111615]) +5 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#2705])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb7/igt@kms_big_joiner@basic.html
>     - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#2705]) +1 similar issue
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb1/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>     - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3886]) +4 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3886]) +15 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3689]) +2 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
>     - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278] / [i915#3886]) +6 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb4/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#3886]) +3 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-glk1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
>     - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3689] / [i915#3886]) +6 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb5/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#111615] / [i915#3689]) +6 similar issues
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb8/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html
> 
>   * igt@kms_chamelium@dp-hpd-for-each-pipe:
>     - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +18 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl1/igt@kms_chamelium@dp-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium@dp-mode-timings:
>     - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +10 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl3/igt@kms_chamelium@dp-mode-timings.html
> 
>   * igt@kms_chamelium@vga-edid-read:
>     - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109284] / [fdo#111827]) +5 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb7/igt@kms_chamelium@vga-edid-read.html
>     - shard-glk:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-glk9/igt@kms_chamelium@vga-edid-read.html
>     - shard-snb:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-snb6/igt@kms_chamelium@vga-edid-read.html
> 
>   * igt@kms_chamelium@vga-hpd-after-suspend:
>     - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109284] / [fdo#111827]) +13 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb8/igt@kms_chamelium@vga-hpd-after-suspend.html
> 
>   * igt@kms_color_chamelium@pipe-d-gamma:
>     - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278] / [fdo#109284] / [fdo#111827])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb3/igt@kms_color_chamelium@pipe-d-gamma.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3116] / [i915#3299])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb3/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-kbl:          NOTRUN -> [TIMEOUT][79] ([i915#1319])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl7/igt@kms_content_protection@lic.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
>     - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109278] / [fdo#109279]) +3 similar issues
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-max-size-rapid-movement:
>     - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#3359]) +3 similar issues
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-max-size-rapid-movement.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-suspend:
>     - shard-apl:          [PASS][82] -> [DMESG-WARN][83] ([i915#180]) +2 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
>     - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109279] / [i915#3359]) +6 similar issues
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
>     - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109279] / [i915#3359] / [i915#5691])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html
>     - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278] / [fdo#109279] / [i915#5691])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html
>     - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#5691])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:
>     - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109278]) +25 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-32x32-random:
>     - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#3319]) +4 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-32x32-random.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109274] / [fdo#109278]) +3 similar issues
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#4103]) +1 similar issue
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109274])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb2/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
>     - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#3788])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb7/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#5287])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled.html
>     - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#5287])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled.html
> 
>   * igt@kms_dsc@xrgb8888-dsc-compression:
>     - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#3828])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb5/igt@kms_dsc@xrgb8888-dsc-compression.html
>     - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#3828])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb3/igt@kms_dsc@xrgb8888-dsc-compression.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [PASS][98] -> [INCOMPLETE][99] ([i915#180])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109274] / [fdo#111825] / [i915#3966])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb5/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109274]) +4 similar issues
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109274] / [fdo#111825]) +12 similar issues
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb7/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-iclb:         [PASS][103] -> [SKIP][104] ([i915#3701])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>     - shard-snb:          NOTRUN -> [SKIP][105] ([fdo#109271]) +112 similar issues
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:
>     - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109280]) +18 similar issues
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
>     - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#109280] / [fdo#111825]) +29 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-kbl:          NOTRUN -> [SKIP][108] ([fdo#109271]) +254 similar issues
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
>     - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#109289]) +1 similar issue
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
>     - shard-snb:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#5341])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-snb5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
>     - shard-kbl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#533])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl7/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>     - shard-glk:          NOTRUN -> [FAIL][112] ([fdo#108145] / [i915#265])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
>     - shard-apl:          NOTRUN -> [FAIL][113] ([fdo#108145] / [i915#265]) +1 similar issue
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
>     - shard-kbl:          NOTRUN -> [FAIL][114] ([fdo#108145] / [i915#265]) +2 similar issues
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
> 
>   * igt@kms_plane_lowres@pipe-c-tiling-x:
>     - shard-tglb:         NOTRUN -> [SKIP][115] ([i915#3536]) +1 similar issue
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-x.html
>     - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#3536])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb7/igt@kms_plane_lowres@pipe-c-tiling-x.html
> 
>   * igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
>     - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#5288])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-c-tiling-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale:
>     - shard-iclb:         [PASS][118] -> [SKIP][119] ([i915#5235]) +2 similar issues
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-iclb5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale.html
> 
>   * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
>     - shard-iclb:         [PASS][120] -> [SKIP][121] ([i915#5176]) +1 similar issue
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/shard-iclb1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-tglb:         NOTRUN -> [SKIP][122] ([i915#2920])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-tglb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
>     - shard-iclb:         NOTRUN -> [SKIP][123] ([i915#2920])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-kbl:          NOTRUN -> [SKIP][124] ([fdo#109271] / [i915#658]) +2 similar issues
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-kbl6/igt@kms_psr2_su@page_flip-xrgb8888.html
>     - shard-apl:          NOTRUN -> [SKIP][125] ([fdo#109271] / [i915#658])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/shard-apl4/igt@kms_psr
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6933/index.html
