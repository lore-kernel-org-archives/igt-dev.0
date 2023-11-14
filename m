Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE0910E1F4
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 10:09:38 +0000 (UTC)
Date: Tue, 14 Nov 2023 11:09:28 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231114100928.mkselbmqy4gafsif@zkempczy-mobl2>
References: <20231109171554.313952-1-zbigniew.kempczynski@intel.com>
 <169957014331.26590.1944136835959472572@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169957014331.26590.1944136835959472572@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?xe=5Fevict=5Fccs=3A_Disable_compression_on_platforms_without_fl?=
 =?utf-8?q?atccs?=
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

On Thu, Nov 09, 2023 at 10:49:03PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/xe_evict_ccs: Disable compression on platforms without      
>             flatccs                                                           
>    URL:     https://patchwork.freedesktop.org/series/126210/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html   
> 
>         CI Bug Log - changes from CI_DRM_13856_full -> IGTPW_10154_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_10154_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_10154_full, please notify your bug team
>    (lgci.bug.filing@intel.com) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html
> 
> Participating hosts (10 -> 10)
> 
>    Additional (1): shard-mtlp0
>    Missing (1): shard-rkl0
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_10154_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@dmabuf:
> 
>           * shard-mtlp: PASS -> DMESG-FAIL
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-tglu: PASS -> INCOMPLETE

Unrelated to above errors. I'm merging this as this doesn't introduce
regressions and should fix pvc issue.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_10154_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-keep-cache:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411)
>      * igt@drm_fdinfo@busy-check-all@vecs1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +10 other tests skip
>      * igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#7742)
>      * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#7297)
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_persistence@engines-mixed-process@rcs0:
> 
>           * shard-mtlp: PASS -> ABORT (i915#9414) +1 other test abort
>      * igt@gem_ctx_persistence@legacy-engines-hang@blt:
> 
>           * shard-rkl: PASS -> SKIP (i915#6252)
>      * igt@gem_ctx_persistence@processes:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@hibernate:
> 
>           * shard-tglu: PASS -> ABORT (i915#7975 / i915#8213 / i915#8398)
>      * igt@gem_eio@kms:
> 
>           * shard-dg1: PASS -> FAIL (i915#5784)
>      * igt@gem_eio@reset-stress:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#8898)
>      * igt@gem_exec_balancer@bonded-true-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-rkl: PASS -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842) +1 other test fail
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#2842) +3 other tests fail
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_flush@basic-wb-ro-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_flush@basic-wb-rw-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +2 other tests
>             skip
>      * igt@gem_exec_reloc@basic-cpu-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +7 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>           * shard-rkl: PASS -> SKIP (i915#3281) +7 other tests skip
>      * igt@gem_exec_reloc@basic-write-gtt-active:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#9275)
>      * igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-multi:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613) +2 other tests
>             skip
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg2: PASS -> TIMEOUT (i915#5493)
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_mmap_gtt@cpuset-big-copy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +10 other tests skip
>      * igt@gem_mmap_wc@copy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_wc@write-gtt-read-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +4 other tests skip
>      * igt@gem_partial_pwrite_pread@reads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>      * igt@gem_pread@display:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_pread@snoop:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +7 other tests skip
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-tglu: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pwrite_snooped:
> 
>           * shard-rkl: PASS -> SKIP (i915#3282)
>      * igt@gem_pxp@create-regular-context-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_render_copy@y-tiled-to-vebox-linear:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#768) +2 other tests skip
>      * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +67 other tests skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-rkl: PASS -> SKIP (i915#8411)
>      * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_tiled_wb:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#3318)
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#3318)
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#3318)
> 
>      * igt@gen3_mixed_blits:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109289) +2 other tests skip
>      * igt@gen7_exec_parse@basic-allowed:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109289)
>      * igt@gen7_exec_parse@basic-offset:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#109289)
>      * igt@gen7_exec_parse@batch-without-end:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109289) +4 other tests skip
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-apl: PASS -> ABORT (i915#5566)
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#5566)
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * shard-rkl: PASS -> SKIP (i915#2527) +1 other test skip
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +4 other tests skip
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
> 
>      * igt@i915_hangman@gt-engine-error@bcs0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9588)
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6590)
>      * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
> 
>           * shard-dg1: PASS -> FAIL (i915#3591)
>      * igt@i915_pm_rps@min-max-config-loaded:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@thresholds-idle@gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_pm_rps@thresholds@gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8925) +1 other test skip
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-dg2: PASS -> FAIL (fdo#103375)
>      * igt@i915_suspend@forcewake:
> 
>           * shard-dg2: NOTRUN -> FAIL (fdo#103375) +1 other test fail
>      * igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212) +2 other tests skip
>      * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#8247) +3 other tests fail
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5286) +2 other
>             tests skip
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111614)
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111614 / i915#3638) +1 other test
>             skip
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111614) +5 other tests skip
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
> 
>           * shard-rkl: PASS -> SKIP (i915#1845 / i915#4098) +9 other tests
>             skip
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-tglu: PASS -> FAIL (i915#3743) +1 other test fail
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +9 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615) +2 other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +2 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110723) +1 other test skip
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087 / i915#7213) +4 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-0-25:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_color@ctm-green-to-red:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111827) +1 other test skip
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111827)
> 
>      * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +6 other tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +2 other tests skip
>      * igt@kms_chamelium_frames@hdmi-frame-dump:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +5 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828)
>      * igt@kms_color@ctm-0-75@pipe-b:
> 
>           * shard-rkl: PASS -> SKIP (i915#4098) +4 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7118)
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7116)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>      * igt@kms_content_protection@srm:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118)
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1845 / i915#4098) +13 other tests
>             skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274) +2 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825) +7 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / i915#5354) +6 other tests
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111767 / fdo#111825) +1 other test
>             skip
>      * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9226 / i915#9261) +1 other test
>             skip
>      * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9227)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840) +2 other tests
>             skip
>      * igt@kms_fbcon_fbt@fbc:
> 
>           * shard-rkl: PASS -> SKIP (i915#1849 / i915#4098) +11 other tests
>             skip
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110189 / i915#3955)
>      * igt@kms_fence_pin_leak:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4881)
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / i915#3637)
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274) +3 other tests skip
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3637 / i915#4098) +5 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +18 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +51 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111825) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1849 / i915#4098) +4 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +14 other tests skip
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +4 other tests
>             skip
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_invalid_mode@bad-vsync-start:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#4098)
>      * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#4573) +1 other test fail
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8806)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6953)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: PASS -> FAIL (i915#8292)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#8292)
>      * igt@kms_plane_scaling@invalid-num-scalers:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#4098 / i915#6953 /
>             i915#8152)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6953 / i915#8152)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8152) +1 other test skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +9 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5235) +3 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235) +11 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +19 other tests skip
>      * igt@kms_properties@crtc-properties-atomic:
> 
>           * shard-rkl: PASS -> SKIP (i915#1849)
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#658) +1 other test skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658) +3 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr@cursor_blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#4078) +1 other test
>             skip
>      * igt@kms_psr@no_drrs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072) +3 other tests skip
>      * igt@kms_psr@psr2_dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072) +7 other tests skip
>      * igt@kms_psr@psr2_sprite_blt:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +92 other tests skip
>      * igt@kms_psr@psr2_sprite_render:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#110189) +13 other tests skip
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235 / i915#5190)
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#4098)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#9196)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#9196) +2 other tests fail
>      * igt@kms_vblank@wait-forked-busy-hang:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4098) +10 other tests skip
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +2 other tests skip
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +9 other tests skip
> 
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437) +1 other test skip
>      * igt@perf@enable-disable@0-rcs0:
> 
>           * shard-dg2: PASS -> FAIL (i915#8724)
>      * igt@perf@mi-rpc:
> 
>           * shard-rkl: PASS -> SKIP (i915#2434)
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2435)
>      * igt@perf_pmu@all-busy-idle-check-all:
> 
>           * shard-dg1: PASS -> FAIL (i915#9593)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5608 / i915#8516)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8516)
> 
>      * igt@prime_vgem@basic-read:
> 
>           * shard-rkl: PASS -> SKIP (fdo#109295 / i915#3291 / i915#3708)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109295 / i915#3708)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109295)
>      * igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#9583) +1 other test fail
>      * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#9583)
>      * igt@syncobj_timeline@invalid-single-wait-available-unsubmitted:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#9582)
>      * igt@v3d/v3d_submit_cl@bad-bo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +11 other tests skip
>      * igt@v3d/v3d_submit_cl@bad-multisync-pad:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109315 / i915#2575) +4 other
>             tests skip
>      * igt@v3d/v3d_submit_csd@bad-multisync-in-sync:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575)
>      * igt@v3d/v3d_wait_bo@bad-bo:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109315) +7 other tests skip
>      * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +8 other tests skip
>      * igt@vc4/vc4_purgeable_bo@mark-purgeable:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +3 other tests skip
>      * igt@vc4/vc4_tiling@set-get:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711)
>      * igt@vc4/vc4_wait_bo@used-bo-1ns:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +3 other tests skip
> 
>     Possible fixes
> 
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-rkl: SKIP (i915#8411) -> PASS +1 other test pass
>      * igt@drm_fdinfo@virtual-idle:
> 
>           * shard-rkl: FAIL (i915#7742) -> PASS
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-rkl: FAIL (i915#6268) -> PASS
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS +1 other test pass
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-rkl: SKIP (fdo#109313) -> PASS
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg1: TIMEOUT (i915#5493) -> PASS
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-rkl: SKIP (fdo#111656) -> PASS
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-rkl: SKIP (i915#3282) -> PASS +2 other tests pass
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-rkl: SKIP (i915#2527) -> PASS +2 other tests pass
>      * igt@i915_hangman@engine-engine-error@bcs0:
> 
>           * shard-rkl: SKIP (i915#9588) -> PASS
>      * igt@i915_pm_rps@reset:
> 
>           * shard-snb: INCOMPLETE (i915#7790) -> PASS
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * shard-mtlp: FAIL (fdo#103375) -> PASS
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: FAIL (fdo#103375) -> PASS
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglu: FAIL (i915#3743) -> PASS
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS
>      * igt@kms_color@ctm-negative@pipe-b:
> 
>           * shard-rkl: SKIP (i915#4098) -> PASS +6 other tests pass
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk: INCOMPLETE -> PASS
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
> 
>           * shard-rkl: SKIP (i915#1845 / i915#4098) -> PASS +15 other tests
>             pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-apl: FAIL (i915#2346) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
> 
>           * shard-rkl: SKIP (i915#1849 / i915#4098) -> PASS +6 other tests
>             pass
>      * {igt@kms_pm_dc@dc6-dpms}:
> 
>           * shard-tglu: FAIL (i915#9295) -> PASS
>      * {igt@kms_pm_rpm@dpms-lpsp}:
> 
>           * shard-dg1: SKIP (i915#9519) -> PASS
>      * {igt@kms_pm_rpm@i2c}:
> 
>           * shard-dg2: FAIL (i915#8717) -> PASS
>      * {igt@kms_pm_rpm@modeset-lpsp-stress-no-wait}:
> 
>           * shard-rkl: SKIP (i915#9519) -> PASS +1 other test pass
>      * {igt@kms_pm_rpm@system-suspend-modeset}:
> 
>           * shard-rkl: SKIP (fdo#109308) -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: FAIL (i915#9196) -> PASS
>      * {igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-4}:
> 
>           * shard-dg1: FAIL (i915#9196) -> PASS
>      * igt@perf@gen12-group-exclusive-stream-sample-oa:
> 
>           * shard-rkl: SKIP (fdo#109289) -> PASS
> 
>     Warnings
> 
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-rkl: SKIP (i915#9323) -> SKIP (i915#7957)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#7957)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-rkl: SKIP (i915#4098 / i915#9323) -> SKIP (i915#7957)
>      * igt@gem_exec_fair@basic-none@bcs0:
> 
>           * shard-rkl: SKIP (i915#9591) -> FAIL (i915#2842)
>      * igt@gem_pread@exhaustion:
> 
>           * shard-rkl: WARN (i915#2658) -> SKIP (i915#3282)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-rkl: SKIP (i915#9531) -> SKIP (i915#1845 / i915#4098)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#1845 / i915#4098) +5
>             other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-rkl: SKIP (i915#1845 / i915#4098) -> SKIP (i915#5286) +4
>             other tests skip
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-rkl: SKIP (fdo#111614 / i915#3638) -> SKIP (i915#1845 /
>             i915#4098)
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#1845 / i915#4098) -> SKIP (fdo#111614 /
>             i915#3638) +4 other tests skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
> 
>           * shard-rkl: SKIP (fdo#110723) -> SKIP (i915#1845 / i915#4098) +2
>             other tests skip
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-rkl: SKIP (i915#1845 / i915#4098) -> SKIP (fdo#110723) +1
>             other test skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-rkl: SKIP (i915#1845 / i915#4098) -> SKIP (fdo#111615)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-rkl: SKIP (i915#3116) -> SKIP (i915#1845 / i915#4098)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-rkl: SKIP (i915#7118) -> SKIP (i915#1845 / i915#4098)
>      * igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#1845 / i915#4098) +2
>             other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>           * shard-rkl: SKIP (i915#1845 / i915#4098) -> SKIP (i915#3555) +2
>             other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-rkl: SKIP (i915#3359) -> SKIP (i915#1845 / i915#4098)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-rkl: SKIP (fdo#111825) -> SKIP (i915#1845 / i915#4098) +3
>             other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>           * shard-rkl: SKIP (i915#1845 / i915#4098) -> SKIP (fdo#111825) +2
>             other tests skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-rkl: SKIP (i915#4103) -> SKIP (i915#1845 / i915#4098)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-rkl: SKIP (i915#1845 / i915#4098) -> SKIP (i915#4103)
>      * igt@kms_display_modes@mst-extended-mode-negative:
> 
>           * shard-rkl: SKIP (i915#4098) -> SKIP (i915#8588)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: SKIP (fdo#110189 / i915#3955) -> SKIP (i915#3955)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-rkl: SKIP (i915#1849 / i915#4098) -> SKIP (i915#3023) +14
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
> 
>           * shard-rkl: SKIP (fdo#111825 / i915#1825) -> SKIP (i915#1849 /
>             i915#4098) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-rkl: SKIP (i915#1849 / i915#4098) -> SKIP (fdo#111825 /
>             i915#1825) +29 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>           * shard-rkl: SKIP (i915#3023) -> SKIP (i915#1849 / i915#4098) +14
>             other tests skip
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-rkl: SKIP (i915#4070 / i915#4816) -> SKIP (i915#4816)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-rkl: SKIP (i915#1845 / i915#4098) -> SKIP (i915#6301)
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-rkl: SKIP (fdo#111825) -> SKIP (fdo#111825 / i915#8152)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-rkl: SKIP (fdo#111615 / i915#5289) -> SKIP (i915#1845 /
>             i915#4098)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7580 -> IGTPW_10154
> 
>    CI-20190529: 20190529
>    CI_DRM_13856: b81818fa6745cf79a86da57dc3a379bd80c7ea5f @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_10154:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html
>    IGT_7580: 847ee1e7d365e2fb08bf4198d3bf5ee8a852649f @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
