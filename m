Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAAC6E9ED
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2020 06:52:21 +0000 (UTC)
Message-ID: <965f862be55ff506c72a3a39a0af30d8350c225c.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed, 14 Oct 2020 08:52:16 +0200
In-Reply-To: <160264505357.21207.14538087310224259123@emeril.freedesktop.org>
References: <20201013110234.17680-1-janusz.krzysztofik@linux.intel.com>
 <160264505357.21207.14538087310224259123@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Restore_i915_debugfs_health_check_=28rev3?=
 =?utf-8?q?=29?=
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
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2020-10-14 at 03:10 +0000, Patchwork wrote:
> Patch Details
> Series:	tests/core_hotunplug: Restore i915 debugfs health check (rev3)
> URL:	https://patchwork.freedesktop.org/series/82519/
> State:	failure
> Details:	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/index.html
> CI Bug Log - changes from CI_DRM_9135_full -> IGTPW_5062_full
> Summary
> FAILURE
> 
> Serious unknown changes coming with IGTPW_5062_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5062_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/index.html
> 
> Possible new issues
> Here are the unknown changes that may have been introduced in IGTPW_5062_full:
> 
> IGT changes
> Possible regressions
> {igt@core_hotunplug@hotrebind} (NEW):
> 
> shard-hsw: NOTRUN -> WARN

Known issue, already reported by other igt@core_hotunplug@*bind*
subtests, https://gitlab.freedesktop.org/drm/intel/-/issues/2283

> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
> 
> shard-tglb: PASS -> FAIL +1 similar issue

Not related - false positive.

Thanks,
Janusz

> Warnings
> igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> shard-tglb: DMESG-FAIL (i915#1982) -> FAIL
> New tests
> New tests have been introduced between CI_DRM_9135_full and IGTPW_5062_full:
> 
> New IGT tests (1)
> igt@core_hotunplug@hotrebind:
> Statuses : 6 pass(s) 1 warn(s)
> Exec time: [0.39, 2.22] s
> Known issues
> Here are the changes found in IGTPW_5062_full that come from known issues:
> 
> IGT changes
> Issues hit
> igt@feature_discovery@psr2:
> 
> shard-iclb: PASS -> SKIP (i915#658)
> igt@gem_exec_reloc@basic-many-active@rcs0:
> 
> shard-apl: PASS -> FAIL (i915#1635 / i915#2389)
> igt@gem_exec_reloc@basic-many-active@vcs0:
> 
> shard-glk: PASS -> FAIL (i915#2389) +1 similar issue
> igt@gem_exec_whisper@basic-fds-priority:
> 
> shard-glk: PASS -> DMESG-WARN (i915#118 / i915#95) +3 similar issues
> igt@gem_userptr_blits@coherency-unsync:
> 
> shard-snb: PASS -> INCOMPLETE (i915#82)
> igt@i915_pm_rc6_residency@rc6-idle:
> 
> shard-hsw: PASS -> WARN (i915#1519)
> igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
> shard-tglb: PASS -> FAIL (i915#2346)
> igt@kms_flip@flip-vs-expired-vblank@c-dp1:
> 
> shard-kbl: PASS -> FAIL (i915#79)
> igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
> 
> shard-hsw: PASS -> INCOMPLETE (i915#2055)
> igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
> 
> shard-glk: PASS -> DMESG-WARN (i915#1982)
> igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
> 
> shard-kbl: PASS -> DMESG-WARN (i915#1982)
> igt@kms_frontbuffer_tracking@psr-1p-rte:
> 
> shard-tglb: PASS -> DMESG-WARN (i915#1982) +2 similar issues
> igt@kms_prime@basic-crc@first-to-second:
> 
> shard-iclb: PASS -> SKIP (i915#1836)
> 
> shard-snb: PASS -> SKIP (fdo#109271)
> 
> shard-hsw: PASS -> SKIP (fdo#109271)
> 
> shard-kbl: PASS -> SKIP (fdo#109271)
> 
> shard-apl: PASS -> SKIP (fdo#109271 / i915#1635)
> 
> shard-tglb: PASS -> SKIP (i915#1836)
> 
> shard-glk: PASS -> SKIP (fdo#109271)
> 
> igt@kms_psr@psr2_suspend:
> 
> shard-iclb: PASS -> SKIP (fdo#109441) +2 similar issues
> igt@perf@gen12-unprivileged-single-ctx-counters:
> 
> shard-tglb: PASS -> SKIP (i915#1354)
> Possible fixes
> {igt@kms_async_flips@async-flip-with-page-flip-events}:
> 
> shard-kbl: FAIL (i915#2521) -> PASS +1 similar issue
> 
> shard-iclb: FAIL (i915#2521) -> PASS
> 
> shard-tglb: FAIL (i915#2521) -> PASS
> 
> igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
> 
> shard-tglb: DMESG-WARN (i915#1982) -> PASS +1 similar issue
> igt@kms_cursor_legacy@pipe-b-torture-move:
> 
> shard-tglb: DMESG-WARN (i915#128) -> PASS +1 similar issue
> igt@kms_fbcon_fbt@fbc-suspend:
> 
> shard-glk: DMESG-FAIL (i915#118 / i915#95) -> PASS
> igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
> 
> shard-kbl: DMESG-WARN (i915#1982) -> PASS +1 similar issue
> igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
> 
> shard-apl: FAIL (i915#1635 / i915#79) -> PASS
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
> 
> shard-tglb: FAIL -> PASS +2 similar issues
> igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
> 
> shard-iclb: DMESG-WARN (i915#1982) -> PASS
> igt@kms_plane@plane-position-covered-pipe-c-planes:
> 
> shard-apl: FAIL (i915#1635 / i915#247) -> PASS
> 
> shard-kbl: FAIL (i915#247) -> PASS
> 
> igt@kms_prime@basic-crc@second-to-first:
> 
> shard-apl: SKIP (fdo#109271 / i915#1635) -> PASS
> 
> shard-kbl: SKIP (fdo#109271) -> PASS
> 
> shard-hsw: SKIP (fdo#109271) -> PASS
> 
> shard-iclb: SKIP (i915#1836) -> PASS
> 
> shard-snb: SKIP (fdo#109271) -> PASS
> 
> shard-tglb: SKIP (i915#1836) -> PASS
> 
> shard-glk: SKIP (fdo#109271) -> PASS
> 
> igt@kms_psr@psr2_cursor_plane_move:
> 
> shard-iclb: SKIP (fdo#109441) -> PASS +3 similar issues
> igt@kms_setmode@basic:
> 
> shard-kbl: FAIL (i915#31) -> PASS
> igt@sysfs_heartbeat_interval@mixed@vcs1:
> 
> shard-kbl: INCOMPLETE (i915#1731) -> PASS
> Warnings
> igt@kms_content_protection@atomic-dpms:
> 
> shard-apl: FAIL (fdo#110321 / fdo#110336 / i915#1635) -> TIMEOUT (i915#1319 / i915#1635)
> igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
> 
> shard-tglb: FAIL -> DMESG-FAIL (i915#1982)
> igt@perf@gen12-unprivileged-single-ctx-counters:
> 
> shard-apl: SKIP (fdo#109271 / i915#1635) -> SKIP (fdo#109271 / i915#1354 / i915#1635)
> 
> shard-glk: SKIP (fdo#109271) -> SKIP (fdo#109271 / i915#1354)
> 
> shard-iclb: SKIP (fdo#109289) -> SKIP (i915#1354)
> 
> shard-kbl: SKIP (fdo#109271) -> SKIP (fdo#109271 / i915#1354)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (11 -> 8)
> Missing (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7
> 
> Build changes
> CI: CI-20190529 -> None
> IGT: IGT_5813 -> IGTPW_5062
> Piglit: piglit_4509 -> None
> CI-20190529: 20190529
> CI_DRM_9135: eb70ad33fcc91d3464b07679391fb477927ad4c7 @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_5062: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5062/index.html
> IGT_5813: d4e6dd955a1dad02271aa41c9389f5097ee17765 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
