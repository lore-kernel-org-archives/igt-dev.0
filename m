Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A835810EEF5
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 20:57:22 +0000 (UTC)
Message-ID: <2167be15-8cfc-e54f-6497-4b3e01f4b2c2@quicinc.com>
Date: Wed, 13 Apr 2022 13:57:20 -0700
MIME-Version: 1.0
Content-Language: en-US
To: <lakshminarayana.vudum@intel.com>
References: <20220413002224.192-1-quic_jesszhan@quicinc.com>
 <164987568975.28396.7555893647559865149@emeril.freedesktop.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <164987568975.28396.7555893647559865149@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Ftransition=3A_Separate_commits_for_pipes_with_sh?=
 =?utf-8?q?ared_planes_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

I looked over the failure, but the regressions don't seem to be related 
to my change.

Can you help take a look?

Thanks,

Jessica Zhang

On 4/13/2022 11:48 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_atomic_transition: Separate commits for pipes with shared planes (rev2)
> URL   : https://patchwork.freedesktop.org/series/102628/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11493_full -> IGTPW_6924_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_6924_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6924_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/index.html
> 
> Participating hosts (13 -> 7)
> ------------------------------
> 
>    Missing    (6): shard-skl pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in IGTPW_6924_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@gem_exec_schedule@wide@vcs0:
>      - shard-kbl:          NOTRUN -> [INCOMPLETE][1]
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl7/igt@gem_exec_schedule@wide@vcs0.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>      - shard-tglb:         [PASS][2] -> [INCOMPLETE][3]
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
> 
>    
> Known issues
> ------------
> 
>    Here are the changes found in IGTPW_6924_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@feature_discovery@display-4x:
>      - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#1839])
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb2/igt@feature_discovery@display-4x.html
> 
>    * igt@gem_ccs@suspend-resume:
>      - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#5327]) +1 similar issue
>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb1/igt@gem_ccs@suspend-resume.html
>      - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#5325])
>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb6/igt@gem_ccs@suspend-resume.html
> 
>    * igt@gem_create@create-massive:
>      - shard-apl:          NOTRUN -> [DMESG-WARN][7] ([i915#4991])
>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-apl8/igt@gem_create@create-massive.html
> 
>    * igt@gem_ctx_persistence@engines-queued:
>      - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +1 similar issue
>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-snb4/igt@gem_ctx_persistence@engines-queued.html
> 
>    * igt@gem_ctx_sseu@invalid-sseu:
>      - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#280])
>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb8/igt@gem_ctx_sseu@invalid-sseu.html
> 
>    * igt@gem_eio@in-flight-suspend:
>      - shard-apl:          NOTRUN -> [DMESG-WARN][10] ([i915#180])
>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-apl1/igt@gem_eio@in-flight-suspend.html
> 
>    * igt@gem_exec_balancer@parallel-balancer:
>      - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#4525])
>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html
>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html
> 
>    * igt@gem_exec_balancer@parallel-contexts:
>      - shard-kbl:          NOTRUN -> [DMESG-WARN][13] ([i915#5076] / [i915#5614]) +1 similar issue
>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl4/igt@gem_exec_balancer@parallel-contexts.html
> 
>    * igt@gem_exec_fair@basic-none@vcs0:
>      - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#2842])
>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html
>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html
>      - shard-tglb:         NOTRUN -> [FAIL][16] ([i915#2842]) +9 similar issues
>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb2/igt@gem_exec_fair@basic-none@vcs0.html
> 
>    * igt@gem_exec_fair@basic-none@vcs1:
>      - shard-iclb:         NOTRUN -> [FAIL][17] ([i915#2842]) +8 similar issues
>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html
> 
>    * igt@gem_exec_fair@basic-pace@vcs1:
>      - shard-kbl:          NOTRUN -> [FAIL][18] ([i915#2842]) +3 similar issues
>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
> 
>    * igt@gem_exec_fair@basic-pace@vecs0:
>      - shard-glk:          NOTRUN -> [FAIL][19] ([i915#2842]) +2 similar issues
>     [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>    * igt@gem_exec_flush@basic-uc-prw-default:
>      - shard-snb:          [PASS][20] -> [SKIP][21] ([fdo#109271]) +1 similar issue
>     [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-snb4/igt@gem_exec_flush@basic-uc-prw-default.html
>     [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-snb6/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>    * igt@gem_exec_params@no-blt:
>      - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#109283])
>     [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb1/igt@gem_exec_params@no-blt.html
>      - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109283])
>     [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb7/igt@gem_exec_params@no-blt.html
> 
>    * igt@gem_lmem_swapping@basic:
>      - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613]) +1 similar issue
>     [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl7/igt@gem_lmem_swapping@basic.html
> 
>    * igt@gem_lmem_swapping@parallel-multi:
>      - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#4613]) +1 similar issue
>     [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb7/igt@gem_lmem_swapping@parallel-multi.html
> 
>    * igt@gem_lmem_swapping@random:
>      - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#4613]) +1 similar issue
>     [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb1/igt@gem_lmem_swapping@random.html
>      - shard-glk:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#4613])
>     [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-glk3/igt@gem_lmem_swapping@random.html
> 
>    * igt@gem_lmem_swapping@smem-oom:
>      - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613])
>     [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-apl2/igt@gem_lmem_swapping@smem-oom.html
> 
>    * igt@gem_pread@exhaustion:
>      - shard-tglb:         NOTRUN -> [WARN][29] ([i915#2658])
>     [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb7/igt@gem_pread@exhaustion.html
>      - shard-iclb:         NOTRUN -> [WARN][30] ([i915#2658])
>     [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb7/igt@gem_pread@exhaustion.html
>      - shard-kbl:          NOTRUN -> [WARN][31] ([i915#2658])
>     [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl1/igt@gem_pread@exhaustion.html
> 
>    * igt@gem_pxp@protected-raw-src-copy-not-readible:
>      - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#4270]) +2 similar issues
>     [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb8/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>    * igt@gem_pxp@reject-modify-context-protection-off-1:
>      - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#4270])
>     [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb3/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>    * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>      - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#768]) +3 similar issues
>     [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>    * igt@gem_userptr_blits@input-checking:
>      - shard-tglb:         NOTRUN -> [DMESG-WARN][35] ([i915#4991])
>     [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb7/igt@gem_userptr_blits@input-checking.html
>      - shard-kbl:          NOTRUN -> [DMESG-WARN][36] ([i915#4991])
>     [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl6/igt@gem_userptr_blits@input-checking.html
> 
>    * igt@gem_userptr_blits@readonly-pwrite-unsync:
>      - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#3297])
>     [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb5/igt@gem_userptr_blits@readonly-pwrite-unsync.html
>      - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#3297])
>     [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb5/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>    * igt@gen3_render_mixed_blits:
>      - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109289])
>     [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb3/igt@gen3_render_mixed_blits.html
>      - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109289]) +1 similar issue
>     [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb8/igt@gen3_render_mixed_blits.html
> 
>    * igt@gen9_exec_parse@batch-zero-length:
>      - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#2856]) +2 similar issues
>     [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb8/igt@gen9_exec_parse@batch-zero-length.html
>      - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#2527] / [i915#2856]) +2 similar issues
>     [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb7/igt@gen9_exec_parse@batch-zero-length.html
> 
>    * igt@i915_pm_backlight@bad-brightness:
>      - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271]) +95 similar issues
>     [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-glk5/igt@i915_pm_backlight@bad-brightness.html
> 
>    * igt@i915_pm_rc6_residency@rc6-idle:
>      - shard-tglb:         NOTRUN -> [WARN][44] ([i915#2681] / [i915#2684])
>     [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>    * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>      - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111644] / [i915#1397] / [i915#2411])
>     [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>    * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>      - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109506] / [i915#2411])
>     [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
>      - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109293] / [fdo#109506])
>     [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>    * igt@i915_selftest@live@hangcheck:
>      - shard-snb:          NOTRUN -> [INCOMPLETE][48] ([i915#3921])
>     [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-snb7/igt@i915_selftest@live@hangcheck.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition:
>      - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#1769])
>     [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb6/igt@kms_atomic_transition@plane-all-modeset-transition.html
>      - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#1769])
>     [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb1/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>    * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>      - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#5286]) +1 similar issue
>     [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>      - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#5286]) +2 similar issues
>     [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>    * igt@kms_big_fb@linear-32bpp-rotate-0:
>      - shard-glk:          [PASS][53] -> [DMESG-WARN][54] ([i915#118])
>     [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-0.html
>     [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>      - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110725] / [fdo#111614])
>     [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>      - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111614])
>     [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>    * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>      - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3777]) +1 similar issue
>     [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>    * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>      - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3777]) +2 similar issues
>     [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>      - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111615]) +5 similar issues
>     [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>      - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#110723]) +1 similar issue
>     [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>    * igt@kms_big_joiner@basic:
>      - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#2705])
>     [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb2/igt@kms_big_joiner@basic.html
>      - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#2705])
>     [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb6/igt@kms_big_joiner@basic.html
> 
>    * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>      - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#3886]) +8 similar issues
>     [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>    * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:
>      - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3689]) +3 similar issues
>     [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb3/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html
> 
>    * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
>      - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278] / [i915#3886]) +12 similar issues
>     [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
> 
>    * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>      - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3689] / [i915#3886]) +6 similar issues
>     [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>    * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>      - shard-glk:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#3886]) +6 similar issues
>     [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-glk3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>    * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
>      - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111615] / [i915#3689]) +5 similar issues
>     [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb8/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html
> 
>    * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>      - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#3886]) +2 similar issues
>     [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-apl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>    * igt@kms_chamelium@dp-mode-timings:
>      - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +6 similar issues
>     [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-apl8/igt@kms_chamelium@dp-mode-timings.html
> 
>    * igt@kms_chamelium@hdmi-hpd-fast:
>      - shard-snb:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +4 similar issues
>     [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-snb7/igt@kms_chamelium@hdmi-hpd-fast.html
> 
>    * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
>      - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +14 similar issues
>     [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl3/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html
> 
>    * igt@kms_chamelium@vga-hpd-with-enabled-mode:
>      - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109284] / [fdo#111827]) +8 similar issues
>     [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb6/igt@kms_chamelium@vga-hpd-with-enabled-mode.html
> 
>    * igt@kms_color@pipe-d-degamma:
>      - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109278] / [i915#1149])
>     [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb2/igt@kms_color@pipe-d-degamma.html
> 
>    * igt@kms_color_chamelium@pipe-b-ctm-0-5:
>      - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +7 similar issues
>     [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-glk6/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
> 
>    * igt@kms_color_chamelium@pipe-b-ctm-0-75:
>      - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109284] / [fdo#111827]) +11 similar issues
>     [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
> 
>    * igt@kms_content_protection@dp-mst-type-1:
>      - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3116])
>     [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb7/igt@kms_content_protection@dp-mst-type-1.html
>      - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3116] / [i915#3299])
>     [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb7/igt@kms_content_protection@dp-mst-type-1.html
> 
>    * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>      - shard-kbl:          [PASS][79] -> [DMESG-WARN][80] ([i915#180])
>     [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>     [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>    * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
>      - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#3359]) +4 similar issues
>     [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html
> 
>    * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
>      - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#3319]) +5 similar issues
>     [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html
> 
>    * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
>      - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#109279] / [i915#3359]) +3 similar issues
>     [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html
> 
>    * igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
>      - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [fdo#109279]) +2 similar issues
>     [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html
> 
>    * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
>      - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109279] / [i915#3359] / [i915#5691])
>     [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html
> 
>    * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>      - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109274] / [fdo#109278]) +1 similar issue
>     [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>      - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#4103]) +1 similar issue
>     [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@pipe-d-single-move:
>      - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109278]) +34 similar issues
>     [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html
> 
>    * igt@kms_display_modes@extended-mode-basic:
>      - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109274]) +3 similar issues
>     [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb7/igt@kms_display_modes@extended-mode-basic.html
>      - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109274])
>     [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb1/igt@kms_display_modes@extended-mode-basic.html
> 
>    * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
>      - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#5287]) +1 similar issue
>     [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html
>      - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#5287]) +1 similar issue
>     [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html
> 
>    * igt@kms_dsc@basic-dsc-enable:
>      - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#3840])
>     [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb5/igt@kms_dsc@basic-dsc-enable.html
> 
>    * igt@kms_dsc@xrgb8888-dsc-compression:
>      - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#3828])
>     [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb1/igt@kms_dsc@xrgb8888-dsc-compression.html
>      - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#3828])
>     [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb7/igt@kms_dsc@xrgb8888-dsc-compression.html
> 
>    * igt@kms_fbcon_fbt@fbc-suspend:
>      - shard-kbl:          NOTRUN -> [INCOMPLETE][96] ([i915#180])
>     [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:
>      - shard-glk:          [PASS][97] -> [FAIL][98] ([i915#2122])
>     [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-glk7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
>     [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-glk4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>    * igt@kms_flip@2x-flip-vs-rmfb:
>      - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109274] / [fdo#111825]) +7 similar issues
>     [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb8/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
>      - shard-glk:          [PASS][100] -> [FAIL][101] ([i915#79])
>     [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
>     [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
>      - shard-apl:          [PASS][102] -> [DMESG-WARN][103] ([i915#180]) +2 similar issues
>     [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
>     [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>      - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#3701])
>     [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>      - shard-iclb:         [PASS][105] -> [SKIP][106] ([i915#3701])
>     [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>     [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
>      - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109280]) +21 similar issues
>     [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>      - shard-apl:          NOTRUN -> [SKIP][108] ([fdo#109271]) +91 similar issues
>     [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-apl3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>      - shard-snb:          NOTRUN -> [SKIP][109] ([fdo#109271]) +105 similar issues
>     [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-snb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
>      - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#109280] / [fdo#111825]) +23 similar issues
>     [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html
> 
>    * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>      - shard-kbl:          NOTRUN -> [SKIP][111] ([fdo#109271]) +221 similar issues
>     [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>    * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
>      - shard-snb:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#5341])
>     [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-snb2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
> 
>    * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
>      - shard-kbl:          NOTRUN -> [DMESG-WARN][113] ([i915#180]) +2 similar issues
>     [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
> 
>    * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>      - shard-apl:          NOTRUN -> [FAIL][114] ([fdo#108145] / [i915#265])
>     [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
>      - shard-glk:          NOTRUN -> [FAIL][115] ([fdo#108145] / [i915#265])
>     [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-glk2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
> 
>    * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
>      - shard-kbl:          NOTRUN -> [FAIL][116] ([fdo#108145] / [i915#265]) +1 similar issue
>     [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
> 
>    * igt@kms_plane_lowres@pipe-c-tiling-x:
>      - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#3536])
>     [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb6/igt@kms_plane_lowres@pipe-c-tiling-x.html
>      - shard-iclb:         NOTRUN -> [SKIP][118] ([i915#3536])
>     [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb1/igt@kms_plane_lowres@pipe-c-tiling-x.html
> 
>    * igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
>      - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#5288])
>     [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-c-tiling-4.html
> 
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale:
>      - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#5235]) +2 similar issues
>     [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale.html
> 
>    * igt@kms_psr2_su@frontbuffer-xrgb8888:
>      - shard-iclb:         [PASS][121] -> [SKIP][122] ([fdo#109642] / [fdo#111068] / [i915#658])
>     [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>    * igt@kms_psr2_su@page_flip-xrgb8888:
>      - shard-kbl:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#658]) +1 similar issue
>     [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-kbl3/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>    * igt@kms_psr@psr2_cursor_plane_move:
>      - shard-iclb:         NOTRUN -> [SKIP][124] ([fdo#109441]) +2 similar issues
>     [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html
> 
>    * igt@kms_psr@psr2_primary_blt:
>      - shard-iclb:         [PASS][125] -> [SKIP][126] ([fdo#109441])
>     [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11493/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
>     [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/shard-iclb3/igt@kms_psr@psr2_primary_blt.html
> 
>    * igt@kms_psr@psr2_sprite_blt:
>      - shard-tglb:         NOTRUN -> [FAIL][127] ([i915#132] / [i915#
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6924/index.html
> 
