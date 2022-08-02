Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDF010F5C0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Aug 2022 12:01:34 +0000 (UTC)
Date: Tue, 2 Aug 2022 14:01:29 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YukSGWAOi+r9XZwe@zkempczy-mobl2>
References: <20220728070024.21158-1-zbigniew.kempczynski@intel.com>
 <165901059567.21236.5689506914772546189@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165901059567.21236.5689506914772546189@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fdevice=5Fscan=3A_Assert_if_there=27s_empty_PCI=5FSLOT=5FNAM?=
 =?utf-8?q?E_=28rev2=29?=
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

On Thu, Jul 28, 2022 at 12:16:35PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/igt_device_scan: Assert if there's empty PCI_SLOT_NAME (rev2) 
>    URL:     https://patchwork.freedesktop.org/series/106796/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7576/index.html    
> 
>            CI Bug Log - changes from IGT_6602_full -> IGTPW_7576_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7576_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7576_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7576/index.html
> 
> Participating hosts (10 -> 10)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_7576_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_schedule@smoketest-all:
> 
>           * shard-kbl: PASS -> INCOMPLETE
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
> 
>           * shard-kbl: NOTRUN -> INCOMPLETE

Change is not relatet failures above.

--
Zbigniew


> 
> Known issues
> 
>    Here are the changes found in IGTPW_7576_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#4991)
>      * igt@gem_ctx_persistence@engines-persistence:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2842)
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842)
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842)
> 
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-kbl: PASS -> FAIL (i915#2842) +4 similar issues
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-iclb: PASS -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: PASS -> FAIL (i915#2849)
>      * igt@gem_flink_race@flink_close:
> 
>           * shard-snb: PASS -> FAIL (i915#6481)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2190)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2190)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2190)
> 
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>      * igt@gem_pxp@create-valid-protected-context:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270)
> 
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3323)
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180) +3 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#5566 / i915#716)
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856)
> 
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-iclb: PASS -> FAIL (i915#454) +1 similar issue
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: PASS -> SKIP (fdo#109271)
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#1937)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286)
> 
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614) +1 similar
>             issue
> 
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615)
>      * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6095) +2 similar issues
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689)
>      * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886)
> 
>      * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +6 similar issues
> 
>      * igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +1 similar
>             issue
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +152 similar issues
>      * igt@kms_chamelium@dp-hpd-after-suspend:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +3 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +3 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +2 similar
>             issues
> 
>      * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar
>             issues
>      * igt@kms_color_chamelium@pipe-a-gamma:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +11 similar
>             issues
>      * igt@kms_color_chamelium@pipe-d-ctm-negative:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109284 / fdo#111827)
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +3 similar
>             issues
> 
>      * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
> 
>           * shard-glk: PASS -> FAIL (i915#2346) +1 similar issue
>      * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
> 
>           * shard-glk: PASS -> FAIL (i915#1888 / i915#5160)
>      * igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5287)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5287)
> 
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#180 / i915#4939)
>      * igt@kms_flip@2x-flip-vs-rmfb:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
>             +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +1 similar issue
> 
>      * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180) +2 similar issues
>      * igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>           * shard-kbl: NOTRUN -> INCOMPLETE (i915#3614)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2672) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672) +5 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: PASS -> SKIP (i915#3555)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +8 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6497) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +47 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +8 similar issues
> 
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5439)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5438)
> 
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>           * shard-apl: NOTRUN -> FAIL (fdo#108145 / i915#265)
> 
>           * shard-glk: NOTRUN -> FAIL (fdo#108145 / i915#265)
> 
>           * shard-kbl: NOTRUN -> FAIL (fdo#108145 / i915#265)
> 
>      * igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5288)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
> 
>           * shard-iclb: PASS -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +44 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2920)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>      * igt@kms_psr@psr2_primary_mmap_cpu:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#5289)
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555)
> 
>      * igt@sysfs_clients@recycle:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
>      * igt@sysfs_clients@sema-50:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +70 similar issues
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994)
> 
>     Possible fixes
> 
>      * igt@fbdev@pan:
> 
>           * {shard-rkl}: SKIP (i915#2582) -> PASS
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * {shard-rkl}: FAIL (i915#6268) -> PASS
>      * igt@gem_ctx_persistence@engines-hang@bcs0:
> 
>           * {shard-rkl}: SKIP (i915#6252) -> PASS
>      * igt@gem_ctx_persistence@engines-hang@vcs1:
> 
>           * {shard-dg1}: FAIL (i915#4883) -> PASS
>      * igt@gem_eio@in-flight-1us:
> 
>           * shard-tglb: TIMEOUT (i915#3063) -> PASS
>      * igt@gem_eio@in-flight-suspend:
> 
>           * {shard-rkl}: FAIL (fdo#103375) -> PASS
>      * igt@gem_eio@unwedge-stress:
> 
>           * {shard-tglu}: TIMEOUT (i915#3063) -> PASS
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-iclb: SKIP (i915#4525) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_reloc@basic-gtt-cpu:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> PASS +7 similar issues
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * {shard-rkl}: SKIP (fdo#110254) -> PASS
>      * igt@gem_tiled_partial_pwrite_pread@reads:
> 
>           * {shard-rkl}: SKIP (i915#3282) -> PASS +3 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-glk: DMESG-WARN (i915#5566 / i915#716) -> PASS
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * {shard-rkl}: SKIP (i915#2527) -> PASS +1 similar issue
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * {shard-rkl}: SKIP (i915#3361) -> PASS
> 
>           * {shard-tglu}: SKIP (i915#4281) -> PASS
> 
>      * igt@i915_pm_rps@waitboost:
> 
>           * {shard-rkl}: FAIL (i915#4016) -> PASS
>      * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS
>      * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
> 
>           * shard-glk: FAIL (i915#1888 / i915#5160) -> PASS
>      * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled:
> 
>           * {shard-rkl}: SKIP (i915#4098 / i915#4369) -> PASS +1 similar
>             issue
>      * igt@kms_draw_crc@fill-fb:
> 
>           * {shard-rkl}: SKIP (fdo#111314 / i915#4098 / i915#4369) -> PASS +1
>             similar issue
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS +4 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +4 similar
>             issues
>      * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
> 
>           * shard-apl: FAIL (i915#1188) -> PASS
>      * igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#3546 / i915#4070 / i915#4098)
>             -> PASS +1 similar issue
>      * igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1:
> 
>           * shard-glk: FAIL (i915#1888) -> PASS
>      * igt@kms_properties@plane-properties-legacy:
> 
>           * {shard-rkl}: SKIP (i915#1849) -> PASS
>      * igt@kms_psr@cursor_mmap_gtt:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS +1 similar issue
>      * igt@kms_psr@psr2_sprite_blt:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS
>      * igt@kms_vblank@pipe-b-wait-forked-hang:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +16 similar
>             issues
>      * igt@perf@gen12-oa-tlb-invalidate:
> 
>           * {shard-rkl}: SKIP (fdo#109289) -> PASS
>      * igt@perf@polling:
> 
>           * {shard-rkl}: FAIL (i915#5639) -> PASS
>      * igt@perf_pmu@busy-double-start@vecs0:
> 
>           * {shard-dg1}: FAIL (i915#4349) -> PASS +1 similar issue
>      * igt@testdisplay:
> 
>           * {shard-tglu}: DMESG-WARN (i915#4941) -> PASS
> 
>     Warnings
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: FAIL (i915#5784) -> TIMEOUT (i915#3063)
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-tglb: FAIL (i915#2842) -> FAIL (i915#2851)
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#588)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (i915#658)
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920) +1
>             similar issue
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL, FAIL) (i915#3002 / i915#4312 / i915#5257)
>             -> (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (fdo#109271 /
>             i915#180 / i915#3002 / i915#4312 / i915#5257)
> 
>           * shard-kbl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (fdo#109271
>             / i915#180 / i915#3002 / i915#4312 / i915#5257) -> (FAIL, FAIL,
>             FAIL, FAIL, FAIL) (i915#180 / i915#3002 / i915#4312 / i915#5257)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6602 -> IGTPW_7576
> 
>    CI-20190529: 20190529
>    CI_DRM_11946: 0e9c43d76a145712da46e935d429ce2a3eea80e8 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7576: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7576/index.html
>    IGT_6602: 5a8fa05a824032aab4c8980727a075f71065e27c @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
