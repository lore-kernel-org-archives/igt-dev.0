Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC6710E301
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 16:35:12 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-333a4a5d495so112719827b3.10
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 09:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221028164255.986636-1-markyacoub@chromium.org>
 <166703694543.24145.6568608637620187128@emeril.freedesktop.org>
In-Reply-To: <166703694543.24145.6568608637620187128@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 31 Oct 2022 12:35:00 -0400
Message-ID: <CAJUqKUqsMbLykCs2Y=D_aEGFkTLqFxAVQekXZhvsLA7aLRjpdA@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Iga21zX2No?=
	=?utf-8?q?amelium=3A_Add_new_EDID_stress_resolution_test?=
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

Hi Lakshminarayana,
I'm looking at the error and I see

Test requirement not met in function __igt_unique____real_main2635,
file ../../../usr/src/igt-gpu-tools/tests/chamelium/kms_chamelium.c:2657:
Test requirement: data.chamelium
Subtest dp-edid-stress-resolution: SKIP

This seems to mean that no Chamelium is connected on your end? This is
a new Chamelium test, so I don't know what to make of this error.

thanks,
-Mark


On Sat, Oct 29, 2022 at 5:49 AM Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> Patch Details
> Series:kms_chamelium: Add new EDID stress resolution test
> URL:https://patchwork.freedesktop.org/series/110263/
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8010/index.html
>
> CI Bug Log - changes from CI_DRM_12317_full -> IGTPW_8010_full
>
> Summary
>
> FAILURE
>
> Serious unknown changes coming with IGTPW_8010_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8010_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8010/index.html
>
> Participating hosts (8 -> 8)
>
> Additional (2): shard-rkl shard-dg1
> Missing (2): pig-skl-6260u pig-kbl-iris
>
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_8010_full:
>
> IGT changes
>
> Possible regressions
>
> igt@gem_exec_whisper@basic-queues-priority-all:
>
> shard-iclb: PASS -> INCOMPLETE +1 similar issue
>
> {igt@kms_chamelium@dp-edid-stress-resolution} (NEW):
>
> {shard-rkl}: NOTRUN -> SKIP
>
> {shard-dg1}: NOTRUN -> SKIP
>
> New tests
>
> New tests have been introduced between CI_DRM_12317_full and IGTPW_8010_full:
>
> New IGT tests (1)
>
> igt@kms_chamelium@dp-edid-stress-resolution:
>
> Statuses : 7 skip(s)
> Exec time: [0.0] s
>
> Known issues
>
> Here are the changes found in IGTPW_8010_full that come from known issues:
>
> IGT changes
>
> Issues hit
>
> igt@feature_discovery@display-3x:
>
> shard-iclb: NOTRUN -> SKIP (i915#1839)
>
> igt@gem_ccs@block-copy-compressed:
>
> shard-tglb: NOTRUN -> SKIP (i915#3555 / i915#5325) +1 similar issue
>
> igt@gem_create@create-massive:
>
> shard-snb: NOTRUN -> DMESG-WARN (i915#4991)
>
> shard-glk: NOTRUN -> DMESG-WARN (i915#4991)
>
> shard-iclb: NOTRUN -> DMESG-WARN (i915#4991)
>
> igt@gem_ctx_exec@basic-nohangcheck:
>
> shard-tglb: PASS -> FAIL (i915#6268)
>
> igt@gem_ctx_persistence@hang:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>
> igt@gem_exec_balancer@parallel-bb-first:
>
> shard-iclb: PASS -> SKIP (i915#4525)
>
> igt@gem_exec_capture@capture-recoverable:
>
> shard-iclb: NOTRUN -> SKIP (i915#6344)
>
> igt@gem_exec_fair@basic-flow@rcs0:
>
> shard-tglb: PASS -> FAIL (i915#2842) +1 similar issue
>
> igt@gem_exec_fair@basic-pace-share@rcs0:
>
> shard-glk: PASS -> FAIL (i915#2842)
>
> igt@gem_exec_fair@basic-pace-solo@rcs0:
>
> shard-apl: PASS -> FAIL (i915#2842)
>
> igt@gem_exec_fair@basic-pace@vcs1:
>
> shard-iclb: NOTRUN -> FAIL (i915#2842)
>
> igt@gem_exec_params@no-vebox:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109283 / i915#4877)
>
> shard-iclb: NOTRUN -> SKIP (fdo#109283)
>
> igt@gem_exec_params@secure-non-root:
>
> shard-iclb: NOTRUN -> SKIP (fdo#112283)
>
> shard-tglb: NOTRUN -> SKIP (fdo#112283)
>
> igt@gem_lmem_swapping@parallel-random-verify:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +3 similar issues
>
> igt@gem_lmem_swapping@random:
>
> shard-tglb: NOTRUN -> SKIP (i915#4613) +1 similar issue
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 similar issue
>
> shard-iclb: NOTRUN -> SKIP (i915#4613) +1 similar issue
>
> igt@gem_pxp@fail-invalid-protected-context:
>
> shard-tglb: NOTRUN -> SKIP (i915#4270) +1 similar issue
>
> shard-iclb: NOTRUN -> SKIP (i915#4270) +1 similar issue
>
> igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>
> shard-iclb: NOTRUN -> SKIP (i915#768)
>
> igt@gem_softpin@evict-snoop:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109312)
>
> shard-iclb: NOTRUN -> SKIP (fdo#109312)
>
> igt@gem_userptr_blits@dmabuf-unsync:
>
> shard-tglb: NOTRUN -> SKIP (i915#3297) +1 similar issue
>
> igt@gem_userptr_blits@unsync-overlap:
>
> shard-iclb: NOTRUN -> SKIP (i915#3297) +1 similar issue
>
> igt@gen9_exec_parse@bb-start-far:
>
> shard-iclb: NOTRUN -> SKIP (i915#2856) +1 similar issue
>
> igt@gen9_exec_parse@valid-registers:
>
> shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 similar issue
>
> igt@i915_module_load@resize-bar:
>
> shard-iclb: NOTRUN -> SKIP (i915#6412)
>
> shard-tglb: NOTRUN -> SKIP (i915#6412)
>
> igt@i915_pm_dc@dc6-psr:
>
> shard-tglb: NOTRUN -> FAIL (i915#3989 / i915#454)
>
> igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
> shard-tglb: NOTRUN -> SKIP (i915#3826)
>
> shard-iclb: NOTRUN -> SKIP (i915#3826)
>
> igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
>
> shard-glk: PASS -> FAIL (i915#2521)
>
> igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
> shard-tglb: NOTRUN -> SKIP (i915#404)
>
> igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>
> shard-tglb: NOTRUN -> SKIP (i915#5286) +2 similar issues
>
> shard-iclb: NOTRUN -> SKIP (i915#5286)
>
> igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
> shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614)
>
> igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>
> shard-tglb: NOTRUN -> SKIP (fdo#111615) +4 similar issues
>
> igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>
> shard-iclb: NOTRUN -> SKIP (fdo#110723) +1 similar issue
>
> igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +4 similar issues
>
> igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271) +128 similar issues
>
> shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095) +4 similar issues
>
> igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
>
> shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +1 similar issue
>
> igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +6 similar issues
>
> shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +1 similar issue
>
> igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +5 similar issues
>
> igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109278) +15 similar issues
>
> igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#3689) +5 similar issues
>
> igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs:
>
> shard-tglb: NOTRUN -> SKIP (i915#6095) +1 similar issue
>
> {igt@kms_chamelium@dp-edid-stress-resolution} (NEW):
>
> shard-glk: NOTRUN -> SKIP (fdo#109271) +90 similar issues
>
> shard-iclb: NOTRUN -> SKIP (fdo#109284)
>
> shard-tglb: NOTRUN -> SKIP (fdo#109284)
>
> igt@kms_color@deep-color:
>
> shard-iclb: NOTRUN -> SKIP (i915#3555) +7 similar issues
>
> igt@kms_color_chamelium@ctm-0-50:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +7 similar issues
>
> shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar issues
>
> shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +6 similar issues
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +6 similar issues
>
> igt@kms_color_chamelium@ctm-negative:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +6 similar issues
>
> igt@kms_content_protection@dp-mst-type-0:
>
> shard-tglb: NOTRUN -> SKIP (i915#3116 / i915#3299)
>
> shard-iclb: NOTRUN -> SKIP (i915#3116)
>
> igt@kms_cursor_crc@cursor-random-512x170:
>
> shard-tglb: NOTRUN -> SKIP (i915#3359)
>
> igt@kms_cursor_crc@cursor-rapid-movement-256x85:
>
> shard-snb: NOTRUN -> SKIP (fdo#109271) +114 similar issues
>
> igt@kms_cursor_legacy@cursorb-vs-flipb@atomic:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +7 similar issues
>
> igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>
> shard-glk: PASS -> FAIL (i915#2346)
>
> igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-2:
>
> shard-glk: PASS -> DMESG-WARN (i915#118)
>
> igt@kms_flip@2x-blocking-wf_vblank:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109274) +9 similar issues
>
> igt@kms_flip@2x-plain-flip:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637) +2 similar issues
>
> igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>
> shard-tglb: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 similar issues
>
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672) +3 similar issues
>
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
>
> shard-iclb: NOTRUN -> SKIP (i915#2672) +5 similar issues
>
> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
>
> shard-tglb: NOTRUN -> SKIP (i915#6497) +4 similar issues
>
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109280) +21 similar issues
>
> igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +20 similar issues
>
> igt@kms_hdr@bpc-switch-suspend:
>
> shard-tglb: NOTRUN -> SKIP (i915#3555) +7 similar issues
>
> igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
> shard-tglb: NOTRUN -> SKIP (i915#1839) +1 similar issue
>
> igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>
> shard-tglb: NOTRUN -> SKIP (fdo#109289) +2 similar issues
>
> igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
>
> shard-apl: PASS -> DMESG-WARN (i915#180) +1 similar issue
>
> igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1:
>
> shard-apl: NOTRUN -> FAIL (i915#4573) +2 similar issues
>
> igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>
> shard-iclb: NOTRUN -> SKIP (i915#3536) +2 similar issues
>
> igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:
>
> shard-tglb: NOTRUN -> SKIP (i915#3536) +3 similar issues
>
> igt@kms_plane_lowres@tiling-yf:
>
> shard-tglb: NOTRUN -> SKIP (fdo#112054 / i915#5288)
>
> igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
>
> shard-tglb: NOTRUN -> SKIP (i915#2920)
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
>
> shard-iclb: NOTRUN -> SKIP (fdo#111068 / i915#658)
>
> igt@kms_psr2_su@page_flip-nv12@pipe-b-edp-1:
>
> shard-iclb: NOTRUN -> FAIL (i915#5939) +2 similar issues
>
> igt@kms_psr@psr2_cursor_mmap_gtt:
>
> shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +1 similar issue
>
> igt@kms_psr@psr2_no_drrs:
>
> shard-iclb: PASS -> SKIP (fdo#109441) +2 similar issues
>
> igt@kms_psr@psr2_primary_mmap_cpu:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109441) +1 similar issue
>
> igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
> shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#5289)
>
> igt@perf@gen12-mi-rpc:
>
> shard-iclb: NOTRUN -> SKIP (fdo#109289) +2 similar issues
>
> igt@sysfs_clients@fair-7:
>
> shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +2 similar issues
>
> shard-tglb: NOTRUN -> SKIP (i915#2994)
>
> shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994)
>
> igt@sysfs_clients@split-10:
>
> shard-iclb: NOTRUN -> SKIP (i915#2994) +1 similar issue
>
> Possible fixes
>
> igt@feature_discovery@psr2:
>
> shard-iclb: SKIP (i915#658) -> PASS
>
> igt@gem_exec_fair@basic-none-solo@rcs0:
>
> shard-apl: FAIL (i915#2842) -> PASS
>
> igt@gem_exec_fair@basic-none@vecs0:
>
> shard-glk: FAIL (i915#2842) -> PASS
>
> igt@gem_exec_suspend@basic-s3@smem:
>
> shard-apl: DMESG-WARN (i915#180) -> PASS +1 similar issue
>
> igt@gem_exec_whisper@basic-queues-forked-all:
>
> shard-iclb: INCOMPLETE (i915#6453) -> PASS
>
> igt@gen9_exec_parse@allowed-all:
>
> shard-glk: DMESG-WARN (i915#5566 / i915#716) -> PASS
>
> igt@i915_pm_dc@dc9-dpms:
>
> shard-apl: FAIL (i915#4275) -> PASS
>
> igt@kms_psr@psr2_cursor_render:
>
> shard-iclb: SKIP (fdo#109441) -> PASS +1 similar issue
>
> Warnings
>
> igt@gem_exec_balancer@parallel-ordering:
>
> shard-iclb: SKIP (i915#4525) -> FAIL (i915#6117)
>
> igt@gem_pread@exhaustion:
>
> shard-apl: INCOMPLETE (i915#7248) -> WARN (i915#2658)
>
> shard-tglb: INCOMPLETE (i915#7248) -> WARN (i915#2658)
>
> igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>
> shard-iclb: SKIP (i915#2920) -> SKIP (i915#658) +1 similar issue
>
> igt@kms_psr2_sf@plane-move-sf-dmg-area:
>
> shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>
> igt@runner@aborted:
>
> shard-apl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#3002 / i915#4312) -> (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (i915#3002 / i915#4312)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
> Build changes
>
> CI: CI-20190529 -> None
> IGT: IGT_7029 -> IGTPW_8010
> Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_12317: 0f9cbc285f7d3d1860f7f903663933f33ff9ae25 @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8010: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8010/index.html
> IGT_7029: c32cb1e614017f14274d335ac571383799e6c786 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
