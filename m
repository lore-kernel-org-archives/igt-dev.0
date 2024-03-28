Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3209AC54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 07:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B368510F71E;
	Thu, 28 Mar 2024 07:10:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA1210F71E
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 07:10:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15E56C0007
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 07:10:33 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a46a7208eedso83281466b.0
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 00:10:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVXUtbU0urSmP1CNmaca3cCg0DfSjfyfaEf8cT2FzUCCVriBmt3TlsEodMqgEoWa3sU74MvAb5uaVrmddSAyADPT11ZbZgdyiYKO1U0gw==
X-Gm-Message-State: AOJu0Yz2je6Fyah+uMeUKvIJUh3KRLiVsYYdNcjxw5Ml0yKvM9T98uaC
 YR+JbaZ6Bk/cCJoLmm/j4I0eyZDYlFBP0tV+dkMUTpukxZa8olfJl4O4f1NNTcqSkQkXlAvRt8+
 IS9moSumQbYAz7/85gv2AsxX3P74=
X-Google-Smtp-Source: AGHT+IG/txYgIDu45ga1Wp7NstkYMX0IZr3CquBhFmQHIGuWBf/x8Z+Gaw54vqhDXe2H49CLUyCGOfyVtaPHb99+Km4=
X-Received: by 2002:a17:907:9811:b0:a47:61cd:2b51 with SMTP id
 ji17-20020a170907981100b00a4761cd2b51mr1360899ejc.2.1711609833542; Thu, 28
 Mar 2024 00:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240327065928.5522-1-me@petersenna.com>
 <20240327184330.a3be36wl6tzveqrq@kamilkon-desk.igk.intel.com>
 <CA+MoWDrg0O+nTtJ-qDBQrkodz93YUZ=PUBPtCaPGGNzwWrcmuA@mail.gmail.com>
In-Reply-To: <CA+MoWDrg0O+nTtJ-qDBQrkodz93YUZ=PUBPtCaPGGNzwWrcmuA@mail.gmail.com>
From: Peter Senna Tschudin <me@petersenna.com>
Date: Thu, 28 Mar 2024 08:10:20 +0100
X-Gmail-Original-Message-ID: <CA+MoWDrN2LaPiEwNBUsPxCfUVDQOJ_ZefQjDqZfe3qscX1+9Ng@mail.gmail.com>
Message-ID: <CA+MoWDrN2LaPiEwNBUsPxCfUVDQOJ_ZefQjDqZfe3qscX1+9Ng@mail.gmail.com>
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

On Thu, Mar 28, 2024 at 7:55=E2=80=AFAM Peter Senna Tschudin <me@petersenna=
.com> wrote:
>
> On Wed, Mar 27, 2024 at 7:43=E2=80=AFPM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
> >
> > Hi Peter,
> > On 2024-03-27 at 07:59:27 +0100, Peter Senna Tschudin wrote:
> >
> > One nit about subject, as you can see on patchwork
> > https://patchwork.freedesktop.org/project/igt/series/?ordering=3D-last_=
updated
> >
> > we use test name as prefix for a patch, so instead of:
> >
> > [PATCH i-g-t v4] Fix memory access issue due to variable block
> >
> > it should be:
> >
> > [PATCH i-g-t v4] tests/intel/gem_exec_capture: Fix many-* subtests
>
> Oops, my bad. Thank you for pointing this out, I will fix it.
>
> >
> > > This patch fixes the tests many-4k-incremental and many-4k-zero from
> > > gem_exec_capture that are currently failing with an invalid file
> > > descriptor error.
> > >
> > > tests/intel/gem_exec_capture.c
> > >     many(), userptr(), capture_invisible()
> > >         find_first_available_engine()
> > >             for_each_ctx_engine()
> > >                 for_each_ctx_cfg_engine()
> > >
> > > find_first_available_engine() expects a struct intel_execution_engine=
2
> > > *e as parameter. for_each_ctx_cfg_engine() allocates a struct
> > > intel_engine_data ed inside a for loop and then update e to point to =
an
> > > element of ed.
> > >
> > > The problem is that ed has the block scope of the for loop, and tryin=
g
> > > to access its content through e after the for loop has ended creates
> > > undefined behavior.
> > >
> > > This patch updates e to point to the same content at a different memo=
ry
> > > region, to avoid the block scope of ed.
> > >
> > > v4: Move `saved =3D configure_hangs(fd, e, ctx->id);` to inside the f=
or
> > > loop where it is safe to use 'e'. This is because 'e' points to an
> > > element of a variable that is defined with the block scope of the for
> > > loop.
> >
> > Yes, this way it works but I still think it would be better
> > to use function for it.
>
> I have been there and I failed to find what better means. The core of
> the problem is assigning a component from ed to e. In the macro it
> does not work because ed has the scope of the for loop. Using a
> function simply changes the scope of ed from the for loop to the
> function and the same problem happens. Solutions include:
>  - Adding `e =3D &saved.engine;` at the end of the function. This
> updates e to an address without scope limitations. (saved is returned
> by the function)
>  - Making ed static: Elegant but will break the code if there is ever
> concurrency
>  - Removing e from the function arguments. This is ok, but then after
> calling the function we will need to add `e =3D &saved.engine;`
>
> So as the best solution seems to be adding `e =3D &saved.engine;` at the
> end of the function, doing that at the existing macro felt like a
> better approach.
>
> >
> > >
> > > Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
> > > ---
> > >  tests/intel/gem_exec_capture.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_ca=
pture.c
> > > index 57b178f3e..f7b10bdd4 100644
> > > --- a/tests/intel/gem_exec_capture.c
> > > +++ b/tests/intel/gem_exec_capture.c
> > > @@ -665,10 +665,12 @@ static bool needs_recoverable_ctx(int fd)
> > >               ctx =3D intel_ctx_create_all_physical(fd); \
> > >               igt_assert(ctx); \
> > >               for_each_ctx_engine(fd, ctx, e) \
> > > -                     for_each_if(gem_class_can_store_dword(fd, e->cl=
ass)) \
> > > +                     for_each_if(gem_class_can_store_dword(fd, e->cl=
ass)) { \
> > > +                             saved =3D configure_hangs(fd, e, ctx->i=
d); \
> >
> > Yes, it is a fix for a problem but something strange is
> > happening here, imho we need to debug it more.
> >
> > >                               break; \
> > >               } \
> > >               e =3D &saved.engine; \
> > >                       igt_assert(e); \
> >
> > Two above lines are not needed, 'e' will always be !=3D NULL.
>
> The  `igt_assert(e);` was already there and I kept it. The other line
> is the actual fix for the problem. `e =3D &saved.engine;` updates e to
> point to the same content but to an address that has no scope
> limitation. There is no scope restrictions because saved is returned
> by the function.

Oops, there is no scope restrictions because 'saved' and 'e' are both
defined in many(), the function that calls
find_first_available_engine(). The change I am proposing is safe
because 'saved' and 'e' have the same variable scope: the function
many(). Before my change, 'e' had the broad scope of many() while it
was pointing to 'ed' which had the very limited scope of the
for_each_ctx_engine() macro.
