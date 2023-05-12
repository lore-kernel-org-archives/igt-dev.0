Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D4310E5A0
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 05:14:48 +0000 (UTC)
Date: Fri, 12 May 2023 07:14:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230512051444.6s5fwx2g2uzak423@zkempczy-mobl2>
References: <20230511193617.86458-1-zbigniew.kempczynski@intel.com>
 <168386349712.26102.697831563960859240@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168386349712.26102.697831563960859240@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgTGltaXQg?=
 =?utf-8?q?intel-bb_to_48-bit?=
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

On Fri, May 12, 2023 at 03:51:37AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Limit intel-bb to 48-bit                                       
>    URL:     https://patchwork.freedesktop.org/series/117649/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8945/index.html 
> 
>          CI Bug Log - changes from CI_DRM_13138_full -> IGTPW_8945_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8945_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8945_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8945/index.html
> 
> Participating hosts (7 -> 7)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8945_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-64:
>           * shard-apl: PASS -> FAIL

Unrelated to the change.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@gem_eio@reset-stress:
>           * {shard-dg1}: PASS -> INCOMPLETE
> 
> Known issues
> 
>    Here are the changes found in IGTPW_8945_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-apl: PASS -> ABORT (i915#5566)
> 
>           * shard-glk: PASS -> ABORT (i915#5566)
> 
>      * igt@i915_selftest@live@sanitycheck:
> 
>           * shard-snb: PASS -> ABORT (i915#4528 / i915#4579)
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +2 similar
>             issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-apl: PASS -> FAIL (i915#2346)
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4579) +2 similar
>             issues
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@kms_vblank@pipe-d-wait-busy-hang:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +37 similar issues
> 
>     Possible fixes
> 
>      * igt@gem_ctx_exec@basic-close-race:
> 
>           * {shard-dg1}: DMESG-WARN -> PASS
>      * igt@gem_eio@in-flight-contexts-immediate:
> 
>           * shard-apl: TIMEOUT (i915#3063) -> PASS
>      * igt@gem_eio@unwedge-stress:
> 
>           * {shard-tglu}: TIMEOUT (i915#3063 / i915#7941) -> PASS
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: FAIL (i915#2846) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * {shard-rkl}: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * {shard-dg1}: TIMEOUT (i915#5493) -> PASS
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * {shard-tglu}: FAIL (i915#3989 / i915#454) -> PASS
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: SKIP (fdo#109271) -> PASS
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * {shard-rkl}: SKIP (i915#1397) -> PASS +1 similar issue
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * {shard-rkl}: FAIL (i915#3743) -> PASS
>      * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
> 
>           * shard-apl: FAIL (i915#1188) -> PASS
>      * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2:
> 
>           * {shard-rkl}: ABORT -> PASS
>      * igt@perf@stress-open-close@0-rcs0:
> 
>           * shard-glk: ABORT (i915#5213 / i915#7941) -> PASS
> 
>     Warnings
> 
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-apl: SKIP (fdo#109271 / i915#4579) -> SKIP (fdo#109271)
> 
>           * shard-snb: SKIP (fdo#109271 / i915#4579) -> SKIP (fdo#109271)
> 
>           * shard-glk: SKIP (fdo#109271 / i915#4579) -> SKIP (fdo#109271)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7285 -> IGTPW_8945
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_13138: b35107d813ef012806df9eeeea1ff9f37adf0400 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8945: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8945/index.html
>    IGT_7285: d1cbf2bad9c2664ab8bd3bd0946510a52800912f @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
