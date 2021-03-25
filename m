Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F376EB69
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 16:19:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso3438606wmq.1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 09:19:53 -0700 (PDT)
References: <20210324183008.18170-1-juhapekka.heikkila@gmail.com>
 <161668543915.15544.9840782393847043012@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <f1cc3ec4-4f5e-80c4-25a6-6f312a14a3a5@gmail.com>
Date: Thu, 25 Mar 2021 18:19:44 +0200
MIME-Version: 1.0
In-Reply-To: <161668543915.15544.9840782393847043012@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_use_flipping_instead_of_frontbuffer_=28re?=
 =?utf-8?b?djIp?=
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

here would be again few false positives. I was patching only 
kms_cursor_crc and those reported regressions have nothing to do with my 
changes.

/Juha-Pekka

On 25.3.2021 17.17, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_cursor_crc: use flipping instead of frontbuffer (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/88365/
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/index.html
> 
> 
>   CI Bug Log - changes from CI_DRM_9892_full -> IGTPW_5658_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_5658_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5658_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/index.html
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_5658_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@gem_userptr_blits@vma-merge:
> 
>       o
> 
>         shard-iclb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@gem_userptr_blits@vma-merge.html>
> 
>       o
> 
>         shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk8/igt@gem_userptr_blits@vma-merge.html>
> 
>       o
> 
>         shard-kbl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl6/igt@gem_userptr_blits@vma-merge.html>
> 
>       o
> 
>         shard-tglb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@gem_userptr_blits@vma-merge.html>
> 
>   *
> 
>     igt@gen9_exec_parse@bb-large:
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gen9_exec_parse@bb-large.html>
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl7/igt@gen9_exec_parse@bb-large.html>
> 
>   *
> 
>     igt@sysfs_clients@fair-3:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb3/igt@sysfs_clients@fair-3.html>
>         +1 similar issue
>   *
> 
>     igt@sysfs_clients@sema-50:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@sysfs_clients@sema-50.html>
>         +4 similar issues
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     {igt@i915_pm_dc@dc9-dpms}:
> 
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@i915_pm_dc@dc9-dpms.html>
>   *
> 
>     {igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen}:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_5658_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_create@create-clear:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_create@create-clear.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk1/igt@gem_create@create-clear.html>
>         ([i915#1888] / [i915#3160])
>   *
> 
>     igt@gem_ctx_persistence@process:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@gem_ctx_persistence@process.html>
>         ([fdo#109271] / [i915#1099]) +3 similar issues
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs0:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html>
>         ([fdo#109271])
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2842]) +4 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-many-active@rcs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>         ([i915#2389])
>   *
> 
>     igt@gem_exec_reloc@basic-wide-active@bcs0:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>         ([i915#2389]) +3 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-wide-active@vcs1:
> 
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html>
>         ([i915#2389]) +1 similar issue
>   *
> 
>     igt@gem_exec_whisper@basic-fds-priority:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_exec_whisper@basic-fds-priority.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk8/igt@gem_exec_whisper@basic-fds-priority.html>
>         ([i915#118] / [i915#95])
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gem_huc_copy@huc-copy.html>
>         ([fdo#109271] / [i915#2190])
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o shard-apl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl2/igt@gem_pread@exhaustion.html>
>         ([i915#2658]) +1 similar issue
>   *
> 
>     igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb3/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html>
>         ([i915#768])
>   *
> 
>     igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html>
>         ([fdo#109271]) +377 similar issues
>   *
> 
>     igt@gem_userptr_blits@vma-merge:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb5/igt@gem_userptr_blits@vma-merge.html>
>         ([i915#2724])
>   *
> 
>     igt@gen7_exec_parse@cmd-crossing-page:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@gen7_exec_parse@cmd-crossing-page.html>
>         ([fdo#109289]) +3 similar issues
>   *
> 
>     igt@gen7_exec_parse@oacontrol-tracking:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk7/igt@gen7_exec_parse@oacontrol-tracking.html>
>         ([fdo#109271]) +38 similar issues
>   *
> 
>     igt@gen9_exec_parse@bb-start-out:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@gen9_exec_parse@bb-start-out.html>
>         ([fdo#112306])
>   *
> 
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>         ([fdo#109271] / [i915#1937])
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle:
> 
>       o shard-iclb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html>
>         ([i915#1804] / [i915#2684])
>   *
> 
>     igt@i915_pm_rpm@pc8-residency:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html>
>         ([fdo#109293] / [fdo#109506])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb2/igt@i915_pm_rpm@pc8-residency.html>
>         ([fdo#109506] / [i915#2411])
> 
>   *
> 
>     igt@i915_query@query-topology-unsupported:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb5/igt@i915_query@query-topology-unsupported.html>
>         ([fdo#109302])
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-snb7/igt@i915_selftest@live@hangcheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb2/igt@i915_selftest@live@hangcheck.html>
>         ([i915#2782])
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         ([i915#1769])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         ([i915#1769])
> 
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         ([fdo#111614])
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         ([fdo#110725] / [fdo#111614]) +2 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>         ([fdo#111615]) +1 similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>         ([fdo#110723])
> 
>   *
> 
>     igt@kms_chamelium@hdmi-audio-edid:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl6/igt@kms_chamelium@hdmi-audio-edid.html>
>         ([fdo#109271] / [fdo#111827]) +7 similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-edid-change-during-suspend:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html>
>         ([fdo#109271] / [fdo#111827]) +22 similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-hpd:
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk5/igt@kms_chamelium@hdmi-hpd.html>
>         ([fdo#109271] / [fdo#111827]) +4 similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@kms_chamelium@hdmi-hpd.html>
>         ([fdo#109284] / [fdo#111827]) +4 similar issues
> 
>   *
> 
>     igt@kms_chamelium@vga-hpd-with-enabled-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_chamelium@vga-hpd-with-enabled-mode.html>
>         ([fdo#109284] / [fdo#111827]) +6 similar issues
>   *
> 
>     igt@kms_color@pipe-d-degamma:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_color@pipe-d-degamma.html>
>         ([fdo#109278] / [i915#1149]) +1 similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@kms_color@pipe-d-degamma.html>
>         ([i915#1149])
> 
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html>
>         ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
>   *
> 
>     igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html>
>         ([fdo#109271] / [fdo#111827]) +20 similar issues
>   *
> 
>     igt@kms_content_protection@lic:
> 
>       o shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl7/igt@kms_content_protection@lic.html>
>         ([i915#1319]) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html>
>         ([fdo#109278] / [fdo#109279]) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-512x170-random:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html>
>         ([fdo#109279]) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-d-cursor-suspend:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl6/igt@kms_cursor_crc@pipe-d-cursor-suspend.html>
>         ([fdo#109271]) +84 similar issues
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html>
>         ([i915#72])
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         ([fdo#109274] / [fdo#109278]) +1 similar issue
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
> 
>       o shard-apl: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html>
>         ([IGT#6])
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html>
>         ([i915#52] / [i915#54]) +5 similar issues
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html>
>         ([i915#52] / [i915#54])
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@kms_flip@2x-absolute-wf_vblank.html>
>         ([fdo#109274]) +2 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html>
>         ([i915#2587])
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html>
>         ([fdo#109271] / [i915#2642])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html>
>         ([fdo#109271] / [i915#2642])
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html>
>         ([fdo#109271] / [i915#2642])
> 
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html>
>         ([i915#2641])
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html>
>         ([fdo#111825]) +14 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html>
>         ([fdo#109280]) +19 similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
>         ([i915#180]) +2 similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
>         ([fdo#109271] / [i915#533]) +1 similar issue
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html>
>         ([fdo#108145] / [i915#265])
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>         ([i915#265])
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant.html>
>         ([fdo#109278]) +12 similar issues
>   *
> 
>     igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html>
>         ([fdo#109271] / [i915#2733])
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html>
>         ([fdo#109271] / [i915#2733])
> 
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
>         ([i915#658]) +1 similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
>         ([fdo#109271] / [i915#658])
> 
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html>
>         ([fdo#109271] / [i915#658]) +1 similar issue
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html>
>         ([fdo#109271] / [i915#658]) +3 similar issues
>   *
> 
>     igt@kms_psr@psr2_cursor_render:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb2/igt@kms_psr@psr2_cursor_render.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb3/igt@kms_psr@psr2_cursor_render.html>
>         ([fdo#109441]) +2 similar issues
>   *
> 
>     igt@kms_psr@psr2_suspend:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb1/igt@kms_psr@psr2_suspend.html>
>         ([fdo#109441]) +1 similar issue
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@kms_setmode@basic.html>
>         ([i915#31])
>   *
> 
>     igt@kms_vblank@pipe-a-ts-continuation-suspend:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>         ([i915#180] / [i915#295])
>   *
> 
>     igt@kms_vblank@pipe-c-wait-forked-busy:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl3/igt@kms_vblank@pipe-c-wait-forked-busy.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl2/igt@kms_vblank@pipe-c-wait-forked-busy.html>
>         ([i915#62])
>   *
> 
>     igt@kms_vblank@pipe-d-wait-idle:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html>
>         ([fdo#109271] / [i915#533]) +2 similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk7/igt@kms_vblank@pipe-d-wait-idle.html>
>         ([fdo#109271] / [i915#533])
> 
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_writeback@writeback-pixel-formats.html>
>         ([fdo#109271] / [i915#2437])
>   *
> 
>     igt@nouveau_crc@pipe-b-source-rg:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb1/igt@nouveau_crc@pipe-b-source-rg.html>
>         ([i915#2530]) +1 similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@nouveau_crc@pipe-b-source-rg.html>
>         ([i915#2530]) +1 similar issue
> 
>   *
> 
>     igt@perf@unprivileged-single-ctx-counters:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@perf@unprivileged-single-ctx-counters.html>
>         ([fdo#109289]) +4 similar issues
>   *
> 
>     igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html>
>         ([fdo#109271]) +236 similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb1/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html>
>         ([fdo#109291]) +1 similar issue
> 
>   *
> 
>     igt@prime_nv_test@nv_i915_sharing:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@prime_nv_test@nv_i915_sharing.html>
>         ([fdo#109291]) +2 similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_ctx_persistence@close-replace-race:
> 
>       o shard-glk: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html>
>         ([i915#2918]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@gem_ctx_persistence@close-replace-race.html>
>   *
> 
>     igt@gem_exec_fair@basic-flow@rcs0:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk4/igt@gem_exec_fair@basic-none@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-none@vecs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl6/igt@gem_exec_fair@basic-none@vecs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl3/igt@gem_exec_fair@basic-none@vecs0.html>
>   *
> 
>     igt@gem_exec_whisper@basic-fds-priority-all:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk1/igt@gem_exec_whisper@basic-fds-priority-all.html>
>         ([i915#118] / [i915#95]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk9/igt@gem_exec_whisper@basic-fds-priority-all.html>
>   *
> 
>     igt@gem_exec_whisper@basic-queues-forked:
> 
>       o shard-iclb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked.html>
>         ([i915#1895] / [i915#2405]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@gem_exec_whisper@basic-queues-forked.html>
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-tglb6/igt@gem_huc_copy@huc-copy.html>
>         ([i915#2190]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb3/igt@gem_huc_copy@huc-copy.html>
>   *
> 
>     igt@gem_mmap_gtt@big-copy:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_mmap_gtt@big-copy.html>
>         ([i915#307]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk2/igt@gem_mmap_gtt@big-copy.html>
>         +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-suspend:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>         ([i915#180]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>         +1 similar issue
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-render-untiled:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html>
>         ([i915#52] / [i915#54]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html>
>         +1 similar issue
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         ([i915#180]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>   *
> 
>     igt@kms_psr@psr2_primary_page_flip:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html>
>         ([fdo#109441]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html>
>         +2 similar issues
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_reloc@basic-many-active@vecs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl2/igt@gem_exec_reloc@basic-many-active@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gem_exec_reloc@basic-many-active@vecs0.html>
>         ([i915#2389])
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-fence:
> 
>       o shard-iclb: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html>
>         ([i915#2684]) -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html>
>         ([i915#1804] / [i915#2684])
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html>
>         ([i915#2920]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb7/igt@kms_psr2_sf@primary-plane-upda>
>         ([i915#658]) +2 similar issues
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
