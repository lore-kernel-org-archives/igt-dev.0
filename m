Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD91210ECD3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 10:21:28 +0000 (UTC)
Date: Fri, 28 Apr 2023 12:21:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230428102124.ux7iu2qsg4emdwuk@zkempczy-mobl2>
References: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
 <168267632845.32439.3039665501704898950@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168267632845.32439.3039665501704898950@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50ZWdy?=
 =?utf-8?q?ate_intel-bb_with_Xe_=28rev11=29?=
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

On Fri, Apr 28, 2023 at 10:05:28AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Integrate intel-bb with Xe (rev11)                             
>    URL:     https://patchwork.freedesktop.org/series/116578/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8881/index.html 
> 
>          CI Bug Log - changes from CI_DRM_13071_full -> IGTPW_8881_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8881_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8881_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8881/index.html
> 
> Participating hosts (7 -> 7)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8881_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
>           * shard-apl: PASS -> ABORT

Failure is not relate to the change.

--
Zbigniew


> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * {shard-dg1}: SKIP (i915#3281) -> SKIP +3 similar issues
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> SKIP +6 similar issues
>      * igt@gem_ctx_create@basic-files:
> 
>           * {shard-tglu}: PASS -> ABORT
> 
> Known issues
> 
>    Here are the changes found in IGTPW_8881_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: PASS -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-apl: PASS -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2190)
>      * igt@gem_mmap_gtt@fault-concurrent-x:
> 
>           * shard-snb: PASS -> ABORT (i915#5161)
>      * igt@gem_ppgtt@blt-vs-render-ctxn:
> 
>           * shard-snb: PASS -> FAIL (i915#8295)
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: PASS -> SKIP (fdo#109271)
>      * igt@i915_pm_rps@reset:
> 
>           * shard-snb: PASS -> FAIL (i915#8400)
>      * igt@i915_selftest@live@gt_heartbeat:
> 
>           * shard-apl: PASS -> FAIL (i915#7916)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +25 similar issues
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +6 similar issues
>      * igt@kms_content_protection@atomic@pipe-a-dp-1:
> 
>           * shard-apl: NOTRUN -> TIMEOUT (i915#7173)
>      * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +25 similar issues
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#5465) +1 similar issue
>      * igt@perf@oa-exponents@0-rcs0:
> 
>           * shard-glk: PASS -> ABORT (i915#7941)
> 
>     Possible fixes
> 
>      * igt@gem_barrier_race@remote-request@rcs0:
> 
>           * {shard-dg1}: ABORT (i915#7461 / i915#8234) -> PASS
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * {shard-tglu}: FAIL (i915#6268) -> PASS
>      * igt@gem_eio@hibernate:
> 
>           * shard-apl: ABORT (i915#8213) -> PASS
>      * igt@gem_eio@unwedge-stress:
> 
>           * {shard-dg1}: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * {shard-rkl}: FAIL (i915#2846) -> PASS
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * {shard-rkl}: FAIL (i915#2842) -> PASS
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * {shard-dg1}: TIMEOUT (i915#5493) -> PASS
>      * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * {shard-rkl}: SKIP (i915#1397) -> PASS +1 similar issue
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_plane@pixel-format@pipe-a-planes:
> 
>           * shard-glk: FAIL (i915#1623) -> PASS
>      * igt@kms_vblank@pipe-a-ts-continuation-suspend:
> 
>           * {shard-tglu}: ABORT (i915#5122) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7273 -> IGTPW_8881
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_13071: b9458e7075652669ec0e04abe039a5ed001701fe @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8881: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8881/index.html
>    IGT_7273: f40ef4b058466219968b7792d22ff0648b82396b @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
