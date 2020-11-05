Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6414F6E0FD
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2020 06:38:02 +0000 (UTC)
Date: Thu, 5 Nov 2020 07:15:06 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201105061506.GA3277@zkempczy-mobl2>
References: <20201104180008.42282-1-zbigniew.kempczynski@intel.com>
 <160452882067.21430.835332134071064370@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160452882067.21430.835332134071064370@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/igt=5Fdevice=5Fscan=3A_Pro?=
 =?utf-8?q?vide_function_for_return_integrated_card?=
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

On Wed, Nov 04, 2020 at 10:27:00PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  series starting with [i-g-t,1/2] lib/igt_device_scan: Provide     
>             function for return integrated card                               
>    URL:     https://patchwork.freedesktop.org/series/83507/                   
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/index.html    
> 
>          CI Bug Log - changes from CI_DRM_9265_full -> IGTPW_5127_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5127_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5127_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5127/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_5127_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_flush@basic-batch-kernel-default-wb:
> 
>           * shard-snb: PASS -> FAIL
>      * igt@gem_exec_flush@basic-wb-rw-default:
> 
>           * shard-hsw: PASS -> FAIL
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-glk: PASS -> DMESG-WARN
> 
>           * shard-hsw: PASS -> DMESG-WARN
> 
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-glk: PASS -> INCOMPLETE

All above is unrelated to the code changes.

--
Zbigniew


> 
>     Warnings
> 
>      * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
>           * shard-tglb: DMESG-WARN ([i915#2411]) -> SKIP
> 
> Known issues
> 
>    Here are the changes found in IGTPW_5127_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_blits@basic:
> 
>           * shard-hsw: PASS -> FAIL ([i915#1888]) +1 similar issue
>      * igt@gem_caching@reads:
> 
>           * shard-snb: PASS -> INCOMPLETE ([i915#82])
>      * igt@gem_eio@kms:
> 
>           * shard-snb: PASS -> DMESG-WARN ([i915#1982])
>      * igt@gem_exec_whisper@basic-queues-priority-all:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118] / [i915#95])
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-iclb: PASS -> INCOMPLETE ([i915#1185]) +1 similar issue
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-glk: PASS -> INCOMPLETE ([i915#1436])
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-apl: PASS -> INCOMPLETE ([i915#1635]) +1 similar issue
> 
>           * shard-hsw: PASS -> INCOMPLETE ([i915#2055]) +1 similar issue
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#155]) +1 similar issue
> 
>      * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#1635] / [i915#1982]) +5
>             similar issues
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2598])
>      * igt@kms_flip@flip-vs-suspend@b-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180])
>      * igt@kms_flip@flip-vs-suspend@b-edp1:
> 
>           * shard-iclb: PASS -> INCOMPLETE ([i915#1373])
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-tglb: PASS -> DMESG-WARN ([i915#1982]) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#1982]) +2 similar issues
>      * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#1982]) +6 similar issues
>      * igt@kms_plane_cursor@pipe-b-viewport-size-256:
> 
>           * shard-hsw: PASS -> DMESG-WARN ([i915#1982]) +2 similar issues
>      * igt@kms_prime@basic-crc@second-to-first:
> 
>           * shard-apl: PASS -> SKIP ([fdo#109271] / [i915#1635]) +1 similar
>             issue
> 
>           * shard-kbl: PASS -> SKIP ([fdo#109271]) +1 similar issue
> 
>           * shard-hsw: PASS -> SKIP ([fdo#109271]) +3 similar issues
> 
>           * shard-iclb: PASS -> SKIP ([i915#1836])
> 
>           * shard-tglb: PASS -> SKIP ([i915#1836])
> 
>      * igt@kms_psr@psr2_no_drrs:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +2 similar issues
>      * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
> 
>           * shard-glk: PASS -> SKIP ([fdo#109271]) +1 similar issue
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109278])
> 
>      * igt@perf@non-sampling-read-error:
> 
>           * shard-tglb: PASS -> SKIP ([i915#1354]) +1 similar issue
> 
>           * shard-apl: PASS -> SKIP ([fdo#109271] / [i915#1354] /
>             [i915#1635]) +1 similar issue
> 
>           * shard-glk: PASS -> SKIP ([fdo#109271] / [i915#1354]) +1 similar
>             issue
> 
>           * shard-kbl: PASS -> SKIP ([fdo#109271] / [i915#1354]) +1 similar
>             issue
> 
>           * shard-iclb: PASS -> SKIP ([i915#1354]) +1 similar issue
> 
>     Possible fixes
> 
>      * {igt@core_hotunplug@hotrebind}:
> 
>           * shard-iclb: DMESG-WARN ([i915#1982]) -> PASS
>      * igt@gem_exec_whisper@basic-fds-priority:
> 
>           * shard-glk: DMESG-WARN ([i915#118] / [i915#95]) -> PASS +2 similar
>             issues
>      * igt@gem_exec_whisper@basic-normal-all:
> 
>           * shard-hsw: FAIL -> PASS
>      * igt@gem_fence_thrash@bo-write-verify-threaded-none:
> 
>           * shard-iclb: FAIL -> PASS
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:
> 
>           * shard-snb: INCOMPLETE ([i915#82]) -> PASS
>      * igt@i915_suspend@forcewake:
> 
>           * shard-iclb: INCOMPLETE ([i915#1185]) -> PASS +1 similar issue
> 
>           * shard-kbl: INCOMPLETE ([i915#155] / [i915#636]) -> PASS
> 
>           * shard-hsw: INCOMPLETE ([i915#2055]) -> PASS
> 
>      * {igt@kms_async_flips@async-flip-with-page-flip-events}:
> 
>           * shard-apl: FAIL ([i915#1635] / [i915#2521]) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
> 
>           * shard-tglb: FAIL ([i915#2346]) -> PASS
>      * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled:
> 
>           * shard-iclb: FAIL ([i915#52] / [i915#54]) -> PASS
>      * igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: DMESG-WARN ([i915#1982]) -> PASS +6 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
> 
>           * shard-apl: DMESG-WARN ([i915#1635] / [i915#1982]) -> PASS +3
>             similar issues
> 
>           * shard-kbl: DMESG-WARN ([i915#1982]) -> PASS +1 similar issue
> 
>           * shard-tglb: DMESG-WARN ([i915#1982]) -> PASS
> 
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-snb: FAIL ([i915#2546]) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
> 
>           * shard-iclb: FAIL ([i915#49]) -> PASS +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
> 
>           * shard-glk: FAIL ([i915#49]) -> PASS
>      * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence:
> 
>           * shard-glk: FAIL ([i915#53]) -> PASS
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
> 
>           * shard-glk: INCOMPLETE -> PASS +1 similar issue
> 
>           * shard-apl: INCOMPLETE ([i915#1635]) -> PASS +1 similar issue
> 
>           * shard-kbl: INCOMPLETE ([i915#155]) -> PASS
> 
>           * shard-hsw: INCOMPLETE -> PASS
> 
>      * igt@kms_prime@basic-crc@first-to-second:
> 
>           * shard-iclb: SKIP ([i915#1836]) -> PASS
> 
>           * shard-hsw: SKIP ([fdo#109271]) -> PASS
> 
>           * shard-kbl: SKIP ([fdo#109271]) -> PASS
> 
>           * shard-apl: SKIP ([fdo#109271] / [i915#1635]) -> PASS
> 
>           * shard-tglb: SKIP ([i915#1836]) -> PASS
> 
>           * shard-glk: SKIP ([fdo#109271]) -> PASS
> 
>      * igt@kms_psr@psr2_primary_mmap_cpu:
> 
>           * shard-iclb: SKIP ([fdo#109441]) -> PASS +2 similar issues
>      * igt@sysfs_heartbeat_interval@mixed@vcs0:
> 
>           * shard-kbl: INCOMPLETE ([i915#1731]) -> PASS
> 
>     Warnings
> 
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-tglb: DMESG-WARN ([i915#2411]) -> INCOMPLETE ([i915#1436] /
>             [i915#456]) +1 similar issue
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-iclb: FAIL ([i915#1515]) -> WARN ([i915#1515])
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-iclb: SKIP ([fdo#109293] / [fdo#109506]) -> SKIP
>             ([i915#579])
> 
>           * shard-tglb: SKIP ([fdo#109506] / [i915#2411]) -> SKIP
>             ([i915#579])
> 
>      * igt@i915_suspend@forcewake:
> 
>           * shard-tglb: INCOMPLETE ([i915#1436] / [i915#456]) -> DMESG-WARN
>             ([i915#2411])
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-tglb: DMESG-WARN ([i915#2411]) -> DMESG-WARN ([i915#1436])
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
> 
>           * shard-tglb: INCOMPLETE ([i915#1436] / [i915#1798] / [i915#1982] /
>             [i915#456]) -> DMESG-WARN ([i915#2411])
>      * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
> 
>           * shard-tglb: DMESG-WARN ([i915#2411]) -> INCOMPLETE ([i915#2411] /
>             [i915#456])
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> 
>           * shard-apl: FAIL ([fdo#108145] / [i915#1635] / [i915#265]) ->
>             DMESG-FAIL ([fdo#108145] / [i915#1635] / [i915#1982])
> 
>           * shard-glk: FAIL ([fdo#108145] / [i915#265]) -> DMESG-FAIL
>             ([fdo#108145] / [i915#1982])
> 
>      * igt@runner@aborted:
> 
>           * shard-hsw: (FAIL, FAIL) ([fdo#109271] / [i915#2439]) -> (FAIL,
>             FAIL) ([fdo#109271] / [i915#2439] / [i915#483])
> 
>           * shard-iclb: (FAIL, FAIL) ([i915#1814] / [i915#2439] / [i915#483])
>             -> (FAIL, FAIL) ([i915#2439] / [i915#483])
> 
>           * shard-apl: (FAIL, FAIL) ([fdo#109271] / [i915#1635] / [i915#1814]
>             / [i915#2439]) -> (FAIL, FAIL) ([fdo#109271] / [i915#1635] /
>             [i915#2439])
> 
>           * shard-glk: ([FAIL][167], [FAIL][168]) ([i915#181
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
