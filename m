Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C4C10F745
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jul 2022 07:45:46 +0000 (UTC)
Message-ID: <60f15a2a-3332-eccd-fd3c-7a64394ca071@intel.com>
Date: Fri, 8 Jul 2022 08:45:43 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220707122336.391524-1-matthew.auld@intel.com>
 <165725578243.4505.13041995698609251088@emeril.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <165725578243.4505.13041995698609251088@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmV2ZXJ0?=
 =?utf-8?q?_=22lib/i915=3A_request_CPU=5FACCESS_for_fb_objects=22?=
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

On 08/07/2022 05:49, Patchwork wrote:
> *Patch Details*
> *Series:*	Revert "lib/i915: request CPU_ACCESS for fb objects"
> *URL:*	https://patchwork.freedesktop.org/series/106033/ 
> <https://patchwork.freedesktop.org/series/106033/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11857_full -> IGTPW_7480_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7480_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7480_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/index.html
> 
> 
>     Participating hosts (13 -> 10)
> 
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_7480_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html>
> 

Looks to be unrelated.

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@gem_exec_whisper@basic-contexts-priority:
> 
>       o {shard-rkl}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-2/igt@gem_exec_whisper@basic-contexts-priority.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-5/igt@gem_exec_whisper@basic-contexts-priority.html>
>   *
> 
>     igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:
> 
>       o {shard-dg1}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-dg1-15/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-dg1-16/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html>
>   *
> 
>     igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:
> 
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-dg1-13/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-dg1-16/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html>
>   *
> 
>     igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
> 
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-dg1-19/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html>
>         (i915#5287
>         <https://gitlab.freedesktop.org/drm/intel/issues/5287>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-dg1-16/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html>
>   *
> 
>     igt@kms_flip@flip-vs-rmfb@a-hdmi-a1:
> 
>       o {shard-dg1}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-dg1-15/igt@kms_flip@flip-vs-rmfb@a-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-dg1-16/igt@kms_flip@flip-vs-rmfb@a-hdmi-a1.html>
>         +4 similar issues
>   *
> 
>     igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1:
> 
>       o {shard-dg1}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-dg1-16/igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1.html>
>         +4 similar issues
>   *
> 
>     igt@kms_lease@lease_invalid_connector:
> 
>       o {shard-dg1}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-dg1-17/igt@kms_lease@lease_invalid_connector.html>
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-dg1-16/igt@kms_lease@lease_invalid_connector.html>
>   *
> 
>     igt@kms_plane_lowres@tiling-none:
> 
>       o {shard-dg1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-dg1-16/igt@kms_plane_lowres@tiling-none.html>
>         +2 similar issues
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7480_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_ctx_persistence@hostile:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-tglb3/igt@gem_ctx_persistence@hostile.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb2/igt@gem_ctx_persistence@hostile.html>
>         (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>)
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-queued:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-snb7/igt@gem_ctx_persistence@legacy-engines-queued.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>   *
> 
>     igt@gem_eio@in-flight-suspend:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl7/igt@gem_eio@in-flight-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl4/igt@gem_eio@in-flight-suspend.html>
>         (i915#3614 <https://gitlab.freedesktop.org/drm/intel/issues/3614>)
>   *
> 
>     igt@gem_exec_balancer@parallel-balancer:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb8/igt@gem_exec_balancer@parallel-balancer.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) +2
>         similar issues
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +3
>         similar issues
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@bcs0:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb2/igt@gem_exec_fair@basic-pace@bcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb5/igt@gem_exec_fair@basic-pace@bcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-glk7/igt@gem_exec_fair@basic-pace@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk5/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-tglb1/igt@gem_huc_copy@huc-copy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb7/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1
>         similar issue
> 
>   *
> 
>     igt@gem_lmem_swapping@smem-oom:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl3/igt@gem_lmem_swapping@smem-oom.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +2
>         similar issues
>   *
> 
>     igt@gen7_exec_parse@basic-rejected:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb6/igt@gen7_exec_parse@basic-rejected.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb7/igt@gen7_exec_parse@basic-rejected.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
> 
>   *
> 
>     igt@gen9_exec_parse@allowed-all:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-glk2/igt@gen9_exec_parse@allowed-all.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk2/igt@gen9_exec_parse@allowed-all.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>         i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>         +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@allowed-single:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl1/igt@gen9_exec_parse@allowed-single.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl4/igt@gen9_exec_parse@allowed-single.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>         i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-tglb3/igt@i915_selftest@live@hangcheck.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb5/igt@i915_selftest@live@hangcheck.html>
>         (i915#5591 <https://gitlab.freedesktop.org/drm/intel/issues/5591>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
> 
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +74
>         similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html>
>         (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>   *
> 
>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +2
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +6
>         similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>   *
> 
>     igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl7/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +47
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk8/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +50
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_chamelium@hdmi-audio-edid:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk1/igt@kms_chamelium@hdmi-audio-edid.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +5
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb5/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl1/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +4
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb5/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@kms_chamelium@vga-hpd:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl2/igt@kms_chamelium@vga-hpd.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +13
>         similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-a-gamma:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-snb4/igt@kms_color_chamelium@pipe-a-gamma.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +5
>         similar issues
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl7/igt@kms_content_protection@srm.html>
>         (i915#1319 <https://gitlab.freedesktop.org/drm/intel/issues/1319>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         (i915#2122
>         <https://gitlab.freedesktop.org/drm/intel/issues/2122>) +2
>         similar issues
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +1 similar issue
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate@a-dp1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html>
>         (i915#2122 <https://gitlab.freedesktop.org/drm/intel/issues/2122>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2
>         similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +2
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +2
>         similar issues
> 
>   *
> 
>     igt@kms_hdr@bpc-switch@pipe-a-dp-1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html>
>         (i915#1188 <https://gitlab.freedesktop.org/drm/intel/issues/1188>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +2
>         similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2
>         similar issues
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr@psr2_basic:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb2/igt@kms_psr@psr2_basic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb8/igt@kms_psr@psr2_basic.html>
>         (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-snb5/igt@kms_tv_load_detect@load-detect.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +121
>         similar issues
>   *
> 
>     igt@perf@polling-parameterized:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-glk1/igt@perf@polling-parameterized.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk1/igt@perf@polling-parameterized.html>
>         (i915#5639 <https://gitlab.freedesktop.org/drm/intel/issues/5639>)
>   *
> 
>     igt@prime_nv_test@i915_import_cpu_mmap:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb4/igt@prime_nv_test@i915_import_cpu_mmap.html>
>         (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb1/igt@prime_nv_test@i915_import_cpu_mmap.html>
>         (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
> 
>   *
> 
>     igt@sysfs_clients@fair-1:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl4/igt@sysfs_clients@fair-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>   *
> 
>     igt@sysfs_clients@recycle:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk7/igt@sysfs_clients@recycle.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@feature_discovery@psr2:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb3/igt@feature_discovery@psr2.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb2/igt@feature_discovery@psr2.html>
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@bcs0:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-apl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html>
>         +4 similar issues
>   *
> 
>     igt@gem_ctx_persistence@engines-hang@rcs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-dg1-12/igt@gem_ctx_persistence@engines-hang@rcs0.html>
>         (i915#4883
>         <https://gitlab.freedesktop.org/drm/intel/issues/4883>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-dg1-17/igt@gem_ctx_persistence@engines-hang@rcs0.html>
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-hang@blt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>         (i915#6252
>         <https://gitlab.freedesktop.org/drm/intel/issues/6252>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>   *
> 
>     igt@gem_exec_balancer@fairslice:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-5/igt@gem_exec_balancer@fairslice.html>
>         (i915#6259
>         <https://gitlab.freedesktop.org/drm/intel/issues/6259>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@gem_exec_balancer@fairslice.html>
>   *
> 
>     igt@gem_exec_balancer@parallel-contexts:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html>
>         +2 similar issues
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         +2 similar issues
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o
> 
>         {shard-tglu}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html>
> 
>       o
> 
>         shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         +1 similar issue
> 
>   *
> 
>     igt@gem_exec_fair@basic-none@vecs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk5/igt@gem_exec_fair@basic-pace@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs1:
> 
>       o shard-kbl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html>
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         (i915#2849
>         <https://gitlab.freedesktop.org/drm/intel/issues/2849>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html>
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-wc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc.html>
>         +1 similar issue
>   *
> 
>     igt@gem_tiled_pread_pwrite:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-2/igt@gem_tiled_pread_pwrite.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-5/igt@gem_tiled_pread_pwrite.html>
>   *
> 
>     igt@gen9_exec_parse@bb-chained:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-1/igt@gen9_exec_parse@bb-chained.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html>
>   *
> 
>     igt@i915_hangman@gt-engine-error@bcs0:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html>
>         (i915#6258
>         <https://gitlab.freedesktop.org/drm/intel/issues/6258>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-2/igt@i915_hangman@gt-engine-error@bcs0.html>
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-tglb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#3953
>         <https://gitlab.freedesktop.org/drm/intel/issues/3953>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html>
>   *
> 
>     igt@i915_pm_backlight@fade_with_dpms:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-1/igt@i915_pm_backlight@fade_with_dpms.html>
>         (i915#3012
>         <https://gitlab.freedesktop.org/drm/intel/issues/3012>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@i915_pm_backlight@fade_with_dpms.html>
>         +1 similar issue
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html>
>         (i915#4281
>         <https://gitlab.freedesktop.org/drm/intel/issues/4281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html>
>   *
> 
>     igt@i915_pm_rpm@debugfs-forcewake-user:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-apl7/igt@i915_pm_rpm@debugfs-forcewake-user.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl8/igt@i915_pm_rpm@debugfs-forcewake-user.html>
>         +1 similar issue
>   *
> 
>     igt@i915_pm_rpm@fences-dpms:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-5/igt@i915_pm_rpm@fences-dpms.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@i915_pm_rpm@fences-dpms.html>
>         +1 similar issue
>   *
> 
>     igt@i915_pm_rpm@modeset-lpsp-stress:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-5/igt@i915_pm_rpm@modeset-lpsp-stress.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html>
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>       o shard-glk: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-glk3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>
>         / i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
> 
>       o
> 
>         shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-apl7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
> 
>       o
> 
>         shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl1/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>         +2 similar issues
> 
>   *
> 
>     igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html>
>         (fdo#111314
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111314> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>
>         / i915#4369
>         <https://gitlab.freedesktop.org/drm/intel/issues/4369>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html>
>         +5 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html>
>         +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         +16 similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>         (i915#1188
>         <https://gitlab.freedesktop.org/drm/intel/issues/1188>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>         +1 similar issue
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-b-planes:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-2/igt@kms_plane@plane-position-covered@pipe-b-planes.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3558
>         <https://gitlab.freedesktop.org/drm/intel/issues/3558>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@kms_plane@plane-position-covered@pipe-b-planes.html>
>         +1 similar issue
>   *
> 
>     igt@kms_plane@plane-position-hole@pipe-b-planes:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.html>
>         (i915#3558
>         <https://gitlab.freedesktop.org/drm/intel/issues/3558>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html>
>         +1 similar issue
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>   *
> 
>     igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-glk3/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>
>         / i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2.html>
>   *
> 
>     igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-glk3/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-glk6/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html>
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>         +1 similar issue
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-dp-1:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-apl8/igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-dp-1.html>
>         (i915#5809
>         <https://gitlab.freedesktop.org/drm/intel/issues/5809>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-apl7/igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-dp-1.html>
>   *
> 
>     igt@kms_psr@psr2_suspend:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb5/igt@kms_psr@psr2_suspend.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb2/igt@kms_psr@psr2_suspend.html>
>         +1 similar issue
>   *
> 
>     igt@kms_psr@sprite_mmap_cpu:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-1/igt@kms_psr@sprite_mmap_cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@kms_psr@sprite_mmap_cpu.html>
>   *
> 
>     igt@kms_rmfb@rmfb-ioctl:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-2/igt@kms_rmfb@rmfb-ioctl.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@kms_rmfb@rmfb-ioctl.html>
>         +20 similar issues
>   *
> 
>     igt@kms_universal_plane@universal-plane-pipe-a-sanity:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-a-sanity.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-a-sanity.html>
>   *
> 
>     igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>         (i915#2436
>         <https://gitlab.freedesktop.org/drm/intel/issues/2436>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>   *
> 
>     igt@perf_pmu@semaphore-busy@vcs1:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-dg1-17/igt@perf_pmu@semaphore-busy@vcs1.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-dg1-16/igt@perf_pmu@semaphore-busy@vcs1.html>
>         +2 similar issues
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#6117 <https://gitlab.freedesktop.org/drm/intel/issues/6117>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         +1 similar issue
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) +1
>         similar issue
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#5939
>         <https://gitlab.freedesktop.org/drm/intel/issues/5939>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-iclb8/igt@kms_psr2_su@page_flip-p010.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>         / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@runner@aborted:
> 
>       o shard-kbl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/shard-kbl1/igt@runner@aborted.html>)
>         (i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>
>         / i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257>) -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/shard-kbl1/igt@runner@aborted.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002>
>         / i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>
>         / i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6561 -> IGTPW_7480
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_11857: de2555fd1402a79eb3c89db3f62944fec2026c8f @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7480: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7480/index.html
> IGT_6561: 4b673211d1645eaafa9da32eece4c274d8cd6c41 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
