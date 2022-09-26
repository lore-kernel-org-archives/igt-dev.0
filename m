Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A7C10E6EE
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 15:36:04 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-324ec5a9e97so72607837b3.7
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 08:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220923200504.1291737-1-markyacoub@chromium.org>
 <166402282091.5802.7603027426165938727@emeril.freedesktop.org>
In-Reply-To: <166402282091.5802.7603027426165938727@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 26 Sep 2022 11:35:52 -0400
Message-ID: <CAJUqKUp9BuZg70cxF=Jz8E_w=Kh4N+Y8KOsFRhKuYRU+-TJGvA@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Handle_getting_port_connector_if_it=27s_MST=2E?=
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

Hello Lakshminarayana, I think the error here is also unrelated. I did
change igt_kms but I added a new function that's only used in
Chamelium so it should be unrelated to the failure. Can i get a rerun?
Thanks!

On Sat, Sep 24, 2022 at 8:33 AM Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> Patch Details
> Series:Chamelium: Handle getting port connector if it's MST.
> URL:https://patchwork.freedesktop.org/series/108984/
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7833/index.html
>
> CI Bug Log - changes from CI_DRM_12176_full -> IGTPW_7833_full
>
> Summary
>
> FAILURE
>
> Serious unknown changes coming with IGTPW_7833_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7833_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7833/index.html
>
> Participating hosts (10 -> 8)
>
> Additional (1): shard-rkl
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
>
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_7833_full:
>
> IGT changes
>
> Possible regressions
>
> igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs:
>
> shard-tglb: PASS -> INCOMPLETE
>
> igt@perf@i915-ref-count:
>
> shard-apl: PASS -> FAIL
>
> Known issues
>
> Here are the changes found in IGTPW_7833_full that come from known issues:
>
> IGT changes
>
> Issues hit
>
> igt@gem_exec_balancer@parallel-out-fence:
>
> shard-iclb: PASS -> SKIP (i915#4525) +1 similar issue
>
> igt@gem_exec_fair@basic-none-vip@rcs0:
>
> shard-tglb: NOTRUN -> FAIL (i915#2842)
>
> shard-glk: NOTRUN -> FAIL (i915#2842)
>
> shard-iclb: NOTRUN -> FAIL (i915#2842)
>
> igt@gem_exec_fair@basic-pace-share@rcs0:
>
> shard-tglb: PASS -> FAIL (i915#2842)
>
> igt@gem_exec_fair@basic-pace@vcs0:
>
> shard-glk: PASS -> FAIL (i915#2842) +2 similar issues
>
> igt@gem_huc_copy@huc-copy:
>
> shard-tglb: PASS -> SKIP (i915#2190)
>
> igt@gem_lmem_swapping@parallel-random:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>
> igt@gem_userptr_blits@unsync-unmap-after-close:
>
> shard-tglb: NOTRUN -> SKIP (i915#3297)
>
> shard-iclb: NOTRUN -> SKIP (i915#3297)
>
> igt@gen9_exec_parse@basic-rejected:
>
> shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 similar issue
>
> igt@gen9_exec_parse@batch-without-end:
>
> shard-iclb: NOTRUN -> SKIP (i915#2856) +1 similar issue
>
> igt@i915_pm_dc@dc9-dpms:
>
> shard-apl: PASS -> SKIP (fdo#109271)
>
> igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>
> shard-tglb: PASS -> WARN (i915#2681)
>
> igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
> shard-iclb: NOTRUN -> SKIP (fdo#110892)
>
> shard-tglb: NOTRUN -> SKIP (fdo#111644 / i915#1397 / i915#2411)
>
> igt@i915_selftest@live@hangcheck:
>
> shard-tglb: PASS -> DMESG-WARN (i915#5591)
>
> igt@i915_suspend@sysfs-reader:
>
> shard-apl: PASS -> DMESG-WARN (i915#180) +2 similar issues
>
> igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
> shard-iclb: NOTRUN -> SKIP (i915#1769)
>
> shard-tglb: NOTRUN -> SKIP (i915#1769)
>
> igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>
> shard-tglb: NOTRUN -> SKIP (i915#5286)
>
> shard-iclb: NOTRUN -> SKIP (i915#5286)
>
> igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
> shard-tglb: PASS -> FAIL (i915#3743) +1 similar issue
>
> igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>
> shard-iclb: NOTRUN -> SKIP (fdo#110723)
>
> shard-tglb: NOTRUN -> SKIP (fdo#111615)
>
> igt@kms_big_joiner@basic:
>
> shard-iclb: NOTRUN -> SKIP (i915#2705)
>
> shard-tglb: NOTRUN -> SKIP (i915#2705)
>
> igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
>
> shard-tglb: NOTRUN -> SKIP (i915#6095)
>
> igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095)
>
> igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +3 similar issues
>
> igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#3689)
>
> igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +2 similar issues
>
> shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886)
>
> igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:
>
> shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +2 similar issues
>
> igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +4 similar issues
>
> igt@kms_chamelium@hdmi-edid-change-during-suspend:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar issues
>
> igt@kms_chamelium@vga-hpd-with-enabled-mode:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +1 similar issue
>
> shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar issue
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar issues
>
> shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar issue
>
> igt@kms_content_protection@mei_interface:
>
> shard-tglb: NOTRUN -> SKIP (i915#1063)
>
> shard-iclb: NOTRUN -> SKIP (fdo#109300 / fdo#111066)
>
> igt@kms_cursor_crc@cursor-random-32x32:
>
> shard-tglb: NOTRUN -> SKIP (i915#3555)
>
> shard-iclb: NOTRUN -> SKIP (i915#3555)
>
> igt@kms_cursor_crc@cursor-sliding-512x512:
>
> shard-tglb: NOTRUN -> SKIP (i915#3359)
>
> shard-iclb: NOTRUN -> SKIP (i915#3359)
>
> igt@kms_flip@2x-flip-vs-panning-interruptible:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109274)
>
> shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
>
> igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
>
> shard-glk: PASS -> FAIL (i915#79)
>
> igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672) +4 similar issues
>
> shard-tglb: NOTRUN -> SKIP (i915#2587 / i915#2672)
>
> igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
>
> shard-iclb: PASS -> SKIP (i915#3555)
>
> igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2672) +2 similar issues
>
> igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
>
> shard-glk: PASS -> FAIL (i915#1888 / i915#2546)
>
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109280) +10 similar issues
>
> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>
> shard-tglb: NOTRUN -> SKIP (i915#6497) +1 similar issue
>
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271) +61 similar issues
>
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271) +67 similar issues
>
> igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +10 similar issues
>
> igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>
> shard-apl: NOTRUN -> FAIL (fdo#108145 / i915#265)
>
> shard-glk: NOTRUN -> FAIL (fdo#108145 / i915#265) +1 similar issue
>
> igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
>
> shard-apl: NOTRUN -> FAIL (i915#265)
>
> shard-glk: NOTRUN -> FAIL (i915#265)
>
> igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp-1:
>
> shard-iclb: NOTRUN -> SKIP (i915#5176) +5 similar issues
>
> igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1:
>
> shard-tglb: NOTRUN -> SKIP (i915#5176) +7 similar issues
>
> igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1:
>
> shard-iclb: NOTRUN -> SKIP (i915#5235) +2 similar issues
>
> igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:
>
> shard-tglb: NOTRUN -> SKIP (i915#5235) +3 similar issues
>
> igt@kms_properties@plane-properties-legacy:
>
> shard-snb: PASS -> SKIP (fdo#109271)
>
> igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
>
> igt@kms_psr2_su@page_flip-xrgb8888:
>
> shard-iclb: PASS -> SKIP (fdo#109642 / fdo#111068 / i915#658)
>
> igt@kms_psr@psr2_basic:
>
> shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +1 similar issue
>
> igt@kms_psr@psr2_cursor_mmap_gtt:
>
> shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>
> igt@kms_psr@psr2_sprite_render:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109441) +1 similar issue
>
> igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271) +88 similar issues
>
> igt@kms_setmode@basic@pipe-a-vga-1:
>
> shard-snb: NOTRUN -> FAIL (i915#5465) +1 similar issue
>
> igt@kms_vblank@pipe-d-query-forked-hang:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109278) +9 similar issues
>
> igt@kms_vblank@pipe-d-wait-idle:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#533)
>
> igt@nouveau_crc@pipe-a-source-outp-inactive:
>
> shard-iclb: NOTRUN -> SKIP (i915#2530)
>
> shard-tglb: NOTRUN -> SKIP (i915#2530)
>
> igt@perf@polling-parameterized:
>
> shard-tglb: PASS -> FAIL (i915#5639)
>
> igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109291) +1 similar issue
>
> shard-iclb: NOTRUN -> SKIP (fdo#109291) +1 similar issue
>
> Possible fixes
>
> igt@gem_ctx_exec@basic-nohangcheck:
>
> shard-tglb: FAIL (i915#6268) -> PASS
>
> igt@gem_exec_balancer@parallel-bb-first:
>
> shard-iclb: SKIP (i915#4525) -> PASS
>
> igt@gem_exec_fair@basic-deadline:
>
> shard-tglb: DMESG-FAIL -> PASS
>
> igt@gem_exec_fair@basic-flow@rcs0:
>
> shard-tglb: FAIL (i915#2842) -> PASS
>
> igt@gem_exec_fair@basic-none-share@rcs0:
>
> {shard-tglu}: FAIL (i915#2842) -> PASS
>
> igt@gem_exec_fair@basic-pace-solo@rcs0:
>
> shard-apl: FAIL (i915#2842) -> PASS
>
> igt@gen9_exec_parse@allowed-all:
>
> shard-glk: DMESG-WARN (i915#5566 / i915#716) -> PASS
>
> igt@gen9_exec_parse@allowed-single:
>
> shard-apl: DMESG-WARN (i915#5566 / i915#716) -> PASS
>
> igt@i915_pm_dc@dc9-dpms:
>
> shard-iclb: SKIP (i915#4281) -> PASS
>
> igt@i915_pm_rc6_residency@rc6-fence:
>
> {shard-tglu}: WARN (i915#2681) -> PASS
>
> igt@kms_big_fb@linear-16bpp-rotate-180:
>
> shard-glk: DMESG-FAIL (i915#118 / i915#1888) -> PASS
>
> igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
>
> shard-iclb: SKIP (i915#3555) -> PASS
>
> igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>
> shard-iclb: DMESG-WARN (i915#2867) -> PASS +1 similar issue
>
> igt@kms_lease@invalid-create-leases:
>
> shard-apl: DMESG-WARN (i915#62) -> PASS
>
> igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1:
>
> shard-iclb: SKIP (i915#5176) -> PASS +2 similar issues
>
> igt@kms_psr@psr2_dpms:
>
> shard-iclb: SKIP (fdo#109441) -> PASS +2 similar issues
>
> igt@kms_vblank@pipe-b-ts-continuation-suspend:
>
> shard-snb: DMESG-WARN (i915#5090) -> PASS
>
> Warnings
>
> igt@gem_exec_balancer@parallel-ordering:
>
> shard-iclb: SKIP (i915#4525) -> FAIL (i915#6117)
>
> igt@gem_exec_fair@basic-pace@vcs1:
>
> shard-tglb: FAIL (i915#2842) -> SKIP (i915#2848) +4 similar issues
>
> igt@kms_psr2_sf@cursor-plane-update-sf:
>
> shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
>
> igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>
> shard-iclb: SKIP (i915#658) -> SKIP (i915#2920) +1 similar issue
>
> igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>
> shard-iclb: SKIP (i915#2920) -> SKIP (i915#658)
>
> igt@kms_psr2_su@page_flip-p010:
>
> shard-iclb: FAIL (i915#5939) -> SKIP (fdo#109642 / fdo#111068 / i915#658)
>
> igt@runner@aborted:
>
> shard-apl: (FAIL, FAIL, FAIL) (fdo#109271 / i915#3002 / i915#4312) -> (FAIL, FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#3002 / i915#4312)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
> Build changes
>
> CI: CI-20190529 -> None
> IGT: IGT_6662 -> IGTPW_7833
> Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_12176: 1af8839917f6ba0450ee7e64c931ae23ff5f0041 @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7833: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7833/index.html
> IGT_6662: dcb1d7a8822e62935f4fe3f2e6a04caaee669369 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
