Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607E510E9F9
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 15:41:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id n1so2137677wrg.12
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 08:41:26 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.86])
 by smtp.googlemail.com with ESMTPSA id
 g16-20020a05600c4ed000b0039c5497deccsm14117786wmq.1.2022.06.16.08.41.22
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 08:41:23 -0700 (PDT)
Message-ID: <467794c6-b2a1-afeb-3846-2054d190ef97@gmail.com>
Date: Thu, 16 Jun 2022 18:41:18 +0300
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20220611203845.15118-1-juhapekka.heikkila@gmail.com>
 <165539167623.17457.16512838795415136619@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <165539167623.17457.16512838795415136619@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_Allow_XY=5FFAST=5FCOPY=5FBLT_on_DG2_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

here would be false positive again, gem_exec_schedule on kbl cannot be 
affected by my change in any way.

/Juha-Pekka

On 16.6.2022 18.01, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/igt_fb: Allow XY_FAST_COPY_BLT on DG2 (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/105025/ 
> <https://patchwork.freedesktop.org/series/105025/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11766_full -> IGTPW_7323_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7323_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7323_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/index.html
> 
> 
>     Participating hosts (12 -> 9)
> 
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_7323_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@gem_exec_schedule@wide@vecs0:
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-kbl1/igt@gem_exec_schedule@wide@vecs0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl1/igt@gem_exec_schedule@wide@vecs0.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@perf@gen12-oa-tlb-invalidate:
>       o {shard-rkl}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@perf@gen12-oa-tlb-invalidate.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7323_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@feature_discovery@chamelium:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@feature_discovery@chamelium.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@feature_discovery@chamelium.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@feature_discovery@display-3x:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@feature_discovery@display-3x.html>
>         (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@feature_discovery@display-3x.html>
>         (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
> 
>   *
> 
>     igt@gem_ctx_param@set-priority-not-supported:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@gem_ctx_param@set-priority-not-supported.html>
>         (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@gem_ctx_param@set-priority-not-supported.html>
>         (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
> 
>   *
> 
>     igt@gem_ctx_persistence@engines-mixed-process:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-snb2/igt@gem_ctx_persistence@engines-mixed-process.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099
>         <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +1
>         similar issue
>   *
> 
>     igt@gem_exec_balancer@parallel-bb-first:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb4/igt@gem_exec_balancer@parallel-bb-first.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +5
>         similar issues
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
>         similar issue
> 
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         (i915#2849 <https://gitlab.freedesktop.org/drm/intel/issues/2849>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-tglb8/igt@gem_huc_copy@huc-copy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl7/igt@gem_lmem_swapping@parallel-random.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o
> 
>         shard-apl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl3/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk8/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-snb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-snb2/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-on:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@gem_pxp@reject-modify-context-protection-on.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@gem_pxp@reject-modify-context-protection-on.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>   *
> 
>     igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html>
>         (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>   *
> 
>     igt@gem_softpin@evict-single-offset:
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk9/igt@gem_softpin@evict-single-offset.html>
>         (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl1/igt@gem_softpin@evict-single-offset.html>
>         (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
> 
>   *
> 
>     igt@gem_userptr_blits@coherency-sync:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@gem_userptr_blits@coherency-sync.html>
>         (fdo#109290 <https://bugs.freedesktop.org/show_bug.cgi?id=109290>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@gem_userptr_blits@coherency-sync.html>
>         (fdo#110542 <https://bugs.freedesktop.org/show_bug.cgi?id=110542>)
> 
>   *
> 
>     igt@gem_userptr_blits@dmabuf-sync:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@gem_userptr_blits@dmabuf-sync.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3323 <https://gitlab.freedesktop.org/drm/intel/issues/3323>)
>   *
> 
>     igt@gen3_mixed_blits:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@gen3_mixed_blits.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +2
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb6/igt@gen3_mixed_blits.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +1
>         similar issue
> 
>   *
> 
>     igt@gen9_exec_parse@unaligned-access:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@gen9_exec_parse@unaligned-access.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527> /
>         i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@gen9_exec_parse@unaligned-access.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         similar issue
> 
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html>
>         (i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-apl6/igt@i915_pm_dc@dc9-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@i915_pm_dc@dc9-dpms.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (fdo#110892 <https://bugs.freedesktop.org/show_bug.cgi?id=110892>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (fdo#111644
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111644> /
>         i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>
>         / i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
> 
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387 <https://gitlab.freedesktop.org/drm/intel/issues/4387>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387 <https://gitlab.freedesktop.org/drm/intel/issues/4387>)
> 
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-tglb7/igt@i915_selftest@live@hangcheck.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@i915_selftest@live@hangcheck.html>
>         (i915#5591 <https://gitlab.freedesktop.org/drm/intel/issues/5591>)
>   *
> 
>     igt@kms_atomic@atomic_plane_damage:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_atomic@atomic_plane_damage.html>
>         (i915#4765 <https://gitlab.freedesktop.org/drm/intel/issues/4765>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +2
>         similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>         (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +3
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk7/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +4
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl6/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +162
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +23
>         similar issues
>   *
> 
>     igt@kms_chamelium@dp-hpd-enable-disable-mode:
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk2/igt@kms_chamelium@dp-hpd-enable-disable-mode.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_chamelium@dp-hpd-enable-disable-mode.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
> 
>   *
> 
>     igt@kms_chamelium@hdmi-edid-read:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-snb4/igt@kms_chamelium@hdmi-edid-read.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_chamelium@vga-hpd:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl1/igt@kms_chamelium@vga-hpd.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +13
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_chamelium@vga-hpd.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>   *
> 
>     igt@kms_color@pipe-d-ctm-max:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_color@pipe-d-ctm-max.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#1149 <https://gitlab.freedesktop.org/drm/intel/issues/1149>)
>   *
> 
>     igt@kms_color_chamelium@pipe-a-ctm-max:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl7/igt@kms_color_chamelium@pipe-a-ctm-max.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-d-degamma:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_color_chamelium@pipe-d-degamma.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>
>         / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-512x512-random:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html>
>         (fdo#109279
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109279> /
>         i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +3
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109279
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109279>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +84
>         similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1
>         similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding.html>
>         (i915#3319
>         <https://gitlab.freedesktop.org/drm/intel/issues/3319>) +1
>         similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-snb7/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +144
>         similar issues
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>   *
> 
>     igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#3528 <https://gitlab.freedesktop.org/drm/intel/issues/3528>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#3528 <https://gitlab.freedesktop.org/drm/intel/issues/3528>)
> 
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888> /
>         i915#5160 <https://gitlab.freedesktop.org/drm/intel/issues/5160>)
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb5/igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled.html>
>         (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled.html>
>         (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
> 
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +2
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +2
>         similar issues
> 
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +4 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +13
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +79
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +13
>         similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>         (i915#1188 <https://gitlab.freedesktop.org/drm/intel/issues/1188>)
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>) +1
>         similar issue
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
> 
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +3
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +2
>         similar issues
> 
>   *
> 
>     igt@kms_psr@psr2_primary_mmap_cpu:
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb5/igt@kms_psr@psr2_primary_mmap_cpu.html>
>         (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132>
>         / i915#3467
>         <https://gitlab.freedesktop.org/drm/intel/issues/3467>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_psr@psr2_primary_render:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb2/igt@kms_psr@psr2_primary_render.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@kms_psr@psr2_primary_render.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +2
>         similar issues
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5519
>         <https://gitlab.freedesktop.org/drm/intel/issues/5519>) +1
>         similar issue
>   *
> 
>     igt@kms_vrr@flip-dpms:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb2/igt@kms_vrr@flip-dpms.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@kms_vrr@flip-dpms.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
> 
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl2/igt@kms_writeback@writeback-invalid-parameters.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>   *
> 
>     igt@nouveau_crc@pipe-b-source-rg:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@nouveau_crc@pipe-b-source-rg.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@nouveau_crc@pipe-b-source-rg.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
> 
>   *
> 
>     igt@prime_nv_pcopy@test3_1:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@prime_nv_pcopy@test3_1.html>
>         (fdo#109291
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109291>) +2
>         similar issues
>   *
> 
>     igt@prime_nv_test@i915_import_cpu_mmap:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@prime_nv_test@i915_import_cpu_mmap.html>
>         (fdo#109291
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109291>) +2
>         similar issues
>   *
> 
>     igt@sw_sync@sync_multi_timeline_wait:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl6/igt@sw_sync@sync_multi_timeline_wait.html>
>         (i915#6140 <https://gitlab.freedesktop.org/drm/intel/issues/6140>)
>   *
> 
>     igt@sysfs_clients@recycle-many:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl3/igt@sysfs_clients@recycle-many.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +2
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@sysfs_clients@recycle-many.html>
>         (i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk8/igt@sysfs_clients@recycle-many.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@sysfs_clients@recycle-many.html>
>         (i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@sysfs_clients@recycle-many.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_ctx_persistence@many-contexts:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-tglb3/igt@gem_ctx_persistence@many-contexts.html>
>         (i915#2410
>         <https://gitlab.freedesktop.org/drm/intel/issues/2410>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@gem_ctx_persistence@many-contexts.html>
>   *
> 
>     igt@gem_eio@in-flight-10ms:
> 
>       o shard-tglb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-tglb5/igt@gem_eio@in-flight-10ms.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@gem_eio@in-flight-10ms.html>
>   *
> 
>     igt@gem_eio@in-flight-contexts-10ms:
> 
>       o
> 
>         shard-apl: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-apl2/igt@gem_eio@in-flight-contexts-10ms.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl1/igt@gem_eio@in-flight-contexts-10ms.html>
> 
>       o
> 
>         {shard-tglu}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-tglu-1/igt@gem_eio@in-flight-contexts-10ms.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglu-1/igt@gem_eio@in-flight-contexts-10ms.html>
> 
>   *
> 
>     igt@gem_exec_balancer@parallel-out-fence:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html>
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o {shard-tglu}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-tglu-1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html>
>         +2 similar issues
>   *
> 
>     igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>         (fdo#109313
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109313>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>   *
> 
>     igt@gem_exec_reloc@basic-write-read-active:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-active.html>
>         +3 similar issues
>   *
> 
>     igt@gem_exec_schedule@semaphore-power:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html>
>         (fdo#110254
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110254>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html>
>   *
> 
>     igt@gem_exec_whisper@basic-queues-priority-all:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html>
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@batch-invalid-length:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-1/igt@gen9_exec_parse@batch-invalid-length.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html>
>   *
> 
>     igt@i915_hangman@engine-engine-error@bcs0:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-1/igt@i915_hangman@engine-engine-error@bcs0.html>
>         +2 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-0:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>         +5 similar issues
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html>
>         (i915#72 <https://gitlab.freedesktop.org/drm/intel/issues/72>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o
> 
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
> 
>       o
> 
>         shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         +1 similar issue
> 
>   *
> 
>     igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html>
>         +6 similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         (i915#1188
>         <https://gitlab.freedesktop.org/drm/intel/issues/1188>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc-pipe-c:
> 
>       o
> 
>         shard-kbl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html>
> 
>       o
> 
>         shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html>
> 
>       o
> 
>         shard-glk: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-glk7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html>
> 
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
>         +4 similar issues
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb1/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>         / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>   *
> 
>     igt@kms_psr@psr2_cursor_mmap_gtt:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>         +1 similar issue
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (i915#5519
>         <https://gitlab.freedesktop.org/drm/intel/issues/5519>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>   *
> 
>     igt@kms_universal_plane@universal-plane-pipe-a-functional:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-a-functional.html>
>   *
> 
>     igt@perf@polling-parameterized:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-tglb7/igt@perf@polling-parameterized.html>
>         (i915#5639
>         <https://gitlab.freedesktop.org/drm/intel/issues/5639>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb5/igt@perf@polling-parameterized.html>
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@prime_vgem@basic-fence-read.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@prime_vgem@basic-fence-read.html>
>   *
> 
>     igt@prime_vgem@coherency-gtt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@prime_vgem@coherency-gtt.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@prime_vgem@coherency-gtt.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         (i915#2852 <https://gitlab.freedesktop.org/drm/intel/issues/2852>)
>   *
> 
>     igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6533 -> IGTPW_7323
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_11766: e0f4ae0988dac59813432134dfdf8d6a7a631b63 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7323: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/index.html
> IGT_6533: 6b5107d91827962808441db6b98e478aa9e67bdb @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
