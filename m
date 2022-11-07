Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5409A10E2B9
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 10:27:09 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id n191so8408848iod.13
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Nov 2022 02:27:09 -0800 (PST)
MIME-Version: 1.0
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
 <20221107093057.5w7kdc3pjq77upng@houat>
 <555dc349-4838-3c24-b35e-38aa8afd9f1d@suse.de>
In-Reply-To: <555dc349-4838-3c24-b35e-38aa8afd9f1d@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 7 Nov 2022 11:26:57 +0100
Message-ID: <CAKMK7uFWv98_miqCAVWYVnZZ_V_fL0FSBc6uv0x48ZMrzLQhbA@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 7 Nov 2022 at 10:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 07.11.22 um 10:30 schrieb Maxime Ripard:
> > Hi Thomas,
> >
> > On Fri, Oct 28, 2022 at 09:31:38AM +0200, Thomas Zimmermann wrote:
> >> Am 24.10.22 um 14:43 schrieb maxime@cerno.tech:
> >>> I've discussing the idea for the past year to add an IGT test suite t=
hat
> >>> all well-behaved KMS drivers must pass.
> >>>
> >>> The main idea behind it comes from v4l2-compliance and cec-compliance=
,
> >>> that are being used to validate that the drivers are sane.
> >>>
> >>> We should probably start building up the test list, and eventually
> >>> mandate that all tests pass for all the new KMS drivers we would merg=
e
> >>> in the kernel, and be run by KCi or similar.
> >>>
> >>> I did a first pass to create a draft of such a test-suite, which woul=
d
> >>> contain:
> >>>
> >>> igt@core_auth@basic-auth
> >>> igt@core_auth@getclient-master-drop
> >>> igt@core_auth@getclient-simple
> >>> igt@core_auth@many-magics
> >>> igt@core_getclient
> >>> igt@core_getstats
> >>> igt@core_getversion
> >>> igt@core_hotunplug@hotrebind-lateclose
> >>> igt@core_hotunplug@hotunbind-rebind
> >>> igt@core_hotunplug@unbind-rebind
> >>> igt@core_setmaster
> >>> igt@core_setmaster_vs_auth
> >>> igt@device_reset@unbind-reset-rebind
> >>> igt@drm_read
> >>> igt@dumb_buffer
> >>> igt@fbdev
> >>
> >> Maybe we make this test optional? At least sprd decided to not support=
 fbdev
> >> at all.
> >
> > I'm not sure we need to make that test optional, or at least, we should
> > run it all the time, but skip it if there's no fbdev emulation, and not
> > report it as a failure?
>
> Sure. I just meant that fbdev support shouldn't be a blocker. If there,
> it should work of course.

Not supporting fbdev looks more like an accident than intention here,
and maybe a good reason to have these kind of must-past lists.
Eventually, once the i915-ism is worked out of igt well enough for a
set of tests at least. The drm/ci effort should help in building up
that list (by essentially extracting the common set of tests that
everyone passes and graduating that to the must-pass list for kms
conformance or whatever we'll call it).
-Daniel

>
> Best regards
> Thomas
>
> >
> > Maxime
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
