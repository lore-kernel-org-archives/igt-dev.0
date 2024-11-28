Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E4CD69112
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 14:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D873510ECC2;
	Thu, 28 Nov 2024 14:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KmIwyTU9";
	dkim-atps=neutral
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F9F10ECC2
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 14:05:48 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-724ffe64923so919062b3a.2
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 06:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732802748; x=1733407548; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jka5+PA+ugKIElQ9uC4xFW5xRNFe0DzlHa1l8/NlEtw=;
 b=KmIwyTU9x6uLMiZGoZ6svQpNu9K5ROxeOipNE2IWbSz0Dhkqmg79QjhQCbNNEVy16h
 od8DS9+CvgfVM7huZZid5g0AWK+u/UUKNrpzAtas2QpMcnC7InVjcAsvdQ4PaCcsfiYZ
 pX+zzcBHa5fyu93nb0f33dkREpL4QusIoQ4qwp1P6KnwS6ip05iZ4TtuW4sVnh+tn7U0
 /fcKmMjGNu5QhGTapyG81hRgc9lrx2FDBcI0oJ9l5ApzkPYsF6KcUYw4OcGGW6yUFBH6
 I0xXIfxSWRs0tc8Xxvzy8n9Z/ANB/PKtdfZ5ShSiumzsvOQH/TIE1Ni8oSTaVqYioYvI
 gdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732802748; x=1733407548;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jka5+PA+ugKIElQ9uC4xFW5xRNFe0DzlHa1l8/NlEtw=;
 b=S7fMxYPIiCZAjdGyN6EHvlyocL2L8RjaXoSuG1S02O4PRXj+JeAYp//VglBZsmE/yl
 EoW2+tJKQN0E4Tn6h54HWrzGB/ihjML8AvhnlBk0QeBw9nXlJmn9XmYJTHyWcSI6O9xT
 fG3djivnfV7ryCD3wzB+CqFzsxF+9kLSwKs3cljv3DN2H4sw/QGDEdr5lw39JdBA2d88
 rGT9rvTrlblngkg57Ku7adU3FWlrb3HiUuJRXPVUTSASfJi6Ug7YCDHcS6RjGl4217qe
 2tIiyy96ivwUmm4N0Fc32MT7OzHvZRRWc2vN5G0LNLaAdCgTDMqwUGYm7sHAVRKwMmPG
 rtcw==
X-Gm-Message-State: AOJu0YyizTzwDTVJqTzBH0U8eMj+lSaXyvq8oSlUtN+SN+NbZBzuyTVQ
 meQ8Dzr8BHbyfE028JhSAFrAuy261/77mKNAXC46ECkeH4K0NZ3bHqEU0ps2EIFa9HdmGIyx/FP
 UM/Zpe3QMcZ7W07W5aMejxIN7riY=
X-Gm-Gg: ASbGnctW43nX+LV60SIk4r8oiLDuZiBAjpWSfy7VFzunftvGXEInjdPFvbo6NWH4sl2
 q1UsAlVr0xtiAjtO7C3wr/mWcD5kPUNxypA==
X-Google-Smtp-Source: AGHT+IEnGyz6NAKeiFbCLqw8TlaxowwJUUgnzO8WlMP/X9dxdf4E8KiqANgA85MqGqUBnHnPbbk/KsYJrbnHqpjR7Ss=
X-Received: by 2002:a17:90b:3947:b0:2ea:9309:75b3 with SMTP id
 98e67ed59e1d1-2ee08e9d29amr8376252a91.2.1732802747992; Thu, 28 Nov 2024
 06:05:47 -0800 (PST)
MIME-Version: 1.0
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
 <20241114190339.3885752-6-clinton.a.taylor@intel.com>
 <20241115133105.o7772oanzhwk2kil@kamilkon-desk.igk.intel.com>
 <9a959681ca5fad5d62b7d4fa21deadaf3005ac40.camel@intel.com>
In-Reply-To: <9a959681ca5fad5d62b7d4fa21deadaf3005ac40.camel@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 28 Nov 2024 16:05:36 +0200
Message-ID: <CAJ=qYWSPYBcpBFd+=OwjyFxZ9GDu3HtJ6dVj05yR19M2J8KBGw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v3 5/9] XE3: tests/kms_addfb_basic: fix x-tiled
 tests for case when there is no x-tile
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi,

To be honest this is minor issue to me. Originally Intel IT tools set
my name as is seen on the original s-o-b and in the past years I
didn't care enough as changing that from default. I don't think anyone
mistakes me for someone else in any of these ways of spelling my name
but changing it for this patch will cause s-o-b not to match any of
the previous if someone need to go grepping it.

/Juha-Pekka

On Sat, Nov 16, 2024 at 1:42=E2=80=AFAM Taylor, Clinton A
<clinton.a.taylor@intel.com> wrote:
>
> On Fri, 2024-11-15 at 14:31 +0100, Kamil Konieczny wrote:
> > Hi Clint,
> > On 2024-11-14 at 11:03:35 -0800, Clint Taylor wrote:
> > > From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
> >
> > Please use correct names here, it should be:
> >
> > > From: "Juha-pekka Heikkila" <juha-pekka.heikkila@intel.com>
> > > On Xe3 display no more support x-tile and will disable such framebuff=
ers
> > >
> > > Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
> >
> > and here:
> >
> > Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> >
> > Please do the same corrections in other patches in this series.
> >
>   I will ask JP if it's ok to change the original SOB and Author lines. T=
hey were
> originally committed this way.
>
>
> -Clint
>
> > Regards,
> > Kamil
> >
> > > Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> > > ---
> > >  tests/kms_addfb_basic.c | 22 ++++++++++++----------
> > >  1 file changed, 12 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> > > index b22818592..3ba87117b 100644
> > > --- a/tests/kms_addfb_basic.c
> > > +++ b/tests/kms_addfb_basic.c
> > > @@ -217,6 +217,12 @@ static int legacy_addfb(int fd, struct drm_mode_=
fb_cmd *arg)
> > >     return err;
> > >  }
> > >
> > > +static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_f=
b_cmd2 *f)
> > > +{
> > > +   return igt_display_has_format_mod(disp, f->pixel_format,
> > > +                                     f->modifier[0]) ? 0 : -1;
> > > +}
> > > +
> > >  static void invalid_tests(int fd)
> > >  {
> > >     struct drm_mode_fb_cmd2 f =3D {};
> > > @@ -735,8 +741,10 @@ static void addfb25_tests(int fd)
> > >             igt_describe("Check if addfb2 call works for x-tiling");
> > >             igt_subtest("addfb25-x-tiled-legacy") {
> > >                     f.modifier[0] =3D I915_FORMAT_MOD_X_TILED;
> > > -                   do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> > > -                   do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
> > > +                   igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2,=
 &f),
> > > +                                 addfb_expected_ret(&display, &f));
> > > +                   if (!addfb_expected_ret(&display, &f))
> > > +                           do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_i=
d);
> > >                     f.fb_id =3D 0;
> > >             }
> > >
> > > @@ -756,12 +764,6 @@ static void addfb25_tests(int fd)
> > >             gem_close(fd, gem_bo);
> > >  }
> > >
> > > -static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_f=
b_cmd2 *f)
> > > -{
> > > -   return igt_display_has_format_mod(disp, f->pixel_format,
> > > -                                     f->modifier[0]) ? 0 : -1;
> > > -}
> > > -
> > >  static void addfb25_ytile(int fd)
> > >  {
> > >     struct drm_mode_fb_cmd2 f =3D {};
> > > @@ -1012,8 +1014,6 @@ igt_main
> > >
> > >     master_tests(fd);
> > >
> > > -   addfb25_tests(fd);
> > > -
> > >     tiling_tests(fd);
> > >
> > >     igt_subtest_group {
> > > @@ -1025,6 +1025,8 @@ igt_main
> > >             igt_fixture
> > >                     igt_require_intel(fd);
> > >
> > > +           addfb25_tests(fd);
> > > +
> > >             addfb25_ytile(fd);
> > >
> > >             addfb25_4tile(fd);
> > > --
> > > 2.25.1
> > >
