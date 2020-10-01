Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA616E84B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2020 05:28:30 +0000 (UTC)
Date: Thu, 1 Oct 2020 07:28:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201001052824.GA2761@zkempczy-mobl2>
References: <20200930120946.43257-1-zbigniew.kempczynski@intel.com>
 <160148598039.17417.8567320911096700355@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160148598039.17417.8567320911096700355@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/intel=5Fbatchbuffer=3A_Pre?=
 =?utf-8?q?pare_batch_to_use_in_allocator_infrastructure?=
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

On Wed, Sep 30, 2020 at 05:13:00PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  series starting with [i-g-t,1/2] lib/intel_batchbuffer: Prepare   
>             batch to use in allocator infrastructure                          
>    URL:     https://patchwork.freedesktop.org/series/82257/                   
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5032/index.html    
> 
>            CI Bug Log - changes from IGT_5794_full -> IGTPW_5032_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5032_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5032_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5032/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_5032_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
>           * shard-iclb: PASS -> INCOMPLETE

Series don't touch above and it is unrelated to above.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_5032_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_eio@kms:
> 
>           * shard-snb: PASS -> DMESG-WARN (i915#1982)
>      * igt@gem_exec_reloc@basic-many-active@rcs0:
> 
>           * shard-apl: PASS -> FAIL (i915#1635 / i915#2389)
>      * igt@gem_exec_whisper@basic-queues-priority:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#118 / i915#95)
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: PASS -> FAIL (i915#454)
>      * igt@i915_suspend@debugfs-reader:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180)
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
> 
>           * shard-iclb: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_flip@flip-vs-suspend-interruptible@b-vga1:
> 
>           * shard-snb: PASS -> DMESG-WARN (i915#42)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
> 
>           * shard-tglb: PASS -> DMESG-WARN (i915#1982) +5 similar issues
>      * igt@kms_psr@psr2_cursor_blt:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +2 similar issues
>      * igt@kms_setmode@basic:
> 
>           * shard-apl: PASS -> FAIL (i915#1635 / i915#31)
> 
>     Possible fixes
> 
>      * {igt@core_hotunplug@unbind-rebind}:
> 
>           * shard-tglb: INCOMPLETE (i915#1602) -> PASS
> 
>           * shard-iclb: INCOMPLETE -> PASS
> 
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: SKIP (i915#658) -> PASS
>      * igt@gem_exec_nop@basic-parallel:
> 
>           * shard-glk: DMESG-WARN (i915#118 / i915#95) -> PASS +1 similar
>             issue
>      * igt@kms_color@pipe-b-legacy-gamma:
> 
>           * shard-kbl: FAIL (i915#71) -> PASS
> 
>           * shard-apl: FAIL (i915#1635 / i915#71) -> PASS
> 
>      * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
> 
>           * shard-kbl: DMESG-WARN (i915#78) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS +4 similar issues
>      * igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a1:
> 
>           * shard-glk: FAIL (i915#407) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-stridechange:
> 
>           * shard-tglb: DMESG-WARN (i915#1982) -> PASS +1 similar issue
> 
>           * shard-glk: DMESG-WARN (i915#1982) -> PASS
> 
>      * igt@kms_psr@psr2_cursor_plane_move:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS
>      * igt@kms_setmode@basic:
> 
>           * shard-glk: FAIL (i915#31) -> PASS
>      * igt@perf_pmu@busy-hang@vecs0:
> 
>           * shard-iclb: DMESG-WARN (i915#1982) -> PASS
>      * igt@sysfs_heartbeat_interval@mixed@bcs0:
> 
>           * shard-kbl: INCOMPLETE (i915#1731) -> PASS
> 
>     Warnings
> 
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-tglb: DMESG-WARN (i915#2411) -> SKIP (i915#1904)
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-apl: TIMEOUT (i915#1319 / i915#1635 / i915#1958) -> FAIL
>             (fdo#110321 / fdo#110336 / i915#1635)
>      * igt@kms_frontbuffer_tracking@psr-suspend:
> 
>           * shard-tglb: DMESG-WARN (i915#2411) -> DMESG-WARN (i915#1982 /
>             i915#2411)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (8 -> 8)
> 
>    No changes in participating hosts
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_5794 -> IGTPW_5032
> 
>    CI-20190529: 20190529
>    CI_DRM_9077: ae1f3f7de609df105aeceed2655656ffc838d720 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_5032: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5032/index.html
>    IGT_5794: eeccb2a17453f90ad92d1ab6f81ad7d344119d72 @
>    git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
