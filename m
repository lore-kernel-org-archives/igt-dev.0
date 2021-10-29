Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0959B6E103
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Oct 2021 10:46:09 +0000 (UTC)
Date: Fri, 29 Oct 2021 12:46:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211029104605.GA13539@zkempczy-mobl2>
References: <20211028182322.34133-1-zbigniew.kempczynski@intel.com>
 <163550324151.1909.8747105630615160893@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163550324151.1909.8747105630615160893@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbmdl?=
 =?utf-8?q?_gem=5Fsync_to_no-reloc?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 29, 2021 at 10:27:21AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Change gem_sync to no-reloc                                    
>    URL:     https://patchwork.freedesktop.org/series/96401/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6362/index.html 
> 
>          CI Bug Log - changes from CI_DRM_10809_full -> IGTPW_6362_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6362_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6362_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6362/index.html
> 
> Participating hosts (10 -> 7)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6362_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>           * shard-iclb: PASS -> FAIL

This failure also is not related to the series I've sent.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6362_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-3x:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1839)
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#280)
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-tglb: PASS -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842)
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
> 
>      * igt@gem_exec_params@no-vebox:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109283)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109283)
> 
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270])
> 
>      * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768])
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN (i915#3002)
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297) +1 similar issue
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#1436 / [i915#716])
>      * igt@gen9_exec_parse@basic-rejected-ctx-param:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2856) +1 similar issue
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856)
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: PASS -> FAIL ([i915#454])
>      * igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289 / fdo#111719)
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-tglb: NOTRUN -> WARN (i915#2681 / i915#2684)
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-snb: PASS -> INCOMPLETE ([i915#3921])
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +5 similar issues
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614)
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +5 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723)
> 
>      * igt@kms_big_joiner@2x-modeset:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2705)
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +8 similar issues
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / [i915#3886]) +2 similar
>             issues
>      * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / [i915#3886])
>      * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +1 similar
>             issue
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / [i915#3886]) +1 similar
>             issue
>      * igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +93 similar issues
>      * igt@kms_color_chamelium@pipe-a-gamma:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +3 similar
>             issues
>      * igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +7 similar
>             issues
>      * igt@kms_color_chamelium@pipe-b-ctm-max:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +15 similar
>             issues
>      * igt@kms_color_chamelium@pipe-d-ctm-0-5:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109284 / fdo#111827)
> 
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3116)
>      * igt@kms_content_protection@lic:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111828) +1 similar issue
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3319) +3 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109279)
>      * igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +14 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359) +5 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109279 / i915#3359) +3 similar
>             issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274 / fdo#109278) +1 similar
>             issue
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4103])
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +1 similar issue
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
> 
>           * shard-apl: PASS -> FAIL ([i915#79])
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180) +1 similar issue
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109285)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109285)
> 
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE (i915#2828 / [i915#456])
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +13 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +76 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111825) +35 similar issues
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1187)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1187)
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / [i915#533])
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / [i915#533])
> 
>      * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> 
>           * shard-apl: NOTRUN -> FAIL (fdo#108145 / i915#265)
>      * igt@kms_plane_lowres@pipe-c-tiling-y:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
> 
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / [i915#658]) +1 similar
>             issue
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920) +1 similar issue
>      * igt@kms_psr@psr2_cursor_blt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441)
>      * igt@kms_psr@psr2_cursor_plane_move:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_psr@psr2_sprite_render:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / [i915#3467]) +2 similar
>             issues
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +55 similar issues
>      * igt@kms_vblank@pipe-d-ts-continuation-suspend:
> 
>           * shard-tglb: NOTRUN -> INCOMPLETE ([i915#3896])
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109502)
>      * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2530) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2530)
> 
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +1 similar issue
>      * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109291) +1 similar issue
>      * igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109291) +5 similar issues
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109295)
>      * igt@sysfs_clients@busy:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994) +1 similar issue
>      * igt@sysfs_clients@pidname:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>     Possible fixes
> 
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-tglb: FAIL (i915#2842) -> PASS +2 similar issues
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-tglb: INCOMPLETE ([i915#456]) -> PASS
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS +1 similar issue
>      * igt@kms_big_fb@linear-32bpp-rotate-180:
> 
>           * shard-glk: DMESG-WARN (i915#118) -> PASS +3 similar issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-iclb: FAIL (i915#2346) -> PASS
>      * igt@kms_psr@psr2_sprite_plane_move:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +2 similar issues
>      * igt@kms_vblank@pipe-c-ts-continuation-suspend:
> 
>           * shard-iclb: SKIP (fdo#109278) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: FAIL (i915#2842) -> FAIL (i915#2849)
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
> 
>           * shard-iclb: SKIP ([i915#658]) -> SKIP (i915#2920) +2 similar
>             issues
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP ([i915#658]) +1 similar
>             issue
>      * igt@kms_psr2_su@page_flip:
> 
>           * shard-iclb: FAIL ([i915#4148]) -> SKIP (fdo#109642 / fdo#111068 /
>             [i915#658])
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL, FAIL, FAIL) (fdo#109271 / i915#180 /
>             i915#1814 / i915#3002 / i915#3363 / [i915#4312]) -> (FAIL, FAIL,
>             FAIL, FAIL) (i915#180 / i915#1814 / i915#3002 / i915#3363 /
>             [i915#4312])
> 
>    [i915#3467
