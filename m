Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B0210E0B9
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 08:14:20 +0000 (UTC)
Date: Wed, 12 Jul 2023 10:14:15 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230712081415.doigqvklqmi26i4x@zkempczy-mobl2>
References: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
 <168908713268.18666.15567798926028643785@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168908713268.18666.15567798926028643785@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRXh0ZW5k?=
 =?utf-8?q?_intel=5Fblt_to_work_on_Xe_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 02:52:12PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Extend intel_blt to work on Xe (rev3)                          
>    URL:     https://patchwork.freedesktop.org/series/120162/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9383/index.html 
> 
>          CI Bug Log - changes from CI_DRM_13369_full -> IGTPW_9383_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9383_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9383_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9383/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_9383_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@prime_vgem@fence-wait@ccs0:
> 
>           * shard-mtlp: PASS -> DMESG-WARN
>      * igt@prime_vgem@fence-wait@vecs0:
> 
>           * shard-mtlp: PASS -> ABORT
>      * igt@vgem_basic@sysfs:
> 
>           * shard-snb: PASS -> ABORT

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_9383_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6230)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7701)
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7701)
> 
>      * igt@drm_fdinfo@busy-hang@bcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +19 similar issues
>      * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#7742)
>      * igt@drm_fdinfo@virtual-busy-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414)
>      * igt@gem_bad_reloc@negative-reloc-bltcopy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +5 similar issues
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7697) +1 similar issue
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#5325)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5325)
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697) +1 similar issue
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-tglu: PASS -> FAIL (i915#6268)
>      * igt@gem_ctx_param@set-priority-not-supported:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109314)
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109314)
> 
>      * igt@gem_ctx_persistence@saturated-hostile@vecs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#7816) +2 similar issues
>      * igt@gem_eio@in-flight-contexts-1us:
> 
>           * shard-mtlp: PASS -> ABORT (i915#8503)
>      * igt@gem_eio@kms:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#7892)
>      * igt@gem_exec_balancer@bonded-true-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +2 similar issues
>      * igt@gem_exec_fair@basic-none@bcs0:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#2842) +4 similar issues
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-throttle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_fence@submit67:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#112283)
>      * igt@gem_exec_reloc@basic-write-gtt-active:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +2 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +1 similar issue
> 
>      * igt@gem_exec_whisper@basic-forked:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#6363)
>      * igt@gem_exec_whisper@basic-forked-all:
> 
>           * shard-mtlp: PASS -> FAIL (i915#6363)
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +2 similar issues
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>      * igt@gem_lmem_swapping@parallel-random:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg2: PASS -> TIMEOUT (i915#5493)
>      * igt@gem_media_vme:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap_wc@write:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 similar issue
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +3 similar issues
> 
>      * igt@gem_partial_pwrite_pread@reads:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +3 similar issues
>      * igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +2 similar issues
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@fail-invalid-protected-context:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270) +1 similar issue
>      * igt@gem_readwrite@beyond-eob:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +3 similar issues
>      * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +3 similar issues
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_tiled_fence_blits@basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +3 similar issues
>      * igt@gem_tiled_pread_basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297)
> 
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@nohangcheck:
> 
>           * shard-mtlp: PASS -> FAIL (i915#7916)
>      * igt@gen7_exec_parse@load-register-reg:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109289)
>      * igt@gen7_exec_parse@oacontrol-tracking:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109289)
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527)
> 
>      * igt@i915_hangman@gt-engine-error@vcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#7069)
>      * igt@i915_module_load@load:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6227)
>      * igt@i915_pm_backlight@bad-brightness:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354 / i915#7561)
>      * igt@i915_pm_dc@dc5-psr:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#658)
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: PASS -> SKIP (fdo#109271)
>      * igt@i915_pm_lpsp@screens-disabled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8430)
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg2: PASS -> SKIP (i915#1397) +1 similar issue
>      * igt@i915_pm_rpm@pc8-residency:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109293)
>      * igt@i915_pm_rpm@system-suspend-execbuf:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#7940)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-dg2: PASS -> FAIL (fdo#103375 / i915#6121) +2 similar
>             issues
> 
>           * shard-tglu: NOTRUN -> INCOMPLETE (i915#7443 / i915#8102)
> 
>      * igt@i915_suspend@debugfs-reader:
> 
>           * shard-apl: PASS -> ABORT (i915#180 / i915#8213)
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN (i915#8841) +4 similar issues
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#8247) +3 similar issues
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111614)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111614) +1 similar issue
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +1 similar issue
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
> 
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111614 / i915#3638)
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#3743)
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111614)
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110723) +2 similar issues
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +5 similar issues
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615) +1 similar issue
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
> 
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111615) +4 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +3 similar
>             issues
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3886 / i915#6095) +5 similar
>             issues
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354 / i915#6095) +4 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#5354) +12 similar
>             issues
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5354 / i915#6095) +8 similar
>             issues
>      * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3886 / i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354 /
>             i915#6095) +2 similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3734 / i915#5354 / i915#6095) +1
>             similar issue
>      * igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#3689 / i915#5354 /
>             i915#6095) +1 similar issue
>      * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +18 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354) +8 similar issues
> 
>      * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354) +3
>             similar issues
>      * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095) +9
>             similar issues
>      * igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +16 similar issues
>      * igt@kms_chamelium_audio@dp-audio:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +3 similar issues
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828)
> 
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111827) +1 similar issue
>      * igt@kms_chamelium_color@ctm-0-75:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_color@ctm-blue-to-red:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828)
>      * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +1 similar issue
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118) +2 similar issues
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8063)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7118)
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109279 / i915#3359)
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3359) +1 similar issue
>      * igt@kms_cursor_crc@cursor-random-32x10:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359) +2 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359) +1 similar issue
> 
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3546)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274) +3 similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / i915#5354) +1 similar
>             issue
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825) +1 similar issue
> 
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / fdo#111767 / i915#5354)
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111767 / fdo#111825)
> 
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-apl: PASS -> FAIL (i915#2346)
> 
>           * shard-glk: PASS -> FAIL (i915#2346)
> 
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3469)
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110189 / i915#3955)
> 
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / i915#3637) +2 similar
>             issues
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111767)
>      * igt@kms_flip@2x-flip-vs-fences-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +24 similar issues
>      * igt@kms_flip@2x-plain-flip-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637)
>      * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810)
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5274)
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5274)
> 
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +4 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +5 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +8 similar
>             issues
> 
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280) +14 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#110189) +12 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +3 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +10 similar issues
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 similar
>             issue
>      * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109289) +1 similar issue
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6953)
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +101 similar issues
>      * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5176) +15 similar issues
>      * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5176) +7 similar issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235) +15 similar issues
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658) +1 similar issue
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4348)
> 
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#658)
>             +1 similar issue
>      * igt@kms_psr@primary_mmap_cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072) +4 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072) +2 similar issues
> 
>      * igt@kms_psr@psr2_cursor_blt:
> 
>           * shard-mtlp: PASS -> FAIL (i915#8726)
>      * igt@kms_psr@psr2_cursor_mmap_gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +2 similar issues
>      * igt@kms_rmfb@close-fd@pipe-a-edp-1:
> 
>           * shard-mtlp: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_scaling_modes@scaling-mode-full:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +2 similar issues
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_vblank@pipe-c-query-forked-busy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4070 / i915#6768)
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4070 / i915#533 / i915#6768)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2437)
>      * igt@perf@oa-exponents@0-rcs0:
> 
>           * shard-glk: PASS -> ABORT (i915#5213 / i915#7941)
>      * igt@perf_pmu@event-wait@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8807)
>      * igt@perf_pmu@rc6@other-idle-gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8516)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8516)
> 
>      * igt@perf_pmu@render-node-busy-idle@ccs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4349) +7 similar issues
>      * igt@prime_vgem@basic-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@sysfs_heartbeat_interval@nopreempt@bcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#6015) +1 similar issue
>      * igt@sysfs_preempt_timeout@timeout@vecs0:
> 
>           * shard-mtlp: PASS -> ABORT (i915#8521)
>      * igt@v3d/v3d_perfmon@create-perfmon-exceed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +5 similar issues
>      * igt@v3d/v3d_submit_cl@valid-submission:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109315 / i915#2575) +4 similar
>             issues
>      * igt@v3d/v3d_submit_csd@bad-multisync-in-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +2 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109315) +2 similar issues
> 
>      * igt@vc4/vc4_mmap@mmap-bo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +3 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +2 similar issues
> 
>      * igt@vc4/vc4_perfmon@create-perfmon-exceed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +3 similar issues
>      * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +4 similar issues
>      * igt@vgem_basic@bad-pad:
> 
>           * shard-mtlp: PASS -> DMESG-WARN (i915#2017)
> 
>     Possible fixes
> 
>      * igt@gem_create@hog-create@smem0:
> 
>           * shard-dg2: FAIL (i915#5892 / i915#8758) -> PASS
>      * igt@gem_eio@hibernate:
> 
>           * {shard-dg1}: ABORT (i915#4391 / i915#7975 / i915#8213) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS +3 similar issues
>      * igt@gem_exec_whisper@basic-contexts-forked-all:
> 
>           * shard-mtlp: ABORT (i915#8131) -> PASS
>      * igt@gem_exec_whisper@basic-fds-priority-all:
> 
>           * shard-mtlp: FAIL (i915#6363) -> PASS
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * {shard-dg1}: DMESG-WARN (i915#4936 / i915#5493) -> PASS
>      * igt@i915_hangman@engine-engine-hang@vcs0:
> 
>           * shard-mtlp: FAIL (i915#7069) -> PASS
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-mtlp: ABORT (i915#8489 / i915#8668) -> PASS
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-tglu: SKIP (i915#4281) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>           * {shard-dg1}: FAIL (i915#3591) -> PASS +1 similar issue
>      * igt@i915_pm_rpm@cursor-dpms:
> 
>           * shard-tglu: FAIL (i915#7940) -> PASS +1 similar issue
>      * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * {shard-dg1}: SKIP (i915#1397) -> PASS
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * shard-rkl: SKIP (i915#1397) -> PASS +1 similar issue
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-dg2: SKIP (i915#1397) -> PASS +2 similar issues
>      * igt@i915_selftest@live@gt_mocs:
> 
>           * shard-mtlp: DMESG-FAIL (i915#7059) -> PASS
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-dg2: ABORT (i915#7913) -> PASS
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-mtlp: DMESG-FAIL (i915#6763) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-mtlp: FAIL (i915#3743) -> PASS
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>           * shard-glk: FAIL (i915#72) -> PASS
>      * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>           * shard-mtlp: FAIL (i915#8248) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a4:
> 
>           * {shard-dg1}: FAIL (i915#79) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-apl: ABORT (i915#180) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS +1 similar issue
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: FAIL (i915#8292) -> PASS
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-dg2: FAIL (IGT#2) -> PASS
>      * igt@kms_vblank@pipe-a-ts-continuation-suspend:
> 
>           * shard-dg2: FAIL (fdo#103375 / i915#6121) -> PASS
>      * igt@perf_pmu@busy-double-start@ccs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS
>      * igt@perf_pmu@most-busy-idle-check-all@bcs0:
> 
>           * shard-mtlp: FAIL (i915#5234) -> PASS +1 similar issue
>      * igt@perf_pmu@most-busy-idle-check-all@rcs0:
> 
>           * shard-dg2: FAIL (i915#5234) -> PASS
> 
>           * {shard-dg1}: FAIL (i915#5234) -> PASS
> 
>      * igt@sysfs_timeslice_duration@timeout@vecs0:
> 
>           * shard-mtlp: ABORT (i915#8521) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-snb: DMESG-FAIL (fdo#103375) -> DMESG-WARN (i915#8841)
>      * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
> 
>           * shard-tglu: FAIL (i915#2681 / i915#3591) -> WARN (i915#2681)
>      * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>           * shard-tglu: WARN (i915#2681) -> FAIL (i915#2681 / i915#3591)
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * shard-snb: DMESG-WARN (i915#8841) -> ABORT (i915#4528 /
>             i915#8213)
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-dg2: SKIP (i915#7118 / i915#7162) -> SKIP (i915#7118)
> 
>           * shard-rkl: SKIP (fdo#109300) -> SKIP (i915#7118)
> 
>           * shard-tglu: SKIP (fdo#109300) -> SKIP (i915#6944 / i915#7116 /
>             i915#7118)
> 
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * shard-rkl: SKIP (fdo#109285 / i915#4098) -> SKIP (fdo#109285)
>      * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>           * shard-dg2: CRASH (i915#7331) -> INCOMPLETE (i915#5493)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7380 -> IGTPW_9383
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_13369: 0595153b5c237d83f9990f3ce44d072a262dcb0e @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9383: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9383/index.html
>    IGT_7380: 8e65f12de2fd52c05dc48fdbcb8cfe86f6de1a75 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
