Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4197CD11DD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 13:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A351F10E9BA;
	Tue, 26 Mar 2024 13:19:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C273D10E9BA
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 13:18:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F48A40005
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 13:18:56 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a46d0a8399aso1084985566b.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 06:18:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YybxkRTm0je2/dv4SnkeC3Ler5Jwd/6mDhUqogWwp9hz0JAD1vj
 vzOpGCWRH+pHhPMu4mmUGSOxYNWP4NqdnsutcmBc2OaXiiz+6AjTWpF6Fairwv/+woEcJhPYX/C
 vh9kFW0qRMJzVlUSegi58FAzEpDI=
X-Google-Smtp-Source: AGHT+IH4q5EnTq01TyXYQtjjdJjz4YHnK4Yku0PzKwxv0SKvhLIDVtlGrm220ycbRdCmtTMQzbWWQgN9eWH5xSkSPeE=
X-Received: by 2002:a17:906:c311:b0:a46:a8b8:f4cf with SMTP id
 s17-20020a170906c31100b00a46a8b8f4cfmr1131757ejz.35.1711459136665; Tue, 26
 Mar 2024 06:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240325213548.2881-1-me@petersenna.com>
 <ZgK58ZwkJxhF6G6C@ashyti-mobl2.lan>
In-Reply-To: <ZgK58ZwkJxhF6G6C@ashyti-mobl2.lan>
From: Peter Senna Tschudin <me@petersenna.com>
Date: Tue, 26 Mar 2024 14:18:43 +0100
X-Gmail-Original-Message-ID: <CA+MoWDpEpvpfbGEroLCCi=6dA+qeGu_i6h9VhYt3HMZyfzZ8Ug@mail.gmail.com>
Message-ID: <CA+MoWDpEpvpfbGEroLCCi=6dA+qeGu_i6h9VhYt3HMZyfzZ8Ug@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] Fix memory access issue due to variable block
 scope
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com
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

Hi Andi,

Thank you for your reply.

On Tue, Mar 26, 2024 at 1:05=E2=80=AFPM Andi Shyti <andi.shyti@linux.intel.=
com> wrote:
>
> Hey Peter,
>
> On Mon, Mar 25, 2024 at 10:35:48PM +0100, Peter Senna Tschudin wrote:
> > This patch fixes the tests gem_exec_capture@many-4k-incremental and
> > gem_exec_capture@many-4k-zero that are currently failing with an invali=
d file
> > descriptor error.
>
> where is gem_exec_capture calling for_each_ctx_cfg_engine()?

many(), userptr(), capture_invisible()
    find_first_available_engine()
        for_each_ctx_engine()

When called by many(), 'e' gets corrupted when configure_hangs() tries
to assign 'e' to another variable. Then after 'e' is corrupted, the
call __captureN() will fail because it expects 'e' to be valid.

>
> >  struct intel_execution_engine2 *
> >  intel_get_current_engine(struct intel_engine_data *ed)
> >
> > When intel_get_current_engine is called from the macro
> > for_each_ctx_cfg_engine(), the variable *ed is defined within a for loo=
p. The
> > scope of *ed is limited to that loop, leading to access violations when
> > attempting to access its contents outside the loop.
> >
> > Before to this patch, intel_get_current_engine() would return an elemen=
t of *ed
> > and attempting to use it after the loop ended resulted in undefined beh=
avior.
> >
> > This patch introduces a memcpy() to copy the contents of ed->current_en=
gine to
> > a memory area not confined by the loop's scope, ensuring safe access to=
 the
> > data.
> >
> > v2: Added 'i-g-t' to the Subject.
> >
> > Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> > ---
> >  lib/i915/gem_engine_topology.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topol=
ogy.c
> > index afb576afb..b3b809482 100644
> > --- a/lib/i915/gem_engine_topology.c
> > +++ b/lib/i915/gem_engine_topology.c
> > @@ -189,12 +189,24 @@ static int __query_engine_list(int fd, struct int=
el_engine_data *ed)
> >  struct intel_execution_engine2 *
> >  intel_get_current_engine(struct intel_engine_data *ed)
> >  {
> > +     struct intel_execution_engine2 *ret =3D NULL;
> > +
> >       if (ed->n >=3D ed->nengines)
> >               ed->current_engine =3D NULL;
> >       else if (!ed->n)
> >               ed->current_engine =3D &ed->engines[0];
> >
> > -     return ed->current_engine;
> > +     // When called from the macro for_each_ctx_cfg_engine(), *ed is d=
efined
> > +     // inside a for loop. In that case, not memcping ed->current_engi=
ne
> > +     // will lead to a memory access violation when trying to access t=
he
> > +     // contents of ed->current_engine after the end of the for loop
>
> can you please use /* ... */ style of comment?

sure, thank you for pointing this out.

>
> > +     if (ed->current_engine) {
> > +             ret =3D malloc(sizeof(*ret));
>
> should this be freed at some point?

I am not convinced that his patch is the best approach. If the problem
is indeed the block scope of '*ed', I will propose to give
for_each_ctx_engine() some serious love. I tried to come up with a
proper solution but I failed to find one. The problems I faced are:
 - for_each_ctx_engine() requires an struct intel_execution_engine2 as
an iterator
 - I did not find any way to keep for_each_ctx_engine() as a macro and
change the scope(other than declaring ed outside the macro, argh...).
 - Because for_each_ctx_engine() is a macro, I could not find a
compiler friendly way to define the struct intel_execution_engine2
within the macro
 - To use free() 'properly', we need to save the information of when
'e' was allocated to prevent the code from trying to free something
that should not be freed.

This is why I asked for help here* on how you want me to fix it: I am
under the impression that there is not a good solution for this
problem. And then it becomes a question of long term maintenance.
Should we drop the macro? Forbid the use of 'e' after the macro ends?
Properly trace memory allocation of 'e' to prevent the potential
free() issue? Something else? Please let me know.

* - https://lists.freedesktop.org/archives/igt-dev/2024-March/070468.html



>
> Andi
