Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA49F10E087
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 06:22:32 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51de841a727so5402553a12.3
 for <igt-dev@lists.freedesktop.org>; Mon, 03 Jul 2023 23:22:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------2r4L7eMZ5xzKIHgP3AyvC6Ns"
Message-ID: <705bac5e-02b9-6b1c-7e3c-fd557da725de@gmail.com>
Date: Tue, 4 Jul 2023 09:22:22 +0300
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org,
 Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
References: <20230703190052.14865-2-arthurgrillo@riseup.net>
 <168842292080.4274.10763821922160422531@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <168842292080.4274.10763821922160422531@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_Add_check_for_intel_device_on_use=5Fenginecopy?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------2r4L7eMZ5xzKIHgP3AyvC6Ns
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Those below listed regressions have nothing to do with this change. I'll 
push this patch to fix tests for other than Intel hw.

/Juha-Pekka

On 4.7.2023 1.22, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/igt_fb: Add check for intel device on use_enginecopy
> *URL:* 	https://patchwork.freedesktop.org/series/120144/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/index.html
>
>
>   CI Bug Log - changes from CI_DRM_13343_full -> IGTPW_9323_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_9323_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9323_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/index.html
>
>
>     Participating hosts (8 -> 8)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_9323_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_display_modes@extended-mode-basic.html>
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_display_modes@extended-mode-basic.html>
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-6/igt@kms_display_modes@extended-mode-basic.html>
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_13343_full and 
> IGTPW_9323_full:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_9323_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@blit-reloc-keep-cache:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-7/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         (i915#8411 <https://gitlab.freedesktop.org/drm/intel/issues/8411>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         (i915#8411 <https://gitlab.freedesktop.org/drm/intel/issues/8411>)
>
>  *
>
>     igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>         (i915#7742
>         <https://gitlab.freedesktop.org/drm/intel/issues/7742>) +1
>         similar issue
>  *
>
>     igt@drm_fdinfo@virtual-busy-idle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-7/igt@drm_fdinfo@virtual-busy-idle.html>
>         (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>)
>  *
>
>     igt@feature_discovery@chamelium:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-1/igt@feature_discovery@chamelium.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@feature_discovery@chamelium.html>
>         (i915#4854 <https://gitlab.freedesktop.org/drm/intel/issues/4854>)
>
>  *
>
>     igt@feature_discovery@psr1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@feature_discovery@psr1.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>  *
>
>     igt@gem_busy@semaphore:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@gem_busy@semaphore.html>
>         (i915#3936 <https://gitlab.freedesktop.org/drm/intel/issues/3936>)
>  *
>
>     igt@gem_create@hog-create@smem0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-1/igt@gem_create@hog-create@smem0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-6/igt@gem_create@hog-create@smem0.html>
>         (i915#5892
>         <https://gitlab.freedesktop.org/drm/intel/issues/5892> /
>         i915#8758 <https://gitlab.freedesktop.org/drm/intel/issues/8758>)
>  *
>
>     igt@gem_ctx_persistence@heartbeat-hostile:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hostile.html>
>         (i915#8555 <https://gitlab.freedesktop.org/drm/intel/issues/8555>)
>  *
>
>     igt@gem_eio@hibernate:
>
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-5/igt@gem_eio@hibernate.html>
>         (i915#7975
>         <https://gitlab.freedesktop.org/drm/intel/issues/7975> /
>         i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>  *
>
>     igt@gem_exec_balancer@bonded-true-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@gem_exec_balancer@bonded-true-hang.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/intel/issues/4812>) +1
>         similar issue
>  *
>
>     igt@gem_exec_balancer@full-late-pulse:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-12/igt@gem_exec_balancer@full-late-pulse.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-5/igt@gem_exec_balancer@full-late-pulse.html>
>         (i915#6032 <https://gitlab.freedesktop.org/drm/intel/issues/6032>)
>  *
>
>     igt@gem_exec_fair@basic-none@bcs0:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +3
>         similar issues
>  *
>
>     igt@gem_exec_fair@basic-none@rcs0:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-9/igt@gem_exec_fair@basic-none@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +5
>         similar issues
>  *
>
>     igt@gem_exec_fair@basic-pace-solo:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@gem_exec_fair@basic-pace-solo.html>
>         (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539>)
>  *
>
>     igt@gem_exec_fair@basic-pace@bcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-2/igt@gem_exec_fair@basic-pace@bcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@gem_exec_fair@basic-pace@bcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_fair@basic-pace@vecs0:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk6/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_flush@basic-wb-set-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@gem_exec_flush@basic-wb-set-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/intel/issues/3539> /
>         i915#4852
>         <https://gitlab.freedesktop.org/drm/intel/issues/4852>) +1
>         similar issue
>  *
>
>     igt@gem_exec_params@rsvd2-dirt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@gem_exec_params@rsvd2-dirt.html>
>         (fdo#109283
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109283> /
>         i915#5107 <https://gitlab.freedesktop.org/drm/intel/issues/5107>)
>  *
>
>     igt@gem_exec_reloc@basic-wc-gtt-active:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@gem_exec_reloc@basic-wc-gtt-active.html>
>         (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts-chain:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/intel/issues/4537> /
>         i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl2/igt@gem_lmem_swapping@parallel-random.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@smem-oom@lmem0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         (i915#4936
>         <https://gitlab.freedesktop.org/drm/intel/issues/4936> /
>         i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>)
>  *
>
>     igt@gem_mmap_gtt@big-copy-odd:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@gem_mmap_gtt@big-copy-odd.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +6
>         similar issues
>  *
>
>     igt@gem_mmap_gtt@coherency:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@gem_mmap_gtt@coherency.html>
>         (fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>)
>  *
>
>     igt@gem_mmap_wc@read:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@gem_mmap_wc@read.html>
>         (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>  *
>
>     igt@gem_pxp@create-regular-context-2:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-3/igt@gem_pxp@create-regular-context-2.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>  *
>
>     igt@gem_softpin@evict-snoop-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@gem_softpin@evict-snoop-interruptible.html>
>         (i915#4885 <https://gitlab.freedesktop.org/drm/intel/issues/4885>)
>  *
>
>     igt@gem_userptr_blits@coherency-unsync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@gem_userptr_blits@coherency-unsync.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>  *
>
>     igt@gen3_render_linear_blits:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-6/igt@gen3_render_linear_blits.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@gen3_render_linear_blits.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-8/igt@gen3_render_linear_blits.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>
>  *
>
>     igt@gen9_exec_parse@allowed-single:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-glk1/igt@gen9_exec_parse@allowed-single.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk4/igt@gen9_exec_parse@allowed-single.html>
>         (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566>)
>  *
>
>     igt@gen9_exec_parse@bb-oversize:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-7/igt@gen9_exec_parse@bb-oversize.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527> /
>         i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         similar issue
>  *
>
>     igt@i915_fb_tiling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-5/igt@i915_fb_tiling.html>
>         (i915#4881 <https://gitlab.freedesktop.org/drm/intel/issues/4881>)
>  *
>
>     igt@i915_hwmon@hwmon-read:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-4/igt@i915_hwmon@hwmon-read.html>
>         (i915#7707 <https://gitlab.freedesktop.org/drm/intel/issues/7707>)
>  *
>
>     igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>         (i915#7036 <https://gitlab.freedesktop.org/drm/intel/issues/7036>)
>  *
>
>     igt@i915_pm_dc@dc3co-vpb-simulation:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk9/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>  *
>
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>         (i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937>)
>  *
>
>     igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>  *
>
>     igt@i915_pm_rpm@dpms-non-lpsp:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-3/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>  *
>
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (fdo#111644
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111644> /
>         i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>  *
>
>     igt@i915_selftest@live@gem_contexts:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-1/igt@i915_selftest@live@gem_contexts.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@i915_selftest@live@gem_contexts.html>
>         (i915#7461 <https://gitlab.freedesktop.org/drm/intel/issues/7461>)
>  *
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html>
>         (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>  *
>
>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html>
>         (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>)
>  *
>
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-6/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +2
>         similar issues
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1
>         similar issue
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614> /
>         i915#3638 <https://gitlab.freedesktop.org/drm/intel/issues/3638>)
>
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +2
>         similar issues
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/intel/issues/4538> /
>         i915#5190
>         <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-2/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         (i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>
>  *
>
>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs.html>
>         (i915#3734
>         <https://gitlab.freedesktop.org/drm/intel/issues/3734> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>  *
>
>     igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +3
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +4
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_mc_ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_mc_ccs.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +19
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +105
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +6
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +4
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +7
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-c-dp-2:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_cdclk@plane-scaling@pipe-c-dp-2.html>
>         (i915#4087
>         <https://gitlab.freedesktop.org/drm/intel/issues/4087>) +7
>         similar issues
>  *
>
>     igt@kms_chamelium_color@ctm-limited-range:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_chamelium_color@ctm-limited-range.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-2/igt@kms_chamelium_color@degamma.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +3
>         similar issues
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +1
>         similar issue
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +3
>         similar issues
>
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@kms_color@deep-color.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>  *
>
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html>
>         (i915#8628 <https://gitlab.freedesktop.org/drm/intel/issues/8628>)
>  *
>
>     igt@kms_content_protection@atomic@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html>
>         (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>  *
>
>     igt@kms_content_protection@type1:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@kms_content_protection@type1.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/intel/issues/7118>) +2
>         similar issues
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_content_protection@type1.html>
>         (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-8/igt@kms_content_protection@type1.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/intel/issues/6944> /
>         i915#7116
>         <https://gitlab.freedesktop.org/drm/intel/issues/7116> /
>         i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +2
>         similar issues
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1
>         similar issue
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         (fdo#111767
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111767> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111767
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111767> /
>         i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/intel/issues/4103> /
>         i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html>
>         (i915#3804 <https://gitlab.freedesktop.org/drm/intel/issues/3804>)
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (fdo#103375
>         <https://bugs.freedesktop.org/show_bug.cgi?id=103375> /
>         i915#6121 <https://gitlab.freedesktop.org/drm/intel/issues/6121>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>)
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111767
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111767> /
>         i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>
>  *
>
>     igt@kms_flip@2x-flip-vs-fences:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@kms_flip@2x-flip-vs-fences.html>
>         (i915#8381 <https://gitlab.freedesktop.org/drm/intel/issues/8381>)
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +4
>         similar issues
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         (i915#2122 <https://gitlab.freedesktop.org/drm/intel/issues/2122>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>         i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +7
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk8/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +38
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>         (fdo#110189
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +2
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +4
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-rte:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +2
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +99
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +7
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +4
>         similar issues
>  *
>
>     igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1:
>
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1.html>
>         (i915#4573
>         <https://gitlab.freedesktop.org/drm/intel/issues/4573>) +1
>         similar issue
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
>         (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-2.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +3
>         similar issues
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-a-dp-4.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +3
>         similar issues
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-dp-2:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-dp-2.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +11
>         similar issues
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +3
>         similar issues
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-7/igt@kms_psr2_su@page_flip-nv12.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>  *
>
>     igt@kms_psr@psr2_primary_render:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_psr@psr2_primary_render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3
>         similar issues
>  *
>
>     igt@kms_psr@sprite_render:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@kms_psr@sprite_render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +1
>         similar issue
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (i915#4235
>         <https://gitlab.freedesktop.org/drm/intel/issues/4235> /
>         i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html>
>         (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>)
>  *
>
>     igt@kms_vblank@pipe-c-ts-continuation-suspend:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-tglu-7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html>
>         (i915#5122
>         <https://gitlab.freedesktop.org/drm/intel/issues/5122> /
>         i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>  *
>
>     igt@kms_vblank@pipe-c-wait-idle:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@kms_vblank@pipe-c-wait-idle.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>)
>  *
>
>     igt@kms_vblank@pipe-d-query-forked-busy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-6/igt@kms_vblank@pipe-d-query-forked-busy.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>
>         / i915#6768
>         <https://gitlab.freedesktop.org/drm/intel/issues/6768>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-9/igt@kms_vrr@flip-basic.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@kms_vrr@flipline.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +4
>         similar issues
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk4/igt@kms_writeback@writeback-fb-id.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>  *
>
>     igt@perf_pmu@rc6-all-gts:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@perf_pmu@rc6-all-gts.html>
>         (i915#8516 <https://gitlab.freedesktop.org/drm/intel/issues/8516>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html>
>         (i915#8516 <https://gitlab.freedesktop.org/drm/intel/issues/8516>)
>
>  *
>
>     igt@prime_vgem@basic-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-7/igt@prime_vgem@basic-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>)
>  *
>
>     igt@v3d/v3d_job_submission@array-job-submission:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-6/igt@v3d/v3d_job_submission@array-job-submission.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +2
>         similar issues
>  *
>
>     igt@v3d/v3d_perfmon@get-values-invalid-pad:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-7/igt@v3d/v3d_perfmon@get-values-invalid-pad.html>
>         (fdo#109315
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109315> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +1
>         similar issue
>  *
>
>     igt@v3d/v3d_submit_cl@valid-multisync-submission:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@v3d/v3d_submit_cl@valid-multisync-submission.html>
>         (fdo#109315
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +1
>         similar issue
>  *
>
>     igt@vc4/vc4_perfmon@destroy-valid-perfmon:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-3/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html>
>         (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>)
>  *
>
>     igt@vc4/vc4_tiling@set-bad-modifier:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@vc4/vc4_tiling@set-bad-modifier.html>
>         (i915#7711
>         <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +3
>         similar issues
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_barrier_race@remote-request@rcs0:
>
>       o shard-glk: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-glk2/igt@gem_barrier_race@remote-request@rcs0.html>
>         (i915#7461
>         <https://gitlab.freedesktop.org/drm/intel/issues/7461> /
>         i915#8211
>         <https://gitlab.freedesktop.org/drm/intel/issues/8211>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk2/igt@gem_barrier_race@remote-request@rcs0.html>
>  *
>
>     igt@gem_ctx_exec@basic-nohangcheck:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268
>         <https://gitlab.freedesktop.org/drm/intel/issues/6268>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg1-17/igt@gem_eio@unwedge-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg1-19/igt@gem_eio@unwedge-stress.html>
>  *
>
>     igt@gem_exec_capture@pi@rcs0:
>
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg1-15/igt@gem_exec_capture@pi@rcs0.html>
>         (i915#4475
>         <https://gitlab.freedesktop.org/drm/intel/issues/4475>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg1-15/igt@gem_exec_capture@pi@rcs0.html>
>  *
>
>     igt@gem_exec_fair@basic-pace@rcs0:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-2/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html>
>  *
>
>     igt@gem_exec_schedule@thriceslice@rcs0:
>
>       o shard-dg2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-5/igt@gem_exec_schedule@thriceslice@rcs0.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@gem_exec_schedule@thriceslice@rcs0.html>
>         +1 similar issue
>  *
>
>     igt@gem_exec_suspend@basic-s4-devices@lmem0:
>
>       o shard-dg2: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices@lmem0.html>
>         (i915#7975
>         <https://gitlab.freedesktop.org/drm/intel/issues/7975> /
>         i915#8213
>         <https://gitlab.freedesktop.org/drm/intel/issues/8213> /
>         i915#8682
>         <https://gitlab.freedesktop.org/drm/intel/issues/8682>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html>
>  *
>
>     igt@gem_ppgtt@blt-vs-render-ctx0:
>
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctx0.html>
>         (i915#8295
>         <https://gitlab.freedesktop.org/drm/intel/issues/8295>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-snb5/igt@gem_ppgtt@blt-vs-render-ctx0.html>
>  *
>
>     igt@gen9_exec_parse@allowed-single:
>
>       o shard-apl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-apl7/igt@gen9_exec_parse@allowed-single.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl4/igt@gen9_exec_parse@allowed-single.html>
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-dg2: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#6596
>         <https://gitlab.freedesktop.org/drm/intel/issues/6596> /
>         i915#7356
>         <https://gitlab.freedesktop.org/drm/intel/issues/7356>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html>
>  *
>
>     igt@i915_pm_dc@dc9-dpms:
>
>       o shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-apl3/igt@i915_pm_dc@dc9-dpms.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl1/igt@i915_pm_dc@dc9-dpms.html>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>
>       o shard-tglu: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>         (i915#3591
>         <https://gitlab.freedesktop.org/drm/intel/issues/3591>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>  *
>
>     igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         +2 similar issues
>  *
>
>     igt@i915_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>         +1 similar issue
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html>
>         (fdo#103375
>         <https://bugs.freedesktop.org/show_bug.cgi?id=103375> /
>         i915#6121
>         <https://gitlab.freedesktop.org/drm/intel/issues/6121>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html>
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-apl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
>
>       o shard-apl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>         i915#8408
>         <https://gitlab.freedesktop.org/drm/intel/issues/8408>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html>
>  *
>
>     igt@kms_sysfs_edid_timing:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-7/igt@kms_sysfs_edid_timing.html>
>         (IGT#2
>         <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_sysfs_edid_timing.html>
>  *
>
>     igt@perf@enable-disable@0-rcs0:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html>
>         (i915#8724
>         <https://gitlab.freedesktop.org/drm/intel/issues/8724>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@perf@enable-disable@0-rcs0.html>
>  *
>
>     igt@perf@stress-open-close@0-rcs0:
>
>       o shard-glk: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-glk6/igt@perf@stress-open-close@0-rcs0.html>
>         (i915#5213
>         <https://gitlab.freedesktop.org/drm/intel/issues/5213> /
>         i915#7941
>         <https://gitlab.freedesktop.org/drm/intel/issues/7941>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk2/igt@perf@stress-open-close@0-rcs0.html>
>
>
>         Warnings
>
>  *
>
>     igt@i915_pm_rps@reset:
>
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-snb1/igt@i915_pm_rps@reset.html>
>         (i915#7790
>         <https://gitlab.freedesktop.org/drm/intel/issues/7790>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-snb1/igt@i915_pm_rps@reset.html>
>         (i915#8319 <https://gitlab.freedesktop.org/drm/intel/issues/8319>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>
>       o shard-dg2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>         (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109285>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109285> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html>
>         (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4816
>         <https://gitlab.freedesktop.org/drm/intel/issues/4816>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7365 -> IGTPW_9323
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_13343: f113b6e13583b2068062c3de150051bc59f1cfac @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9323: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/index.html
> IGT_7365: c5980a82c798f9003dc7b4df07aace01b8afde77 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>

--------------2r4L7eMZ5xzKIHgP3AyvC6Ns
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Those below listed regressions have
      nothing to do with this change. I'll push this patch to fix tests
      for other than Intel hw.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">/Juha-Pekka<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 4.7.2023 1.22, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:168842292080.4274.10763821922160422531@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>lib/igt_fb: Add check for intel device on use_enginecopy</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/120144/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/120144/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_13343_full -&gt;
        IGTPW_9323_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_9323_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_9323_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/index.html</a></p>
      <h2>Participating hosts (8 -&gt; 8)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_9323_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_display_modes@extended-mode-basic.html"
                  moz-do-not-send="true">SKIP</a></p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_display_modes@extended-mode-basic.html"
                  moz-do-not-send="true">SKIP</a></p>
            </li>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-6/igt@kms_display_modes@extended-mode-basic.html"
                  moz-do-not-send="true">SKIP</a></p>
            </li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_13343_full and
        IGTPW_9323_full:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_9323_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-7/igt@api_intel_bb@blit-reloc-keep-cache.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/8411"
                  moz-do-not-send="true">i915#8411</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/8411"
                  moz-do-not-send="true">i915#8411</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7742"
                moz-do-not-send="true">i915#7742</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@virtual-busy-idle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-7/igt@drm_fdinfo@virtual-busy-idle.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8414"
                moz-do-not-send="true">i915#8414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@feature_discovery@chamelium:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-1/igt@feature_discovery@chamelium.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@feature_discovery@chamelium.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4854"
                  moz-do-not-send="true">i915#4854</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@feature_discovery@psr1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@feature_discovery@psr1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_busy@semaphore:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@gem_busy@semaphore.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3936"
                moz-do-not-send="true">i915#3936</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@hog-create@smem0:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-1/igt@gem_create@hog-create@smem0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-6/igt@gem_create@hog-create@smem0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5892"
                moz-do-not-send="true">i915#5892</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8758"
                moz-do-not-send="true">i915#8758</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hostile.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8555"
                moz-do-not-send="true">i915#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@hibernate:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-5/igt@gem_eio@hibernate.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7975"
                moz-do-not-send="true">i915#7975</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8213"
                moz-do-not-send="true">i915#8213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-true-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@gem_exec_balancer@bonded-true-hang.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                moz-do-not-send="true">i915#4812</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@full-late-pulse:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-12/igt@gem_exec_balancer@full-late-pulse.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-5/igt@gem_exec_balancer@full-late-pulse.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6032"
                moz-do-not-send="true">i915#6032</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@bcs0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@rcs0:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-9/igt@gem_exec_fair@basic-none@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-solo:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@gem_exec_fair@basic-pace-solo.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3539"
                moz-do-not-send="true">i915#3539</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@bcs0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-2/igt@gem_exec_fair@basic-pace@bcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@gem_exec_fair@basic-pace@bcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@vecs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk6/igt@gem_exec_fair@basic-pace@vecs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-set-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@gem_exec_flush@basic-wb-set-default.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3539"
                moz-do-not-send="true">i915#3539</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4852"
                moz-do-not-send="true">i915#4852</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@rsvd2-dirt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@gem_exec_params@rsvd2-dirt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109283"
                moz-do-not-send="true">fdo#109283</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5107"
                moz-do-not-send="true">i915#5107</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-wc-gtt-active:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@gem_exec_reloc@basic-wc-gtt-active.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4537"
                moz-do-not-send="true">i915#4537</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-random:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl2/igt@gem_lmem_swapping@parallel-random.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@gem_lmem_swapping@smem-oom@lmem0.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4936"
                moz-do-not-send="true">i915#4936</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5493"
                moz-do-not-send="true">i915#5493</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@big-copy-odd:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@gem_mmap_gtt@big-copy-odd.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@coherency:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@gem_mmap_gtt@coherency.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111656"
                moz-do-not-send="true">fdo#111656</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@read:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@gem_mmap_wc@read.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4083"
                moz-do-not-send="true">i915#4083</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-regular-context-2:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-3/igt@gem_pxp@create-regular-context-2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@evict-snoop-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@gem_softpin@evict-snoop-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4885"
                moz-do-not-send="true">i915#4885</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-unsync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@gem_userptr_blits@coherency-unsync.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen3_render_linear_blits:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-6/igt@gen3_render_linear_blits.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                  moz-do-not-send="true">fdo#109289</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@gen3_render_linear_blits.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                  moz-do-not-send="true">fdo#109289</a>)</p>
            </li>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-8/igt@gen3_render_linear_blits.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                  moz-do-not-send="true">fdo#109289</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-single:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-glk1/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk4/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5566"
                moz-do-not-send="true">i915#5566</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-oversize:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-7/igt@gen9_exec_parse@bb-oversize.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2527"
                moz-do-not-send="true">i915#2527</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2856"
                moz-do-not-send="true">i915#2856</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_fb_tiling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-5/igt@i915_fb_tiling.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4881"
                moz-do-not-send="true">i915#4881</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_hwmon@hwmon-read:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-4/igt@i915_hwmon@hwmon-read.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7707"
                moz-do-not-send="true">i915#7707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7036"
                moz-do-not-send="true">i915#7036</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk9/igt@i915_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1937"
                moz-do-not-send="true">i915#1937</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-3/igt@i915_pm_rpm@dpms-non-lpsp.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@i915_pm_rpm@dpms-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111644"
                moz-do-not-send="true">fdo#111644</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gem_contexts:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-1/igt@i915_selftest@live@gem_contexts.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@i915_selftest@live@gem_contexts.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7461"
                moz-do-not-send="true">i915#7461</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s3-without-i915:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=103375"
                moz-do-not-send="true">fdo#103375</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4212"
                moz-do-not-send="true">i915#4212</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5286"
                moz-do-not-send="true">i915#5286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-6/igt@kms_big_fb@linear-32bpp-rotate-270.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                  moz-do-not-send="true">fdo#111614</a>) +2 similar
                issues</p>
            </li>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_big_fb@linear-32bpp-rotate-270.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                  moz-do-not-send="true">fdo#111614</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                  moz-do-not-send="true">fdo#111614</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3638"
                  moz-do-not-send="true">i915#3638</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5190"
                moz-do-not-send="true">i915#5190</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4538"
                moz-do-not-send="true">i915#4538</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5190"
                moz-do-not-send="true">i915#5190</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-2/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                  moz-do-not-send="true">i915#3689</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                  moz-do-not-send="true">i915#3886</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                  moz-do-not-send="true">i915#5354</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                  moz-do-not-send="true">i915#6095</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                  moz-do-not-send="true">i915#3886</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                  moz-do-not-send="true">i915#5354</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                  moz-do-not-send="true">i915#6095</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3734"
                moz-do-not-send="true">i915#3734</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_mc_ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +19 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +105 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-c-dp-2:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_cdclk@plane-scaling@pipe-c-dp-2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4087"
                moz-do-not-send="true">i915#4087</a>) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-limited-range:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_chamelium_color@ctm-limited-range.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@degamma:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-2/igt@kms_chamelium_color@degamma.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                  moz-do-not-send="true">i915#7828</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                  moz-do-not-send="true">i915#7828</a>) +3 similar
                issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@kms_color@deep-color.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8628"
                moz-do-not-send="true">i915#8628</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7173"
                moz-do-not-send="true">i915#7173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@kms_content_protection@type1.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7118"
                  moz-do-not-send="true">i915#7118</a>) +2 similar
                issues</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_content_protection@type1.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7118"
                  moz-do-not-send="true">i915#7118</a>)</p>
            </li>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-8/igt@kms_content_protection@type1.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/6944"
                  moz-do-not-send="true">i915#6944</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7116"
                  moz-do-not-send="true">i915#7116</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/7118"
                  moz-do-not-send="true">i915#7118</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111767"
                  moz-do-not-send="true">fdo#111767</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                  moz-do-not-send="true">fdo#111825</a>)</p>
            </li>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                  moz-do-not-send="true">fdo#109274</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111767"
                  moz-do-not-send="true">fdo#111767</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                  moz-do-not-send="true">i915#5354</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4103"
                moz-do-not-send="true">i915#4103</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4213"
                moz-do-not-send="true">i915#4213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2346"
                moz-do-not-send="true">i915#2346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3804"
                moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=103375"
                moz-do-not-send="true">fdo#103375</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6121"
                moz-do-not-send="true">i915#6121</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                  moz-do-not-send="true">fdo#109274</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111767"
                  moz-do-not-send="true">fdo#111767</a>)</p>
            </li>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                  moz-do-not-send="true">fdo#109274</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111767"
                  moz-do-not-send="true">fdo#111767</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3637"
                  moz-do-not-send="true">i915#3637</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@kms_flip@2x-flip-vs-fences.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8381"
                moz-do-not-send="true">i915#8381</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_flip@2x-plain-flip-fb-recreate.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2122"
                moz-do-not-send="true">i915#2122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2587"
                moz-do-not-send="true">i915#2587</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-5/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109285"
                moz-do-not-send="true">fdo#109285</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk8/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +38 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=110189"
                moz-do-not-send="true">fdo#110189</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8708"
                moz-do-not-send="true">i915#8708</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3023"
                moz-do-not-send="true">i915#3023</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +99 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109280"
                moz-do-not-send="true">fdo#109280</a>) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3458"
                moz-do-not-send="true">i915#3458</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4573"
                moz-do-not-send="true">i915#4573</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8292"
                moz-do-not-send="true">i915#8292</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5176"
                moz-do-not-send="true">i915#5176</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-a-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5176"
                moz-do-not-send="true">i915#5176</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-dp-2:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-dp-2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +11 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                  moz-do-not-send="true">i915#658</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                  moz-do-not-send="true">fdo#111068</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                  moz-do-not-send="true">i915#658</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-7/igt@kms_psr2_su@page_flip-nv12.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109642"
                moz-do-not-send="true">fdo#109642</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                moz-do-not-send="true">fdo#111068</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_render:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_psr@psr2_primary_render.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@sprite_render:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@kms_psr@sprite_render.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4235"
                moz-do-not-send="true">i915#4235</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5190"
                moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4235"
                moz-do-not-send="true">i915#4235</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-tglu-7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5122"
                moz-do-not-send="true">i915#5122</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8213"
                moz-do-not-send="true">i915#8213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-c-wait-idle:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@kms_vblank@pipe-c-wait-idle.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4070"
                moz-do-not-send="true">i915#4070</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6768"
                moz-do-not-send="true">i915#6768</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-d-query-forked-busy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-6/igt@kms_vblank@pipe-d-query-forked-busy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4070"
                moz-do-not-send="true">i915#4070</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/533"
                moz-do-not-send="true">i915#533</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6768"
                moz-do-not-send="true">i915#6768</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-9/igt@kms_vrr@flip-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-10/igt@kms_vrr@flipline.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk4/igt@kms_writeback@writeback-fb-id.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2437"
                moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6-all-gts:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@perf_pmu@rc6-all-gts.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/8516"
                  moz-do-not-send="true">i915#8516</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/8516"
                  moz-do-not-send="true">i915#8516</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-7/igt@prime_vgem@basic-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                moz-do-not-send="true">i915#3708</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_job_submission@array-job-submission:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-6/igt@v3d/v3d_job_submission@array-job-submission.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_perfmon@get-values-invalid-pad:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-7/igt@v3d/v3d_perfmon@get-values-invalid-pad.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109315"
                moz-do-not-send="true">fdo#109315</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_cl@valid-multisync-submission:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@v3d/v3d_submit_cl@valid-multisync-submission.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109315"
                moz-do-not-send="true">fdo#109315</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_perfmon@destroy-valid-perfmon:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-3/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_tiling@set-bad-modifier:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@vc4/vc4_tiling@set-bad-modifier.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7711"
                moz-do-not-send="true">i915#7711</a>) +3 similar issues</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@gem_barrier_race@remote-request@rcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-glk2/igt@gem_barrier_race@remote-request@rcs0.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7461"
                moz-do-not-send="true">i915#7461</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8211"
                moz-do-not-send="true">i915#8211</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk2/igt@gem_barrier_race@remote-request@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@basic-nohangcheck:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6268"
                moz-do-not-send="true">i915#6268</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg1-17/igt@gem_eio@unwedge-stress.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5784"
                moz-do-not-send="true">i915#5784</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg1-19/igt@gem_eio@unwedge-stress.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@pi@rcs0:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg1-15/igt@gem_exec_capture@pi@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4475"
                moz-do-not-send="true">i915#4475</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg1-15/igt@gem_exec_capture@pi@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@rcs0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-2/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@thriceslice@rcs0:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-5/igt@gem_exec_schedule@thriceslice@rcs0.html"
                moz-do-not-send="true">TIMEOUT</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@gem_exec_schedule@thriceslice@rcs0.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices@lmem0.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7975"
                moz-do-not-send="true">i915#7975</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8213"
                moz-do-not-send="true">i915#8213</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8682"
                moz-do-not-send="true">i915#8682</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctx0.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8295"
                moz-do-not-send="true">i915#8295</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-snb5/igt@gem_ppgtt@blt-vs-render-ctx0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-single:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-apl7/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5566"
                moz-do-not-send="true">i915#5566</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl4/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6596"
                moz-do-not-send="true">i915#6596</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7356"
                moz-do-not-send="true">i915#7356</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-apl3/igt@i915_pm_dc@dc9-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl1/igt@i915_pm_dc@dc9-dpms.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2681"
                moz-do-not-send="true">i915#2681</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3591"
                moz-do-not-send="true">i915#3591</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=103375"
                moz-do-not-send="true">fdo#103375</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6121"
                moz-do-not-send="true">i915#6121</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8408"
                moz-do-not-send="true">i915#8408</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sysfs_edid_timing:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-7/igt@kms_sysfs_edid_timing.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2"
                moz-do-not-send="true">IGT#2</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_sysfs_edid_timing.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf@enable-disable@0-rcs0:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8724"
                moz-do-not-send="true">i915#8724</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@perf@enable-disable@0-rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf@stress-open-close@0-rcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-glk6/igt@perf@stress-open-close@0-rcs0.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5213"
                moz-do-not-send="true">i915#5213</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7941"
                moz-do-not-send="true">i915#7941</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-glk2/igt@perf@stress-open-close@0-rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@i915_pm_rps@reset:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-snb1/igt@i915_pm_rps@reset.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7790"
                moz-do-not-send="true">i915#7790</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-snb1/igt@i915_pm_rps@reset.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8319"
                moz-do-not-send="true">i915#8319</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html"
                moz-do-not-send="true">TIMEOUT</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                moz-do-not-send="true">i915#7828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109285"
                moz-do-not-send="true">fdo#109285</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109285"
                moz-do-not-send="true">fdo#109285</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">TIMEOUT</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-dg2-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13343/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4070"
                moz-do-not-send="true">i915#4070</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4816"
                moz-do-not-send="true">i915#4816</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4816"
                moz-do-not-send="true">i915#4816</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7365 -&gt; IGTPW_9323</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_13343: f113b6e13583b2068062c3de150051bc59f1cfac @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_9323:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9323/index.html</a><br>
        IGT_7365: c5980a82c798f9003dc7b4df07aace01b8afde77 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------2r4L7eMZ5xzKIHgP3AyvC6Ns--
