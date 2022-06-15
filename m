Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E65D10E121
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 06:29:49 +0000 (UTC)
Date: Wed, 15 Jun 2022 08:29:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yql8Wd01EcmV8Yfk@zkempczy-mobl2>
References: <20220613030412.7076-1-zbigniew.kempczynski@intel.com>
 <165524544130.12484.4109201559877822420@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165524544130.12484.4109201559877822420@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/sysfs=5Fheartbeat=5Finterval=3A_Avoid_signal_delivery_race?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 14, 2022 at 10:24:01PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/i915/sysfs_heartbeat_interval: Avoid signal delivery race 
>    URL:     https://patchwork.freedesktop.org/series/105036/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7288/index.html  
> 
>          CI Bug Log - changes from CI_DRM_11755_full -> IGTPW_7288_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7288_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7288_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7288/index.html
> 
> Participating hosts (12 -> 9)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_7288_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-tglb: PASS -> INCOMPLETE
>      * igt@sysfs_heartbeat_interval@nopreempt@bcs0:
> 
>           * shard-tglb: PASS -> FAIL +4 similar issues

Unrelated, I've changed @mixed test only (there's no common code).

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@kms_cdclk@mode-transition-all-outputs}:
>           * shard-iclb: NOTRUN -> SKIP
> 
> Known issues
> 
>    Here are the changes found in IGTPW_7288_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5327)
>      * igt@gem_ctx_isolation@preservation-s3@vecs0:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#180)
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_eio@in-flight-contexts-10ms:
> 
>           * shard-tglb: PASS -> TIMEOUT (i915#3063)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-iclb: PASS -> TIMEOUT (i915#3070)
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525) +1 similar issue
>      * igt@gem_exec_capture@pi@bcs0:
> 
>           * shard-iclb: PASS -> INCOMPLETE (i915#3371)
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842) +1 similar issue
> 
>           * shard-kbl: PASS -> FAIL (i915#2842) +5 similar issues
> 
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-iclb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_params@no-vebox:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109283)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: PASS -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@heavy-multi:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613)
> 
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613) +1 similar issue
>      * igt@gem_media_vme:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#284)
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270)
> 
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#4991)
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3297)
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856)
> 
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-iclb: PASS -> FAIL (i915#454)
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-iclb: NOTRUN -> WARN (i915#2684)
>      * igt@i915_pm_rpm@system-suspend-devices:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +125 similar issues
>      * igt@i915_query@query-topology-unsupported:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109302)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109302)
> 
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-snb: PASS -> INCOMPLETE (i915#3921)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286) +3 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286)
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614)
> 
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglb: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +123 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723)
> 
>      * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +2 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +1 similar
>             issue
>      * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +2 similar issues
>      * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +1 similar
>             issue
>      * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +58 similar issues
>      * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +22 similar issues
>      * igt@kms_chamelium@dp-edid-change-during-suspend:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar
>             issues
>      * igt@kms_chamelium@hdmi-edid-read:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +6 similar
>             issues
>      * igt@kms_chamelium@hdmi-hpd:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +6 similar
>             issues
>      * igt@kms_chamelium@vga-hpd:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar
>             issue
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +1 similar
>             issue
> 
>      * igt@kms_color_chamelium@pipe-d-ctm-negative:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109284 / fdo#111827)
>      * igt@kms_content_protection@srm:
> 
>           * shard-apl: NOTRUN -> TIMEOUT (i915#1319)
>      * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3319)
>      * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109279 / i915#3359)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109279) +2 similar
>             issues
> 
>      * igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359) +2 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +32 similar issues
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +3 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274 / fdo#109278)
> 
>      * igt@kms_draw_crc@draw-method-rgb565-render-4tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5287) +1 similar issue
>      * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5287)
>      * igt@kms_flip@2x-dpms-vs-vblank-race:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +3 similar issues
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL (i915#2122)
>      * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
> 
>           * shard-glk: PASS -> FAIL (i915#79)
>      * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180) +5 similar issues
>      * igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#4911)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +3 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#1888)
> 
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +15 similar issues
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_pipe_crc_basic@hang-read-crc-pipe-b:
> 
>           * shard-apl: PASS -> SKIP (fdo#109271)
> 
>           * shard-glk: PASS -> SKIP (fdo#109271)
> 
>           * shard-kbl: PASS -> SKIP (fdo#109271)
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#180)
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#265)
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
> 
>           * shard-iclb: PASS -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_prime@basic-crc@first-to-second:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1836)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#658)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920) +2 similar issues
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +3 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#111068 / i915#658)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>      * igt@kms_psr@psr2_primary_blt:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441) +1 similar issue
> 
>      * igt@kms_psr@psr2_primary_render:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2437)
>      * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2530)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2530) +1 similar issue
> 
>      * igt@nouveau_crc@pipe-d-source-outp-inactive:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#2530)
>      * igt@perf@blocking:
> 
>           * shard-tglb: PASS -> FAIL (i915#1542)
>      * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109291)
>      * igt@sw_sync@sync_merge_same:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#6140)
>      * igt@sysfs_clients@busy:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994) +1 similar issue
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994) +2 similar
>             issues
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>      * igt@sysfs_clients@create:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994) +2 similar issues
> 
>     Possible fixes
> 
>      * igt@core_setmaster@master-drop-set-user:
> 
>           * shard-iclb: INCOMPLETE -> PASS +1 similar issue
>      * igt@gem_eio@kms:
> 
>           * shard-tglb: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-iclb: SKIP (i915#4525) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-none@vecs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-kbl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: FAIL (i915#2849) -> PASS
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS +3 similar issues
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: FAIL (i915#454) -> PASS
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * {shard-tglu}: SKIP (i915#4281) -> PASS
>      * igt@i915_pm_rps@basic-api:
> 
>           * {shard-dg1}: FAIL (i915#4032) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-tglb: FAIL (i915#3743) -> PASS
>      * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
> 
>           * {shard-dg1}: SKIP (i915#1836) -> PASS +1 similar issue
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * {shard-dg1}: FAIL -> PASS +1 similar issue
> 
>           * shard-glk: FAIL (i915#2346 / i915#533) -> PASS
> 
>      * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled:
> 
>           * {shard-dg1}: FAIL (i915#5923) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank@a-dp1:
> 
>           * shard-kbl: FAIL (i915#79) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
> 
>           * shard-iclb: SKIP (i915#3701) -> PASS
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-iclb: SKIP (fdo#109642 / fdo#111068 / i915#658) -> PASS
>      * igt@testdisplay:
> 
>           * {shard-tglu}: DMESG-WARN (i915#4941) -> PASS
> 
>     Warnings
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: FAIL (i915#5784) -> TIMEOUT (i915#3063)
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-iclb: FAIL (i915#2852) -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-tglb: FAIL (i915#2842) -> SKIP (i915#2848)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-glk: SKIP (fdo#109271) -> SKIP (fdo#109271 / i915#1888)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (i915#658)
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
>      * igt@runner@aborted:
> 
>           * shard-kbl: (FAIL, FAIL) (i915#3002 / i915#4312 / i915#5257) ->
>             (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#3002 /
>             i915#4312 / i915#5257)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6522 -> IGTPW_7288
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_11755: 65b93b94d6bc932ed60bb3fd9d68242db25b1f3b @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7288: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7288/index.html
>    IGT_6522: 5be5a1a1f168a59614101b77385f05f12ec7d30a @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
