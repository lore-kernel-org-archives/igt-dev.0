Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FB86E598
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2020 04:16:35 +0000 (UTC)
Date: Tue, 1 Sep 2020 06:16:30 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200901041630.GA3939@zkempczy-mobl2>
References: <20200831133049.37017-1-zbigniew.kempczynski@intel.com>
 <159889183684.7425.3670644245393193920@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159889183684.7425.3670644245393193920@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev32=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 04:37:16PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Remove libdrm in rendercopy (rev32)                            
>    URL:     https://patchwork.freedesktop.org/series/79823/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4925/index.html 
> 
>          CI Bug Log - changes from CI_DRM_8945_full -> IGTPW_4925_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_4925_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_4925_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4925/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_4925_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_sync@basic-store-all:
> 
>           * shard-tglb: PASS -> FAIL
> 
>           * shard-iclb: PASS -> FAIL

This series is unrelated to the fails above.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_8945_full and
>    IGTPW_4925_full:
> 
>   New IGT tests (17)
> 
>      * igt@api_intel_bb@check-canonical:
> 
>           * Statuses : 5 pass(s) 2 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@lot-of-buffers:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.69, 4.54] s
>      * igt@api_intel_bb@render:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@render-ccs:
> 
>           * Statuses : 1 incomplete(s) 4 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.47] s
>      * igt@api_intel_bb@render@render-none-1024:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.28, 0.50] s
>      * igt@api_intel_bb@render@render-none-512:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.07, 0.13] s
>      * igt@api_intel_bb@render@render-none-reloc-1024:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.28, 0.41] s
>      * igt@api_intel_bb@render@render-none-reloc-512:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.07, 0.11] s
>      * igt@api_intel_bb@render@render-x-1024:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.26, 0.45] s
>      * igt@api_intel_bb@render@render-x-512:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.06, 0.11] s
>      * igt@api_intel_bb@render@render-x-reloc-1024:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.26, 0.37] s
>      * igt@api_intel_bb@render@render-x-reloc-512:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.06, 0.10] s
>      * igt@api_intel_bb@render@render-y-1024:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.26, 0.45] s
>      * igt@api_intel_bb@render@render-y-512:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.07, 0.15] s
>      * igt@api_intel_bb@render@render-y-reloc-1024:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.26, 0.37] s
>      * igt@api_intel_bb@render@render-y-reloc-512:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.07, 0.10] s
>      * igt@api_intel_bb@reset-flags:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_4925_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_exec_whisper@basic-contexts-priority:
> 
>           * shard-kbl: PASS -> TIMEOUT (i915#1958) +2 similar issues
>      * igt@gem_exec_whisper@basic-fds-forked:
> 
>           * shard-glk: PASS -> TIMEOUT (i915#1958) +2 similar issues
>      * igt@gem_exec_whisper@basic-forked:
> 
>           * shard-tglb: PASS -> TIMEOUT (i915#1958) +1 similar issue
>      * igt@gem_exec_whisper@basic-queues-forked:
> 
>           * shard-apl: PASS -> TIMEOUT (i915#1635 / i915#1958)
>      * igt@gem_tiled_swapping@non-threaded:
> 
>           * shard-glk: PASS -> TIMEOUT (i915#1521 / i915#1958)
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-hsw: PASS -> WARN (i915#1519)
>      * igt@i915_selftest@live@execlists:
> 
>           * shard-tglb: PASS -> INCOMPLETE (i915#2089 / i915#2268)
>      * igt@i915_selftest@mock@contexts:
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#1635 / i915#2278)
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
> 
>           * shard-glk: PASS -> DMESG-FAIL (i915#118 / i915#95)
>      * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
> 
>           * shard-kbl: PASS -> FAIL (i915#54)
> 
>           * shard-apl: PASS -> FAIL (i915#1635 / i915#54)
> 
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
> 
>           * shard-hsw: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
> 
>           * shard-hsw: PASS -> INCOMPLETE (i915#2055)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-tglb: PASS -> DMESG-WARN (i915#1982) +1 similar issue
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180) +5 similar issues
>      * igt@kms_psr2_su@page_flip:
> 
>           * shard-tglb: PASS -> SKIP (i915#1911)
> 
>           * shard-iclb: PASS -> SKIP (i915#1911)
> 
>      * igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441)
> 
>     Possible fixes
> 
>      * igt@gem_exec_parallel@engines@contexts:
> 
>           * shard-iclb: INCOMPLETE (i915#2398) -> PASS
>      * igt@gem_exec_reloc@basic-concurrent0:
> 
>           * shard-kbl: TIMEOUT (i915#1958) -> PASS
>      * igt@gem_exec_whisper@basic-contexts-forked:
> 
>           * shard-glk: TIMEOUT (i915#1958) -> PASS +1 similar issue
>      * igt@gem_exec_whisper@basic-queues:
> 
>           * shard-iclb: TIMEOUT (i915#1958) -> PASS
>      * igt@gem_sync@basic-store-all:
> 
>           * shard-glk: FAIL (i915#2356) -> PASS
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-iclb: DMESG-WARN (i915#1982) -> PASS
> 
>           * shard-kbl: INCOMPLETE -> PASS
> 
>      * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
> 
>           * shard-kbl: FAIL (i915#54) -> PASS
> 
>           * shard-apl: FAIL (i915#1635 / i915#54) -> PASS
> 
>           * shard-glk: FAIL (i915#54) -> PASS
> 
>      * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
> 
>           * shard-hsw: FAIL (i915#2370) -> PASS
>      * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
> 
>           * shard-apl: DMESG-WARN (i915#1635 / i915#1982) -> PASS
>      * igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:
> 
>           * shard-hsw: DMESG-WARN (i915#1982) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
> 
>           * shard-apl: FAIL (i915#1635 / i915#79) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS +5 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-tglb: DMESG-WARN (i915#1982) -> PASS +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-kbl: DMESG-WARN (i915#1982) -> PASS
>      * igt@kms_psr@psr2_suspend:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +2 similar issues
> 
>     Warnings
> 
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
>           * shard-apl: FAIL (fdo#108145 / i915#1635 / i915#265) -> DMESG-FAIL
>             (fdo#108145 / i915#1635 / i915#1982)
> 
> Participating hosts (10 -> 8)
> 
>    Missing (2): pig-skl-6260u pig-glk-j5005
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_5774 -> IGTPW_4925
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_8945: f755f288fce1b2c92373e5b419d13b7f842d2865 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_4925: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4925/index.html
>    IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @
>    git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
