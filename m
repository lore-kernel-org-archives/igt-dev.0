Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA086E0BF
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 21:32:20 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k2so1412933lji.4
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 13:32:20 -0800 (PST)
References: <20211116182342.6801-1-juhapekka.heikkila@gmail.com>
 <163709750615.28809.8910897198427326599@emeril.freedesktop.org>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
Message-ID: <4edf9174-b2c6-217b-a872-a70c94380816@gmail.com>
Date: Tue, 16 Nov 2021 23:32:15 +0200
MIME-Version: 1.0
In-Reply-To: <163709750615.28809.8910897198427326599@emeril.freedesktop.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fmultiple=3A_Use_same_modifier_for_reference_crc_a?=
 =?utf-8?q?s_for_test_crc_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

below would be again failures which are not about my change

Patchwork kirjoitti 16.11.2021 klo 23.18:
> *Patch Details*
> *Series:*	tests/kms_plane_multiple: Use same modifier for reference crc 
> as for test crc (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/96048/ 
> <https://patchwork.freedesktop.org/series/96048/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/index.html>
> 
> 
>   CI Bug Log - changes from IGT_6281_full -> IGTPW_6405_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_6405_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6405_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/index.html
> 
> 
>     Participating hosts (7 -> 7)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_6405_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>

This I cannot see how my change would cause

>   *
> 
>     igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html>

This is test which I'm patching but this skip with yf-tile happen on tgl 
where there is no yf-tile.

> 
> 
>         Warnings
> 
>   * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
>       o shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html>
>         ([fdo#112054]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html>
>         +2 similar issues

this warning is also about tgl trying to run test with yf-tile.

> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_6405_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_create@create-massive:
> 
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl6/igt@gem_create@create-massive.html>
>         ([i915#3002])
>   *
> 
>     igt@gem_ctx_persistence@engines-mixed:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html>
>         ([fdo#109271] / [i915#1099])
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-kbl3/igt@gem_exec_fair@basic-deadline.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl1/igt@gem_exec_fair@basic-deadline.html>
>         ([i915#2846])
>   *
> 
>     igt@gem_exec_fair@basic-none@vecs0:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_params@rsvd2-dirt:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb8/igt@gem_exec_params@rsvd2-dirt.html>
>         ([fdo#109283])
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o shard-tglb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb1/igt@gem_pread@exhaustion.html>
>         ([i915#2658])
>   *
> 
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>         ([i915#4270])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb7/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>         ([i915#4270]) +1 similar issue
> 
>   *
> 
>     igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb6/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html>
>         ([i915#768])
>   *
> 
>     igt@gem_userptr_blits@dmabuf-unsync:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb3/igt@gem_userptr_blits@dmabuf-unsync.html>
>         ([i915#3297]) +1 similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb7/igt@gem_userptr_blits@dmabuf-unsync.html>
>         ([i915#3297])
> 
>   *
> 
>     igt@gen9_exec_parse@valid-registers:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@gen9_exec_parse@valid-registers.html>
>         ([i915#2856])
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html>
>         ([i915#454])
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb6/igt@i915_pm_dc@dc9-dpms.html>
>         ([i915#4281])
>   *
> 
>     igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         ([fdo#111644] / [i915#1397] / [i915#2411])
>   *
> 
>     igt@i915_pm_rpm@modeset-pc8-residency-stress:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html>
>         ([fdo#109506] / [i915#2411])
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-snb2/igt@i915_selftest@live@hangcheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-snb4/igt@i915_selftest@live@hangcheck.html>
>         ([i915#3921])
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb6/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         ([fdo#111614]) +7 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-180:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html>
>         ([i915#118])
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         ([fdo#110725] / [fdo#111614]) +2 similar issues
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         ([fdo#109271] / [i915#3777]) +1 similar issue
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>         ([fdo#111615]) +7 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         ([fdo#110723])
>   *
> 
>     igt@kms_big_joiner@2x-modeset:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb8/igt@kms_big_joiner@2x-modeset.html>
>         ([i915#2705])
>   *
> 
>     igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         ([i915#3689] / [i915#3886]) +14 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         ([fdo#109278] / [i915#3886]) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html>
>         ([fdo#109271] / [i915#3886]) +3 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         ([fdo#109271] / [i915#3886]) +11 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>         ([fdo#109271] / [i915#3886]) +10 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html>
>         ([i915#3689]) +10 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl3/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>         ([fdo#109271]) +126 similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-audio:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb3/igt@kms_chamelium@hdmi-audio.html>
>         ([fdo#109284] / [fdo#111827]) +5 similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-crc-nonplanar-formats:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk3/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html>
>         ([fdo#109271] / [fdo#111827]) +6 similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-edid-change-during-suspend:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl1/igt@kms_chamelium@hdmi-edid-change-during-suspend.html>
>         ([fdo#109271] / [fdo#111827]) +16 similar issues
>   *
> 
>     igt@kms_chamelium@vga-hpd:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-snb2/igt@kms_chamelium@vga-hpd.html>
>         ([fdo#109271] / [fdo#111827]) +5 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-b-ctm-0-75:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-75.html>
>         ([fdo#109284] / [fdo#111827]) +16 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-c-ctm-0-25:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-0-25.html>
>         ([fdo#109271] / [fdo#111827]) +16 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html>
>         ([fdo#109278] / [fdo#109284] / [fdo#111827])
>   *
> 
>     igt@kms_content_protection@mei_interface:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb2/igt@kms_content_protection@mei_interface.html>
>         ([fdo#111828])
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html>
>         ([fdo#109279] / [i915#3359]) +4 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html>
>         ([i915#2828] / [i915#456])
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html>
>         ([i915#3319]) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html>
>         ([fdo#109278] / [fdo#109279]) +2 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html>
>         ([i915#3359]) +12 similar issues
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         ([fdo#109274] / [fdo#109278])
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-iclb4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>         ([i915#2346]) +1 similar issue
>   *
> 
>     igt@kms_cursor_legacy@pipe-d-single-bo:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl6/igt@kms_cursor_legacy@pipe-d-single-bo.html>
>         ([fdo#109271] / [i915#533]) +2 similar issues
>   *
> 
>     igt@kms_cursor_legacy@pipe-d-torture-bo:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl8/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         ([fdo#109271] / [i915#533]) +3 similar issues
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb2/igt@kms_flip@2x-absolute-wf_vblank.html>
>         ([fdo#111825] / [i915#3966])
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html>
>         ([fdo#111825]) +51 similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html>
>         ([fdo#109274]) +4 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html>
>         ([i915#79])
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html>
>         ([i915#2411] / [i915#456])
>   *
> 
>     igt@kms_flip@flip-vs-suspend@b-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-apl2/igt@kms_flip@flip-vs-suspend@b-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl2/igt@kms_flip@flip-vs-suspend@b-dp1.html>
>         ([i915#180])
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         ([i915#180]) +4 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>         ([fdo#109271] / [i915#2672])
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>         ([fdo#109271] / [i915#2672])
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html>
>         ([fdo#109280]) +8 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html>
>         ([fdo#109271]) +47 similar issues
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb3/igt@kms_hdr@static-swap.html>
>         ([i915#1187])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb4/igt@kms_hdr@static-swap.html>
>         ([i915#1187])
> 
>   *
> 
>     igt@kms_invalid_mode@clock-too-high:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb1/igt@kms_invalid_mode@clock-too-high.html>
>         ([i915#4278])
>   *
> 
>     igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html>
>         ([fdo#109289])
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
>         ([fdo#109271] / [i915#533])
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html>
>         ([fdo#108145] / [i915#265]) +3 similar issues
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html>
>         ([fdo#108145] / [i915#265]) +1 similar issue
>   *
> 
>     igt@kms_plane_cursor@pipe-d-overlay-size-256:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb4/igt@kms_plane_cursor@pipe-d-overlay-size-256.html>
>         ([fdo#109278]) +17 similar issues
>   *
> 
>     igt@kms_plane_lowres@pipe-b-tiling-none:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb8/igt@kms_plane_lowres@pipe-b-tiling-none.html>
>         ([i915#3536]) +2 similar issues
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
>         ([fdo#109271] / [i915#658]) +4 similar issues
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-snb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html>
>         ([fdo#109271]) +84 similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html>
>         ([i915#2920]) +3 similar issues
> 
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html>
>         ([fdo#109271] / [i915#658]) +2 similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html>
>         ([fdo#109271] / [i915#658]) +1 similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html>
>         ([i915#658]) +1 similar issue
> 
>   *
> 
>     igt@kms_psr2_su@page_flip:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb7/igt@kms_psr2_su@page_flip.html>
>         ([i915#1911])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb4/igt@kms_psr2_su@page_flip.html>
>         ([fdo#109642] / [fdo#111068] / [i915#658])
> 
>   *
> 
>     igt@kms_psr@psr2_primary_page_flip:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html>
>         ([fdo#109441])
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@kms_psr@psr2_primary_page_flip.html>
>         ([i915#132] / [i915#3467])
> 
>   *
> 
>     igt@kms_psr@psr2_primary_render:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-iclb2/igt@kms_psr@psr2_primary_render.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb8/igt@kms_psr@psr2_primary_render.html>
>         ([fdo#109441])
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-apl8/igt@kms_setmode@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl2/igt@kms_setmode@basic.html>
>         ([i915#31])
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-glk3/igt@kms_setmode@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk9/igt@kms_setmode@basic.html>
>         ([i915#31])
> 
>   *
> 
>     igt@kms_vrr@flip-basic:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb2/igt@kms_vrr@flip-basic.html>
>         ([fdo#109502]) +1 similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb8/igt@kms_vrr@flip-basic.html>
>         ([fdo#109502]) +1 similar issue
> 
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl1/igt@kms_writeback@writeback-fb-id.html>
>         ([fdo#109271] / [i915#2437])
>   *
> 
>     igt@nouveau_crc@pipe-b-source-rg:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@nouveau_crc@pipe-b-source-rg.html>
>         ([i915#2530])
>   *
> 
>     igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html>
>         ([fdo#109271]) +197 similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb3/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html>
>         ([fdo#109291]) +6 similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb4/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html>
>         ([fdo#109291]) +3 similar issues
> 
>   *
> 
>     igt@prime_vgem@fence-write-hang:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@prime_vgem@fence-write-hang.html>
>         ([fdo#109295])
>   *
> 
>     igt@sysfs_clients@create:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb2/igt@sysfs_clients@create.html>
>         ([i915#2994]) +1 similar issue
>   *
> 
>     igt@sysfs_clients@split-50:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl1/igt@sysfs_clients@split-50.html>
>         ([fdo#109271] / [i915#2994]) +2 similar issues
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl2/igt@sysfs_clients@split-50.html>
>         ([fdo#109271] / [i915#2994])
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2849]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html>
>   *
> 
>     igt@gem_exec_whisper@basic-contexts-forked:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked.html>
>         ([i915#118]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked.html>
>         +2 similar issues
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html>
>         ([i915#454]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html>
>         +1 similar issue
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle:
> 
>       o shard-iclb: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html>
>         ([i915#1804] / [i915#2684]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html>
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-glk4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-glk5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-suspend:
> 
>       o shard-tglb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html>
>         ([i915#456]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html>
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-apl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html>
>         ([i915#180] / [i915#1982]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html>
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-tglb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-tglb7/igt@kms_fbcon_fbt@psr-suspend.html>
>         ([i915#2411] / [i915#456]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-tglb8/igt@kms_fbcon_fbt@psr-suspend.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>         ([i915#180]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>         +5 similar issues
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate@a-dp1:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html>
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6281/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html>
>         ([i915#180]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6405/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html>
>         +3 similar issues
>   *
> 
>     igt@kms_vblank@pipe-d-
> 
