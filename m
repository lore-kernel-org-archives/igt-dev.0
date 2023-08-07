Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30A810E20E
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 19:57:54 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe58faa5cfso5515381e87.3
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Aug 2023 12:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230807163634.205167-1-robdclark@gmail.com>
 <f0aee465-3e20-dac2-a16c-5bcff746e0d6@intel.com>
In-Reply-To: <f0aee465-3e20-dac2-a16c-5bcff746e0d6@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 7 Aug 2023 12:57:40 -0700
Message-ID: <CAF6AEGsyu-0NDr1OCNo99LJ-8_3=Qf-SYmaZWt35BO6sY7eEnA@mail.gmail.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH v2] tests/kms_plane: Handle hw without legacy
 gamma support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 7, 2023 at 11:57=E2=80=AFAM Modem, Bhanuprakash
<bhanuprakash.modem@intel.com> wrote:
>
>
>
> On Mon-07-08-2023 10:06 pm, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Skip the tests which require legacy gamma, instead of failing, if the h=
w
> > does not support legacy gamma.
> >
> > v2: igt_require(lut_size > 0) instead
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   tests/kms_plane.c | 9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> > index 67cff61d6cd1..2df1d2f0aeee 100644
> > --- a/tests/kms_plane.c
> > +++ b/tests/kms_plane.c
> > @@ -463,19 +463,22 @@ static void set_legacy_lut(data_t *data, enum pip=
e pipe,
> >       igt_pipe_t *pipe_obj =3D &data->display.pipes[pipe];
> >       drmModeCrtc *crtc;
> >       uint16_t *lut;
> > -     int i, lut_size;
> > +     int i, lut_size, ret;
> >
> >       crtc =3D drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
> >       lut_size =3D crtc->gamma_size;
> >       drmModeFreeCrtc(crtc);
> >
> > +     igt_require(lut_size > 0);
> > +
> >       lut =3D malloc(sizeof(uint16_t) * lut_size);
> >
> >       for (i =3D 0; i < lut_size; i++)
> >               lut[i] =3D (i * 0xffff / (lut_size - 1)) & mask;
> >
> > -     igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id=
,
> > -                                       lut_size, lut, lut, lut), 0);
> > +     ret =3D drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
> > +                               lut_size, lut, lut, lut);
> > +     igt_assert_eq(ret, 0);
>
> Unrelated change. What is wrong with this check?

yes, please see v3


> - Bhanu
>
> >
> >       free(lut);
> >   }
