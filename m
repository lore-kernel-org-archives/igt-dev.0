Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BB089CD3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 15:36:25 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id t20so15835025ljd.2
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 08:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210709152751.2947886-1-markyacoub@chromium.org>
 <162591513087.15855.7810972035705341058@emeril.freedesktop.org>
In-Reply-To: <162591513087.15855.7810972035705341058@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 20 Jul 2021 11:36:12 -0400
Message-ID: <CAJUqKUpRnuWKED4mPWNM1Lgx56aaUOoeoHLPsY2ELjMWpOm-Qg@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?kms=5Fatomic=3A_igt=5Frequire=5Fpipe=5Fcrc_for_plane=5Fi?=
	=?utf-8?q?mmutable=5Fzpos?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hello. This looks like a false positive. Thanks!

On Sat, Jul 10, 2021 at 7:05 AM Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> Patch Details
> Series:tests/kms_atomic: igt_require_pipe_crc for plane_immutable_zpos
> URL:https://patchwork.freedesktop.org/series/92369/
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6007/index.html
>
> CI Bug Log - changes from CI_DRM_10326_full -> IGTPW_6007_full
>
> Summary
>
> FAILURE
>
> Serious unknown changes coming with IGTPW_6007_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6007_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6007/index.html
>
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_6007_full:
>
> IGT changes
>
> Possible regressions
>
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>
> shard-glk: PASS -> FAIL
>
> Known issues
>
> Here are the changes found in IGTPW_6007_full that come from known issues:
>
> IGT changes
>
> Issues hit
>
> igt@feature_discovery@display-4x:
>
> shard-tglb: NOTRUN -> SKIP ([i915#1839])
>
> shard-iclb: NOTRUN -> SKIP ([i915#1839])
>
> igt@gem_create@create-clear:
>
> shard-glk: PASS -> FAIL ([i915#1888] / [i915#3160])
>
> igt@gem_create@create-massive:
>
> shard-iclb: NOTRUN -> DMESG-WARN ([i915#3002])
>
> shard-tglb: NOTRUN -> DMESG-WARN ([i915#3002])
>
> shard-glk: NOTRUN -> DMESG-WARN ([i915#3002])
>
> shard-apl: NOTRUN -> DMESG-WARN ([i915#3002])
>
> igt@gem_ctx_persistence@legacy-engines-mixed:
>
> shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +5 similar issues
>
> igt@gem_exec_fair@basic-deadline:
>
> shard-kbl: PASS -> FAIL ([i915#2846])
>
> shard-apl: NOTRUN -> FAIL ([i915#2846])
>
> igt@gem_exec_fair@basic-none-share@rcs0:
>
> shard-tglb: PASS -> FAIL ([i915#2842])
>
> igt@gem_exec_fair@basic-pace@vcs1:
>
> shard-kbl: PASS -> FAIL ([i915#2842])
>
> igt@gem_exec_fair@basic-throttle@rcs0:
>
> shard-glk: PASS -> FAIL ([i915#2842]) +1 similar issue
>
> shard-iclb: PASS -> FAIL ([i915#2849])
>
> igt@gem_exec_whisper@basic-normal-all:
>
> shard-glk: PASS -> DMESG-WARN ([i915#118] / [i915#95])
>
> igt@gem_mmap_gtt@coherency:
>
> shard-tglb: NOTRUN -> SKIP ([fdo#111656])
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109292])
>
> igt@gem_userptr_blits@dmabuf-sync:
>
> shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3323])
>
> igt@gem_userptr_blits@readonly-pwrite-unsync:
>
> shard-iclb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
>
> igt@gem_userptr_blits@unsync-unmap-after-close:
>
> shard-tglb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
>
> igt@gem_userptr_blits@vma-merge:
>
> shard-snb: NOTRUN -> FAIL ([i915#2724])
>
> igt@gen3_render_linear_blits:
>
> shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +2 similar issues
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +2 similar issues
>
> igt@gen9_exec_parse@basic-rejected:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#112306]) +3 similar issues
>
> igt@gen9_exec_parse@bb-large:
>
> shard-apl: NOTRUN -> FAIL ([i915#3296])
>
> igt@gen9_exec_parse@bb-start-out:
>
> shard-tglb: NOTRUN -> SKIP ([fdo#112306]) +3 similar issues
>
> igt@i915_pm_dc@dc6-dpms:
>
> shard-kbl: NOTRUN -> FAIL ([i915#454])
>
> igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>
> shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#1937])
>
> igt@i915_pm_rc6_residency@rc6-fence:
>
> shard-tglb: NOTRUN -> WARN ([i915#2681])
>
> shard-iclb: NOTRUN -> WARN ([i915#2684])
>
> igt@i915_pm_rpm@modeset-non-lpsp-stress:
>
> shard-tglb: NOTRUN -> SKIP ([fdo#111644] / [i915#1397] / [i915#2411])
>
> shard-iclb: NOTRUN -> SKIP ([fdo#110892])
>
> igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
> shard-glk: NOTRUN -> FAIL ([i915#3745])
>
> igt@kms_atomic_transition@plane-all-modeset-transition:
>
> shard-iclb: NOTRUN -> SKIP ([i915#1769])
>
> shard-tglb: NOTRUN -> SKIP ([i915#1769])
>
> igt@kms_big_fb@linear-16bpp-rotate-90:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614])
>
> shard-tglb: NOTRUN -> SKIP ([fdo#111614])
>
> igt@kms_big_fb@linear-32bpp-rotate-0:
>
> shard-glk: NOTRUN -> DMESG-WARN ([i915#118] / [i915#95])
>
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
> shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +1 similar issue
>
> igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>
> shard-tglb: NOTRUN -> SKIP ([i915#3689]) +8 similar issues
>
> igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
>
> shard-snb: NOTRUN -> SKIP ([fdo#109271]) +479 similar issues
>
> igt@kms_chamelium@hdmi-crc-nonplanar-formats:
>
> shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +11 similar issues
>
> igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
>
> shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +25 similar issues
>
> igt@kms_chamelium@vga-hpd:
>
> shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +21 similar issues
>
> igt@kms_color_chamelium@pipe-a-ctm-0-75:
>
> shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +19 similar issues
>
> igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +8 similar issues
>
> igt@kms_color_chamelium@pipe-b-ctm-0-75:
>
> shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +8 similar issues
>
> igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] / [fdo#111827])
>
> igt@kms_content_protection@atomic:
>
> shard-kbl: NOTRUN -> TIMEOUT ([i915#1319]) +1 similar issue
>
> shard-apl: NOTRUN -> TIMEOUT ([i915#1319]) +1 similar issue
>
> igt@kms_content_protection@content_type_change:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066]) +2 similar issues
>
> shard-tglb: NOTRUN -> SKIP ([fdo#111828]) +2 similar issues
>
> igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:
>
> shard-tglb: NOTRUN -> SKIP ([i915#3319])
>
> igt@kms_cursor_crc@pipe-a-cursor-suspend:
>
> shard-kbl: PASS -> DMESG-WARN ([i915#180]) +5 similar issues
>
> igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:
>
> shard-tglb: NOTRUN -> SKIP ([i915#3359]) +2 similar issues
>
> igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +2 similar issues
>
> igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
>
> shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +2 similar issues
>
> igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
>
> shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +226 similar issues
>
> igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +27 similar issues
>
> igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +2 similar issues
>
> igt@kms_dp_tiled_display@basic-test-pattern:
>
> shard-iclb: NOTRUN -> SKIP ([i915#426])
>
> shard-tglb: NOTRUN -> SKIP ([i915#426])
>
> igt@kms_flip@2x-plain-flip-ts-check:
>
> shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +28 similar issues
>
> igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
>
> shard-apl: NOTRUN -> DMESG-WARN ([i915#180]) +2 similar issues
>
> igt@kms_flip@flip-vs-suspend@c-dp1:
>
> shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +3 similar issues
>
> igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +21 similar issues
>
> igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>
> shard-glk: NOTRUN -> SKIP ([fdo#109271]) +110 similar issues
>
> igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
>
> shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>
> igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
>
> shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>
> igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
>
> shard-apl: PASS -> DMESG-WARN ([i915#180])
>
> igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>
> shard-kbl: NOTRUN -> FAIL ([i915#265])
>
> igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
>
> shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar issue
>
> igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
>
> shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>
> igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +3 similar issues
>
> igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
>
> shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
>
> igt@kms_psr2_sf@cursor-plane-update-sf:
>
> shard-tglb: NOTRUN -> SKIP ([i915#2920]) +1 similar issue
>
> igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
>
> shard-iclb: NOTRUN -> SKIP ([i915#658]) +2 similar issues
>
> igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
>
> shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +2 similar issues
>
> shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +4 similar issues
>
> igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
>
> shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +4 similar issues
>
> igt@kms_psr@psr2_primary_mmap_cpu:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109441]) +2 similar issues
>
> igt@kms_psr@psr2_sprite_blt:
>
> shard-iclb: PASS -> SKIP ([fdo#109441])
>
> igt@kms_psr@psr2_sprite_render:
>
> shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +2 similar issues
>
> igt@kms_sysfs_edid_timing:
>
> shard-apl: NOTRUN -> FAIL ([IGT#2])
>
> igt@kms_vblank@pipe-a-ts-continuation-suspend:
>
> shard-kbl: PASS -> DMESG-WARN ([i915#180] / [i915#295])
>
> igt@kms_vblank@pipe-d-ts-continuation-idle:
>
> shard-apl: NOTRUN -> SKIP ([fdo#109271]) +237 similar issues
>
> igt@kms_vblank@pipe-d-wait-idle:
>
> shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar issue
>
> igt@kms_writeback@writeback-fb-id:
>
> shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
>
> igt@nouveau_crc@pipe-c-ctx-flip-detection:
>
> shard-iclb: NOTRUN -> SKIP ([i915#2530]) +1 similar issue
>
> igt@nouveau_crc@pipe-d-ctx-flip-detection:
>
> shard-tglb: NOTRUN -> SKIP ([i915#2530]) +2 similar issues
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#2530])
>
> igt@prime_nv_api@i915_nv_double_export:
>
> shard-iclb: NOTRUN -> SKIP ([fdo#109291])
>
> shard-tglb: NOTRUN -> SKIP ([fdo#109291])
>
> igt@sysfs_clients@create:
>
> shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar issue
>
> igt@sysfs_clients@pidname:
>
> shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994])
>
> Possible fixes
>
> igt@gem_exec_fair@basic-none-rrul@rcs0:
>
> shard-glk: FAIL ([i915#2842]) -> PASS +3 similar issues
>
> igt@gem_exec_fair@basic-none@vcs0:
>
> shard-kbl: FAIL ([i915#2842]) -> PASS
>
> igt@gem_exec_fair@basic-pace@vcs1:
>
> shard-tglb: FAIL ([i915#2842]) -> PASS +1 similar issue
>
> igt@gem_exec_fair@basic-pace@vecs0:
>
> shard-kbl: SKIP ([fdo#109271]) -> PASS
>
> shard-iclb: FAIL ([i915#2842]) -> PASS
>
> igt@i915_pm_dc@dc9-dpms:
>
> shard-apl: SKIP ([fdo#109271]) -> PASS
>
> igt@i915_suspend@forcewake:
>
> shard-kbl: DMESG-WARN ([i915#180]) -> PASS +1 similar issue
>
> igt@kms_big_fb@linear-32bpp-rotate-180:
>
> shard-glk: DMESG-WARN ([i915#118] / [i915#95]) -> PASS
>
> igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>
> shard-glk: FAIL -> PASS
>
> igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
>
> shard-kbl: FAIL ([i915#3444]) -> PASS
>
> igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
>
> shard-glk: FAIL ([i915#79]) -> PASS
>
> igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
>
> shard-glk: FAIL ([i915#2122]) -> PASS
>
> igt@kms_psr@psr2_no_drrs:
>
> shard-iclb: SKIP ([fdo#109441]) -> PASS +2 similar issues
>
> Warnings
>
> igt@i915_pm_dc@dc9-dpms:
>
> shard-iclb: FAIL ([i915#3343]) -> SKIP ([i915#3288])
>
> igt@i915_pm_rc6_residency@rc6-idle:
>
> shard-iclb: WARN ([i915#2684]) -> FAIL ([i915#2680])
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
