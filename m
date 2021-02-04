Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1516ECEC
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Feb 2021 08:01:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id l12so2259477wmq.2
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Feb 2021 00:01:20 -0800 (PST)
References: <20210203162503.9544-1-juhapekka.heikkila@gmail.com>
 <161238953961.944.8365220438112013122@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <ef230388-f016-61ce-0810-b09a10beca47@gmail.com>
Date: Thu, 4 Feb 2021 10:01:12 +0200
MIME-Version: 1.0
In-Reply-To: <161238953961.944.8365220438112013122@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Iga21zX3Jv?=
 =?utf-8?q?tation=5Fcrc_fix_and_optimization?=
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

I'm again patching rotation crc test and get unrelated failure with 
kms_pipe_crc_basic

/Juha-Pekka

On 3.2.2021 23.58, Patchwork wrote:
> *Patch Details*
> *Series:*	kms_rotation_crc fix and optimization
> *URL:*	https://patchwork.freedesktop.org/series/86655/
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/index.html
> 
> 
>   CI Bug Log - changes from CI_DRM_9725_full -> IGTPW_5472_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_5472_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5472_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/index.html
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_5472_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     {igt@sysfs_clients@recycle-many}:
> 
>       o
> 
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-tglb2/igt@sysfs_clients@recycle-many.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb5/igt@sysfs_clients@recycle-many.html>
> 
>       o
> 
>         shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-snb5/igt@sysfs_clients@recycle-many.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-snb4/igt@sysfs_clients@recycle-many.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_5472_full that come from known issues:
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
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb1/igt@gem_ctx_param@set-priority-not-supported.html>
>         ([fdo#109314])
>   *
> 
>     igt@gem_ctx_persistence@clone:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-snb5/igt@gem_ctx_persistence@clone.html>
>         ([fdo#109271] / [i915#1099])
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-cleanup:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-hsw7/igt@gem_ctx_persistence@legacy-engines-cleanup.html>
>         ([fdo#109271] / [i915#1099]) +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-apl3/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         ([fdo#109271])
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         ([i915#2842]) +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2849])
>   *
> 
>     igt@gem_exec_params@no-vebox:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb1/igt@gem_exec_params@no-vebox.html>
>         ([fdo#109283])
>   *
> 
>     igt@gem_exec_whisper@basic-fds-forked-all:
> 
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk4/igt@gem_exec_whisper@basic-fds-forked-all.html>
>         ([i915#118] / [i915#95])
>   *
> 
>     igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html>
>         ([i915#768]) +3 similar issues
>   *
> 
>     igt@gem_userptr_blits@process-exit-mmap-busy@uc:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl2/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html>
>         ([fdo#109271] / [i915#1699]) +3 similar issues
>   *
> 
>     igt@gem_userptr_blits@vma-merge:
> 
>       o
> 
>         shard-apl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl2/igt@gem_userptr_blits@vma-merge.html>
>         ([i915#2502] / [i915#2667])
> 
>       o
> 
>         shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk7/igt@gem_userptr_blits@vma-merge.html>
>         ([i915#2502] / [i915#2667])
> 
>   *
> 
>     igt@gem_vm_create@destroy-race:
> 
>       o shard-tglb: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb5/igt@gem_vm_create@destroy-race.html>
>         ([i915#2795])
>   *
> 
>     igt@gen3_render_mixed_blits:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb2/igt@gen3_render_mixed_blits.html>
>         ([fdo#109289]) +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@allowed-all:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb7/igt@gen9_exec_parse@allowed-all.html>
>         ([fdo#112306]) +2 similar issues
>   *
> 
>     igt@gen9_exec_parse@bb-start-param:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb7/igt@gen9_exec_parse@bb-start-param.html>
>         ([fdo#112306]) +3 similar issues
>   *
> 
>     igt@gen9_exec_parse@shadow-peek:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb8/igt@gen9_exec_parse@shadow-peek.html>
>         ([i915#2856])
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html>
>         ([i915#454])
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-fence:
> 
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html>
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html>
>         ([i915#1519])
>   *
> 
>     igt@i915_pm_rpm@dpms-non-lpsp:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         ([fdo#110892])
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>         ([fdo#111644] / [i915#1397] / [i915#2411])
>   *
> 
>     igt@i915_query@query-topology-unsupported:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb8/igt@i915_query@query-topology-unsupported.html>
>         ([fdo#109302])
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         ([i915#404])
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb8/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         ([fdo#110725] / [fdo#111614])
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         ([fdo#111614])
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>         ([fdo#110723])
>   *
> 
>     igt@kms_big_joiner@basic:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl7/igt@kms_big_joiner@basic.html>
>         ([fdo#109271] / [i915#2705])
>   *
> 
>     igt@kms_chamelium@dp-edid-change-during-suspend:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl2/igt@kms_chamelium@dp-edid-change-during-suspend.html>
>         ([fdo#109271] / [fdo#111827]) +11 similar issues
>   *
> 
>     igt@kms_chamelium@dp-hpd-storm:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.html>
>         ([fdo#109284] / [fdo#111827]) +7 similar issues
>   *
> 
>     igt@kms_chamelium@dp-hpd-with-enabled-mode:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk7/igt@kms_chamelium@dp-hpd-with-enabled-mode.html>
>         ([fdo#109271] / [fdo#111827]) +4 similar issues
>   *
> 
>     igt@kms_chamelium@vga-hpd-for-each-pipe:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html>
>         ([fdo#109271] / [fdo#111827]) +21 similar issues
>   *
> 
>     igt@kms_color@pipe-c-ctm-0-25:
> 
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb5/igt@kms_color@pipe-c-ctm-0-25.html>
>         ([i915#1149] / [i915#315])
>   *
> 
>     igt@kms_color@pipe-c-legacy-gamma-reset:
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-kbl7/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl7/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         ([i915#2964])
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-apl3/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl2/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         ([i915#2964])
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-glk8/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk4/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         ([i915#2964])
> 
>       o
> 
>         shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-hsw6/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-hsw4/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         ([i915#2964])
> 
>   *
> 
>     igt@kms_color@pipe-d-ctm-0-25:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb8/igt@kms_color@pipe-d-ctm-0-25.html>
>         ([fdo#109278] / [i915#1149]) +1 similar issue
>   *
> 
>     igt@kms_color_chamelium@pipe-b-ctm-green-to-red:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-hsw2/igt@kms_color_chamelium@pipe-b-ctm-green-to-red.html>
>         ([fdo#109271] / [fdo#111827]) +3 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-0-5:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-snb4/igt@kms_color_chamelium@pipe-d-ctm-0-5.html>
>         ([fdo#109271] / [fdo#111827]) +1 similar issue
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>         ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html>
>         ([fdo#109284] / [fdo#111827]) +9 similar issues
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl4/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#1319]) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html>
>         ([fdo#109278] / [fdo#109279]) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html>
>         ([fdo#109279]) +2 similar issues
>   *
> 
>     igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb3/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html>
>         ([fdo#109278]) +21 similar issues
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-snb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html>
>         ([fdo#109271]) +49 similar issues
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         ([fdo#109274] / [fdo#109278]) +4 similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         ([i915#2346])
>   *
> 
>     igt@kms_cursor_legacy@pipe-d-torture-bo:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl2/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         ([fdo#109271] / [i915#533]) +2 similar issues
>   *
> 
>     igt@kms_dp_dsc@basic-dsc-enable-dp:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-dp.html>
>         ([fdo#109349])
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-apl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html>
>         ([i915#180])
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         ([i915#2122])
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html>
>         ([fdo#109274]) +2 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html>
>         ([i915#79])
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
> 
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html>
>         ([i915#2295])
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         ([i915#180]) +1 similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         ([i915#2641]) +1 similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>         ([fdo#109271] / [i915#2672])
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>         ([fdo#109271] / [i915#2642])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>         ([fdo#109271] / [i915#2642])
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>         ([fdo#109271] / [i915#2642])
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack.html>
>         ([fdo#111825]) +38 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-hsw7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html>
>         ([fdo#109271]) +57 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html>
>         ([fdo#109271]) +33 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         ([fdo#109280]) +27 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html>
>         ([fdo#109271]) +134 similar issues
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#1839]) +1 similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#1839])
> 
>   *
> 
>     igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html>
>         ([fdo#109289]) +2 similar issues
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>         ([fdo#108145] / [i915#265]) +1 similar issue
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>         ([fdo#108145] / [i915#265]) +1 similar issue
> 
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>         ([i915#265])
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>         ([i915#265])
> 
>   *
> 
>     igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html>
>         ([fdo#112054])
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>         ([i915#2920]) +2 similar issues
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>         ([fdo#109271] / [i915#658]) +5 similar issues
> 
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html>
>         ([fdo#109271] / [i915#658]) +1 similar issue
>   *
> 
>     igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl8/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html>
>         ([fdo#109271] / [i915#658]) +4 similar issues
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html>
>         ([i915#658]) +1 similar issue
>   *
> 
>     igt@kms_psr@cursor_plane_onoff:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl2/igt@kms_psr@cursor_plane_onoff.html>
>         ([fdo#109271]) +189 similar issues
>   *
> 
>     igt@kms_psr@primary_page_flip:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-hsw6/igt@kms_psr@primary_page_flip.html>
>         ([fdo#109271] / [i915#1072]) +1 similar issue
>   *
> 
>     igt@kms_psr@psr2_cursor_render:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-iclb2/igt@kms_psr@psr2_cursor_render.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb8/igt@kms_psr@psr2_cursor_render.html>
>         ([fdo#109441]) +1 similar issue
>   *
> 
>     igt@kms_psr@psr2_sprite_plane_move:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html>
>         ([fdo#109441]) +2 similar issues
>   *
> 
>     igt@kms_rotation_crc@multiplane-rotation:
> 
>       o shard-glk: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk8/igt@kms_rotation_crc@multiplane-rotation.html>
>         ([i915#1280])
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         ([fdo#111615]) +4 similar issues
>   *
> 
>     igt@kms_vblank@pipe-b-ts-continuation-suspend:
> 
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         ([i915#180])
>   *
> 
>     igt@kms_vblank@pipe-d-wait-forked-busy:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-hsw2/igt@kms_vblank@pipe-d-wait-forked-busy.html>
>         ([fdo#109271] / [i915#533]) +6 similar issues
>   *
> 
>     igt@kms_vrr@flip-basic:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb3/igt@kms_vrr@flip-basic.html>
>         ([fdo#109502])
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb3/igt@kms_writeback@writeback-check-output.html>
>         ([i915#2437])
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl4/igt@kms_writeback@writeback-invalid-parameters.html>
>         ([fdo#109271] / [i915#2437])
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl2/igt@kms_writeback@writeback-pixel-formats.html>
>         ([fdo#109271] / [i915#2437]) +1 similar issue
>   *
> 
>     igt@nouveau_crc@pipe-a-source-rg:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb6/igt@nouveau_crc@pipe-a-source-rg.html>
>         ([i915#2530]) +3 similar issues
>   *
> 
>     igt@nouveau_crc@pipe-c-source-outp-inactive:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-inactive.html>
>         ([i915#2530])
>   *
> 
>     igt@perf@polling-parameterized:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-glk2/igt@perf@polling-parameterized.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk4/igt@perf@polling-parameterized.html>
>         ([i915#1542])
>   *
> 
>     igt@perf_pmu@event-wait@rcs0:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb1/igt@perf_pmu@event-wait@rcs0.html>
>         ([fdo#112283])
>   *
> 
>     igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb7/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html>
>         ([fdo#109291]) +2 similar issues
>   *
> 
>     igt@prime_nv_test@i915_import_pread_pwrite:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-tglb8/igt@prime_nv_test@i915_import_pread_pwrite.html>
>         ([fdo#109291]) +3 similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_ctx_exec@basic-close-race:
> 
>       o shard-iclb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-iclb4/igt@gem_ctx_exec@basic-close-race.html>
>         ([i915#1895]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb4/igt@gem_ctx_exec@basic-close-race.html>
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>       o shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-glk7/igt@gem_ctx_isolation@preservation-s3@rcs0.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html>
>   *
> 
>     {igt@gem_ctx_persistence@many-contexts}:
> 
>       o shard-iclb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-iclb6/igt@gem_ctx_persistence@many-contexts.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb2/igt@gem_ctx_persistence@many-contexts.html>
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none@vecs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9725/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5472/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html>
>   *
> 
>     igt@gem_exec_schedule@u-fairslice@rcs0:
> 
>       o shard-kbl: [DMESG-
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
