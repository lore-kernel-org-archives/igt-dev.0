Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A251CC6FD1F
	for <igt-dev@archiver.kernel.org>; Sat, 30 Mar 2024 14:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFBE10E41C;
	Sat, 30 Mar 2024 14:26:53 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AE710E468
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Mar 2024 14:26:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F7821BF204
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Mar 2024 14:26:49 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56d7a0cf96cso1353932a12.2
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Mar 2024 07:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWTZBYkmOGrBB3G3HwCW+IRElvHk4WEvNse13Fa0ML7bA/1a68rgcuj2+N/wf65NQUaoDKzkHjsFQ5k/v5ICSpZNPVOkzSmWQ7PbaVeUg==
X-Gm-Message-State: AOJu0Yznf8I9ETXi347zOKyzOEe+lT3pyYdFV59w94CN+8swzrhSldF7
 WF+FovpJzwfNlpKttGaxKhqVhVtZ1F41P7pD+QZx/rzX4GvKQv3Co4HEUMougI21C+TSDC7UO0r
 DqzVXh8cPoc+x6XvLVQ/1IYBUlZs=
X-Google-Smtp-Source: AGHT+IGiFGDsqC1l6smemUWQCespAzVefwvPkogaZfYzLxpWQoWLBafTGaqFLSouVHY2BXP4ggfNSaH4jOth5GGnwXw=
X-Received: by 2002:a17:906:c12:b0:a4a:3441:2e2a with SMTP id
 s18-20020a1709060c1200b00a4a34412e2amr3631010ejf.55.1711808809039; Sat, 30
 Mar 2024 07:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240327065928.5522-1-me@petersenna.com>
 <20240328124335.6109-1-me@petersenna.com>
 <20240328154923.bpwkpi5u3lfek4wj@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240328154923.bpwkpi5u3lfek4wj@kamilkon-desk.igk.intel.com>
From: Peter Senna Tschudin <me@petersenna.com>
Date: Sat, 30 Mar 2024 15:26:37 +0100
X-Gmail-Original-Message-ID: <CA+MoWDoPaSMd0Ki4GbX5t+9Ryxcgq0pFvxODAdpFUKn+XLeuWA@mail.gmail.com>
Message-ID: <CA+MoWDoPaSMd0Ki4GbX5t+9Ryxcgq0pFvxODAdpFUKn+XLeuWA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v5] tests/intel/gem_exec_capture: Fix many-* subtests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: andi.shyti@linux.intel.com
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

Hi Kamil,

Thanks again!

On Thu, Mar 28, 2024 at 4:49=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Peter,
> On 2024-03-28 at 13:42:51 +0100, Peter Senna Tschudin wrote:
> > This patch fixes the tests many-4k-incremental and many-4k-zero from
> > gem_exec_capture that are currently failing with an invalid file
> > descriptor error.
> >
> > tests/intel/gem_exec_capture.c
> >     many(), userptr(), capture_invisible()
>
> Please cite error log, delete two above lines and write that problem
> is with macro find_first_available_engine() (you later describe in datail=
s).
>
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
> > region, to avoid the block scope of ed. `e =3D &saved.engine;` updates =
e
> > to point to the same content but without scope restrictions as both
> > saved and e have the scope of the calling function.
> >
> > v5: Update subject and commit message.
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
> >                               break; \
> > +                     }  \
> > +             e =3D &saved.engine; \
>
> Ok, we need 'e' later on, so it is ok.
>
> >               igt_assert(e); \
>
> But this assert do no work, it will always succeed. Imho here
> code should check if it actually saved anything, so what about:

That was my bad, sorry. igt_assert(e) should be before the call to
configure_hangs() because 'e' is set by intel_get_current_engine()
which can return null.

>
> #define find_first_available_engine(fd, ctx, e, saved) \
>     do { \
>         bool no_dw_store_engine =3D true; \
>         \
>         ctx =3D intel_ctx_create_all_physical(fd); \
>         igt_assert(ctx); \
>         for_each_ctx_engine(fd, ctx, e) \
>             for_each_if(gem_class_can_store_dword(fd, e->class)) { \
>                 saved =3D configure_hangs(fd, e, ctx->id); \
>                 no_dw_store_engine =3D false; \
>                 break; \
>             }  \
>         e =3D &saved.engine; \
>         igt_skip_on(no_dw_store_engine); \
>     } while(0)

Yes! I sent a slightly different version skipping the test when
gem_class_can_store_dword() returns false. I sent a second patch for
this, in the hopes that having two patches is the "correct" way.

[...]
