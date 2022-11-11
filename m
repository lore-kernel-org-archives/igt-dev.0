Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE4D10E876
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 16:03:47 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id b131so5638189yba.11
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 08:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20221103160840.1661858-1-markyacoub@chromium.org>
 <166811211470.16949.13010795556081810931@emeril.freedesktop.org>
In-Reply-To: <166811211470.16949.13010795556081810931@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 11 Nov 2022 11:03:36 -0500
Message-ID: <CAJUqKUrLHB73kbBvWmJmoQ4G657hWzNzt7L4FtBw0ddfdCA3oQ@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Add_more_real_monitor_EDIDs_=28rev3=29?=
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

Hi Lakshminarayana, this might look related, but v3 is just a
formatting fix compared to v2 so i don't think the failure is real,
can i get a rerun?

On Thu, Nov 10, 2022 at 3:28 PM Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> Patch Details
> Series:Chamelium: Add more real monitor EDIDs (rev3)
> URL:https://patchwork.freedesktop.org/series/110496/
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8083/index.html
>
> CI Bug Log - changes from CI_DRM_12365_full -> IGTPW_8083_full
>
> Summary
>
> FAILURE
>
> Serious unknown changes coming with IGTPW_8083_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8083_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8083/index.html
>
> Participating hosts (11 -> 8)
>
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
>
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_8083_full:
>
> IGT changes
>
> Possible regressions
>
> igt@i915_selftest@live@hangcheck:
>
> shard-tglb: PASS -> INCOMPLETE
>
> {igt@kms_chamelium@dp-edid-stress-resolution-4k} (NEW):
>
> {shard-rkl}: NOTRUN -> SKIP +2 similar issues
>
> {shard-dg1}: NOTRUN -> SKIP +3 similar issues
>
> Warnings
>
> igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
>
> shard-apl: FAIL (i915#4573) -> DMESG-FAIL +1 similar issue
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
> igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>
> {shard-dg1}: PASS -> INCOMPLETE
>
> igt@kms_invalid_mode@int-max-clock:
>
> {shard-rkl}: NOTRUN -> SKIP
>
> New tests
>
> New tests have been introduced between CI_DRM_12365_full and IGTPW_8083_full:
>
> New IGT tests (4)
>
> igt@kms_chamelium@dp-edid-stress-resolution-4k:
>
> Statuses : 7 skip(s)
> Exec time: [0.0] s
>
> igt@kms_chamelium@dp-edid-stress-resolution-non-4k:
>
> Statuses : 7 skip(s)
> Exec time: [0.0] s
>
> igt@kms_chamelium@hdmi-edid-stress-resolution-4k:
>
> Statuses : 6 skip(s)
> Exec time: [0.0] s
>
> igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k:
>
> Statuses : 6 skip(s)
> Exec time: [0.0] s
>
> Known issues
>
> Here are the changes found in IGTPW_8083_full that come from known issues:
>
> IGT changes
>
> Issues hit
>
> igt@gem_create@create-massive:
>
> shard-snb: NOTRUN -> DMESG-WARN (i915#4991)
>
> igt@gem_ctx_shared@create-shared-gtt:
>
> shard-glk: PASS -> DMESG-WARN (i915#118)
>
> igt@gem_ctx_sseu@invalid-args:
>
> shard-tglb: NOTRUN -> SKIP (i915#280)
>
> igt@gem_exec_balancer@parallel-contexts:
>
> shard-iclb: NOTRUN -> SKIP (i915#4525)
>
> igt@gem_exec_fair@basic-none@vcs1:
>
> shard-iclb: NOTRUN -> FAIL (i915#2842) +1 similar issue
>
> igt@gem_exec_fair@basic-pace@rcs0:
>
> shard-glk: PASS -> FAIL (i915#2842) +2 similar issues
>
> igt@gem_exec_schedule@preempt-user:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271) +27 similar issues
>
> igt@gem_huc_copy@huc-copy:
>
> shard-tglb: PASS -> SKIP (i915#2190)
>
> igt@gem_lmem_swapping@heavy-verify-random:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>
> igt@gem_softpin@evict-single-offset:
>
> shard-iclb: PASS -> FAIL (i915#4171)
>
> igt@gem_userptr_blits@readonly-unsync:
>
> shard-iclb: NOTRUN -> SKIP (i915#3297)
>
> shard-tglb: NOTRUN -> SKIP (i915#3297)
>
> igt@i915_module_load@resize-bar:
>
> shard-iclb: NOTRUN -> SKIP (i915#6412)
>
> shard-tglb: NOTRUN -> SKIP (i915#6412)
>
> igt@i915_pm_dc@dc6-psr:
>
> shard-iclb: PASS -> FAIL (i915#3989 / i915#454)
>
> igt@i915_pm_dc@dc9-dpms:
>
> shard-iclb: PASS -> SKIP (i915#4281)
>
> igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271) +32 similar issues
>
> igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>
> shard-tglb: NOTRUN -> SKIP (i915#5286)
>
> shard-iclb: NOTRUN -> SKIP (i915#5286)
>
> igt@kms_big_fb@linear-64bpp-rotate-180:
>
> shard-glk: PASS -> FAIL (i915#5138)
>
> igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +4 similar issues
>
> igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109278) +2 similar issues
>
> shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095)
>
> igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886)
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886)
>
> shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886)
>
> igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#3689) +1 similar issue
>
> {igt@kms_chamelium@dp-edid-stress-resolution-4k} (NEW):
>
> shard-tglb: NOTRUN -> SKIP (fdo#109284) +2 similar issues
>
> igt@kms_chamelium@dp-hpd-fast:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar issue
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +1 similar issue
>
> igt@kms_chamelium@dp-hpd-with-enabled-mode:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar issues
>
> {igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k} (NEW):
>
> shard-iclb: NOTRUN -> SKIP (fdo#109284) +3 similar issues
>
> igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar issue
>
> shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +1 similar issue
>
> igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
>
> shard-apl: PASS -> DMESG-WARN (i915#180)
>
> igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825)
>
> shard-iclb: NOTRUN -> SKIP (fdo#109274)
>
> igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2672) +1 similar issue
>
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
>
> shard-iclb: PASS -> SKIP (i915#3555)
>
> igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#3555)
>
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 similar issues
>
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109280)
>
> shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825)
>
> igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271) +13 similar issues
>
> igt@kms_plane_lowres@tiling-yf:
>
> shard-tglb: NOTRUN -> SKIP (fdo#112054 / i915#5288)
>
> igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
>
> shard-iclb: NOTRUN -> SKIP (i915#3536) +2 similar issues
>
> igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>
> shard-iclb: PASS -> SKIP (i915#5235) +2 similar issues
>
> igt@kms_psr2_su@page_flip-nv12:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
>
> shard-iclb: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#658)
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
>
> igt@kms_psr@psr2_sprite_plane_move:
>
> shard-iclb: PASS -> SKIP (fdo#109441) +2 similar issues
>
> igt@sysfs_clients@fair-1:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994)
>
> Possible fixes
>
> igt@fbdev@write:
>
> {shard-rkl}: SKIP (i915#2582) -> PASS
>
> igt@gem_ctx_exec@basic-nohangcheck:
>
> shard-tglb: FAIL (i915#6268) -> PASS
>
> igt@gem_ctx_persistence@smoketest:
>
> shard-iclb: FAIL (i915#5099) -> PASS
>
> igt@gem_eio@in-flight-suspend:
>
> {shard-rkl}: FAIL (fdo#103375) -> PASS
>
> igt@gem_exec_balancer@parallel:
>
> shard-iclb: SKIP (i915#4525) -> PASS +1 similar issue
>
> igt@gem_exec_fair@basic-flow@rcs0:
>
> shard-tglb: FAIL (i915#2842) -> PASS
>
> igt@gem_exec_reloc@basic-gtt-read-noreloc:
>
> {shard-rkl}: SKIP (i915#3281) -> PASS +6 similar issues
>
> igt@gem_mmap_gtt@coherency:
>
> {shard-rkl}: SKIP (fdo#111656) -> PASS
>
> igt@gem_pwrite@basic-self:
>
> {shard-rkl}: SKIP (i915#3282) -> PASS +3 similar issues
>
> igt@gen9_exec_parse@bb-start-far:
>
> {shard-rkl}: SKIP (i915#2527) -> PASS +1 similar issue
>
> igt@i915_hangman@engine-engine-error@bcs0:
>
> {shard-rkl}: SKIP (i915#6258) -> PASS
>
> igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>
> {shard-rkl}: WARN (i915#2681) -> PASS
>
> igt@i915_pm_rps@engine-order:
>
> {shard-rkl}: FAIL -> PASS
>
> igt@i915_selftest@perf@engine_cs:
>
> shard-snb: SKIP (fdo#109271) -> PASS
>
> igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:
>
> shard-apl: FAIL (i915#2521) -> PASS
>
> igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
>
> shard-iclb: FAIL (i915#2521) -> PASS
>
> igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
>
> shard-glk: DMESG-FAIL (i915#118 / i915#5138) -> PASS
>
> igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
>
> shard-glk: FAIL (i915#79) -> PASS
>
> igt@kms_frontbuffer_tracking@fbc-suspend:
>
> shard-apl: DMESG-WARN (i915#180) -> PASS
>
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>
> {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +9 similar issues
>
> igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
>
> {shard-rkl}: SKIP (i915#3558) -> PASS +1 similar issue
>
> igt@kms_psr@psr2_sprite_mmap_gtt:
>
> shard-iclb: SKIP (fdo#109441) -> PASS +2 similar issues
>
> igt@kms_psr@sprite_blt:
>
> {shard-rkl}: SKIP (i915#1072) -> PASS
>
> igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
> shard-iclb: SKIP (i915#5519) -> PASS
>
> igt@kms_pwrite_crc:
>
> {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +8 similar issues
>
> igt@kms_universal_plane@cursor-fb-leak-pipe-a:
>
> {shard-rkl}: SKIP (i915#1845 / i915#4070 / i915#4098) -> PASS
>
> igt@perf@gen12-mi-rpc:
>
> {shard-rkl}: SKIP (fdo#109289) -> PASS
>
> igt@perf_pmu@all-busy-idle-check-all:
>
> {shard-dg1}: FAIL (i915#5234) -> PASS
>
> igt@testdisplay:
>
> {shard-rkl}: SKIP (i915#4098) -> PASS
>
> Warnings
>
> igt@gem_exec_balancer@parallel-ordering:
>
> shard-iclb: FAIL (i915#6117) -> SKIP (i915#4525)
>
> igt@gem_pread@exhaustion:
>
> shard-tglb: INCOMPLETE (i915#7248) -> WARN (i915#2658)
>
> igt@i915_pm_dc@dc9-dpms:
>
> shard-apl: SKIP (fdo#109271) -> FAIL (i915#4275)
>
> igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>
> shard-iclb: SKIP (i915#2920) -> SKIP (i915#658) +1 similar issue
>
> igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>
> shard-iclb: SKIP (i915#658) -> SKIP (i915#2920)
>
> igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>
> shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>
> igt@runner@aborted:
>
> shard-apl: (FAIL, FAIL, FAIL) (fdo#109271 / i915#3002 / i915#4312) -> (FAIL, FAIL, FAIL) (i915#3002 / i915#4312)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
> Build changes
>
> CI: CI-20190529 -> None
> IGT: IGT_7050 -> IGTPW_8083
> Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_12365: 1bda5b0abc8a0d9d53d9fec1a390dc93e2b0ba57 @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8083: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8083/index.html
> IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
