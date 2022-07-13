Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080D514A34D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 07:30:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------T03byQuUk6joGXXG00mipbu2"
Message-ID: <783a3df6-ef30-2531-0d44-382dd13a3349@intel.com>
Date: Wed, 13 Jul 2022 09:30:12 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20220712071722.212920-1-andrzej.hajda@intel.com>
 <165764117435.12862.16687108548769880298@emeril.freedesktop.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <165764117435.12862.16687108548769880298@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fpersistence=3A_adjust_hostile_test_timeout?=
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

This is a multi-part message in MIME format.
--------------T03byQuUk6joGXXG00mipbu2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12.07.2022 17:52, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	i915/gem_ctx_persistence: adjust hostile test timeout
> *URL:* 	https://patchwork.freedesktop.org/series/106237/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/index.html
>
>
>   CI Bug Log - changes from CI_DRM_11876_full -> IGTPW_7499_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7499_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7499_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/index.html
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
> IGTPW_7499_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@drm_buddy@all:
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb3/igt@drm_buddy@all.html>
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o {shard-dg1}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html>
>  *
>
>     igt@drm_mm@all:
>
>      o
>
>         {shard-rkl}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-4/igt@drm_mm@all.html>
>
>      o
>
>         {shard-dg1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-19/igt@drm_mm@all.html>
>         +1 similar issue
>
>      o
>
>         {shard-tglu}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglu-5/igt@drm_mm@all.html>
>         +2 similar issues
>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>
>       o {shard-rkl}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>

Nothing related.

Regards
Andrzej

>  *
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_11876_full and 
> IGTPW_7499_full:
>
>
>       New IGT tests (65)
>
>  *
>
>     igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.33] s
>  *
>
>     igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>  *
>
>     igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.16] s
>  *
>
>     igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.16] s
>  *
>
>     igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.65] s
>  *
>
>     igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.43] s
>  *
>
>     igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.41] s
>  *
>
>     igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.43] s
>  *
>
>     igt@kms_color@gamma@pipe-a-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.55] s
>  *
>
>     igt@kms_color@gamma@pipe-b-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.38] s
>  *
>
>     igt@kms_color@gamma@pipe-c-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.40] s
>  *
>
>     igt@kms_color@gamma@pipe-d-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.39] s
>  *
>
>     igt@kms_concurrent@pipe-b@hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.28] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-128x128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.20] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-256x256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.22] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-64x64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.28] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-128x128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-256x256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.20] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-64x64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.20] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-128x128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-256x256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-64x64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-128x128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-256x256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-64x64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.19] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-128x128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-256x256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.22] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-64x64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.28] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-128x128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-256x256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.19] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-64x64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-128x128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-256x256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-64x64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.20] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-128x128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.20] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-256x256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.20] s
>  *
>
>     igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-64x64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.19] s
>  *
>
>     igt@kms_flip@absolute-wf_vblank@a-hdmi-a4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [7.86] s
>  *
>
>     igt@kms_flip@absolute-wf_vblank@b-hdmi-a4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [7.80] s
>  *
>
>     igt@kms_flip@absolute-wf_vblank@c-hdmi-a4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [7.84] s
>  *
>
>     igt@kms_flip@absolute-wf_vblank@d-hdmi-a4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [7.80] s
>  *
>
>     igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.65] s
>  *
>
>     igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.65] s
>  *
>
>     igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.64] s
>  *
>
>     igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.61] s
>  *
>
>     igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-a:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.15] s
>  *
>
>     igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-b:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.02] s
>  *
>
>     igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-c:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.02] s
>  *
>
>     igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-d:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.02] s
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-a-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.57] s
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-b-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.45] s
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-c-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.49] s
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-d-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.44] s
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling@pipe-a-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.50] s
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling@pipe-b-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.42] s
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling@pipe-c-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.47] s
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling@pipe-d-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.44] s
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling@pipe-a-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [19.72] s
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling@pipe-b-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [19.87] s
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling@pipe-c-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling@pipe-d-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.26] s
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.20] s
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.20] s
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.20] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_7499_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@gem_ccs@ctrl-surf-copy:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@gem_ccs@ctrl-surf-copy.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>)
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#5327 <https://gitlab.freedesktop.org/drm/intel/issues/5327>)
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>)
>
>  *
>
>     igt@gem_create@create-massive:
>
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl4/igt@gem_create@create-massive.html>
>         (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>  *
>
>     igt@gem_ctx_isolation@preservation-s3@vcs0:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) +3
>         similar issues
>  *
>
>     igt@gem_ctx_persistence@hostile:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-snb5/igt@gem_ctx_persistence@hostile.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099
>         <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +1
>         similar issue
>  *
>
>     igt@gem_eio@in-flight-contexts-immediate:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl8/igt@gem_eio@in-flight-contexts-immediate.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl4/igt@gem_eio@in-flight-contexts-immediate.html>
>         (i915#3063 <https://gitlab.freedesktop.org/drm/intel/issues/3063>)
>  *
>
>     igt@gem_exec_capture@capture-recoverable:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gem_exec_capture@capture-recoverable.html>
>         (i915#6344 <https://gitlab.freedesktop.org/drm/intel/issues/6344>)
>  *
>
>     igt@gem_exec_fair@basic-none-share@rcs0:
>
>      o
>
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>
>      o
>
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>
>  *
>
>     igt@gem_exec_fair@basic-none-solo@rcs0:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_fair@basic-none@vcs1:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
>         similar issue
>  *
>
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
>
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_params@secure-non-root:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@gem_exec_params@secure-non-root.html>
>         (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@gem_exec_params@secure-non-root.html>
>         (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl4/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>
>      o
>
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb1/igt@gem_huc_copy@huc-copy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +85
>         similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html>
>         (i915#768
>         <https://gitlab.freedesktop.org/drm/intel/issues/768>) +2
>         similar issues
>
>  *
>
>     igt@gem_softpin@evict-single-offset:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl4/igt@gem_softpin@evict-single-offset.html>
>         (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>  *
>
>     igt@gem_spin_batch@legacy@default:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl1/igt@gem_spin_batch@legacy@default.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl2/igt@gem_spin_batch@legacy@default.html>
>         (i915#2898 <https://gitlab.freedesktop.org/drm/intel/issues/2898>)
>  *
>
>     igt@gem_userptr_blits@coherency-sync:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb3/igt@gem_userptr_blits@coherency-sync.html>
>         (fdo#109290 <https://bugs.freedesktop.org/show_bug.cgi?id=109290>)
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@gem_userptr_blits@coherency-sync.html>
>         (fdo#110542 <https://bugs.freedesktop.org/show_bug.cgi?id=110542>)
>
>  *
>
>     igt@gem_userptr_blits@readonly-unsync:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@gem_userptr_blits@readonly-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +1
>         similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@gem_userptr_blits@readonly-unsync.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>
>  *
>
>     igt@gem_userptr_blits@vma-merge:
>
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl4/igt@gem_userptr_blits@vma-merge.html>
>         (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>)
>  *
>
>     igt@gen3_render_linear_blits:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@gen3_render_linear_blits.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +3
>         similar issues
>  *
>
>     igt@gen7_exec_parse@chained-batch:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gen7_exec_parse@chained-batch.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +6
>         similar issues
>  *
>
>     igt@gen9_exec_parse@allowed-single:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl7/igt@gen9_exec_parse@allowed-single.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@gen9_exec_parse@allowed-single.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>         i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>  *
>
>     igt@gen9_exec_parse@basic-rejected-ctx-param:
>
>      o
>
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-snb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +148
>         similar issues
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527> /
>         i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>
>  *
>
>     igt@i915_pm_dc@dc3co-vpb-simulation:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl2/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>         similar issue
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>
>       o shard-tglb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681>) +3
>         similar issues
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>
>       o shard-kbl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>         (i915#6405 <https://gitlab.freedesktop.org/drm/intel/issues/6405>)
>  *
>
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (fdo#110892 <https://bugs.freedesktop.org/show_bug.cgi?id=110892>)
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (fdo#111644
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111644> /
>         i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397> /
>         i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
>
>  *
>
>     igt@i915_query@query-topology-known-pci-ids:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html>
>         (fdo#109303 <https://bugs.freedesktop.org/show_bug.cgi?id=109303>)
>  *
>
>     igt@kms_atomic@atomic_plane_damage:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_atomic@atomic_plane_damage.html>
>         (i915#4765 <https://gitlab.freedesktop.org/drm/intel/issues/4765>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-90:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb5/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>         (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>  *
>
>     igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +5
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk5/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>
>  *
>
>     igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb3/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +14
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb3/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +5
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb5/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +3
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +150
>         similar issues
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +4
>         similar issues
>
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@kms_cdclk@mode-transition.html>
>         (i915#3742 <https://gitlab.freedesktop.org/drm/intel/issues/3742>)
>  *
>
>     igt@kms_chamelium@hdmi-edid-change-during-suspend:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-snb5/igt@kms_chamelium@hdmi-edid-change-during-suspend.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +6
>         similar issues
>  *
>
>     igt@kms_chamelium@hdmi-hpd-storm:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl8/igt@kms_chamelium@hdmi-hpd-storm.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +13
>         similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-b-ctm-max:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-max.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk9/igt@kms_color_chamelium@pipe-b-ctm-max.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +6
>         similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-max.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +6
>         similar issues
>
>  *
>
>     igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +17
>         similar issues
>  *
>
>     igt@kms_content_protection@content_type_change:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_content_protection@content_type_change.html>
>         (i915#1063 <https://gitlab.freedesktop.org/drm/intel/issues/1063>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb7/igt@kms_content_protection@content_type_change.html>
>         (fdo#109300
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109300> /
>         fdo#111066 <https://bugs.freedesktop.org/show_bug.cgi?id=111066>)
>
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl4/igt@kms_content_protection@uevent.html>
>         (i915#2105 <https://gitlab.freedesktop.org/drm/intel/issues/2105>)
>  *
>
>     igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +5
>         similar issues
>  *
>
>     igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32.html>
>         (i915#4462
>         <https://gitlab.freedesktop.org/drm/intel/issues/4462>) +7
>         similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32.html>
>         (i915#4462
>         <https://gitlab.freedesktop.org/drm/intel/issues/4462>) +5
>         similar issues
>
>  *
>
>     igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +7
>         similar issues
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>  *
>
>     igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html>
>         (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html>
>         (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
>
>  *
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#3637
>         <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +6
>         similar issues
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +5
>         similar issues
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-dp1:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>  *
>
>     igt@kms_flip@flip-vs-suspend@a-dp1:
>
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) +3
>         similar issues
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +5
>         similar issues
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html>
>         (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888> /
>         i915#2546 <https://gitlab.freedesktop.org/drm/intel/issues/2546>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +17
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +12
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +176
>         similar issues
>  *
>
>     igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>         (i915#1188
>         <https://gitlab.freedesktop.org/drm/intel/issues/1188>) +1
>         similar issue
>  *
>
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         (i915#1188 <https://gitlab.freedesktop.org/drm/intel/issues/1188>)
>  *
>
>     igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html>
>         (i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>  *
>
>     igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
>
>      o
>
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> /
>         i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>
>      o
>
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> /
>         i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>
>      o
>
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> /
>         i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>
>  *
>
>     igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +2
>         similar issues
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +2
>         similar issues
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +8
>         similar issues
>  *
>
>     igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +7
>         similar issues
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +3
>         similar issues
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2
>         similar issues
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk7/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb3/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>         similar issue
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (i915#1911 <https://gitlab.freedesktop.org/drm/intel/issues/1911>)
>
>  *
>
>     igt@kms_psr@psr2_cursor_mmap_gtt:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +2
>         similar issues
>  *
>
>     igt@kms_psr@psr2_primary_render:
>
>      o
>
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@kms_psr@psr2_primary_render.html>
>         (i915#132
>         <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>         i915#3467
>         <https://gitlab.freedesktop.org/drm/intel/issues/3467>) +1
>         similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb5/igt@kms_psr@psr2_primary_render.html>
>         (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>         (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>         (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl1/igt@kms_writeback@writeback-pixel-formats.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>  *
>
>     igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html>
>         (i915#2530
>         <https://gitlab.freedesktop.org/drm/intel/issues/2530>) +1
>         similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb4/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html>
>         (i915#2530
>         <https://gitlab.freedesktop.org/drm/intel/issues/2530>) +1
>         similar issue
>
>  *
>
>     igt@prime_nv_api@i915_self_import_to_different_fd:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@prime_nv_api@i915_self_import_to_different_fd.html>
>         (fdo#109291
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109291>) +1
>         similar issue
>  *
>
>     igt@prime_nv_pcopy@test1_macro:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@prime_nv_pcopy@test1_macro.html>
>         (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>  *
>
>     igt@sysfs_clients@fair-1:
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@sysfs_clients@fair-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk6/igt@sysfs_clients@fair-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb4/igt@sysfs_clients@fair-1.html>
>         (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
>  *
>
>     igt@sysfs_clients@pidname:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@sysfs_clients@pidname.html>
>         (i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
>  *
>
>     igt@sysfs_clients@sema-50:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@sysfs_clients@sema-50.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
>
>
>         Possible fixes
>
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-snb7/igt@device_reset@unbind-reset-rebind.html>
>         (i915#4528
>         <https://gitlab.freedesktop.org/drm/intel/issues/4528>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-snb2/igt@device_reset@unbind-reset-rebind.html>
>  *
>
>     igt@fbdev@nullptr:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@fbdev@nullptr.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-2/igt@fbdev@nullptr.html>
>  *
>
>     igt@gem_ctx_exec@basic-nohangcheck:
>
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268
>         <https://gitlab.freedesktop.org/drm/intel/issues/6268>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html>
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-hang@bsd2:
>
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-16/igt@gem_ctx_persistence@legacy-engines-hang@bsd2.html>
>         (i915#4883
>         <https://gitlab.freedesktop.org/drm/intel/issues/4883>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-13/igt@gem_ctx_persistence@legacy-engines-hang@bsd2.html>
>  *
>
>     igt@gem_eio@kms:
>
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb5/igt@gem_eio@kms.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gem_eio@kms.html>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>      o
>
>         shard-iclb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb5/igt@gem_eio@unwedge-stress.html>
>         (i915#3070
>         <https://gitlab.freedesktop.org/drm/intel/issues/3070>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@gem_eio@unwedge-stress.html>
>
>      o
>
>         {shard-rkl}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-1/igt@gem_eio@unwedge-stress.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-2/igt@gem_eio@unwedge-stress.html>
>
>      o
>
>         {shard-tglu}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglu-2/igt@gem_eio@unwedge-stress.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglu-2/igt@gem_eio@unwedge-stress.html>
>
>  *
>
>     igt@gem_exec_balancer@parallel-contexts:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html>
>         +1 similar issue
>  *
>
>     igt@gem_exec_fair@basic-flow@rcs0:
>
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-6/igt@gem_exec_fair@basic-flow@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-2/igt@gem_exec_fair@basic-flow@rcs0.html>
>  *
>
>     igt@gem_exec_fair@basic-none-share@rcs0:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>  *
>
>     igt@gem_exec_fair@basic-pace@rcs0:
>
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html>
>         +2 similar issues
>  *
>
>     igt@gem_exec_reloc@basic-write-read:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html>
>         +4 similar issues
>  *
>
>     igt@gem_lmem_swapping@smem-oom@lmem0:
>
>       o {shard-dg1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         (i915#4936
>         <https://gitlab.freedesktop.org/drm/intel/issues/4936>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>  *
>
>     igt@gem_tiled_partial_pwrite_pread@reads:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-1/igt@gem_tiled_partial_pwrite_pread@reads.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread@reads.html>
>         +4 similar issues
>  *
>
>     igt@gen9_exec_parse@bb-start-param:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html>
>         +1 similar issue
>  *
>
>     igt@i915_pm_backlight@fade_with_dpms:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-1/igt@i915_pm_backlight@fade_with_dpms.html>
>         (i915#3012
>         <https://gitlab.freedesktop.org/drm/intel/issues/3012>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@i915_pm_backlight@fade_with_dpms.html>
>  *
>
>     igt@i915_pm_dc@dc6-dpms:
>
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html>
>         (i915#454
>         <https://gitlab.freedesktop.org/drm/intel/issues/454>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html>
>         +1 similar issue
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>
>       o shard-apl: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>         (i915#6405
>         <https://gitlab.freedesktop.org/drm/intel/issues/6405>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>  *
>
>     igt@i915_pm_sseu@full-enable:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-6/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387
>         <https://gitlab.freedesktop.org/drm/intel/issues/4387>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-5/igt@i915_pm_sseu@full-enable.html>
>  *
>
>     igt@i915_selftest@live@hangcheck:
>
>       o {shard-dg1}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-13/igt@i915_selftest@live@hangcheck.html>
>         (i915#4494
>         <https://gitlab.freedesktop.org/drm/intel/issues/4494> /
>         i915#4957
>         <https://gitlab.freedesktop.org/drm/intel/issues/4957>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-15/igt@i915_selftest@live@hangcheck.html>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
>
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html>
>         (i915#2521
>         <https://gitlab.freedesktop.org/drm/intel/issues/2521>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html>
>         (i915#2521
>         <https://gitlab.freedesktop.org/drm/intel/issues/2521>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html>
>  *
>
>     igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs:
>
>       o shard-tglb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb3/igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs.html>
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-180:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-180.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-180.html>
>         +4 similar issues
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888> /
>         i915#5138
>         <https://gitlab.freedesktop.org/drm/intel/issues/5138>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html>
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
>
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>         +2 similar issues
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html>
>         (i915#2122
>         <https://gitlab.freedesktop.org/drm/intel/issues/2122>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-badstride:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-badstride.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-badstride.html>
>         +4 similar issues
>  *
>
>     igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3558
>         <https://gitlab.freedesktop.org/drm/intel/issues/3558>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html>
>         +1 similar issue
>  *
>
>     igt@kms_plane_multiple@atomic-pipe-a-tiling-none:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3558
>         <https://gitlab.freedesktop.org/drm/intel/issues/3558> /
>         i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html>
>  *
>
>     igt@kms_psr@dpms:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_psr@dpms.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@kms_psr@dpms.html>
>         +1 similar issue
>  *
>
>     igt@kms_psr@psr2_cursor_plane_move:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html>
>         +1 similar issue
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5519
>         <https://gitlab.freedesktop.org/drm/intel/issues/5519>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>  *
>
>     igt@kms_vblank@pipe-b-ts-continuation-suspend:
>
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         +3 similar issues
>  *
>
>     igt@perf_pmu@busy-idle@vcs0:
>
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-12/igt@perf_pmu@busy-idle@vcs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-15/igt@perf_pmu@busy-idle@vcs0.html>
>         +2 similar issues
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-19/igt@perf_pmu@module-unload.html>
>         (i915#6054
>         <https://gitlab.freedesktop.org/drm/intel/issues/6054>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-17/igt@perf_pmu@module-unload.html>
>
>
>         Warnings
>
>  *
>
>     igt@i915_pm_dc@dc9-dpms:
>
>       o shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl7/igt@i915_pm_dc@dc9-dpms.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl6/igt@i915_pm_dc@dc9-dpms.html>
>         (i915#4275 <https://gitlab.freedesktop.org/drm/intel/issues/4275>)
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#4767
>         <https://gitlab.freedesktop.org/drm/intel/issues/4767>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#4939 <https://gitlab.freedesktop.org/drm/intel/issues/4939>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>  *
>
>     igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>  *
>
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>  *
>
>     igt@runner@aborted:
>
>       o shard-apl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl8/igt@runner@aborted.html>)
>         (i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257>) ->
>         (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl4/igt@runner@aborted.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6578 -> IGTPW_7499
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_11876: 2305e0d006655ed3797e530403df777699c67ec8 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7499: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/index.html
> IGT_6578: 7d289d89131ec37c1145bcdb86149914587d7406 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>

--------------T03byQuUk6joGXXG00mipbu2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 12.07.2022 17:52, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:165764117435.12862.16687108548769880298@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>i915/gem_ctx_persistence: adjust hostile test timeout</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/106237/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/106237/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_11876_full -&gt;
        IGTPW_7499_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_7499_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_7499_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/index.html</a></p>
      <h2>Participating hosts (13 -&gt; 10)</h2>
      <p>Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_7499_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@drm_buddy@all:
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb3/igt@drm_buddy@all.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>{shard-dg1}: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@drm_mm@all:</p>
          <ul>
            <li>
              <p>{shard-rkl}: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-4/igt@drm_mm@all.html"
                  moz-do-not-send="true">SKIP</a></p>
            </li>
            <li>
              <p>{shard-dg1}: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-19/igt@drm_mm@all.html"
                  moz-do-not-send="true">SKIP</a> +1 similar issue</p>
            </li>
            <li>
              <p>{shard-tglu}: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglu-5/igt@drm_mm@all.html"
                  moz-do-not-send="true">SKIP</a> +2 similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html"
                moz-do-not-send="true">WARN</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    Nothing related.<br>
    <br>
    Regards<br>
    Andrzej<br>
    <br>
    <blockquote type="cite"
cite="mid:165764117435.12862.16687108548769880298@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_11876_full and
        IGTPW_7499_full:</p>
      <h3>New IGT tests (65)</h3>
      <ul>
        <li>
          <p>igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.33] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.17] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.16] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.16] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.65] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.43] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.41] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.43] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@gamma@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.55] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@gamma@pipe-b-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.38] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@gamma@pipe-c-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.40] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@gamma@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.39] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_concurrent@pipe-b@hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.28] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-128x128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-256x256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.22] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-64x64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.28] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-128x128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-256x256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-64x64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-128x128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-256x256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-64x64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-128x128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-256x256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-64x64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.19] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-128x128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-256x256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.22] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-64x64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.28] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-128x128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-256x256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.19] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-64x64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-128x128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-256x256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-64x64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-128x128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-256x256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-64x64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.19] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@absolute-wf_vblank@a-hdmi-a4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [7.86] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@absolute-wf_vblank@b-hdmi-a4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [7.80] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@absolute-wf_vblank@c-hdmi-a4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [7.84] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@absolute-wf_vblank@d-hdmi-a4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [7.80] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.65] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.65] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.64] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.61] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-a:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.15] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-b:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.02] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-c:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.02] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-d:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.02] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.57] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-b-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.45] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-c-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.49] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.44] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.50] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling@pipe-b-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.42] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling@pipe-c-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.47] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.44] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [19.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling@pipe-b-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [19.87] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling@pipe-c-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.17] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.17] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.26] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.20] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_7499_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@gem_ccs@ctrl-surf-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5325"
                moz-do-not-send="true">i915#5325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5327"
                  moz-do-not-send="true">i915#5327</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5325"
                  moz-do-not-send="true">i915#5325</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-massive:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl4/igt@gem_create@create-massive.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4991"
                moz-do-not-send="true">i915#4991</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@hostile:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-snb5/igt@gem_ctx_persistence@hostile.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1099"
                moz-do-not-send="true">i915#1099</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-contexts-immediate:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl8/igt@gem_eio@in-flight-contexts-immediate.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl4/igt@gem_eio@in-flight-contexts-immediate.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3063"
                moz-do-not-send="true">i915#3063</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-recoverable:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gem_exec_capture@capture-recoverable.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6344"
                moz-do-not-send="true">i915#6344</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
          <ul>
            <li>
              <p>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                  moz-do-not-send="true">i915#2842</a>)</p>
            </li>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                  moz-do-not-send="true">i915#2842</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@vcs1:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@secure-non-root:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@gem_exec_params@secure-non-root.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=112283"
                  moz-do-not-send="true">fdo#112283</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@gem_exec_params@secure-non-root.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=112283"
                  moz-do-not-send="true">fdo#112283</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl4/igt@gem_huc_copy@huc-copy.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2190"
                  moz-do-not-send="true">i915#2190</a>)</p>
            </li>
            <li>
              <p>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb1/igt@gem_huc_copy@huc-copy.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gem_huc_copy@huc-copy.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2190"
                  moz-do-not-send="true">i915#2190</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a>) +85 similar
                issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/768"
                  moz-do-not-send="true">i915#768</a>) +2 similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@evict-single-offset:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl4/igt@gem_softpin@evict-single-offset.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4171"
                moz-do-not-send="true">i915#4171</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_spin_batch@legacy@default:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl1/igt@gem_spin_batch@legacy@default.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl2/igt@gem_spin_batch@legacy@default.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2898"
                moz-do-not-send="true">i915#2898</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-sync:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb3/igt@gem_userptr_blits@coherency-sync.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109290"
                  moz-do-not-send="true">fdo#109290</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@gem_userptr_blits@coherency-sync.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=110542"
                  moz-do-not-send="true">fdo#110542</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@readonly-unsync:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@gem_userptr_blits@readonly-unsync.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                  moz-do-not-send="true">i915#3297</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@gem_userptr_blits@readonly-unsync.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                  moz-do-not-send="true">i915#3297</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@vma-merge:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl4/igt@gem_userptr_blits@vma-merge.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3318"
                moz-do-not-send="true">i915#3318</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen3_render_linear_blits:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@gen3_render_linear_blits.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@chained-batch:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gen7_exec_parse@chained-batch.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-single:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl7/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5566"
                moz-do-not-send="true">i915#5566</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/716"
                moz-do-not-send="true">i915#716</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
          <ul>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-snb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a>) +148 similar
                issues</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@gen9_exec_parse@basic-rejected-ctx-param.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2527"
                  moz-do-not-send="true">i915#2527</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2856"
                  moz-do-not-send="true">i915#2856</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2856"
                  moz-do-not-send="true">i915#2856</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl2/igt@i915_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2681"
                moz-do-not-send="true">i915#2681</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6405"
                moz-do-not-send="true">i915#6405</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=110892"
                  moz-do-not-send="true">fdo#110892</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111644"
                  moz-do-not-send="true">fdo#111644</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                  moz-do-not-send="true">i915#1397</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2411"
                  moz-do-not-send="true">i915#2411</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@query-topology-known-pci-ids:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109303"
                moz-do-not-send="true">fdo#109303</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@atomic_plane_damage:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_atomic@atomic_plane_damage.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4765"
                moz-do-not-send="true">i915#4765</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5286"
                moz-do-not-send="true">i915#5286</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5286"
                moz-do-not-send="true">i915#5286</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb5/igt@kms_big_fb@linear-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk5/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                  moz-do-not-send="true">i915#3886</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109278"
                  moz-do-not-send="true">fdo#109278</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                  moz-do-not-send="true">i915#3886</a>) +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb3/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109278"
                moz-do-not-send="true">fdo#109278</a>) +14 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb3/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb5/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a>) +150 similar
                issues</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                  moz-do-not-send="true">i915#3689</a>) +4 similar
                issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@kms_cdclk@mode-transition.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3742"
                moz-do-not-send="true">i915#3742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-snb5/igt@kms_chamelium@hdmi-edid-change-during-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@hdmi-hpd-storm:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl8/igt@kms_chamelium@hdmi-hpd-storm.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>) +13 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-max.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109284"
                  moz-do-not-send="true">fdo#109284</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>) +7 similar
                issues</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk9/igt@kms_color_chamelium@pipe-b-ctm-max.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>) +6 similar
                issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-max.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109284"
                  moz-do-not-send="true">fdo#109284</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>) +6 similar
                issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>) +17 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content_type_change:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_content_protection@content_type_change.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1063"
                  moz-do-not-send="true">i915#1063</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb7/igt@kms_content_protection@content_type_change.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109300"
                  moz-do-not-send="true">fdo#109300</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111066"
                  moz-do-not-send="true">fdo#111066</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl4/igt@kms_content_protection@uevent.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2105"
                moz-do-not-send="true">i915#2105</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4462"
                  moz-do-not-send="true">i915#4462</a>) +7 similar
                issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4462"
                  moz-do-not-send="true">i915#4462</a>) +5 similar
                issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2346"
                moz-do-not-send="true">i915#2346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5287"
                  moz-do-not-send="true">i915#5287</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5287"
                  moz-do-not-send="true">i915#5287</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@kms_flip@2x-nonexisting-fb-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3637"
                moz-do-not-send="true">i915#3637</a>) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_flip@2x-wf_vblank-ts-check.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/79"
                moz-do-not-send="true">i915#79</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1888"
                moz-do-not-send="true">i915#1888</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2546"
                moz-do-not-send="true">i915#2546</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109280"
                moz-do-not-send="true">fdo#109280</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +17 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109280"
                moz-do-not-send="true">fdo#109280</a>) +12 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +176 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1188"
                moz-do-not-send="true">i915#1188</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1188"
                moz-do-not-send="true">i915#1188</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/265"
                moz-do-not-send="true">i915#265</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=108145"
                  moz-do-not-send="true">fdo#108145</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/265"
                  moz-do-not-send="true">i915#265</a>)</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=108145"
                  moz-do-not-send="true">fdo#108145</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/265"
                  moz-do-not-send="true">i915#265</a>)</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=108145"
                  moz-do-not-send="true">fdo#108145</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/265"
                  moz-do-not-send="true">i915#265</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5176"
                moz-do-not-send="true">i915#5176</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5176"
                moz-do-not-send="true">i915#5176</a>) +8 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5176"
                moz-do-not-send="true">i915#5176</a>) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk7/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                  moz-do-not-send="true">i915#658</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb3/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109642"
                  moz-do-not-send="true">fdo#109642</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                  moz-do-not-send="true">fdo#111068</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                  moz-do-not-send="true">i915#658</a>)</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                  moz-do-not-send="true">i915#658</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1911"
                  moz-do-not-send="true">i915#1911</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109441"
                moz-do-not-send="true">fdo#109441</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_render:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@kms_psr@psr2_primary_render.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/132"
                  moz-do-not-send="true">i915#132</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3467"
                  moz-do-not-send="true">i915#3467</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb5/igt@kms_psr@psr2_primary_render.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109441"
                  moz-do-not-send="true">fdo#109441</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5289"
                  moz-do-not-send="true">i915#5289</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5289"
                  moz-do-not-send="true">i915#5289</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl1/igt@kms_writeback@writeback-pixel-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2437"
                moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2530"
                  moz-do-not-send="true">i915#2530</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb4/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2530"
                  moz-do-not-send="true">i915#2530</a>) +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@prime_nv_api@i915_self_import_to_different_fd:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@prime_nv_api@i915_self_import_to_different_fd.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109291"
                moz-do-not-send="true">fdo#109291</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_nv_pcopy@test1_macro:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@prime_nv_pcopy@test1_macro.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109291"
                moz-do-not-send="true">fdo#109291</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_clients@fair-1:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@sysfs_clients@fair-1.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2994"
                  moz-do-not-send="true">i915#2994</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk6/igt@sysfs_clients@fair-1.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2994"
                  moz-do-not-send="true">i915#2994</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb4/igt@sysfs_clients@fair-1.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2994"
                  moz-do-not-send="true">i915#2994</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_clients@pidname:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@sysfs_clients@pidname.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2994"
                moz-do-not-send="true">i915#2994</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_clients@sema-50:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@sysfs_clients@sema-50.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2994"
                moz-do-not-send="true">i915#2994</a>) +1 similar issue</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-snb7/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4528"
                moz-do-not-send="true">i915#4528</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-snb2/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@nullptr:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@fbdev@nullptr.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2582"
                moz-do-not-send="true">i915#2582</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-2/igt@fbdev@nullptr.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@basic-nohangcheck:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6268"
                moz-do-not-send="true">i915#6268</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-hang@bsd2:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-16/igt@gem_ctx_persistence@legacy-engines-hang@bsd2.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4883"
                moz-do-not-send="true">i915#4883</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-13/igt@gem_ctx_persistence@legacy-engines-hang@bsd2.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@kms:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb5/igt@gem_eio@kms.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5784"
                moz-do-not-send="true">i915#5784</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@gem_eio@kms.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb5/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">TIMEOUT</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3070"
                  moz-do-not-send="true">i915#3070</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-1/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">TIMEOUT</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3063"
                  moz-do-not-send="true">i915#3063</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-2/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>{shard-tglu}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglu-2/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">TIMEOUT</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3063"
                  moz-do-not-send="true">i915#3063</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglu-2/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-contexts:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4525"
                moz-do-not-send="true">i915#4525</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-flow@rcs0:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-6/igt@gem_exec_fair@basic-flow@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-2/igt@gem_exec_fair@basic-flow@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@rcs0:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4936"
                moz-do-not-send="true">i915#4936</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-1/igt@gem_tiled_partial_pwrite_pread@reads.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread@reads.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-param:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2527"
                moz-do-not-send="true">i915#2527</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_backlight@fade_with_dpms:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-1/igt@i915_pm_backlight@fade_with_dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3012"
                moz-do-not-send="true">i915#3012</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@i915_pm_backlight@fade_with_dpms.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/454"
                moz-do-not-send="true">i915#454</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6405"
                moz-do-not-send="true">i915#6405</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_sseu@full-enable:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-6/igt@i915_pm_sseu@full-enable.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4387"
                moz-do-not-send="true">i915#4387</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-5/igt@i915_pm_sseu@full-enable.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@hangcheck:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-13/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4494"
                moz-do-not-send="true">i915#4494</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4957"
                moz-do-not-send="true">i915#4957</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-15/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2521"
                moz-do-not-send="true">i915#2521</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2521"
                moz-do-not-send="true">i915#2521</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb3/igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb1/igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1888"
                moz-do-not-send="true">i915#1888</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5138"
                moz-do-not-send="true">i915#5138</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2346"
                moz-do-not-send="true">i915#2346</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2122"
                moz-do-not-send="true">i915#2122</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-badstride.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-badstride.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3558"
                moz-do-not-send="true">i915#3558</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@atomic-pipe-a-tiling-none:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3558"
                moz-do-not-send="true">i915#3558</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4070"
                moz-do-not-send="true">i915#4070</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@dpms:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-rkl-2/igt@kms_psr@dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-rkl-6/igt@kms_psr@dpms.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_cursor_plane_move:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109441"
                moz-do-not-send="true">fdo#109441</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5519"
                moz-do-not-send="true">i915#5519</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-tglb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"
                moz-do-not-send="true">PASS</a> +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-idle@vcs0:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-12/igt@perf_pmu@busy-idle@vcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                moz-do-not-send="true">i915#4349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-15/igt@perf_pmu@busy-idle@vcs0.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@module-unload:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-dg1-19/igt@perf_pmu@module-unload.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6054"
                moz-do-not-send="true">i915#6054</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-dg1-17/igt@perf_pmu@module-unload.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@i915_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl7/igt@i915_pm_dc@dc9-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl6/igt@i915_pm_dc@dc9-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4275"
                moz-do-not-send="true">i915#4275</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4767"
                moz-do-not-send="true">i915#4767</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4939"
                moz-do-not-send="true">i915#4939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2920"
                moz-do-not-send="true">i915#2920</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2920"
                moz-do-not-send="true">i915#2920</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                moz-do-not-send="true">fdo#111068</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2920"
                moz-do-not-send="true">i915#2920</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@runner@aborted:</p>
          <ul>
            <li>shard-apl: (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl3/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl8/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11876/shard-apl8/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>) (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3002"
                moz-do-not-send="true">i915#3002</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4312"
                moz-do-not-send="true">i915#4312</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5257"
                moz-do-not-send="true">i915#5257</a>) -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl3/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/shard-apl4/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>) (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3002"
                moz-do-not-send="true">i915#3002</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4312"
                moz-do-not-send="true">i915#4312</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5257"
                moz-do-not-send="true">i915#5257</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_6578 -&gt; IGTPW_7499</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_11876: 2305e0d006655ed3797e530403df777699c67ec8 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_7499:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7499/index.html</a><br>
        IGT_6578: 7d289d89131ec37c1145bcdb86149914587d7406 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
    <br>
  </body>
</html>

--------------T03byQuUk6joGXXG00mipbu2--
