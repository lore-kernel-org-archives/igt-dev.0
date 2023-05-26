Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E15E10E7E3
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 10:40:38 +0000 (UTC)
Date: Fri, 26 May 2023 12:39:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230526103908.jqrhdzfuzxwwwu4n@zkempczy-mobl2>
References: <20230525193411.174802-1-zbigniew.kempczynski@intel.com>
 <168509592185.32386.11884096035712839671@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168509592185.32386.11884096035712839671@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU2tpcCBy?=
 =?utf-8?q?ender_test_on_PVC?=
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

On Fri, May 26, 2023 at 10:12:01AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Skip render test on PVC                                        
>    URL:     https://patchwork.freedesktop.org/series/118386/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9039/index.html 
> 
>          CI Bug Log - changes from CI_DRM_13188_full -> IGTPW_9039_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9039_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9039_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9039/index.html
> 
> Participating hosts (7 -> 7)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_9039_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
> 
>           * shard-glk: NOTRUN -> TIMEOUT +2 similar issues
>      * igt@perf@non-zero-reason@0-rcs0:
> 
>           * shard-glk: PASS -> TIMEOUT +2 similar issues
>      * igt@perf@polling-parameterized:
> 
>           * shard-glk: PASS -> ABORT

Not related to this series.

--
Zbigniew

> 
>     Warnings
> 
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
>           * shard-snb: SKIP (fdo#109271) -> FAIL
> 
> Known issues
> 
>    Here are the changes found in IGTPW_9039_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_barrier_race@remote-request@rcs0:
> 
>           * shard-glk: PASS -> ABORT (i915#7461 / i915#8211)
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +4 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-apl: PASS -> ABORT (i915#5566)
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4579)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-apl: NOTRUN -> SKIP (IGT#6 / fdo#109271) +1 similar issue
>      * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#4579) +10 similar
>             issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-hdmi-a-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +18 similar issues
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>     Possible fixes
> 
>      * igt@gem_barrier_race@remote-request@rcs0:
> 
>           * {shard-rkl}: ABORT (i915#7461 / i915#8211) -> PASS
> 
>           * {shard-dg1}: ABORT (i915#7461 / i915#8234) -> PASS
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * {shard-dg1}: FAIL (i915#5784) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * {shard-tglu}: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-none@bcs0:
> 
>           * {shard-rkl}: FAIL (i915#2842) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +2 similar issues
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: SKIP (fdo#109271) -> PASS
>      * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * {shard-rkl}: SKIP (i915#1397) -> PASS +1 similar issue
>      * igt@i915_selftest@live@gt_heartbeat:
> 
>           * shard-apl: DMESG-FAIL (i915#5334) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: FAIL (IGT#6 / i915#2346) -> PASS +1 similar issue
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: FAIL (i915#2122) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-snb: SKIP (fdo#109271) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7303 -> IGTPW_9039
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_13188: c32513de80b47e8f2f1ef45cfb753c0ba2800f75 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9039: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9039/index.html
>    IGT_7303: 8f09a9f1da506db907b549bb477f3233b5416733 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
