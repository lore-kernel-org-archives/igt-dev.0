Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EC210E5B2
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Mar 2022 12:57:03 +0000 (UTC)
Message-ID: <13ff13b0-0be2-de52-3008-17f5d7f21d98@intel.com>
Date: Fri, 25 Mar 2022 12:56:59 +0000
MIME-Version: 1.0
Content-Language: en-GB
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220325090958.408654-1-matthew.auld@intel.com>
 <164820517852.24039.11017421809844184076@emeril.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <164820517852.24039.11017421809844184076@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/3=5D_test/gem=5Flmem=5Fswappin?=
 =?utf-8?q?g=3A_account_for_object_rounding?=
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

On 25/03/2022 10:46, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,v2,1/3] test/gem_lmem_swapping: 
> account for object rounding
> *URL:*	https://patchwork.freedesktop.org/series/101778/ 
> <https://patchwork.freedesktop.org/series/101778/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/index.html>
> 
> 
>   CI Bug Log - changes from IGT_6393_full -> IGTPW_6829_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_6829_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6829_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/index.html
> 
> 
>     Participating hosts (9 -> 7)
> 
> Missing (2): shard-skl shard-rkl
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_6829_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@core_hotunplug@unbind-rebind:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-apl1/igt@core_hotunplug@unbind-rebind.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl8/igt@core_hotunplug@unbind-rebind.html>
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-glk8/igt@core_hotunplug@unbind-rebind.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk6/igt@core_hotunplug@unbind-rebind.html>
> 
>       o
> 
>         shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl1/igt@core_hotunplug@unbind-rebind.html>
> 
>   *
> 
>     igt@i915_module_load@reload:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-snb7/igt@i915_module_load@reload.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-snb4/igt@i915_module_load@reload.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
> 
> 

None of these are related AFAICT.


>     Known issues
> 
> Here are the changes found in IGTPW_6829_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@feature_discovery@display-3x:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb4/igt@feature_discovery@display-3x.html>
>         ([i915#1839]) +1 similar issue
>   *
> 
>     igt@feature_discovery@psr2:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb1/igt@feature_discovery@psr2.html>
>         ([i915#658])
>   *
> 
>     igt@gem_ccs@ctrl-surf-copy:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb7/igt@gem_ccs@ctrl-surf-copy.html>
>         ([i915#5327])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb2/igt@gem_ccs@ctrl-surf-copy.html>
>         ([i915#3555] / [i915#5325])
> 
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-persistence:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-snb5/igt@gem_ctx_persistence@legacy-engines-persistence.html>
>         ([fdo#109271] / [i915#1099]) +2 similar issues
>   *
> 
>     igt@gem_ctx_sseu@invalid-sseu:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@gem_ctx_sseu@invalid-sseu.html>
>         ([i915#280]) +1 similar issue
>   *
> 
>     igt@gem_exec_balancer@parallel-contexts:
> 
>       o
> 
>         shard-tglb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb1/igt@gem_exec_balancer@parallel-contexts.html>
>         ([i915#5076])
> 
>       o
> 
>         shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl1/igt@gem_exec_balancer@parallel-contexts.html>
>         ([i915#5076])
> 
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html>
>         ([i915#4525]) +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         ([i915#2842]) +2 similar issues
>   *
> 
>     igt@gem_exec_fair@basic-none@vecs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_params@no-blt:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb3/igt@gem_exec_params@no-blt.html>
>         ([fdo#109283])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb3/igt@gem_exec_params@no-blt.html>
>         ([fdo#109283])
> 
>   *
> 
>     igt@gem_exec_params@secure-non-master:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb3/igt@gem_exec_params@secure-non-master.html>
>         ([fdo#112283])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb3/igt@gem_exec_params@secure-non-master.html>
>         ([fdo#112283])
> 
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl3/igt@gem_lmem_swapping@heavy-verify-random.html>
>         ([fdo#109271] / [i915#4613]) +2 similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-random.html>
>         ([i915#4613]) +1 similar issue
> 
>   *
> 
>     igt@gem_lmem_swapping@random:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl4/igt@gem_lmem_swapping@random.html>
>         ([fdo#109271] / [i915#4613])
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb2/igt@gem_lmem_swapping@random-engines.html>
>         ([i915#4613]) +1 similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk5/igt@gem_lmem_swapping@random-engines.html>
>         ([fdo#109271] / [i915#4613])
> 
>   *
> 
>     igt@gem_media_vme:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb3/igt@gem_media_vme.html>
>         ([i915#284])
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb8/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>         ([i915#4270]) +3 similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>         ([i915#4270]) +3 similar issues
> 
>   *
> 
>     igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html>
>         ([fdo#109271]) +272 similar issues
>   *
> 
>     igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html>
>         ([i915#768]) +2 similar issues
>   *
> 
>     igt@gem_softpin@evict-snoop:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@gem_softpin@evict-snoop.html>
>         ([fdo#109312])
>   *
> 
>     igt@gem_userptr_blits@unsync-overlap:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb3/igt@gem_userptr_blits@unsync-overlap.html>
>         ([i915#3297])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb8/igt@gem_userptr_blits@unsync-overlap.html>
>         ([i915#3297])
> 
>   *
> 
>     igt@gem_userptr_blits@vma-merge:
> 
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb1/igt@gem_userptr_blits@vma-merge.html>
>         ([i915#3318])
>   *
> 
>     igt@gen9_exec_parse@bb-start-param:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb5/igt@gen9_exec_parse@bb-start-param.html>
>         ([i915#2527] / [i915#2856]) +2 similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb4/igt@gen9_exec_parse@bb-start-param.html>
>         ([i915#2856]) +1 similar issue
> 
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-apl8/igt@i915_pm_dc@dc9-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl4/igt@i915_pm_dc@dc9-dpms.html>
>         ([fdo#109271]) +1 similar issue
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>         ([fdo#111644] / [i915#1397] / [i915#2411])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>         ([fdo#110892])
> 
>   *
> 
>     igt@i915_selftest@live@gt_lrc:
> 
>       o shard-tglb: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@i915_selftest@live@gt_lrc.html>
>         ([i915#2373])
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o shard-tglb: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@i915_selftest@live@gt_pm.html>
>         ([i915#1759])
>   *
> 
>     igt@i915_suspend@sysfs-reader:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-apl3/igt@i915_suspend@sysfs-reader.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl3/igt@i915_suspend@sysfs-reader.html>
>         ([i915#180]) +4 similar issues
>   *
> 
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         ([i915#3826])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         ([i915#3826])
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>         ([i915#5286]) +5 similar issues
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         ([i915#5286]) +7 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         ([fdo#110725] / [fdo#111614]) +2 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         ([fdo#111614]) +3 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-glk5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>         ([i915#118])
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         ([fdo#109271] / [i915#3777]) +4 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         ([fdo#111615]) +14 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-glk5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html>
>         ([i915#1888])
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         ([fdo#109271] / [i915#3777]) +5 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         ([fdo#109271] / [i915#3777]) +5 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html>
>         ([fdo#109271]) +223 similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html>
>         ([fdo#110723]) +1 similar issue
> 
>   *
> 
>     igt@kms_big_joiner@basic:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@kms_big_joiner@basic.html>
>         ([i915#2705])
>   *
> 
>     igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl8/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html>
>         ([fdo#109271] / [i915#3886]) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk7/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         ([fdo#109271] / [i915#3886]) +3 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl7/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>         ([fdo#109271] / [i915#3886]) +9 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html>
>         ([fdo#109278] / [i915#3886]) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>         ([i915#3689] / [i915#3886]) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html>
>         ([fdo#111615] / [i915#3689]) +7 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-snb7/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html>
>         ([fdo#109271]) +217 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html>
>         ([i915#3689]) +14 similar issues
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb8/igt@kms_cdclk@plane-scaling.html>
>         ([i915#3742])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb3/igt@kms_cdclk@plane-scaling.html>
>         ([i915#3742])
> 
>   *
> 
>     igt@kms_chamelium@hdmi-crc-multiple:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-snb4/igt@kms_chamelium@hdmi-crc-multiple.html>
>         ([fdo#109271] / [fdo#111827]) +9 similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-crc-nonplanar-formats:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk2/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html>
>         ([fdo#109271] / [fdo#111827]) +8 similar issues
>   *
> 
>     igt@kms_color@pipe-c-deep-color:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb8/igt@kms_color@pipe-c-deep-color.html>
>         ([fdo#109278] / [i915#3555])
>   *
> 
>     igt@kms_color@pipe-d-ctm-0-75:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb6/igt@kms_color@pipe-d-ctm-0-75.html>
>         ([fdo#109278] / [i915#1149])
>   *
> 
>     igt@kms_color@pipe-d-deep-color:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb2/igt@kms_color@pipe-d-deep-color.html>
>         ([i915#3555]) +2 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-a-degamma:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html>
>         ([fdo#109271] / [fdo#111827]) +17 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-b-ctm-0-5:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl2/igt@kms_color_chamelium@pipe-b-ctm-0-5.html>
>         ([fdo#109271] / [fdo#111827]) +16 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb8/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html>
>         ([fdo#109284] / [fdo#111827]) +12 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>         ([fdo#109284] / [fdo#111827]) +20 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-d-gamma:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb8/igt@kms_color_chamelium@pipe-d-gamma.html>
>         ([fdo#109278] / [fdo#109284] / [fdo#111827])
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl3/igt@kms_content_protection@atomic.html>
>         ([i915#1319]) +1 similar issue
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb1/igt@kms_content_protection@dp-mst-type-1.html>
>         ([i915#3116] / [i915#3299])
>   *
> 
>     igt@kms_content_protection@lic:
> 
>       o
> 
>         shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl1/igt@kms_content_protection@lic.html>
>         ([i915#1319]) +1 similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb8/igt@kms_content_protection@lic.html>
>         ([fdo#109300] / [fdo#111066]) +1 similar issue
> 
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl7/igt@kms_content_protection@uevent.html>
>         ([i915#2105])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb6/igt@kms_content_protection@uevent.html>
>         ([i915#1063]) +1 similar issue
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl7/igt@kms_content_protection@uevent.html>
>         ([i915#2105])
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html>
>         ([i915#3319]) +3 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding.html>
>         ([i915#3359]) +10 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html>
>         ([fdo#109278] / [fdo#109279]) +3 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html>
>         ([fdo#109279] / [i915#3359]) +9 similar issues
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         ([fdo#109274] / [fdo#109278]) +3 similar issues
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         ([i915#4103])
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         ([i915#2346])
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html>
>         ([i915#3788])
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled.html>
>         ([i915#5287])
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html>
>         ([i915#5287]) +2 similar issues
>   *
> 
>     igt@kms_draw_crc@fill-fb:
> 
>       o
> 
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-iclb6/igt@kms_draw_crc@fill-fb.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb8/igt@kms_draw_crc@fill-fb.html>
>         ([i915#1888]) +1 similar issue
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6393/shard-glk4/igt@kms_draw_crc@fill-fb.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk1/igt@kms_draw_crc@fill-fb.html>
>         ([i915#1888] / [i915#5160])
> 
>   *
> 
>     igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html>
>         ([fdo#109274]) +5 similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         ([fdo#109274] / [fdo#111825]) +12 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>       o
> 
>         shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         ([i915#180]) +1 similar issue
> 
>       o
> 
>         shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         ([i915#180]) +1 similar issue
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-kbl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         ([i915#2828] / [i915#3614])
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         ([fdo#109280] / [fdo#111825]) +46 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         ([fdo#109280]) +28 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html>
>         ([fdo#109271]) +119 similar issues
>   *
> 
>     igt@kms_hdr@static-toggle:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb5/igt@kms_hdr@static-toggle.html>
>         ([i915#3555])
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#1839]) +1 similar issue
>   *
> 
>     igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-iclb2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html>
>         ([fdo#109289])
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-snb5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html>
>         ([fdo#109271] / [i915#5341])
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>         ([fdo#109271] / [i915#533]) +1 similar issue
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
>         ([fdo#109271] / [i915#533]) +2 similar issues
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html>
>         ([fdo#108145] / [i915#265])
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html>
>         ([fdo#108145] / [i915#265])
> 
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html>
>         ([fdo#108145] / [i915#265]) +1 similar issue
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>         ([i915#265])
>   *
> 
>     igt@kms_plane_lowres@pipe-a-tiling-none:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6829/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-none.html>
>         ([i915#3536]) +3 similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_68>
>         ([i915#3536]) +1 similar issue
> 
