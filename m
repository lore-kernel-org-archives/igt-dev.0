Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A9E10E683
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 08:19:39 +0000 (UTC)
Date: Fri, 11 Aug 2023 10:19:33 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230811081933.zmv4el45a6v25lek@zkempczy-mobl2>
References: <20230810060147.398558-1-zbigniew.kempczynski@intel.com>
 <169171284884.3118.4504366062909137599@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169171284884.3118.4504366062909137599@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fctx=7Cfb=3A_Rename_engine_to_exec=5Fqueue_in_xe_lib_for_c?=
 =?utf-8?q?ompletion_=28rev2=29?=
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

On Fri, Aug 11, 2023 at 12:14:08AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_ctx|fb: Rename engine to exec_queue in xe lib for       
>             completion (rev2)                                                 
>    URL:     https://patchwork.freedesktop.org/series/122080/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9562/index.html    
> 
>            CI Bug Log - changes from IGT_7426_full -> IGTPW_9562_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9562_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9562_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9562/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_9562_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
> 
>           * shard-glk: PASS -> FAIL
>      * igt@prime_self_import@reimport-vs-gem_close-race:
> 
>           * shard-dg2: PASS -> FAIL
> 
>           * shard-dg1: PASS -> FAIL
> 
>           * shard-mtlp: PASS -> FAIL

Unrelated to above regressions. As change is variable renaming I just
decided to merge it without next rerun.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between IGT_7426_full and IGTPW_9562_full:
> 
>   New IGT tests (4)
> 
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_9562_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411)
> 
>      * igt@debugfs_test@basic-hwmon:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7456)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7701)
>      * igt@drm_fdinfo@virtual-busy-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414)
>      * igt@gem_bad_reloc@negative-reloc-bltcopy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5325)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4098 / i915#5325)
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697) +1 similar issue
>      * igt@gem_ctx_persistence@engines-hostile:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@hibernate:
> 
>           * shard-dg1: PASS -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_eio@kms:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#7892)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-dg1: PASS -> FAIL (i915#5784) +1 similar issue
>      * igt@gem_exec_balancer@bonded-semaphore:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812)
> 
>      * igt@gem_exec_balancer@bonded-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4771) +1 similar issue
>      * igt@gem_exec_balancer@noheartbeat:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6334)
>      * igt@gem_exec_fair@basic-none-share:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771)
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 similar
>             issue
>      * igt@gem_exec_flush@basic-uc-set-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109283 / i915#5107)
>      * igt@gem_exec_params@secure-non-master:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#112283)
>      * igt@gem_exec_reloc@basic-cpu-read:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_exec_reloc@basic-softpin:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +4 similar issues
>      * igt@gem_exec_reloc@basic-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +4 similar issues
>      * igt@gem_exec_whisper@basic-contexts-forked-all:
> 
>           * shard-mtlp: PASS -> ABORT (i915#7392 / i915#8131)
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +1 similar issue
>      * igt@gem_lmem_swapping@heavy-multi:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +1 similar issue
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg1: PASS -> TIMEOUT (i915#5493)
>      * igt@gem_mmap@bad-offset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +2 similar issues
>      * igt@gem_mmap_gtt@basic-write-read-distinct:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +1 similar issue
>      * igt@gem_mmap_gtt@cpuset-big-copy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +7 similar issues
>      * igt@gem_mmap_wc@write-wc-read-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@create-regular-context-2:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270) +1 similar issue
>      * igt@gem_pxp@create-valid-protected-context:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_readwrite@write-bad-handle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +3 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +3 similar issues
> 
>      * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109312)
> 
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#3318)
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-dg2: PASS -> FAIL (fdo#103375) +1 similar issue
>      * igt@gen3_render_linear_blits:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109289) +1 similar issue
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-glk: PASS -> ABORT (i915#5566)
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 similar
>             issues
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527)
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +1 similar issue
>      * igt@gen9_exec_parse@bb-start-far:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@i915_hangman@gt-engine-error@vcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#7069)
>      * igt@i915_module_load@load:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6227)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg2: NOTRUN -> DMESG-WARN (i915#7061 / i915#8617)
>      * igt@i915_pipe_stress@stress-xrgb8888-untiled:
> 
>           * shard-mtlp: PASS -> FAIL (i915#8691)
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3361)
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>           * shard-dg2: PASS -> SKIP (i915#1937)
>      * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1397)
> 
>           * shard-dg1: PASS -> SKIP (i915#1397)
> 
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109506)
>      * igt@i915_pm_rpm@i2c:
> 
>           * shard-dg2: PASS -> FAIL (i915#8717)
>      * igt@i915_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-rkl: PASS -> SKIP (i915#1397)
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6621) +1 similar issue
>      * igt@i915_pm_rps@thresholds-idle@gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6245)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8502) +3 similar issues
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8502) +7 similar issues
>      * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#8247) +5 similar issues
>      * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#8247) +1 similar issue
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111614) +1 similar issue
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +3 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5286) +1 similar
>             issue
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111614 / i915#3638)
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111614)
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110723) +2 similar issues
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +3 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615) +3 similar issues
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +8 similar issues
>      * igt@kms_big_joiner@2x-modeset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2705)
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3734 / i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#3689 / i915#5354 /
>             i915#6095)
>      * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3886 / i915#6095)
>      * igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +5 similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3886 / i915#5354 / i915#6095) +1
>             similar issue
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354 / i915#6095) +6 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +1 similar
>             issue
>      * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354 /
>             i915#6095) +2 similar issues
>      * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354) +7
>             similar issues
>      * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354) +10 similar issues
>      * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_mtl_mc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5354 / i915#6095) +9 similar
>             issues
>      * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#5354) +11 similar
>             issues
>      * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095) +5
>             similar issues
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5354 / i915#6095) +1 similar
>             issue
>      * igt@kms_cdclk@plane-scaling@pipe-c-dp-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087) +3 similar issues
>      * igt@kms_chamelium_color@ctm-negative:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111827) +1 similar issue
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111827)
> 
>      * igt@kms_chamelium_edid@hdmi-edid-read:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +2 similar issues
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +5 similar issues
>      * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +4 similar issues
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +5 similar issues
>      * igt@kms_color@deep-color:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +2 similar issues
>      * igt@kms_content_protection@atomic@pipe-a-dp-2:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#7173)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3299)
> 
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118)
>      * igt@kms_content_protection@uevent@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#1339)
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109279 / i915#3359)
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359) +1 similar issue
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / i915#5354) +4 similar
>             issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3546)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / fdo#111767)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825) +7 similar issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-apl: PASS -> FAIL (i915#2346)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3955)
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111767) +1 similar
>             issue
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111767 / i915#3637)
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / fdo#111767)
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / i915#3637) +3 similar
>             issues
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274) +5 similar issues
>      * igt@kms_flip@flip-vs-fences-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN (i915#8841) +9 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +10 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +29 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +12 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +48 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111825) +4 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +178 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +9 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#110189) +11 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +3 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708)
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280) +13 similar issues
>      * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708)
>      * igt@kms_frontbuffer_tracking@psr-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +11 similar issues
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +1 similar issue
> 
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-rkl: PASS -> SKIP (i915#433)
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#7862) +1 similar issue
>      * igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3582) +3 similar issues
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8806)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6953)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6953)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6953)
> 
>      * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5176) +5 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5176) +11 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5176) +3 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5176) +7 similar issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +1 similar issue
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235) +11 similar issues
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +7 similar issues
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar
>             issue
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr@cursor_mmap_cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072) +3 similar issues
>      * igt@kms_psr@psr2_primary_render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072) +5 similar issues
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235 / i915#5190)
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555)
> 
>      * igt@kms_selftest@drm_damage:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8661)
>      * igt@kms_selftest@drm_dp_mst:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8661) +1 similar issue
>      * igt@kms_selftest@drm_format_helper:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8661) +1 similar issue
>      * igt@kms_vblank@pipe-c-query-forked:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4070 / i915#6768) +4 similar
>             issues
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437)
> 
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109289) +2 similar issues
>      * igt@perf_pmu@busy-double-start@vecs1:
> 
>           * shard-dg2: PASS -> FAIL (i915#4349) +3 similar issues
>      * igt@perf_pmu@module-unload:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#5793 / i915#6121)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8516)
>      * igt@perf_pmu@rc6@runtime-pm-long-gt1:
> 
>           * shard-mtlp: PASS -> SKIP (i915#8537) +2 similar issues
>      * igt@perf_pmu@semaphore-busy@vcs1:
> 
>           * shard-dg1: PASS -> FAIL (i915#4349) +2 similar issues
> 
>           * shard-mtlp: PASS -> FAIL (i915#4349) +3 similar issues
> 
>      * igt@sysfs_heartbeat_interval@mixed@ccs0:
> 
>           * shard-mtlp: PASS -> ABORT (i915#8552)
>      * igt@sysfs_heartbeat_interval@mixed@vecs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#1731)
>      * igt@sysfs_preempt_timeout@timeout@vecs0:
> 
>           * shard-mtlp: PASS -> ABORT (i915#8521 / i915#8865)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109307)
>      * igt@v3d/v3d_perfmon@get-values-valid-perfmon:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109315 / i915#2575) +5 similar
>             issues
>      * igt@v3d/v3d_submit_csd@bad-multisync-extension:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109315) +3 similar issues
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575)
> 
>      * igt@v3d/v3d_submit_csd@multi-and-single-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +6 similar issues
>      * igt@v3d/v3d_wait_bo@bad-bo:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +2 similar issues
>      * igt@vc4/vc4_perfmon@create-two-perfmon:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +5 similar issues
>      * igt@vc4/vc4_perfmon@get-values-invalid-perfmon:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +1 similar issue
>      * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +2 similar issues
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +2 similar issues
> 
>     Possible fixes
> 
>      * igt@fbdev@nullptr:
> 
>           * shard-snb: ABORT (i915#8865) -> PASS
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-rkl: FAIL (i915#6268) -> PASS
>      * igt@gem_ctx_freq@sysfs@gt0:
> 
>           * shard-dg2: FAIL (i915#6786) -> PASS
>      * igt@gem_eio@banned:
> 
>           * shard-mtlp: FAIL (i915#8798) -> PASS
>      * igt@gem_eio@in-flight-contexts-immediate:
> 
>           * shard-glk: TIMEOUT (i915#3063) -> PASS
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: FAIL (i915#2846) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS
> 
>           * shard-tglu: FAIL (i915#2842) -> PASS
> 
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_suspend@basic-s4-devices@lmem0:
> 
>           * shard-dg1: ABORT (i915#7975 / i915#8213) -> PASS
>      * igt@gem_exec_whisper@basic-contexts-priority-all:
> 
>           * shard-mtlp: ABORT (i915#7392 / i915#8131) -> PASS
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg2: TIMEOUT (i915#5493) -> PASS
>      * igt@i915_hangman@detector@vcs0:
> 
>           * shard-mtlp: FAIL (i915#8456) -> PASS +2 similar issues
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-mtlp: ABORT (i915#8489 / i915#8668) -> PASS
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>           * shard-rkl: SKIP (i915#1937) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>           * shard-dg1: FAIL (i915#3591) -> PASS +1 similar issue
>      * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-dg2: SKIP (i915#1397) -> PASS +1 similar issue
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-mtlp: FAIL (i915#3743) -> PASS +1 similar issue
>      * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>           * shard-mtlp: FAIL (i915#8248) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:
> 
>           * shard-dg2: FAIL (fdo#103375) -> PASS
>      * igt@kms_properties@connector-properties-legacy:
> 
>           * shard-apl: DMESG-WARN (i915#8585) -> PASS +26 similar issues
>      * igt@kms_rotation_crc@primary-rotation-180:
> 
>           * shard-dg1: DMESG-WARN (i915#1982) -> PASS
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>           * shard-rkl: ABORT (i915#7461 / i915#8178 / i915#8875) -> PASS
>      * igt@kms_vblank@pipe-a-ts-continuation-suspend:
> 
>           * shard-tglu: ABORT (i915#5122) -> PASS
>      * igt@perf_pmu@busy-idle@ccs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS +1 similar issue
>      * igt@perf_pmu@busy-idle@vecs1:
> 
>           * shard-dg2: FAIL (i915#4349) -> PASS +4 similar issues
>      * igt@sysfs_heartbeat_interval@nopreempt@ccs0:
> 
>           * shard-mtlp: FAIL (i915#6015) -> PASS
> 
>     Warnings
> 
>      * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>           * shard-tglu: WARN (i915#2681) -> FAIL (i915#2681 / i915#3591) +1
>             similar issue
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-rkl: SKIP (fdo#109300) -> SKIP (i915#7118)
> 
>           * shard-dg1: SKIP (fdo#109300) -> SKIP (i915#7116)
> 
>           * shard-tglu: SKIP (fdo#109300) -> SKIP (i915#6944 / i915#7116 /
>             i915#7118)
> 
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: SKIP (i915#7118) -> SKIP (i915#7118 / i915#7162)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-mtlp: DMESG-FAIL (i915#2017 / i915#5954) -> FAIL
>             (i915#2346)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: SKIP (fdo#110189 / i915#3955) -> SKIP (i915#3955)
>      * igt@kms_psr@sprite_plane_onoff:
> 
>           * shard-dg1: SKIP (i915#1072 / i915#4078) -> SKIP (i915#1072) +1
>             similar issue
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7426 -> IGTPW_9562
> 
>    CI-20190529: 20190529
>    CI_DRM_13496: b8e950192f00fdeeb5559f5c596acedd70f5d8f1 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9562: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9562/index.html
>    IGT_7426: 67e7470eb79ca386087775d0b1b51c164abbf9c8 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
