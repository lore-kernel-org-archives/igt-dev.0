Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5188E89CAA
 for <igt-dev@lists.freedesktop.org>; Sun, 24 Jan 2021 20:35:38 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a8so14838075lfi.8
 for <igt-dev@lists.freedesktop.org>; Sun, 24 Jan 2021 12:35:38 -0800 (PST)
References: <20210124144002.5741-1-juhapekka.heikkila@gmail.com>
 <161150874782.10312.12555470868320133213@emeril.freedesktop.org>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
Message-ID: <13ad6c18-f5bb-bcc0-e741-98eb22a42de4@gmail.com>
Date: Sun, 24 Jan 2021 22:35:34 +0200
MIME-Version: 1.0
In-Reply-To: <161150874782.10312.12555470868320133213@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=5Fscaled=5Fcrc=3A_try_to_set_mode_to_1080p_during_te?=
 =?utf-8?b?c3QgKHJldjIp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Well, I didn't get lucky with the new patch. Here is again unrelated 
failure, I patch only kms_flip_scaled_crc test and nothing relating to 
i915_hangman.

/Juha-Pekka

Patchwork kirjoitti 24.1.2021 klo 19.19:
> *Patch Details*
> *Series:*	tests/kms_flip_scaled_crc: try to set mode to 1080p during 
> test (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/86166/
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/index.html
> 
> 
>   CI Bug Log - changes from CI_DRM_9675_full -> IGTPW_5426_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_5426_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5426_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/index.html
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_5426_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_hangman@engine-hang@rcs0:
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-tglb5/igt@i915_hangman@engine-hang@rcs0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb5/igt@i915_hangman@engine-hang@rcs0.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     {igt@sysfs_clients@fair-0}:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb8/igt@sysfs_clients@fair-0.html>
>         +2 similar issues
>   *
> 
>     {igt@sysfs_clients@fair-7}:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb3/igt@sysfs_clients@fair-7.html>
>         +2 similar issues
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_5426_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@core_hotunplug@unbind-rebind:
> 
>       o shard-hsw: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-hsw4/igt@core_hotunplug@unbind-rebind.html>
>         (i915#2283 <https://gitlab.freedesktop.org/drm/intel/issues/2283>)
>   *
> 
>     igt@gem_ctx_param@set-priority-not-supported:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb6/igt@gem_ctx_param@set-priority-not-supported.html>
>         (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb3/igt@gem_ctx_param@set-priority-not-supported.html>
>         (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
> 
>   *
> 
>     igt@gem_ctx_persistence@idempotent:
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-snb7/igt@gem_ctx_persistence@idempotent.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099
>         <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +1
>         similar issue
> 
>       o
> 
>         shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-hsw4/igt@gem_ctx_persistence@idempotent.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099
>         <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +1
>         similar issue
> 
>   *
> 
>     igt@gem_ctx_sseu@engines:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb5/igt@gem_ctx_sseu@engines.html>
>         (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>)
>   *
> 
>     igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_media_vme:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb7/igt@gem_media_vme.html>
>         (i915#284 <https://gitlab.freedesktop.org/drm/intel/issues/284>)
>   *
> 
>     igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html>
>         (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>         +1 similar issue
>   *
> 
>     igt@gem_userptr_blits@coherency-unsync:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb6/igt@gem_userptr_blits@coherency-unsync.html>
>         (fdo#110542
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110542>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb3/igt@gem_userptr_blits@coherency-unsync.html>
>         (fdo#109290
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109290>) +1
>         similar issue
> 
>   *
> 
>     igt@gen3_render_tiledy_blits:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb6/igt@gen3_render_tiledy_blits.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +2
>         similar issues
>   *
> 
>     igt@gen9_exec_parse@bb-start-out:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html>
>         (fdo#112306
>         <https://bugs.freedesktop.org/show_bug.cgi?id=112306>) +2
>         similar issues
>   *
> 
>     igt@gen9_exec_parse@unaligned-access:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb7/igt@gen9_exec_parse@unaligned-access.html>
>         (fdo#112306
>         <https://bugs.freedesktop.org/show_bug.cgi?id=112306>) +2
>         similar issues
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-fence:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html>
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681> /
>         i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb2/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb6/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         (fdo#110725
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>         fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
> 
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-storm:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +10
>         similar issues
> 
>       o
> 
>         shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-hsw6/igt@kms_chamelium@hdmi-hpd-storm.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +6
>         similar issues
> 
>   *
> 
>     igt@kms_chamelium@vga-hpd-with-enabled-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb6/igt@kms_chamelium@vga-hpd-with-enabled-mode.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
>   *
> 
>     igt@kms_color@pipe-b-legacy-gamma-reset:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-apl1/igt@kms_color@pipe-b-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-apl1/igt@kms_color@pipe-b-legacy-gamma-reset.html>
>         (i915#2964 <https://gitlab.freedesktop.org/drm/intel/issues/2964>)
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-kbl1/igt@kms_color@pipe-b-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-kbl1/igt@kms_color@pipe-b-legacy-gamma-reset.html>
>         (i915#2964 <https://gitlab.freedesktop.org/drm/intel/issues/2964>)
> 
>   *
> 
>     igt@kms_color@pipe-d-ctm-green-to-red:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb2/igt@kms_color@pipe-d-ctm-green-to-red.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#1149
>         <https://gitlab.freedesktop.org/drm/intel/issues/1149>) +1
>         similar issue
>   *
> 
>     igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +6
>         similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-glk4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-apl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>
>         / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@kms_content_protection@content_type_change:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb8/igt@kms_content_protection@content_type_change.html>
>         (fdo#109300
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109300> /
>         fdo#111066
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111066>) +1
>         similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb7/igt@kms_content_protection@content_type_change.html>
>         (fdo#111828
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111828>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109279
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109279>) +3
>         similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html>
>         (fdo#109279
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109279>) +3
>         similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html>
>         (i915#54 <https://gitlab.freedesktop.org/drm/intel/issues/54>)
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html>
>         (i915#54 <https://gitlab.freedesktop.org/drm/intel/issues/54>)
> 
>   *
> 
>     igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-snb4/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +105
>         similar issues
>   *
> 
>     igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb1/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +14
>         similar issues
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (i915#96 <https://gitlab.freedesktop.org/drm/intel/issues/96>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +1
>         similar issue
>   *
> 
>     igt@kms_cursor_legacy@pipe-d-torture-bo:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-kbl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>) +1
>         similar issue
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-apl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>) +1
>         similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-glk9/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>       o
> 
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         (i915#2598 <https://gitlab.freedesktop.org/drm/intel/issues/2598>)
> 
>       o
> 
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
> 
>   *
> 
>     igt@kms_flip_tiling@flip-yf-tiled:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb6/igt@kms_flip_tiling@flip-yf-tiled.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +3
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +19
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-apl6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +83
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html>
>         (i915#49 <https://gitlab.freedesktop.org/drm/intel/issues/49>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +24
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +69
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-hsw2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +91
>         similar issues
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +3
>         similar issues
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) +1
>         similar issue
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2
>         similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-glk6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2
>         similar issues
> 
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         +2 similar issues
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-kbl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2
>         similar issues
> 
>   *
> 
>     igt@kms_psr@psr2_cursor_blt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
>   *
> 
>     igt@kms_psr@psr2_cursor_mmap_cpu:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +2
>         similar issues
>   *
> 
>     igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-kbl1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +122
>         similar issues
>   *
> 
>     igt@nouveau_crc@pipe-a-ctx-flip-detection:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb2/igt@nouveau_crc@pipe-a-ctx-flip-detection.html>
>         (i915#2530
>         <https://gitlab.freedesktop.org/drm/intel/issues/2530>) +1
>         similar issue
>   *
> 
>     igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb1/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html>
>         (i915#2530
>         <https://gitlab.freedesktop.org/drm/intel/issues/2530>) +1
>         similar issue
>   *
> 
>     igt@perf@unprivileged-single-ctx-counters:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb3/igt@perf@unprivileged-single-ctx-counters.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +1
>         similar issue
>   *
> 
>     igt@prime_nv_test@i915_import_gtt_mmap:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb6/igt@prime_nv_test@i915_import_gtt_mmap.html>
>         (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@bcs0:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs1:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o
> 
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html>
> 
>       o
> 
>         shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         (i915#2849
>         <https://gitlab.freedesktop.org/drm/intel/issues/2849>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html>
> 
>   *
> 
>     igt@gem_exec_whisper@basic-forked:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-glk1/igt@gem_exec_whisper@basic-forked.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>
>         / i915#95 <https://gitlab.freedesktop.org/drm/intel/issues/95>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-glk7/igt@gem_exec_whisper@basic-forked.html>
>         +1 similar issue
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-tglb6/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190
>         <https://gitlab.freedesktop.org/drm/intel/issues/2190>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-tglb2/igt@gem_huc_copy@huc-copy.html>
>   *
> 
>     igt@kms_color@pipe-c-legacy-gamma-reset:
> 
>       o
> 
>         shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-kbl2/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         (i915#2964
>         <https://gitlab.freedesktop.org/drm/intel/issues/2964>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-kbl2/igt@kms_color@pipe-c-legacy-gamma-reset.html>
> 
>       o
> 
>         shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-apl7/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         (i915#2964
>         <https://gitlab.freedesktop.org/drm/intel/issues/2964>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-apl3/igt@kms_color@pipe-c-legacy-gamma-reset.html>
> 
>       o
> 
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-glk2/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         (i915#2964
>         <https://gitlab.freedesktop.org/drm/intel/issues/2964>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-glk6/igt@kms_color@pipe-c-legacy-gamma-reset.html>
> 
>       o
> 
>         shard-hsw: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-hsw2/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         (i915#2964
>         <https://gitlab.freedesktop.org/drm/intel/issues/2964>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-hsw4/igt@kms_color@pipe-c-legacy-gamma-reset.html>
> 
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>       o shard-hsw: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         (i915#2370
>         <https://gitlab.freedesktop.org/drm/intel/issues/2370>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>   *
> 
>     igt@kms_psr2_su@page_flip:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb1/igt@kms_psr2_su@page_flip.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>         / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb2/igt@kms_psr2_su@page_flip.html>
>   *
> 
>     igt@kms_psr@psr2_primary_page_flip:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html>
>         +2 similar issues
> 
> 
>         Warnings
> 
>   *
> 
>     igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#588 <https://gitlab.freedesktop.org/drm/intel/issues/588>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle:
> 
>       o shard-iclb: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html>
>         (i915#2684
>         <https://gitlab.freedesktop.org/drm/intel/issues/2684>) -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html>
>         (i915#1804
>         <https://gitlab.freedesktop.org/drm/intel/issues/1804> /
>         i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>   *
> 
>     igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9675/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         +2 similar issues
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Participating hosts (10 -> 8)
> 
> Missing (2): pig-skl-6260u pig-glk-j5005
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5968 -> IGTPW_5426
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_9675: f84d1efce492ef0f46cf4fa1bf01b17ce1627fe4 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_5426: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5426/index.html
> IGT_5968: 267fa33c0947fbbb642098098ff6e5902f9a3d94 @ 
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
