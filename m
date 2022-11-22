Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C4710E409
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Nov 2022 15:32:01 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id f200so774221yba.10
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Nov 2022 07:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20221121191747.2817707-1-markyacoub@chromium.org>
 <166907703057.2186.649784956094866579@emeril.freedesktop.org>
In-Reply-To: <166907703057.2186.649784956094866579@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 22 Nov 2022 10:31:48 -0500
Message-ID: <CAJUqKUp1BssHAsXDd_6Ke45-ZgvZz0XFM=hXe1ey4ObWHOthPg@mail.gmail.com>
To: saix.nandan.yedireswarapu@intel.com
Content-Type: multipart/alternative; boundary="00000000000079eb3805ee10df65"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Simplify_the_chamelium_test_files=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--00000000000079eb3805ee10df65
Content-Type: text/plain; charset="UTF-8"

Hi Sai, I think they're being skipped because they're considered new tests.

On Mon, Nov 21, 2022 at 7:30 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Chamelium: Simplify the chamelium test files.
> *URL:* https://patchwork.freedesktop.org/series/111163/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/index.html CI
> Bug Log - changes from CI_DRM_12409_full -> IGTPW_8140_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_8140_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8140_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/index.html
> Participating hosts (11 -> 8)
>
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_8140_full:
> IGT changes Possible regressions
>
>    -
>
>    {igt@chamelium_hpd@hdmi-hpd-enable-disable-mode} (NEW):
>    - {shard-rkl}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-4/igt@chamelium_hpd@hdmi-hpd-enable-disable-mode.html>
>       +26 similar issues
>    -
>
>    {igt@chamelium_hpd@hdmi-hpd-for-each-pipe} (NEW):
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>       +23 similar issues
>    -
>
>    {igt@chamelium_hpd@hdmi-hpd-with-enabled-mode} (NEW):
>    - {shard-dg1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-dg1-19/igt@chamelium_hpd@hdmi-hpd-with-enabled-mode.html>
>       +23 similar issues
>    -
>
>    {igt@chamelium_hpd@vga-hpd} (NEW):
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@chamelium_hpd@vga-hpd.html>
>       +25 similar issues
>    -
>
>    igt@kms_color@ctm-0-50@pipe-d-edp-1:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-tglb7/igt@kms_color@ctm-0-50@pipe-d-edp-1.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb8/igt@kms_color@ctm-0-50@pipe-d-edp-1.html>
>
> Warnings
>
>    -
>
>    igt@kms_chamelium@dp-mode-timings:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb8/igt@kms_chamelium@dp-mode-timings.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb6/igt@kms_chamelium@dp-mode-timings.html>
>       +20 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-audio-edid:
>    - shard-tglb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-tglb1/igt@kms_chamelium@hdmi-audio-edid.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb5/igt@kms_chamelium@hdmi-audio-edid.html>
>       +16 similar issues
>    -
>
>    igt@kms_color@ctm-0-75@pipe-d-edp-1:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-tglb5/igt@kms_color@ctm-0-75@pipe-d-edp-1.html>
>       (i915#315 <https://gitlab.freedesktop.org/drm/intel/issues/315> /
>       i915#6946 <https://gitlab.freedesktop.org/drm/intel/issues/6946>)
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb8/igt@kms_color@ctm-0-75@pipe-d-edp-1.html>
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    -
>
>    igt@kms_chamelium@dp-crc-single:
>    - {shard-dg1}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-dg1-19/igt@kms_chamelium@dp-crc-single.html>
>       (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-dg1-18/igt@kms_chamelium@dp-crc-single.html>
>       +14 similar issues
>    -
>
>    {igt@kms_chamelium@dp-edid-resolution-list}:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_chamelium@dp-edid-resolution-list.html>
>    -
>
>    {igt@kms_chamelium@dp-edid-stress-resolution-4k}:
>    - {shard-dg1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-dg1-15/igt@kms_chamelium@dp-edid-stress-resolution-4k.html>
>       +2 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-aspect-ratio:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-1/igt@kms_chamelium@hdmi-aspect-ratio.html>
>       (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-4/igt@kms_chamelium@hdmi-aspect-ratio.html>
>       +20 similar issues
>    -
>
>    {igt@kms_chamelium@hdmi-edid-stress-resolution-4k}:
>    - shard-tglb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-tglb6/igt@kms_chamelium@hdmi-edid-stress-resolution-4k.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb2/igt@kms_chamelium@hdmi-edid-stress-resolution-4k.html>
>       +3 similar issues
>    -
>
>    {igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k}:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb1/igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb6/igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k.html>
>       +4 similar issues
>    -
>
>    igt@kms_chamelium@vga-edid-read:
>    - {shard-rkl}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-1/igt@kms_chamelium@vga-edid-read.html>
>       +1 similar issue
>
> New tests
>
> New tests have been introduced between CI_DRM_12409_full and
> IGTPW_8140_full:
> New IGT tests (35)
>
>    -
>
>    igt@chamelium_color@ctm-0-25:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_color@ctm-0-50:
>    - Statuses : 5 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_color@ctm-0-75:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_color@ctm-blue-to-red:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_color@ctm-green-to-red:
>    - Statuses :
>       - Exec time: [None] s
>    -
>
>    igt@chamelium_color@ctm-limited-range:
>    - Statuses : 5 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_color@ctm-max:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_color@ctm-negative:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_color@ctm-red-to-blue:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_color@degamma:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_color@gamma:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@common-hpd-after-suspend:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@dp-hpd:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@dp-hpd-after-suspend:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@dp-hpd-enable-disable-mode:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@dp-hpd-fast:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@dp-hpd-for-each-pipe:
>    - Statuses : 5 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@dp-hpd-storm:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@dp-hpd-storm-disable:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@dp-hpd-with-enabled-mode:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@hdmi-hpd:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@hdmi-hpd-after-suspend:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@hdmi-hpd-enable-disable-mode:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@hdmi-hpd-fast:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@hdmi-hpd-for-each-pipe:
>    - Statuses : 5 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@hdmi-hpd-storm:
>    - Statuses : 5 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@hdmi-hpd-storm-disable:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@hdmi-hpd-with-enabled-mode:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@vga-hpd:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@vga-hpd-after-suspend:
>    - Statuses :
>       - Exec time: [None] s
>    -
>
>    igt@chamelium_hpd@vga-hpd-enable-disable-mode:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@vga-hpd-fast:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@vga-hpd-for-each-pipe:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@vga-hpd-with-enabled-mode:
>    - Statuses : 7 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@chamelium_hpd@vga-hpd-without-ddc:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>
> Known issues
>
> Here are the changes found in IGTPW_8140_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    {igt@chamelium_color@ctm-0-25} (NEW):
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb8/igt@chamelium_color@ctm-0-25.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>)
>       +9 similar issues
>    -
>
>    {igt@chamelium_color@ctm-max} (NEW):
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk2/igt@chamelium_color@ctm-max.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +98 similar issues
>    -
>
>    {igt@chamelium_color@gamma} (NEW):
>    -
>
>       shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-snb7/igt@chamelium_color@gamma.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +117 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@chamelium_color@gamma.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>)
>       +9 similar issues
>       -
>
>    igt@gem_ctx_persistence@processes:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-snb4/igt@gem_ctx_persistence@processes.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>    -
>
>    igt@gem_exec_balancer@parallel-contexts:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       +1 similar issue
>    -
>
>    igt@gem_exec_balancer@parallel-ordering:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb8/igt@gem_exec_balancer@parallel-ordering.html>
>       (i915#6117 <https://gitlab.freedesktop.org/drm/intel/issues/6117>)
>    -
>
>    igt@gem_exec_fair@basic-flow@rcs0:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +2 similar issues
>    -
>
>    igt@gem_exec_fair@basic-none-solo@rcs0:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb2/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_exec_fair@basic-pace-solo@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_exec_fair@basic-pace@vcs0:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb6/igt@gem_exec_fair@basic-pace@vcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_exec_fair@basic-throttle@rcs0:
>    -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +1 similar issue
>       -
>
>    igt@gem_lmem_swapping@random:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb5/igt@gem_lmem_swapping@random.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +1 similar issue
>    -
>
>    igt@gem_lmem_swapping@verify-random:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk2/igt@gem_lmem_swapping@verify-random.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>    -
>
>    igt@gem_pxp@reject-modify-context-protection-off-2:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb1/igt@gem_pxp@reject-modify-context-protection-off-2.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@gem_pxp@reject-modify-context-protection-off-2.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       -
>
>    igt@gem_render_copy@linear-to-vebox-y-tiled:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@gem_render_copy@linear-to-vebox-y-tiled.html>
>       (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>    -
>
>    igt@gem_userptr_blits@dmabuf-unsync:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb2/igt@gem_userptr_blits@dmabuf-unsync.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@gem_userptr_blits@dmabuf-unsync.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>       -
>
>    igt@gem_userptr_blits@input-checking:
>    - shard-glk: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk6/igt@gem_userptr_blits@input-checking.html>
>       (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>    -
>
>    igt@gen7_exec_parse@load-register-reg:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb8/igt@gen7_exec_parse@load-register-reg.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +2 similar issues
>    -
>
>    igt@gen9_exec_parse@allowed-single:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-glk8/igt@gen9_exec_parse@allowed-single.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk5/igt@gen9_exec_parse@allowed-single.html>
>       (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>       i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>    -
>
>    igt@gen9_exec_parse@bb-secure:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@gen9_exec_parse@bb-secure.html>
>       (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>    -
>
>    igt@gen9_exec_parse@cmd-crossing-page:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@gen9_exec_parse@cmd-crossing-page.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527> /
>       i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>       +1 similar issue
>    -
>
>    igt@i915_module_load@resize-bar:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb5/igt@i915_module_load@resize-bar.html>
>       (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
>    -
>
>    igt@i915_pipe_stress@stress-xrgb8888-untiled:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html>
>       (i915#7036 <https://gitlab.freedesktop.org/drm/intel/issues/7036>)
>    -
>
>    igt@i915_pm_dc@dc6-dpms:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html>
>       (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>       i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>) +1
>       similar issue
>    -
>
>    igt@i915_pm_dc@dc9-dpms:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html>
>       (i915#4281 <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
>    -
>
>    igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>       (fdo#111644 <https://bugs.freedesktop.org/show_bug.cgi?id=111644> /
>       i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397> /
>       i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
>    -
>
>    igt@i915_pm_rps@engine-order:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl2/igt@i915_pm_rps@engine-order.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl1/igt@i915_pm_rps@engine-order.html>
>       (i915#6537 <https://gitlab.freedesktop.org/drm/intel/issues/6537>)
>    -
>
>    igt@kms_atomic@atomic_plane_damage:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_atomic@atomic_plane_damage.html>
>       (i915#4765 <https://gitlab.freedesktop.org/drm/intel/issues/4765>)
>    -
>
>    igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>    -
>
>    igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       +2 similar issues
>    -
>
>    igt@kms_big_fb@linear-32bpp-rotate-90:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb7/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>       (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>    -
>
>    igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb8/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html>
>       (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       +6 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +87 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +1 similar issue
>    -
>
>    igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +4 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>       i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +2 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk2/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +6 similar issues
>    -
>
>    igt@kms_content_protection@dp-mst-type-0:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@kms_content_protection@dp-mst-type-0.html>
>       (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116> /
>       i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>    -
>
>    igt@kms_content_protection@srm:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb7/igt@kms_content_protection@srm.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>    -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipb@atomic:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@kms_cursor_legacy@cursorb-vs-flipb@atomic.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +7 similar issues
>    -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipb@legacy:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipb@legacy.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>       +7 similar issues
>    -
>
>    igt@kms_flip@2x-nonexisting-fb:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_flip@2x-nonexisting-fb.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>       i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>       +5 similar issues
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +3 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +4 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +1 similar issue
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +2 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       +9 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>       (i915#2546 <https://gitlab.freedesktop.org/drm/intel/issues/2546>)
>    -
>
>    igt@kms_frontbuffer_tracking
>    @fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html>
>       (i915#6497 <https://gitlab.freedesktop.org/drm/intel/issues/6497>)
>       +8 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +20 similar issues
>    -
>
>    igt@kms_hdr@bpc-switch-suspend:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_hdr@bpc-switch-suspend.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +3 similar issues
>    -
>
>    igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +1 similar issue
>    -
>
>    igt@kms_plane_lowres@tiling-4:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb7/igt@kms_plane_lowres@tiling-4.html>
>       (fdo#112054 <https://bugs.freedesktop.org/show_bug.cgi?id=112054> /
>       i915#5288 <https://gitlab.freedesktop.org/drm/intel/issues/5288>)
>    -
>
>    igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html>
>       (i915#3536 <https://gitlab.freedesktop.org/drm/intel/issues/3536>)
>       +2 similar issues
>    -
>
>    igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html>
>       (i915#3536 <https://gitlab.freedesktop.org/drm/intel/issues/3536>)
>       +3 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-downscale-with-rotation-factor-0-75@pipe-d-edp-1:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +11 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-upscale-with-rotation-factor-0-25@pipe-a-edp-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb7/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +5 similar issues
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       +1 similar issue
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>    igt@kms_psr@psr2_cursor_blt:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +1 similar issue
>    -
>
>    igt@kms_psr@psr2_cursor_mmap_gtt:
>    -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>       (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>       i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>       +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +1 similar issue
>       -
>
>    igt@kms_vblank@pipe-d-query-forked-busy:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb1/igt@kms_vblank@pipe-d-query-forked-busy.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +7 similar issues
>    -
>
>    igt@kms_writeback@writeback-pixel-formats:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb8/igt@kms_writeback@writeback-pixel-formats.html>
>       (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>    -
>
>    igt@prime_vgem@coherency-gtt:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@prime_vgem@coherency-gtt.html>
>       (fdo#109292 <https://bugs.freedesktop.org/show_bug.cgi?id=109292> /
>       fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb3/igt@prime_vgem@coherency-gtt.html>
>       (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>       fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>)
>       -
>
>    igt@sysfs_clients@busy:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk2/igt@sysfs_clients@busy.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@sysfs_clients@busy.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl2/igt@sysfs_clients@busy.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
> Possible fixes
>
>    -
>
>    igt@fbdev@unaligned-write:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-2/igt@fbdev@unaligned-write.html>
>       (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-4/igt@fbdev@unaligned-write.html>
>    -
>
>    igt@gem_exec_balancer@parallel-out-fence:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html>
>    -
>
>    igt@gem_exec_fair@basic-flow@rcs0:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-4/igt@gem_exec_fair@basic-flow@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-5/igt@gem_exec_fair@basic-flow@rcs0.html>
>    -
>
>    igt@gem_exec_reloc@basic-cpu-read:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-read.html>
>       (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-read.html>
>       +1 similar issue
>    -
>
>    igt@gem_partial_pwrite_pread@write:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-4/igt@gem_partial_pwrite_pread@write.html>
>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-5/igt@gem_partial_pwrite_pread@write.html>
>    -
>
>    igt@gem_ppgtt@flink-and-close-vma-leak:
>    - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html>
>    -
>
>    igt@gen9_exec_parse@allowed-single:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl7/igt@gen9_exec_parse@allowed-single.html>
>       (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>       i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl8/igt@gen9_exec_parse@allowed-single.html>
>    -
>
>    igt@gen9_exec_parse@bb-large:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-1/igt@gen9_exec_parse@bb-large.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-5/igt@gen9_exec_parse@bb-large.html>
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>    - {shard-dg1}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>       (i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>    -
>
>    igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>
>       +10 similar issues
>    -
>
>    igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>       (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>       +1 similar issue
>    -
>
>    igt@kms_cursor_legacy@torture-move@pipe-c:
>    - {shard-rkl}: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-5/igt@kms_cursor_legacy@torture-move@pipe-c.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-3/igt@kms_cursor_legacy@torture-move@pipe-c.html>
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html>
>    -
>
>    igt@kms_flip
>    @single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-edp1:
>    - shard-tglb: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-tglb8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-edp1.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-edp1.html>
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html>
>       +1 similar issue
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-tiling-linear:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html>
>       +8 similar issues
>    -
>
>    igt@kms_properties@plane-properties-atomic:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-2/igt@kms_properties@plane-properties-atomic.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html>
>    -
>
>    igt@kms_psr@cursor_plane_move:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-1/igt@kms_psr@cursor_plane_move.html>
>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-6/igt@kms_psr@cursor_plane_move.html>
>    -
>
>    igt@kms_psr@psr2_primary_mmap_cpu:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       +1 similar issue
>    -
>
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>    - shard-tglb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-tglb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>    -
>
>    igt@perf@gen8-unprivileged-single-ctx-counters:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>       (i915#2436 <https://gitlab.freedesktop.org/drm/intel/issues/2436>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>
> Warnings
>
>    -
>
>    igt@gem_pread@exhaustion:
>    -
>
>       shard-tglb: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-tglb8/igt@gem_pread@exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb2/igt@gem_pread@exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>       +1 similar issue
>       -
>
>       shard-glk: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-glk9/igt@gem_pread@exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk7/igt@gem_pread@exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>       -
>
>    igt@gem_pwrite@basic-exhaustion:
>    - shard-apl: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl8/igt@gem_pwrite@basic-exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl1/igt@gem_pwrite@basic-exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>    -
>
>    igt@kms_chamelium@dp-crc-single:
>    - shard-snb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-snb7/igt@kms_chamelium@dp-crc-single.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-snb5/igt@kms_chamelium@dp-crc-single.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +20 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-crc-multiple:
>    - shard-glk: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-glk7/igt@kms_chamelium@hdmi-crc-multiple.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk3/igt@kms_chamelium@hdmi-crc-multiple.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +20 similar issues
>    -
>
>    igt@kms_chamelium@vga-frame-dump:
>    - shard-apl: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl1/igt@kms_chamelium@vga-frame-dump.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl1/igt@kms_chamelium@vga-frame-dump.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +19 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
>    - shard-apl: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>       (IGT#6 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6>)
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>       +1 similar issue
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr2_sf@cursor-plane-update-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>    -
>
>    igt@runner@aborted:
>    - shard-apl: (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl6/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl7/igt@runner@aborted.html>)
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>       -> (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl8/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl6/igt@runner@aborted.html>)
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>       i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7069 -> IGTPW_8140
>    - Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_12409: ab70218208c05b2a68a1143438a56c3d494eb529 @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8140: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/index.html
> IGT_7069: 40a2de5cc6a6b43af7da7905bfe1ede9d9a3200c @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://
> anongit.freedesktop.org/piglit
>

--00000000000079eb3805ee10df65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Sai, I think they&#39;re being skipped because the=
y&#39;re considered new tests.<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 21, 2022 at 7:30 PM Patchwork=
 &lt;<a href=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.f=
reedesktop.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div class=3D"msg1957510320737746158">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Chamelium: Simplify the chamelium tes=
t files.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/111163/" target=3D"_blank">https://patchwork.freedesktop.org/series/11=
1163/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8140/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_12409_full -&gt; IGTPW_8140_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8140_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_8140_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8140/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8140/index.html</a></p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8140=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@chamelium_hpd@hdmi-hpd-enable-disable-mode} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-rkl-4/igt@chamelium_hpd@hdmi-hpd-enable-disa=
ble-mode.html" target=3D"_blank">SKIP</a> +26 similar issues</li>
</ul>
</li>
<li>
<p>{igt@chamelium_hpd@hdmi-hpd-for-each-pipe} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@chamelium_hpd@hdmi-hpd-for-each-pi=
pe.html" target=3D"_blank">SKIP</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>{igt@chamelium_hpd@hdmi-hpd-with-enabled-mode} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-dg1-19/igt@chamelium_hpd@hdmi-hpd-with-enabl=
ed-mode.html" target=3D"_blank">SKIP</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>{igt@chamelium_hpd@vga-hpd} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@chamelium_hpd@vga-hpd.html" target=
=3D"_blank">SKIP</a> +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-tglb7/igt@kms_color@ctm-0-50@pipe-d-edp-1.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8140/shard-tglb8/igt@kms_color@ctm-0-50@pipe-d-edp-1.html" target=
=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb8/igt@kms_chamelium@dp-mode-timings.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb=
6/igt@kms_chamelium@dp-mode-timings.html" target=3D"_blank">SKIP</a> +20 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-tglb1/igt@kms_chamelium@hdmi-audio-edid.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb=
5/igt@kms_chamelium@hdmi-audio-edid.html" target=3D"_blank">SKIP</a> +16 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-edp-1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-tglb5/igt@kms_color@ctm-0-75@pipe-d-edp-1.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/315" target=3D"_blank">i915#315</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/6946" target=3D"_blank">i915#6946</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb8/ig=
t@kms_color@ctm-0-75@pipe-d-edp-1.html" target=3D"_blank">INCOMPLETE</a></l=
i>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-dg1-19/igt@kms_chamelium@dp-crc-single.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827" target=3D"_blank">fdo#111827</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-dg1-18/igt@kms_chamelium@dp-cr=
c-single.html" target=3D"_blank">SKIP</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium@dp-edid-resolution-list}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_chamelium@dp-edid-resolution-l=
ist.html" target=3D"_blank">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium@dp-edid-stress-resolution-4k}:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-dg1-15/igt@kms_chamelium@dp-edid-stress-reso=
lution-4k.html" target=3D"_blank">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-1/igt@kms_chamelium@hdmi-aspect-ratio.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827" target=3D"_blank">fdo#111827</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-4/igt@kms_chamelium@hdmi=
-aspect-ratio.html" target=3D"_blank">SKIP</a> +20 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium@hdmi-edid-stress-resolution-4k}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-tglb6/igt@kms_chamelium@hdmi-edid-stress-resolution-4k.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#11=
1827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
140/shard-tglb2/igt@kms_chamelium@hdmi-edid-stress-resolution-4k.html" targ=
et=3D"_blank">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb1/igt@kms_chamelium@hdmi-edid-stress-resolution-non=
-4k.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fd=
o#111827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_8140/shard-iclb6/igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k.ht=
ml" target=3D"_blank">SKIP</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-rkl-1/igt@kms_chamelium@vga-edid-read.html" =
target=3D"_blank">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12409_full and IGTPW_8140_=
full:</p>
<h3>New IGT tests (35)</h3>
<ul>
<li>
<p>igt@chamelium_color@ctm-0-25:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_color@ctm-0-50:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_color@ctm-0-75:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_color@ctm-green-to-red:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_color@ctm-limited-range:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_color@ctm-max:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_color@ctm-negative:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_color@degamma:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_color@gamma:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@dp-hpd:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@vga-hpd:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8140_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@chamelium_color@ctm-0-25} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb8/igt@chamelium_color@ctm-0-25.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284" target=3D"_blank">fdo#109284</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>{igt@chamelium_color@ctm-max} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-glk2/igt@chamelium_color@ctm-max.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271" target=3D"_blank">fdo#109271</a>) +98 similar issues</li>
</ul>
</li>
<li>
<p>{igt@chamelium_color@gamma} (NEW):</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-snb7/igt@chamelium_color@gamma.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a>) +117 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-tglb6/igt@chamelium_color@gamma.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284" target=3D"_blank">fdo#109284</a>) +9 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-snb4/igt@gem_ctx_persistence@processes.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1099" target=3D"_blank">i915#1099</a=
>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@gem_exec_balancer@parallel-context=
s.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4525" target=3D"_blank">i915#4525</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb8/igt@gem_exec_balancer@parallel-orderin=
g.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6117" target=3D"_blank">i915#6117</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8140/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html" target=3D"_=
blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842" target=3D"_blank">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb2/igt@gem_exec_fair@basic-none-solo@rcs0=
.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_8140/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html" tar=
get=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb6/igt@gem_exec_fair@basic-pace@vcs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8140/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs0.html" target=3D"_=
blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.ht=
ml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.h=
tml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842" target=3D"_blank">i915#2842</a>) +1 similar issue</p=
>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb5/igt@gem_lmem_swapping@random.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613" target=3D"_blank">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-glk2/igt@gem_lmem_swapping@verify-random.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4613<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-iclb1/igt@gem_pxp@reject-modify-context-prote=
ction-off-2.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-tglb6/igt@gem_pxp@reject-modify-context-prote=
ction-off-2.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@gem_render_copy@linear-to-vebox-y-=
tiled.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/768" target=3D"_blank">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-tglb2/igt@gem_userptr_blits@dmabuf-unsync.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/3297" target=3D"_blank">i915#3297</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-iclb5/igt@gem_userptr_blits@dmabuf-unsync.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/3297" target=3D"_blank">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-glk6/igt@gem_userptr_blits@input-checking.ht=
ml" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4991" target=3D"_blank">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb8/igt@gen7_exec_parse@load-register-reg.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-glk8/igt@gen9_exec_parse@allowed-single.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8140/shard-glk5/igt@gen9_exec_parse@allowed-single.html" target=3D"_=
blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5566" target=3D"_blank">i915#5566</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/716" target=3D"_blank">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@gen9_exec_parse@bb-secure.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2856" target=3D"_blank">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@gen9_exec_parse@cmd-crossing-page.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2527" target=3D"_blank">i915#2527</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2856" target=3D"_blank">i915#2856=
</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb5/igt@i915_module_load@resize-bar.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6412" target=3D"_blank">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-apl8/igt@i915_pipe_stress@stress-xrgb8888-un=
tiled.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/7036" target=3D"_blank">i915#7036</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html" target=3D"_blank">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_814=
0/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html" target=3D"_blank">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989" target=3D"_bl=
ank">i915#3989</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/454" target=3D"_blank">i915#454</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_814=
0/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281" target=3D"_bl=
ank">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D111644" target=3D"_blank">fdo#111644</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1397" target=3D"_blank">i915=
#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411=
" target=3D"_blank">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-apl2/igt@i915_pm_rps@engine-order.html" target=3D"_blan=
k">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8140/shard-apl1/igt@i915_pm_rps@engine-order.html" target=3D"_blank">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6537" targe=
t=3D"_blank">i915#6537</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_atomic@atomic_plane_damage.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4765" target=3D"_blank">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb2/igt@kms_big_fb@4-tiled-addfb-size-offs=
et-overflow.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>) +2 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb7/igt@kms_big_fb@linear-32bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111614" target=3D"_blank">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#11=
1615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_ccs@pipe-a-bad-aux-stride-y_ti=
led_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>) +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb8/igt@kms_ccs@pipe-a-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/6095" target=3D"_blank">i915#6095</a>=
) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@kms_ccs@pipe-a-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6095" target=3D"_=
blank">i915#6095</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-apl2/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#1092=
71</a>) +87 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-y_t=
iled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=3D=
"_blank">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb1/igt@kms_ccs@pipe-b-crc-primary-rotatio=
n-180-y_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
886" target=3D"_blank">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-apl6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#10927=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" ta=
rget=3D"_blank">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-yf_tiled_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3689" target=
=3D"_blank">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-glk2/igt@kms_ccs@pipe-c-random-ccs-data-y_ti=
led_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@kms_content_protection@dp-mst-type=
-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3116" target=3D"_blank">i915#3116</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3299" target=3D"_blank">i915#3=
299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb7/igt@kms_content_protection@srm.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/7118" target=3D"_blank">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb@atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@kms_cursor_legacy@cursorb-vs-flipb=
@atomic.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blank=
">fdo#111825</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb@legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipb=
@legacy.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>) +7 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_flip@2x-nonexisting-fb.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blank">fdo#111825</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3637" target=
=3D"_blank">i915#3637</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_8140/shard-apl8/igt@kms_flip@flip-vs-suspend-interrupt=
ible@c-dp1.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>)</li=
>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html" target=3D"_blank">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" targe=
t=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2672" target=3D"_blank">i915#2672</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" tar=
get=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2672" target=3D"_blank">i915#2672</a>) +4 similar issues</li=
>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-32bpp-xtile-downscaling@pipe-a-default-mode.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555" t=
arget=3D"_blank">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" t=
arget=3D"_blank">i915#2672</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-shrfb-msflip-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo#1092=
80</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-pri-indfb-draw-mmap-wc.html" target=3D"_blank">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2546" target=3D"_blank">i915=
#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-pri-indfb-draw-mmap-cpu.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/6497" target=3D"_blank"=
>i915#6497</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-spr-indfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank=
">fdo#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825" target=3D"_blank">fdo#111825</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_hdr@bpc-switch-suspend.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3555" target=3D"_blank">i915#3555</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-m=
odeset-pipe-c.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb7/igt@kms_plane_lowres@tiling-4.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D112054" target=3D"_blank">fdo#112054</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5288" target=3D"_blank">i915#5288</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_plane_lowres@tiling-x@pipe-b-e=
dp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3536" target=3D"_blank">i915#3536</a>) +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb1/igt@kms_plane_lowres@tiling-x@pipe-c-e=
dp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3536" target=3D"_blank">i915#3536</a>) +3 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb7/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-75@pipe-d-edp-1.html" target=3D"_blank">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D"_b=
lank">i915#5176</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp=
-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb7/igt@kms_plane_scaling@plane-upscale-wi=
th-rotation-factor-0-25@pipe-a-edp-1.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D"_bla=
nk">i915#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-tglb3/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>) +1=
 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-glk6/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_=
blank">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-apl8/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_=
blank">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html" target=3D"_blan=
k">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8140/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html" target=3D"_blank">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441" targ=
et=3D"_blank">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-tglb6/igt@kms_psr@psr2_cursor_mmap_gtt.html" =
target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/132" target=3D"_blank">i915#132</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3467" target=3D"_blank">i915#3467</a>) +2=
 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_gtt.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109441" target=3D"_blank">fdo#109441</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-busy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-iclb1/igt@kms_vblank@pipe-d-query-forked-bus=
y.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>) +7 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-tglb8/igt@kms_writeback@writeback-pixel-form=
ats.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2437" target=3D"_blank">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-iclb5/igt@prime_vgem@coherency-gtt.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109292" target=3D"_blank">fdo#109292</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109295" target=3D"_blank">fdo#109295</a>)<=
/p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-tglb3/igt@prime_vgem@coherency-gtt.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109295" target=3D"_blank">fdo#109295</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111656" target=3D"_blank">fdo#111656</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-glk2/igt@sysfs_clients@busy.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-iclb2/igt@sysfs_clients@busy.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8140/shard-apl2/igt@sysfs_clients@busy.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-2/igt@fbdev@unaligned-write.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582"=
 target=3D"_blank">i915#2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_8140/shard-rkl-4/igt@fbdev@unaligned-write.html" tar=
get=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4525" target=3D"_blank">i915#4525</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb1/igt@gem_exec_balance=
r@parallel-out-fence.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-4/igt@gem_exec_fair@basic-flow@rcs0.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-5/igt@gem_exec_fair@basic-flo=
w@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-read.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3281" target=3D"_blank">i915#3281</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-5/igt@gem_exec_reloc@basic-cp=
u-read.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-4/igt@gem_partial_pwrite_pread@write.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3282" target=3D"_blank">i915#3282</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-5/igt@gem_partial_pwrite_p=
read@write.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html" targe=
t=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_8140/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html" tar=
get=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-apl7/igt@gen9_exec_parse@allowed-single.html" target=3D=
"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5566" target=3D"_blank">i915#5566</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/716" target=3D"_blank">i915#716</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl8/=
igt@gen9_exec_parse@allowed-single.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-1/igt@gen9_exec_parse@bb-large.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/25=
27" target=3D"_blank">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8140/shard-rkl-5/igt@gen9_exec_parse@bb-large.htm=
l" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html" ta=
rget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3591" target=3D"_blank">i915#3591</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-dg1-18/igt@i915_pm_rc6_res=
idency@rc6-idle@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen1=
2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1845" target=3D"_blank">i915#1845</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blan=
k">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8140/shard-rkl-6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_=
rc_ccs_cc.html" target=3D"_blank">PASS</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p=
>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions-varying-size.html" target=3D"_blank">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2346" target=3D"_blank">i915#2346</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard=
-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.=
html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-c:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-5/igt@kms_cursor_legacy@torture-move@pipe-c.html" t=
arget=3D"_blank">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_8140/shard-rkl-3/igt@kms_cursor_legacy@torture-move@pi=
pe-c.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
b-hdmi-a2.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/79" target=3D"_blank">i915#79</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-glk7/igt@kms=
_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html" target=3D"_blank=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-e=
dp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-tglb8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-mo=
deset-interruptible@d-edp1.html" target=3D"_blank">INCOMPLETE</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb3/igt=
@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-edp1.ht=
ml" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp=
-xtile-downscaling@pipe-a-default-mode.html" target=3D"_blank">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555" target=3D"_b=
lank">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8140/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bp=
p-xtile-downscaling@pipe-a-default-mode.html" target=3D"_blank">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank">i915#4098</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/sh=
ard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html" target=3D"_b=
lank">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-2/igt@kms_properties@plane-properties-atomic.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1849" target=3D"_blank">i915#1849</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-6/igt@kms_properties=
@plane-properties-atomic.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-1/igt@kms_psr@cursor_plane_move.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
072" target=3D"_blank">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-6/igt@kms_psr@cursor_plane_move.h=
tml" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109441" target=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms_psr@psr2_primary=
_mmap_cpu.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-tglb8/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5519" target=3D"_blank">i915#5519</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-tglb5/igt@k=
ms_psr_stress_test@flip-primary-invalidate-overlay.html" target=3D"_blank">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2436" target=3D"_blank">i915#2436</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-rkl-5/igt@perf@gen8-=
unprivileged-single-ctx-counters.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12409/shard-tglb8/igt@gem_pread@exhaustion.html" target=3D"_blank">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658" t=
arget=3D"_blank">i915#2658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_8140/shard-tglb2/igt@gem_pread@exhaustion.html" target=
=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/7248" target=3D"_blank">i915#7248</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12409/shard-glk9/igt@gem_pread@exhaustion.html" target=3D"_blank">WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658" ta=
rget=3D"_blank">i915#2658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8140/shard-glk7/igt@gem_pread@exhaustion.html" target=
=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/7248" target=3D"_blank">i915#7248</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-apl8/igt@gem_pwrite@basic-exhaustion.html" target=3D"_b=
lank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2658" target=3D"_blank">i915#2658</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8140/shard-apl1/igt@gem_pwrite@basic-exhaustion=
.html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/7248" target=3D"_blank">i915#7248</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-snb7/igt@kms_chamelium@dp-crc-single.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-snb5/igt=
@kms_chamelium@dp-crc-single.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo=
#109271</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-multiple:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-glk7/igt@kms_chamelium@hdmi-crc-multiple.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-gl=
k3/igt@kms_chamelium@hdmi-crc-multiple.html" target=3D"_blank">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_=
blank">fdo#109271</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-apl1/igt@kms_chamelium@vga-frame-dump.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl1/ig=
t@kms_chamelium@vga-frame-dump.html" target=3D"_blank">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">f=
do#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-apl3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.=
html" target=3D"_blank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools/issues/6" target=3D"_blank">IGT#6</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-apl1/igt@km=
s_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html" target=3D"_blank">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4573" target=
=3D"_blank">i915#4573</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb7/igt@kms_psr2_=
sf@cursor-plane-move-continuous-sf.html" target=3D"_blank">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank"=
>i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb5/igt@kms_psr2_sf@cursor=
-plane-update-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D=
"_blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12409/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/shard-iclb2/igt@kms=
_psr2_sf@overlay-plane-move-continuous-exceed-sf.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920" ta=
rget=3D"_blank">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12409/shard-apl6/igt@runner@aborted.html" target=3D"_blank">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-=
apl7/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/shard-apl7/igt@runner@abort=
ed.html" target=3D"_blank">FAIL</a>) (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3002" target=3D"_blank">i91=
5#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/431=
2" target=3D"_blank">i915#4312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8140/shard-apl8/igt@runner@aborted.html" target=
=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8140/shard-apl6/igt@runner@aborted.html" target=3D"_blank">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180" target=3D"_=
blank">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3002" target=3D"_blank">i915#3002</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4312" target=3D"_blank">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7069 -&gt; IGTPW_8140</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12409: ab70218208c05b2a68a1143438a56c3d494eb529 @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_8140: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_814=
0/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8140/index.html</a><br>
  IGT_7069: 40a2de5cc6a6b43af7da7905bfe1ede9d9a3200c @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://<a href=3D"=
http://anongit.freedesktop.org/piglit" target=3D"_blank">anongit.freedeskto=
p.org/piglit</a></p>

</div>

</div></blockquote></div></div>

--00000000000079eb3805ee10df65--
