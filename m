Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3296E9DE
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Jan 2021 12:37:38 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id l9so7455837ejx.3
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Jan 2021 04:37:38 -0800 (PST)
References: <20210122084139.24042-1-juhapekka.heikkila@gmail.com>
 <161131760889.14038.2390741768043440898@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <5432adcd-da6f-c6c2-9109-e4d016d30f7b@gmail.com>
Date: Fri, 22 Jan 2021 14:37:30 +0200
MIME-Version: 1.0
In-Reply-To: <161131760889.14038.2390741768043440898@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=5Fscaled=5Fcrc=3A_try_to_set_mode_to_1080p_during_te?=
 =?utf-8?q?st?=
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

I have here 'expected' warning on ICL. I plan to push this patch unless 
you think it's not good idea. What this warning is about is on that ICL 
there's eDP panel connected which has only 2560x1440 mode available, 
test now tries to set 1080p mode to make certain display clock will not 
be causing problems. What this warning is about is to tell test couldn't 
set 1080p mode it wanted and will continue with default mode.

/Juha-Pekka

On 22.1.2021 14.13, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_flip_scaled_crc: try to set mode to 1080p during test
> *URL:*	https://patchwork.freedesktop.org/series/86166/
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/index.html
> 
> 
>   CI Bug Log - changes from CI_DRM_9666_full -> IGTPW_5421_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_5421_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5421_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/index.html
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_5421_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html>
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         (i915#2641
>         <https://gitlab.freedesktop.org/drm/intel/issues/2641>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         +2 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html>
>         (i915#2641
>         <https://gitlab.freedesktop.org/drm/intel/issues/2641>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html>
>         +2 similar issues
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_5421_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-mixed-process:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>   *
> 
>     igt@gem_ctx_sseu@engines:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb7/igt@gem_ctx_sseu@engines.html>
>         (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>)
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-apl8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +2
>         similar issues
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-tglb2/igt@gem_exec_fair@basic-pace@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_params@secure-non-master:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb1/igt@gem_exec_params@secure-non-master.html>
>         (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>   *
> 
>     igt@gem_exec_reloc@basic-many-active@vcs1:
> 
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb1/igt@gem_exec_reloc@basic-many-active@vcs1.html>
>         (i915#2389 <https://gitlab.freedesktop.org/drm/intel/issues/2389>)
>   *
> 
>     igt@gem_exec_schedule@u-fairslice@rcs0:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-kbl2/igt@gem_exec_schedule@u-fairslice@rcs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl1/igt@gem_exec_schedule@u-fairslice@rcs0.html>
>         (i915#1610
>         <https://gitlab.freedesktop.org/drm/intel/issues/1610> /
>         i915#2803 <https://gitlab.freedesktop.org/drm/intel/issues/2803>)
>   *
> 
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html>
>         ([i915#768])
>   *
> 
>     igt@gem_softpin@evict-snoop:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb3/igt@gem_softpin@evict-snoop.html>
>         (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb5/igt@gem_softpin@evict-snoop.html>
>         (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
> 
>   *
> 
>     igt@gem_workarounds@suspend-resume-context:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-apl2/igt@gem_workarounds@suspend-resume-context.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-apl8/igt@gem_workarounds@suspend-resume-context.html>
>         (i915#2295 <https://gitlab.freedesktop.org/drm/intel/issues/2295>)
>   *
> 
>     igt@gen7_exec_parse@bitmasks:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb8/igt@gen7_exec_parse@bitmasks.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +1
>         similar issue
>   *
> 
>     igt@gen9_exec_parse@basic-rejected:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb4/igt@gen9_exec_parse@basic-rejected.html>
>         (fdo#112306
>         <https://bugs.freedesktop.org/show_bug.cgi?id=112306>) +1
>         similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb8/igt@gen9_exec_parse@basic-rejected.html>
>         (fdo#112306
>         <https://bugs.freedesktop.org/show_bug.cgi?id=112306>) +1
>         similar issue
> 
>   *
> 
>     igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-hsw1/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +85
>         similar issues
>   *
> 
>     igt@i915_pm_rpm@dpms-lpsp:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl4/igt@i915_pm_rpm@dpms-lpsp.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +32
>         similar issues
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         (i915#1769 <https://gitlab.freedesktop.org/drm/intel/issues/1769>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         (i915#1769 <https://gitlab.freedesktop.org/drm/intel/issues/1769>)
> 
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +3
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>         (fdo#110723
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_chamelium@common-hpd-after-suspend:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-hsw4/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-a-ctm-0-5:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-0-5.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk4/igt@kms_color_chamelium@pipe-a-ctm-0-5.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +4
>         similar issues
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-5.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
> 
>   *
> 
>     igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>
>         / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o
> 
>         shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl1/igt@kms_content_protection@atomic.html>
>         (i915#1319 <https://gitlab.freedesktop.org/drm/intel/issues/1319>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb8/igt@kms_content_protection@atomic.html>
>         (fdo#109300
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109300> /
>         fdo#111066 <https://bugs.freedesktop.org/show_bug.cgi?id=111066>)
> 
>       o
> 
>         shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-apl4/igt@kms_content_protection@atomic.html>
>         (i915#1319 <https://gitlab.freedesktop.org/drm/intel/issues/1319>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb2/igt@kms_content_protection@atomic.html>
>         (fdo#111828 <https://bugs.freedesktop.org/show_bug.cgi?id=111828>)
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html>
>         (i915#155 <https://gitlab.freedesktop.org/drm/intel/issues/155>
>         / i915#2295 <https://gitlab.freedesktop.org/drm/intel/issues/2295>)
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html>
>         (fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279>)
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-apl4/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +32
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +5
>         similar issues
> 
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>   *
> 
>     igt@kms_cursor_legacy@pipe-d-torture-bo:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl2/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / [i915#533])
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-apl2/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / [i915#533])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk9/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / [i915#533])
> 
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +3
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +15
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +6
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +34
>         similar issues
>   *
> 
>     igt@kms_invalid_dotclock:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb8/igt@kms_invalid_dotclock.html>
>         (fdo#110577 <https://bugs.freedesktop.org/show_bug.cgi?id=110577>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
> 
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / [i915#658])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / [i915#658])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
>         ([i915#658])
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / [i915#658])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
>         ([i915#2920])
> 
>   *
> 
>     igt@kms_psr@psr2_cursor_render:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb2/igt@kms_psr@psr2_cursor_render.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb6/igt@kms_psr@psr2_cursor_render.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +2
>         similar issues
>   *
> 
>     igt@kms_psr@psr2_sprite_plane_onoff:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb8/igt@kms_psr@psr2_sprite_plane_onoff.html>
>         (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>   *
> 
>     igt@kms_vblank@pipe-a-accuracy-idle:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-glk9/igt@kms_vblank@pipe-a-accuracy-idle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk6/igt@kms_vblank@pipe-a-accuracy-idle.html>
>         ([i915#43])
>   *
> 
>     igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb8/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html>
>         (fdo#109291
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109291>) +1
>         similar issue
>   *
> 
>     igt@prime_nv_test@i915_import_gtt_mmap:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb1/igt@prime_nv_test@i915_import_gtt_mmap.html>
>         (fdo#109291
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109291>) +2
>         similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o
> 
>         shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-kbl3/igt@gem_exec_fair@basic-deadline.html>
>         ([i915#2846]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl2/igt@gem_exec_fair@basic-deadline.html>
> 
>       o
> 
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-glk6/igt@gem_exec_fair@basic-deadline.html>
>         ([i915#2846]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk6/igt@gem_exec_fair@basic-deadline.html>
> 
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2849]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html>
>   *
> 
>     igt@gem_exec_reloc@basic-many-active@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>         (i915#2389
>         <https://gitlab.freedesktop.org/drm/intel/issues/2389>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>   *
> 
>     igt@gem_userptr_blits@huge-split:
> 
>       o shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-glk7/igt@gem_userptr_blits@huge-split.html>
>         (i915#2502
>         <https://gitlab.freedesktop.org/drm/intel/issues/2502>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk6/igt@gem_userptr_blits@huge-split.html>
>   *
> 
>     igt@i915_pm_dc@dc5-psr:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-tglb8/igt@i915_pm_dc@dc5-psr.html>
>         (i915#2745
>         <https://gitlab.freedesktop.org/drm/intel/issues/2745>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb5/igt@i915_pm_dc@dc5-psr.html>
>   *
> 
>     igt@i915_pm_dc@dc6-psr:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb4/igt@i915_pm_dc@dc6-psr.html>
>         ([i915#454]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb5/igt@i915_pm_dc@dc6-psr.html>
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-hsw: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-hsw2/igt@i915_selftest@live@hangcheck.html>
>         (i915#2782
>         <https://gitlab.freedesktop.org/drm/intel/issues/2782>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-hsw1/igt@i915_selftest@live@hangcheck.html>
>   *
> 
>     igt@i915_suspend@fence-restore-untiled:
> 
>       o shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-tglb5/igt@i915_suspend@fence-restore-untiled.html>
>         (i915#1436
>         <https://gitlab.freedesktop.org/drm/intel/issues/1436> /
>         i915#1602 <https://gitlab.freedesktop.org/drm/intel/issues/1602>
>         / i915#1887
>         <https://gitlab.freedesktop.org/drm/intel/issues/1887> /
>         i915#2411
>         <https://gitlab.freedesktop.org/drm/intel/issues/2411>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb5/igt@i915_suspend@fence-restore-untiled.html>
>   *
> 
>     igt@kms_async_flips@test-time-stamp:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-tglb5/igt@kms_async_flips@test-time-stamp.html>
>         (i915#2597
>         <https://gitlab.freedesktop.org/drm/intel/issues/2597>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-tglb1/igt@kms_async_flips@test-time-stamp.html>
>   *
> 
>     igt@kms_color@pipe-c-legacy-gamma-reset:
> 
>       o shard-hsw: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-hsw6/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         ([i915#2964]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-hsw4/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>       o shard-hsw: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         ([i915#96]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>   *
> 
>     igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-kbl7/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html>
>         ([i915#95]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl7/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
> 
>       o shard-hsw: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html>
>         (i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html>
>         ([i915#49]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html>
>   *
> 
>     igt@kms_psr@psr2_cursor_mmap_cpu:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>         +2 similar issues
>   *
> 
>     igt@perf@polling-parameterized:
> 
>       o
> 
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-glk7/igt@perf@polling-parameterized.html>
>         (i915#1542
>         <https://gitlab.freedesktop.org/drm/intel/issues/1542>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-glk8/igt@perf@polling-parameterized.html>
> 
>       o
> 
>         shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb4/igt@perf@polling-parameterized.html>
>         (i915#1542
>         <https://gitlab.freedesktop.org/drm/intel/issues/1542>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb3/igt@perf@polling-parameterized.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2852]) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs1:
> 
>       o shard-kbl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-fence:
> 
>       o shard-iclb: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html>
>         (i915#1804
>         <https://gitlab.freedesktop.org/drm/intel/issues/1804> /
>         i915#2684
>         <https://gitlab.freedesktop.org/drm/intel/issues/2684>) -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html>
>         (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle:
> 
>       o shard-iclb: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html>
>         (i915#1804
>         <https://gitlab.freedesktop.org/drm/intel/issues/1804> /
>         i915#2684
>         <https://gitlab.freedesktop.org/drm/intel/issues/2684>) -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681> /
>         i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         ([i915#2920]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb3/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         ([i915#658]) +2 similar issues
>   *
> 
>     igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html>
>         ([i915#658]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html>
>         ([i915#2920]) +1 similar issue
>   *
> 
>     igt@runner@aborted:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9666/shard-kbl2/igt@runner@aborted.html>
>         (i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295>) -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5421/shard-kbl1/igt@runner@aborted.html>)
>         (i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295> /
>         i915#2426 <https://gitlab.freedesktop.org/drm/intel/issues/2426>)
> 
> [i915#28
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
