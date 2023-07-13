Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5975110E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 05:51:07 +0000 (UTC)
Date: Thu, 13 Jul 2023 07:51:02 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230713055102.xepwe3gkuk4ezahu@zkempczy-mobl2>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
 <168920233108.17979.16028262109858236970@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168920233108.17979.16028262109858236970@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRXh0ZW5k?=
 =?utf-8?q?_intel=5Fblt_to_work_on_Xe_=28rev4=29?=
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

On Wed, Jul 12, 2023 at 10:52:11PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Extend intel_blt to work on Xe (rev4)                          
>    URL:     https://patchwork.freedesktop.org/series/120162/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9394/index.html 
> 
>          CI Bug Log - changes from CI_DRM_13378_full -> IGTPW_9394_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9394_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9394_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9394/index.html
> 
> Participating hosts (10 -> 9)
> 
>    Missing (1): pig-kbl-iris
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_9394_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>           * shard-snb: PASS -> ABORT

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_9394_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8411)
>      * igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#7742) +1 similar issue
>      * igt@drm_fdinfo@virtual-busy-hang-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414)
>      * igt@gem_barrier_race@remote-request@rcs0:
> 
>           * shard-glk: PASS -> ABORT (i915#7461 / i915#8211)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#8621)
>      * igt@gem_create@hog-create@smem0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#5892 / i915#8758)
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-mtlp: PASS -> FAIL (i915#6121 / i915#7916)
>      * igt@gem_ctx_param@set-priority-not-supported:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109314)
>      * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +2 similar
>             issues
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#2842) +2 similar issues
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_flush@basic-uc-ro-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_reloc@basic-gtt-cpu-active:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +4 similar issues
>      * igt@gem_exec_reloc@basic-gtt-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_exec_suspend@basic-s4-devices@lmem0:
> 
>           * shard-dg2: NOTRUN -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_exec_whisper@basic-contexts-forked-all:
> 
>           * shard-mtlp: PASS -> TIMEOUT (i915#8628)
>      * igt@gem_exec_whisper@basic-contexts-priority-all:
> 
>           * shard-mtlp: PASS -> TIMEOUT (i915#7392)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_mmap_gtt@fault-concurrent:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +3 similar issues
>      * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +2 similar issues
>      * igt@gem_partial_pwrite_pread@reads-display:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +2 similar issues
>      * igt@gem_partial_pwrite_pread@write-display:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +1 similar issue
>      * igt@gem_render_copy@y-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 similar issue
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#3318)
>      * igt@gen7_exec_parse@basic-offset:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109289)
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-apl: PASS -> ABORT (i915#5566)
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +2 similar issues
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 similar
>             issue
>      * igt@i915_pipe_stress@stress-xrgb8888-untiled:
> 
>           * shard-mtlp: PASS -> FAIL (i915#8691)
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: PASS -> SKIP (fdo#109271)
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1937)
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109506)
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-rkl: PASS -> SKIP (i915#1397) +1 similar issue
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-mtlp: PASS -> DMESG-FAIL (i915#6763)
>      * igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-1:
> 
>           * shard-apl: PASS -> FAIL (i915#2521)
>      * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#2521)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8502) +3 similar issues
>      * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#8247) +3 similar issues
>      * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#8247) +1 similar issue
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1769)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +1 similar issue
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111614) +1 similar issue
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5286)
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +4 similar issues
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111614)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111615) +2 similar issues
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615)
>      * igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#5354) +5 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354) +1
>             similar issue
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3886 / i915#5354 / i915#6095)
> 
>      * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3734 / i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354 / i915#6095) +2 similar
>             issues
>      * igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#3689 / i915#5354 /
>             i915#6095)
>      * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_mtl_mc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5354 / i915#6095) +1 similar
>             issue
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +20 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354) +4 similar issues
> 
>      * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +2 similar issues
>      * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +1 similar issue
>      * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +3 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +1 similar issue
> 
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118)
>      * igt@kms_content_protection@content_type_change:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299) +1 similar issue
>      * igt@kms_content_protection@lic@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#7173) +1 similar issue
>      * igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@kms_cursor_crc@cursor-random-32x10:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / fdo#111767 / i915#5354)
>             +1 similar issue
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111767 / fdo#111825) +1 similar
>             issue
> 
>      * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>           * shard-mtlp: PASS -> FAIL (i915#8248)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3546) +1 similar issue
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: PASS -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@single-move@all-pipes:
> 
>           * shard-mtlp: PASS -> DMESG-WARN (i915#2017)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
> 
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / fdo#111767)
>      * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274) +2 similar issues
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111767)
>      * igt@kms_flip@2x-plain-flip-interruptible:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825) +1 similar issue
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL (i915#79)
>      * igt@kms_flip@flip-vs-suspend@c-dp4:
> 
>           * shard-dg2: NOTRUN -> FAIL (fdo#103375 / i915#6121)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +4 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +9 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +6 similar issues
> 
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +4 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +4 similar issues
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228)
> 
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 similar
>             issue
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6953)
>      * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5176) +11 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5176) +5 similar issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-dp-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235) +11 similar issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +5 similar issues
>      * igt@kms_psr@cursor_mmap_cpu:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#110189) +1 similar issue
>      * igt@kms_psr@sprite_plane_move:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072) +1 similar issue
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235) +1 similar issue
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-rkl: PASS -> ABORT (i915#7461)
>      * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4070 / i915#533 / i915#6768)
>      * igt@kms_vblank@pipe-c-query-busy-hang:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +274 similar issues
>      * igt@perf@global-sseu-config:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7387)
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109289)
>      * igt@perf_pmu@rc6-suspend:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN (i915#8841) +2 similar issues
>      * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#6015) +2 similar issues
>      * igt@v3d/v3d_perfmon@create-perfmon-exceed:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +2 similar issues
>      * igt@v3d/v3d_submit_cl@multi-and-single-sync:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109315 / i915#2575) +1 similar
>             issue
>      * igt@v3d/v3d_submit_csd@bad-multisync-pad:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109315) +1 similar issue
>      * igt@v3d/v3d_submit_csd@bad-perfmon:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +1 similar issue
>      * igt@vc4/vc4_label_bo@set-kernel-name:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +2 similar issues
>      * igt@vc4/vc4_tiling@get-bad-flags:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711)
> 
>     Possible fixes
> 
>      * igt@gem_ctx_persistence@engines-hang@vcs0:
> 
>           * shard-mtlp: FAIL (i915#2410) -> PASS +3 similar issues
>      * igt@gem_ctx_persistence@saturated-hostile@vecs0:
> 
>           * shard-mtlp: FAIL (i915#7816) -> PASS +2 similar issues
>      * igt@gem_eio@hibernate:
> 
>           * {shard-dg1}: ABORT (i915#4391 / i915#7975 / i915#8213) -> PASS
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglu: TIMEOUT (i915#3063 / i915#7941) -> PASS
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS
> 
>           * shard-tglu: FAIL (i915#2842) -> PASS
> 
>      * igt@gem_exec_schedule@preemptive-hang@vcs0:
> 
>           * shard-mtlp: FAIL (i915#7327) -> PASS
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-dg2: FAIL (fdo#103375 / i915#6121) -> PASS +1 similar issue
>      * igt@i915_hangman@gt-engine-error@vcs0:
> 
>           * shard-mtlp: FAIL (i915#7069) -> PASS
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-snb: ABORT (i915#4528 / i915#8393) -> PASS
>      * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-dg2: SKIP (i915#1397) -> PASS
>      * igt@i915_pm_rpm@modeset-non-lpsp:
> 
>           * shard-rkl: SKIP (i915#1397) -> PASS
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-apl: FAIL (i915#2346) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: FAIL (i915#8292) -> PASS
>      * igt@kms_vblank@pipe-c-query-idle-hang:
> 
>           * shard-apl: SKIP (fdo#109271) -> PASS
> 
>           * shard-glk: SKIP (fdo#109271) -> PASS
> 
>      * igt@perf_pmu@busy-double-start@rcs0:
> 
>           * shard-dg2: FAIL (i915#4349) -> PASS
>      * igt@perf_pmu@busy-idle-check-all@vcs0:
> 
>           * shard-dg2: FAIL (i915#4521) -> PASS +7 similar issues
>      * igt@perf_pmu@busy-idle-check-all@vecs0:
> 
>           * {shard-dg1}: FAIL (i915#4521) -> PASS +2 similar issues
>      * igt@perf_pmu@render-node-busy-idle@ccs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS +1 similar issue
>      * igt@syncobj_wait@wait-all-for-submit-delayed-submit:
> 
>           * {shard-dg1}: DMESG-WARN (i915#1982) -> PASS
> 
>     Warnings
> 
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-snb: DMESG-FAIL (fdo#103375) -> DMESG-WARN (i915#8841)
>      * igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>           * shard-mtlp: SKIP (fdo#109289 / i915#8403) -> SKIP (fdo#109289)
>      * igt@kms_async_flips@crc@pipe-a-edp-1:
> 
>           * shard-mtlp: DMESG-FAIL (i915#8561) -> DMESG-FAIL (i915#1982 /
>             i915#8561)
>      * igt@kms_content_protection@content_type_change:
> 
>           * shard-dg2: SKIP (i915#7118 / i915#7162) -> SKIP (i915#7118)
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-dg2: SKIP (i915#7118) -> SKIP (i915#7118 / i915#7162)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-mtlp: FAIL (i915#2346) -> DMESG-FAIL (i915#2017 /
>             i915#5954)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: SKIP (i915#3955) -> SKIP (fdo#110189 / i915#3955)
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * shard-rkl: SKIP (fdo#109285) -> SKIP (fdo#109285 / i915#4098)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7382 -> IGTPW_9394
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_13378: 57ea1a97c50c63c77e3bfa46ee486e8a451be5e7 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9394: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9394/index.html
>    IGT_7382: 1016723d49ff0ce3326af31468245f7b56930cc4 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
