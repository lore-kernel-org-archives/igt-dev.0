Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <7ba2312a529b33069a6784d1f5d1964bb5b6d857.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 28 Aug 2020 15:05:04 +0200
In-Reply-To: <159861558801.4239.9465794510007938455@emeril.freedesktop.org>
References: <20200828075927.17061-1-janusz.krzysztofik@linux.intel.com>
 <159861558801.4239.9465794510007938455@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Fixes_and_enhancements_=28rev5=29?=
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

On Fri, 2020-08-28 at 11:53 +0000, Patchwork wrote:
> Patch Details
> Series:	tests/core_hotunplug: Fixes and enhancements (rev5)
> URL:	https://patchwork.freedesktop.org/series/79671/
> State:	failure
> Details:	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/index.html
> CI Bug Log - changes from IGT_5774_full -> IGTPW_4914_full
> Summary
> FAILURE
> 
> Serious unknown changes coming with IGTPW_4914_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_4914_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/index.html
> 
> Possible new issues
> Here are the unknown changes that may have been introduced in IGTPW_4914_full:
> 
> IGT changes
> Possible regressions
> {igt@core_hotunplug@hotrebind-lateclose} (NEW):
> 
> shard-snb: NOTRUN -> FAIL
> 
> shard-iclb: NOTRUN -> FAIL
> 
> shard-tglb: NOTRUN -> DMESG-WARN
> 
> shard-glk: NOTRUN -> FAIL
> 
> shard-hsw: NOTRUN -> FAIL
> 
> shard-kbl: NOTRUN -> FAIL

As before (rev4), this is an existing but formerly not reported GPU
hang driver issue exhibited by the test, not a regression.  The issue
needs to be fixed in the driver for the test to succeed.  As one can
see from CI reports, the test succesfully recovers from that condition
and subsequent tests don't report GPU hangs.

> 
> {igt@core_hotunplug@unbind-rebind} (NEW):
> 
> shard-hsw: NOTRUN -> WARN +1 similar issue

This is an IGT warning that replaces a former (rev4) DMESG-WARN ->
INCOMPLETE caused by a known driver issue already reported by 
igt@device_reset@unbind-reset-rebind.  The issue has nothing to do with
device reset, only with driver unbind on Haswell with Azalia audio. 
The kernel side needs to be fixed for the WARN not be triggered and the
tests succeed.  Meanwhile, the IGT warning workaround keeps the issue
still visible in CI while not affecting CI runs.

> igt@gem_render_copy@linear:
> 
> shard-tglb: PASS -> FAIL +2 similar issues

This is a strange issue of an inaccessible "i915_gem_drop_caches"
debugfs entry for the render device node of the device just exercised
with igt@core_hotunplug@hotrebind-lateclose on a GuC platform.  Not
reported by Trybot unfortunately, but here evidently affecting
subsequent tests.  Looks like the health check and recovery phase of
the test still needs more work, sorry.

Thanks,
Janusz


> New tests
> New tests have been introduced between IGT_5774_full and IGTPW_4914_full:
> 
> New IGT tests (3)
> igt@core_hotunplug@hotrebind-lateclose:
> 
> Statuses : 1 dmesg-warn(s) 6 fail(s)
> Exec time: [6.13, 17.39] s
> igt@core_hotunplug@hotunbind-rebind:
> 
> Statuses : 6 pass(s) 1 warn(s)
> Exec time: [0.39, 1.96] s
> igt@core_hotunplug@unbind-rebind:
> 
> Statuses : 6 pass(s) 1 warn(s)
> Exec time: [0.38, 1.91] s
> Known issues
> Here are the changes found in IGTPW_4914_full that come from known issues:
> 
> IGT changes
> Issues hnotit
> igt@gem_exec_reloc@basic-concurrent0:
> 
> shard-tglb: PASS -> TIMEOUT (i915#1958)
> 
> shard-kbl: PASS -> TIMEOUT (i915#1958) +1 similar issue
> 
> igt@gem_exec_whisper@basic-forked:
> 
> shard-iclb: PASS -> TIMEOUT (i915#1958)
> igt@gem_exec_whisper@basic-forked-all:
> 
> shard-glk: PASS -> DMESG-WARN (i915#118 / i915#95)
> igt@gem_exec_whisper@basic-queues-forked-all:
> 
> shard-glk: PASS -> TIMEOUT (i915#1958) +4 similar issues
> 
> shard-apl: PASS -> TIMEOUT (i915#1635 / i915#1958) +1 similar issue
> 
> igt@gen9_exec_parse@allowed-all:
> 
> shard-apl: PASS -> DMESG-WARN (i915#1436 / i915#1635 / i915#716)
> igt@i915_pm_dc@dc6-psr:
> 
> shard-iclb: PASS -> FAIL (i915#1899)
> igt@i915_pm_rpm@reg-read-ioctl:
> 
> shard-kbl: PASS -> DMESG-WARN (i915#165)
> igt@i915_selftest@mock@contexts:
> 
> shard-hsw: PASS -> INCOMPLETE (i915#2278)
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
> shard-tglb: PASS -> DMESG-WARN (i915#1982) +2 similar issues
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
> shard-glk: PASS -> FAIL (i915#49)
> igt@kms_frontbuffer_tracking@fbc-badstride:
> 
> shard-glk: PASS -> DMESG-WARN (i915#1982)
> igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
> 
> shard-kbl: PASS -> FAIL (i915#49)
> 
> shard-apl: PASS -> FAIL (i915#1635 / i915#49)
> 
> igt@kms_hdmi_inject@inject-audio:
> 
> shard-tglb: PASS -> SKIP (i915#433)
> igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
> 
> shard-kbl: PASS -> DMESG-WARN (i915#180)
> igt@kms_psr2_su@frontbuffer:
> 
> shard-iclb: PASS -> SKIP (fdo#109642 / fdo#111068)
> igt@kms_psr@psr2_primary_mmap_cpu:
> 
> shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
> igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
> 
> shard-kbl: PASS -> DMESG-WARN (i915#1982) +1 similar issue
> igt@kms_vblank@pipe-a-query-busy-hang:
> 
> shard-apl: PASS -> DMESG-WARN (i915#1635 / i915#1982)
> Possible fixes
> igt@gem_exec_reloc@basic-many-active@rcs0:
> 
> shard-apl: FAIL (i915#1635 / i915#2389) -> PASS
> 
> shard-hsw: FAIL (i915#2389) -> PASS
> 
> igt@gem_exec_whisper@basic-contexts-priority:
> 
> shard-apl: TIMEOUT (i915#1635 / i915#1958) -> PASS
> igt@gem_exec_whisper@basic-fds:
> 
> shard-iclb: TIMEOUT (i915#1958) -> PASS +1 similar issue
> igt@gem_exec_whisper@basic-normal:
> 
> shard-glk: TIMEOUT (i915#1958) -> PASS
> igt@i915_selftest@mock@contexts:
> 
> shard-apl: INCOMPLETE (i915#1635 / i915#2278) -> PASS
> igt@i915_suspend@fence-restore-tiled2untiled:
> 
> shard-kbl: INCOMPLETE (i915#155) -> PASS
> igt@kms_big_fb@x-tiled-64bpp-rotate-0:
> 
> shard-glk: DMESG-FAIL (i915#118 / i915#95) -> PASS
> igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
> 
> shard-kbl: FAIL (i915#54) -> PASS
> 
> shard-apl: FAIL (i915#1635 / i915#54) -> PASS
> 
> shard-glk: FAIL (i915#54) -> PASS
> 
> igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
> 
> shard-hsw: DMESG-WARN (i915#1982) -> PASS +1 similar issue
> igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1:
> 
> shard-kbl: DMESG-WARN (i915#1982) -> PASS +1 similar issue
> igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
> 
> shard-glk: FAIL (i915#79) -> PASS
> igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
> shard-kbl: DMESG-WARN (i915#180) -> PASS +12 similar issues
> igt@kms_psr@psr2_sprite_mmap_gtt:
> 
> shard-iclb: SKIP (fdo#109441) -> PASS +2 similar issues
> igt@kms_universal_plane@universal-plane-pipe-c-sanity:
> 
> shard-tglb: DMESG-WARN (i915#1982) -> PASS +1 similar issue
> Warnings
> igt@runner@aborted:
> 
> shard-hsw: FAIL (i915#2283) -> (FAIL, FAIL) (i915#1436 / i915#2283)
> 
> shard-apl: FAIL (i915#1635) -> FAIL (fdo#109271 / i915#1635 / i915#716)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (8 -> 8)
> No changes in participating hosts
> 
> Build changes
> CI: CI-20190529 -> None
> IGT: IGT_5774 -> IGTPW_4914
> CI-20190529: 20190529
> CI_DRM_8937: 78b090a913c972368c81f05352a532590200cc89 @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_4914: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/index.html
> IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
