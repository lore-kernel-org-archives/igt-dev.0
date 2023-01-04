Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D0B10E089
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 07:38:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------04AOm2BlEQ0g4i2pQDYAX0fJ"
Message-ID: <6b20a39d-6980-4253-4906-927d1ebf7020@intel.com>
Date: Wed, 4 Jan 2023 08:38:20 +0100
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20221229155842.2448977-1-andrzej.hajda@intel.com>
 <167280395680.24958.7628380154096196182@emeril.freedesktop.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <167280395680.24958.7628380154096196182@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_remove_fb_after_test_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Veesam,
 RavitejaX" <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------04AOm2BlEQ0g4i2pQDYAX0fJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04.01.2023 04:45, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_plane_scaling: remove fb after test (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/112291/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html
>
>
>   CI Bug Log - changes from CI_DRM_12536_full -> IGTPW_8287_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_8287_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8287_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html
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
> IGTPW_8287_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         -> (INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads.html>)
>

Not related.

Regards
Andrzej

>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@gem_exec_balancer@invalid-bonds:
>
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-16/igt@gem_exec_balancer@invalid-bonds.html>
>         (i915#4036
>         <https://gitlab.freedesktop.org/drm/intel/issues/4036>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html>
>  *
>
>     igt@gem_exec_capture@capture-invisible@lmem0:
>
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-13/igt@gem_exec_capture@capture-invisible@lmem0.html>
>         (i915#6334
>         <https://gitlab.freedesktop.org/drm/intel/issues/6334>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-15/igt@gem_exec_capture@capture-invisible@lmem0.html>
>         +1 similar issue
>  *
>
>     igt@gem_exec_capture@capture-invisible@smem0:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-3/igt@gem_exec_capture@capture-invisible@smem0.html>
>         (i915#6334
>         <https://gitlab.freedesktop.org/drm/intel/issues/6334>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-1/igt@gem_exec_capture@capture-invisible@smem0.html>
>  *
>
>     igt@gem_exec_whisper@basic-fds-priority:
>
>       o {shard-rkl}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@gem_exec_whisper@basic-fds-priority.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-3/igt@gem_exec_whisper@basic-fds-priority.html>
>  *
>
>     igt@i915_pm_rpm@pm-tiling:
>
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-tglu-6/igt@i915_pm_rpm@pm-tiling.html>
>         (i915#3547
>         <https://gitlab.freedesktop.org/drm/intel/issues/3547>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-6/igt@i915_pm_rpm@pm-tiling.html>
>  *
>
>     igt@i915_query@query-topology-unsupported:
>
>      o
>
>         {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-5/igt@i915_query@query-topology-unsupported.html>
>         (fdo#109302
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109302>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-2/igt@i915_query@query-topology-unsupported.html>
>
>      o
>
>         {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-15/igt@i915_query@query-topology-unsupported.html>
>         (fdo#109302
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109302>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-14/igt@i915_query@query-topology-unsupported.html>
>
>      o
>
>         {shard-tglu}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-1/igt@i915_query@query-topology-unsupported.html>
>         +1 similar issue
>
>  *
>
>     igt@kms_plane@plane-panning-top-left@pipe-a-planes:
>
>       o {shard-tglu-9}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-9/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html>
>         +1 similar issue
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-a-planes:
>
>       o {shard-rkl}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-6/igt@kms_plane@plane-position-covered@pipe-a-planes.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-1/igt@kms_plane@plane-position-covered@pipe-a-planes.html>
>         +1 similar issue
>  *
>
>     igt@kms_plane@plane-position-hole@pipe-b-planes:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.html>
>         (i915#3558
>         <https://gitlab.freedesktop.org/drm/intel/issues/3558>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-4/igt@kms_plane@plane-position-hole@pipe-b-planes.html>
>         +3 similar issues
>  *
>
>     igt@kms_properties@crtc-properties-legacy:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@kms_properties@crtc-properties-legacy.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html>
>  *
>
>     igt@kms_properties@plane-properties-atomic:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@kms_properties@plane-properties-atomic.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html>
>         +1 similar issue
>
>
>     Known issues
>
> Here are the changes found in IGTPW_8287_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@gem_exec_fair@basic-none-solo@rcs0:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         -> (PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html>)
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +2
>         similar issues
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>         -> (INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>)
>         (i915#7708
>         <https://gitlab.freedesktop.org/drm/intel/issues/7708>) +1
>         similar issue
>  *
>
>     igt@gem_pwrite@basic-exhaustion:
>
>       o shard-snb: NOTRUN -> (WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb4/igt@gem_pwrite@basic-exhaustion.html>,
>         WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb7/igt@gem_pwrite@basic-exhaustion.html>)
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>  *
>
>     igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>
>       o shard-apl: NOTRUN -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>)
>         (i915#7036 <https://gitlab.freedesktop.org/drm/intel/issues/7036>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +19
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>  *
>
>     igt@kms_chamelium@common-hpd-after-suspend:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb4/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>  *
>
>     igt@kms_chamelium@dp-frame-dump:
>
>       o shard-snb: NOTRUN -> (SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb5/igt@kms_chamelium@dp-frame-dump.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb2/igt@kms_chamelium@dp-frame-dump.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
>  *
>
>     igt@kms_chamelium@vga-frame-dump:
>
>       o shard-apl: NOTRUN -> (SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl2/igt@kms_chamelium@vga-frame-dump.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl3/igt@kms_chamelium@vga-frame-dump.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-apl: NOTRUN -> (SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +20
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +12
>         similar issues
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-snb: NOTRUN -> (SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb7/igt@kms_rotation_crc@bad-pixel-format.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb2/igt@kms_rotation_crc@bad-pixel-format.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +36
>         similar issues
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>       o shard-apl: NOTRUN -> (SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl1/igt@kms_writeback@writeback-invalid-parameters.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl7/igt@kms_writeback@writeback-invalid-parameters.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>
>         Possible fixes
>
>  *
>
>     igt@drm_fdinfo@virtual-idle:
>
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html>
>         (i915#7742
>         <https://gitlab.freedesktop.org/drm/intel/issues/7742>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html>
>  *
>
>     igt@feature_discovery@psr2:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@feature_discovery@psr2.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@feature_discovery@psr2.html>
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-hang@blt:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>         (i915#6252
>         <https://gitlab.freedesktop.org/drm/intel/issues/6252>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-4/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-19/igt@gem_eio@unwedge-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-15/igt@gem_eio@unwedge-stress.html>
>  *
>
>     igt@gem_exec_fair@basic-deadline:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-glk7/igt@gem_exec_fair@basic-deadline.html>
>         (i915#2846
>         <https://gitlab.freedesktop.org/drm/intel/issues/2846>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-glk2/igt@gem_exec_fair@basic-deadline.html>
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         +1 similar issue
>  *
>
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
>
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>  *
>
>     igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>         (fdo#109313
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109313>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>  *
>
>     igt@gem_exec_reloc@basic-write-read-noreloc:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>         +10 similar issues
>  *
>
>     igt@gem_exec_schedule@semaphore-power:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#7276
>         <https://gitlab.freedesktop.org/drm/intel/issues/7276>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html>
>  *
>
>     igt@gem_mmap_gtt@fault-concurrent-y:
>
>       o shard-snb: CRASH
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-y.html>
>         (i915#5161
>         <https://gitlab.freedesktop.org/drm/intel/issues/5161>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb4/igt@gem_mmap_gtt@fault-concurrent-y.html>
>  *
>
>     igt@gem_mmap_wc@set-cache-level:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@gem_mmap_wc@set-cache-level.html>
>         (i915#1850
>         <https://gitlab.freedesktop.org/drm/intel/issues/1850>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html>
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-display:
>
>       o shard-apl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>         (i915#7708
>         <https://gitlab.freedesktop.org/drm/intel/issues/7708>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>         +4 similar issues
>  *
>
>     igt@gen9_exec_parse@bb-chained:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@gen9_exec_parse@bb-chained.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html>
>         +2 similar issues
>  *
>
>     igt@i915_pm_rpm@cursor:
>
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-tglu-6/igt@i915_pm_rpm@cursor.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-3/igt@i915_pm_rpm@cursor.html>
>  *
>
>     igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html>
>  *
>
>     igt@i915_pm_rpm@fences:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@i915_pm_rpm@fences.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@i915_pm_rpm@fences.html>
>  *
>
>     igt@i915_pm_rpm@pm-tiling:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@i915_pm_rpm@pm-tiling.html>
>         (fdo#109308
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109308>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html>
>  *
>
>     igt@i915_pm_rpm@system-suspend-devices:
>
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@i915_pm_rpm@system-suspend-devices.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-1/igt@i915_pm_rpm@system-suspend-devices.html>
>  *
>
>     igt@i915_pm_sseu@full-enable:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-3/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387
>         <https://gitlab.freedesktop.org/drm/intel/issues/4387>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@i915_pm_sseu@full-enable.html>
>  *
>
>     igt@i915_selftest@live@evict:
>
>       o {shard-tglu}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-tglu-1/igt@i915_selftest@live@evict.html>
>         (i915#2867
>         <https://gitlab.freedesktop.org/drm/intel/issues/2867>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-7/igt@i915_selftest@live@evict.html>
>         +6 similar issues
>  *
>
>     igt@kms_atomic@atomic_plane_damage:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-3/igt@kms_atomic@atomic_plane_damage.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@kms_atomic@atomic_plane_damage.html>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         +26 similar issues
>  *
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html>
>         (i915#72 <https://gitlab.freedesktop.org/drm/intel/issues/72>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html>
>  *
>
>     igt@kms_flip@plain-flip-ts-check@b-hdmi-a2:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-glk9/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.html>
>         (i915#2122
>         <https://gitlab.freedesktop.org/drm/intel/issues/2122>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-glk8/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         +12 similar issues
>  *
>
>     igt@kms_plane@plane-panning-top-left@pipe-a-planes:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html>
>         (i915#3558
>         <https://gitlab.freedesktop.org/drm/intel/issues/3558>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html>
>         +1 similar issue
>  *
>
>     igt@kms_psr@no_drrs:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@kms_psr@no_drrs.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@kms_psr@no_drrs.html>
>  *
>
>     igt@kms_vblank@pipe-a-query-forked:
>
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-tglu-6/igt@kms_vblank@pipe-a-query-forked.html>
>         (i915#7651
>         <https://gitlab.freedesktop.org/drm/intel/issues/7651>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-1/igt@kms_vblank@pipe-a-query-forked.html>
>         +6 similar issues
>  *
>
>     igt@kms_vblank@pipe-a-wait-forked-busy-hang:
>
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-tglu-6/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#7651
>         <https://gitlab.freedesktop.org/drm/intel/issues/7651>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-8/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html>
>         +1 similar issue
>  *
>
>     igt@perf@polling-small-buf:
>
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@perf@polling-small-buf.html>
>         (i915#1722
>         <https://gitlab.freedesktop.org/drm/intel/issues/1722>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-4/igt@perf@polling-small-buf.html>
>  *
>
>     igt@perf_pmu@idle@rcs0:
>
>      o
>
>         {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-15/igt@perf_pmu@idle@rcs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-18/igt@perf_pmu@idle@rcs0.html>
>
>      o
>
>         {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@perf_pmu@idle@rcs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-3/igt@perf_pmu@idle@rcs0.html>
>
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@prime_vgem@basic-write.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3291
>         <https://gitlab.freedesktop.org/drm/intel/issues/3291> /
>         i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@prime_vgem@basic-write.html>
>  *
>
>     igt@sysfs_heartbeat_interval@precise@rcs0:
>
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-18/igt@sysfs_heartbeat_interval@precise@rcs0.html>
>         (i915#1755
>         <https://gitlab.freedesktop.org/drm/intel/issues/1755>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-17/igt@sysfs_heartbeat_interval@precise@rcs0.html>
>         +4 similar issues
>
>
>         Warnings
>
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
>       o shard-apl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>         (IGT#6
>         <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6>)
>         -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>)
>         (i915#4573
>         <https://gitlab.freedesktop.org/drm/intel/issues/4573>) +1
>         similar issue
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7105 -> IGTPW_8287
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_12536: 4c18d8b1c2a1f11e99f865f60fbce9fedd3376fc @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8287: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html
> IGT_7105: 305e8d105abf033cb850d1fb118e5cbfb6c9cd40 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>

--------------04AOm2BlEQ0g4i2pQDYAX0fJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 04.01.2023 04:45, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:167280395680.24958.7628380154096196182@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_plane_scaling: remove fb after test (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/112291/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/112291/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_12536_full -&gt;
        IGTPW_8287_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_8287_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_8287_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html</a></p>
      <h2>Participating hosts (13 -&gt; 10)</h2>
      <p>Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_8287_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@gem_partial_pwrite_pread@writes-after-reads:
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads.html"
                moz-do-not-send="true">PASS</a> -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads.html"
                moz-do-not-send="true">INCOMPLETE</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads.html"
                moz-do-not-send="true">PASS</a>)</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    Not related.<br>
    <br>
    Regards<br>
    Andrzej<br>
    <br>
    <blockquote type="cite"
      cite="mid:167280395680.24958.7628380154096196182@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@gem_exec_balancer@invalid-bonds:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-16/igt@gem_exec_balancer@invalid-bonds.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4036"
                moz-do-not-send="true">i915#4036</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-13/igt@gem_exec_capture@capture-invisible@lmem0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6334"
                moz-do-not-send="true">i915#6334</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-15/igt@gem_exec_capture@capture-invisible@lmem0.html"
                moz-do-not-send="true">SKIP</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-invisible@smem0:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-3/igt@gem_exec_capture@capture-invisible@smem0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6334"
                moz-do-not-send="true">i915#6334</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-1/igt@gem_exec_capture@capture-invisible@smem0.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-fds-priority:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@gem_exec_whisper@basic-fds-priority.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-3/igt@gem_exec_whisper@basic-fds-priority.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@pm-tiling:</p>
          <ul>
            <li>{shard-tglu}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-tglu-6/igt@i915_pm_rpm@pm-tiling.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3547"
                moz-do-not-send="true">i915#3547</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-6/igt@i915_pm_rpm@pm-tiling.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@query-topology-unsupported:</p>
          <ul>
            <li>
              <p>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-5/igt@i915_query@query-topology-unsupported.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109302"
                  moz-do-not-send="true">fdo#109302</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-2/igt@i915_query@query-topology-unsupported.html"
                  moz-do-not-send="true">SKIP</a></p>
            </li>
            <li>
              <p>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-15/igt@i915_query@query-topology-unsupported.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109302"
                  moz-do-not-send="true">fdo#109302</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-14/igt@i915_query@query-topology-unsupported.html"
                  moz-do-not-send="true">SKIP</a></p>
            </li>
            <li>
              <p>{shard-tglu}: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-1/igt@i915_query@query-topology-unsupported.html"
                  moz-do-not-send="true">SKIP</a> +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
          <ul>
            <li>{shard-tglu-9}: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-9/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html"
                moz-do-not-send="true">SKIP</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-a-planes:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-6/igt@kms_plane@plane-position-covered@pipe-a-planes.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-1/igt@kms_plane@plane-position-covered@pipe-a-planes.html"
                moz-do-not-send="true">SKIP</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole@pipe-b-planes:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3558"
                moz-do-not-send="true">i915#3558</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-4/igt@kms_plane@plane-position-hole@pipe-b-planes.html"
                moz-do-not-send="true">SKIP</a> +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@crtc-properties-legacy:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@kms_properties@crtc-properties-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@plane-properties-atomic:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@kms_properties@plane-properties-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html"
                moz-do-not-send="true">SKIP</a> +1 similar issue</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_8287_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html"
                moz-do-not-send="true">FAIL</a>) (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html"
                moz-do-not-send="true">PASS</a> -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html"
                moz-do-not-send="true">INCOMPLETE</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html"
                moz-do-not-send="true">PASS</a>) (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7708"
                moz-do-not-send="true">i915#7708</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-exhaustion:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb4/igt@gem_pwrite@basic-exhaustion.html"
                moz-do-not-send="true">WARN</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb7/igt@gem_pwrite@basic-exhaustion.html"
                moz-do-not-send="true">WARN</a>) (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2658"
                moz-do-not-send="true">i915#2658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html"
                moz-do-not-send="true">FAIL</a>) (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7036"
                moz-do-not-send="true">i915#7036</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +19 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@common-hpd-after-suspend:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb4/igt@kms_chamelium@common-hpd-after-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@dp-frame-dump:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb5/igt@kms_chamelium@dp-frame-dump.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb2/igt@kms_chamelium@dp-frame-dump.html"
                moz-do-not-send="true">SKIP</a>) (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@vga-frame-dump:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl2/igt@kms_chamelium@vga-frame-dump.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl3/igt@kms_chamelium@vga-frame-dump.html"
                moz-do-not-send="true">SKIP</a>) (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2346"
                moz-do-not-send="true">i915#2346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2346"
                moz-do-not-send="true">i915#2346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a>) (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +20 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +12 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb7/igt@kms_rotation_crc@bad-pixel-format.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb2/igt@kms_rotation_crc@bad-pixel-format.html"
                moz-do-not-send="true">SKIP</a>) (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +36 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl1/igt@kms_writeback@writeback-invalid-parameters.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl7/igt@kms_writeback@writeback-invalid-parameters.html"
                moz-do-not-send="true">SKIP</a>) (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2437"
                moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@drm_fdinfo@virtual-idle:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7742"
                moz-do-not-send="true">i915#7742</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@feature_discovery@psr2:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@feature_discovery@psr2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@feature_discovery@psr2.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6252"
                moz-do-not-send="true">i915#6252</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-4/igt@gem_ctx_persistence@legacy-engines-hang@blt.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-19/igt@gem_eio@unwedge-stress.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5784"
                moz-do-not-send="true">i915#5784</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-15/igt@gem_eio@unwedge-stress.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-deadline:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-glk7/igt@gem_exec_fair@basic-deadline.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2846"
                moz-do-not-send="true">i915#2846</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-glk2/igt@gem_exec_fair@basic-deadline.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109313"
                moz-do-not-send="true">fdo#109313</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@gem_exec_reloc@basic-write-read-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html"
                moz-do-not-send="true">PASS</a> +10 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@semaphore-power:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7276"
                moz-do-not-send="true">i915#7276</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-y.html"
                moz-do-not-send="true">CRASH</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5161"
                moz-do-not-send="true">i915#5161</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-snb4/igt@gem_mmap_gtt@fault-concurrent-y.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@set-cache-level:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@gem_mmap_wc@set-cache-level.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1850"
                moz-do-not-send="true">i915#1850</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7708"
                moz-do-not-send="true">i915#7708</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-chained:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@gen9_exec_parse@bb-chained.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2527"
                moz-do-not-send="true">i915#2527</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@cursor:</p>
          <ul>
            <li>{shard-tglu}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-tglu-6/igt@i915_pm_rpm@cursor.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-3/igt@i915_pm_rpm@cursor.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@fences:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@i915_pm_rpm@fences.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@i915_pm_rpm@fences.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@pm-tiling:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@i915_pm_rpm@pm-tiling.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109308"
                moz-do-not-send="true">fdo#109308</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@system-suspend-devices:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@i915_pm_rpm@system-suspend-devices.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-1/igt@i915_pm_rpm@system-suspend-devices.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_sseu@full-enable:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-3/igt@i915_pm_sseu@full-enable.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4387"
                moz-do-not-send="true">i915#4387</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@i915_pm_sseu@full-enable.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@evict:</p>
          <ul>
            <li>{shard-tglu}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-tglu-1/igt@i915_selftest@live@evict.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2867"
                moz-do-not-send="true">i915#2867</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-7/igt@i915_selftest@live@evict.html"
                moz-do-not-send="true">PASS</a> +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@atomic_plane_damage:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-3/igt@kms_atomic@atomic_plane_damage.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@kms_atomic@atomic_plane_damage.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">PASS</a> +26 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/72"
                moz-do-not-send="true">i915#72</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a2:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-glk9/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2122"
                moz-do-not-send="true">i915#2122</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-glk8/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">PASS</a> +12 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3558"
                moz-do-not-send="true">i915#3558</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@no_drrs:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@kms_psr@no_drrs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-6/igt@kms_psr@no_drrs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-a-query-forked:</p>
          <ul>
            <li>{shard-tglu}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-tglu-6/igt@kms_vblank@pipe-a-query-forked.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7651"
                moz-do-not-send="true">i915#7651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-1/igt@kms_vblank@pipe-a-query-forked.html"
                moz-do-not-send="true">PASS</a> +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-a-wait-forked-busy-hang:</p>
          <ul>
            <li>{shard-tglu}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-tglu-6/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7651"
                moz-do-not-send="true">i915#7651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-tglu-8/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@polling-small-buf:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-1/igt@perf@polling-small-buf.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1722"
                moz-do-not-send="true">i915#1722</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-4/igt@perf@polling-small-buf.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@idle@rcs0:</p>
          <ul>
            <li>
              <p>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-15/igt@perf_pmu@idle@rcs0.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                  moz-do-not-send="true">i915#4349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-18/igt@perf_pmu@idle@rcs0.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-2/igt@perf_pmu@idle@rcs0.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                  moz-do-not-send="true">i915#4349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-3/igt@perf_pmu@idle@rcs0.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-write:</p>
          <ul>
            <li>{shard-rkl}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-rkl-4/igt@prime_vgem@basic-write.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                moz-do-not-send="true">fdo#109295</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3291"
                moz-do-not-send="true">i915#3291</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                moz-do-not-send="true">i915#3708</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-rkl-5/igt@prime_vgem@basic-write.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_heartbeat_interval@precise@rcs0:</p>
          <ul>
            <li>{shard-dg1}: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-dg1-18/igt@sysfs_heartbeat_interval@precise@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1755"
                moz-do-not-send="true">i915#1755</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-dg1-17/igt@sysfs_heartbeat_interval@precise@rcs0.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6"
                moz-do-not-send="true">IGT#6</a>) -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html"
                moz-do-not-send="true">FAIL</a>) (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4573"
                moz-do-not-send="true">i915#4573</a>) +1 similar issue</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7105 -&gt; IGTPW_8287</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_12536: 4c18d8b1c2a1f11e99f865f60fbce9fedd3376fc @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_8287:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html</a><br>
        IGT_7105: 305e8d105abf033cb850d1fb118e5cbfb6c9cd40 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
    <br>
  </body>
</html>

--------------04AOm2BlEQ0g4i2pQDYAX0fJ--
