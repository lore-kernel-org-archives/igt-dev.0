Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3168C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 06:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4819A10F39E;
	Thu, 28 Mar 2024 06:55:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAC010F39E
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 06:55:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEB7F20005
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 06:55:33 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-515c3eeea5dso516704e87.1
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 23:55:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXEdmZs2kpu5UlGC5QypYPIZcV7KbizWeRFjUb0VZAU1l5/fjKm+h0ERiANlXL5qo38fe2C5O7rI7VLoC2cIGeOBizswYkMflfNP2Cwag==
X-Gm-Message-State: AOJu0YyOFLRxhTb3S/HiO7CYeaG+xic+roLSz1oqsD6Lxh2HblOJHHwt
 xeJd27lcG2MfY1Nln2V7UEzDaZbzTyhAdxG1a8pzc04dY/UM5x5Keb9XpdECoxk3YiUsaAOQ1gA
 wzVbCdBf0feHGESM5niNdegKmPVM=
X-Google-Smtp-Source: AGHT+IHf13n/94uUOle7XUh57Mvnz83sIpPKH0S8jxiwRtaLs8O1ajCz6eQCbk1XxmB8KrihyWlcC+P3zDimSl9ywpk=
X-Received: by 2002:a19:e056:0:b0:513:e63c:cfe7 with SMTP id
 g22-20020a19e056000000b00513e63ccfe7mr1033301lfj.66.1711608933140; Wed, 27
 Mar 2024 23:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240327065928.5522-1-me@petersenna.com>
 <20240327184330.a3be36wl6tzveqrq@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240327184330.a3be36wl6tzveqrq@kamilkon-desk.igk.intel.com>
From: Peter Senna Tschudin <me@petersenna.com>
Date: Thu, 28 Mar 2024 07:55:17 +0100
X-Gmail-Original-Message-ID: <CA+MoWDrg0O+nTtJ-qDBQrkodz93YUZ=PUBPtCaPGGNzwWrcmuA@mail.gmail.com>
Message-ID: <CA+MoWDrg0O+nTtJ-qDBQrkodz93YUZ=PUBPtCaPGGNzwWrcmuA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v4] Fix memory access issue due to variable block
 scope
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, andi.shyti@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: me@petersenna.com
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
Reply-To: peter.senna@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Mar 27, 2024 at 7:43=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Peter,
> On 2024-03-27 at 07:59:27 +0100, Peter Senna Tschudin wrote:
>
> One nit about subject, as you can see on patchwork
> https://patchwork.freedesktop.org/project/igt/series/?ordering=3D-last_up=
dated
>
> we use test name as prefix for a patch, so instead of:
>
> [PATCH i-g-t v4] Fix memory access issue due to variable block
>
> it should be:
>
> [PATCH i-g-t v4] tests/intel/gem_exec_capture: Fix many-* subtests

Oops, my bad. Thank you for pointing this out, I will fix it.

>
> > This patch fixes the tests many-4k-incremental and many-4k-zero from
> > gem_exec_capture that are currently failing with an invalid file
> > descriptor error.
> >
> > tests/intel/gem_exec_capture.c
> >     many(), userptr(), capture_invisible()
> >         find_first_available_engine()
> >             for_each_ctx_engine()
> >                 for_each_ctx_cfg_engine()
> >
> > find_first_available_engine() expects a struct intel_execution_engine2
> > *e as parameter. for_each_ctx_cfg_engine() allocates a struct
> > intel_engine_data ed inside a for loop and then update e to point to an
> > element of ed.
> >
> > The problem is that ed has the block scope of the for loop, and trying
> > to access its content through e after the for loop has ended creates
> > undefined behavior.
> >
> > This patch updates e to point to the same content at a different memory
> > region, to avoid the block scope of ed.
> >
> > v4: Move `saved =3D configure_hangs(fd, e, ctx->id);` to inside the for
> > loop where it is safe to use 'e'. This is because 'e' points to an
> > element of a variable that is defined with the block scope of the for
> > loop.
>
> Yes, this way it works but I still think it would be better
> to use function for it.

I have been there and I failed to find what better means. The core of
the problem is assigning a component from ed to e. In the macro it
does not work because ed has the scope of the for loop. Using a
function simply changes the scope of ed from the for loop to the
function and the same problem happens. Solutions include:
 - Adding `e =3D &saved.engine;` at the end of the function. This
updates e to an address without scope limitations. (saved is returned
by the function)
 - Making ed static: Elegant but will break the code if there is ever
concurrency
 - Removing e from the function arguments. This is ok, but then after
calling the function we will need to add `e =3D &saved.engine;`

So as the best solution seems to be adding `e =3D &saved.engine;` at the
end of the function, doing that at the existing macro felt like a
better approach.

>
> >
> > Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
> > ---
> >  tests/intel/gem_exec_capture.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capt=
ure.c
> > index 57b178f3e..f7b10bdd4 100644
> > --- a/tests/intel/gem_exec_capture.c
> > +++ b/tests/intel/gem_exec_capture.c
> > @@ -665,10 +665,12 @@ static bool needs_recoverable_ctx(int fd)
> >               ctx =3D intel_ctx_create_all_physical(fd); \
> >               igt_assert(ctx); \
> >               for_each_ctx_engine(fd, ctx, e) \
> > -                     for_each_if(gem_class_can_store_dword(fd, e->clas=
s)) \
> > +                     for_each_if(gem_class_can_store_dword(fd, e->clas=
s)) { \
> > +                             saved =3D configure_hangs(fd, e, ctx->id)=
; \
>
> Yes, it is a fix for a problem but something strange is
> happening here, imho we need to debug it more.
>
> >                               break; \
> >               } \
> >               e =3D &saved.engine; \
> >                       igt_assert(e); \
>
> Two above lines are not needed, 'e' will always be !=3D NULL.

The  `igt_assert(e);` was already there and I kept it. The other line
is the actual fix for the problem. `e =3D &saved.engine;` updates e to
point to the same content but to an address that has no scope
limitation. There is no scope restrictions because saved is returned
by the function.

[...]
