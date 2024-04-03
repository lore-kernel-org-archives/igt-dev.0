Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506EFCD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 13:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56E210EA40;
	Wed,  3 Apr 2024 13:58:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F70B10EA40
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 13:58:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D55A21C0003
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 13:58:51 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so1760184a12.1
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Apr 2024 06:58:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU5E+qFY3VDs4+T1er9kfSUVZQU+t3XTJXGTheO+XflF2tXWssumuLXB1I7w+kOx0uOBz0UauN9xHvtVrveXBhxSSUwq6Wq7DY5vcBSSQ==
X-Gm-Message-State: AOJu0Yy8jbBDB71W15HC71WOhLXTAHwrWskCzb9QnedXmbs56EQLGPzj
 DaetHVlS7Si8n5j6mSY9dR6x6X6cZ4oBOf6rjaxrkx2hV/KcITx4zUw4HdZ6whFrpP9T4HCHBRa
 p2Y3agQHi7ATT84gEhwjYsm5KRI8=
X-Google-Smtp-Source: AGHT+IEHgo/JPVFsnHpaLp+00SWrOg3SPoT5FT2oUc+882G5foBs3Mh+eErs61nk9K1c/+hADqa8yaPFGq2DE43wg4k=
X-Received: by 2002:a17:906:f912:b0:a4e:13ee:5dec with SMTP id
 lc18-20020a170906f91200b00a4e13ee5decmr2460003ejb.17.1712152731268; Wed, 03
 Apr 2024 06:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240327065928.5522-1-me@petersenna.com>
 <20240330141951.84598-1-me@petersenna.com>
 <20240330141951.84598-2-me@petersenna.com>
 <20240402161725.sdoizdpsm73yj47a@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240402161725.sdoizdpsm73yj47a@kamilkon-desk.igk.intel.com>
From: Peter Senna Tschudin <me@petersenna.com>
Date: Wed, 3 Apr 2024 15:58:39 +0200
X-Gmail-Original-Message-ID: <CA+MoWDrEKv-ZSOPyDcK7mWYoaAftOCq5ztT-AcqShjNBuL9Gyg@mail.gmail.com>
Message-ID: <CA+MoWDrEKv-ZSOPyDcK7mWYoaAftOCq5ztT-AcqShjNBuL9Gyg@mail.gmail.com>
Subject: Re: [PATCH i-g-t v6 2/2] Skip the test when no engines are found
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, 
 Peter Senna Tschudin <me@petersenna.com>, andi.shyti@linux.intel.com
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

On Tue, Apr 2, 2024 at 6:17=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Peter,
> On 2024-03-30 at 15:19:32 +0100, Peter Senna Tschudin wrote:
> > This patch calls igt_skip() when no engines are found by
> > find_first_available_engine() preventing downstream code from crashing.
>
> I would prefer to have this change in one patch.

v7 on the way as a single patch.

>
> >
> > Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
> > ---
> >  tests/intel/gem_exec_capture.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capt=
ure.c
> > index a8348f21b..2afb84283 100644
> > --- a/tests/intel/gem_exec_capture.c
> > +++ b/tests/intel/gem_exec_capture.c
> > @@ -665,10 +665,12 @@ static bool needs_recoverable_ctx(int fd)
> >               ctx =3D intel_ctx_create_all_physical(fd); \
> >               igt_assert(ctx); \
>
> If 'e' is causing problems here, maybe introduce new var 'tmpe'?

Not trivial as we can only define a new variable inside a macro inside
a block of something like a for loop.

> So you can start with:
>
>         e =3D NULL;
>                 for_each_ctx_engine(fd, ctx, tmpe) \
>
> then use tmpe->engine and after for_each... loop you may add
> igt_skip_on_f(&saved.engine =3D=3D NULL, "no capable engine found\n"); \
>
> > -                     for_each_if(gem_class_can_store_dword(fd, e->clas=
s)) { \
> > +                     if(gem_class_can_store_dword(fd, e->class)) { \
>
> This looks much better, you replaced confusing macro with if()
>
> >                               igt_assert(e); \
> >                               saved =3D configure_hangs(fd, e, ctx->id)=
; \
> >                               break; \
> > +                     } else { \
> > +                             igt_skip("find_first_available_engine(): =
No engine available\n"); \
>
> This do not solve a problem, you may have capable engine later on
> as there is for_each... loop.

Wow, thank you for catching that! I was confused by the 'break', my
reading of the code was wrong. Thank you!

>
> >                       } \
> >               e =3D &saved.engine; \
>
> If using 'tmpe' this should be before 'break;' line and here
> you should place igt_skip_on_f()

I guess we don't need another variable, saved is fine and will have a
valid engine or not when it is the case. What about initializing
`saved_engine.engine.name[0] =3D '\0';` in many() then:

#define find_first_available_engine(fd, ctx, e, saved) \
    do { \
        ctx =3D intel_ctx_create_all_physical(fd); \
        igt_assert(ctx); \
        for_each_ctx_engine(fd, ctx, e) { \
            if(gem_class_can_store_dword(fd, e->class)) { \
                saved =3D configure_hangs(fd, e, ctx->id); \
                break; \
            } \
        } \
        e =3D &saved.engine; \
        igt_skip_on_f(e->name[0] =3D=3D '\0', "no capable engine found\n");=
 \
    } while(0)

Thank you Kamil!


>
> Regards,
> Kamil
>
> >       } while(0)
> > --
> > 2.44.0
> >
