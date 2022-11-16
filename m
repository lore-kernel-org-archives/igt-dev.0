Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C9610E1AD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 19:15:35 +0000 (UTC)
Date: Wed, 16 Nov 2022 20:15:10 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221116191510.5yah66gqtjudyvhx@zkempczy-mobl2>
References: <20221114164559.30419-1-zbigniew.kempczynski@intel.com>
 <166846288401.32751.12429524070272150744@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166846288401.32751.12429524070272150744@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIG1p?=
 =?utf-8?q?ssing_ENXIO_check?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 09:54:44PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add missing ENXIO check                                        
>    URL:     https://patchwork.freedesktop.org/series/110872/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8097/index.html 
> 
>            CI Bug Log - changes from IGT_7055_full -> IGTPW_8097_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8097_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8097_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8097/index.html
> 
> Participating hosts (6 -> 8)
> 
>    Additional (2): shard-rkl shard-dg1
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8097_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_parallel@contexts@rcs0:
> 
>           * shard-iclb: PASS -> INCOMPLETE
>      * igt@kms_dsc@dsc-with-bpc@pipe-a-edp-1-10bpc-xrgb8888:
> 
>           * shard-tglb: PASS -> INCOMPLETE

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_8097_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525)
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-iclb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842)
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842)
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2842)
> 
>      * igt@gem_exec_reloc@basic-gtt-cpu-active:
> 
>           * shard-iclb: PASS -> DMESG-WARN (i915#4391)
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270)
> 
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +73 similar issues
>      * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768)
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#6412)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6412)
> 
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: PASS -> FAIL (i915#3989 / i915#454)
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723)
> 
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +3 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689)
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +1 similar
>             issue
>      * igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +1 similar
>             issue
>      * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +1 similar
>             issue
> 
>      * igt@kms_chamelium@dp-edid-read:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
>      * igt@kms_color_chamelium@ctm-blue-to-red:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar
>             issues
>      * igt@kms_color_chamelium@degamma:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +2 similar
>             issues
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +2 similar
>             issues
> 
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3116)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3116 / i915#3299)
> 
>      * igt@kms_cursor_crc@cursor-random-max-size:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +28 similar issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb@varying-size:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +5 similar
>             issues
>      * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +6 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
> 
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180) +2 similar issues
>      * igt@kms_flip@flip-vs-suspend@c-edp1:
> 
>           * shard-iclb: NOTRUN -> DMESG-WARN (i915#4391)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672) +3 similar
>             issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6497) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +6 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +6 similar issues
> 
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +74 similar issues
>      * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#4573)
>      * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
> 
>           * shard-apl: NOTRUN -> DMESG-FAIL (IGT#6) +1 similar issue
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
> 
>           * shard-iclb: PASS -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_prime@d3hot:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6524)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#6524)
> 
>      * igt@kms_psr2_su@page_flip-nv12@pipe-b-edp-1:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#5939) +2 similar issues
>      * igt@kms_psr@psr2_primary_render:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441)
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-tglb: PASS -> SKIP (i915#5519)
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555) +2 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +1 similar issue
> 
>      * igt@kms_vblank@pipe-d-query-forked-hang:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +4 similar issues
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289)
>      * igt@prime_vgem@basic-userptr:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109295 / i915#3301)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109295 / i915#3301)
> 
>      * igt@sysfs_clients@busy:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994)
> 
>      * igt@sysfs_clients@split-50:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>     Possible fixes
> 
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-iclb: SKIP (i915#4525) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
> 
>           * shard-tglb: FAIL (i915#2842) -> PASS
> 
>      * igt@gem_exec_suspend@basic-s3@smem:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: SKIP (i915#2190) -> PASS
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-apl: TIMEOUT -> PASS
>      * igt@i915_selftest@perf@engine_cs:
> 
>           * shard-snb: SKIP (fdo#109271) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor@toggle:
> 
>           * shard-iclb: FAIL (i915#2346) -> PASS +2 similar issues
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
> 
>           * shard-iclb: SKIP (i915#5235) -> PASS +2 similar issues
>      * igt@kms_psr@psr2_dpms:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-iclb: SKIP (i915#4525) -> FAIL (i915#6117)
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-tglb: WARN (i915#2658) -> INCOMPLETE (i915#7248)
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#588)
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658) +1
>             similar issue
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7055 -> IGTPW_8097
> 
>    CI-20190529: 20190529
>    CI_DRM_12376: ceb77a7b0d107112b1b4197917d8fdec9a3d0ca8 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8097: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8097/index.html
>    IGT_7055: f37bbbbce4d34c3220a2bd5492a2e9c2a7390288 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
