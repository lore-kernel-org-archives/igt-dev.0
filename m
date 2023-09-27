Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53A310E566
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 17:43:07 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-530c9980556so14058150a12.2
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 10:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230926184748.199187-1-robdclark@gmail.com>
 <20230926184748.199187-3-robdclark@gmail.com>
 <20230927142611.jm5pbvfzrmeajdes@zkempczy-mobl2>
In-Reply-To: <20230927142611.jm5pbvfzrmeajdes@zkempczy-mobl2>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 27 Sep 2023 10:42:54 -0700
Message-ID: <CAF6AEGum20r0hkPZYu7bviERvDB5dQjU+i1W8VokR59tZk=eDw@mail.gmail.com>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH v3 3/3] core_getversion: Test for desired
 device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 7:26=E2=80=AFAM Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> On Tue, Sep 26, 2023 at 11:47:47AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > We discovered in drm/ci that if the drm device fails to probe, all the
> > tests come back as "Skip" and the job is considered successful. Fix
> > the getversion test to fail if there is no drm device or if the drm
> > device does not match the expected device as specified by the optional
> > IGT_REQUIRED_DRIVER environment variable.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Acked-by: Helen Koike <helen.koike@collabora.com>
> > ---
> >  tests/core_getversion.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> > index 32cb976e4923..b298a6890ef9 100644
> > --- a/tests/core_getversion.c
> > +++ b/tests/core_getversion.c
> > @@ -48,14 +48,25 @@ igt_simple_main
> >  {
> >       int fd;
> >       drmVersionPtr v;
> > +     const char *name =3D getenv("IGT_REQUIRED_DRIVER");
> > +     int chipset =3D DRIVER_ANY;
> >
> > -     fd =3D drm_open_driver(DRIVER_ANY);
> > +     if (name)
> > +             chipset =3D drm_find_chipset(name);
>
> With invalid name chipset returned =3D=3D 0, so we'll get unexpected
> results. I would assert like:
>
> if (name) {
>         chipset =3D drm_find_chipset(name);
>         igt_assert(chipset > 0);
> }
>
> Rest lgtm so with minor nit above addressed:
>

done, thx

> Reviewed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> --
> Zbigniew
>
> > +
> > +     fd =3D __drm_open_driver(chipset);
> > +     igt_assert_fd(fd);
> >       v =3D drmGetVersion(fd);
> >       igt_assert_neq(strlen(v->name), 0);
> >       igt_assert_neq(strlen(v->date), 0);
> >       igt_assert_neq(strlen(v->desc), 0);
> >       if (is_i915_device(fd))
> >               igt_assert_lte(1, v->version_major);
> > +     if (name) {
> > +             igt_assert_f(!strcmp(name, v->name),
> > +                          "Expected driver \"%s\" but got \"%s\"\n",
> > +                          name, v->name);
> > +     }
> >
> >       drmFree(v);
> >       drm_close_driver(fd);
> > --
> > 2.41.0
> >
