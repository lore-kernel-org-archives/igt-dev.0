Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA7B10E05E
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 17:33:08 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50435ad51bbso16968559e87.2
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 10:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230926184748.199187-1-robdclark@gmail.com>
 <20230927160931.m34jkwcwn6l3yf5w@kamilkon-desk.igk.intel.com>
In-Reply-To: <20230927160931.m34jkwcwn6l3yf5w@kamilkon-desk.igk.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 27 Sep 2023 10:32:54 -0700
Message-ID: <CAF6AEGtKBhd7Ybbq=mxvcnhuP4zPcqG7P4ni7E0bTgPO5b02qQ@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Emma Anholt <emma@anholt.net>,
 Helen Koike <helen.koike@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH 1/3] lib/drmtest: Use module table for
 chipset_to_str()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 9:13=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2023-09-26 at 11:47:45 -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Use the existing table, so there is one fewer place to update to add
> > support for a new driver.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  lib/drmtest.c | 29 +++++------------------------
> >  1 file changed, 5 insertions(+), 24 deletions(-)
> >
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index e1da66c877e9..2cfa8a899d53 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -601,30 +601,11 @@ static void cancel_work_at_exit_render(int sig)
> >
> >  static const char *chipset_to_str(int chipset)
> >  {
> > -     switch (chipset) {
> > -     case DRIVER_INTEL:
> > -             return "intel";
> --------------- ^^^^^
> This will change into "i915" and break compatibility with older
> tests, so imho leave this function as is and add new one:

The only caller seems to be drm_open_driver() for an error msg, so I
think this will be fine

BR,
-R

> static const char *chipset_to_module_str(int chipset)
>
> Regards,
> Kamil
>
> > -     case DRIVER_V3D:
> > -             return "v3d";
> > -     case DRIVER_VC4:
> > -             return "vc4";
> > -     case DRIVER_VGEM:
> > -             return "vgem";
> > -     case DRIVER_AMDGPU:
> > -             return "amdgpu";
> > -     case DRIVER_PANFROST:
> > -             return "panfrost";
> > -     case DRIVER_MSM:
> > -             return "msm";
> > -     case DRIVER_XE:
> > -             return "xe";
> > -     case DRIVER_VMWGFX:
> > -             return "vmwgfx";
> > -     case DRIVER_ANY:
> > -             return "any";
> > -     default:
> > -             return "other";
> > -     }
> > +     for (const struct module *m =3D modules; m->module; m++)
> > -             return "intel";
> > +             if (m->bit =3D=3D chipset)
> > +                     return m->module;
> > +
> > +     return (chipset =3D=3D DRIVER_ANY) ? "any" : "other";
> >  }
> >
> >  /**
> > --
> > 2.41.0
> >
