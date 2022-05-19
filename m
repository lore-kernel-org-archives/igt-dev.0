Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE1311A8D9
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 20:44:36 +0000 (UTC)
Message-ID: <a0efd9f6-3c9d-3b98-5605-a7b3b9d5746a@quicinc.com>
Date: Thu, 19 May 2022 13:44:35 -0700
MIME-Version: 1.0
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <lakshminarayana.vudum@intel.com>
References: <165286178725.21388.6717310292088982350@emeril.freedesktop.org>
 <934c60df-1293-38d1-408e-ab1bb2c88ec6@quicinc.com>
In-Reply-To: <934c60df-1293-38d1-408e-ab1bb2c88ec6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev]
 =?utf-8?b?RndkOiDinJcgRmkuQ0kuSUdUOiBmYWlsdXJlIGZvciBs?=
 =?utf-8?q?ib/igt=5Fkms=3A_Set_pipe-=3Eplane=5Fprimary_to_driver-assigned_?=
 =?utf-8?q?primary_plane_when_there_are_multiple_possible_primary_planes_?=
 =?utf-8?b?KHJldjYp?=
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



On 5/19/2022 1:34 PM, Jessica Zhang wrote:
> Hi Lakshmi,
> 
> I looked into this regression, but it doesn't seem to be related to my 
> patch. Can you help take a look at it?

+ cc: igt-dev list

> 
> Thanks,
> Jessica Zhang
> 
> 
> -------- Forwarded Message --------
> Subject: ✗ Fi.CI.IGT: failure for lib/igt_kms: Set pipe->plane_primary 
> to driver-assigned primary plane when there are multiple possible 
> primary planes (rev6)
> Date: Wed, 18 May 2022 08:16:27 +0000
> From: Patchwork <patchwork@emeril.freedesktop.org>
> Reply-To: igt-dev@lists.freedesktop.org
> To: Jessica Zhang <quic_jesszhan@quicinc.com>
> CC: igt-dev@lists.freedesktop.org
> 
> == Series Details ==
> 
> Series: lib/igt_kms: Set pipe->plane_primary to driver-assigned primary 
> plane when there are multiple possible primary planes (rev6)
> URL   : https://patchwork.freedesktop.org/series/103897/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11669_full -> IGTPW_7127_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_7127_full absolutely need 
> to be
>    verified manually.
>      If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7127_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives 
> in CI.
> 
>    External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/index.html
> 
> Participating hosts (13 -> 8)
> ------------------------------
> 
>    Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl 
> shard-dg1
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in 
> IGTPW_7127_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_plane@plane-position-hole-dpms@pipe-a-planes:
>      - shard-kbl:          [PASS][1] -> [FAIL][2]
>     [1]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-kbl4/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html 
> 
>     [2]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html 
> 
> 
>    Known issues
> ------------
> 
>    Here are the changes found in IGTPW_7127_full that come from known 
> issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@feature_discovery@display-3x:
>      - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#1839])
>     [3]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb7/igt@feature_discovery@display-3x.html 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#1839])
>     [4]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb7/igt@feature_discovery@display-3x.html 
> 
> 
>    * igt@gem_ccs@block-copy-uncompressed:
>      - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#5327]) +1 similar 
> issue
>     [5]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb3/igt@gem_ccs@block-copy-uncompressed.html 
> 
> 
>    * igt@gem_ccs@ctrl-surf-copy:
>      - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#3555] / [i915#5325])
>     [6]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@gem_ccs@ctrl-surf-copy.html 
> 
> 
>    * igt@gem_ctx_isolation@preservation-s3@bcs0:
>      - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +4 
> similar issues
>     [7]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html 
> 
>     [8]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html 
> 
> 
>    * igt@gem_ctx_persistence@file:
>      - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099])
>     [9]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-snb7/igt@gem_ctx_persistence@file.html 
> 
> 
>    * igt@gem_ctx_sseu@engines:
>      - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#280])
>     [10]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@gem_ctx_sseu@engines.html 
> 
> 
>    * igt@gem_eio@in-flight-contexts-1us:
>      - shard-iclb:         [PASS][11] -> [TIMEOUT][12] ([i915#3070])
>     [11]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb4/igt@gem_eio@in-flight-contexts-1us.html 
> 
>     [12]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb7/igt@gem_eio@in-flight-contexts-1us.html 
> 
>      - shard-tglb:         [PASS][13] -> [TIMEOUT][14] ([i915#3063])
>     [13]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-tglb6/igt@gem_eio@in-flight-contexts-1us.html 
> 
>     [14]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb7/igt@gem_eio@in-flight-contexts-1us.html 
> 
> 
>    * igt@gem_eio@kms:
>      - shard-tglb:         NOTRUN -> [FAIL][15] ([i915#5784])
>     [15]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb8/igt@gem_eio@kms.html 
> 
> 
>    * igt@gem_exec_fair@basic-none-rrul@rcs0:
>      - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#2842])
>     [16]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html 
> 
>     [17]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html 
> 
> 
>    * igt@gem_exec_fair@basic-none-share@rcs0:
>      - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#2842])
>     [18]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html 
> 
>     [19]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html 
> 
> 
>    * igt@gem_exec_fair@basic-pace-share@rcs0:
>      - shard-tglb:         NOTRUN -> [FAIL][20] ([i915#2842])
>     [20]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html 
> 
> 
>    * igt@gem_exec_fair@basic-pace-solo@rcs0:
>      - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#2842])
>     [21]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html 
> 
>     [22]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb7/igt@gem_exec_fair@basic-pace-solo@rcs0.html 
> 
> 
>    * igt@gem_exec_fair@basic-throttle@rcs0:
>      - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#2849])
>     [23]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html 
> 
>     [24]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html 
> 
> 
>    * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>      - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109313])
>     [25]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#109313])
>     [26]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html 
> 
> 
>    * igt@gem_exec_flush@basic-batch-kernel-default-uc:
>      - shard-snb:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +2 
> similar issues
>     [27]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-default-uc.html 
> 
>     [28]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html 
> 
> 
>    * igt@gem_exec_params@no-bsd:
>      - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109283])
>     [29]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb8/igt@gem_exec_params@no-bsd.html 
> 
>      - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109283])
>     [30]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb2/igt@gem_exec_params@no-bsd.html 
> 
> 
>    * igt@gem_lmem_swapping@parallel-multi:
>      - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / 
> [i915#4613])
>     [31]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk7/igt@gem_lmem_swapping@parallel-multi.html 
> 
> 
>    * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>      - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / 
> [i915#4613]) +3 similar issues
>     [32]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#4613]) +3 similar 
> issues
>     [33]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html 
> 
> 
>    * igt@gem_lmem_swapping@random-engines:
>      - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / 
> [i915#4613]) +1 similar issue
>     [34]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl7/igt@gem_lmem_swapping@random-engines.html 
> 
> 
>    * igt@gem_lmem_swapping@verify:
>      - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#4613]) +1 similar 
> issue
>     [35]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb6/igt@gem_lmem_swapping@verify.html 
> 
> 
>    * igt@gem_media_vme:
>      - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#284])
>     [36]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb8/igt@gem_media_vme.html 
> 
> 
>    * igt@gem_pwrite@basic-exhaustion:
>      - shard-apl:          NOTRUN -> [WARN][37] ([i915#2658])
>     [37]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl7/igt@gem_pwrite@basic-exhaustion.html 
> 
> 
>    * igt@gem_pxp@protected-raw-src-copy-not-readible:
>      - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#4270]) +2 similar 
> issues
>     [38]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb5/igt@gem_pxp@protected-raw-src-copy-not-readible.html 
> 
> 
>    * igt@gem_pxp@reject-modify-context-protection-off-1:
>      - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#4270]) +2 similar 
> issues
>     [39]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb1/igt@gem_pxp@reject-modify-context-protection-off-1.html 
> 
> 
>    * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
>      - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#768]) +2 similar 
> issues
>     [40]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html 
> 
> 
>    * igt@gem_softpin@evict-single-offset:
>      - shard-kbl:          NOTRUN -> [FAIL][41] ([i915#4171])
>     [41]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl6/igt@gem_softpin@evict-single-offset.html 
> 
>      - shard-glk:          NOTRUN -> [FAIL][42] ([i915#4171])
>     [42]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk8/igt@gem_softpin@evict-single-offset.html 
> 
>      - shard-apl:          NOTRUN -> [FAIL][43] ([i915#4171])
>     [43]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl4/igt@gem_softpin@evict-single-offset.html 
> 
> 
>    * igt@gem_softpin@evict-snoop:
>      - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109312])
>     [44]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb7/igt@gem_softpin@evict-snoop.html 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109312])
>     [45]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb2/igt@gem_softpin@evict-snoop.html 
> 
> 
>    * igt@gem_userptr_blits@vma-merge:
>      - shard-apl:          NOTRUN -> [FAIL][46] ([i915#3318])
>     [46]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl1/igt@gem_userptr_blits@vma-merge.html 
> 
> 
>    * igt@gen7_exec_parse@basic-offset:
>      - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109289]) +4 
> similar issues
>     [47]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@gen7_exec_parse@basic-offset.html 
> 
> 
>    * igt@gen9_exec_parse@batch-invalid-length:
>      - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#2856]) +2 similar 
> issues
>     [48]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb4/igt@gen9_exec_parse@batch-invalid-length.html 
> 
> 
>    * igt@gen9_exec_parse@bb-oversize:
>      - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#2527] / 
> [i915#2856]) +1 similar issue
>     [49]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb2/igt@gen9_exec_parse@bb-oversize.html 
> 
> 
>    * igt@i915_pm_backlight@bad-brightness:
>      - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271]) +80 
> similar issues
>     [50]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk7/igt@i915_pm_backlight@bad-brightness.html 
> 
> 
>    * igt@i915_pm_backlight@fade_with_dpms:
>      - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#92])
>     [51]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@i915_pm_backlight@fade_with_dpms.html 
> 
> 
>    * igt@i915_pm_dc@dc3co-vpb-simulation:
>      - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#1904])
>     [52]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html 
> 
> 
>    * igt@i915_pm_dc@dc6-dpms:
>      - shard-kbl:          NOTRUN -> [FAIL][53] ([i915#454])
>     [53]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html 
> 
> 
>    * igt@i915_pm_dc@dc6-psr:
>      - shard-tglb:         NOTRUN -> [FAIL][54] ([i915#454]) +1 similar 
> issue
>     [54]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb3/igt@i915_pm_dc@dc6-psr.html 
> 
> 
>    * igt@i915_pm_dc@dc9-dpms:
>      - shard-iclb:         [PASS][55] -> [SKIP][56] ([i915#4281])
>     [55]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb4/igt@i915_pm_dc@dc9-dpms.html 
> 
>     [56]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html 
> 
> 
>    * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>      - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111644] / 
> [i915#1397] / [i915#2411])
>     [57]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html 
> 
> 
>    * igt@i915_pm_rpm@system-suspend:
>      - shard-kbl:          NOTRUN -> [DMESG-WARN][58] ([i915#62] / 
> [i915#92]) +5 similar issues
>     [58]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@i915_pm_rpm@system-suspend.html 
> 
> 
>    * igt@i915_selftest@live@hangcheck:
>      - shard-snb:          [PASS][59] -> [INCOMPLETE][60] ([i915#3921])
>     [59]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-snb6/igt@i915_selftest@live@hangcheck.html 
> 
>     [60]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-snb6/igt@i915_selftest@live@hangcheck.html 
> 
> 
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>      - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271]) +240 
> similar issues
>     [61]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html 
> 
> 
>    * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>      - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#5286]) +4 similar 
> issues
>     [62]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html 
> 
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>      - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#5286]) +5 similar 
> issues
>     [63]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html 
> 
> 
>    * igt@kms_big_fb@linear-16bpp-rotate-270:
>      - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111614]) +3 
> similar issues
>     [64]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-270.html 
> 
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-90:
>      - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#110725] / 
> [fdo#111614]) +3 similar issues
>     [65]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb8/igt@kms_big_fb@linear-64bpp-rotate-90.html 
> 
> 
>    * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>      - shard-snb:          NOTRUN -> [SKIP][66] ([fdo#109271]) +143 
> similar issues
>     [66]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-snb2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html 
> 
> 
>    * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>      - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111615]) +8 
> similar issues
>     [67]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html 
> 
>      - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#110723]) +1 
> similar issue
>     [68]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html 
> 
> 
>    * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
>      - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / 
> [i915#3886]) +5 similar issues
>     [69]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl7/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html 
> 
> 
>    * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>      - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271] / 
> [i915#3886]) +2 similar issues
>     [70]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html 
> 
>      - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278] / 
> [i915#3886]) +4 similar issues
>     [71]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html 
> 
> 
>    * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
>      - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / 
> [i915#3886]) +4 similar issues
>     [72]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl2/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3689] / 
> [i915#3886]) +4 similar issues
>     [73]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb8/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html 
> 
> 
>    * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
>      - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#111615] / 
> [i915#3689]) +9 similar issues
>     [74]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html 
> 
> 
>    * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
>      - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3689]) +9 similar 
> issues
>     [75]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html 
> 
> 
>    * igt@kms_cdclk@mode-transition:
>      - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271]) +186 
> similar issues
>     [76]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl7/igt@kms_cdclk@mode-transition.html 
> 
> 
>    * igt@kms_cdclk@plane-scaling:
>      - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#3742])
>     [77]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb3/igt@kms_cdclk@plane-scaling.html 
> 
> 
>    * igt@kms_chamelium@hdmi-audio:
>      - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109284] / 
> [fdo#111827]) +13 similar issues
>     [78]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb2/igt@kms_chamelium@hdmi-audio.html 
> 
> 
>    * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
>      - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / 
> [fdo#111827]) +7 similar issues
>     [79]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk8/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html 
> 
> 
>    * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
>      - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / 
> [fdo#111827]) +23 similar issues
>     [80]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html 
> 
> 
>    * igt@kms_chamelium@vga-hpd-for-each-pipe:
>      - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / 
> [fdo#111827]) +14 similar issues
>     [81]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html 
> 
> 
>    * igt@kms_color@pipe-d-ctm-blue-to-red:
>      - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109278] / 
> [i915#1149])
>     [82]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb1/igt@kms_color@pipe-d-ctm-blue-to-red.html 
> 
> 
>    * igt@kms_color_chamelium@pipe-a-ctm-0-25:
>      - shard-snb:          NOTRUN -> [SKIP][83] ([fdo#109271] / 
> [fdo#111827]) +5 similar issues
>     [83]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-0-25.html 
> 
> 
>    * igt@kms_color_chamelium@pipe-b-ctm-0-75:
>      - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109284] / 
> [fdo#111827]) +23 similar issues
>     [84]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-0-75.html 
> 
> 
>    * igt@kms_content_protection@atomic:
>      - shard-kbl:          NOTRUN -> [TIMEOUT][85] ([i915#1319]) +1 
> similar issue
>     [85]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@kms_content_protection@atomic.html 
> 
> 
>    * igt@kms_content_protection@atomic-dpms:
>      - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#1063])
>     [86]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb2/igt@kms_content_protection@atomic-dpms.html 
> 
>      - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109300] / 
> [fdo#111066])
>     [87]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb5/igt@kms_content_protection@atomic-dpms.html 
> 
> 
>    * igt@kms_content_protection@srm:
>      - shard-apl:          NOTRUN -> [TIMEOUT][88] ([i915#1319])
>     [88]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl2/igt@kms_content_protection@srm.html 
> 
> 
>    * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
>      - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#3359]) +7 similar 
> issues
>     [89]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html 
> 
> 
>    * igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:
>      - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#3319]) +1 similar 
> issue
>     [90]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen.html 
> 
> 
>    * igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
>      - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109278] / 
> [fdo#109279]) +1 similar issue
>     [91]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html 
> 
> 
>    * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
>      - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109279] / 
> [i915#3359] / [i915#5691])
>     [92]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html 
> 
>      - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / 
> [i915#5691])
>     [93]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html 
> 
> 
>    * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
>      - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109279] / 
> [i915#3359]) +5 similar issues
>     [94]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html 
> 
> 
>    * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>      - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109274] / 
> [fdo#109278]) +5 similar issues
>     [95]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html 
> 
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>      - shard-glk:          [PASS][96] -> [FAIL][97] ([i915#2346])
>     [96]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html 
> 
>     [97]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html 
> 
> 
>    * igt@kms_cursor_legacy@pipe-d-torture-bo:
>      - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#533])
>     [98]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html 
> 
> 
>    * 
> igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>      - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#4103]) +1 similar 
> issue
>     [99]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html 
> 
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc@edp-1-pipe-a:
>      - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#6029])
>     [100]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@edp-1-pipe-a.html 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#6029])
>     [101]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@edp-1-pipe-a.html 
> 
> 
>    * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#3528])
>     [102]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html 
> 
>      - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#3528])
>     [103]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html 
> 
> 
>    * igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:
>      - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#5287]) +1 
> similar issue
>     [104]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled.html 
> 
>      - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#5287])
>     [105]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled.html 
> 
> 
>    * igt@kms_fbcon_fbt@fbc-suspend:
>      - shard-apl:          [PASS][106] -> [FAIL][107] ([i915#4767])
>     [106]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html 
> 
>     [107]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html 
> 
>      - shard-kbl:          NOTRUN -> [FAIL][108] ([i915#4767])
>     [108]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html 
> 
> 
>    * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>      - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#109274] / 
> [fdo#111825]) +14 similar issues
>     [109]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html 
> 
> 
>    * igt@kms_flip@2x-nonexisting-fb:
>      - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109274]) +5 
> similar issues
>     [110]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb6/igt@kms_flip@2x-nonexisting-fb.html 
> 
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
>      - shard-snb:          [PASS][111] -> [INCOMPLETE][112] ([i915#4839])
>     [111]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html 
> 
>     [112]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-snb4/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html 
> 
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
>      - shard-apl:          NOTRUN -> [DMESG-WARN][113] ([i915#180]) +1 
> similar issue
>     [113]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html 
> 
> 
>    * 
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>      - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2587]) +1 
> similar issue
>     [114]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html 
> 
>      - shard-iclb:         NOTRUN -> [SKIP][115] ([i915#3701])
>     [115]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html 
> 
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
>      - shard-kbl:          [PASS][116] -> [DMESG-WARN][117] ([i915#62] / 
> [i915#92]) +7 similar issues
>     [116]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html 
> 
>     [117]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html 
> 
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
>      - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109280]) +22 
> similar issues
>     [118]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html 
> 
> 
>    * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>      - shard-iclb:         NOTRUN -> [SKIP][119] ([i915#5438]) +1 
> similar issue
>     [119]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html 
> 
> 
>    * 
> igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>      - shard-tglb:         NOTRUN -> [SKIP][120] ([fdo#109280] / 
> [fdo#111825]) +39 similar issues
>     [120]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html 
> 
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>      - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#5439]) +1 
> similar issue
>     [121]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html 
> 
> 
>    * igt@kms_invalid_mode@clock-too-high:
>      - shard-tglb:         NOTRUN -> [SKIP][122] ([i915#4278])
>     [122]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb3/igt@kms_invalid_mode@clock-too-high.html 
> 
> 
>    * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>      - shard-iclb:         NOTRUN -> [SKIP][123] ([fdo#109289]) +4 
> similar issues
>     [123]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html 
> 
> 
>    * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
>      - shard-kbl:          [PASS][124] -> [SKIP][125] ([fdo#109271] / 
> [i915#92])
>     [124]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-kbl4/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html 
> 
>     [125]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html 
> 
> 
>    * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
>      - shard-glk:          NOTRUN -> [FAIL][126] ([fdo#108145] / 
> [i915#265])
>     [126]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html 
> 
>      - shard-apl:          NOTRUN -> [FAIL][127] ([fdo#108145] / 
> [i915#265])
>     [127]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html 
> 
> 
>    * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
>      - shard-kbl:          NOTRUN -> [FAIL][128] ([fdo#108145] / 
> [i915#265]) +2 similar issues
>     [128]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html 
> 
> 
>    * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
>      - shard-iclb:         NOTRUN -> [SKIP][129] ([fdo#109278]) +36 
> similar issues
>     [129]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb5/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html 
> 
> 
>    * igt@kms_plane_lowres@pipe-b-tiling-4:
>      - shard-tglb:         NOTRUN -> [SKIP][130] ([i915#5288]) +1 
> similar issue
>     [130]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb2/igt@kms_plane_lowres@pipe-b-tiling-4.html 
> 
> 
>    * igt@kms_plane_lowres@pipe-c-tiling-yf:
>      - shard-iclb:         NOTRUN -> [SKIP][131] ([i915#3536])
>     [131]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb3/igt@kms_plane_lowres@pipe-c-tiling-yf.html 
> 
> 
>    * igt@kms_plane_lowres@pipe-d-tiling-y:
>      - shard-tglb:         NOTRUN -> [SKIP][132] ([i915#3536]) +1 
> similar issue
>     [132]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-y.html 
> 
> 
>    * igt@kms_plane_lowres@pipe-d-tiling-yf:
>      - shard-tglb:         NOTRUN -> [SKIP][133] ([fdo#111615] / 
> [fdo#112054]) +1 similar issue
>     [133]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb6/igt@kms_plane_lowres@pipe-d-tiling-yf.html 
> 
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-dp-1-planes-upscale:
>      - shard-kbl:          [PASS][134] -> [DMESG-WARN][135] ([i915#180] 
> / [i915#62] / [i915#92]) +1 similar issue
>     [134]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-kbl6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-dp-1-planes-upscale.html 
> 
>     [135]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-dp-1-planes-upscale.html 
> 
> 
>    * 
> igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-a-edp-1-upscale-with-rotation: 
> 
>      - shard-iclb:         NOTRUN -> [SKIP][136] ([i915#5176]) +5 
> similar issues
>     [136]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb8/igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-a-edp-1-upscale-with-rotation.html 
> 
> 
>    * 
> igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-edp-1-upscale-with-rotation: 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][137] ([i915#5176]) +7 
> similar issues
>     [137]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb7/igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-edp-1-upscale-with-rotation.html 
> 
> 
>    * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>      - shard-iclb:         NOTRUN -> [SKIP][138] ([fdo#111068] / 
> [i915#658])
>     [138]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html 
> 
>      - shard-kbl:          NOTRUN -> [SKIP][139] ([fdo#109271] / 
> [i915#658]) +2 similar issues
>     [139]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][140] ([i915#2920])
>     [140]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html 
> 
> 
>    * igt@kms_psr2_su@page_flip-nv12:
>      - shard-tglb:         NOTRUN -> [SKIP][141] ([i915#1911])
>     [141]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@kms_psr2_su@page_flip-nv12.html 
> 
> 
>    * igt@kms_psr@psr2_cursor_mmap_gtt:
>      - shard-iclb:         NOTRUN -> [SKIP][142] ([fdo#109441])
>     [142]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_gtt.html 
> 
> 
>    * igt@kms_psr@psr2_sprite_blt:
>      - shard-tglb:         NOTRUN -> [FAIL][143] ([i915#132] / 
> [i915#3467]) +2 similar issues
>     [143]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb3/igt@kms_psr@psr2_sprite_blt.html 
> 
> 
>    * igt@kms_psr@psr2_sprite_plane_move:
>      - shard-iclb:         [PASS][144] -> [SKIP][145] ([fdo#109441]) +2 
> similar issues
>     [144]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html 
> 
>     [145]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html 
> 
> 
>    * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>      - shard-tglb:         NOTRUN -> [SKIP][146] ([i915#5519])
>     [146]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html 
> 
> 
>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>      - shard-tglb:         [PASS][147] -> [SKIP][148] ([i915#5519])
>     [147]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html 
> 
>     [148]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html 
> 
> 
>    * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>      - shard-tglb:         NOTRUN -> [SKIP][149] ([i915#5289])
>     [149]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html 
> 
> 
>    * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
>      - shard-tglb:         NOTRUN -> [SKIP][150] ([i915#5030]) +3 
> similar issues
>     [150]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb6/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html 
> 
> 
>    * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
>      - shard-iclb:         NOTRUN -> [SKIP][151] ([i915#5030]) +2 
> similar issues
>     [151]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb6/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html 
> 
> 
>    * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>      - shard-iclb:         NOTRUN -> [SKIP][152] ([i915#3555]) +2 
> similar issues
>     [152]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html 
> 
> 
>    * igt@kms_sysfs_edid_timing:
>      - shard-apl:          NOTRUN -> [FAIL][153] ([IGT#2])
>     [153]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl1/igt@kms_sysfs_edid_timing.html 
> 
> 
>    * igt@kms_vblank@pipe-d-wait-idle:
>      - shard-apl:          NOTRUN -> [SKIP][154] ([fdo#109271] / 
> [i915#533])
>     [154]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html 
> 
> 
>    * igt@kms_vrr@flip-dpms:
>      - shard-tglb:         NOTRUN -> [SKIP][155] ([i915#3555]) +2 
> similar issues
>     [155]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb5/igt@kms_vrr@flip-dpms.html 
> 
> 
>    * igt@nouveau_crc@pipe-a-ctx-flip-detection:
>      - shard-iclb:         NOTRUN -> [SKIP][156] ([i915#2530]) +1 
> similar issue
>     [156]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb8/igt@nouveau_crc@pipe-a-ctx-flip-detection.html 
> 
> 
>    * igt@nouveau_crc@pipe-d-source-rg:
>      - shard-iclb:         NOTRUN -> [SKIP][157] ([fdo#109278] / 
> [i915#2530])
>     [157]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb7/igt@nouveau_crc@pipe-d-source-rg.html 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][158] ([i915#2530]) +2 
> similar issues
>     [158]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb2/igt@nouveau_crc@pipe-d-source-rg.html 
> 
> 
>    * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
>      - shard-iclb:         NOTRUN -> [SKIP][159] ([fdo#109291]) +1 
> similar issue
>     [159]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb7/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][160] ([fdo#109291]) +2 
> similar issues
>     [160]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb2/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html 
> 
> 
>    * igt@prime_vgem@coherency-gtt:
>      - shard-tglb:         NOTRUN -> [SKIP][161] ([fdo#111656])
>     [161]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb6/igt@prime_vgem@coherency-gtt.html 
> 
>      - shard-iclb:         NOTRUN -> [SKIP][162] ([fdo#109292])
>     [162]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb6/igt@prime_vgem@coherency-gtt.html 
> 
> 
>    * igt@prime_vgem@fence-read-hang:
>      - shard-tglb:         NOTRUN -> [SKIP][163] ([fdo#109295]) +1 
> similar issue
>     [163]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb7/igt@prime_vgem@fence-read-hang.html 
> 
> 
>    * igt@sysfs_clients@fair-0:
>      - shard-tglb:         NOTRUN -> [SKIP][164] ([i915#2994]) +1 
> similar issue
>     [164]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb8/igt@sysfs_clients@fair-0.html 
> 
> 
>    * igt@sysfs_clients@fair-1:
>      - shard-apl:          NOTRUN -> [SKIP][165] ([fdo#109271] / 
> [i915#2994]) +3 similar issues
>     [165]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl2/igt@sysfs_clients@fair-1.html 
> 
> 
>    * igt@sysfs_clients@sema-25:
>      - shard-iclb:         NOTRUN -> [SKIP][166] ([i915#2994]) +1 
> similar issue
>     [166]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb4/igt@sysfs_clients@sema-25.html 
> 
>      - shard-kbl:          NOTRUN -> [SKIP][167] ([fdo#109271] / 
> [i915#2994]) +1 similar issue
>     [167]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl7/igt@sysfs_clients@sema-25.html 
> 
>      - shard-glk:          NOTRUN -> [SKIP][168] ([fdo#109271] / 
> [i915#2994])
>     [168]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk3/igt@sysfs_clients@sema-25.html 
> 
> 
>    * igt@tools_test@sysfs_l3_parity:
>      - shard-iclb:         NOTRUN -> [SKIP][169] ([fdo#109307])
>     [169]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb3/igt@tools_test@sysfs_l3_parity.html 
> 
>      - shard-tglb:         NOTRUN -> [SKIP][170] ([fdo#109307])
>     [170]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-tglb1/igt@tools_test@sysfs_l3_parity.html 
> 
> 
>    #### Possible fixes ####
> 
>    * igt@gem_eio@unwedge-stress:
>      - shard-iclb:         [TIMEOUT][171] ([i915#3070]) -> [PASS][172]
>     [171]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb8/igt@gem_eio@unwedge-stress.html 
> 
>     [172]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb7/igt@gem_eio@unwedge-stress.html 
> 
> 
>    * igt@gem_exec_fair@basic-pace@vcs0:
>      - shard-iclb:         [FAIL][173] ([i915#2842]) -> [PASS][174]
>     [173]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs0.html 
> 
>     [174]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html 
> 
> 
>    * igt@gem_exec_fair@basic-pace@vecs0:
>      - shard-kbl:          [FAIL][175] ([i915#2842]) -> [PASS][176] +1 
> similar issue
>     [175]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html 
> 
>     [176]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html 
> 
>      - shard-glk:          [FAIL][177] ([i915#2842]) -> [PASS][178] +3 
> similar issues
>     [177]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-glk6/igt@gem_exec_fair@basic-pace@vecs0.html 
> 
>     [178]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html 
> 
> 
>    * igt@gem_exec_flush@basic-wb-rw-before-default:
>      - shard-snb:          [SKIP][179] ([fdo#109271]) -> [PASS][180] +1 
> similar issue
>     [179]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-snb6/igt@gem_exec_flush@basic-wb-rw-before-default.html 
> 
>     [180]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-snb7/igt@gem_exec_flush@basic-wb-rw-before-default.html 
> 
> 
>    * igt@i915_suspend@fence-restore-tiled2untiled:
>      - shard-apl:          [DMESG-WARN][181] ([i915#180]) -> [PASS][182] 
> +2 similar issues
>     [181]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html 
> 
>     [182]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html 
> 
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>      - shard-iclb:         [FAIL][183] ([i915#2346]) -> [PASS][184]
>     [183]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html 
> 
>     [184]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html 
> 
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>      - shard-iclb:         [SKIP][185] ([i915#3701]) -> [PASS][186]
>     [185]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html 
> 
>     [186]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html 
> 
> 
>    * igt@kms_plane_cursor@pipe-b-viewport-size-128:
>      - shard-glk:          [DMESG-WARN][187] ([i915#118]) -> [PASS][188]
>     [187]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-glk1/igt@kms_plane_cursor@pipe-b-viewport-size-128.html 
> 
>     [188]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk8/igt@kms_plane_cursor@pipe-b-viewport-size-128.html 
> 
> 
>    * 
> igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale: 
> 
>      - shard-iclb:         [SKIP][189] ([i915#5235]) -> [PASS][190] +2 
> similar issues
>     [189]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale.html 
> 
>     [190]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale.html 
> 
> 
>    * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>      - shard-glk:          [DMESG-FAIL][191] ([i915#118]) -> [PASS][192] 
> +1 similar issue
>     [191]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-glk1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html 
> 
>     [192]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html 
> 
> 
>    * igt@sysfs_heartbeat_interval@mixed@vcs0:
>      - shard-glk:          [WARN][193] ([i915#4055]) -> [PASS][194]
>     [193]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-glk2/igt@sysfs_heartbeat_interval@mixed@vcs0.html 
> 
>     [194]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk8/igt@sysfs_heartbeat_interval@mixed@vcs0.html 
> 
> 
>    * igt@sysfs_heartbeat_interval@mixed@vecs0:
>      - shard-glk:          [FAIL][195] ([i915#1731]) -> [PASS][196]
>     [195]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-glk2/igt@sysfs_heartbeat_interval@mixed@vecs0.html 
> 
>     [196]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-glk8/igt@sysfs_heartbeat_interval@mixed@vecs0.html 
> 
> 
>    #### Warnings ####
> 
>    * igt@gem_exec_balancer@parallel-bb-first:
>      - shard-iclb:         [SKIP][197] ([i915#4525]) -> 
> [DMESG-WARN][198] ([i915#5614])
>     [197]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html 
> 
>     [198]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb4/igt@gem_exec_balancer@parallel-bb-first.html 
> 
> 
>    * igt@gem_exec_balancer@parallel-keep-in-fence:
>      - shard-iclb:         [DMESG-WARN][199] ([i915#5614]) -> 
> [SKIP][200] ([i915#4525])
>     [199]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html 
> 
>     [200]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb6/igt@gem_exec_balancer@parallel-keep-in-fence.html 
> 
> 
>    * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>      - shard-kbl:          [SKIP][201] ([fdo#109271] / [i915#3886]) -> 
> [SKIP][202] ([fdo#109271] / [i915#3886] / [i915#92])
>     [201]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-kbl7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html 
> 
>     [202]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html 
> 
> 
>    * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
>      - shard-kbl:          [SKIP][203] ([fdo#109271] / [fdo#111827]) -> 
> [SKIP][204] ([fdo#109271] / [fdo#111827] / [i915#92]) +2 similar issues
>     [203]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html 
> 
>     [204]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html 
> 
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-dp-1-planes-upscale:
>      - shard-kbl:          [SKIP][205] ([fdo#109271]) -> [SKIP][206] 
> ([fdo#109271] / [i915#92]) +9 similar issues
>     [205]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-kbl6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-dp-1-planes-upscale.html 
> 
>     [206]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-kbl3/igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-dp-1-planes-upscale.html 
> 
> 
>    * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>      - shard-iclb:         [SKIP][207] ([i915#658]) -> [SKIP][208] 
> ([i915#2920])
>     [207]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html 
> 
>     [208]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html 
> 
> 
>    * igt@runner@aborted:
>      - shard-apl:          ([FAIL][209], [FAIL][210], [FAIL][211], 
> [FAIL][212], [FAIL][213], [FAIL][214], [FAIL][215], [FAIL][216]) 
> ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][217], 
> [FAIL][218], [FAIL][219], [FAIL][220], [FAIL][221], [FAIL][222], 
> [FAIL][223], [FAIL][224]) ([fdo#109271] / [i915#180] / [i915#3002] / 
> [i915#4312] / [i915#5257])
>     [209]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl4/igt@runner@aborted.html 
> 
>     [210]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl2/igt@runner@aborted.html 
> 
>     [211]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl7/igt@runner@aborted.html 
> 
>     [212]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl7/igt@runner@aborted.html 
> 
>     [213]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl7/igt@runner@aborted.html 
> 
>     [214]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl2/igt@runner@aborted.html 
> 
>     [215]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl6/igt@runner@aborted.html 
> 
>     [216]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11669/shard-apl3/igt@runner@aborted.html 
> 
>     [217]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl7/igt@runner@aborted.html 
> 
>     [218]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl3/igt@runner@aborted.html 
> 
>     [219]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl3/igt@runner@aborted.html 
> 
>     [220]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl4/igt@runner@aborted.html 
> 
>     [221]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl8/igt@runner@aborted.html 
> 
>     [222]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl4/igt@runner@aborted.html 
> 
>     [223]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl3/igt@runner@aborted.html 
> 
>     [224]: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/shard-apl3/igt@runner@aborted.html 
> 
> 
>      {name}: This element is suppressed. This means it is ignored when 
> computing
>            the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>    [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>    [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>    [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>    [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>    [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>    [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>    [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>    [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>    [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>    [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>    [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>    [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
>    [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>    [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>    [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>    [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>    [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>    [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>    [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
>    [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>    [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>    [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>    [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>    [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
>    [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>    [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>    [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>    [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>    [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>    [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>    [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>    [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>    [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
>    [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>    [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
>    [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
>    [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>    [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>    [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>    [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>    [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
>    [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>    [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>    [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>    [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
>    [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
>    [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>    [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>    [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>    [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>    [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
>    [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>    [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>    [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>    [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>    [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>    [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>    [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>    [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
>    [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>    [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>    [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>    [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>    [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
>    [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
>    [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>    [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>    [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>    [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>    [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
>    [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>    [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
>    [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
>    [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>    [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
>    [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
>    [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>    [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>    [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
>    [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>    [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
>    [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>    [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>    [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
>    [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
>    [i915#4055]: https://gitlab.freedesktop.org/drm/intel/issues/4055
>    [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>    [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
>    [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>    [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
>    [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>    [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>    [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>    [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>    [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>    [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>    [i915#4839]: https://gitlab.freedesktop.org/drm/intel/issues/4839
>    [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
>    [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
>    [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
>    [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
>    [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
>    [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
>    [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>    [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>    [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
>    [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>    [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
>    [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>    [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>    [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>    [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
>    [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>    [i915#5438]: https://gitlab.freedesktop.org/drm/intel/issues/5438
>    [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>    [i915#5501]: https://gitlab.freedesktop.org/drm/intel/issues/5501
>    [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
>    [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
>    [i915#5691]: https://gitlab.freedesktop.org/drm/intel/issues/5691
>    [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>    [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
>    [i915#6029]: https://gitlab.freedesktop.org/drm/intel/issues/6029
>    [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
>    [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>    [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
>    [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
> 
> 
> Build changes
> -------------
> 
>    * CI: CI-20190529 -> None
>    * IGT: IGT_6478 -> IGTPW_7127
>    * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_11669: 3c90017b789c05dd9548205b2fa3bb05d7890be3 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7127: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/index.html
>    IGT_6478: 7c3ceb08b633a66f77f42e596593de394da5dccc @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7127/index.html
> 
