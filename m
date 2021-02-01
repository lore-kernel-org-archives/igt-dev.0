Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159E26E887
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Feb 2021 22:00:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id e15so594016wme.0
 for <igt-dev@lists.freedesktop.org>; Mon, 01 Feb 2021 14:00:34 -0800 (PST)
References: <20210201141436.13831-1-juhapekka.heikkila@gmail.com>
 <161221114520.18682.15041599839416599565@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <6a8ff3ef-899f-47c0-cf62-2246a82811c9@gmail.com>
Date: Tue, 2 Feb 2021 00:00:26 +0200
MIME-Version: 1.0
In-Reply-To: <161221114520.18682.15041599839416599565@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frotation=5Fcrc=3A_?=
 =?utf-8?q?different_display_modes_can_have_different_crc?=
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

I have again unrelated regressions here. I was patching only 
kms_rotation_crc and didn't touch kms_color at all.

/Juha-Pekka

On 1.2.2021 22.25, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,1/2] tests/kms_rotation_crc: 
> different display modes can have different crc
> *URL:*	https://patchwork.freedesktop.org/series/86535/
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/index.html
> 
> 
>   CI Bug Log - changes from IGT_5983_full -> IGTPW_5463_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_5463_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5463_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/index.html
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_5463_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_color@pipe-c-legacy-gamma-reset:
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl7/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl1/igt@kms_color@pipe-c-legacy-gamma-reset.html>
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl2/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl8/igt@kms_color@pipe-c-legacy-gamma-reset.html>
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk6/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk9/igt@kms_color@pipe-c-legacy-gamma-reset.html>
> 
>       o
> 
>         shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-hsw7/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-hsw2/igt@kms_color@pipe-c-legacy-gamma-reset.html>
> 
> 
>         Warnings
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-tglb8/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         ([i915#2842]) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb1/igt@gem_exec_fair@basic-none-solo@rcs0.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_5463_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_exec_fair@basic-flow@rcs0:
> 
>       o
> 
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html>
>         ([i915#2842]) +2 similar issues
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl7/igt@gem_exec_fair@basic-flow@rcs0.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl1/igt@gem_exec_fair@basic-flow@rcs0.html>
>         ([fdo#109271])
> 
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>       o
> 
>         shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2842])
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2842])
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2842])
> 
>   *
> 
>     igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk2/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html>
>         ([i915#2842]) +1 similar issue
>   *
> 
>     igt@gem_exec_schedule@u-fairslice@bcs0:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-tglb2/igt@gem_exec_schedule@u-fairslice@bcs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb8/igt@gem_exec_schedule@u-fairslice@bcs0.html>
>         ([i915#2803])
>   *
> 
>     igt@gem_exec_schedule@u-fairslice@vecs0:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vecs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb6/igt@gem_exec_schedule@u-fairslice@vecs0.html>
>         ([i915#2803])
>   *
> 
>     igt@gem_exec_whisper@basic-fds-all:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk8/igt@gem_exec_whisper@basic-fds-all.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html>
>         ([i915#118] / [i915#95])
>   *
> 
>     igt@gem_render_copy@yf-tiled-to-vebox-linear:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-linear.html>
>         ([i915#768]) +1 similar issue
>   *
> 
>     igt@gen3_render_mixed_blits:
> 
>       o
> 
>         shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-hsw8/igt@gen3_render_mixed_blits.html>
>         ([fdo#109271]) +69 similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb1/igt@gen3_render_mixed_blits.html>
>         ([fdo#109289]) +2 similar issues
> 
>   *
> 
>     igt@gen3_render_tiledy_blits:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb5/igt@gen3_render_tiledy_blits.html>
>         ([fdo#109289]) +2 similar issues
>   *
> 
>     igt@gen9_exec_parse@bb-chained:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb6/igt@gen9_exec_parse@bb-chained.html>
>         ([fdo#112306]) +3 similar issues
>   *
> 
>     igt@gen9_exec_parse@bb-start-out:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb6/igt@gen9_exec_parse@bb-start-out.html>
>         ([fdo#112306]) +3 similar issues
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-hsw7/igt@i915_module_load@reload-with-fault-injection.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#2880])
>   *
> 
>     igt@i915_pm_rpm@dpms-non-lpsp:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp.html>
>         ([fdo#110892]) +1 similar issue
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         ([i915#1769])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         ([i915#1769])
> 
>   *
> 
>     igt@kms_big_joiner@basic:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb2/igt@kms_big_joiner@basic.html>
>         ([i915#2705])
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl2/igt@kms_big_joiner@basic.html>
>         ([fdo#109271] / [i915#2705])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb4/igt@kms_big_joiner@basic.html>
>         ([i915#2705])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk1/igt@kms_big_joiner@basic.html>
>         ([fdo#109271] / [i915#2705])
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl1/igt@kms_big_joiner@basic.html>
>         ([fdo#109271] / [i915#2705])
> 
>   *
> 
>     igt@kms_chamelium@dp-audio-edid:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb1/igt@kms_chamelium@dp-audio-edid.html>
>         ([fdo#109284] / [fdo#111827]) +7 similar issues
>   *
> 
>     igt@kms_chamelium@dp-hpd-with-enabled-mode:
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk2/igt@kms_chamelium@dp-hpd-with-enabled-mode.html>
>         ([fdo#109271] / [fdo#111827]) +8 similar issues
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl2/igt@kms_chamelium@dp-hpd-with-enabled-mode.html>
>         ([fdo#109271] / [fdo#111827]) +7 similar issues
> 
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-storm:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl6/igt@kms_chamelium@hdmi-hpd-storm.html>
>         ([fdo#109271] / [fdo#111827]) +11 similar issues
>   *
> 
>     igt@kms_chamelium@vga-hpd-with-enabled-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb6/igt@kms_chamelium@vga-hpd-with-enabled-mode.html>
>         ([fdo#109284] / [fdo#111827]) +7 similar issues
>   *
> 
>     igt@kms_color@pipe-d-ctm-blue-to-red:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.html>
>         ([fdo#109278] / [i915#1149])
>   *
> 
>     igt@kms_color_chamelium@pipe-c-ctm-limited-range:
> 
>       o
> 
>         shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-hsw6/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html>
>         ([fdo#109271] / [fdo#111827]) +6 similar issues
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html>
>         ([fdo#109271] / [fdo#111827]) +6 similar issues
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding.html>
>         ([fdo#109279])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding.html>
>         ([fdo#109278] / [fdo#109279])
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-dpms:
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-dpms.html>
>         ([i915#54])
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html>
>         ([i915#54])
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html>
>         ([i915#54])
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-d-cursor-256x256-random:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk6/igt@kms_cursor_crc@pipe-d-cursor-256x256-random.html>
>         ([fdo#109271]) +47 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-d-cursor-alpha-transparent:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-hsw7/igt@kms_cursor_crc@pipe-d-cursor-alpha-transparent.html>
>         ([fdo#109271] / [i915#533]) +7 similar issues
>   *
> 
>     igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html>
>         ([fdo#109271]) +93 similar issues
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         ([fdo#109274] / [fdo#109278]) +1 similar issue
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         ([i915#2346])
>   *
> 
>     igt@kms_flip@2x-blocking-wf_vblank:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb8/igt@kms_flip@2x-blocking-wf_vblank.html>
>         ([fdo#109274]) +2 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html>
>         ([i915#79])
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         ([i915#2598])
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-dp1:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html>
>         ([i915#79])
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html>
>         ([i915#79])
> 
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>         ([i915#180]) +5 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html>
>         ([i915#2546]) +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html>
>         ([fdo#109271]) +77 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html>
>         ([fdo#111825]) +17 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html>
>         ([fdo#109271]) +55 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html>
>         ([fdo#109280]) +14 similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>         ([fdo#109271] / [i915#533])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>         ([fdo#109271] / [i915#533])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>         ([fdo#109278]) +6 similar issues
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>         ([fdo#109271] / [i915#533])
> 
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>         ([fdo#108145] / [i915#265])
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>         ([fdo#108145] / [i915#265])
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>         ([fdo#108145] / [i915#265])
> 
>   *
> 
>     igt@kms_plane_multiple@atomic-pipe-c-tiling-x:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk2/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk9/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html>
>         ([i915#1779])
>   *
> 
>     igt@kms_prime@basic-crc@first-to-second:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb6/igt@kms_prime@basic-crc@first-to-second.html>
>         ([i915#1836])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb6/igt@kms_prime@basic-crc@first-to-second.html>
>         ([i915#1836])
> 
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>         ([fdo#109271] / [i915#658]) +2 similar issues
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
>         ([fdo#109271] / [i915#658])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
>         ([i915#2920])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
>         ([i915#658])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
>         ([fdo#109271] / [i915#658])
> 
>   *
> 
>     igt@kms_psr@psr2_basic:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb2/igt@kms_psr@psr2_basic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb7/igt@kms_psr@psr2_basic.html>
>         ([fdo#109441]) +2 similar issues
>   *
> 
>     igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>         ([fdo#109441]) +1 similar issue
>   *
> 
>     igt@kms_psr@psr2_suspend:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-hsw8/igt@kms_psr@psr2_suspend.html>
>         ([fdo#109271] / [i915#1072]) +1 similar issue
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         ([fdo#111615]) +2 similar issues
>   *
> 
>     igt@kms_vrr@flip-dpms:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb2/igt@kms_vrr@flip-dpms.html>
>         ([fdo#109502])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb5/igt@kms_vrr@flip-dpms.html>
>         ([fdo#109502])
> 
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl1/igt@kms_writeback@writeback-check-output.html>
>         ([fdo#109271] / [i915#2437])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb6/igt@kms_writeback@writeback-check-output.html>
>         ([i915#2437])
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl1/igt@kms_writeback@writeback-check-output.html>
>         ([fdo#109271] / [i915#2437])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb5/igt@kms_writeback@writeback-check-output.html>
>         ([i915#2437])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk2/igt@kms_writeback@writeback-check-output.html>
>         ([fdo#109271] / [i915#2437])
> 
>   *
> 
>     igt@nouveau_crc@pipe-a-ctx-flip-detection:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb5/igt@nouveau_crc@pipe-a-ctx-flip-detection.html>
>         ([i915#2530]) +1 similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb6/igt@nouveau_crc@pipe-a-ctx-flip-detection.html>
>         ([i915#2530]) +1 similar issue
> 
>   *
> 
>     igt@nouveau_crc@pipe-d-ctx-flip-detection:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb8/igt@nouveau_crc@pipe-d-ctx-flip-detection.html>
>         ([fdo#109278] / [i915#2530])
>   *
> 
>     igt@perf_pmu@event-wait@rcs0:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb6/igt@perf_pmu@event-wait@rcs0.html>
>         ([fdo#112283])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb6/igt@perf_pmu@event-wait@rcs0.html>
>         ([fdo#112283])
> 
>   *
> 
>     igt@prime_nv_test@i915_import_gtt_mmap:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-tglb7/igt@prime_nv_test@i915_import_gtt_mmap.html>
>         ([fdo#109291]) +1 similar issue
>   *
> 
>     igt@prime_udl:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb7/igt@prime_udl.html>
>         ([fdo#109291]) +1 similar issue
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html>
>         +3 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-many-active@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>         ([i915#2389]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>   *
> 
>     igt@gem_exec_schedule@u-fairslice@rcs0:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl7/igt@gem_exec_schedule@u-fairslice@rcs0.html>
>         ([i915#1610] / [i915#2803]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl1/igt@gem_exec_schedule@u-fairslice@rcs0.html>
>   *
> 
>     igt@gem_exec_schedule@u-fairslice@vecs0:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk7/igt@gem_exec_schedule@u-fairslice@vecs0.html>
>         ([i915#1610] / [i915#2803]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk9/igt@gem_exec_schedule@u-fairslice@vecs0.html>
>   *
> 
>     igt@i915_pm_dc@dc6-psr:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb4/igt@i915_pm_dc@dc6-psr.html>
>         ([i915#454]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb3/igt@i915_pm_dc@dc6-psr.html>
>   *
> 
>     igt@i915_suspend@debugfs-reader:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl8/igt@i915_suspend@debugfs-reader.html>
>         ([i915#180]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl2/igt@i915_suspend@debugfs-reader.html>
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-suspend:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html>
>         ([i915#180]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html>
>         ([i915#79]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html>
>         ([i915#79]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html>
>   *
> 
>     igt@kms_psr@psr2_no_drrs:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb4/igt@kms_psr@psr2_no_drrs.html>
>         ([fdo#109441]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb2/igt@kms_psr@psr2_no_drrs.html>
>         +1 similar issue
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2849]) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2842])
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle:
> 
>       o shard-iclb: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html>
>         ([i915#1804] / [i915#2684]) -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html>
>         ([i915#2684])
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html>
>         ([i915#658]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html>
>         ([i915#2920]) +2 similar issues
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html>
>         ([i915#2920]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5463/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html>
>         ([i915#658])
>   *
> 
>     igt@runner@aborted:
> 
>       o shard-kbl: ([FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150],
>         [FAIL][151]) ([i915#1814] / [i915#2295] / [i91
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
