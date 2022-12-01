Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D44A10E552
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Dec 2022 08:00:19 +0000 (UTC)
Message-ID: <cdba9061-7c84-b5da-c4f7-02dc8ec13743@intel.com>
Date: Thu, 1 Dec 2022 09:00:06 +0100
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <cover.1669791691.git.karolina.stolarek@intel.com>
 <166984103936.2880.17331656343355389046@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <166984103936.2880.17331656343355389046@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU3VwcG9y?=
 =?utf-8?q?t_custom_contexts_in_exec=5Fblit=28=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 30.11.2022 21:43, Patchwork wrote:
> *Patch Details*
> *Series:*	Support custom contexts in exec_blit()
> *URL:*	https://patchwork.freedesktop.org/series/111470/ 
> <https://patchwork.freedesktop.org/series/111470/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_12453_full -> IGTPW_8174_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8174_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8174_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/index.html
> 
> 
>     Participating hosts (10 -> 8)
> 
> Missing (2): pig-skl-6260u pig-glk-j5005
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_8174_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
>       o shard-iclb: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html>

Not related to my changes.

Thanks,
Karolina

> 
>     Known issues
> 
> Here are the changes found in IGTPW_8174_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_ctx_param@set-priority-not-supported:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb7/igt@gem_ctx_param@set-priority-not-supported.html>
>         (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb3/igt@gem_ctx_param@set-priority-not-supported.html>
>         (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
> 
>   *
> 
>     igt@gem_ctx_persistence@many-contexts:
> 
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb3/igt@gem_ctx_persistence@many-contexts.html>
>         (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>)
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) +2
>         similar issues
>   *
> 
>     igt@gem_exec_params@no-blt:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb6/igt@gem_exec_params@no-blt.html>
>         (fdo#109283 <https://bugs.freedesktop.org/show_bug.cgi?id=109283>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb5/igt@gem_exec_params@no-blt.html>
>         (fdo#109283 <https://bugs.freedesktop.org/show_bug.cgi?id=109283>)
> 
>   *
> 
>     igt@gem_exec_whisper@basic-queues-priority:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb2/igt@gem_exec_whisper@basic-queues-priority.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb6/igt@gem_exec_whisper@basic-queues-priority.html>
>         (i915#6453 <https://gitlab.freedesktop.org/drm/intel/issues/6453>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +2
>         similar issues
>   *
> 
>     igt@gem_lmem_swapping@verify:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb7/igt@gem_lmem_swapping@verify.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +2
>         similar issues
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl2/igt@gem_lmem_swapping@verify.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +2
>         similar issues
> 
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb2/igt@gem_pxp@reject-modify-context-protection-off-2.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +2
>         similar issues
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-on:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb1/igt@gem_pxp@reject-modify-context-protection-on.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +3
>         similar issues
>   *
> 
>     igt@gem_userptr_blits@access-control:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb6/igt@gem_userptr_blits@access-control.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb5/igt@gem_userptr_blits@access-control.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
> 
>   *
> 
>     igt@gen3_render_tiledx_blits:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb3/igt@gen3_render_tiledx_blits.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb7/igt@gen3_render_tiledx_blits.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
> 
>   *
> 
>     igt@gen9_exec_parse@shadow-peek:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb8/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527> /
>         i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb7/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         similar issue
> 
>   *
> 
>     igt@i915_module_load@load:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb2/igt@i915_module_load@load.html>
>         (i915#6227 <https://gitlab.freedesktop.org/drm/intel/issues/6227>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb1/igt@i915_module_load@load.html>
>         (i915#6227 <https://gitlab.freedesktop.org/drm/intel/issues/6227>)
> 
>   *
> 
>     igt@i915_pm_dc@dc6-psr:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb8/igt@i915_pm_dc@dc6-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb7/igt@i915_pm_dc@dc6-psr.html>
>         (i915#3989
>         <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>         i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +3
>         similar issues
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +2
>         similar issues
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb8/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>         (fdo#110725
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>         fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1
>         similar issue
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +80
>         similar issues
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +2
>         similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>         (fdo#110723
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) +2
>         similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +3
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl1/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +2
>         similar issues
> 
>   *
> 
>     igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb6/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +12
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +3
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_mc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb5/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +1
>         similar issue
>   *
> 
>     igt@kms_chamelium@hdmi-audio-edid:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb6/igt@kms_chamelium@hdmi-audio-edid.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +4
>         similar issues
>   *
> 
>     igt@kms_chamelium@vga-edid-read:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb2/igt@kms_chamelium@vga-edid-read.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl7/igt@kms_chamelium@vga-edid-read.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
> 
>   *
> 
>     igt@kms_content_protection@lic:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb1/igt@kms_content_protection@lic.html>
>         (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb2/igt@kms_content_protection@lic.html>
>         (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
> 
>   *
> 
>     igt@kms_content_protection@lic@pipe-a-dp-1:
> 
>       o shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl3/igt@kms_content_protection@lic@pipe-a-dp-1.html>
>         (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x170:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb2/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb1/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-random-max-size:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb1/igt@kms_cursor_crc@cursor-random-max-size.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1
>         similar issue
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb5/igt@kms_display_modes@extended-mode-basic.html>
>         (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +3
>         similar issues
>   *
> 
>     igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>
>         / i915#3637
>         <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +1
>         similar issue
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>         i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +1
>         similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>         i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +6
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +17
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html>
>         (i915#6497
>         <https://gitlab.freedesktop.org/drm/intel/issues/6497>) +6
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (i915#5438 <https://gitlab.freedesktop.org/drm/intel/issues/5438>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (i915#5439 <https://gitlab.freedesktop.org/drm/intel/issues/5439>)
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +15
>         similar issues
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +1
>         similar issue
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2
>         similar issues
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb6/igt@kms_psr2_su@page_flip-nv12.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>         / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr@psr2_primary_mmap_cpu:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
>   *
> 
>     igt@kms_psr@psr2_sprite_render:
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb7/igt@kms_psr@psr2_sprite_render.html>
>         (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132>
>         / i915#3467
>         <https://gitlab.freedesktop.org/drm/intel/issues/3467>) +2
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb8/igt@kms_psr@psr2_sprite_render.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-tglb3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>   *
> 
>     igt@kms_setmode@clone-exclusive-crtc:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb6/igt@kms_setmode@clone-exclusive-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1
>         similar issue
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl6/igt@kms_writeback@writeback-pixel-formats.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb7/igt@kms_writeback@writeback-pixel-formats.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb8/igt@kms_writeback@writeback-pixel-formats.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>   *
> 
>     igt@prime_vgem@fence-flip-hang:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb5/igt@prime_vgem@fence-flip-hang.html>
>         (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb6/igt@prime_vgem@fence-flip-hang.html>
>         (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
> 
>   *
> 
>     igt@sysfs_clients@busy:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-tglb6/igt@sysfs_clients@busy.html>
>         (i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
>   *
> 
>     igt@sysfs_clients@sema-25:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl7/igt@sysfs_clients@sema-25.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb6/igt@sysfs_clients@sema-25.html>
>         (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@unaligned-write:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-2/igt@fbdev@unaligned-write.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-6/igt@fbdev@unaligned-write.html>
>   *
> 
>     igt@gem_eio@reset-stress:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-dg1-19/igt@gem_eio@reset-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-dg1-15/igt@gem_eio@reset-stress.html>
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>   *
> 
>     igt@gem_exec_reloc@basic-write-wc-noreloc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-noreloc.html>
>         +2 similar issues
>   *
> 
>     igt@gem_exec_schedule@semaphore-power:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#7276
>         <https://gitlab.freedesktop.org/drm/intel/issues/7276>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html>
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-display:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>   *
> 
>     igt@gen9_exec_parse@unaligned-jump:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-2/igt@gen9_exec_parse@unaligned-jump.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-5/igt@gen9_exec_parse@unaligned-jump.html>
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html>
>         (i915#3989
>         <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>         i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html>
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@bcs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html>
>         (i915#3591
>         <https://gitlab.freedesktop.org/drm/intel/issues/3591>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html>
>         +1 similar issue
>   *
> 
>     igt@i915_pm_rpm@modeset-lpsp-stress:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html>
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         +7 similar issues
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-2/igt@kms_fbcon_fbt@psr.html>
>         (fdo#110189
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110189> /
>         i915#3955
>         <https://gitlab.freedesktop.org/drm/intel/issues/3955>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-6/igt@kms_fbcon_fbt@psr.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         +10 similar issues
>   *
> 
>     igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3558
>         <https://gitlab.freedesktop.org/drm/intel/issues/3558>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html>
>         +1 similar issue
>   *
> 
>     igt@kms_psr@cursor_blt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-5/igt@kms_psr@cursor_blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-6/igt@kms_psr@cursor_blt.html>
>         +2 similar issues
>   *
> 
>     igt@kms_psr@psr2_primary_render:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb1/igt@kms_psr@psr2_primary_render.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb2/igt@kms_psr@psr2_primary_render.html>
>         +1 similar issue
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5519
>         <https://gitlab.freedesktop.org/drm/intel/issues/5519>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>   *
> 
>     igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-2/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html>
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-rkl-2/igt@prime_vgem@basic-write.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-rkl-5/igt@prime_vgem@basic-write.html>
>         +1 similar issue
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#6117 <https://gitlab.freedesktop.org/drm/intel/issues/6117>)
>   *
> 
>     igt@gem_pwrite@basic-exhaustion:
> 
>       o shard-apl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-apl2/igt@gem_pwrite@basic-exhaustion.html>
>         (i915#7248
>         <https://gitlab.freedesktop.org/drm/intel/issues/7248>) -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl6/igt@gem_pwrite@basic-exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
> 
>       o shard-apl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>         (IGT#6
>         <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>         (i915#4573
>         <https://gitlab.freedesktop.org/drm/intel/issues/4573>) +1
>         similar issue
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb3/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) +1
>         similar issue
>   *
> 
>     igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@runner@aborted:
> 
>       o shard-apl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-apl2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12453/shard-apl1/igt@runner@aborted.html>)
>         (i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312>) -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/shard-apl8/igt@runner@aborted.html>)
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>
>         / i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7075 -> IGTPW_8174
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_12453: 737d35f11972f1fbe298db5f23ac9c42cfb78338 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8174: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8174/index.html
> IGT_7075: ae0ad0ffa147445cdf9d33c96a018f5a8b21a5ee @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
