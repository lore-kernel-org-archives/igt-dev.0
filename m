Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB11410E0E0
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 18:48:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5232bb5e47bso2741802a12.2
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Aug 2023 11:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230807165411.206456-1-robdclark@gmail.com>
 <90bf29f0-a403-5cd0-680f-fc8595e64627@gmail.com>
In-Reply-To: <90bf29f0-a403-5cd0-680f-fc8595e64627@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 7 Aug 2023 11:48:37 -0700
Message-ID: <CAF6AEGt=_1akyV1OaxksO8qJ5ysdhfk_1ix0K+wmEDP+th4joA@mail.gmail.com>
To: juhapekka.heikkila@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH v3] tests/kms_plane: Handle hw without legacy
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

On Mon, Aug 7, 2023 at 11:29=E2=80=AFAM Juha-Pekka Heikkila
<juhapekka.heikkila@gmail.com> wrote:
>
> Hi Rob,
>
> On 7.8.2023 19.54, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Skip the tests which require legacy gamma, instead of failing, if the h=
w
> > does not support legacy gamma.
> >
> > v2: igt_require(lut_size > 0) instead
> > v3: simplify patch
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   tests/kms_plane.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> > index 67cff61d6cd1..44cad2bf2491 100644
> > --- a/tests/kms_plane.c
> > +++ b/tests/kms_plane.c
> > @@ -469,6 +469,8 @@ static void set_legacy_lut(data_t *data, enum pipe =
pipe,
> >       lut_size =3D crtc->gamma_size;
> >       drmModeFreeCrtc(crtc);
> >
> > +     igt_require(lut_size > 0);
> > +
>
> Is this something you really want on your hw? This lut stuff is
> originally coming from this patch
>
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/093fa482371795c=
3aa246509994eb21907f501b9
>
> where it is mentioned:
>
> ---
> We also abuse the legacy LUT to drop the precision down to 6 bits
> so that still errors causes by the RGB<->YCbCr conversion end up
> being ignored.
> ---
>
> With your change you'd skip testing of all available pixel
> formats/modifiers combos on your driver while originally this feature is
> mostly intended just to avoid hitting Intel hw related anomalies. Do
> those tests work for you if you just not set that lut?

Hmm, I get failures, but at least part of that seems to be igt being
unaware of qcom/msm modifiers..  I'll need to investigate further

BR,
-R

> /Juha-Pekka
>
> >       lut =3D malloc(sizeof(uint16_t) * lut_size);
> >
> >       for (i =3D 0; i < lut_size; i++)
>
