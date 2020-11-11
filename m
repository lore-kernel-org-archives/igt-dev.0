Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B686189DB9
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 10:22:31 +0000 (UTC)
Date: Wed, 11 Nov 2020 12:22:26 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201111102226.GI7444@platvala-desk.ger.corp.intel.com>
References: <20201110075102.5033-1-tzimmermann@suse.de>
 <160502313035.11376.297659353090689661@emeril.freedesktop.org>
 <bb6f215c-e6d5-4628-dace-5179157b7c10@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb6f215c-e6d5-4628-dace-5179157b7c10@suse.de>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVGVzdCBj?=
 =?utf-8?q?ases_for_fbdev?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 10:11:40AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 10.11.20 um 16:45 schrieb Patchwork:
> > *Patch Details*
> > *Series:*	Test cases for fbdev
> > *URL:*	https://patchwork.freedesktop.org/series/83677/
> > <https://patchwork.freedesktop.org/series/83677/>
> > *State:*	failure
> > *Details:*
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index.html
> > <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index.html>
> > =

> > =

> >   CI Bug Log - changes from CI_DRM_9301 -> IGTPW_5153
> > =

> > =

> >     Summary
> > =

> > *FAILURE*
> > =

> > Serious unknown changes coming with IGTPW_5153 absolutely need to be
> > verified manually.
> > =

> > If you think the reported changes have nothing to do with the changes
> > introduced in IGTPW_5153, please notify your bug team to allow them
> > to document this new failure mode, which will reduce false positives in=
 CI.
> > =

> > External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index=
.html
> > =

> > =

> >     Possible new issues
> > =

> > Here are the unknown changes that may have been introduced in IGTPW_515=
3:
> > =

> > =

> >       IGT changes
> > =

> > =

> >         Possible regressions
> > =

> >   *
> > =

> >     igt@fbdev@mmap:
> =

> FYI, I replaced the mmap test with a set of more elaborate tests. It's
> expected that mmap does not PASS any longer.
> =

> Is there a configuration file that I have to adapt?

Yeah, tests/intel-ci/fast-feedback.testlist. For getting this series
fully tested, add a patch to the series that removes the line

igt@fbdev@mmap

from that file, with subjectprefix "CI" or "HAX" so it's clear it's
not the final patch to be committed.

Chris, do you have any input as to which subtests we want to have in
BAT in the end?

-- =

Petri Latvala



> =

> Best regards
> Thomas
> =

> > =

> >       o
> > =

> >         fi-tgl-u2: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-tgl-u2=
/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-u2/=
igt@fbdev@mmap.html>
> > =

> >       o
> > =

> >         fi-tgl-y: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-y/i=
gt@fbdev@mmap.html>
> > =

> >       o
> > =

> >         fi-cml-s: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cml-s/=
igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cml-s/i=
gt@fbdev@mmap.html>
> > =

> >       o
> > =

> >         fi-icl-y: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-icl-y/=
igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-icl-y/i=
gt@fbdev@mmap.html>
> > =

> >       o
> > =

> >         fi-icl-u2: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-icl-u2=
/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-icl-u2/=
igt@fbdev@mmap.html>
> > =

> >       o
> > =

> >         fi-cml-u2: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cml-u2=
/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cml-u2/=
igt@fbdev@mmap.html>
> > =

> > =

> >         Suppressed
> > =

> > The following results come from untrusted machines, tests, or statuses.
> > They do not affect the overall result.
> > =

> >   *
> > =

> >     igt@fbdev@mmap:
> > =

> >       o
> > =

> >         {fi-ehl-1}: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-ehl-1/=
igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-ehl-1/i=
gt@fbdev@mmap.html>
> > =

> >       o
> > =

> >         {fi-tgl-dsi}: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-tgl-ds=
i/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-dsi=
/igt@fbdev@mmap.html>
> > =

> > =

> >     Known issues
> > =

> > Here are the changes found in IGTPW_5153 that come from known issues:
> > =

> > =

> >       IGT changes
> > =

> > =

> >         Issues hit
> > =

> >   *
> > =

> >     igt@fbdev@mmap:
> > =

> >       o
> > =

> >         fi-skl-lmem: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-lm=
em/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-lme=
m/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-ivb-3770: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-ivb-37=
70/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-ivb-377=
0/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-ilk-650: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-ilk-65=
0/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-ilk-650=
/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-bsw-n3050: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bsw-n3=
050/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bsw-n30=
50/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-cfl-guc: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cfl-gu=
c/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cfl-guc=
/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-snb-2600: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-snb-26=
00/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-snb-260=
0/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-kbl-x1275: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-x1=
275/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-x12=
75/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-kbl-soraka: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-so=
raka/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-sor=
aka/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-glk-dsi: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-glk-ds=
i/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-glk-dsi=
/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-bsw-kefka: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bsw-ke=
fka/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bsw-kef=
ka/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-kbl-r: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-r/=
igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-r/i=
gt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-kbl-8809g: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-88=
09g/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-880=
9g/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-blb-e6850: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-blb-e6=
850/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-blb-e68=
50/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-kbl-7500u: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-75=
00u/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-750=
0u/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-cfl-8109u: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cfl-81=
09u/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cfl-810=
9u/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-gdg-551: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-gdg-55=
1/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-gdg-551=
/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-bwr-2160: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bwr-21=
60/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bwr-216=
0/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-skl-guc: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-gu=
c/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-guc=
/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-skl-6600u: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-66=
00u/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-660=
0u/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-pnv-d510: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-pnv-d5=
10/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-pnv-d51=
0/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-bdw-5557u: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bdw-55=
57u/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bdw-555=
7u/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-snb-2520m: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-snb-25=
20m/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-snb-252=
0m/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-apl-guc: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-apl-gu=
c/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-apl-guc=
/igt@fbdev@mmap.html>
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         i915#1635 <https://gitlab.freedesktop.org/drm/intel/issues/1635=
>)
> > =

> >       o
> > =

> >         fi-hsw-4770: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-hsw-47=
70/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-hsw-477=
0/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-cfl-8700k: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-cfl-87=
00k/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-cfl-870=
0k/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-bxt-dsi: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bxt-ds=
i/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bxt-dsi=
/igt@fbdev@mmap.html>
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         i915#1635 <https://gitlab.freedesktop.org/drm/intel/issues/1635=
>)
> > =

> >       o
> > =

> >         fi-skl-6700k2: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-skl-67=
00k2/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-skl-670=
0k2/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-elk-e7500: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-elk-e7=
500/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-elk-e75=
00/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >       o
> > =

> >         fi-byt-j1900: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-byt-j1=
900/igt@fbdev@mmap.html>
> >         -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-byt-j19=
00/igt@fbdev@mmap.html>
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271>)
> > =

> >   *
> > =

> >     igt@i915_module_load@reload:
> > =

> >       o fi-tgl-u2: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-tgl-u2=
/igt@i915_module_load@reload.html>
> >         -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-tgl-u2/=
igt@i915_module_load@reload.html>
> >         (i915#1982
> >         <https://gitlab.freedesktop.org/drm/intel/issues/1982> /
> >         k.org#205379 <https://bugzilla.kernel.org/show_bug.cgi?id=3D205=
379>)
> >   *
> > =

> >     igt@kms_busy@basic@flip:
> > =

> >       o fi-kbl-soraka: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-kbl-so=
raka/igt@kms_busy@basic@flip.html>
> >         -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-kbl-sor=
aka/igt@kms_busy@basic@flip.html>
> >         (i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/198=
2>)
> >   *
> > =

> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> > =

> >       o fi-icl-u2: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-icl-u2=
/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
> >         -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-icl-u2/=
igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
> >         (i915#1982
> >         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +2
> >         similar issues
> > =

> > =

> >         Possible fixes
> > =

> >   *
> > =

> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> > =

> >       o
> > =

> >         fi-bsw-kefka: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-bsw-ke=
fka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
> >         (i915#1982
> >         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-bsw-kef=
ka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
> > =

> >       o
> > =

> >         fi-apl-guc: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9301/fi-apl-gu=
c/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
> >         (i915#1635
> >         <https://gitlab.freedesktop.org/drm/intel/issues/1635> /
> >         i915#1982
> >         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/fi-apl-guc=
/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
> > =

> > {name}: This element is suppressed. This means it is ignored when compu=
ting
> > the status of the difference (SUCCESS, WARNING, or FAILURE).
> > =

> > =

> >     Participating hosts (46 -> 42)
> > =

> > Additional (1): fi-tgl-y
> > Missing (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-s=
amus
> > =

> > =

> >     Build changes
> > =

> >   * CI: CI-20190529 -> None
> >   * IGT: IGT_5839 -> IGTPW_5153
> > =

> > CI-20190529: 20190529
> > CI_DRM_9301: 886b2b2d05ec4cb1b21cf7a311f186b5df1b78c5 @
> > git://anongit.freedesktop.org/gfx-ci/linux
> > IGTPW_5153: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5153/index.h=
tml
> > IGT_5839: 2dbd64a6301e36eb432bc50ad7021fabaeebd1f4 @
> > git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> > =

> > =3D=3D Testlist changes =3D=3D
> > =

> > +igt@fbdev@eof
> > +igt@fbdev@nullptr
> > +igt@fbdev@read
> > +igt@fbdev@unaligned-read
> > +igt@fbdev@unaligned-write
> > +igt@fbdev@write
> > -igt@fbdev@mmap
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
