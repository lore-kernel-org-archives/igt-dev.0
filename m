Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030A310E054
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 08:02:23 +0000 (UTC)
Date: Mon, 18 Sep 2023 11:02:18 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Message-ID: <20230918110218.3c7975c4.pekka.paalanen@collabora.com>
In-Reply-To: <f20017fc-2e91-4210-a446-06652347153e@amd.com>
References: <20230908150315.75977-1-harry.wentland@amd.com>
 <20230908150315.75977-6-harry.wentland@amd.com>
 <20230915175258.0181c016.pekka.paalanen@collabora.com>
 <f20017fc-2e91-4210-a446-06652347153e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [RFC PATCH 5/7] igt/color: Add SW color transform
 functionality
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Simon Ser <contact@emersion.fr>,
 Alexander Goins <agoins@nvidia.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, igt-dev@lists.freedesktop.org,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Daniel Vetter <daniel@ffwll.ch>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 15 Sep 2023 15:50:52 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-09-15 10:52, Pekka Paalanen wrote:
> > On Fri, 8 Sep 2023 11:03:13 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> In order to test color we want to compare a HW (KMS) transform
> >> with a SW transform. This introduces color transform for an
> >> sRGB EOTF but this can be extended to other transforms. Code is
> >> borrowed from Skia.
> >>
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> >> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> >> Cc: Simon Ser <contact@emersion.fr>
> >> Cc: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Melissa Wen <mwen@igalia.com>
> >> Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> >> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >> Cc: Shashank Sharma <shashank.sharma@amd.com>
> >> Cc: Alexander Goins <agoins@nvidia.com>
> >> Cc: Joshua Ashton <joshua@froggi.es>
> >> Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >> Cc: Aleix Pol <aleixpol@kde.org>
> >> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> >> Cc: Victoria Brekenfeld <victoria@system76.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: Uma Shankar <uma.shankar@intel.com>
> >> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> >> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> >> ---
> >>  lib/igt_color.c | 330 ++++++++++++++++++++++++++++++++++++++++++++++++
> >>  lib/igt_color.h | 105 +++++++++++++++
> >>  lib/igt_fb.c    |   6 +-
> >>  lib/igt_fb.h    |   2 +
> >>  lib/meson.build |   1 +
> >>  5 files changed, 441 insertions(+), 3 deletions(-)
> >>  create mode 100644 lib/igt_color.c
> >>  create mode 100644 lib/igt_color.h

...

> >> +/*
> >> + * A transfer function mapping encoded values to linear values,
> >> + * represented by this 7-parameter piecewise function:
> >> + *
> >> + *   linear =3D sign(encoded) *  (c*|encoded| + f)       , 0 <=3D |en=
coded| < d
> >> + *          =3D sign(encoded) * ((a*|encoded| + b)^g + e), d <=3D |en=
coded| =20
> >=20
> > The code you have does not actually do the extended form (use of sign
> > and absolute value), but clamps the result to [0.0, 1.0].
> >  =20
>=20
> Yes, the intention (and I didn't write this but copied it) is to be able =
to use
> this to describe most (all?) standard transfer functions. See
> https://github.com/google/skia/blob/main/include/core/SkColorSpace.h

My complaint is about doc and implementation disagreeing.

xvYCC and integer-encoded scRGB would need an extended range if anyone
wanted to test those, if they even fit here. I also do not understand
how it can be possible to express PQ EOTF or HLG OETF with this
parameterisation. Maybe it's an approximation on a very limited domain?


Thanks,
pq

> >> + *
> >> + * (A simple gamma transfer function sets g to gamma and a to 1.)
> >> + */
> >> +struct igt_color_tf {
> >> +    float g, a,b,c,d,e,f;
> >> +};
> >> +
> >> +const struct igt_color_tf srgb_tf =3D {2.4f, (float)(1/1.055), (float=
)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
> >> +
> >> +/* end of Skia-based code */
> >> +
> >> +typedef struct igt_pixel {
> >> +	float r;
> >> +	float g;
> >> +	float b;
> >> +} igt_pixel_t; =20
> >=20
> > Thanks,
> > pq =20
>=20
