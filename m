Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDC3C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 18:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196A910E1A2;
	Mon, 19 Aug 2024 18:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jL7M2mfF";
	dkim-atps=neutral
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB0510E1A2
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 18:25:17 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5bec7d380caso3810783a12.3
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724091916; x=1724696716; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AHvdMsLUqITH6ZyWKGAoiCEhmD5cJ3NP/2M/Z3hbVm0=;
 b=jL7M2mfFkqWQDUujqUg2SXt/bZIjywNg09nslkiDeAS0CsrZQhiCb/I+lJYVmg06+n
 1jSAiY5iCWiFn+V72cXcZbc2eMY8SYfcmw2nY8QVyECPNlHQiL3bEmRrPv0EpTZx5xiT
 q806fvQno68hra1NsxU+gPdzVfVEMG9g2bzx2QjGm0IO0L4q22Y7ncFsgA64568PURYq
 iOIk1w3bAzyDCNEDHhsRlK79jQDbtnZ2/8EIP9OftHFPlNJxrSyuTIP+d/UuBzS3Q+pS
 VKt/YyZN/Rb0oUoDkR2iaKrHEb4HYvLDiK/azMJ1Jf4Z0SfschvFFMuAXQCM9QssR2P0
 22jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724091916; x=1724696716;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AHvdMsLUqITH6ZyWKGAoiCEhmD5cJ3NP/2M/Z3hbVm0=;
 b=wiNYuyvGJsfClPsOt2zPfERRCUCPTW96FzZadpxiUgUH2rDg7hGncfT34uWNRDZ078
 ApnJEipF8aBB2YXFuV1Cjj0FRzf6xj4HlnuBCGqQL/X0+Rq7r7YA38Oep0BeoBh82RrY
 H6mrQBJggrTV6EjSpnxVkcNnhLW7ygf90Y1xr45sSSW9N6wZJNWxemMmuIe4tDLRSQdQ
 R7fHn/S4i5o7ZSkjfYYFbCZO6Nx5e4LkwnJVy+Sf/qAMgkTPZBi7KV8XNJkQW3KBUXAj
 NElKeFaMTm84v0d6dUETmTl3DBB19fpDyMWlZId1GkO+fvhE+IwOqinpJc9MaQKLq2KW
 fdOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAVE6NdfZPcUzgNjtsHrvtgLAB9zvTNtz2IIHF/pRQpjj7CbA/bfOhLNkULoTrC32Hoj0DXmMp@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5U9o6M8j83BoXgIHDy2Y0tCqOAJvUws7QT73Svxc2vddfRMzu
 yUh68YZ1WfE5wtBNe+4O81cHpd5iQOomrP/zBUE9fPmPA/fSL7BDpHzJMy0eP+49enAasidPZFi
 DsY0BgFXvRBpO3buDJNIgKfKWScg=
X-Google-Smtp-Source: AGHT+IFmUviUFM7OfoIdp8ZwT2dcHG3iVXSQ4CIFf3wQfkXvKFYrMqYaYsouxkxWdKZn8pDyWiCOdhbdeFzvh6JeL8Q=
X-Received: by 2002:a05:6402:3590:b0:5be:e887:c667 with SMTP id
 4fb4d7f45d1cf-5bee887c7cdmr5501157a12.33.1724091915390; Mon, 19 Aug 2024
 11:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240814185426.70418-1-robdclark@gmail.com>
 <20240819171618.hs2jssfois4mgbjm@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240819171618.hs2jssfois4mgbjm@kamilkon-DESK.igk.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 Aug 2024 11:25:01 -0700
Message-ID: <CAF6AEGsxK29G8ZzOhxQhfXquibJ5Gdf5rTtbUAbpSUHB=nYCbg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dumb_buffer: Remove invalid-bpp subtest
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, 
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
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

On Mon, Aug 19, 2024 at 10:16=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2024-08-14 at 11:54:25 -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > These allocations are not necessarily invalid.
>
> Please write a little more why. Also look at gitlab log,
> you need to delete comments with this subtest name and description
> as our CI is creating testlist at build time and that info
> is there.
>
> Add also tests/ prefix in subject:
>
> [PATCH 1/2] tests/dumb_buffer: Remove invalid-bpp subtest
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  tests/dumb_buffer.c | 22 ----------------------
> >  1 file changed, 22 deletions(-)
> >
> > diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> > index 1d4bf296c53e..579d2f906b6d 100644
> > --- a/tests/dumb_buffer.c
> > +++ b/tests/dumb_buffer.c
> > @@ -136,25 +136,6 @@ static void dumb_destroy(int fd, uint32_t handle)
> >       igt_assert_eq(__dumb_destroy(fd, handle), 0);
> >  }
> >
> > -static void invalid_dimensions_test(int fd)
> > -{
> > -     struct drm_mode_create_dumb create;
> > -
> > -     memset(&create, 0, sizeof(create));
> > -     create.width =3D 4032;
> > -     create.height =3D 2016;
> > -     create.bpp =3D 24;
> > -     igt_assert_eq(__dumb_create(fd, &create), -EINVAL);
>
> These use 3-Bytes bpp with divisible by 4 screen W x H, so here
> you could be right with removing this.

I guess I could instead create.bpp =3D 0, since that is the only case
that the kernel actually rejects

BR,
-R

>
> > -
> > -     create.bpp =3D 32;
> > -     create.width =3D 0;
> > -     igt_assert_eq(__dumb_create(fd, &create), -EINVAL);
>
> Why 0-width is valid?
>
> > -
> > -     create.width =3D 4032;
> > -     create.height =3D 0;
> > -     igt_assert_eq(__dumb_create(fd, &create), -EINVAL);
>
> Same here, imho looks invalid. Btw what about other settings?
> Like bpp not divisible by 8 bits?
>
> Regards,
> Kamil
>
> > -}
> > -
> >  static void valid_dumb_creation_test(int fd)
> >  {
> >       struct drm_mode_create_dumb create =3D {
> > @@ -397,9 +378,6 @@ igt_main
> >               fd =3D drm_open_driver(DRIVER_ANY);
> >       }
> >
> > -     igt_subtest("invalid-bpp")
> > -             invalid_dimensions_test(fd);
> > -
> >       igt_subtest("create-valid-dumb")
> >               valid_dumb_creation_test(fd);
> >
> > --
> > 2.46.0
> >
