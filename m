Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BDF6E89B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2020 10:28:16 +0000 (UTC)
Date: Wed, 25 Nov 2020 11:28:09 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201125102809.GA8099@zkempczy-mobl2>
References: <20201119105032.43893-1-zbigniew.kempczynski@intel.com>
 <160629537321.8878.15117350900795166318@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160629537321.8878.15117350900795166318@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv6=2C1/3=5D_lib/igt=5Fdevice=5Fscan?=
 =?utf-8?q?=3A_Remember_vendor/device_for_pci_devices_=28rev2=29?=
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

On Wed, Nov 25, 2020 at 09:09:33AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  series starting with [i-g-t,v6,1/3] lib/igt_device_scan: Remember 
>             vendor/device for pci devices (rev2)                              
>    URL:     https://patchwork.freedesktop.org/series/84060/                   
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5223/index.html    
> 
>          CI Bug Log - changes from CI_DRM_9387_full -> IGTPW_5223_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5223_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5223_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5223/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_5223_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_unfence_active_buffers:
>           * shard-hsw: NOTRUN -> INCOMPLETE

Unrelated.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_5223_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_exec_suspend@basic-s0:
> 
>           * shard-hsw: PASS -> INCOMPLETE (i915#1888 / i915#2637)
> 
>           * shard-iclb: PASS -> INCOMPLETE (i915#1090 / i915#1185)
> 
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#1635 / i915#1982) +2 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-glk: PASS -> FAIL (i915#49)
>      * igt@kms_frontbuffer_tracking@fbc-badstride:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#1982) +4 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-stridechange:
> 
>           * shard-iclb: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
> 
>           * shard-tglb: PASS -> DMESG-WARN (i915#1982) +4 similar issues
>      * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
> 
>           * shard-iclb: PASS -> INCOMPLETE (i915#1185 / i915#250)
> 
>           * shard-kbl: PASS -> INCOMPLETE (i915#155) +1 similar issue
> 
>           * shard-hsw: PASS -> DMESG-WARN (i915#2637)
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#2635) +1 similar issue
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#1635 / i915#2635) +1 similar
>             issue
> 
>      * igt@kms_psr@psr2_cursor_render:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
> 
>     Possible fixes
> 
>      * igt@device_reset@unbind-reset-rebind:
> 
>           * shard-glk: INCOMPLETE (i915#2283 / i915#2405) -> PASS
> 
>           * shard-apl: INCOMPLETE (i915#1635 / i915#2283 / i915#2405) -> PASS
> 
>           * shard-kbl: INCOMPLETE (i915#2283 / i915#2405) -> PASS
> 
>           * shard-tglb: INCOMPLETE (i915#1602 / i915#750) -> PASS
> 
>           * shard-iclb: INCOMPLETE (i915#2283 / i915#2405) -> PASS
> 
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: SKIP (i915#658) -> PASS
>      * igt@gem_exec_whisper@basic-fds-forked:
> 
>           * shard-glk: DMESG-WARN (i915#118 / i915#95) -> PASS
>      * igt@i915_pm_backlight@fade_with_suspend:
> 
>           * shard-iclb: DMESG-WARN -> PASS
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: FAIL (i915#454) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-hsw: WARN (i915#1519) -> PASS
>      * igt@i915_pm_rpm@gem-execbuf-stress:
> 
>           * shard-glk: SKIP (fdo#109271) -> PASS
> 
>           * shard-apl: SKIP (fdo#109271 / i915#1635) -> PASS
> 
>           * shard-kbl: SKIP (fdo#109271) -> PASS
> 
>           * shard-hsw: SKIP (fdo#109271) -> PASS
> 
>      * {igt@kms_async_flips@alternate-sync-async-flip}:
> 
>           * shard-tglb: FAIL (i915#2521) -> PASS
>      * igt@kms_color@pipe-a-gamma:
> 
>           * shard-tglb: FAIL (i915#1149) -> PASS
>      * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
> 
>           * shard-apl: DMESG-WARN (i915#1635 / i915#1982) -> PASS +6 similar
>             issues
>      * igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: DMESG-WARN (i915#1982) -> PASS +5 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
> 
>           * shard-kbl: FAIL (i915#49) -> PASS
> 
>           * shard-apl: FAIL (i915#1635 / i915#49) -> PASS
> 
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-tglb: DMESG-WARN (i915#1982) -> PASS +2 similar issues
>      * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
> 
>           * shard-iclb: DMESG-WARN (i915#1982) -> PASS +1 similar issue
>      * igt@kms_plane_lowres@pipe-a-tiling-y:
> 
>           * shard-apl: DMESG-WARN (i915#1635 / i915#1982 / i915#2621) -> PASS
>      * igt@kms_psr@psr2_cursor_blt:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +1 similar issue
>      * igt@kms_vblank@pipe-b-wait-forked-busy:
> 
>           * shard-kbl: DMESG-WARN (i915#1982) -> PASS +5 similar issues
>      * igt@perf@polling-parameterized:
> 
>           * shard-iclb: FAIL (i915#1542) -> PASS
> 
>     Warnings
> 
>      * igt@device_reset@unbind-reset-rebind:
> 
>           * shard-hsw: INCOMPLETE (i915#2283 / i915#2405) -> WARN (i915#2283)
>      * igt@gem_exec_suspend@basic-s0:
> 
>           * shard-tglb: DMESG-WARN (i915#2411) -> INCOMPLETE (i915#1436 /
>             i915#1602 / i915#1887 / i915#2411 / i915#456)
>      * igt@i915_pm_backlight@fade_with_suspend:
> 
>           * shard-tglb: DMESG-WARN (i915#1436 / i915#1602 / i915#1887 /
>             i915#2411) -> DMESG-WARN (i915#2411)
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-iclb: WARN (i915#1804 / i915#2684) -> WARN (i915#2681 /
>             i915#2684)
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-iclb: WARN (i915#2681) -> WARN (i915#1804)
>      * igt@kms_content_protection@atomic:
> 
>           * shard-apl: TIMEOUT (i915#1319 / i915#1635) -> DMESG-FAIL
>             (fdo#110321 / i915#1635)
>      * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
> 
>           * shard-tglb: DMESG-WARN (i915#2411) -> INCOMPLETE (i915#1436 /
>             i915#1798 / i915#1982 / i915#456)
>      * igt@runner@aborted:
> 
>           * shard-hsw: (FAIL, FAIL) (i915#2283 / i915#2292 / i915#2295 /
>             i915#2505) -> (FAIL, FAIL) (i915#2295)
> 
>           * shard-iclb: (FAIL, FAIL, FAIL) (i915#1814 / i915#2283 / i915#2295
>             / i915#483) -> (FAIL, FAIL, FAIL) (i915#1814 / i915#2295)
> 
>           * shard-apl: (FAIL, FAIL) (i915#1635 / i915#2295) -> (FAIL, FAIL,
>             FAIL) (i915#1635 / i915#1814 / i915#2295)
> 
>           * shard-glk: (FAIL, FAIL, FAIL) (i915#1814 / i915#2295 /
>             k.org#202321) -> (FAIL, FAIL, FAIL) (i915#1814 / i915#2295 /
>             i915#483 / k.org#202321)
> 
>           * shard-tglb: (FAIL, FAIL, FAIL) (i915#2295) -> (FAIL, FAIL, FAIL)
>             (i915#1602 / i915#1814 / i915#2295)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (10 -> 8)
> 
>    Missing (2): pig-skl-6260u pig-glk-j5005
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_5870 -> IGTPW_5223
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_9387: 99de1330fc348fcd8a800874a620573277402ee0 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_5223: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5223/index.html
>    IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @
>    git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
