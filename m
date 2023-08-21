Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7161D10E221
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Aug 2023 09:52:56 +0000 (UTC)
Date: Mon, 21 Aug 2023 11:52:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230821095205.qw7odx4ua7utoe2o@zkempczy-mobl2>
References: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
 <169232469048.12738.6231781199678581841@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169232469048.12738.6231781199678581841@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRXh0ZW5k?=
 =?utf-8?q?_compute_square_to_i915_and_Xe?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 02:11:30AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Extend compute square to i915 and Xe                           
>    URL:     https://patchwork.freedesktop.org/series/122568/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/index.html 
> 
>            CI Bug Log - changes from IGT_7442_full -> IGTPW_9610_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9610_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9610_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_9610_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * {igt@gem_compute@compute-square} (NEW):
> 
>           * shard-dg1: NOTRUN -> SKIP
> 
>           * shard-mtlp: NOTRUN -> SKIP

At the moment skips at dg1 and mtlp are expected.

> 
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE

Unrelated to the change.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between IGT_7442_full and IGTPW_9610_full:
> 
>   New IGT tests (1)
> 
>      * igt@gem_compute@compute-square:
>           * Statuses : 2 pass(s) 5 skip(s)
>           * Exec time: [0.0] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_9610_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6230)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6230)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6230)
> 
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@drm_fdinfo@isolation@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +11 similar issues
>      * igt@feature_discovery@display-2x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1839)
>      * igt@feature_discovery@psr2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#658)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#658)
> 
>      * {igt@gem_compute@compute-square} (NEW):
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271)
> 
>      * igt@gem_ctx_persistence@engines-queued:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_ctx_persistence@hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#2410)
>      * igt@gem_ctx_persistence@saturated-hostile@vecs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#7816) +2 similar issues
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@kms:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#7892)
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#5784)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-dg1: PASS -> FAIL (i915#5784)
>      * igt@gem_exec_balancer@bonded-false-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4036)
>      * igt@gem_exec_capture@pi@vcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4475)
>      * igt@gem_exec_fair@basic-none-rrul:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_fair@basic-pace:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539) +1 similar issue
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-throttle:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771) +1 similar
>             issue
>      * igt@gem_exec_fence@submit3:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812) +1 similar issue
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3711)
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#112283)
>      * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +6 similar issues
>      * igt@gem_exec_reloc@basic-softpin:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +5 similar issues
>      * igt@gem_exec_schedule@preempt-engines@ccs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#9119) +4 similar issues
>      * igt@gem_exec_schedule@preempt-queue-chain:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_suspend@basic-s4-devices@smem:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_fenced_exec_thrash@no-spare-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +1 similar issue
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_madvise@dontneed-before-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +2 similar issues
>      * igt@gem_media_fill@media-fill:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8289)
>      * igt@gem_mmap@bad-size:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap@big-bo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +2 similar issues
>      * igt@gem_mmap_gtt@basic-read-write-distinct:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +7 similar issues
>      * igt@gem_mmap_gtt@basic-write-read-distinct:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +6 similar issues
>      * igt@gem_mmap_wc@coherency:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 similar issue
>      * igt@gem_partial_pwrite_pread@reads-snoop:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +1 similar issue
>      * igt@gem_pread@bench:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +1 similar issue
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +1 similar issue
> 
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270) +2 similar issues
>      * igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +1 similar issue
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +5 similar issues
>      * igt@gem_spin_batch@user-each:
> 
>           * shard-mtlp: PASS -> DMESG-FAIL (i915#8962 / i915#9121) +1 similar
>             issue
>      * igt@gem_tiled_blits@basic:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077)
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4879)
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +4 similar issues
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#3318)
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#3318)
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#3318)
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#3318)
> 
>      * igt@gen3_render_tiledx_blits:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109289) +4 similar issues
>      * igt@gen7_exec_parse@cmd-crossing-page:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109289) +1 similar issue
>      * igt@gen9_exec_parse@batch-zero-length:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +3 similar issues
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856)
>      * igt@i915_fb_tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4881)
>      * igt@i915_hangman@engine-engine-error@vcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#7069)
>      * igt@i915_hwmon@hwmon-read:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7707)
>      * igt@i915_pipe_stress@stress-xrgb8888-untiled:
> 
>           * shard-mtlp: PASS -> FAIL (i915#8691)
>      * igt@i915_pm_backlight@basic-brightness:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354 / i915#7561) +1 similar
>             issue
>      * igt@i915_pm_lpsp@screens-disabled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1902)
>      * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#2681 / i915#3591)
>      * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>           * shard-tglu: NOTRUN -> WARN (i915#2681) +2 similar issues
>      * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#1397)
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: PASS -> SKIP (i915#1397)
> 
>           * shard-dg1: PASS -> SKIP (i915#1397) +2 similar issues
> 
>      * igt@i915_pm_rpm@pc8-residency:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109506) +1 similar issue
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@reset:
> 
>           * shard-snb: PASS -> INCOMPLETE (i915#7790)
> 
>           * shard-tglu: PASS -> INCOMPLETE (i915#8320)
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#8346)
> 
>      * igt@i915_pm_rps@thresholds-park@gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_selftest@live@migrate:
> 
>           * shard-mtlp: NOTRUN -> DMESG-FAIL (i915#7699)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#8247) +1 similar issue
>      * igt@kms_async_flips@crc@pipe-b-dp-2:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#8247) +3 similar issues
>      * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#8247) +3 similar issues
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1769) +1 similar issue
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111614) +4 similar issues
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286)
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5286)
> 
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#3743)
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111614 / i915#3638)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111614)
> 
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111614) +2 similar issues
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +8 similar issues
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110723) +1 similar issue
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +1 similar issue
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615) +1 similar issue
> 
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +3 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111615) +8 similar issues
>      * igt@kms_big_joiner@basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2705)
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3886 / i915#6095) +2 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#5354) +9 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3734 / i915#5354 / i915#6095)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095) +1
>             similar issue
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#3689 / i915#5354 /
>             i915#6095)
> 
>      * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354) +3
>             similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_mtl_rc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354) +4 similar issues
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5354 / i915#6095) +1 similar
>             issue
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5354 / i915#6095) +4 similar
>             issues
> 
>      * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +17 similar issues
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7213 / i915#9010)
>      * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087 / i915#7213) +2 similar
>             issues
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7213)
>      * igt@kms_chamelium_color@ctm-limited-range:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +7 similar issues
>      * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828)
> 
>      * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +4 similar issues
>      * igt@kms_content_protection@atomic@pipe-a-dp-2:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#7173)
>      * igt@kms_content_protection@lic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944) +2 similar issues
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7118)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7116)
> 
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3359)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3359)
> 
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359) +1 similar issue
>      * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-edp-1:
> 
>           * shard-mtlp: PASS -> DMESG-WARN (i915#2017)
>      * igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814) +1 similar issue
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555)
> 
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3546)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / i915#5354)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111825) +6 similar issues
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274) +1 similar issue
> 
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: PASS -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#3840)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
> 
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274) +4 similar issues
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825) +2 similar issues
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / i915#3637)
> 
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111767) +1 similar
>             issue
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381) +1 similar issue
>      * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN (i915#8841)
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +4 similar issues
>      * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL (i915#2122)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810)
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +13 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +10 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280) +5 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +1 similar issue
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +4 similar
>             issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +39 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +22 similar issues
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 similar
>             issue
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228)
> 
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 similar
>             issues
>      * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109289) +1 similar issue
>      * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109289) +1 similar issue
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8806)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6953)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#8292)
>      * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5176) +15 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5176) +11 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5176) +7 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5176) +7 similar issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-dp-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235) +15 similar issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +7 similar issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +58 similar issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +5 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +7 similar issues
>      * igt@kms_prime@basic-crc-vgem:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658) +2 similar issues
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111068 / i915#658)
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111068 / i915#658)
> 
>      * igt@kms_psr@psr2_cursor_plane_move:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072) +2 similar issues
>      * igt@kms_psr@sprite_mmap_gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072)
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#110189) +1 similar issue
> 
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5461 / i915#658)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5461 / i915#658)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5461 / i915#658)
> 
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111615 / i915#5289)
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111615 / i915#5289)
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5289)
> 
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +5 similar issues
>      * igt@kms_selftest@drm_cmdline:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8661) +2 similar issues
>      * igt@kms_selftest@drm_format_helper:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8661)
>      * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#5465) +1 similar issue
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8823)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109309)
>      * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4070 / i915#6768)
>      * igt@perf@enable-disable@0-rcs0:
> 
>           * shard-dg2: PASS -> FAIL (i915#8724)
>      * igt@perf@mi-rpc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2434)
>      * igt@perf_pmu@busy-double-start@vcs1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4349) +2 similar issues
>      * igt@perf_pmu@cpu-hotplug:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8850)
>      * igt@perf_pmu@render-node-busy-idle@ccs2:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#4349) +4 similar issues
>      * igt@perf_pmu@semaphore-busy@vecs0:
> 
>           * shard-dg2: PASS -> FAIL (i915#4349) +7 similar issues
>      * igt@prime_udl:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109291)
>      * igt@prime_vgem@basic-read:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708) +1 similar issue
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 similar
>             issue
>      * igt@runner@aborted:
> 
>           * shard-snb: NOTRUN -> (FAIL, FAIL, FAIL) (i915#7812 / i915#8848)
>      * igt@v3d/v3d_create_bo@create-bo-4096:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109315)
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109315 / i915#2575)
> 
>      * igt@v3d/v3d_submit_cl@simple-flush-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +9 similar issues
>      * igt@v3d/v3d_submit_cl@valid-submission:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +4 similar issues
>      * igt@vc4/vc4_label_bo@set-bad-handle:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +1 similar issue
>      * igt@vc4/vc4_lookup_fail@bad-color-write:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +5 similar issues
>      * igt@vc4/vc4_purgeable_bo@free-purged-bo:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +4 similar issues
>      * igt@vc4/vc4_wait_bo@bad-pad:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +1 similar issue
> 
>     Possible fixes
> 
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-rkl: FAIL (i915#6268) -> PASS
>      * igt@gem_ctx_persistence@engines-hang@vcs0:
> 
>           * shard-mtlp: FAIL (i915#2410) -> PASS +3 similar issues
>      * igt@gem_eio@hibernate:
> 
>           * shard-tglu: ABORT (i915#7975 / i915#8213 / i915#8398) -> PASS
>      * igt@gem_eio@in-flight-contexts-immediate:
> 
>           * shard-mtlp: ABORT (i915#8503) -> PASS
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-apl: CRASH -> PASS
>      * igt@gem_eio@kms:
> 
>           * shard-dg1: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_capture@pi@vecs0:
> 
>           * shard-mtlp: FAIL (i915#4475 / i915#7765) -> PASS
>      * igt@gem_exec_endless@dispatch@vcs1:
> 
>           * shard-mtlp: TIMEOUT (i915#3778) -> PASS
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS
> 
>           * shard-tglu: FAIL (i915#2842) -> PASS
> 
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +2 similar issues
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg2: DMESG-WARN (i915#4936 / i915#5493) -> PASS
>      * igt@i915_hangman@detector@vcs0:
> 
>           * shard-mtlp: FAIL (i915#8456) -> PASS +2 similar issues
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-mtlp: ABORT (i915#8489 / i915#8668) -> PASS
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-tglu: FAIL (i915#3989 / i915#454) -> PASS
>      * igt@i915_pm_rpm@dpms-lpsp:
> 
>           * shard-rkl: SKIP (i915#1397) -> PASS +2 similar issues
> 
>           * shard-dg1: SKIP (i915#1397) -> PASS +1 similar issue
> 
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-dg2: SKIP (i915#1397) -> PASS +1 similar issue
>      * igt@i915_selftest@live@requests:
> 
>           * shard-mtlp: ABORT (i915#7982) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-mtlp: FAIL (i915#3743) -> PASS +1 similar issue
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglu: FAIL (i915#3743) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-mtlp: FAIL (i915#2346) -> PASS +1 similar issue
>      * igt@kms_flip@blocking-absolute-wf_vblank@a-vga1:
> 
>           * shard-snb: ABORT (i915#8865) -> PASS
>      * igt@sysfs_heartbeat_interval@mixed@ccs0:
> 
>           * shard-mtlp: ABORT (i915#8552) -> PASS
>      * igt@sysfs_heartbeat_interval@mixed@vecs0:
> 
>           * shard-mtlp: FAIL (i915#1731) -> PASS
>      * igt@sysfs_heartbeat_interval@precise@vecs0:
> 
>           * shard-mtlp: FAIL (i915#8332) -> PASS
> 
>     Warnings
> 
>      * igt@kms_async_flips@crc@pipe-a-edp-1:
> 
>           * shard-mtlp: DMESG-FAIL (i915#8561) -> DMESG-FAIL (i915#1982 /
>             i915#8561)
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: SKIP (i915#7118) -> SKIP (i915#7118 / i915#7162)
>      * igt@kms_flip@flip-vs-suspend@b-vga1:
> 
>           * shard-snb: INCOMPLETE (i915#4839) -> DMESG-WARN (i915#8841)
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * shard-rkl: SKIP (fdo#109285 / i915#4098) -> SKIP (fdo#109285)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-rkl: SKIP (i915#4816) -> SKIP (i915#4070 / i915#4816)
>      * igt@kms_psr@sprite_plane_onoff:
> 
>           * shard-dg1: SKIP (i915#1072 / i915#4078) -> SKIP (i915#1072)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7442 -> IGTPW_9610
> 
>    CI-20190529: 20190529
>    CI_DRM_13528: a7c0be10a6b6a23017681cc609c1353711dc70e7 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9610: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/index.html
>    IGT_7442: f6eea5a02525d62d10596408d1175c83d6f4038e @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
