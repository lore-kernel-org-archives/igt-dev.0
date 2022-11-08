Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962DD10E4E5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 17:50:59 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id z192so18309260yba.0
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Nov 2022 09:50:59 -0800 (PST)
MIME-Version: 1.0
References: <20221107171845.3663446-1-markyacoub@chromium.org>
 <166785864332.17756.6219865571083239115@emeril.freedesktop.org>
In-Reply-To: <166785864332.17756.6219865571083239115@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 8 Nov 2022 12:50:48 -0500
Message-ID: <CAJUqKUqhsnM4n6Vi1K6+Zbx0AUBN0p8gEJ6uK09MOmV5TcbVyg@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Add_new_EDID_Resolution_List_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshminarayana, the failure looks irrelevant. Can I get a rerun?

On Mon, Nov 7, 2022 at 5:04 PM Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> Patch Details
> Series:Chamelium: Add new EDID Resolution List test
> URL:https://patchwork.freedesktop.org/series/110614/
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8059/index.html
>
> CI Bug Log - changes from CI_DRM_12351_full -> IGTPW_8059_full
>
> Summary
>
> FAILURE
>
> Serious unknown changes coming with IGTPW_8059_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8059_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8059/index.html
>
> Participating hosts (9 -> 6)
>
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
>
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_8059_full:
>
> IGT changes
>
> Possible regressions
>
> igt@kms_plane_multiple@tiling-y@pipe-b-edp-1:
>
> shard-tglb: PASS -> INCOMPLETE
>
> New tests
>
> New tests have been introduced between CI_DRM_12351_full and IGTPW_8059_full:
>
> New IGT tests (1)
>
> igt@kms_chamelium@dp-edid-resolution-list:
>
> Statuses : 5 skip(s)
> Exec time: [0.0] s
>
> Known issues
>
> Here are the changes found in IGTPW_8059_full that come from known issues:
>
> IGT changes
>
> Issues hit
>
> igt@gem_ctx_persistence@engines-mixed-process:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +1 similar issue
>
> igt@gem_exec_balancer@parallel-balancer:
>
> shard-iclb: PASS -> SKIP (i915#4525)
>
> igt@gem_exec_fair@basic-none-share@rcs0:
>
> shard-tglb: NOTRUN -> FAIL (i915#2842)
>
> igt@gem_exec_fair@basic-none@vcs0:
>
> shard-glk: PASS -> FAIL (i915#2842) +1 similar issue
>
> igt@gem_exec_fair@basic-pace@vcs1:
>
> shard-iclb: NOTRUN -> FAIL (i915#2842) +1 similar issue
>
> igt@gem_exec_params@secure-non-root:
>
> shard-iclb: NOTRUN -> SKIP (fdo#112283)
>
> shard-tglb: NOTRUN -> SKIP (fdo#112283)
>
> igt@gem_huc_copy@huc-copy:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2190)
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2190)
>
> shard-iclb: NOTRUN -> SKIP (i915#2190)
>
> igt@gem_mmap_gtt@coherency:
>
> shard-tglb: NOTRUN -> SKIP (fdo#111656)
>
> shard-iclb: NOTRUN -> SKIP (fdo#109292)
>
> igt@gem_pread@exhaustion:
>
> shard-apl: NOTRUN -> WARN (i915#2658)
>
> igt@gem_pxp@verify-pxp-stale-ctx-execution:
>
> shard-tglb: NOTRUN -> SKIP (i915#4270)
>
> shard-iclb: NOTRUN -> SKIP (i915#4270) +1 similar issue
>
> igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
>
> shard-iclb: NOTRUN -> SKIP (i915#768)
>
> igt@gem_userptr_blits@readonly-pwrite-unsync:
>
> shard-tglb: NOTRUN -> SKIP (i915#3297)
>
> shard-iclb: NOTRUN -> SKIP (i915#3297)
>
> igt@gen7_exec_parse@oacontrol-tracking:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271) +188 similar issues
>
> igt@gen9_exec_parse@allowed-single:
>
> shard-apl: PASS -> DMESG-WARN (i915#5566 / i915#716)
>
> igt@i915_pipe_stress@stress-xrgb8888-untiled:
>
> shard-apl: NOTRUN -> FAIL (i915#7036)
>
> igt@i915_pm_dc@dc5-psr:
>
> shard-tglb: PASS -> FAIL (i915#3989)
>
> igt@i915_pm_rps@engine-order:
>
> shard-apl: NOTRUN -> FAIL (i915#6537)
>
> igt@i915_suspend@fence-restore-tiled2untiled:
>
> shard-apl: PASS -> DMESG-WARN (i915#180) +2 similar issues
>
> igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
> shard-tglb: NOTRUN -> SKIP (i915#3826)
>
> shard-iclb: NOTRUN -> SKIP (i915#3826)
>
> igt@kms_atomic@atomic_plane_damage:
>
> shard-iclb: NOTRUN -> SKIP (i915#4765)
>
> igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
> shard-iclb: NOTRUN -> SKIP (i915#5286) +1 similar issue
>
> shard-tglb: NOTRUN -> SKIP (i915#5286) +1 similar issue
>
> igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271) +49 similar issues
>
> igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>
> shard-tglb: NOTRUN -> SKIP (fdo#111615)
>
> igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#6095)
>
> igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +5 similar issues
>
> igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109278) +8 similar issues
>
> igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
>
> shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689)
>
> igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095) +3 similar issues
>
> igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#3689) +1 similar issue
>
> {igt@kms_chamelium@dp-edid-resolution-list} (NEW):
>
> shard-iclb: NOTRUN -> SKIP (fdo#109284)
>
> shard-tglb: NOTRUN -> SKIP (fdo#109284)
>
> igt@kms_chamelium@dp-hpd-with-enabled-mode:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar issue
>
> igt@kms_chamelium@hdmi-hpd-for-each-pipe:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar issues
>
> shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar issue
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +1 similar issue
>
> igt@kms_chamelium@vga-frame-dump:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar issues
>
> igt@kms_content_protection@uevent:
>
> shard-iclb: NOTRUN -> SKIP (i915#7118)
>
> shard-tglb: NOTRUN -> SKIP (i915#6944 / i915#7118)
>
> igt@kms_content_protection@uevent@pipe-a-dp-1:
>
> shard-apl: NOTRUN -> FAIL (i915#1339)
>
> igt@kms_cursor_crc@cursor-onscreen-32x32:
>
> shard-tglb: NOTRUN -> SKIP (i915#3555) +1 similar issue
>
> igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +7 similar issues
>
> igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109274) +11 similar issues
>
> igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>
> shard-glk: PASS -> FAIL (i915#2346)
>
> igt@kms_cursor_legacy@flip-vs-cursor@toggle:
>
> shard-iclb: PASS -> FAIL (i915#2346) +2 similar issues
>
> igt@kms_dsc@dsc-with-bpc-formats:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#7205)
>
> igt@kms_flip@2x-nonexisting-fb:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271) +133 similar issues
>
> shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637) +2 similar issues
>
> igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>
> shard-tglb: NOTRUN -> SKIP (i915#2587 / i915#2672)
>
> igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672) +6 similar issues
>
> igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#3555) +2 similar issues
>
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2672)
>
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2672 / i915#3555)
>
> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>
> shard-tglb: NOTRUN -> SKIP (i915#6497) +4 similar issues
>
> igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +7 similar issues
>
> igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109280) +7 similar issues
>
> igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109289)
>
> shard-iclb: NOTRUN -> SKIP (fdo#109289)
>
> igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
>
> shard-iclb: PASS -> SKIP (i915#5235) +2 similar issues
>
> igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +2 similar issues
>
> igt@kms_psr@psr2_cursor_plane_onoff:
>
> shard-iclb: PASS -> SKIP (fdo#109441)
>
> igt@kms_psr@psr2_primary_mmap_cpu:
>
> shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467)
>
> igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
> shard-iclb: PASS -> SKIP (i915#5519)
>
> igt@kms_selftest@all:
>
> shard-tglb: NOTRUN -> SKIP (i915#6433)
>
> shard-iclb: NOTRUN -> SKIP (i915#6433)
>
> igt@kms_vblank@pipe-d-wait-idle:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#533)
>
> igt@kms_writeback@writeback-check-output:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>
> igt@prime_vgem@fence-flip-hang:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109295)
>
> shard-iclb: NOTRUN -> SKIP (fdo#109295)
>
> igt@sysfs_clients@fair-1:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994)
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994)
>
> shard-iclb: NOTRUN -> SKIP (i915#2994)
>
> Possible fixes
>
> igt@gem_ctx_exec@basic-nohangcheck:
>
> shard-tglb: FAIL (i915#6268) -> PASS
>
> igt@gem_exec_balancer@parallel-out-fence:
>
> shard-iclb: SKIP (i915#4525) -> PASS
>
> igt@gem_workarounds@suspend-resume-context:
>
> shard-apl: DMESG-WARN (i915#180) -> PASS +3 similar issues
>
> igt@i915_selftest@mock@sanitycheck:
>
> shard-snb: SKIP (fdo#109271) -> PASS +1 similar issue
>
> igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-1:
>
> shard-glk: DMESG-WARN (i915#118) -> PASS +1 similar issue
>
> igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>
> shard-glk: FAIL (i915#5138) -> PASS
>
> igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
>
> shard-glk: FAIL (i915#79) -> PASS +1 similar issue
>
> igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>
> shard-iclb: SKIP (i915#5235) -> PASS +2 similar issues
>
> igt@kms_psr@psr2_primary_blt:
>
> shard-iclb: SKIP (fdo#109441) -> PASS +3 similar issues
>
> igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
> shard-tglb: SKIP (i915#5519) -> PASS
>
> Warnings
>
> igt@gem_pwrite@basic-exhaustion:
>
> shard-tglb: INCOMPLETE (i915#7248) -> WARN (i915#2658)
>
> igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>
> shard-iclb: SKIP (i915#2920) -> SKIP (i915#658) +1 similar issue
>
> igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>
> shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658) +1 similar issue
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
> Build changes
>
> CI: CI-20190529 -> None
> IGT: IGT_7046 -> IGTPW_8059
> Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_12351: 74d8166a994863d1f83e842c1822506a8f6aa806 @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8059: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8059/index.html
> IGT_7046: c58d96d0fe237474b074e3472ce09c57c830d5de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
