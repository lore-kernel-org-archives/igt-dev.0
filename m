Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5027789CD3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 15:34:30 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id j1so2704962ljo.10
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 08:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210707200346.1731702-1-markyacoub@chromium.org>
 <162590517761.15858.4596461039170240235@emeril.freedesktop.org>
In-Reply-To: <162590517761.15858.4596461039170240235@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 20 Jul 2021 11:34:17 -0400
Message-ID: <CAJUqKUqjWy6yrcruvY630HxGTTkhjVKu_NpHr4KbzfHTkQ+Ybw@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?kms=5Faddfb=5Fbasic=3A_Test_addfb2_with_DRM=5FFORMAT=5FC?=
	=?utf-8?q?8_only_if_supported=2E_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1454476063=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1454476063==
Content-Type: multipart/alternative; boundary="00000000000016992b05c78fca7c"

--00000000000016992b05c78fca7c
Content-Type: text/plain; charset="UTF-8"

Hello, this looks like a false positive to me. Thanks!

On Sat, Jul 10, 2021 at 4:19 AM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* tests/kms_addfb_basic: Test addfb2 with DRM_FORMAT_C8 only if
> supported. (rev3)
> *URL:* https://patchwork.freedesktop.org/series/92289/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/index.html CI
> Bug Log - changes from CI_DRM_10325_full -> IGTPW_6005_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_6005_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6005_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/index.html
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_6005_full:
> IGT changes Possible regressions
>
>    - igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled:
>       - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html>
>
> Known issues
>
> Here are the changes found in IGTPW_6005_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@core_hotunplug@unbind-rebind:
>    -
>
>       shard-apl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl3/igt@core_hotunplug@unbind-rebind.html>
>       ([i915#2283])
>       -
>
>       shard-glk: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk3/igt@core_hotunplug@unbind-rebind.html>
>       ([i915#2283])
>       -
>
>       shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-iclb6/igt@core_hotunplug@unbind-rebind.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb6/igt@core_hotunplug@unbind-rebind.html>
>       ([i915#1602] / [i915#2283])
>       -
>
>    igt@feature_discovery@display-4x:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@feature_discovery@display-4x.html>
>       ([i915#1839])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb2/igt@feature_discovery@display-4x.html>
>       ([i915#1839])
>       -
>
>    igt@gem_create@create-massive:
>    -
>
>       shard-iclb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb8/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>       shard-snb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-snb6/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>       shard-tglb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb6/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>       shard-glk: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk8/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>    igt@gem_ctx_persistence@legacy-engines-mixed:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed.html>
>       ([fdo#109271] / [i915#1099]) +6 similar issues
>    -
>
>    igt@gem_exec_fair@basic-flow@rcs0:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html>
>       ([i915#2842]) +2 similar issues
>    -
>
>    igt@gem_exec_fair@basic-none@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html>
>       ([i915#2842]) +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-none@vcs0:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html>
>       ([i915#2842]) +3 similar issues
>    -
>
>    igt@gem_exec_fair@basic-none@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html>
>       ([i915#2842]) +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace-solo@rcs0:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk3/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-pace@vcs0:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html>
>       ([i915#2842]) +1 similar issue
>    -
>
>    igt@gem_mmap_gtt@big-copy-odd:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-glk5/igt@gem_mmap_gtt@big-copy-odd.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk2/igt@gem_mmap_gtt@big-copy-odd.html>
>       ([i915#307])
>    -
>
>    igt@gem_mmap_gtt@coherency:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb5/igt@gem_mmap_gtt@coherency.html>
>       ([fdo#111656])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb1/igt@gem_mmap_gtt@coherency.html>
>       ([fdo#109292])
>       -
>
>    igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html>
>       ([i915#307])
>    -
>
>    igt@gem_mmap_gtt@cpuset-big-copy-odd:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html>
>       ([i915#307])
>    -
>
>    igt@gem_userptr_blits@dmabuf-sync:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl8/igt@gem_userptr_blits@dmabuf-sync.html>
>       ([fdo#109271] / [i915#3323])
>    -
>
>    igt@gem_userptr_blits@input-checking:
>    - shard-apl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl1/igt@gem_userptr_blits@input-checking.html>
>       ([i915#3002])
>    -
>
>    igt@gem_userptr_blits@readonly-pwrite-unsync:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb3/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>       ([i915#3297]) +1 similar issue
>    -
>
>    igt@gem_userptr_blits@unsync-unmap-after-close:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>       ([i915#3297]) +1 similar issue
>    -
>
>    igt@gen3_render_linear_blits:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb7/igt@gen3_render_linear_blits.html>
>       ([fdo#109289]) +3 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb5/igt@gen3_render_linear_blits.html>
>       ([fdo#109289]) +3 similar issues
>       -
>
>    igt@gen9_exec_parse@basic-rejected:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb3/igt@gen9_exec_parse@basic-rejected.html>
>       ([fdo#112306]) +2 similar issues
>    -
>
>    igt@gen9_exec_parse@bb-large:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl8/igt@gen9_exec_parse@bb-large.html>
>       ([i915#3296])
>    -
>
>    igt@gen9_exec_parse@bb-start-out:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html>
>       ([fdo#112306]) +3 similar issues
>    -
>
>    igt@i915_pm_dc@dc6-dpms:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html>
>       ([i915#454])
>    -
>
>    igt@i915_pm_dc@dc6-psr:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-iclb6/igt@i915_pm_dc@dc6-psr.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb7/igt@i915_pm_dc@dc6-psr.html>
>       ([i915#1982] / [i915#3698])
>    -
>
>    igt@i915_pm_rc6_residency@rc6-fence:
>    -
>
>       shard-tglb: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html>
>       ([i915#2681])
>       -
>
>       shard-iclb: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html>
>       ([i915#1804] / [i915#2684])
>       -
>
>    igt@i915_pm_rpm@modeset-non-lpsp-stress:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>       ([fdo#111644] / [i915#1397] / [i915#2411])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>       ([fdo#110892])
>       -
>
>    igt@kms_atomic_transition@plane-all-modeset-transition:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition.html>
>       ([i915#1769])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html>
>       ([i915#1769])
>       -
>
>    igt@kms_big_fb@linear-16bpp-rotate-90:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>       ([fdo#110725] / [fdo#111614])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>       ([fdo#111614])
>       -
>
>    igt@kms_big_fb@linear-32bpp-rotate-0:
>    - shard-glk: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>       ([i915#118] / [i915#95])
>    -
>
>    igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>       ([fdo#111615]) +2 similar issues
>    -
>
>    igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html>
>       ([fdo#109271]) +266 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>       ([i915#3689]) +8 similar issues
>    -
>
>    igt@kms_chamelium@dp-hpd-storm-disable:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk8/igt@kms_chamelium@dp-hpd-storm-disable.html>
>       ([fdo#109271] / [fdo#111827]) +15 similar issues
>    -
>
>    igt@kms_chamelium@dp-mode-timings:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl2/igt@kms_chamelium@dp-mode-timings.html>
>       ([fdo#109271] / [fdo#111827]) +26 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html>
>       ([fdo#109271] / [fdo#111827]) +29 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-0-75:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl7/igt@kms_color_chamelium@pipe-a-ctm-0-75.html>
>       ([fdo#109271] / [fdo#111827]) +12 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html>
>       ([fdo#109284] / [fdo#111827]) +8 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-b-ctm-0-75:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-75.html>
>       ([fdo#109284] / [fdo#111827]) +8 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html>
>       ([fdo#109278] / [fdo#109284] / [fdo#111827])
>    -
>
>    igt@kms_content_protection@atomic:
>    -
>
>       shard-kbl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl3/igt@kms_content_protection@atomic.html>
>       ([i915#1319]) +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb6/igt@kms_content_protection@atomic.html>
>       ([fdo#109300] / [fdo#111066])
>       -
>
>       shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl3/igt@kms_content_protection@atomic.html>
>       ([i915#1319])
>       -
>
>    igt@kms_content_protection@content_type_change:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@kms_content_protection@content_type_change.html>
>       ([fdo#111828]) +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen.html>
>       ([i915#3319])
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-suspend:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html>
>       ([i915#180]) +5 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-b-cursor-512x170-random:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html>
>       ([fdo#109279] / [i915#3359]) +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement.html>
>       ([i915#3359]) +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html>
>       ([fdo#109278] / [fdo#109279]) +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html>
>       ([fdo#109271]) +163 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html>
>       ([fdo#109278]) +23 similar issues
>    -
>
>    igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>       ([fdo#109274] / [fdo#109278]) +2 similar issues
>    -
>
>    igt@kms_cursor_legacy@pipe-d-torture-bo:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>       ([fdo#109271] / [i915#533])
>    -
>
>    igt@kms_dp_tiled_display@basic-test-pattern:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html>
>       ([i915#426])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pattern.html>
>       ([i915#426])
>       -
>
>    igt@kms_flip@2x-plain-flip-ts-check:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb3/igt@kms_flip@2x-plain-flip-ts-check.html>
>       ([fdo#111825]) +26 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb7/igt@kms_flip@2x-plain-flip-ts-check.html>
>       ([fdo#109274]) +2 similar issues
>       -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html>
>       ([i915#79]) +1 similar issue
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>    - shard-apl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       ([i915#180]) +1 similar issue
>    -
>
>    igt@kms_flip@flip-vs-suspend@a-dp1:
>    - shard-kbl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>       ([i915#180]) +2 similar issues
>    -
>
>    igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html>
>       ([fdo#109271] / [i915#2672])
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html>
>       ([fdo#109271]) +460 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking
>    @fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html>
>       ([fdo#109271]) +118 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html>
>       ([fdo#109280]) +18 similar issues
>    -
>
>    igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html>
>       ([fdo#109271] / [i915#533])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>       ([fdo#108145] / [i915#265])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>       ([i915#265]) +1 similar issue
>    -
>
>    igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>       ([fdo#108145] / [i915#265]) +1 similar issue
>    -
>
>    igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>       ([i915#265])
>    -
>
>    igt@kms_psr2_sf@cursor-plane-update-sf:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb5/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       ([i915#2920]) +2 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html>
>       ([i915#658]) +2 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
>       ([fdo#109271] / [i915#658]) +4 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
>       ([fdo#109271] / [i915#658]) +4 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html>
>       ([fdo#109271] / [i915#658]) +6 similar issues
>    -
>
>    igt@kms_psr@psr2_primary_mmap_cpu:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       ([fdo#109441]) +2 similar issues
>    -
>
>    igt@kms_psr@psr2_sprite_plane_move:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html>
>       ([fdo#109441]) +2 similar issues
>    -
>
>    igt@kms_psr@psr2_sprite_render:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb7/igt@kms_psr@psr2_sprite_render.html>
>       ([i915#132] / [i915#3467]) +1 similar issue
>    -
>
>    igt@kms_writeback@writeback-fb-id:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl7/igt@kms_writeback@writeback-fb-id.html>
>       ([fdo#109271] / [i915#2437])
>    -
>
>    igt@kms_writeback@writeback-invalid-parameters:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl7/igt@kms_writeback@writeback-invalid-parameters.html>
>       ([fdo#109271] / [i915#2437])
>    -
>
>    igt@nouveau_crc@pipe-c-ctx-flip-detection:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb5/igt@nouveau_crc@pipe-c-ctx-flip-detection.html>
>       ([i915#2530])
>    -
>
>    igt@nouveau_crc@pipe-d-ctx-flip-detection:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb6/igt@nouveau_crc@pipe-d-ctx-flip-detection.html>
>       ([i915#2530]) +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb3/igt@nouveau_crc@pipe-d-ctx-flip-detection.html>
>       ([fdo#109278] / [i915#2530])
>       -
>
>    igt@prime_nv_api@i915_nv_double_export:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb3/igt@prime_nv_api@i915_nv_double_export.html>
>       ([fdo#109291])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb5/igt@prime_nv_api@i915_nv_double_export.html>
>       ([fdo#109291])
>       -
>
>    igt@sysfs_clients@create:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl8/igt@sysfs_clients@create.html>
>       ([fdo#109271] / [i915#2994]) +4 similar issues
>    -
>
>    igt@sysfs_clients@pidname:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl7/igt@sysfs_clients@pidname.html>
>       ([fdo#109271] / [i915#2994])
>
> Possible fixes
>
>    -
>
>    igt@gem_eio@in-flight-contexts-immediate:
>    - shard-tglb: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-tglb1/igt@gem_eio@in-flight-contexts-immediate.html>
>       ([i915#3063]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb7/igt@gem_eio@in-flight-contexts-immediate.html>
>    -
>
>    igt@gem_exec_fair@basic-deadline:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-glk8/igt@gem_exec_fair@basic-deadline.html>
>       ([i915#2846]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk8/igt@gem_exec_fair@basic-deadline.html>
>    -
>
>    igt@gem_exec_fair@basic-none-rrul@rcs0:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    - shard-apl: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       ([fdo#109271]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-pace-solo@rcs0:
>    - shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-kbl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html>
>    -
>
>    igt@gem_huc_copy@huc-copy:
>    - shard-tglb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-tglb6/igt@gem_huc_copy@huc-copy.html>
>       ([i915#2190]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb5/igt@gem_huc_copy@huc-copy.html>
>    -
>
>    igt@gem_mmap_gtt@cpuset-big-copy-xy:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html>
>       ([i915#307]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-xy.html>
>    -
>
>    igt@gem_mmap_gtt@cpuset-medium-copy-odd:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-iclb1/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html>
>       ([i915#2428]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-iclb3/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html>
>    -
>
>    igt@gem_softpin@noreloc-s3:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-apl8/igt@gem_softpin@noreloc-s3.html>
>       ([i915#180]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl7/igt@gem_softpin@noreloc-s3.html>
>       +1 similar issue
>    -
>
>    igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html>
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
>    -
>
>       shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html>
>       ([i915#3444]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html>
>       -
>
>       shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10325/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html>
>       ([i915#3444]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html>
>       -
>
>    igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
>    - shard-kbl: INCOMPLETE <https://intel-gfx-ci.01.org/> ([fdo#109052])
>       -> [PASS][138]
>
>

--00000000000016992b05c78fca7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, this looks like a false positive to me. Thanks!</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On S=
at, Jul 10, 2021 at 4:19 AM Patchwork &lt;<a href=3D"mailto:patchwork@emeri=
l.freedesktop.org">patchwork@emeril.freedesktop.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/kms_addfb_basic: Test addfb2 wi=
th DRM_FORMAT_C8 only if supported. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/92289/" target=3D"_blank">https://patchwork.freedesktop.org/series/922=
89/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6005/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_10325_full -&gt; IGTPW_6005_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6005_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_6005_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6005/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6005/index.html</a></p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6005=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled:<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-until=
ed.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_6005/shard-glk5/igt@kms_draw_crc@draw-method-rgb56=
5-mmap-gtt-untiled.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6005_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-apl3/igt@core_hotunplug@unbind-rebind.html" t=
arget=3D"_blank">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-glk3/igt@core_hotunplug@unbind-rebind.html" t=
arget=3D"_blank">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10325/shard-iclb6/igt@core_hotunplug@unbind-rebind.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6005/shard-iclb6/igt@core_hotunplug@unbind-rebind.html" target=3D"_bla=
nk">DMESG-WARN</a> ([i915#1602] / [i915#2283])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb2/igt@feature_discovery@display-4x.html" =
target=3D"_blank">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb2/igt@feature_discovery@display-4x.html" =
target=3D"_blank">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb8/igt@gem_create@create-massive.html" tar=
get=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-snb6/igt@gem_create@create-massive.html" targ=
et=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb6/igt@gem_create@create-massive.html" tar=
get=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-glk8/igt@gem_create@create-massive.html" targ=
et=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-snb5/igt@gem_ctx_persistence@legacy-engines-=
mixed.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1099]) +6 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6005/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html" target=3D"_=
blank">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6005/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html" target=3D"_bl=
ank">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6005/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html" target=3D"_bl=
ank">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
" target=3D"_blank">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-glk3/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html" target=3D"_blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6005/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html" target=3D"_=
blank">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-odd:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-glk5/igt@gem_mmap_gtt@big-copy-odd.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6005/shard-glk2/igt@gem_mmap_gtt@big-copy-odd.html" target=3D"_blank">FAI=
L</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb5/igt@gem_mmap_gtt@coherency.html" target=
=3D"_blank">SKIP</a> ([fdo#111656])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb1/igt@gem_mmap_gtt@coherency.html" target=
=3D"_blank">SKIP</a> ([fdo#109292])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html=
" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6005/shard-iclb8/igt@gem_mmap_gtt@cpuset-basic-small-copy=
-odd.html" target=3D"_blank">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-glk4/igt@gem_mmap_gtt@cpuset-big-copy-odd.ht=
ml" target=3D"_blank">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl8/igt@gem_userptr_blits@dmabuf-sync.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl1/igt@gem_userptr_blits@input-checking.ht=
ml" target=3D"_blank">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb3/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html" target=3D"_blank">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@gem_userptr_blits@unsync-unmap-aft=
er-close.html" target=3D"_blank">SKIP</a> ([i915#3297]) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb7/igt@gen3_render_linear_blits.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109289]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb5/igt@gen3_render_linear_blits.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109289]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb3/igt@gen9_exec_parse@basic-rejected.htm=
l" target=3D"_blank">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl8/igt@gen9_exec_parse@bb-large.html" targ=
et=3D"_blank">FAIL</a> ([i915#3296])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html"=
 target=3D"_blank">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html" target=3D=
"_blank">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-iclb6/igt@i915_pm_dc@dc6-psr.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6005=
/shard-iclb7/igt@i915_pm_dc@dc6-psr.html" target=3D"_blank">INCOMPLETE</a> =
([i915#1982] / [i915#3698])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.htm=
l" target=3D"_blank">WARN</a> ([i915#2681])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.htm=
l" target=3D"_blank">WARN</a> ([i915#1804] / [i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html" target=3D"_blank">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]=
)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html" target=3D"_blank">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb7/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html" target=3D"_blank">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb5/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html" target=3D"_blank">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-90.h=
tml" target=3D"_blank">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-90.h=
tml" target=3D"_blank">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-0.ht=
ml" target=3D"_blank">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb5/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-async-flip.html" target=3D"_blank">SKIP</a> ([fdo#111615]) +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl1/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +266 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> ([i915#3689]) +8 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-glk8/igt@kms_chamelium@dp-hpd-storm-disable.=
html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl2/igt@kms_chamelium@dp-mode-timings.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +26 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +29 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-kbl7/igt@kms_color_chamelium@pipe-a-ctm-0-75=
.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-red=
-to-blue.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-7=
5.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-blu=
e-to-red.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109284] / [f=
do#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-kbl3/igt@kms_content_protection@atomic.html" =
target=3D"_blank">TIMEOUT</a> ([i915#1319]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb6/igt@kms_content_protection@atomic.html"=
 target=3D"_blank">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-apl3/igt@kms_content_protection@atomic.html" =
target=3D"_blank">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@kms_content_protection@content_typ=
e_change.html" target=3D"_blank">SKIP</a> ([fdo#111828]) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-onscreen.html" target=3D"_blank">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6005/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html"=
 target=3D"_blank">DMESG-WARN</a> ([i915#180]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x1=
70-random.html" target=3D"_blank">SKIP</a> ([fdo#109279] / [i915#3359]) +1 =
similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-rapid-movement.html" target=3D"_blank">SKIP</a> ([i915#3359]) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-random.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109279]) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-256x25=
6-onscreen.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +163 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-32x10=
-offscreen.html" target=3D"_blank">SKIP</a> ([fdo#109278]) +23 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb4/igt@kms_cursor_legacy@2x-flip-vs-curso=
r-atomic.html" target=3D"_blank">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-kbl3/igt@kms_cursor_legacy@pipe-d-torture-bo=
.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pat=
tern.html" target=3D"_blank">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pat=
tern.html" target=3D"_blank">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb3/igt@kms_flip@2x-plain-flip-ts-check.htm=
l" target=3D"_blank">SKIP</a> ([fdo#111825]) +26 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb7/igt@kms_flip@2x-plain-flip-ts-check.htm=
l" target=3D"_blank">SKIP</a> ([fdo#109274]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
c-hdmi-a1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_6005/shard-glk7/igt@kms_flip@flip-vs-expire=
d-vblank-interruptible@c-hdmi-a1.html" target=3D"_blank">FAIL</a> ([i915#79=
]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl6/igt@kms_flip@flip-vs-suspend-interrupti=
ble@a-dp1.html" target=3D"_blank">DMESG-WARN</a> ([i915#180]) +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html=
" target=3D"_blank">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i91=
5#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-shrfb-msflip-blt.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +460=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
offscren-pri-indfb-draw-mmap-cpu.html" target=3D"_blank">SKIP</a> ([fdo#109=
271]) +118 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-shrfb-fliptrack-mmap-gtt.html" target=3D"_blank">SKIP</a> ([fdo#109280]) +=
18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-d-=
frame-sequence.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-=
opaque-fb.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265]) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265]) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb5/igt@kms_psr2_sf@cursor-plane-update-sf=
.html" target=3D"_blank">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area-1.html" target=3D"_blank">SKIP</a> ([i915#658]) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-3.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +4=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-glk8/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-4.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +4=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-5.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) =
+6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html=
" target=3D"_blank">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6005/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html" target=
=3D"_blank">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-tglb7/igt@kms_psr@psr2_sprite_render.html" t=
arget=3D"_blank">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl7/igt@kms_writeback@writeback-fb-id.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-kbl7/igt@kms_writeback@writeback-invalid-par=
ameters.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-iclb5/igt@nouveau_crc@pipe-c-ctx-flip-detect=
ion.html" target=3D"_blank">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb6/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html" target=3D"_blank">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb3/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_export:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-iclb3/igt@prime_nv_api@i915_nv_double_export.=
html" target=3D"_blank">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-tglb5/igt@prime_nv_api@i915_nv_double_export.=
html" target=3D"_blank">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-apl8/igt@sysfs_clients@create.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6005/shard-kbl7/igt@sysfs_clients@pidname.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-tglb1/igt@gem_eio@in-flight-contexts-immediate.html" ta=
rget=3D"_blank">TIMEOUT</a> ([i915#3063]) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6005/shard-tglb7/igt@gem_eio@in-flight-conte=
xts-immediate.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-glk8/igt@gem_exec_fair@basic-deadline.html" target=3D"_=
blank">FAIL</a> ([i915#2846]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6005/shard-glk8/igt@gem_exec_fair@basic-deadline.html" t=
arget=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.html" targe=
t=3D"_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_6005/shard-glk5/igt@gem_exec_fair@basic-none-rrul@=
rcs0.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109271]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6005/shard-apl8/igt@gem_exec_fair@basic-none-sha=
re@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-kbl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html" targe=
t=3D"_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_6005/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@=
rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html" target=
=3D"_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_6005/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0=
.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-tglb6/igt@gem_huc_copy@huc-copy.html" target=3D"_blank"=
>SKIP</a> ([i915#2190]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6005/shard-tglb5/igt@gem_huc_copy@huc-copy.html" target=3D"_bl=
ank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html" target=
=3D"_blank">FAIL</a> ([i915#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_6005/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-xy=
.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-iclb1/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html" tar=
get=3D"_blank">FAIL</a> ([i915#2428]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6005/shard-iclb3/igt@gem_mmap_gtt@cpuset-medium-=
copy-odd.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-apl8/igt@gem_softpin@noreloc-s3.html" target=3D"_blank"=
>DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6005/shard-apl7/igt@gem_softpin@noreloc-s3.html" target=
=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10325/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html" target=
=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6005/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html" targe=
t=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-random:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10325/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html"=
 target=3D"_blank">FAIL</a> ([i915#3444]) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6005/shard-apl2/igt@kms_cursor_crc@pipe-a-cu=
rsor-64x64-random.html" target=3D"_blank">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10325/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html"=
 target=3D"_blank">FAIL</a> ([i915#3444]) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6005/shard-kbl1/igt@kms_cursor_crc@pipe-a-cu=
rsor-64x64-random.html" target=3D"_blank">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/" target=3D"=
_blank">INCOMPLETE</a> ([fdo#109052]) -&gt; [PASS][138]</li>
</ul>
</li>
</ul>

</div>

</blockquote></div>

--00000000000016992b05c78fca7c--

--===============1454476063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1454476063==--
