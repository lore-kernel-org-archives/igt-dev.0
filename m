Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB5510E034
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 08:19:23 +0000 (UTC)
Date: Thu, 20 Jul 2023 10:19:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230720081911.6ll3km3bn7comhgd@zkempczy-mobl2>
References: <20230719153619.841459-1-zbigniew.kempczynski@intel.com>
 <168983814094.20750.15770819426986337469@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168983814094.20750.15770819426986337469@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgIHRlc3Rz?=
 =?utf-8?q?/gem=5F*=3A_Migrate_allocator_start/stop_to_fixtures_=28rev4=29?=
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

On Thu, Jul 20, 2023 at 07:29:00AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/gem_*: Migrate allocator start/stop to fixtures (rev4)   
>    URL:     https://patchwork.freedesktop.org/series/120968/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9437/index.html 
> 
>          CI Bug Log - changes from CI_DRM_13396_full -> IGTPW_9437_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9437_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9437_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9437/index.html
> 
> Participating hosts (10 -> 9)
> 
>    Missing (1): pig-kbl-iris
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_9437_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@vgem_basic@dmabuf-fence:
>           * shard-mtlp: PASS -> DMESG-WARN

Unrelated to the change and test is passing so I'm going to merge
the change.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@i915_pm_freq_api@freq-suspend@gt0}:
>           * shard-dg2: PASS -> INCOMPLETE
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_13396_full and
>    IGTPW_9437_full:
> 
>   New IGT tests (24)
> 
>      * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_flip@wf_vblank-ts-check@d-hdmi-a4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_9437_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#7742) +1 similar issue
>      * igt@drm_fdinfo@virtual-busy-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414)
>      * igt@drm_fdinfo@virtual-busy-idle-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6335)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
> 
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@legacy-engines-mixed:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +2 similar
>             issues
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#8898)
>      * igt@gem_exec_await@wide-contexts:
> 
>           * shard-dg2: PASS -> FAIL (i915#5892)
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_capture@pi@vcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4475)
>      * igt@gem_exec_fair@basic-none@bcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#2842) +3 similar issues
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#2842) +1 similar issue
> 
>           * shard-tglu: PASS -> FAIL (i915#2842)
> 
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-throttle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_fence@submit3:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812) +1 similar issue
>      * igt@gem_exec_fence@submit67:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_flush@basic-wb-pro-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 similar
>             issue
>      * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +3 similar issues
>      * igt@gem_exec_reloc@basic-range:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +5 similar issues
>      * igt@gem_exec_reloc@basic-wc-read:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#8585) +17 similar issues
>      * igt@gem_exec_reloc@basic-write-wc-noreloc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +3 similar issues
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7276)
>      * igt@gem_fence_thrash@bo-write-verify-none:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_swapping@massive-random:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 similar issue
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +1 similar issue
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +2 similar issues
>      * igt@gem_mmap@basic-small-bo:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 similar issue
>      * igt@gem_mmap_gtt@big-bo-tiledy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +3 similar issues
>      * igt@gem_mmap_gtt@cpuset-big-copy-odd:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +3 similar issues
>      * igt@gem_mmap_gtt@fault-concurrent-x:
> 
>           * shard-snb: PASS -> ABORT (i915#5161)
>      * igt@gem_mmap_wc@fault-concurrent:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +1 similar issue
>      * igt@gem_partial_pwrite_pread@reads:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +1 similar issue
>      * igt@gem_pread@bench:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +1 similar issue
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270)
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270)
> 
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +4 similar issues
>      * igt@gem_render_tiled_blits@basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079) +2 similar issues
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +3 similar issues
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079) +1 similar issue
> 
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297)
>      * igt@gen3_render_tiledy_blits:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109289) +1 similar issue
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109289)
> 
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-apl: PASS -> ABORT (i915#5566)
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527)
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@i915_hangman@gt-engine-error@vcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#7069)
>      * igt@i915_pm_backlight@fade-with-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7561)
>      * igt@i915_pm_rpm@cursor-dpms:
> 
>           * shard-tglu: PASS -> FAIL (i915#7940) +1 similar issue
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#1397)
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg2: PASS -> SKIP (i915#1397)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8437)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5723)
>      * igt@i915_selftest@live@gt_mocs:
> 
>           * shard-mtlp: PASS -> DMESG-FAIL (i915#7059)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: NOTRUN -> FAIL (fdo#103375)
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6645)
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8502) +3 similar issues
>      * igt@kms_async_flips@crc@pipe-b-dp-2:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#8247) +3 similar issues
>      * igt@kms_async_flips@crc@pipe-b-vga-1:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#8247) +1 similar issue
>      * igt@kms_async_flips@test-cursor:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6229)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#404)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +1 similar issue
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5286)
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111614 / i915#3638) +1 similar
>             issue
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111614)
> 
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111614)
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111614)
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#3743)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +4 similar issues
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110723) +3 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111615) +1 similar issue
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +2 similar
>             issues
>      * igt@kms_big_joiner@2x-modeset:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2705)
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2705)
> 
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3734 / i915#5354 / i915#6095) +2
>             similar issues
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354 / i915#6095) +6 similar
>             issues
>      * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +10 similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354) +5
>             similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3886 / i915#5354 / i915#6095)
> 
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354 /
>             i915#6095) +2 similar issues
>      * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +11 similar issues
>      * igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5354 / i915#6095) +3 similar
>             issues
>      * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#5354)
>      * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354) +12 similar issues
>      * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087 / i915#7213) +3 similar
>             issues
>      * igt@kms_cdclk@plane-scaling@pipe-c-dp-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087) +3 similar issues
>      * igt@kms_chamelium_color@ctm-green-to-red:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_color@ctm-max:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111827)
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111827)
> 
>      * igt@kms_chamelium_color@ctm-red-to-blue:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +1 similar issue
>      * igt@kms_chamelium_frames@dp-frame-dump:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +1 similar issue
>      * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +1 similar issue
>      * igt@kms_chamelium_frames@hdmi-crc-multiple:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +2 similar issues
>      * igt@kms_color@deep-color:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@kms_content_protection@atomic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118)
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7118)
>      * igt@kms_content_protection@lic@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#7173)
>      * igt@kms_content_protection@type1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944) +1 similar issue
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814) +1 similar issue
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
> 
>           * shard-apl: PASS -> ABORT (i915#180)
>      * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-dp-1:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#1982 / i915#8585)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / fdo#111767 / i915#5354)
>             +1 similar issue
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111767) +1 similar
>             issue
> 
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274)
>      * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180 / i915#8585) +17 similar
>             issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / i915#5354) +1 similar
>             issue
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111767 / fdo#111825)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8827)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +3 similar issues
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274)
>      * igt@kms_flip@2x-dpms-vs-vblank-race:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +1 similar issue
>      * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
> 
>           * shard-glk: PASS -> FAIL (i915#79)
>      * igt@kms_flip@flip-vs-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-edp1:
> 
>           * shard-mtlp: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +3 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280) +9 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-dg2: PASS -> FAIL (fdo#103375) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#110189) +5 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +10 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +9 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +14 similar
>             issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +3 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +12 similar issues
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 similar
>             issue
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8228)
> 
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4816)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4816)
> 
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3546) +1 similar issue
>      * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5176) +3 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5176) +3 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5176) +5 similar issues
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5176) +1 similar issue
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +304 similar issues
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235) +15 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658)
> 
>      * igt@kms_psr@dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072) +2 similar issues
>      * igt@kms_psr@sprite_blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072) +3 similar issues
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_vblank@pipe-c-accuracy-idle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4070 / i915#6768) +1 similar
>             issue
>      * igt@kms_vblank@pipe-d-query-idle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4070 / i915#533 / i915#6768) +2
>             similar issues
>      * igt@perf_pmu@busy-double-start@rcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4349)
>      * igt@perf_pmu@busy-double-start@vecs1:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#4349) +3 similar issues
>      * igt@perf_pmu@rc6-suspend:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN (i915#8841) +6 similar issues
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109295 / i915#3708)
>      * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#6015) +2 similar issues
>      * igt@sysfs_heartbeat_interval@precise@vecs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#8332)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109307)
>      * igt@v3d/v3d_mmap@mmap-bo:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +4 similar issues
>      * igt@v3d/v3d_submit_csd@single-out-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +3 similar issues
>      * igt@v3d/v3d_wait_bo@used-bo-1ns:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109315) +4 similar issues
>      * igt@vc4/vc4_create_bo@create-bo-zeroed:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +1 similar issue
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +4 similar issues
> 
>      * igt@vc4/vc4_perfmon@create-two-perfmon:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575)
>      * igt@vc4/vc4_purgeable_bo@mark-purgeable-twice:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +4 similar issues
> 
>     Possible fixes
> 
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-mtlp: FAIL (i915#6121 / i915#7916) -> PASS
>      * igt@gem_ctx_isolation@preservation-s3@ccs2:
> 
>           * shard-dg2: FAIL (fdo#103375) -> PASS +3 similar issues
>      * igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
> 
>           * shard-mtlp: FAIL (i915#2410) -> PASS
>      * igt@gem_eio@hibernate:
> 
>           * {shard-dg1}: ABORT (i915#4391 / i915#7975 / i915#8213) -> PASS
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg2: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_balancer@full-pulse:
> 
>           * shard-dg2: FAIL (i915#6032) -> PASS
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: FAIL (i915#2846) -> PASS
>      * igt@i915_hangman@detector@vcs0:
> 
>           * shard-mtlp: FAIL (i915#8456) -> PASS +2 similar issues
>      * igt@i915_hangman@gt-engine-hang@vcs0:
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
>           * {shard-dg1}: FAIL (i915#3591) -> PASS
>      * igt@i915_pm_rpm@basic-pci-d3-state:
> 
>           * {shard-dg1}: FAIL (i915#7691) -> PASS
>      * igt@i915_pm_rpm@modeset-non-lpsp:
> 
>           * shard-rkl: SKIP (i915#1397) -> PASS
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-dg2: SKIP (i915#1397) -> PASS +1 similar issue
>      * igt@i915_pm_rpm@sysfs-read:
> 
>           * shard-tglu: FAIL (i915#7940) -> PASS
>      * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
> 
>           * shard-glk: FAIL (i915#2521) -> PASS
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-mtlp: FAIL (i915#3743) -> PASS +1 similar issue
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-apl: FAIL (i915#2346) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
> 
>           * shard-apl: FAIL (i915#79) -> PASS
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1:
> 
>           * shard-apl: FAIL (i915#2122) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-rkl: ABORT (i915#8311) -> PASS
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-rkl: ABORT (i915#7461) -> PASS
>      * igt@sysfs_heartbeat_interval@mixed@ccs0:
> 
>           * shard-mtlp: ABORT (i915#8552) -> PASS
>      * igt@sysfs_heartbeat_interval@mixed@vecs0:
> 
>           * shard-mtlp: FAIL (i915#1731) -> PASS
>      * igt@sysfs_timeslice_duration@timeout@vecs0:
> 
>           * shard-mtlp: TIMEOUT (i915#6950) -> PASS
>      * igt@vgem_slow@nohang:
> 
>           * shard-snb: ABORT (i915#8852) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_whisper@basic-contexts-priority-all:
> 
>           * shard-mtlp: ABORT (i915#8131) -> TIMEOUT (i915#7392)
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg2: DMESG-WARN (i915#4936 / i915#5493) -> TIMEOUT
>             (i915#5493)
>      * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>           * shard-tglu: WARN (i915#2681) -> FAIL (i915#2681 / i915#3591) +1
>             similar issue
>      * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-tglu: FAIL (i915#7940) -> SKIP (fdo#111644 / i915#1397)
>      * igt@kms_content_protection@content_type_change:
> 
>           * shard-dg2: SKIP (i915#7118) -> SKIP (i915#7118 / i915#7162)
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-dg2: SKIP (i915#7118 / i915#7162) -> SKIP (i915#7118)
> 
>           * shard-rkl: SKIP (fdo#109300) -> SKIP (i915#7118)
> 
>           * shard-tglu: SKIP (fdo#109300) -> SKIP (i915#6944 / i915#7116 /
>             i915#7118)
> 
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-rkl: SKIP (i915#3955) -> SKIP (fdo#110189 / i915#3955)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: SKIP (fdo#110189 / i915#3955) -> SKIP (i915#3955)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7394 -> IGTPW_9437
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_13396: da1bb773ff84001b185e7bec54b32b89dff44f91 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9437: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9437/index.html
>    IGT_7394: 3b0c82d7e9f1b8708d351243de7f227153793ede @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
