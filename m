Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5640D6E9E7
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2020 14:08:15 +0000 (UTC)
References: <20201125112540.426554-1-lionel.g.landwerlin@intel.com>
 <160631262359.8877.4196955861669021032@emeril.freedesktop.org>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <a3446fa4-8463-1f8b-1d06-a15139e373db@intel.com>
Date: Wed, 25 Nov 2020 16:08:06 +0200
MIME-Version: 1.0
In-Reply-To: <160631262359.8877.4196955861669021032@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/perf=3A_verify_non_zero_reason_field_in_OA_reports?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1406790229=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1406790229==
Content-Type: multipart/alternative;
 boundary="------------8CFB1CAF57286EBA580E842E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8CFB1CAF57286EBA580E842E
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 25/11/2020 15:57, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/i915/perf: verify non zero reason field in OA reports
> *URL:* 	https://patchwork.freedesktop.org/series/84258/ 
> <https://patchwork.freedesktop.org/series/84258/>
> *State:* 	success
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html>
>
>
>   CI Bug Log - changes from CI_DRM_9389_full -> IGTPW_5226_full
>
>
>     Summary
>
> *SUCCESS*
>
> No regressions found.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_5226_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * {igt@perf@non-zero-reason} (NEW):
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb7/igt@perf@non-zero-reason.html>
>

Like I mentioned in a previous mail, I think we should backport :


commit 0305613dbcf42b6b27ddf516fea2738dfbfdb7c0
Author: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date:   Tue Nov 17 15:01:24 2020 +0200

     drm/i915/perf: workaround register corruption in OATAILPTR

It seems that currently report invalid data to userspace.


-Lionel


>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * {igt@gem_userptr_blits@vma-merge}:
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-snb4/igt@gem_userptr_blits@vma-merge.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-snb6/igt@gem_userptr_blits@vma-merge.html>
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_9389_full and 
> IGTPW_5226_full:
>
>
>       New IGT tests (1)
>
>   * igt@perf@non-zero-reason:
>       o Statuses : 1 fail(s) 4 pass(s) 2 skip(s)
>       o Exec time: [0.0, 41.66] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_5226_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@gem_eio@kms:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl2/igt@gem_eio@kms.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@gem_eio@kms.html>
>         (i915#165
>         <https://gitlab.freedesktop.org/drm/intel/issues/165> /
>         i915#78 <https://gitlab.freedesktop.org/drm/intel/issues/78>)
>         +1 similar issue
>  *
>
>     igt@gem_exec_reloc@basic-many-active@rcs0:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>         (i915#2389 <https://gitlab.freedesktop.org/drm/intel/issues/2389>)
>  *
>
>     igt@gem_workarounds@suspend-resume:
>
>      o
>
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk9/igt@gem_workarounds@suspend-resume.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk6/igt@gem_workarounds@suspend-resume.html>
>         (i915#2635 <https://gitlab.freedesktop.org/drm/intel/issues/2635>)
>
>      o
>
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@gem_workarounds@suspend-resume.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@gem_workarounds@suspend-resume.html>
>         (i915#1185 <https://gitlab.freedesktop.org/drm/intel/issues/1185>)
>
>      o
>
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl4/igt@gem_workarounds@suspend-resume.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@gem_workarounds@suspend-resume.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#2635 <https://gitlab.freedesktop.org/drm/intel/issues/2635>)
>
>      o
>
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl3/igt@gem_workarounds@suspend-resume.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl7/igt@gem_workarounds@suspend-resume.html>
>         (i915#155 <https://gitlab.freedesktop.org/drm/intel/issues/155>)
>
>      o
>
>         shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw1/igt@gem_workarounds@suspend-resume.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@gem_workarounds@suspend-resume.html>
>         (i915#2637 <https://gitlab.freedesktop.org/drm/intel/issues/2637>)
>
>  *
>
>     igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#579 <https://gitlab.freedesktop.org/drm/intel/issues/579>)
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html>
>         (i915#78 <https://gitlab.freedesktop.org/drm/intel/issues/78>)
>         +2 similar issues
>  *
>
>     igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +6
>         similar issues
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         (i915#96 <https://gitlab.freedesktop.org/drm/intel/issues/96>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +1
>         similar issue
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +5
>         similar issues
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         (i915#2598
>         <https://gitlab.freedesktop.org/drm/intel/issues/2598>) +1
>         similar issue
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
>
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html>
>         (i915#2295 <https://gitlab.freedesktop.org/drm/intel/issues/2295>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-farfromfence:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@kms_frontbuffer_tracking@psr-farfromfence.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@kms_frontbuffer_tracking@psr-farfromfence.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +4
>         similar issues
>  *
>
>     igt@kms_psr@psr2_cursor_plane_onoff:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +2
>         similar issues
>  *
>
>     igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
>
>      o
>
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>
>      o
>
>         shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>
>      o
>
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>
>      o
>
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>
>      o
>
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1635 <https://gitlab.freedesktop.org/drm/intel/issues/1635>)
>
>  *
>
>     igt@perf@polling-parameterized:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl7/igt@perf@polling-parameterized.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl7/igt@perf@polling-parameterized.html>
>         (i915#1542
>         <https://gitlab.freedesktop.org/drm/intel/issues/1542> /
>         i915#1635 <https://gitlab.freedesktop.org/drm/intel/issues/1635>)
>
>
>         Possible fixes
>
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>      o
>
>         shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk2/igt@device_reset@unbind-reset-rebind.html>
>         (i915#2283
>         <https://gitlab.freedesktop.org/drm/intel/issues/2283> /
>         i915#2405
>         <https://gitlab.freedesktop.org/drm/intel/issues/2405>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk5/igt@device_reset@unbind-reset-rebind.html>
>
>      o
>
>         shard-apl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@device_reset@unbind-reset-rebind.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#2283
>         <https://gitlab.freedesktop.org/drm/intel/issues/2283> /
>         i915#2405
>         <https://gitlab.freedesktop.org/drm/intel/issues/2405>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@device_reset@unbind-reset-rebind.html>
>
>      o
>
>         shard-kbl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl6/igt@device_reset@unbind-reset-rebind.html>
>         (i915#2283
>         <https://gitlab.freedesktop.org/drm/intel/issues/2283> /
>         i915#2405
>         <https://gitlab.freedesktop.org/drm/intel/issues/2405>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@device_reset@unbind-reset-rebind.html>
>
>      o
>
>         shard-tglb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@device_reset@unbind-reset-rebind.html>
>         (i915#1602
>         <https://gitlab.freedesktop.org/drm/intel/issues/1602> /
>         i915#750
>         <https://gitlab.freedesktop.org/drm/intel/issues/750>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@device_reset@unbind-reset-rebind.html>
>
>      o
>
>         shard-iclb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@device_reset@unbind-reset-rebind.html>
>         (i915#2283
>         <https://gitlab.freedesktop.org/drm/intel/issues/2283> /
>         i915#2405
>         <https://gitlab.freedesktop.org/drm/intel/issues/2405>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@device_reset@unbind-reset-rebind.html>
>
>  *
>
>     igt@feature_discovery@psr2:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb1/igt@feature_discovery@psr2.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@feature_discovery@psr2.html>
>  *
>
>     igt@gem_exec_whisper@basic-fds-forked:
>
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>         i915#95 <https://gitlab.freedesktop.org/drm/intel/issues/95>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk3/igt@gem_exec_whisper@basic-fds-forked.html>
>  *
>
>     igt@i915_pm_backlight@fade_with_suspend:
>
>       o shard-iclb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html>
>  *
>
>     igt@i915_pm_dc@dc6-psr:
>
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@i915_pm_dc@dc6-psr.html>
>         (i915#454
>         <https://gitlab.freedesktop.org/drm/intel/issues/454>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@i915_pm_dc@dc6-psr.html>
>  *
>
>     igt@i915_pm_rpm@gem-execbuf-stress:
>
>      o
>
>         shard-glk: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress.html>
>
>      o
>
>         shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@i915_pm_rpm@gem-execbuf-stress.html>
>
>      o
>
>         shard-kbl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@i915_pm_rpm@gem-execbuf-stress.html>
>
>      o
>
>         shard-hsw: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@i915_pm_rpm@gem-execbuf-stress.html>
>
>  *
>
>     igt@kms_busy@basic-modeset-pipe-c:
>
>       o shard-hsw: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@kms_busy@basic-modeset-pipe-c.html>
>         (i915#44 <https://gitlab.freedesktop.org/drm/intel/issues/44>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@kms_busy@basic-modeset-pipe-c.html>
>  *
>
>     igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
>
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html>
>         +4 similar issues
>  *
>
>     igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
>
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html>
>         +4 similar issues
>  *
>
>     igt@kms_fbcon_fbt@fbc:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk6/igt@kms_fbcon_fbt@fbc.html>
>         (i915#64 <https://gitlab.freedesktop.org/drm/intel/issues/64>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk7/igt@kms_fbcon_fbt@fbc.html>
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1:
>
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
>
>      o
>
>         shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html>
>         (i915#49 <https://gitlab.freedesktop.org/drm/intel/issues/49>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html>
>
>      o
>
>         shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#49 <https://gitlab.freedesktop.org/drm/intel/issues/49>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html>
>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-stridechange:
>
>       o shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html>
>         +1 similar issue
>  *
>
>     igt@kms_psr@psr2_sprite_blt:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html>
>         +2 similar issues
>  *
>
>     igt@kms_vblank@pipe-b-wait-forked-busy:
>
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-busy.html>
>         +4 similar issues
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@perf_pmu@module-unload.html>
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982> /
>         i915#262
>         <https://gitlab.freedesktop.org/drm/intel/issues/262>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl1/igt@perf_pmu@module-unload.html>
>
>
>         Warnings
>
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-hsw: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw6/igt@device_reset@unbind-reset-rebind.html>
>         (i915#2283
>         <https://gitlab.freedesktop.org/drm/intel/issues/2283> /
>         i915#2405
>         <https://gitlab.freedesktop.org/drm/intel/issues/2405>) ->
>         WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@device_reset@unbind-reset-rebind.html>
>         (i915#2283 <https://gitlab.freedesktop.org/drm/intel/issues/2283>)
>  *
>
>     igt@gem_workarounds@suspend-resume:
>
>       o shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb1/igt@gem_workarounds@suspend-resume.html>
>         (i915#2411
>         <https://gitlab.freedesktop.org/drm/intel/issues/2411>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@gem_workarounds@suspend-resume.html>
>         (i915#1436
>         <https://gitlab.freedesktop.org/drm/intel/issues/1436> /
>         i915#1602
>         <https://gitlab.freedesktop.org/drm/intel/issues/1602> /
>         i915#1887
>         <https://gitlab.freedesktop.org/drm/intel/issues/1887> /
>         i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
>  *
>
>     igt@i915_pm_dc@dc3co-vpb-simulation:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#588
>         <https://gitlab.freedesktop.org/drm/intel/issues/588>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>  *
>
>     igt@i915_pm_rc6_residency@rc6-fence:
>
>       o shard-iclb: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html>
>         (i915#1804
>         <https://gitlab.freedesktop.org/drm/intel/issues/1804> /
>         i915#2684
>         <https://gitlab.freedesktop.org/drm/intel/issues/2684>) ->
>         WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html>
>         (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>  *
>
>     igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#2411
>         <https://gitlab.freedesktop.org/drm/intel/issues/2411>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#579 <https://gitlab.freedesktop.org/drm/intel/issues/579>)
>  *
>
>     igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
>
>       o shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         (i915#2411
>         <https://gitlab.freedesktop.org/drm/intel/issues/2411>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html>
>         (i915#2648 <https://gitlab.freedesktop.org/drm/intel/issues/2648>)
>  *
>
>     igt@runner@aborted:
>
>      o
>
>         shard-hsw: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw6/igt@runner@aborted.html>
>         (i915#2283
>         <https://gitlab.freedesktop.org/drm/intel/issues/2283> /
>         i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@runner@aborted.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2295 <https://gitlab.freedesktop.org/drm/intel/issues/2295>)
>
>      o
>
>         shard-iclb: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@runner@aborted.html>)
>         (i915#1814
>         <https://gitlab.freedesktop.org/drm/intel/issues/1814> /
>         i915#2283
>         <https://gitlab.freedesktop.org/drm/intel/issues/2283> /
>         i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295> /
>         i915#483
>         <https://gitlab.freedesktop.org/drm/intel/issues/483>) ->
>         (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@runner@aborted.html>)
>         (i915#2295 <https://gitlab.freedesktop.org/drm/intel/issues/2295>)
>
>      o
>
>         shard-apl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@runner@aborted.html>)
>         (i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295>) ->
>         (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@runner@aborted.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1635
>         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
>         i915#2295 <https://gitlab.freedesktop.org/drm/intel/issues/2295>)
>
>      o
>
>         shard-tglb: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@runner@aborted.html>)
>         (i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295>) ->
>         (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@runner@aborted.html>)
>         (i915#1602
>         <https://gitlab.freedesktop.org/drm/intel/issues/1602> /
>         i915#2295 <https://gitlab.freedesktop.org/drm/intel/issues/2295>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Participating hosts (10 -> 8)
>
> Missing (2): pig-skl-6260u pig-glk-j5005
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5870 -> IGTPW_5226
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_9389: b0c2cf3ad04abd9e7a44abe12e736bb5ab587393 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_5226: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html
> IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ 
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>


--------------8CFB1CAF57286EBA580E842E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 25/11/2020 15:57, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:160631262359.8877.4196955861669021032@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">
   td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/i915/perf: verify non zero reason field in OA
              reports</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/84258/"
                moz-do-not-send="true">https://patchwork.freedesktop.org/series/84258/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>success</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html"
                moz-do-not-send="true">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_9389_full -&gt;
        IGTPW_5226_full</h1>
      <h2>Summary</h2>
      <p><strong>SUCCESS</strong></p>
      <p>No regressions found.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html</a></p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_5226_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>{igt@perf@non-zero-reason} (NEW):
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb7/igt@perf@non-zero-reason.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
    <p>Like I mentioned in a previous mail, I think we should backport :</p>
    <p><br>
    </p>
    <p>commit 0305613dbcf42b6b27ddf516fea2738dfbfdb7c0<br>
      Author: Lionel Landwerlin <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
      Date:   Tue Nov 17 15:01:24 2020 +0200<br>
      <br>
          drm/i915/perf: workaround register corruption in OATAILPTR<br>
    </p>
    <p>It seems that currently report invalid data to userspace.</p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:160631262359.8877.4196955861669021032@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>{igt@gem_userptr_blits@vma-merge}:
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-snb4/igt@gem_userptr_blits@vma-merge.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-snb6/igt@gem_userptr_blits@vma-merge.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_9389_full and
        IGTPW_5226_full:</p>
      <h3>New IGT tests (1)</h3>
      <ul>
        <li>igt@perf@non-zero-reason:
          <ul>
            <li>Statuses : 1 fail(s) 4 pass(s) 2 skip(s)</li>
            <li>Exec time: [0.0, 41.66] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_5226_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@gem_eio@kms:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl2/igt@gem_eio@kms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@gem_eio@kms.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/165"
                moz-do-not-send="true">i915#165</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/78"
                moz-do-not-send="true">i915#78</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2389"
                moz-do-not-send="true">i915#2389</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@suspend-resume:</p>
          <ul>
            <li>
              <p>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk9/igt@gem_workarounds@suspend-resume.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk6/igt@gem_workarounds@suspend-resume.html"
                  moz-do-not-send="true">DMESG-WARN</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2635"
                  moz-do-not-send="true">i915#2635</a>)</p>
            </li>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@gem_workarounds@suspend-resume.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@gem_workarounds@suspend-resume.html"
                  moz-do-not-send="true">INCOMPLETE</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1185"
                  moz-do-not-send="true">i915#1185</a>)</p>
            </li>
            <li>
              <p>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl4/igt@gem_workarounds@suspend-resume.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@gem_workarounds@suspend-resume.html"
                  moz-do-not-send="true">DMESG-WARN</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2635"
                  moz-do-not-send="true">i915#2635</a>)</p>
            </li>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl3/igt@gem_workarounds@suspend-resume.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl7/igt@gem_workarounds@suspend-resume.html"
                  moz-do-not-send="true">INCOMPLETE</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/155"
                  moz-do-not-send="true">i915#155</a>)</p>
            </li>
            <li>
              <p>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw1/igt@gem_workarounds@suspend-resume.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@gem_workarounds@suspend-resume.html"
                  moz-do-not-send="true">INCOMPLETE</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2637"
                  moz-do-not-send="true">i915#2637</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/579"
                moz-do-not-send="true">i915#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/78"
                moz-do-not-send="true">i915#78</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/96"
                moz-do-not-send="true">i915#96</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2346"
                moz-do-not-send="true">i915#2346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2598"
                moz-do-not-send="true">i915#2598</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
          <ul>
            <li>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2295"
                moz-do-not-send="true">i915#2295</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-farfromfence:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@kms_frontbuffer_tracking@psr-farfromfence.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@kms_frontbuffer_tracking@psr-farfromfence.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109441"
                moz-do-not-send="true">fdo#109441</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:</p>
          <ul>
            <li>
              <p>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a>)</p>
            </li>
            <li>
              <p>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a>)</p>
            </li>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109278"
                  moz-do-not-send="true">fdo#109278</a>)</p>
            </li>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a>)</p>
            </li>
            <li>
              <p>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@perf@polling-parameterized:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl7/igt@perf@polling-parameterized.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl7/igt@perf@polling-parameterized.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1542"
                moz-do-not-send="true">i915#1542</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>
              <p>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk2/igt@device_reset@unbind-reset-rebind.html"
                  moz-do-not-send="true">INCOMPLETE</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2283"
                  moz-do-not-send="true">i915#2283</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2405"
                  moz-do-not-send="true">i915#2405</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk5/igt@device_reset@unbind-reset-rebind.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@device_reset@unbind-reset-rebind.html"
                  moz-do-not-send="true">INCOMPLETE</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2283"
                  moz-do-not-send="true">i915#2283</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2405"
                  moz-do-not-send="true">i915#2405</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@device_reset@unbind-reset-rebind.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl6/igt@device_reset@unbind-reset-rebind.html"
                  moz-do-not-send="true">INCOMPLETE</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2283"
                  moz-do-not-send="true">i915#2283</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2405"
                  moz-do-not-send="true">i915#2405</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@device_reset@unbind-reset-rebind.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@device_reset@unbind-reset-rebind.html"
                  moz-do-not-send="true">INCOMPLETE</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1602"
                  moz-do-not-send="true">i915#1602</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/750"
                  moz-do-not-send="true">i915#750</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@device_reset@unbind-reset-rebind.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@device_reset@unbind-reset-rebind.html"
                  moz-do-not-send="true">INCOMPLETE</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2283"
                  moz-do-not-send="true">i915#2283</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2405"
                  moz-do-not-send="true">i915#2405</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@device_reset@unbind-reset-rebind.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@feature_discovery@psr2:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb1/igt@feature_discovery@psr2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@feature_discovery@psr2.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-fds-forked:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/118"
                moz-do-not-send="true">i915#118</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/95"
                moz-do-not-send="true">i915#95</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk3/igt@gem_exec_whisper@basic-fds-forked.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_backlight@fade_with_suspend:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@i915_pm_dc@dc6-psr.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/454"
                moz-do-not-send="true">i915#454</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@i915_pm_dc@dc6-psr.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
          <ul>
            <li>
              <p>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@i915_pm_rpm@gem-execbuf-stress.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@i915_pm_rpm@gem-execbuf-stress.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@i915_pm_rpm@gem-execbuf-stress.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_busy@basic-modeset-pipe-c:</p>
          <ul>
            <li>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@kms_busy@basic-modeset-pipe-c.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/44"
                moz-do-not-send="true">i915#44</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@kms_busy@basic-modeset-pipe-c.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk6/igt@kms_fbcon_fbt@fbc.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/64"
                moz-do-not-send="true">i915#64</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk7/igt@kms_fbcon_fbt@fbc.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/62"
                moz-do-not-send="true">i915#62</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
          <ul>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/49"
                  moz-do-not-send="true">i915#49</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/49"
                  moz-do-not-send="true">i915#49</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_sprite_blt:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109441"
                moz-do-not-send="true">fdo#109441</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-b-wait-forked-busy:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-busy.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@module-unload:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@perf_pmu@module-unload.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                moz-do-not-send="true">i915#1635</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1982"
                moz-do-not-send="true">i915#1982</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/262"
                moz-do-not-send="true">i915#262</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl1/igt@perf_pmu@module-unload.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw6/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2283"
                moz-do-not-send="true">i915#2283</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2405"
                moz-do-not-send="true">i915#2405</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2283"
                moz-do-not-send="true">i915#2283</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@suspend-resume:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb1/igt@gem_workarounds@suspend-resume.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2411"
                moz-do-not-send="true">i915#2411</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@gem_workarounds@suspend-resume.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1436"
                moz-do-not-send="true">i915#1436</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1602"
                moz-do-not-send="true">i915#1602</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1887"
                moz-do-not-send="true">i915#1887</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2411"
                moz-do-not-send="true">i915#2411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/588"
                moz-do-not-send="true">i915#588</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-fence:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1804"
                moz-do-not-send="true">i915#1804</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2684"
                moz-do-not-send="true">i915#2684</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2684"
                moz-do-not-send="true">i915#2684</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2411"
                moz-do-not-send="true">i915#2411</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/579"
                moz-do-not-send="true">i915#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2411"
                moz-do-not-send="true">i915#2411</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2648"
                moz-do-not-send="true">i915#2648</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@runner@aborted:</p>
          <ul>
            <li>
              <p>shard-hsw: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw6/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2283"
                  moz-do-not-send="true">i915#2283</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2295"
                  moz-do-not-send="true">i915#2295</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2295"
                  moz-do-not-send="true">i915#2295</a>)</p>
            </li>
            <li>
              <p>shard-iclb: (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>) (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1814"
                  moz-do-not-send="true">i915#1814</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2283"
                  moz-do-not-send="true">i915#2283</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2295"
                  moz-do-not-send="true">i915#2295</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/483"
                  moz-do-not-send="true">i915#483</a>) -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>) (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2295"
                  moz-do-not-send="true">i915#2295</a>)</p>
            </li>
            <li>
              <p>shard-apl: (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>) (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2295"
                  moz-do-not-send="true">i915#2295</a>) -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>) (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1635"
                  moz-do-not-send="true">i915#1635</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2295"
                  moz-do-not-send="true">i915#2295</a>)</p>
            </li>
            <li>
              <p>shard-tglb: (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb6/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>) (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2295"
                  moz-do-not-send="true">i915#2295</a>) -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb8/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@runner@aborted.html"
                  moz-do-not-send="true">FAIL</a>) (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1602"
                  moz-do-not-send="true">i915#1602</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2295"
                  moz-do-not-send="true">i915#2295</a>)</p>
            </li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Participating hosts (10 -&gt; 8)</h2>
      <p>Missing (2): pig-skl-6260u pig-glk-j5005 </p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_5870 -&gt; IGTPW_5226</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_9389: b0c2cf3ad04abd9e7a44abe12e736bb5ab587393 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_5226:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html</a><br>
        IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @
        git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------8CFB1CAF57286EBA580E842E--

--===============1406790229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1406790229==--
