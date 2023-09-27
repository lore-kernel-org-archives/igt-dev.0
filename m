Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C779C10E05E
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 17:41:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53447d0241eso7075385a12.3
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 10:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230926184748.199187-1-robdclark@gmail.com>
 <20230926184748.199187-2-robdclark@gmail.com>
 <20230927142042.p246gynfpryij6rr@zkempczy-mobl2>
In-Reply-To: <20230927142042.p246gynfpryij6rr@zkempczy-mobl2>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 27 Sep 2023 10:41:24 -0700
Message-ID: <CAF6AEGv-45SaTsx5EPezQacV1JCw0HwqsJ9hhJfvzERpJO8SfA@mail.gmail.com>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH 2/3] lib/drmtest: Add drm_find_chipset()
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

On Wed, Sep 27, 2023 at 7:21=E2=80=AFAM Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> On Tue, Sep 26, 2023 at 11:47:46AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add helper to map driver name to chipset.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  lib/drmtest.c | 14 ++++++++++++++
> >  lib/drmtest.h |  1 +
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 2cfa8a899d53..4d826df744ae 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -608,6 +608,20 @@ static const char *chipset_to_str(int chipset)
> >       return (chipset =3D=3D DRIVER_ANY) ? "any" : "other";
> >  }
> >
> > +/**
> > + * drm_find_chipset:
> > + * @name: The driver name
> > + *
> > + * Map the driver name to DRIVER_xyz value.
> > + */
> > +int drm_find_chipset(const char *name)
> > +{
> > +     for (const struct module *m =3D modules; m->module; m++)
> > +             if (!strcmp(name, m->module))
> > +                     return m->bit;
>
> I would add likely igt_warn() or at least igt_debug() to emphasize
> there's likely invalid driver name passed to this function.

done, thx

> Apart of this patch seems to correct:
>
> Reviewed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> --
> Zbigniew
>
> > +     return 0;
> > +}
> > +
> >  /**
> >   * drm_open_driver:
> >   * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > index 97ab6e759edf..9a71e1041ce8 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -99,6 +99,7 @@ void __set_forced_driver(const char *name);
> >  #define ALIGN_DOWN(x, a)     ALIGN((x) - ((a) - 1), (a))
> >
> >  void drm_load_module(unsigned int chipset);
> > +int drm_find_chipset(const char *name);
> >  int drm_open_driver(int chipset);
> >  int drm_open_driver_master(int chipset);
> >  int drm_open_driver_render(int chipset);
> > --
> > 2.41.0
> >
