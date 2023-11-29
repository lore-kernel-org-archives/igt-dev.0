Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DD210E236
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 18:15:36 +0000 (UTC)
Date: Wed, 29 Nov 2023 19:15:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231129181531.7zdwp3fj4btavrta@kamilkon-desk.igk.intel.com>
References: <20231123085346.8067-1-lukasz.laguna@intel.com>
 <170089348837.14416.11855438975182579754@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170089348837.14416.11855438975182579754@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSAgZm9yIHhlL3hl?=
 =?utf-8?q?=5Fquery=3A_add_media_GT_presence_checker_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lgci.bug.filing@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below is unrelated to change in Xe lib,

Regards,
Kamil

On 2023-11-25 at 06:24:48 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: xe/xe_query: add media GT presence checker (rev2)
> URL   : https://patchwork.freedesktop.org/series/126762/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13914_full -> IGTPW_10251_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10251_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10251_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): shard-tglu0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10251_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_persistence@smoketest:
>     - shard-mtlp:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-mtlp-5/igt@gem_ctx_persistence@smoketest.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-4/igt@gem_ctx_persistence@smoketest.html
> 
>   * igt@i915_module_load@reload:
>     - shard-snb:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-snb4/igt@i915_module_load@reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-snb4/igt@i915_module_load@reload.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4}:
>     - shard-dg1:          NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-16/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html
> 
>   * {igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-1}:
>     - shard-tglu:         NOTRUN -> [FAIL][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-6/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10251_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@drm_fdinfo@busy-hang@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#8414]) +18 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@drm_fdinfo@busy-hang@rcs0.html
> 
>   * igt@drm_fdinfo@busy@ccs0:
>     - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8414]) +21 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@drm_fdinfo@busy@ccs0.html
> 
>   * igt@drm_fdinfo@virtual-busy-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8414]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-12/igt@drm_fdinfo@virtual-busy-hang.html
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#3936])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@gem_busy@semaphore.html
>     - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#3936])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-12/igt@gem_busy@semaphore.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#9323])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-8/igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][13] ([i915#7297])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#7697])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#7697])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          [PASS][16] -> [INCOMPLETE][17] ([i915#9364])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#6335])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-9/igt@gem_create@create-ext-cpu-access-sanity-check.html
>     - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#6335])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-7/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_ctx_freq@sysfs@gt0:
>     - shard-dg2:          NOTRUN -> [FAIL][20] ([i915#9561])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@gem_ctx_freq@sysfs@gt0.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-dg2:          NOTRUN -> [SKIP][21] ([fdo#109314])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8555])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hang:
>     - shard-snb:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#1099])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-snb4/igt@gem_ctx_persistence@legacy-engines-hang.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#280])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-2/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#280])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-1/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@create-ext:
>     - shard-mtlp:         [PASS][26] -> [ABORT][27] ([i915#9262])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-mtlp-7/igt@gem_eio@create-ext.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-4/igt@gem_eio@create-ext.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [PASS][28] -> [FAIL][29] ([i915#5784])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-dg1-16/igt@gem_eio@reset-stress.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-17/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-pair:
>     - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#4771])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-8/igt@gem_exec_balancer@bonded-pair.html
> 
>   * igt@gem_exec_capture@many-4k-incremental:
>     - shard-dg2:          NOTRUN -> [FAIL][31] ([i915#9606])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@gem_exec_capture@many-4k-incremental.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][32] ([i915#2842])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-2/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share:
>     - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4473] / [i915#4771]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-1/igt@gem_exec_fair@basic-pace-share.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-tglu:         [PASS][34] -> [FAIL][35] ([i915#2842])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fence@concurrent:
>     - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4812])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@gem_exec_fence@concurrent.html
> 
>   * igt@gem_exec_fence@submit3:
>     - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4812]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-5/igt@gem_exec_fence@submit3.html
> 
>   * igt@gem_exec_flush@basic-wb-rw-default:
>     - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@gem_exec_flush@basic-wb-rw-default.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([fdo#112283])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_exec_reloc@basic-cpu-wc-active:
>     - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#3281]) +8 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-1/igt@gem_exec_reloc@basic-cpu-wc-active.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu-active:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3281]) +9 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-cpu-active.html
> 
>   * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
>     - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3281]) +4 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-17/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4537] / [i915#4812])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4537] / [i915#4812])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-4/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_fence_thrash@bo-copy:
>     - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4860])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@gem_fence_thrash@bo-copy.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4860]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4613]) +3 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-4/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@massive-random:
>     - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#4613])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-glk9/igt@gem_lmem_swapping@massive-random.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#4613]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-7/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_mmap_gtt@big-bo-tiledy:
>     - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4077]) +6 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@gem_mmap_gtt@big-bo-tiledy.html
> 
>   * igt@gem_mmap_gtt@coherency:
>     - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4077]) +3 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-12/igt@gem_mmap_gtt@coherency.html
> 
>   * igt@gem_mmap_gtt@fault-concurrent-y:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4077]) +11 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-y.html
> 
>   * igt@gem_mmap_wc@copy:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4083]) +4 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@gem_mmap_wc@copy.html
>     - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4083]) +3 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-16/igt@gem_mmap_wc@copy.html
> 
>   * igt@gem_mmap_wc@set-cache-level:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4083]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@gem_mmap_wc@set-cache-level.html
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3282]) +4 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-5/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>   * igt@gem_pwrite@basic-random:
>     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3282]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@gem_pwrite@basic-random.html
> 
>   * igt@gem_pxp@create-valid-protected-context:
>     - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4270])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-18/igt@gem_pxp@create-valid-protected-context.html
> 
>   * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>     - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4270]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4270]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4270])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#8428]) +6 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4079])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4079]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_softpin@evict-snoop:
>     - shard-tglu:         NOTRUN -> [SKIP][65] ([fdo#109312])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-9/igt@gem_softpin@evict-snoop.html
>     - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4885])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-1/igt@gem_softpin@evict-snoop.html
> 
>   * igt@gem_spin_batch@spin-all-new:
>     - shard-dg2:          NOTRUN -> [FAIL][67] ([i915#5889])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3297]) +3 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#3297]) +2 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297] / [i915#4880])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3297])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-17/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#3297])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen3_mixed_blits:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([fdo#109289])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-18/igt@gen3_mixed_blits.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([fdo#109289]) +6 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-5/igt@gen3_render_linear_blits.html
> 
>   * igt@gen7_exec_parse@cmd-crossing-page:
>     - shard-mtlp:         NOTRUN -> [SKIP][75] ([fdo#109289]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-1/igt@gen7_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][76] ([i915#5566])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-glk5/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#2856]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-7/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#2527] / [i915#2856]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-8/igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2856]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-mtlp:         NOTRUN -> [SKIP][80] ([fdo#109293])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-mtlp:         NOTRUN -> [FAIL][81] ([i915#8346])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_pm_rps@thresholds@gt0:
>     - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#8925])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-4/igt@i915_pm_rps@thresholds@gt0.html
> 
>   * igt@i915_pm_rps@thresholds@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#3555] / [i915#8925])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-4/igt@i915_pm_rps@thresholds@gt1.html
> 
>   * igt@i915_query@query-topology-coherent-slice-mask:
>     - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#6188])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-5/igt@i915_query@query-topology-coherent-slice-mask.html
> 
>   * igt@i915_query@query-topology-unsupported:
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([fdo#109302])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-15/igt@i915_query@query-topology-unsupported.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-tglu:         NOTRUN -> [DMESG-WARN][86] ([i915#9311])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-8/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4212]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#5190]) +12 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4212])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-15/igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_async_flips@crc@pipe-d-dp-4:
>     - shard-dg2:          NOTRUN -> [FAIL][90] ([i915#8247]) +3 other tests fail
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-glk:          NOTRUN -> [SKIP][91] ([fdo#109271]) +57 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-glk9/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][92] ([fdo#111614]) +2 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#5286])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#5286])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][95] ([fdo#111615] / [i915#5286]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4538] / [i915#5286])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [PASS][97] -> [FAIL][98] ([i915#5138]) +1 other test fail
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-snb:          NOTRUN -> [SKIP][99] ([fdo#109271]) +29 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-snb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][100] ([fdo#111614])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-9/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][101] ([fdo#111614]) +4 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#6187])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-mtlp:         NOTRUN -> [SKIP][103] ([fdo#111615]) +8 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-tglu:         [PASS][104] -> [FAIL][105] ([i915#3743]) +2 other tests fail
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4538] / [i915#5190]) +3 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
>     - shard-tglu:         NOTRUN -> [SKIP][107] ([fdo#111615]) +3 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#2705])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([fdo#111827]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-5/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-tglu:         NOTRUN -> [SKIP][110] ([fdo#111827])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-3/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-mtlp:         NOTRUN -> [SKIP][111] ([fdo#111827])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#7828]) +8 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#7828]) +3 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#7828]) +4 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>     - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#7828]) +5 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][116] ([i915#7173]) +1 other test timeout
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#3299]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#3116] / [i915#3299])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-6/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#7118])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@kms_content_protection@lic.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#3359]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#3555]) +5 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#3555] / [i915#8814]) +1 other test skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#3359])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-tglu:         NOTRUN -> [SKIP][124] ([fdo#109274]) +3 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-9/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-glk:          [PASS][125] -> [FAIL][126] ([i915#72])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>     - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#3546]) +1 other test skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4103] / [i915#4213] / [i915#5608])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#4213]) +1 other test skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][130] ([fdo#109274] / [i915#5354]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [PASS][131] -> [FAIL][132] ([i915#2346])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@forked-bo@all-pipes:
>     - shard-mtlp:         NOTRUN -> [DMESG-WARN][133] ([i915#2017])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#3555] / [i915#8827])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-8/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#3555] / [i915#3840] / [i915#4098] / [i915#9159])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-8/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#3555] / [i915#3840] / [i915#4098])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#3555] / [i915#3840])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-7/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#3469])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#4881])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-8/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#3637]) +3 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#8381])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-5/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning:
>     - shard-tglu:         NOTRUN -> [SKIP][142] ([fdo#109274] / [i915#3637]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-3/igt@kms_flip@2x-flip-vs-panning.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][143] ([fdo#109274]) +5 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][144] ([fdo#111825]) +7 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-12/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#2672]) +1 other test skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#2587] / [i915#2672])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#2672] / [i915#3555])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#2672]) +2 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#2587] / [i915#2672]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#3555] / [i915#8810])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#5274])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#8708]) +19 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#5354]) +24 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#3458]) +14 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
>     - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#3458]) +5 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#1825]) +28 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-tglu:         NOTRUN -> [SKIP][157] ([fdo#109280]) +15 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
>     - shard-tglu:         NOTRUN -> [SKIP][158] ([fdo#110189]) +9 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
>     - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#8708]) +7 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#8708]) +2 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3555] / [i915#8228])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3555] / [i915#8228])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-6/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#3555] / [i915#8228])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-8/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#4816])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#1839])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-tglu:         NOTRUN -> [SKIP][166] ([fdo#109289])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#3555] / [i915#8821])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#3555] / [i915#8806])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-7/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#6953])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-15/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][170] -> [FAIL][171] ([i915#8292])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-tglu-9/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#5176]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#5176] / [i915#9423]) +3 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#5235]) +7 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#5235]) +3 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#5235]) +15 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#9683])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#9683]) +5 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#4348])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr2_cursor_mmap_gtt:
>     - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#9673])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-6/igt@kms_psr@psr2_cursor_mmap_gtt.html
> 
>   * igt@kms_psr@psr2_cursor_plane_onoff:
>     - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#9673])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-12/igt@kms_psr@psr2_cursor_plane_onoff.html
> 
>   * igt@kms_psr@psr2_dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#9681]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-6/igt@kms_psr@psr2_dpms.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-tglu:         NOTRUN -> [SKIP][183] ([fdo#111615] / [i915#5289])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>     - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#4235]) +2 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3555]) +2 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-dg2:          NOTRUN -> [FAIL][186] ([IGT#2])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#8623])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:
>     - shard-snb:          [PASS][188] -> [FAIL][189] ([i915#9196]) +1 other test fail
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - shard-mtlp:         [PASS][190] -> [FAIL][191] ([i915#9196]) +1 other test fail
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@perf_pmu@busy-double-start@rcs0:
>     - shard-mtlp:         [PASS][192] -> [FAIL][193] ([i915#4349])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-mtlp-1/igt@perf_pmu@busy-double-start@rcs0.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-7/igt@perf_pmu@busy-double-start@rcs0.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#8850])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#3708] / [i915#4077])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-2/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#3708] / [i915#4077])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-2/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#3291] / [i915#3708])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-3/igt@prime_vgem@basic-write.html
> 
>   * igt@v3d/v3d_submit_cl@bad-flag:
>     - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#2575])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-15/igt@v3d/v3d_submit_cl@bad-flag.html
> 
>   * igt@v3d/v3d_submit_cl@single-out-sync:
>     - shard-tglu:         NOTRUN -> [SKIP][199] ([fdo#109315] / [i915#2575]) +5 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-3/igt@v3d/v3d_submit_cl@single-out-sync.html
> 
>   * igt@v3d/v3d_submit_cl@valid-multisync-submission:
>     - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#2575]) +8 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@v3d/v3d_submit_cl@valid-multisync-submission.html
> 
>   * igt@v3d/v3d_submit_csd@bad-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#2575]) +10 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@v3d/v3d_submit_csd@bad-bo.html
> 
>   * igt@vc4/vc4_label_bo@set-kernel-name:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#7711]) +8 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@vc4/vc4_label_bo@set-kernel-name.html
> 
>   * igt@vc4/vc4_perfmon@get-values-invalid-pointer:
>     - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#7711]) +7 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-7/igt@vc4/vc4_perfmon@get-values-invalid-pointer.html
> 
>   * igt@vc4/vc4_tiling@set-bad-flags:
>     - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#2575]) +2 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-9/igt@vc4/vc4_tiling@set-bad-flags.html
> 
>   * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
>     - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#7711]) +2 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-16/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [FAIL][206] ([i915#6268]) -> [PASS][207]
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-tglu-2/igt@gem_ctx_exec@basic-nohangcheck.html
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_eio@in-flight-contexts-1us:
>     - shard-mtlp:         [ABORT][208] ([i915#9414]) -> [PASS][209] +1 other test pass
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-mtlp-7/igt@gem_eio@in-flight-contexts-1us.html
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@gem_eio@in-flight-contexts-1us.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          [TIMEOUT][210] ([i915#5493]) -> [PASS][211]
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
>     - shard-dg1:          [TIMEOUT][212] ([i915#5493]) -> [PASS][213]
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          [DMESG-WARN][214] ([i915#9559]) -> [PASS][215]
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * {igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0}:
>     - shard-dg1:          [FAIL][216] ([i915#3591]) -> [PASS][217]
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-mtlp:         [FAIL][218] ([i915#5138]) -> [PASS][219]
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-tglu:         [FAIL][220] ([i915#3743]) -> [PASS][221]
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-b-hdmi-a-1:
>     - shard-snb:          [INCOMPLETE][222] -> [PASS][223]
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-snb1/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-b-hdmi-a-1.html
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-snb1/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-b-hdmi-a-1.html
> 
>   * {igt@kms_pm_rpm@modeset-lpsp-stress}:
>     - shard-dg2:          [SKIP][224] ([i915#9519]) -> [PASS][225]
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
>     - shard-mtlp:         [FAIL][226] ([i915#9196]) -> [PASS][227]
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
> 
>   * igt@perf@enable-disable@0-rcs0:
>     - shard-dg2:          [FAIL][228] ([i915#8724]) -> [PASS][229]
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-dg2-5/igt@perf@enable-disable@0-rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@crc@pipe-b-edp-1:
>     - shard-mtlp:         [DMESG-FAIL][230] ([i915#8561]) -> [FAIL][231] ([i915#8247]) +1 other test fail
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13914/shard-mtlp-8/igt@kms_async_flips@crc@pipe-b-edp-1.html
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/shard-mtlp-1/igt@kms_async_flips@crc@pipe-b-edp-1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5889]: https://gitlab.freedesktop.org/drm/intel/issues/5889
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
>   [i915#6188]: https://gitlab.freedesktop.org/drm/intel/issues/6188
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
>   [i915#7297]: https://gitlab.freedesktop.org/drm/intel/issues/7297
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#8063]: https://gitlab.freedesktop.org/drm/intel/issues/8063
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8346]: https://gitlab.freedesktop.org/drm/intel/issues/8346
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8724]: https://gitlab.freedesktop.org/drm/intel/issues/8724
>   [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
>   [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
>   [i915#8827]: https://gitlab.freedesktop.org/drm/intel/issues/8827
>   [i915#8850]: https://gitlab.freedesktop.org/drm/intel/issues/8850
>   [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
>   [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
>   [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
>   [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
>   [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
>   [i915#9293]: https://gitlab.freedesktop.org/drm/intel/issues/9293
>   [i915#9311]: https://gitlab.freedesktop.org/drm/intel/issues/9311
>   [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
>   [i915#9337]: https://gitlab.freedesktop.org/drm/intel/issues/9337
>   [i915#9340]: https://gitlab.freedesktop.org/drm/intel/issues/9340
>   [i915#9364]: https://gitlab.freedesktop.org/drm/intel/issues/9364
>   [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
>   [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
>   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/intel/issues/9433
>   [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
>   [i915#9559]: https://gitlab.freedesktop.org/drm/intel/issues/9559
>   [i915#9561]: https://gitlab.freedesktop.org/drm/intel/issues/9561
>   [i915#9606]: https://gitlab.freedesktop.org/drm/intel/issues/9606
>   [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
>   [i915#9681]: https://gitlab.freedesktop.org/drm/intel/issues/9681
>   [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
>   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7597 -> IGTPW_10251
> 
>   CI-20190529: 20190529
>   CI_DRM_13914: 0b1d4056dbe497edc6d866ca5b3f54c5927bd7c0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10251: 10251
>   IGT_7597: 380983dbd9bb2f7eea5e917e8fed0569bfe8cf9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10251/index.html
