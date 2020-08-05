Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8A389C82
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2020 10:01:55 +0000 (UTC)
Date: Wed, 5 Aug 2020 12:01:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200805100150.GA5259@zkempczy-mobl2>
References: <20200804094128.31242-1-zbigniew.kempczynski@intel.com>
 <159654737064.12581.17099688044338498692@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159654737064.12581.17099688044338498692@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev25=29?=
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

On Tue, Aug 04, 2020 at 01:22:50PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Remove libdrm in rendercopy (rev25)                            
>    URL:     https://patchwork.freedesktop.org/series/79823/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4849/index.html 
> 
>          CI Bug Log - changes from CI_DRM_8838_full -> IGTPW_4849_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_4849_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_4849_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4849/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_4849_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@perf@oa-exponents:
> 
>           * shard-hsw: PASS -> INCOMPLETE
>      * igt@runner@aborted:
> 
>           * shard-snb: NOTRUN -> FAIL

Above regressions are not introduced by the series sent.

--
Zbigniew



> 
> New tests
> 
>    New tests have been introduced between CI_DRM_8838_full and
>    IGTPW_4849_full:
> 
>   New IGT tests (16)
> 
>      * igt@api_intel_bb@check-canonical:
> 
>           * Statuses : 5 pass(s) 2 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@render:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@render-ccs:
> 
>           * Statuses : 5 pass(s) 2 skip(s)
>           * Exec time: [0.0, 0.46] s
>      * igt@api_intel_bb@render@render-none-1024:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.28, 0.49] s
>      * igt@api_intel_bb@render@render-none-512:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.07, 0.12] s
>      * igt@api_intel_bb@render@render-none-reloc-1024:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.28, 0.42] s
>      * igt@api_intel_bb@render@render-none-reloc-512:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.07, 0.12] s
>      * igt@api_intel_bb@render@render-x-1024:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.26, 0.45] s
>      * igt@api_intel_bb@render@render-x-512:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.07, 0.11] s
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
>           * Exec time: [0.07, 0.11] s
>      * igt@api_intel_bb@render@render-y-reloc-1024:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.26, 0.37] s
>      * igt@api_intel_bb@render@render-y-reloc-512:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.06, 0.10] s
>      * igt@api_intel_bb@reset-flags:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_4849_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_param@non-root-set:
> 
>           * shard-snb: PASS -> TIMEOUT (i915#1958)
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-snb: PASS -> INCOMPLETE (i915#82) +1 similar issue
>      * igt@i915_selftest@mock@contexts:
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#1635)
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180) +4 similar issues
>      * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#1635 / i915#1982)
>      * igt@kms_flip@busy-flip@c-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL (i915#275)
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
> 
>           * shard-iclb: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
> 
>           * shard-glk: PASS -> FAIL (i915#49) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-stridechange:
> 
>           * shard-tglb: PASS -> DMESG-WARN (i915#1982) +1 similar issue
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#1982)
> 
>      * igt@kms_psr@psr2_cursor_mmap_cpu:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +2 similar issues
>      * igt@kms_setmode@basic:
> 
>           * shard-hsw: PASS -> FAIL (i915#31)
>      * igt@kms_vblank@pipe-c-wait-forked:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#62 / i915#92) +28 similar
>             issues
>      * igt@prime_busy@hang-wait@bcs0:
> 
>           * shard-hsw: PASS -> FAIL (i915#2258) +4 similar issues
> 
>     Possible fixes
> 
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-apl: DMESG-WARN (i915#1436 / i915#1635 / i915#716) -> PASS
> 
>           * shard-kbl: DMESG-WARN (i915#1436 / i915#716) -> PASS
> 
>      * igt@kms_addfb_basic@small-bo:
> 
>           * shard-apl: TIMEOUT (i915#1635 / i915#1958) -> PASS +1 similar
>             issue
> 
>           * shard-snb: TIMEOUT (i915#1958) -> PASS
> 
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> 
>           * shard-iclb: DMESG-WARN (i915#1982) -> PASS
> 
>           * shard-glk: DMESG-FAIL (i915#118 / i915#95) -> PASS
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
> 
>           * shard-hsw: TIMEOUT (i915#1958) -> PASS +1 similar issue
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ab-vga1-hdmi-a1:
> 
>           * shard-hsw: DMESG-WARN (i915#1982) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS +5 similar issues
>      * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
> 
>           * shard-hsw: INCOMPLETE (i915#2055) -> PASS
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1:
> 
>           * shard-kbl: DMESG-WARN (i915#1982) -> PASS
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>           * shard-iclb: FAIL (i915#49) -> PASS
>      * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
> 
>           * shard-tglb: DMESG-WARN (i915#1982) -> PASS +3 similar issues
>      * igt@kms_psr@psr2_sprite_blt:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +2 similar issues
>      * igt@kms_vblank@pipe-a-query-forked-busy-hang:
> 
>           * shard-apl: DMESG-WARN (i915#1635 / i915#1982) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_reloc@basic-concurrent16:
> 
>           * shard-apl: TIMEOUT (i915#1635 / i915#1958) -> INCOMPLETE
>             (i915#1635 / i915#1958)
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>           * shard-snb: SKIP (fdo#109271) -> TIMEOUT (i915#1958)
>      * igt@kms_chamelium@hdmi-edid-change-during-suspend:
> 
>           * shard-snb: SKIP (fdo#109271 / fdo#111827) -> TIMEOUT (i915#1958)
>      * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
> 
>           * shard-snb: TIMEOUT (i915#1958) -> SKIP (fdo#109271)
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> INCOMPLETE (CI#80 / i915#155)
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
> 
>           * shard-kbl: FAIL (i915#265) -> DMESG-FAIL (i915#62)
>      * igt@runner@aborted:
> 
>           * shard-kbl: FAIL (fdo#109271 / i915#1436 / i915#716) -> FAIL
>             (i915#1611 / i915#1784)
> 
>           * shard-apl: FAIL (fdo#109271 / i915#1635 / i915#716) -> FAIL
>             (i915#1635 / i915#2110)
> 
> Participating hosts (11 -> 8)
> 
>    Missing (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_5757 -> IGTPW_4849
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_8838: 46952d45f8045d8810e3e2c3d3675f61f1e0c827 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_4849: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4849/index.html
>    IGT_5757: d78c7fd293cb228fe03ccff730202b033e25ff18 @
>    git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
