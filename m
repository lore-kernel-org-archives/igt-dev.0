Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1E510E506
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 06:05:08 +0000 (UTC)
Date: Thu, 14 Sep 2023 08:03:31 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230914060331.so3klwpuh4zmngc4@zkempczy-mobl2>
References: <20230913142417.584184-1-zbigniew.kempczynski@intel.com>
 <169464068706.31250.16034303819457775154@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169464068706.31250.16034303819457775154@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIG1p?=
 =?utf-8?q?ssing_Meteorlake_gpgpu_fill_condition?=
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

On Wed, Sep 13, 2023 at 09:31:27PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add missing Meteorlake gpgpu fill condition                    
>    URL:     https://patchwork.freedesktop.org/series/123640/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9781/index.html 
> 
>          CI Bug Log - changes from CI_DRM_13625_full -> IGTPW_9781_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9781_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9781_full, please notify your bug team
>    (lgci.bug.filing@intel.com) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9781/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_9781_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@perf_pmu@rc6@gt0:
> 
>           * shard-mtlp: NOTRUN -> ABORT
>      * igt@perf_pmu@rc6@runtime-pm-long-gt1:
> 
>           * shard-mtlp: NOTRUN -> DMESG-WARN +5 other tests dmesg-warn

Unrelated to the change. See below:

> 
>     Warnings
> 
>      * igt@i915_suspend@basic-s2idle-without-i915:
>           * shard-snb: DMESG-WARN (i915#8841) -> INCOMPLETE
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@kms_feature_discovery@display-3x}:
> 
>           * shard-mtlp: NOTRUN -> SKIP +1 other test skip
>      * {igt@kms_feature_discovery@psr2}:
> 
>           * shard-dg2: NOTRUN -> SKIP
> 
> Known issues
> 
>    Here are the changes found in IGTPW_9781_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7701) +1 other test skip
>      * igt@drm_fdinfo@busy-idle-check-all@ccs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +12 other tests skip
>      * igt@drm_fdinfo@busy@ccs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +11 other tests skip
>      * igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#7742)
>      * igt@drm_fdinfo@virtual-busy-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8414) +1 other test skip
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#7297)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#9283)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-tglu: PASS -> FAIL (i915#6268)
>      * igt@gem_ctx_isolation@preservation-s3@vcs1:
> 
>           * shard-mtlp: NOTRUN -> DMESG-WARN (i915#9262) +3 other tests
>             dmesg-warn
>      * igt@gem_ctx_param@set-priority-not-supported:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109314)
>      * igt@gem_ctx_persistence@engines-hostile-preempt:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +1 other test
>             skip
>      * igt@gem_ctx_persistence@engines-hostile@vcs0:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#2410) +3 other tests fail
>      * igt@gem_ctx_persistence@heartbeat-close:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5882) +5 other tests skip
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
> 
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: PASS -> FAIL (i915#5784)
>      * igt@gem_exec_balancer@bonded-pair:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_balancer@sliced:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglu: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-sync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771)
>      * igt@gem_exec_fair@basic-throttle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_fence@submit67:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_flush@basic-uc-pro-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +5 other tests
>             skip
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +2 other tests
>             skip
> 
>      * igt@gem_exec_params@secure-non-master:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#112283) +1 other test skip
>      * igt@gem_exec_reloc@basic-cpu-gtt-active:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +1 other test skip
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +4 other tests skip
> 
>      * igt@gem_exec_reloc@basic-gtt-cpu-active:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +8 other tests skip
>      * igt@gem_exec_reloc@basic-wc-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +11 other tests skip
>      * igt@gem_exec_schedule@preempt-queue:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_schedule@preempt-queue-chain:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>      * igt@gem_exec_schedule@reorder-wide:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_fence_thrash@bo-write-verify-x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +2 other tests skip
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860) +1 other test skip
> 
>      * igt@gem_fenced_exec_thrash@too-many-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_mmap@bad-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap@basic-small-bo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +4 other tests skip
>      * igt@gem_mmap_gtt@bad-object:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +10 other tests skip
>      * igt@gem_mmap_gtt@big-bo-tiledy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +19 other tests skip
>      * igt@gem_mmap_gtt@cpuset-basic-small-copy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>      * igt@gem_mmap_offset@clear@smem0:
> 
>           * shard-mtlp: PASS -> ABORT (i915#8668)
>      * igt@gem_mmap_wc@write-gtt-read-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_partial_pwrite_pread@reads:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +6 other tests skip
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-off-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270) +6 other tests skip
>      * igt@gem_readwrite@read-write:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +9 other tests skip
>      * igt@gem_spin_batch@spin-each:
> 
>           * shard-mtlp: NOTRUN -> DMESG-FAIL (i915#8962 / i915#9121)
>      * igt@gem_tiled_pread_basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079) +2 other tests skip
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
> 
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297)
> 
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@sd-probe:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4958)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4958)
> 
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#2724)
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-mtlp: PASS -> ABORT (i915#9262) +1 other test abort
>      * igt@gen7_exec_parse@bitmasks:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109289) +1 other test skip
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#109289)
> 
>      * igt@gen7_exec_parse@load-register-reg:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109289)
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527)
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +2 other tests skip
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +5 other tests skip
>      * igt@i915_hangman@gt-error-state-capture@vecs0:
> 
>           * shard-mtlp: PASS -> DMESG-WARN (i915#9262)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg2: NOTRUN -> DMESG-WARN (i915#7061 / i915#8617)
>      * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>           * shard-dg1: PASS -> FAIL (i915#3591)
>      * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1397)
>      * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#1397) +1 other test skip
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * shard-dg1: PASS -> SKIP (i915#1397) +1 other test skip
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109506)
>      * igt@i915_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#1397)
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@reset:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#8346)
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109303)
>      * igt@i915_query@query-topology-unsupported:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#109302)
>      * igt@i915_selftest@live@gt_engines:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#9278 / i915#9290)
>      * igt@i915_selftest@live@gt_pm:
> 
>           * shard-mtlp: NOTRUN -> DMESG-FAIL (i915#9270)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +12 other tests skip
>      * igt@kms_addfb_basic@tile-pitch-mismatch:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8502 / i915#8709) +11 other tests
>             skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8502) +7 other tests skip
>      * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#8247) +3 other tests fail
>      * igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#8247) +3 other tests fail
>      * igt@kms_async_flips@crc@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> DMESG-FAIL (i915#8561) +3 other tests
>             dmesg-fail
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1769)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111614) +1 other test skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +1 other test
>             skip
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286)
> 
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#5138)
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111614 / i915#3638)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
> 
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111614) +4 other tests skip
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-tglu: PASS -> FAIL (i915#3743) +1 other test fail
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111615) +8 other tests skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +5 other tests
>             skip
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
> 
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111615)
>      * igt@kms_big_joiner@2x-modeset:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2705)
>      * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_mc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354 / i915#6095) +2 other tests
>             skip
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3886 / i915#6095) +5 other tests
>             skip
>      * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +32 other tests skip
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095) +2
>             other tests skip
>      * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354) +6
>             other tests skip
>      * igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3689 / i915#5354) +25 other tests
>             skip
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3734 / i915#5354 / i915#6095)
>      * igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5354 / i915#6095) +1 other test
>             skip
>      * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354) +5 other tests skip
>      * igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5354 / i915#6095) +10 other tests
>             skip
>      * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095) +1
>             other test skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7213 / i915#9010)
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087 / i915#7213) +3 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-0-25:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_color@ctm-0-75:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111827) +1 other test skip
>      * igt@kms_chamelium_color@ctm-green-to-red:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111827) +3 other tests skip
>      * igt@kms_chamelium_color@ctm-red-to-blue:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828)
>      * igt@kms_chamelium_frames@hdmi-frame-dump:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +3 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +8 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +6 other tests skip
>      * igt@kms_color@deep-color:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +5 other tests skip
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
> 
>      * igt@kms_content_protection@content_type_change:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118)
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118) +2 other tests skip
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7116)
> 
>      * igt@kms_content_protection@uevent@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#1339)
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +2 other tests
>             skip
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111767 / i915#3546) +1 other test
>             skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4213) +1 other test skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3546) +4 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / i915#5354) +4 other tests
>             skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-apl: PASS -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: PASS -> FAIL (i915#2346)
>      * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9226 / i915#9261) +1 other test
>             skip
>      * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9227)
>      * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9227)
>      * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9226 / i915#9261) +1 other test
>             skip
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3469)
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110189 / i915#3955)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
> 
>      * igt@kms_fence_pin_leak:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4881)
>      * igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +8 other tests skip
>      * igt@kms_flip@2x-flip-vs-fences-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381) +1 other test skip
>      * igt@kms_flip@2x-wf_vblank-ts-check:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274) +5 other tests skip
>      * igt@kms_flip@flip-vs-blocking-wf-vblank@b-vga1:
> 
>           * shard-snb: PASS -> ABORT (i915#8865)
>      * igt@kms_flip@flip-vs-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +49 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#1982 / i915#4423)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111825) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#110189) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +5 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +36 other tests skip
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-tglu: PASS -> SKIP (i915#433)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109289) +4 other tests skip
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN (i915#8841) +5 other tests
>             dmesg-warn
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#180)
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
> 
>           * shard-mtlp: NOTRUN -> ABORT (i915#9262) +14 other tests abort
>      * igt@kms_plane_lowres@tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8821)
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8806)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8806)
>      * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5176) +1 other test skip
>      * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5176) +7 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5176) +3 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5176) +27 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +245 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +7 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235) +11 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +1 other test skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +19 other tests skip
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805)
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658) +1 other test skip
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111068 / i915#658)
> 
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4348)
>      * igt@kms_psr@primary_mmap_cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072) +7 other tests skip
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072)
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072)
> 
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5461 / i915#658)
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5461 / i915#658)
> 
>      * igt@kms_rotation_crc@bad-tiling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_selftest@drm_cmdline:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8661)
>      * igt@kms_setmode@basic@pipe-a-vga-1:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#5465) +1 other test fail
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109309)
>      * igt@kms_universal_plane@cursor-fb-leak-pipe-b:
> 
>           * shard-snb: PASS -> FAIL (i915#9196)
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8808)
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2437) +1 other test skip
>      * igt@perf@global-sseu-config-invalid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7387)
>      * igt@perf@polling-small-buf:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#1722)
>      * igt@perf_pmu@busy-idle@bcs0:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#4349) +2 other tests fail
>      * igt@perf_pmu@frequency@gt0:
> 
>           * shard-apl: PASS -> SKIP (fdo#109271)
> 
>           * shard-glk: PASS -> SKIP (fdo#109271)
> 
>           * shard-snb: PASS -> SKIP (fdo#109271)
> 
>      * igt@perf_pmu@rc6@other-idle-gt1:
> 
>           * shard-mtlp: NOTRUN -> INCOMPLETE (i915#9268)
>      * igt@prime_udl:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109291)
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@coherency-blt:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#8445)
>      * igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575) +2 other tests skip
>      * igt@v3d/v3d_submit_csd@job-perfmon:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +10 other tests skip
>      * igt@v3d/v3d_wait_bo@map-bo-0ns:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +11 other tests skip
>      * igt@vc4/vc4_perfmon@create-perfmon-exceed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +9 other tests skip
>      * igt@vc4/vc4_perfmon@create-perfmon-invalid-events:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575)
>      * igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711) +2 other tests skip
>      * igt@vc4/vc4_tiling@get-bad-modifier:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +9 other tests skip
>      * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +2 other tests skip
> 
>     Possible fixes
> 
>      * igt@drm_fdinfo@virtual-idle:
> 
>           * shard-rkl: FAIL (i915#7742) -> PASS
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS +3 other tests pass
>      * igt@gem_exec_schedule@noreorder@bcs0:
> 
>           * shard-mtlp: FAIL -> PASS
>      * igt@gem_exec_schedule@noreorder@ccs0:
> 
>           * shard-mtlp: DMESG-FAIL (i915#8962 / i915#9121) -> PASS
>      * igt@gem_exec_schedule@noreorder@vcs0:
> 
>           * shard-mtlp: DMESG-FAIL (i915#9121) -> PASS +1 other test pass
>      * igt@i915_pipe_stress@stress-xrgb8888-untiled:
> 
>           * shard-mtlp: FAIL (i915#8691) -> PASS

I was targetting this error so I'm going to merge the series.
Rerun is not necessary.

--
Zbigniew


>      * igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: SKIP (i915#1397) -> PASS +1 other test pass
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:
> 
>           * shard-mtlp: ABORT (i915#9262) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
> 
>           * shard-mtlp: DMESG-WARN (i915#9262) -> PASS +1 other test pass
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-dg1: DMESG-WARN (i915#1982) -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak-pipe-a:
> 
>           * shard-glk: FAIL (i915#9196) -> PASS
>      * igt@perf@gen12-oa-tlb-invalidate@0-rcs0:
> 
>           * shard-rkl: FAIL -> PASS
>      * igt@perf_pmu@busy-idle@vcs0:
> 
>           * shard-dg2: FAIL (i915#4349) -> PASS +7 other tests pass
> 
>           * shard-dg1: FAIL (i915#4349) -> PASS +2 other tests pass
> 
>      * igt@perf_pmu@frequency@gt0:
> 
>           * shard-dg2: FAIL (i915#6806) -> PASS
> 
>           * shard-dg1: FAIL (i915#6806) -> PASS
> 
>      * igt@sysfs_preempt_timeout@timeout@vecs0:
> 
>           * shard-mtlp: ABORT (i915#8521 / i915#8865) -> PASS
> 
>     Warnings
> 
>      * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
> 
>           * shard-tglu: WARN (i915#2681) -> FAIL (i915#2681 / i915#3591)
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-dg1: SKIP (fdo#109300) -> SKIP (i915#7116)
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * shard-rkl: SKIP (fdo#109285) -> SKIP (fdo#109285 / i915#4098)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-rkl: SKIP (i915#4070 / i915#4816) -> SKIP (i915#4816)
>      * igt@kms_psr@primary_page_flip:
> 
>           * shard-dg1: SKIP (i915#1072 / i915#4078) -> SKIP (i915#1072) +1
>             other test skip
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7486 -> IGTPW_9781
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_13625: df710849c4a552f8516480ccaf5b215b4b086530 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9781: 9781
>    IGT_7486: afd9a940c8247291baadd1977fe881d4f2edf0c7 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
