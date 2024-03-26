Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CB1CD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 21:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A8010F37D;
	Tue, 26 Mar 2024 21:41:43 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCBD10F380
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 21:41:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE52E1C0002
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 21:41:39 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a4df5bd63fbso140613166b.2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 14:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFVP5cNhYX6DCSw5L6fWRmHjK9e0h5kreZRItzYGmtNWALVhS3X5ZUOrgvlV8jAQm5JNKV99LsLbFVC41tKoOSVKkGIg4/KyCMueksMw==
X-Gm-Message-State: AOJu0YyZejNN4fwwdOTEHH/QPZokF+jTuW7eSjsDVGTicK/mkNYPsdY9
 RA9PPx8fpK8/mJsJmzajI++2HIg4lVWZBeYEe0LKX99X8TMl6B31f+FRNEJHgqpLb7baA61Avuz
 LB0DOp79/5ycty4zhiQf+R6pu6fY=
X-Google-Smtp-Source: AGHT+IEtjxOBTqnUqViKbfIq1NeMlM8cqLlqoHR5UCNqhQpirwajgxeQjPAYXaGGtr/0CgE5odT9qU/ojlO4W7ONJJ8=
X-Received: by 2002:a17:907:944f:b0:a49:452d:e722 with SMTP id
 dl15-20020a170907944f00b00a49452de722mr6808622ejc.29.1711489299321; Tue, 26
 Mar 2024 14:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240325213548.2881-1-me@petersenna.com>
 <ZgK58ZwkJxhF6G6C@ashyti-mobl2.lan>
 <CA+MoWDpEpvpfbGEroLCCi=6dA+qeGu_i6h9VhYt3HMZyfzZ8Ug@mail.gmail.com>
 <20240326182006.xwloqd3ks4vsartq@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240326182006.xwloqd3ks4vsartq@kamilkon-desk.igk.intel.com>
From: Peter Senna Tschudin <me@petersenna.com>
Date: Tue, 26 Mar 2024 22:41:27 +0100
X-Gmail-Original-Message-ID: <CA+MoWDoKgm43ysBsN+Ta2KG6jSOKuLkznCVxobyfCVzrJKDRZg@mail.gmail.com>
Message-ID: <CA+MoWDoKgm43ysBsN+Ta2KG6jSOKuLkznCVxobyfCVzrJKDRZg@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] Fix memory access issue due to variable block
 scope
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
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

Thank you for your email!

On Tue, Mar 26, 2024 at 7:20=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi peter.senna,
> On 2024-03-26 at 14:18:43 +0100, Peter Senna Tschudin wrote:
> > Hi Andi,
> >
> > Thank you for your reply.
> >
> > On Tue, Mar 26, 2024 at 1:05=E2=80=AFPM Andi Shyti <andi.shyti@linux.in=
tel.com> wrote:
> > >
> > > Hey Peter,
> > >
> > > On Mon, Mar 25, 2024 at 10:35:48PM +0100, Peter Senna Tschudin wrote:
> > > > This patch fixes the tests gem_exec_capture@many-4k-incremental and
> > > > gem_exec_capture@many-4k-zero that are currently failing with an in=
valid file
> > > > descriptor error.
> > >
> > > where is gem_exec_capture calling for_each_ctx_cfg_engine()?
> >
> > many(), userptr(), capture_invisible()
> >     find_first_available_engine()
> >         for_each_ctx_engine()
> >
> > When called by many(), 'e' gets corrupted when configure_hangs() tries
> > to assign 'e' to another variable. Then after 'e' is corrupted, the
> > call __captureN() will fail because it expects 'e' to be valid.
> >
>
> imho first step whould be to replace macro with a function:
>
> saved =3D find_first_available_engine(fd, ctx, e);

When I was done with the replacement function, I found a simple
solution that seems to be adequate. I made a small change to
find_first_available_engine() to reassign e to an element of saved. My
patch v3 has the details. What do you think?

May I ask you to increase the time the CI will waits for the tests to compl=
ete:
 - many-4k-zero: 2 minutes
 - many-4k-incremental: 5 minutes (It takes 4 minutes on my N3150)

Thank you,

Peter

>
> Regards,
> Kamil
>
> > >
> > > >  struct intel_execution_engine2 *
> > > >  intel_get_current_engine(struct intel_engine_data *ed)
> > > >
> > > > When intel_get_current_engine is called from the macro
> > > > for_each_ctx_cfg_engine(), the variable *ed is defined within a for=
 loop. The
> > > > scope of *ed is limited to that loop, leading to access violations =
when
> > > > attempting to access its contents outside the loop.
> > > >
> > > > Before to this patch, intel_get_current_engine() would return an el=
ement of *ed
> > > > and attempting to use it after the loop ended resulted in undefined=
 behavior.
> > > >
> > > > This patch introduces a memcpy() to copy the contents of ed->curren=
t_engine to
> > > > a memory area not confined by the loop's scope, ensuring safe acces=
s to the
> > > > data.
> > > >
> > > > v2: Added 'i-g-t' to the Subject.
> > > >
> > > > Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> > > > ---
> > > >  lib/i915/gem_engine_topology.c | 14 +++++++++++++-
> > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_t=
opology.c
> > > > index afb576afb..b3b809482 100644
> > > > --- a/lib/i915/gem_engine_topology.c
> > > > +++ b/lib/i915/gem_engine_topology.c
> > > > @@ -189,12 +189,24 @@ static int __query_engine_list(int fd, struct=
 intel_engine_data *ed)
> > > >  struct intel_execution_engine2 *
> > > >  intel_get_current_engine(struct intel_engine_data *ed)
> > > >  {
> > > > +     struct intel_execution_engine2 *ret =3D NULL;
> > > > +
> > > >       if (ed->n >=3D ed->nengines)
> > > >               ed->current_engine =3D NULL;
> > > >       else if (!ed->n)
> > > >               ed->current_engine =3D &ed->engines[0];
> > > >
> > > > -     return ed->current_engine;
> > > > +     // When called from the macro for_each_ctx_cfg_engine(), *ed =
is defined
> > > > +     // inside a for loop. In that case, not memcping ed->current_=
engine
> > > > +     // will lead to a memory access violation when trying to acce=
ss the
> > > > +     // contents of ed->current_engine after the end of the for lo=
op
> > >
> > > can you please use /* ... */ style of comment?
> >
> > sure, thank you for pointing this out.
> >
> > >
> > > > +     if (ed->current_engine) {
> > > > +             ret =3D malloc(sizeof(*ret));
> > >
> > > should this be freed at some point?
> >
> > I am not convinced that his patch is the best approach. If the problem
> > is indeed the block scope of '*ed', I will propose to give
> > for_each_ctx_engine() some serious love. I tried to come up with a
> > proper solution but I failed to find one. The problems I faced are:
> >  - for_each_ctx_engine() requires an struct intel_execution_engine2 as
> > an iterator
> >  - I did not find any way to keep for_each_ctx_engine() as a macro and
> > change the scope(other than declaring ed outside the macro, argh...).
> >  - Because for_each_ctx_engine() is a macro, I could not find a
> > compiler friendly way to define the struct intel_execution_engine2
> > within the macro
> >  - To use free() 'properly', we need to save the information of when
> > 'e' was allocated to prevent the code from trying to free something
> > that should not be freed.
> >
> > This is why I asked for help here* on how you want me to fix it: I am
> > under the impression that there is not a good solution for this
> > problem. And then it becomes a question of long term maintenance.
> > Should we drop the macro? Forbid the use of 'e' after the macro ends?
> > Properly trace memory allocation of 'e' to prevent the potential
> > free() issue? Something else? Please let me know.
> >
> > * - https://lists.freedesktop.org/archives/igt-dev/2024-March/070468.ht=
ml
> >
> >
> >
> > >
> > > Andi
