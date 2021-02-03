Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D1B6EA24
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Feb 2021 09:06:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id p15so23198427wrq.8
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Feb 2021 01:06:38 -0800 (PST)
References: <20210202112717.16481-1-juhapekka.heikkila@gmail.com>
 <161230780231.19550.12477343398930599082@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <d2f5f319-3928-c7f8-1d34-865cdf7af749@gmail.com>
Date: Wed, 3 Feb 2021 11:06:30 +0200
MIME-Version: 1.0
In-Reply-To: <161230780231.19550.12477343398930599082@emeril.freedesktop.org>
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

Hi Laskhmi,

Here are again unrelated regressions, I was again just patching 
kms_rotation_crc and not touch anywhere else.

/Juha-Pekka

On 3.2.2021 1.16, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,1/2] tests/kms_rotation_crc: 
> different display modes can have different crc
> *URL:*	https://patchwork.freedesktop.org/series/86574/
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/index.html
> 
> 
>   CI Bug Log - changes from CI_DRM_9715_full -> IGTPW_5468_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_5468_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5468_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/index.html
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_5468_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@i915_module_load@reload-no-display:
> 
>       o
> 
>         shard-snb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-snb6/igt@i915_module_load@reload-no-display.html>
> 
>       o
> 
>         shard-apl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl3/igt@i915_module_load@reload-no-display.html>
> 
>       o
> 
>         shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk1/igt@i915_module_load@reload-no-display.html>
> 
>       o
> 
>         shard-tglb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb6/igt@i915_module_load@reload-no-display.html>
> 
>       o
> 
>         shard-hsw: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw4/igt@i915_module_load@reload-no-display.html>
> 
>       o
> 
>         shard-kbl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl1/igt@i915_module_load@reload-no-display.html>
> 
>   *
> 
>     igt@i915_selftest@live:
> 
>       o
> 
>         shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-snb2/igt@i915_selftest@live.html>
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl2/igt@i915_selftest@live.html>
> 
>       o
> 
>         shard-hsw: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw1/igt@i915_selftest@live.html>
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk7/igt@i915_selftest@live.html>
> 
>       o
> 
>         shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb8/igt@i915_selftest@live.html>
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl7/igt@i915_selftest@live.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     {igt@gem_ctx_persistence@many-contexts}:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-iclb6/igt@gem_ctx_persistence@many-contexts.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb5/igt@gem_ctx_persistence@many-contexts.html>
>   *
> 
>     {igt@sysfs_clients@recycle-many}:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-apl4/igt@sysfs_clients@recycle-many.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl2/igt@sysfs_clients@recycle-many.html>
> 
>       o
> 
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-tglb5/igt@sysfs_clients@recycle-many.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb3/igt@sysfs_clients@recycle-many.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_5468_full that come from known issues:
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
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb5/igt@gem_ctx_param@set-priority-not-supported.html>
>         ([fdo#109314])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb4/igt@gem_ctx_param@set-priority-not-supported.html>
>         ([fdo#109314])
> 
>   *
> 
>     igt@gem_ctx_persistence@engines-mixed:
> 
>       o
> 
>         shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw6/igt@gem_ctx_persistence@engines-mixed.html>
>         ([fdo#109271] / [i915#1099])
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-snb2/igt@gem_ctx_persistence@engines-mixed.html>
>         ([fdo#109271] / [i915#1099])
> 
>   *
> 
>     igt@gem_ctx_sseu@invalid-args:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb3/igt@gem_ctx_sseu@invalid-args.html>
>         ([i915#280])
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl6/igt@gem_exec_fair@basic-deadline.html>
>         ([i915#2846])
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk4/igt@gem_exec_fair@basic-deadline.html>
>         ([i915#2846])
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl2/igt@gem_exec_fair@basic-deadline.html>
>         ([i915#2846])
> 
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>       o
> 
>         shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2842]) +1 similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2842])
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2842])
> 
>   *
> 
>     igt@gem_exec_fair@basic-none@vecs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_params@no-blt:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb2/igt@gem_exec_params@no-blt.html>
>         ([fdo#109283])
>   *
> 
>     igt@gem_exec_schedule@u-fairslice@vcs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-apl2/igt@gem_exec_schedule@u-fairslice@vcs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl4/igt@gem_exec_schedule@u-fairslice@vcs0.html>
>         ([i915#1610])
>   *
> 
>     igt@gem_exec_whisper@basic-contexts-priority-all:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw4/igt@gem_exec_whisper@basic-contexts-priority-all.html>
>         ([fdo#109271]) +150 similar issues
>   *
> 
>     igt@gem_mmap_gtt@coherency:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb5/igt@gem_mmap_gtt@coherency.html>
>         ([fdo#111656])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb7/igt@gem_mmap_gtt@coherency.html>
>         ([fdo#109292])
> 
>   *
> 
>     igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html>
>         ([fdo#109271]) +135 similar issues
>   *
> 
>     igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html>
>         ([i915#768])
>   *
> 
>     igt@gen3_render_linear_blits:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb7/igt@gen3_render_linear_blits.html>
>         ([fdo#109289]) +4 similar issues
>   *
> 
>     igt@gen7_exec_parse@oacontrol-tracking:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb7/igt@gen7_exec_parse@oacontrol-tracking.html>
>         ([fdo#109289]) +4 similar issues
>   *
> 
>     igt@gen9_exec_parse@allowed-all:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb8/igt@gen9_exec_parse@allowed-all.html>
>         ([fdo#112306]) +1 similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb3/igt@gen9_exec_parse@allowed-all.html>
>         ([fdo#112306]) +1 similar issue
> 
>   *
> 
>     igt@gen9_exec_parse@bb-oversize:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb8/igt@gen9_exec_parse@bb-oversize.html>
>         ([i915#2527])
>   *
> 
>     igt@i915_module_load@reload-no-display:
> 
>       o shard-iclb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb6/igt@i915_module_load@reload-no-display.html>
>         ([i915#1895])
>   *
> 
>     igt@i915_pm_backlight@bad-brightness:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk7/igt@i915_pm_backlight@bad-brightness.html>
>         ([fdo#109271]) +96 similar issues
>   *
> 
>     igt@i915_pm_backlight@fade_with_suspend:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw4/igt@i915_pm_backlight@fade_with_suspend.html>
>         ([fdo#109271] / [i915#3012])
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html>
>         ([i915#454])
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html>
>         ([i915#454])
> 
>   *
> 
>     igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>         ([fdo#110892])
>   *
> 
>     igt@i915_pm_rpm@pc8-residency:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb8/igt@i915_pm_rpm@pc8-residency.html>
>         ([fdo#109293] / [fdo#109506])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb7/igt@i915_pm_rpm@pc8-residency.html>
>         ([fdo#109506] / [i915#2411])
> 
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb2/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>         ([fdo#110725] / [fdo#111614]) +3 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>         ([fdo#111614]) +4 similar issues
>   *
> 
>     igt@kms_big_joiner@basic:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb5/igt@kms_big_joiner@basic.html>
>         ([i915#2705])
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl6/igt@kms_big_joiner@basic.html>
>         ([fdo#109271] / [i915#2705])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb7/igt@kms_big_joiner@basic.html>
>         ([i915#2705])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk8/igt@kms_big_joiner@basic.html>
>         ([fdo#109271] / [i915#2705])
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl4/igt@kms_big_joiner@basic.html>
>         ([fdo#109271] / [i915#2705])
> 
>   *
> 
>     igt@kms_ccs@pipe-d-ccs-on-another-bo:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb3/igt@kms_ccs@pipe-d-ccs-on-another-bo.html>
>         ([fdo#109278]) +18 similar issues
>   *
> 
>     igt@kms_chamelium@common-hpd-after-suspend:
> 
>       o
> 
>         shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw6/igt@kms_chamelium@common-hpd-after-suspend.html>
>         ([fdo#109271] / [fdo#111827]) +13 similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk2/igt@kms_chamelium@common-hpd-after-suspend.html>
>         ([fdo#109271] / [fdo#111827]) +15 similar issues
> 
>   *
> 
>     igt@kms_chamelium@hdmi-edid-change-during-suspend:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html>
>         ([fdo#109271] / [fdo#111827]) +15 similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-storm:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html>
>         ([fdo#109271] / [fdo#111827]) +20 similar issues
>   *
> 
>     igt@kms_chamelium@vga-hpd:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb3/igt@kms_chamelium@vga-hpd.html>
>         ([fdo#109284] / [fdo#111827]) +16 similar issues
>   *
> 
>     igt@kms_chamelium@vga-hpd-with-enabled-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb3/igt@kms_chamelium@vga-hpd-with-enabled-mode.html>
>         ([fdo#109284] / [fdo#111827]) +15 similar issues
>   *
> 
>     igt@kms_color@pipe-a-ctm-0-25:
> 
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb1/igt@kms_color@pipe-a-ctm-0-25.html>
>         ([i915#1149] / [i915#315]) +1 similar issue
>   *
> 
>     igt@kms_color@pipe-c-ctm-0-75:
> 
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb3/igt@kms_color@pipe-c-ctm-0-75.html>
>         ([i915#1149] / [i915#315]) +2 similar issues
>   *
> 
>     igt@kms_color@pipe-c-legacy-gamma-reset:
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-kbl6/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl2/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         ([i915#2964])
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-apl7/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl1/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         ([i915#2964])
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-glk7/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk3/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         ([i915#2964])
> 
>       o
> 
>         shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-hsw8/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw4/igt@kms_color@pipe-c-legacy-gamma-reset.html>
>         ([i915#2964])
> 
>   *
> 
>     igt@kms_color@pipe-d-ctm-0-25:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb7/igt@kms_color@pipe-d-ctm-0-25.html>
>         ([fdo#109278] / [i915#1149]) +1 similar issue
>   *
> 
>     igt@kms_color@pipe-d-degamma:
> 
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb5/igt@kms_color@pipe-d-degamma.html>
>         ([i915#1149])
>   *
> 
>     igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html>
>         ([fdo#109271] / [fdo#111827]) +13 similar issues
>   *
> 
>     igt@kms_content_protection@lic:
> 
>       o
> 
>         shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl4/igt@kms_content_protection@lic.html>
>         ([i915#1319])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb3/igt@kms_content_protection@lic.html>
>         ([fdo#111828])
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html>
>         ([fdo#109279]) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html>
>         ([fdo#109278] / [fdo#109279])
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding:
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html>
>         ([i915#54])
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html>
>         ([i915#54])
> 
>   *
> 
>     igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html>
>         ([fdo#109271]) +200 similar issues
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         ([fdo#109274] / [fdo#109278]) +6 similar issues
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         ([i915#96])
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         ([i915#2370])
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html>
>         ([fdo#111825]) +55 similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>         ([i915#2346])
>   *
> 
>     igt@kms_cursor_legacy@pipe-b-single-move:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-glk9/igt@kms_cursor_legacy@pipe-b-single-move.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk8/igt@kms_cursor_legacy@pipe-b-single-move.html>
>         ([i915#118] / [i915#95]) +2 similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb8/igt@kms_flip@2x-flip-vs-dpms.html>
>         ([fdo#109274]) +7 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         ([i915#2641])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         ([i915#2587])
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         ([i915#2628])
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         ([i915#2641])
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html>
>         ([i915#2546]) +2 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         ([i915#49])
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         ([i915#49])
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html>
>         ([fdo#109280]) +24 similar issues
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb7/igt@kms_hdr@static-swap.html>
>         ([i915#1187])
>   *
> 
>     igt@kms_hdr@static-toggle-dpms:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb8/igt@kms_hdr@static-toggle-dpms.html>
>         ([i915#1187]) +1 similar issue
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#1839]) +1 similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#1839]) +1 similar issue
> 
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
>         ([i915#180]) +5 similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
> 
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html>
>         ([i915#180])
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>         ([fdo#108145] / [i915#265])
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>         ([fdo#108145] / [i915#265])
> 
>   *
> 
>     igt@kms_plane_cursor@pipe-d-overlay-size-256:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw8/igt@kms_plane_cursor@pipe-d-overlay-size-256.html>
>         ([fdo#109271] / [i915#533]) +16 similar issues
>   *
> 
>     igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html>
>         ([fdo#111615]) +2 similar issues
>   *
> 
>     igt@kms_prime@basic-crc@first-to-second:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb6/igt@kms_prime@basic-crc@first-to-second.html>
>         ([i915#1836])
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb8/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         ([i915#2920]) +3 similar issues
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>         ([fdo#109271] / [i915#658]) +2 similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>         ([fdo#109271] / [i915#658]) +2 similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>         ([i915#658])
> 
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html>
>         ([fdo#109271] / [i915#658]) +3 similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html>
>         ([i915#2920])
> 
>   *
> 
>     igt@kms_psr@primary_render:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-hsw6/igt@kms_psr@primary_render.html>
>         ([fdo#109271] / [i915#1072]) +5 similar issues
>   *
> 
>     igt@kms_psr@psr2_no_drrs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb8/igt@kms_psr@psr2_no_drrs.html>
>         ([fdo#109441]) +3 similar issues
>   *
> 
>     igt@kms_psr@psr2_sprite_plane_move:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html>
>         ([fdo#109441]) +2 similar issues
>   *
> 
>     igt@kms_vblank@pipe-a-ts-continuation-suspend:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>         ([i915#180] / [i915#295])
>   *
> 
>     igt@kms_vblank@pipe-d-wait-idle:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl6/igt@kms_vblank@pipe-d-wait-idle.html>
>         ([fdo#109271] / [i915#533]) +2 similar issues
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html>
>         ([fdo#109271] / [i915#533]) +1 similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-glk9/igt@kms_vblank@pipe-d-wait-idle.html>
>         ([fdo#109271] / [i915#533]) +1 similar issue
> 
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-kbl4/igt@kms_writeback@writeback-fb-id.html>
>         ([fdo#109271] / [i915#2437])
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-tglb3/igt@kms_writeback@writeback-pixel-formats.html>
>         ([i915#2437])
>   *
> 
>     igt@nouveau_crc@pipe-b-source-rg:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5468/shard-iclb4/igt@nouveau_crc@pipe-b-source-rg.html>
>         ([i915#2530]) +1 similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> [SKIP][142] ([i915#2530]) +2 simila
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
