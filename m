Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2072.outbound.protection.outlook.com [40.107.101.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763D06E05A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Nov 2021 22:46:34 +0000 (UTC)
References: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
 <163822450328.16119.11498021925119263308@emeril.freedesktop.org>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <ced6d5fb-84f0-9a57-8e2b-4a212239c790@amd.com>
Date: Mon, 29 Nov 2021 17:46:29 -0500
In-Reply-To: <163822450328.16119.11498021925119263308@emeril.freedesktop.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Improve_amd=5Fcolor?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Rodrigo Siqueira <rodrigo.siqueira@amd.com>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

I think this is a false-positive since it failed in a test that does not 
associate with this series. Follows the link to this patch:

https://patchwork.freedesktop.org/series/97382/

What do you think?

Thanks

On 2021-11-29 5:21 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	tests/amdgpu: Improve amd_color
> *URL:*	https://patchwork.freedesktop.org/series/97382/ 
> <https://patchwork.freedesktop.org/series/97382/>> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/index.html>> 
> 
>   CI Bug Log - changes from CI_DRM_10938_full -> IGTPW_6448_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_6448_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6448_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/index.html
> 
> 
>     Participating hosts (11 -> 7)
> 
> Missing (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_6448_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@gem_exec_schedule@submit-early-slice@rcs0:
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb2/igt@gem_exec_schedule@submit-early-slice@rcs0.html>>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@gem_exec_schedule@submit-early-slice@rcs0.html>> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_6448_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_ctx_persistence@process:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb7/igt@gem_ctx_persistence@process.html>>         ([fdo#109271] / [i915#1099]) +1 similar issue
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb8/igt@gem_eio@unwedge-stress.html>>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_eio@unwedge-stress.html>>         ([i915#2481] / [i915#3070])
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html>>         ([i915#4525])
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs1:
> 
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html>>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb7/igt@gem_exec_fair@basic-pace@rcs0.html>>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html>>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html>>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html>>         ([i915#2842]) +1 similar issue
> 
>       o
> 
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html>>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html>>         ([i915#2842]) +1 similar issue
> 
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html>>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html>>         ([i915#2849])
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@gem_huc_copy@huc-copy.html>>         ([fdo#109271] / [i915#2190])
>   *
> 
>     igt@gem_lmem_swapping@heavy-random:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl4/igt@gem_lmem_swapping@heavy-random.html>>         ([fdo#109271] / [i915#4613]) +2 similar issues
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-engines:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk9/igt@gem_lmem_swapping@parallel-random-engines.html>>         ([fdo#109271] / [i915#4613]) +1 similar issue
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl1/igt@gem_lmem_swapping@parallel-random-verify.html>>         ([fdo#109271] / [i915#4613]) +3 similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_lmem_swapping@parallel-random-verify.html>>         ([i915#4613]) +1 similar issue
> 
>   *
> 
>     igt@gem_lmem_swapping@random:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@gem_lmem_swapping@random.html>>         ([i915#4613]) +1 similar issue
>   *
> 
>     igt@gem_pwrite@basic-exhaustion:
> 
>       o shard-kbl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html>>         ([i915#2658])
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-off-1:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-off-1.html>>         ([i915#4270])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@gem_pxp@reject-modify-context-protection-off-1.html>>         ([i915#4270])
> 
>   *
> 
>     igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html>>         ([fdo#109271]) +247 similar issues
>   *
> 
>     igt@gem_render_copy@y-tiled-to-vebox-linear:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@gem_render_copy@y-tiled-to-vebox-linear.html>>         ([i915#768])
>   *
> 
>     igt@gem_userptr_blits@create-destroy-unsync:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_userptr_blits@create-destroy-unsync.html>>         ([i915#3297])
>   *
> 
>     igt@gem_userptr_blits@dmabuf-sync:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html>>         ([fdo#109271] / [i915#3323])
>   *
> 
>     igt@gen9_exec_parse@unaligned-access:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gen9_exec_parse@unaligned-access.html>>         ([i915#2856])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@gen9_exec_parse@unaligned-access.html>>         ([i915#2856])
> 
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html>>         ([i915#454])
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-fence:
> 
>       o shard-iclb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html>>         ([i915#1804] / [i915#2684])
>   *
> 
>     igt@i915_pm_rpm@pc8-residency:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html>>         ([fdo#109293] / [fdo#109506])
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>>         ([i915#404])
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>>         ([fdo#110725] / [fdo#111614]) +1 similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>>         ([fdo#111614])
> 
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>>         ([fdo#109271] / [i915#3777])
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>>         ([fdo#109271] / [i915#3777]) +3 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>>         ([fdo#110723])
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>>         ([fdo#111615]) +1 similar issue
>   *
> 
>     igt@kms_big_joiner@2x-modeset:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_big_joiner@2x-modeset.html>>         ([i915#2705])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_big_joiner@2x-modeset.html>>         ([i915#2705])
> 
>   *
> 
>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html>>         ([fdo#109271] / [i915#3886]) +13 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html>>         ([i915#3689] / [i915#3886]) +3 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html>>         ([i915#3689]) +3 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>>         ([fdo#109271] / [i915#3886]) +10 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>>         ([fdo#109271] / [i915#3886]) +9 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>>         ([fdo#109278] / [i915#3886]) +7 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs.html>>         ([fdo#111615] / [i915#3689])
>   *
> 
>     igt@kms_chamelium@dp-frame-dump:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@kms_chamelium@dp-frame-dump.html>>         ([fdo#109284] / [fdo#111827]) +7 similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-edid-change-during-suspend:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html>>         ([fdo#109271] / [fdo#111827]) +13 similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-edid-read:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_chamelium@hdmi-edid-read.html>>         ([fdo#109284] / [fdo#111827]) +5 similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb6/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html>>         ([fdo#109271] / [fdo#111827]) +4 similar issues
>   *
> 
>     igt@kms_color@pipe-d-ctm-green-to-red:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@kms_color@pipe-d-ctm-green-to-red.html>>         ([fdo#109278] / [i915#1149])
>   *
> 
>     igt@kms_color_chamelium@pipe-a-degamma:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html>>         ([fdo#109271] / [fdo#111827]) +11 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-c-ctm-0-5:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk2/igt@kms_color_chamelium@pipe-c-ctm-0-5.html>>         ([fdo#109271] / [fdo#111827]) +8 similar issues
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@kms_content_protection@atomic-dpms.html>>         ([i915#1319])
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@kms_content_protection@dp-mst-lic-type-0.html>>         ([i915#3116])
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_content_protection@legacy.html>>         ([fdo#111828])
>   *
> 
>     igt@kms_content_protection@lic:
> 
>       o
> 
>         shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl3/igt@kms_content_protection@lic.html>>         ([i915#1319]) +1 similar issue
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl2/igt@kms_content_protection@lic.html>>         ([fdo#110321])
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html>>         ([fdo#109271]) +108 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html>>         ([i915#3319]) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html>>         ([fdo#109278] / [fdo#109279]) +4 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html>>         ([fdo#109279] / [i915#3359]) +2 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html>>         ([i915#3359]) +5 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-suspend:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html>>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html>>         ([i915#2411] / [i915#456])
>   *
> 
>     igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement.html>>         ([fdo#109278]) +28 similar issues
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>>         ([fdo#109274] / [fdo#109278]) +1 similar issue
>   *
> 
>     igt@kms_cursor_legacy@pipe-b-single-move:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-glk1/igt@kms_cursor_legacy@pipe-b-single-move.html>>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk8/igt@kms_cursor_legacy@pipe-b-single-move.html>>         ([i915#118] / [i915#1888])
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html>>         ([i915#3788])
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-kbl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html>>         ([i915#180] / [i915#636])
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html>>         ([fdo#109274]) +2 similar issues
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html>>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html>>         ([i915#2122])
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>>         ([i915#180]) +2 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html>>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html>>         ([i915#180]) +2 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html>>         ([fdo#111825]) +20 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>>         ([fdo#109280]) +20 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html>>         ([fdo#109271]) +79 similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb8/igt@kms_hdr@bpc-switch-suspend.html>>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@kms_hdr@bpc-switch-suspend.html>>         ([i915#1373] / [i915#2828])
>   *
> 
>     igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html>>         ([fdo#109289])
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
> 
>       o
> 
>         shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>>         ([i915#180] / [i915#1982])
> 
>       o
> 
>         shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>>         ([i915#180])
> 
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>>         ([fdo#109271] / [i915#533]) +3 similar issues
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>>         ([fdo#109271] / [i915#533])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>>         ([fdo#109271] / [i915#533])
> 
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html>>         ([fdo#108145] / [i915#265]) +1 similar issue
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html>>         ([fdo#108145] / [i915#265]) +1 similar issue
> 
>   *
> 
>     igt@kms_plane_lowres@pipe-d-tiling-x:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_plane_lowres@pipe-d-tiling-x.html>>         ([i915#3536])
>   *
> 
>     igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html>>         ([fdo#111615] / [fdo#112054]) +1 similar issue
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>>         ([fdo#109271] / [i915#658]) +4 similar issues
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>>         ([fdo#109271] / [i915#658]) +4 similar issues
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html>>         ([i915#2920])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html>>         ([fdo#109271] / [i915#658]) +1 similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html>>         ([i915#2920])
> 
>   *
> 
>     igt@kms_psr2_su@frontbuffer:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_psr2_su@frontbuffer.html>>         ([i915#1911])
>   *
> 
>     igt@kms_psr@psr2_basic:
> 
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_psr@psr2_basic.html>>         ([i915#132] / [i915#3467])
>   *
> 
>     igt@kms_psr@psr2_cursor_blt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html>>         ([fdo#109441]) +1 similar issue
>   *
> 
>     igt@kms_psr@psr2_primary_mmap_gtt:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html>>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@kms_psr@psr2_primary_mmap_gtt.html>>         ([fdo#109441]) +1 similar issue
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl1/igt@kms_setmode@basic.html>>         ([i915#31])
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-glk9/igt@kms_setmode@basic.html>>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk8/igt@kms_setmode@basic.html>>         ([i915#31])
> 
>   *
> 
>     igt@kms_vblank@pipe-d-ts-continuation-idle:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl4/igt@kms_vblank@pipe-d-ts-continuation-idle.html>>         ([fdo#109271]) +212 similar issues
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl3/igt@kms_writeback@writeback-check-output.html>>         ([fdo#109271] / [i915#2437])
>   *
> 
>     igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html>>         ([i915#2530])
>   *
> 
>     igt@nouveau_crc@pipe-a-ctx-flip-detection:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@nouveau_crc@pipe-a-ctx-flip-detection.html>>         ([i915#2530]) +1 similar issue
>   *
> 
>     igt@perf@gen12-mi-rpc:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb8/igt@perf@gen12-mi-rpc.html>>         ([fdo#109289]) +1 similar issue
>   *
> 
>     igt@perf_pmu@rc6-suspend:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb6/igt@perf_pmu@rc6-suspend.html>>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@perf_pmu@rc6-suspend.html>>         ([i915#456])
>   *
> 
>     igt@prime_nv_api@i915_self_import_to_different_fd:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@prime_nv_api@i915_self_import_to_different_fd.html>>         ([fdo#109291])
>   *
> 
>     igt@prime_nv_test@nv_i915_sharing:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@prime_nv_test@nv_i915_sharing.html>>         ([fdo#109291]) +2 similar issues
>   *
> 
>     igt@sysfs_clients@fair-1:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl6/igt@sysfs_clients@fair-1.html>>         ([fdo#109271] / [i915#2994]) +3 similar issues
>   *
> 
>     igt@sysfs_clients@recycle-many:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk1/igt@sysfs_clients@recycle-many.html>>         ([fdo#109271] / [i915#2994]) +2 similar issues
>   *
> 
>     igt@sysfs_clients@sema-10:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl1/igt@sysfs_clients@sema-10.html>>         ([fdo#109271] / [i915#2994]) +4 similar issues
>   *
> 
>     igt@sysfs_clients@sema-25:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb8/igt@sysfs_clients@sema-25.html>>         ([i915#2994]) +2 similar issues
>   *
> 
>     igt@sysfs_clients@split-10:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@sysfs_clients@split-10.html>>         ([i915#2994]) +1 similar issue
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html>>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html>>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb7/igt@gem_exec_fair@basic-pace-solo@rcs0.html>>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html>>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o
> 
>         shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html>>         ([i915#2851]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html>> 
>       o
> 
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html>>         ([i915#2842]) -> [PASS][131]
> 
> [131
> 
