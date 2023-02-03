Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B49110E733
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 10:10:53 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id m15so1874188ilh.9
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Feb 2023 02:10:53 -0800 (PST)
Date: Fri, 3 Feb 2023 12:10:50 +0200
From: Petri Latvala <adrinael@adrinael.net>
To: Mark Yacoub <markyacoub@chromium.org>
Message-ID: <Y9zdqjsQEO3+UKX5@adrinael.net>
References: <20230201181215.30500-1-markyacoub@google.com>
 <167527738655.25546.1927977876668648118@emeril.freedesktop.org>
 <CAJUqKUoRGa8=Som60+OyieGFjNKObq06_XQSWq=zS8BpntZhrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJUqKUoRGa8=Som60+OyieGFjNKObq06_XQSWq=zS8BpntZhrg@mail.gmail.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium=3A_Get_Chamelium_Logs_on_RPC_failure=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 01, 2023 at 04:02:35PM -0500, Mark Yacoub wrote:
> Hi Lakshminarayana, the failure seems unrelated - can we get a rerun please?


The failure is very related. The failure is:

"GetChameleondLogs" is not supported

You need to check with chamelium_supports_method whether
GetChameleondLogs is there. Btw, what chameleond version does that
need?

-- 
Petri Latvala


> 
> On Wed, Feb 1, 2023 at 1:49 PM Patchwork <patchwork@emeril.freedesktop.org>
> wrote:
> 
> > *Patch Details*
> > *Series:* Chamelium: Get Chamelium Logs on RPC failure.
> > *URL:* https://patchwork.freedesktop.org/series/113567/
> > *State:* failure
> > *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/index.html CI
> > Bug Log - changes from CI_DRM_12680 -> IGTPW_8428 Summary
> >
> > *FAILURE*
> >
> > Serious unknown changes coming with IGTPW_8428 absolutely need to be
> > verified manually.
> >
> > If you think the reported changes have nothing to do with the changes
> > introduced in IGTPW_8428, please notify your bug team to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> >
> > External URL:
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/index.html
> > Participating hosts (26 -> 25)
> >
> > Missing (1): fi-snb-2520m
> > Possible new issues
> >
> > Here are the unknown changes that may have been introduced in IGTPW_8428:
> > IGT changes Possible regressions
> >
> >    - igt@kms_chamelium_frames@hdmi-crc-fast:
> >       - fi-kbl-7567u: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html>
> >       +3 similar issues
> >
> > Warnings
> >
> >    - igt@kms_chamelium_hpd@vga-hpd-fast:
> >       - fi-kbl-7567u: SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fast.html>
> >       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fast.html>
> >       +4 similar issues
> >
> > Known issues
> >
> > Here are the changes found in IGTPW_8428 that come from known issues:
> > IGT changes Issues hit
> >
> >    - igt@i915_selftest@live@gt_heartbeat:
> >       - fi-glk-j4005: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html>
> >       -> DMESG-FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html>
> >       (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
> >
> > Possible fixes
> >
> >    - igt@i915_selftest@live@migrate:
> >       - {bat-dg2-11}: DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/bat-dg2-11/igt@i915_selftest@live@migrate.html>
> >       (i915#7699 <https://gitlab.freedesktop.org/drm/intel/issues/7699>)
> >       -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/bat-dg2-11/igt@i915_selftest@live@migrate.html>
> >
> > {name}: This element is suppressed. This means it is ignored when computing
> > the status of the difference (SUCCESS, WARNING, or FAILURE).
> > Build changes
> >
> >    - CI: CI-20190529 -> None
> >    - IGT: IGT_7143 -> IGTPW_8428
> >
> > CI-20190529: 20190529
> > CI_DRM_12680: 06086656e6f03cbcbb4b99273734a7943e923fc9 @ git://
> > anongit.freedesktop.org/gfx-ci/linux
> > IGTPW_8428: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/index.html
> > IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >
