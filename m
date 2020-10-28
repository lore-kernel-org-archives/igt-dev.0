Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCED6E233
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2020 07:39:12 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n16so2256969pgv.13
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2020 00:39:12 -0700 (PDT)
References: <20201026130811.11136-1-juhapekka.heikkila@gmail.com>
 <160383987890.26911.12496031004933421206@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <45db067a-e654-b218-ac30-0ede903a8a31@gmail.com>
Date: Wed, 28 Oct 2020 09:39:05 +0200
MIME-Version: 1.0
In-Reply-To: <160383987890.26911.12496031004933421206@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_fix_pixel_format_=28-clamping=29_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

these listed regressions below are all false. My test wasn't even run so 
I could not have caused those regressions :)

/Juha-Pekka

On 28.10.2020 1.04, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_plane: fix pixel format (-clamping) tests
> *URL:*	https://patchwork.freedesktop.org/series/83041/
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/index.html
> 
> 
>   CI Bug Log - changes from CI_DRM_9202_full -> IGTPW_5098_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_5098_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5098_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/index.html
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_5098_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
> 
>       o shard-iclb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html>
>         +2 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
> 
>       o
> 
>         shard-tglb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html>
>         +2 similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html>
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-tglb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         +12 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>   *
> 
>     igt@sw_sync@sync_busy_fork:
> 
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw6/igt@sw_sync@sync_busy_fork.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw2/igt@sw_sync@sync_busy_fork.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_5098_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_exec_await@wide-contexts:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-snb5/igt@gem_exec_await@wide-contexts.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-snb2/igt@gem_exec_await@wide-contexts.html>
>         (i915#82 <https://gitlab.freedesktop.org/drm/intel/issues/82>)
>   *
> 
>     igt@gem_exec_whisper@basic-fds-all:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk3/igt@gem_exec_whisper@basic-fds-all.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>
>         / i915#95 <https://gitlab.freedesktop.org/drm/intel/issues/95>)
>   *
> 
>     igt@gem_ppgtt@blt-vs-render-ctxn:
> 
>       o
> 
>         shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw4/igt@gem_ppgtt@blt-vs-render-ctxn.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw7/igt@gem_ppgtt@blt-vs-render-ctxn.html>
>         (i915#1888 <https://gitlab.freedesktop.org/drm/intel/issues/1888>)
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk7/igt@gem_ppgtt@blt-vs-render-ctxn.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk9/igt@gem_ppgtt@blt-vs-render-ctxn.html>
>         (i915#1888 <https://gitlab.freedesktop.org/drm/intel/issues/1888>)
> 
>   *
> 
>     igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +4
>         similar issues
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (i915#96 <https://gitlab.freedesktop.org/drm/intel/issues/96>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk9/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +4
>         similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> / i915#79
>         <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-iclb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html>
>         (i915#123 <https://gitlab.freedesktop.org/drm/intel/issues/123>
>         / i915#2606 <https://gitlab.freedesktop.org/drm/intel/issues/2606>)
>   *
> 
>     igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +4
>         similar issues
>   *
> 
>     igt@perf@invalid-oa-exponent:
> 
>       o
> 
>         shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw2/igt@perf@invalid-oa-exponent.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw7/igt@perf@invalid-oa-exponent.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl4/igt@perf@invalid-oa-exponent.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl7/igt@perf@invalid-oa-exponent.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1354 <https://gitlab.freedesktop.org/drm/intel/issues/1354>
>         / i915#1635 <https://gitlab.freedesktop.org/drm/intel/issues/1635>)
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-kbl4/igt@perf@invalid-oa-exponent.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-kbl7/igt@perf@invalid-oa-exponent.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1354 <https://gitlab.freedesktop.org/drm/intel/issues/1354>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_create@basic:
> 
>       o
> 
>         shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-snb5/igt@gem_exec_create@basic.html>
>         (i915#82 <https://gitlab.freedesktop.org/drm/intel/issues/82>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-snb5/igt@gem_exec_create@basic.html>
> 
>       o
> 
>         shard-hsw: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw4/igt@gem_exec_create@basic.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw6/igt@gem_exec_create@basic.html>
> 
>   *
> 
>     igt@gem_exec_create@madvise:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk4/igt@gem_exec_create@madvise.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888> /
>         i915#2545
>         <https://gitlab.freedesktop.org/drm/intel/issues/2545>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk2/igt@gem_exec_create@madvise.html>
>   *
> 
>     igt@gem_exec_reloc@basic-many-active@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>         (i915#2389
>         <https://gitlab.freedesktop.org/drm/intel/issues/2389>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>   *
> 
>     igt@gem_exec_whisper@basic-fds-forked-all:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk7/igt@gem_exec_whisper@basic-fds-forked-all.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>
>         / i915#95 <https://gitlab.freedesktop.org/drm/intel/issues/95>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk6/igt@gem_exec_whisper@basic-fds-forked-all.html>
>   *
> 
>     {igt@kms_async_flips@async-flip-with-page-flip-events}:
> 
>       o
> 
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk6/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>         (i915#2521
>         <https://gitlab.freedesktop.org/drm/intel/issues/2521>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk1/igt@kms_async_flips@async-flip-with-page-flip-events.html>
> 
>       o
> 
>         shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#2521
>         <https://gitlab.freedesktop.org/drm/intel/issues/2521>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl3/igt@kms_async_flips@async-flip-with-page-flip-events.html>
> 
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-0:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-kbl4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-kbl2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html>
>         +1 similar issue
>   *
> 
>     igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge:
> 
>       o shard-hsw: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw6/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw1/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html>
>   *
> 
>     igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
> 
>       o
> 
>         shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html>
>         +3 similar issues
> 
>       o
> 
>         shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html>
>         +2 similar issues
> 
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>       o shard-apl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
> 
>       o shard-iclb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>         (i915#123 <https://gitlab.freedesktop.org/drm/intel/issues/123>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_tiled_swapping@non-threaded:
> 
>       o shard-hsw: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-hsw4/igt@gem_tiled_swapping@non-threaded.html>
>         (i915#183 <https://gitlab.freedesktop.org/drm/intel/issues/183>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-hsw6/igt@gem_tiled_swapping@non-threaded.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>       o shard-iclb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt.html>
>         (i915#123 <https://gitlab.freedesktop.org/drm/intel/issues/123>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt.html>
>         (i915#2606 <https://gitlab.freedesktop.org/drm/intel/issues/2606>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> /
>         i915#1635 <https://gitlab.freedesktop.org/drm/intel/issues/1635>
>         / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> /
>         i915#1635 <https://gitlab.freedesktop.org/drm/intel/issues/1635>
>         / i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>   *
> 
>     igt@runner@aborted:
> 
>       o shard-tglb: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb5/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb5/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb5/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/shard-tglb5/igt@runner@aborted.html>)
>         (i915#1764
>         <https://gitlab.freedesktop.org/drm/intel/issues/1764> /
>         i915#1814 <https://gitlab.freedesktop.org/drm/intel/issues/1814>
>         / i915#456
>         <https://gitlab.freedesktop.org/drm/intel/issues/456>) -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb5/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/shard-tglb1/igt@runner@aborted.html>)
>         (i915#1602
>         <https://gitlab.freedesktop.org/drm/intel/issues/1602> /
>         i915#1764 <https://gitlab.freedesktop.org/drm/intel/issues/1764>
>         / i915#1814
>         <https://gitlab.freedesktop.org/drm/intel/issues/1814> /
>         i915#456 <https://gitlab.freedesktop.org/drm/intel/issues/456> /
>         k.org#205379 <https://bugzilla.kernel.org/show_bug.cgi?id=205379>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Participating hosts (11 -> 8)
> 
> Missing (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5827 -> IGTPW_5098
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_9202: 073691f2baf2db32197f744612f5249dcf942c79 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_5098: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5098/index.html
> IGT_5827: 7fd7e3fb8b42eb4e62a4575f6edc5a048e5bec3d @ 
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
