Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <3a286dc2f27ed0961b0e0246f8102f21a93b42c6.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 24 Aug 2020 10:42:10 +0200
In-Reply-To: <159803163552.16198.17489156056346233245@emeril.freedesktop.org>
References: <20200821153807.18613-1-janusz.krzysztofik@linux.intel.com>
 <159803163552.16198.17489156056346233245@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Fixes_and_enhancements_=28rev4=29?=
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
Cc: =?UTF-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2020-08-21 at 17:40 +0000, Patchwork wrote:
> Patch Details
> Series:	tests/core_hotunplug: Fixes and enhancements (rev4)
> URL:	https://patchwork.freedesktop.org/series/79671/
> State:	failure
> Details:	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html
> CI Bug Log - changes from CI_DRM_8913_full -> IGTPW_4901_full
> Summary
> FAILURE
> 
> Serious unknown changes coming with IGTPW_4901_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_4901_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html
> 
> Possible new issues
> Here are the unknown changes that may have been introduced in IGTPW_4901_full:
> 
> IGT changes
> Possible regressions
> {igt@core_hotunplug@hotrebind-lateclose} (NEW):
> 
> shard-snb: NOTRUN -> FAIL
> 
> shard-glk: NOTRUN -> FAIL
> 
> shard-kbl: NOTRUN -> FAIL

This is an existing but formerly not reported GPU hang driver issue
exhibited by the test, not a regression.  The issue needs to be fixed
in the driver for the test to succeed.  As one can see from CI reports,
the test succesfuly recovers from that condition and subsequent tests
are not affected.
  
> 
> {igt@core_hotunplug@hotunbind-lateclose} (NEW):
> 
> shard-hsw: NOTRUN -> INCOMPLETE +3 similar issues

This is a known driver issue, already reported by igt@device
_reset@unbind-reset-rebind.  This test shows clearly that the issue has
nothing to do with device reset, only with driver unbind-rebind cycle. 
The driver needs to be fixed for the kernel warning not be triggered
and the tests succeed.

> igt@gem_exec_flush@basic-uc-rw-default
> 
> shard-snb: PASS -> FAIL

This issue seems hardly related to the igt@core_hotunplug test which is
the only one modified by the patch series.  Even if popped up in the
same CI run as a GPU hang caused by igt@core_hotunplug@hotrebind-
lateclose, at least one subsequent test which depended on a healthy GPU
(igt@gem_exec_fence@syncobj-timeline-export) was run with success after
the igt@core_hotunplug@hotrebind-lateclos recovered successfully from
the GPU hang and before this failure occurred.  Then I think we can't
blame core_hotunplug for this failure and we should treat the report of
this issue being a regression introduced by this patch series as a
false positive.

> igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
> 
> shard-iclb: PASS -> INCOMPLETE

Even if this issue occurred in the same CI run as the core_hotunplug
was planned to be executed, it happened earlier and the run was
aborted.  Then, there is no connection between both, so no regression
caused by this patch seriesa.

I think the *bind* subtests in their current shape are perfectly ready
for inclusion in CI runs.

Thanks,
Janusz


> New tests
> New tests have been introduced between CI_DRM_8913_full and IGTPW_4901_full:
> 
> New IGT tests (4)
> igt@core_hotunplug@hotrebind-lateclose:
> 
> Statuses : 4 fail(s) 1 incomplete(s) 1 pass(s)
> Exec time: [0.0, 16.20] s
> igt@core_hotunplug@hotunbind-lateclose:
> 
> Statuses : 1 incomplete(s) 6 pass(s)
> Exec time: [0.0, 0.55] s
> igt@core_hotunplug@hotunbind-rebind:
> 
> Statuses : 1 incomplete(s) 6 pass(s)
> Exec time: [0.0, 1.91] s
> igt@core_hotunplug@unbind-rebind:
> 
> Statuses : 1 incomplete(s) 6 pass(s)
> Exec time: [0.0, 1.93] s
> Known issues
> Here are the changes found in IGTPW_4901_full that come from known issues:
> 
> IGT changes
> Issues hit
> igt@i915_selftest@mock@contexts:
> 
> shard-apl: PASS -> INCOMPLETE (i915#1635 / i915#2278)
> igt@kms_atomic_interruptible@universal-setplane-cursor:
> 
> shard-hsw: PASS -> TIMEOUT (i915#1958) +1 similar issue
> igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> 
> shard-glk: PASS -> DMESG-FAIL (i915#118 / i915#95)
> igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2:
> 
> shard-glk: PASS -> FAIL (i915#2122)
> igt@kms_flip@flip-vs-suspend@c-dp1:
> 
> shard-kbl: PASS -> DMESG-WARN (i915#180) +8 similar issues
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
> 
> shard-kbl: PASS -> DMESG-WARN (i915#1982) +2 similar issues
> 
> shard-tglb: PASS -> DMESG-WARN (i915#1982) +1 similar issue
> 
> igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
> 
> shard-iclb: PASS -> FAIL (i915#49)
> igt@kms_hdr@bpc-switch-suspend:
> 
> shard-glk: PASS -> DMESG-WARN (i915#1982)
> igt@kms_plane_cursor@pipe-a-overlay-size-256:
> 
> shard-snb: PASS -> TIMEOUT (i915#1958) +1 similar issue
> igt@kms_psr2_su@frontbuffer:
> 
> shard-iclb: PASS -> SKIP (fdo#109642 / fdo#111068)
> igt@kms_psr@psr2_primary_mmap_gtt:
> 
> shard-iclb: PASS -> SKIP (fdo#109441)
> igt@prime_busy@before-wait@vecs0:
> 
> shard-hsw: PASS -> FAIL (i915#2258) +1 similar issue
> Possible fixes
> igt@gem_exec_endless@dispatch@bcs0:
> 
> shard-tglb: INCOMPLETE -> PASS
> igt@gem_exec_gttfill@engines@rcs0:
> 
> shard-hsw: INCOMPLETE -> PASS +1 similar issue
> igt@gem_exec_suspend@basic-s3:
> 
> shard-kbl: DMESG-WARN (i915#180) -> PASS
> {igt@gem_mmap_offset@blt-coherency}:
> 
> shard-apl: FAIL (i915#1635) -> PASS
> igt@kms_big_fb@linear-64bpp-rotate-0:
> 
> shard-glk: DMESG-FAIL (i915#118 / i915#95) -> PASS
> igt@kms_big_fb@x-tiled-8bpp-rotate-0:
> 
> shard-apl: DMESG-WARN (i915#1635 / i915#1982) -> PASS +1 similar issue
> igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
> 
> shard-kbl: FAIL (i915#54) -> PASS
> 
> shard-apl: FAIL (i915#1635 / i915#54) -> PASS
> 
> igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
> 
> shard-hsw: TIMEOUT (i915#1958) -> PASS +3 similar issues
> igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
> shard-glk: DMESG-WARN (i915#1982) -> PASS +1 similar issue
> igt@kms_dp_aux_dev:
> 
> shard-iclb: DMESG-WARN (i915#2344) -> PASS
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
> 
> shard-tglb: DMESG-WARN (i915#1982) -> PASS +2 similar issues
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
> 
> shard-kbl: DMESG-WARN (i915#1982) -> PASS
> igt@kms_psr2_su@page_flip:
> 
> shard-tglb: SKIP (i915#1911) -> PASS
> igt@kms_psr@psr2_suspend:
> 
> shard-iclb: SKIP (fdo#109441) -> PASS
> igt@perf@blocking-parameterized:
> 
> shard-iclb: FAIL (i915#1542) -> PASS
> igt@perf@polling-parameterized:
> 
> shard-tglb: FAIL (i915#1542) -> PASS
> Warnings
> igt@gem_exec_reloc@basic-concurrent16:
> 
> shard-snb: FAIL (i915#1930) -> TIMEOUT (i915#1958)
> igt@i915_pm_dc@dc3co-vpb-simulation:
> 
> shard-iclb: SKIP (i915#588) -> SKIP (i915#658)
> igt@i915_pm_rc6_residency@rc6-idle:
> 
> shard-iclb: WARN (i915#1515) -> FAIL (i915#1515)
> igt@kms_content_protection@atomic:
> 
> shard-kbl: TIMEOUT (i915#1319 / i915#1958) -> TIMEOUT (i915#1319) +1 similar issue
> igt@kms_flip@2x-flip-vs-dpms:
> 
> shard-snb: SKIP (fdo#109271) -> TIMEOUT (i915#1958) +2 similar issues
> igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:
> 
> shard-hsw: SKIP (fdo#109271) -> TIMEOUT (i915#1958) +1 similar issue
> igt@kms_vblank@pipe-d-accuracy-idle:
> 
> shard-hsw: TIMEOUT (i915#1958) -> SKIP (fdo#109271)
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (11 -> 8)
> Missing (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7
> 
> Build changes
> CI: CI-20190529 -> None
> IGT: IGT_5770 -> IGTPW_4901
> Piglit: piglit_4509 -> None
> CI-20190529: 20190529
> CI_DRM_8913: e18d8e120e73feaf39d84afe14f9a7f58b696785 @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_4901: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html
> IGT_5770: f1d0c240ea2e631dfb9f493f37f8fb61cb2b1cf2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
