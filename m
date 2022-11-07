Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA7D10E4DA
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 17:04:33 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id x7so2661300ilg.0
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Nov 2022 09:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
 <20221107093057.5w7kdc3pjq77upng@houat>
 <555dc349-4838-3c24-b35e-38aa8afd9f1d@suse.de>
 <CAKMK7uFWv98_miqCAVWYVnZZ_V_fL0FSBc6uv0x48ZMrzLQhbA@mail.gmail.com>
 <a51ae3be-bcb2-9ae9-f7a7-31270d3b8979@suse.de>
In-Reply-To: <a51ae3be-bcb2-9ae9-f7a7-31270d3b8979@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 7 Nov 2022 18:04:21 +0100
Message-ID: <CAKMK7uH3Xft8fEBCaeG3dvWXHb+xO1C45mPEKW+pasmjdPiU+g@mail.gmail.com>
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

On Mon, 7 Nov 2022 at 11:53, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 07.11.22 um 11:26 schrieb Daniel Vetter:
> > On Mon, 7 Nov 2022 at 10:43, Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
> >>
> >> Hi
> >>
> >> Am 07.11.22 um 10:30 schrieb Maxime Ripard:
> >>> Hi Thomas,
> >>>
> >>> On Fri, Oct 28, 2022 at 09:31:38AM +0200, Thomas Zimmermann wrote:
> >>>> Am 24.10.22 um 14:43 schrieb maxime@cerno.tech:
> >>>>> I've discussing the idea for the past year to add an IGT test suite=
 that
> >>>>> all well-behaved KMS drivers must pass.
> >>>>>
> >>>>> The main idea behind it comes from v4l2-compliance and cec-complian=
ce,
> >>>>> that are being used to validate that the drivers are sane.
> >>>>>
> >>>>> We should probably start building up the test list, and eventually
> >>>>> mandate that all tests pass for all the new KMS drivers we would me=
rge
> >>>>> in the kernel, and be run by KCi or similar.
> >>>>>
> >>>>> I did a first pass to create a draft of such a test-suite, which wo=
uld
> >>>>> contain:
> >>>>>
> >>>>> igt@core_auth@basic-auth
> >>>>> igt@core_auth@getclient-master-drop
> >>>>> igt@core_auth@getclient-simple
> >>>>> igt@core_auth@many-magics
> >>>>> igt@core_getclient
> >>>>> igt@core_getstats
> >>>>> igt@core_getversion
> >>>>> igt@core_hotunplug@hotrebind-lateclose
> >>>>> igt@core_hotunplug@hotunbind-rebind
> >>>>> igt@core_hotunplug@unbind-rebind
> >>>>> igt@core_setmaster
> >>>>> igt@core_setmaster_vs_auth
> >>>>> igt@device_reset@unbind-reset-rebind
> >>>>> igt@drm_read
> >>>>> igt@dumb_buffer
> >>>>> igt@fbdev
> >>>>
> >>>> Maybe we make this test optional? At least sprd decided to not suppo=
rt fbdev
> >>>> at all.
> >>>
> >>> I'm not sure we need to make that test optional, or at least, we shou=
ld
> >>> run it all the time, but skip it if there's no fbdev emulation, and n=
ot
> >>> report it as a failure?
> >>
> >> Sure. I just meant that fbdev support shouldn't be a blocker. If there=
,
> >> it should work of course.
> >
> > Not supporting fbdev looks more like an accident than intention here,
> > and maybe a good reason to have these kind of must-past lists.
>
> No. Back then, I specifically asked the developer, Kevin Tang IIRC,
> about fbdev/console support and he replied that he has no intention of
> adding it.
>
> It's the only driver without fbdev, but as we don't have such a
> requirements AFAIK, I left it at that.

It does hurt a bit the sales pitch that a drm-kms driver is the
one-stop-shop for display driver needs, and so I'd only do this if
there's some technical reasons why fbdev just wont work (like no hw
support for formats fbdev supports or something), and not just because
the vendor has no need for this right now. Otoh it's generally just
one line to add if the driver works correctly, so ...

*shrug*

Cheers, Daniel

>
> Best regards
> Thomas
>
> > Eventually, once the i915-ism is worked out of igt well enough for a
> > set of tests at least. The drm/ci effort should help in building up
> > that list (by essentially extracting the common set of tests that
> > everyone passes and graduating that to the must-pass list for kms
> > conformance or whatever we'll call it).
> > -Daniel
> >
> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> Maxime
> >>
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >> (HRB 36809, AG N=C3=BCrnberg)
> >> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >
> >
> >
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
