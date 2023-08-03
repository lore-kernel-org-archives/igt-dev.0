Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47DF10E215
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 20:15:51 +0000 (UTC)
Date: Thu, 3 Aug 2023 22:15:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230803201546.nu4jkucptwv2ubap@zkempczy-mobl2>
References: <20230803074902.172493-1-zbigniew.kempczynski@intel.com>
 <169106348080.5271.11586653032281740144@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169106348080.5271.11586653032281740144@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHhl?=
 =?utf-8?q?=5Fmedia=5Ffill_test?=
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

On Thu, Aug 03, 2023 at 11:51:20AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add xe_media_fill test                                         
>    URL:     https://patchwork.freedesktop.org/series/121943/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9504/index.html 
> 
>          CI Bug Log - changes from CI_DRM_13463_full -> IGTPW_9504_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9504_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9504_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9504/index.html
> 
> Participating hosts (10 -> 10)
> 
>    Additional (1): shard-rkl0
>    Missing (1): pig-kbl-iris
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_9504_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_userptr_blits@nohangcheck:
>           * shard-mtlp: PASS -> FAIL

Unrelated to the change.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_13463_full and
>    IGTPW_9504_full:
> 
>   New IGT tests (2)
> 
>      * igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_9504_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@drm_fdinfo@busy-idle-check-all@ccs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +5 similar issues
>      * igt@drm_fdinfo@busy-idle@bcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +9 similar issues
>      * igt@gem_caching@read-writes:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4873)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#5325)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#5325)
> 
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5325)
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5325)
> 
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-rkl: PASS -> FAIL (i915#6268)
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN (i915#8841) +8 similar issues
>      * igt@gem_ctx_param@set-priority-not-supported:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109314)
>      * igt@gem_ctx_persistence@engines-hang:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +2 similar
>             issues
>      * igt@gem_ctx_persistence@saturated-hostile@vecs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#7816) +2 similar issues
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: PASS -> FAIL (i915#5784)
>      * igt@gem_exec_await@wide-contexts:
> 
>           * shard-dg2: PASS -> FAIL (i915#5892)
>      * igt@gem_exec_balancer@bonded-dual:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4771)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4771) +1 similar issue
> 
>      * igt@gem_exec_flush@basic-wb-ro-before-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
> 
>      * igt@gem_exec_gttfill@multigpu-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_exec_reloc@basic-active:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +3 similar issues
>      * igt@gem_exec_reloc@basic-cpu-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +3 similar issues
>      * igt@gem_exec_reloc@basic-range:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +2 similar issues
>      * igt@gem_exec_reloc@basic-write-cpu-active:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +1 similar issue
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_fence_thrash@bo-write-verify-x:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +3 similar issues
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_mmap_gtt@basic-small-bo-tiledx:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +1 similar issue
>      * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +4 similar issues
>      * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +3 similar issues
>      * igt@gem_mmap_wc@copy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 similar issue
>      * igt@gem_pxp@create-valid-protected-context:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270) +1 similar issue
>      * igt@gem_readwrite@read-bad-handle:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +2 similar issues
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +2 similar issues
>      * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +1 similar issue
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +1 similar issue
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079) +1 similar issue
> 
>      * igt@gem_tiled_pread_basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079) +2 similar issues
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-dg2: PASS -> FAIL (fdo#103375) +1 similar issue
>      * igt@gen3_render_tiledy_blits:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109289)
>      * igt@gen7_exec_parse@chained-batch:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109289) +1 similar issue
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#109289) +2 similar issues
> 
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +1 similar issue
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527)
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527)
> 
>      * igt@i915_pipe_stress@stress-xrgb8888-untiled:
> 
>           * shard-mtlp: PASS -> FAIL (i915#8691)
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-tglu: PASS -> FAIL (i915#3989 / i915#454)
>      * igt@i915_pm_freq_api@freq-reset:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_freq_api@freq-suspend@gt0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6645)
>      * igt@i915_pm_freq_api@freq-suspend@gt1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8805)
>      * igt@i915_pm_rpm@cursor:
> 
>           * shard-dg1: PASS -> FAIL (i915#7940)
>      * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#1397)
>      * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#1397)
>      * igt@i915_pm_rps@thresholds-idle@gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8925) +1 similar issue
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8925)
> 
>      * igt@i915_selftest@live@slpc:
> 
>           * shard-mtlp: PASS -> DMESG-WARN (i915#6367)
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-mtlp: PASS -> DMESG-FAIL (i915#6763)
>      * igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2:
> 
>           * shard-glk: PASS -> FAIL (i915#2521)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8502 / i915#8709) +11 similar
>             issues
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286)
> 
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5286)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286)
> 
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111614) +1 similar issue
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111614 / i915#3638) +1 similar
>             issue
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +1 similar issue
> 
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#3743) +1 similar issue
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +1 similar
>             issue
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110723)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
> 
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111615) +1 similar issue
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3886 / i915#5354 / i915#6095)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354 /
>             i915#6095)
> 
>      * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3886 / i915#6095) +4 similar
>             issues
>      * igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#5354) +7 similar
>             issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3734 / i915#5354 / i915#6095)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095) +1
>             similar issue
> 
>      * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +11 similar issues
>      * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_mtl_rc_ccs_cc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_rc_ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354) +4 similar issues
>      * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087 / i915#7213) +3 similar
>             issues
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3742)
> 
>      * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087) +3 similar issues
>      * igt@kms_chamelium_color@ctm-limited-range:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_frames@dp-frame-dump:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +1 similar issue
> 
>      * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +3 similar issues
>      * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#7173)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814) +1 similar issue
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359)
> 
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 similar
>             issue
> 
>      * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
> 
>           * shard-mtlp: PASS -> FAIL (i915#8248)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825) +3 similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3546)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111767 / i915#3546)
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / fdo#111767)
> 
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-apl: PASS -> FAIL (i915#2346)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274) +2 similar issues
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +1 similar issue
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111767 / i915#3637)
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / i915#3637)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672)
> 
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +3 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +12 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111825) +10 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +4 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +2 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +3 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#110189)
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +6 similar
>             issues
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +2 similar issues
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +2 similar issues
> 
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 similar
>             issue
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4816)
>      * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109289)
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109289) +3 similar issues
> 
>      * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
> 
>           * shard-mtlp: PASS -> FAIL (i915#1623)
>      * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5176) +19 similar issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235) +7 similar issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +193 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +1 similar issue
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +19 similar issues
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#658)
> 
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658) +1 similar issue
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111068 / i915#658)
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111068 / i915#658)
> 
>      * igt@kms_psr@psr2_sprite_mmap_cpu:
> 
>           * shard-mtlp: PASS -> FAIL (i915#8726)
>      * igt@kms_psr@psr2_sprite_plane_move:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072) +1 similar issue
>      * igt@kms_psr@sprite_plane_onoff:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#4078)
> 
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235) +1 similar issue
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5030) +3 similar issues
>      * igt@kms_selftest@drm_format_helper:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#8661)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#8661)
> 
>      * igt@kms_vblank@pipe-c-ts-continuation-suspend:
> 
>           * shard-tglu: PASS -> ABORT (i915#5122 / i915#5251 / i915#8213)
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8808)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@perf@enable-disable@0-rcs0:
> 
>           * shard-dg2: PASS -> FAIL (i915#8724)
>      * igt@perf_pmu@event-wait@rcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#112283)
>      * igt@perf_pmu@most-busy-idle-check-all@rcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5234)
>      * igt@prime_self_import@reimport-vs-gem_close-race:
> 
>           * shard-dg1: PASS -> FAIL (i915#7951)
> 
>           * shard-mtlp: PASS -> FAIL (i915#7951)
> 
>      * igt@v3d/v3d_job_submission@array-job-submission:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575) +3 similar issues
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109315 / i915#2575) +1 similar
>             issue
> 
>      * igt@v3d/v3d_mmap@mmap-bad-flags:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109315) +1 similar issue
>      * igt@v3d/v3d_perfmon@destroy-invalid-perfmon:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +2 similar issues
>      * igt@v3d/v3d_submit_csd@bad-pad:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +31 similar issues
>      * igt@v3d/v3d_submit_csd@job-perfmon:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +6 similar issues
>      * igt@vc4/vc4_label_bo@set-bad-name:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +1 similar issue
>      * igt@vc4/vc4_mmap@mmap-bo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +2 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +1 similar issue
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711) +1 similar issue
> 
>      * igt@vc4/vc4_wait_bo@bad-pad:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575)
> 
>     Possible fixes
> 
>      * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>           * shard-rkl: FAIL (i915#7742) -> PASS
>      * igt@fbdev@nullptr:
> 
>           * shard-dg2: SKIP (i915#2582) -> PASS
>      * igt@gem_ctx_isolation@preservation-s3@bcs0:
> 
>           * shard-glk: INCOMPLETE (i915#4793) -> PASS
>      * igt@gem_ctx_param@invalid-param-set:
> 
>           * shard-dg2: SKIP (i915#2575) -> PASS +161 similar issues
>      * igt@gem_ctx_persistence@engines-hang@vcs0:
> 
>           * shard-mtlp: FAIL (i915#2410) -> PASS
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg2: FAIL (i915#5784) -> PASS
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-dg1: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_balancer@hang:
> 
>           * shard-mtlp: ABORT (i915#8104) -> PASS
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-rkl: FAIL (i915#2846) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS
> 
>           * shard-tglu: FAIL (i915#2842) -> PASS
> 
>      * igt@gem_exec_suspend@basic-s4-devices@lmem0:
> 
>           * shard-dg1: ABORT (i915#7975 / i915#8213) -> PASS
>      * igt@gem_exec_whisper@basic-contexts-forked-all:
> 
>           * shard-mtlp: ABORT (i915#7392 / i915#8131) -> PASS
>      * igt@i915_hangman@detector@vcs0:
> 
>           * shard-mtlp: FAIL (i915#8456) -> PASS +2 similar issues
>      * igt@i915_hangman@engine-engine-hang@vcs0:
> 
>           * shard-mtlp: FAIL (i915#7069) -> PASS
>      * igt@i915_module_load@reload:
> 
>           * shard-dg2: FAIL -> PASS
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-tglu: WARN (i915#2681) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>           * shard-dg1: FAIL (i915#3591) -> PASS
>      * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-rkl: SKIP (i915#1397) -> PASS +1 similar issue
>      * igt@i915_pm_rpm@gem-execbuf-stress@lmem0:
> 
>           * shard-dg1: FAIL (i915#7940) -> PASS +1 similar issue
>      * igt@i915_selftest@live@gt_mocs:
> 
>           * shard-mtlp: DMESG-FAIL (i915#7059) -> PASS
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * shard-dg2: WARN (i915#2575) -> PASS
>      * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
> 
>           * shard-dg2: SKIP (i915#2575 / i915#5190) -> PASS
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS
>      * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>           * shard-mtlp: FAIL (i915#8248) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
> 
>           * shard-dg2: SKIP (fdo#109315) -> PASS +21 similar issues
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-tglu: SKIP (i915#433) -> PASS
>      * igt@kms_plane@pixel-format@pipe-b-planes:
> 
>           * shard-mtlp: FAIL (i915#1623) -> PASS
>      * igt@perf@polling-parameterized:
> 
>           * shard-dg2: SKIP (i915#5608) -> PASS +2 similar issues
>      * igt@perf_pmu@busy-double-start@rcs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS
>      * igt@syncobj_timeline@device-submit-unordered:
> 
>           * shard-mtlp: DMESG-WARN (i915#2017) -> PASS
>      * igt@sysfs_timeslice_duration@timeout@vecs0:
> 
>           * shard-mtlp: ABORT (i915#8521) -> PASS
> 
>     Warnings
> 
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#8411)
>      * igt@feature_discovery@display-2x:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#1839)
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3936)
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#7697)
>      * igt@gem_ctx_persistence@heartbeat-hang:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#8555) +2 similar issues
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#280)
>      * igt@gem_exec_balancer@bonded-true-hang:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4812)
>      * igt@gem_exec_fair@basic-none-rrul:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3539 / i915#4852) +1
>             similar issue
>      * igt@gem_exec_reloc@basic-cpu-gtt:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3281) +7 similar issues
>      * igt@gem_exec_whisper@basic-contexts-priority-all:
> 
>           * shard-mtlp: TIMEOUT (i915#7392) -> ABORT (i915#7392 / i915#8131)
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4860)
>      * igt@gem_media_vme:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#284)
>      * igt@gem_mmap_wc@bad-object:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4083) +3 similar issues
>      * igt@gem_pread@snoop:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3282) +5 similar issues
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4270) +1 similar issue
>      * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
> 
>           * shard-dg2: SKIP (i915#2575 / i915#5190) -> SKIP (i915#5190) +3
>             similar issues
>      * igt@gem_render_tiled_blits@basic:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4079)
>      * igt@gem_tiled_blits@basic:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4077) +6 similar issues
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4879)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3297) +3 similar issues
>      * igt@gen7_exec_parse@batch-without-end:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (fdo#109289) +1 similar issue
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#2856) +1 similar issue
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg2: WARN (i915#7356) -> DMESG-WARN (i915#7061 / i915#8617)
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#5978)
>      * igt@i915_pm_rpm@gem-evict-pwrite:
> 
>           * shard-dg2: SKIP (i915#5174) -> SKIP (i915#4077)
>      * igt@i915_pm_rpm@i2c:
> 
>           * shard-dg1: DMESG-WARN (i915#4391 / i915#4423) -> DMESG-WARN
>             (i915#4391)
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#6621)
>      * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4212) +1 similar issue
>      * igt@kms_async_flips@crc@pipe-a-edp-1:
> 
>           * shard-mtlp: DMESG-FAIL (i915#8561) -> DMESG-FAIL (i915#1982 /
>             i915#8561)
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#6228)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#404)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-dg2: SKIP (fdo#109315) -> SKIP (fdo#111614) +2 similar
>             issues
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-dg2: SKIP (fdo#109315 / i915#5190) -> SKIP (i915#5190) +3
>             similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-dg2: SKIP (fdo#109315 / i915#5190) -> SKIP (i915#4538 /
>             i915#5190) +2 similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3689 / i915#3886 /
>             i915#5354) +9 similar issues
>      * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#5354) +16 similar
>             issues
>      * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3689 / i915#5354) +16
>             similar issues
>      * igt@kms_chamelium_color@gamma:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (fdo#111827)
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#7828) +5 similar issues
>      * igt@kms_color@deep-color:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3555)
>      * igt@kms_content_protection@content_type_change:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#7118)
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-dg1: SKIP (i915#7116) -> SKIP (fdo#109300)
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3359)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (fdo#109274 / fdo#111767 /
>             i915#5354) +1 similar issue
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (fdo#109274 / i915#5354) +2
>             similar issues
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-dg2: SKIP (fdo#109315) -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: SKIP (fdo#110189 / i915#3955) -> SKIP (i915#3955)
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3469)
> 
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (fdo#109274) +2 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-dg2: SKIP (fdo#109315) -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
> 
>           * shard-dg2: SKIP (fdo#109315) -> SKIP (i915#3458) +15 similar
>             issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg2: SKIP (fdo#109315) -> SKIP (i915#5354) +28 similar
>             issues
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
> 
>           * shard-dg2: SKIP (fdo#109315) -> SKIP (i915#8708) +15 similar
>             issues
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#6301)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#6953)
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>           * shard-dg2: SKIP (fdo#109315) -> SKIP (i915#658) +1 similar issue
>      * igt@kms_psr@cursor_plane_move:
> 
>           * shard-dg1: SKIP (i915#1072) -> SKIP (i915#1072 / i915#4078)
>      * igt@kms_psr@primary_page_flip:
> 
>           * shard-dg1: SKIP (i915#1072 / i915#4078) -> SKIP (i915#1072)
>      * igt@kms_psr@psr2_dpms:
> 
>           * shard-dg2: SKIP (fdo#109315) -> SKIP (i915#1072) +6 similar
>             issues
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4235) +3 similar issues
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#2437) +1 similar issue
>      * igt@prime_self_import@reimport-vs-gem_close-race:
> 
>           * shard-dg2: SKIP (i915#2575) -> FAIL (i915#7951)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7412 -> IGTPW_9504
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_13463: 20610a111d61d6945d578360942dc5c7bd828eb5 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9504: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9504/index.html
>    IGT_7412: 7412
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
