Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE5E11AA01
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Aug 2022 22:25:33 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id q14so11759701iod.3
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Aug 2022 15:25:33 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53]) by smtp.gmail.com with ESMTPSA id
 j133-20020a02638b000000b0033792143bf5sm6952716jac.67.2022.08.02.15.25.31
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 15:25:31 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id p81so11745295iod.2
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Aug 2022 15:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <YuEY1XNsPVb1GzcN@platvala-desk.ger.corp.intel.com>
 <165909113964.24436.14107587328065008371@emeril.freedesktop.org>
In-Reply-To: <165909113964.24436.14107587328065008371@emeril.freedesktop.org>
From: Jim Shargo <jshargo@chromium.org>
Date: Tue, 2 Aug 2022 18:25:19 -0400
Message-ID: <CACmi3jF=w8wYrHX82TKCkkrajt8vEmDnn6WHGmFXHs+Ar=fk1Q@mail.gmail.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Petri Latvala <petri.latvala@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Arkadiusz Hiler <arek@hiler.eu>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdG9vbGlu?=
	=?utf-8?q?g=3A_Add_linux=27s_=2Eclang-format_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jim Shargo <jshargo@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi!

Does this failure (which seems unrelated :P) block the submission?
Possible to re-run?

Thanks!




On Fri, Jul 29, 2022 at 6:39 AM Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> Patch Details
> Series:tooling: Add linux's .clang-format (rev3)
> URL:https://patchwork.freedesktop.org/series/106835/
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7582/index.html
>
> CI Bug Log - changes from IGT_6603_full -> IGTPW_7582_full
>
> Summary
>
> FAILURE
>
> Serious unknown changes coming with IGTPW_7582_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7582_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7582/index.html
>
> Participating hosts (7 -> 10)
>
> Additional (3): shard-rkl shard-dg1 shard-tglu
>
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_7582_full:
>
> IGT changes
>
> Possible regressions
>
> igt@kms_flip@flip-vs-modeset-vs-hang@c-dp1:
>
> shard-apl: PASS -> DMESG-WARN
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
> igt@kms_sysfs_edid_timing:
>
> {shard-dg1}: NOTRUN -> FAIL
>
> Known issues
>
> Here are the changes found in IGTPW_7582_full that come from known issues:
>
> IGT changes
>
> Issues hit
>
> igt@gem_busy@close-race:
>
> shard-snb: PASS -> INCOMPLETE (i915#6234)
>
> igt@gem_ctx_persistence@engines-hostile:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +1 similar issue
>
> igt@gem_ctx_sseu@engines:
>
> shard-tglb: NOTRUN -> SKIP (i915#280) +1 similar issue
>
> igt@gem_exec_balancer@parallel-contexts:
>
> shard-iclb: PASS -> SKIP (i915#4525) +1 similar issue
>
> igt@gem_exec_balancer@parallel-ordering:
>
> shard-tglb: NOTRUN -> FAIL (i915#6117)
>
> shard-iclb: NOTRUN -> SKIP (i915#4525) +1 similar issue
>
> shard-kbl: NOTRUN -> FAIL (i915#6117)
>
> igt@gem_exec_fair@basic-deadline:
>
> shard-glk: PASS -> FAIL (i915#2846)
>
> igt@gem_exec_fair@basic-pace-share@rcs0:
>
> shard-tglb: PASS -> FAIL (i915#2842)
>
> igt@gem_exec_fair@basic-sync@rcs0:
>
> shard-kbl: PASS -> SKIP (fdo#109271)
>
> igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#4613)
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>
> shard-iclb: NOTRUN -> SKIP (i915#4613)
>
> shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>
> igt@gem_lmem_swapping@parallel-random-engines:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 similar issue
>
> igt@gem_pxp@create-regular-context-2:
>
> shard-tglb: NOTRUN -> SKIP (i915#4270)
>
> shard-iclb: NOTRUN -> SKIP (i915#4270)
>
> igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>
> shard-iclb: NOTRUN -> SKIP (i915#768)
>
> igt@gen7_exec_parse@cmd-crossing-page:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109289) +2 similar issues
>
> shard-iclb: NOTRUN -> SKIP (fdo#109289) +1 similar issue
>
> igt@gen9_exec_parse@allowed-all:
>
> shard-glk: PASS -> DMESG-WARN (i915#5566 / i915#716)
>
> igt@gen9_exec_parse@basic-rejected-ctx-param:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271) +119 similar issues
>
> igt@gen9_exec_parse@unaligned-access:
>
> shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 similar issue
>
> shard-iclb: NOTRUN -> SKIP (i915#2856) +1 similar issue
>
> igt@i915_module_load@reload-with-fault-injection:
>
> shard-snb: PASS -> INCOMPLETE (i915#5178)
>
> igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#1937)
>
> shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#1937)
>
> igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271) +72 similar issues
>
> shard-iclb: NOTRUN -> SKIP (fdo#109293 / fdo#109506)
>
> shard-tglb: NOTRUN -> SKIP (fdo#109506 / i915#2411)
>
> igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
> shard-tglb: NOTRUN -> SKIP (i915#5286) +1 similar issue
>
> shard-iclb: NOTRUN -> SKIP (i915#5286) +1 similar issue
>
> igt@kms_big_fb@linear-32bpp-rotate-270:
>
> shard-tglb: NOTRUN -> SKIP (fdo#111614) +1 similar issue
>
> shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614) +1 similar issue
>
> igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>
> shard-iclb: NOTRUN -> SKIP (fdo#110723) +1 similar issue
>
> igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>
> shard-kbl: NOTRUN -> SKIP (fdo#109271) +115 similar issues
>
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
> shard-tglb: NOTRUN -> SKIP (fdo#111615) +2 similar issues
>
> igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs:
>
> shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +4 similar issues
>
> igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109278) +16 similar issues
>
> igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +2 similar issues
>
> shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +2 similar issues
>
> igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +4 similar issues
>
> igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095) +2 similar issues
>
> igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +1 similar issue
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +2 similar issues
>
> igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271) +132 similar issues
>
> igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#3689) +1 similar issue
>
> igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#6095) +2 similar issues
>
> igt@kms_chamelium@dp-hpd-for-each-pipe:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +7 similar issues
>
> igt@kms_chamelium@hdmi-mode-timings:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +11 similar issues
>
> igt@kms_color_chamelium@pipe-a-ctm-0-25:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +6 similar issues
>
> igt@kms_color_chamelium@pipe-b-ctm-0-5:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +6 similar issues
>
> igt@kms_color_chamelium@pipe-b-ctm-negative:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +7 similar issues
>
> igt@kms_color_chamelium@pipe-d-ctm-negative:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109284 / fdo#111827)
>
> shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar issues
>
> igt@kms_content_protection@legacy:
>
> shard-apl: NOTRUN -> TIMEOUT (i915#1319) +1 similar issue
>
> shard-tglb: NOTRUN -> SKIP (i915#1063) +1 similar issue
>
> shard-iclb: NOTRUN -> SKIP (fdo#109300 / fdo#111066) +1 similar issue
>
> shard-kbl: NOTRUN -> TIMEOUT (i915#1319) +1 similar issue
>
> igt@kms_content_protection@uevent:
>
> shard-kbl: NOTRUN -> FAIL (i915#2105)
>
> igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
>
> shard-apl: NOTRUN -> DMESG-WARN (i915#180)
>
> igt@kms_cursor_crc@cursor-suspend@pipe-b-edp-1:
>
> shard-iclb: NOTRUN -> DMESG-WARN (i915#2867)
>
> igt@kms_cursor_legacy@cursorb-vs-flipa@varying-size:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +6 similar issues
>
> igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled:
>
> shard-tglb: NOTRUN -> SKIP (i915#5287)
>
> shard-iclb: NOTRUN -> SKIP (i915#5287)
>
> igt@kms_fbcon_fbt@fbc-suspend:
>
> shard-apl: PASS -> INCOMPLETE (i915#180 / i915#4939)
>
> igt@kms_flip@2x-absolute-wf_vblank:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637 / i915#3966)
>
> igt@kms_flip@2x-flip-vs-panning:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109274) +11 similar issues
>
> igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
>
> shard-glk: PASS -> FAIL (i915#2122)
>
> igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637) +3 similar issues
>
> igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
>
> shard-apl: PASS -> FAIL (i915#79)
>
> igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#3555) +2 similar issues
>
> igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2672) +6 similar issues
>
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
>
> shard-tglb: NOTRUN -> SKIP (i915#2672) +1 similar issue
>
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 similar issue
>
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109280) +12 similar issues
>
> igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
>
> shard-tglb: NOTRUN -> SKIP (i915#6497) +4 similar issues
>
> igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +12 similar issues
>
> igt@kms_hdmi_inject@inject-audio:
>
> shard-tglb: PASS -> SKIP (i915#433)
>
> igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
>
> shard-kbl: PASS -> FAIL (i915#1188)
>
> igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>
> shard-iclb: NOTRUN -> SKIP (i915#3536) +2 similar issues
>
> igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:
>
> shard-tglb: NOTRUN -> SKIP (i915#3536) +3 similar issues
>
> igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
>
> shard-iclb: PASS -> SKIP (i915#5176) +1 similar issue
>
> igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>
> shard-tglb: NOTRUN -> SKIP (i915#2920)
>
> shard-iclb: NOTRUN -> SKIP (i915#2920)
>
> igt@kms_psr2_su@frontbuffer-xrgb8888:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar issue
>
> igt@kms_psr2_su@page_flip-nv12:
>
> shard-tglb: NOTRUN -> SKIP (i915#1911)
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar issue
>
> shard-iclb: NOTRUN -> FAIL (i915#5939)
>
> shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar issue
>
> igt@kms_psr@psr2_dpms:
>
> shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467)
>
> shard-iclb: NOTRUN -> SKIP (fdo#109441)
>
> igt@kms_psr@psr2_primary_page_flip:
>
> shard-iclb: PASS -> SKIP (fdo#109441) +2 similar issues
>
> igt@kms_vblank@pipe-b-ts-continuation-suspend:
>
> shard-apl: PASS -> DMESG-WARN (i915#180) +1 similar issue
>
> igt@kms_vrr@flip-suspend:
>
> shard-tglb: NOTRUN -> SKIP (i915#3555)
>
> igt@kms_writeback@writeback-invalid-parameters:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>
> shard-tglb: NOTRUN -> SKIP (i915#2437)
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>
> shard-iclb: NOTRUN -> SKIP (i915#2437)
>
> shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>
> igt@perf@polling-parameterized:
>
> shard-tglb: PASS -> FAIL (i915#5639)
>
> igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109291) +3 similar issues
>
> shard-iclb: NOTRUN -> SKIP (fdo#109291) +3 similar issues
>
> igt@sysfs_clients@create:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994)
>
> Possible fixes
>
> igt@gem_eio@in-flight-contexts-1us:
>
> shard-iclb: TIMEOUT (i915#3070) -> PASS
>
> igt@gem_exec_balancer@parallel:
>
> shard-iclb: SKIP (i915#4525) -> PASS
>
> igt@gem_exec_fair@basic-none@rcs0:
>
> shard-kbl: FAIL (i915#2842) -> PASS
>
> igt@gem_exec_fair@basic-pace-solo@rcs0:
>
> shard-iclb: FAIL (i915#2842) -> PASS
>
> igt@gem_huc_copy@huc-copy:
>
> shard-tglb: SKIP (i915#2190) -> PASS
>
> igt@i915_pm_dc@dc6-dpms:
>
> shard-iclb: FAIL (i915#454) -> PASS +1 similar issue
>
> igt@i915_pm_rpm@modeset-non-lpsp-stress:
>
> shard-kbl: TIMEOUT (i915#6168) -> PASS
>
> shard-apl: TIMEOUT (i915#6168) -> PASS
>
> igt@i915_suspend@forcewake:
>
> shard-kbl: DMESG-WARN (i915#180) -> PASS
>
> igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
>
> shard-apl: DMESG-WARN (i915#62) -> PASS +46 similar issues
>
> igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
>
> shard-glk: FAIL (i915#5160) -> PASS
>
> igt@kms_flip@blocking-wf_vblank@a-dp1:
>
> shard-apl: DMESG-WARN (i915#1982 / i915#62) -> PASS
>
> igt@kms_flip@flip-vs-suspend@a-dp1:
>
> shard-apl: DMESG-WARN (i915#180) -> PASS +3 similar issues
>
> igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
>
> shard-snb: SKIP (fdo#109271) -> PASS
>
> igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
>
> shard-kbl: FAIL (i915#1188) -> PASS
>
> igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
>
> shard-iclb: SKIP (i915#5235) -> PASS +2 similar issues
>
> igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-dp-1:
>
> shard-apl: DMESG-WARN (i915#180 / i915#62) -> PASS +2 similar issues
>
> igt@kms_psr@psr2_cursor_mmap_cpu:
>
> shard-iclb: SKIP (fdo#109441) -> PASS
>
> igt@kms_vblank@pipe-c-wait-busy-hang:
>
> shard-apl: SKIP (fdo#109271) -> PASS +11 similar issues
>
> Warnings
>
> igt@kms_content_protection@uevent:
>
> shard-apl: SKIP (fdo#109271) -> FAIL (i915#2105)
>
> igt@kms_psr2_sf@cursor-plane-update-sf:
>
> shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658) +1 similar issue
>
> igt@runner@aborted:
>
> shard-kbl: (FAIL, FAIL, FAIL) (i915#180 / i915#3002 / i915#4312 / i915#5257) -> (FAIL, FAIL) (i915#3002 / i915#4312 / i915#5257)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
> Build changes
>
> CI: CI-20190529 -> None
> IGT: IGT_6603 -> IGTPW_7582
>
> CI-20190529: 20190529
> CI_DRM_11946: 0e9c43d76a145712da46e935d429ce2a3eea80e8 @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7582: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7582/index.html
> IGT_6603: d851d950cf805f3021d67666db67e24fae1b99ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
