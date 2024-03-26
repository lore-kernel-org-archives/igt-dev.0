Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73FCCD11DD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 13:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBEC10E9D1;
	Tue, 26 Mar 2024 13:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mnz/VApj";
	dkim-atps=neutral
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B771210E9D1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 13:29:38 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a466fc8fcccso708835966b.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711459777; x=1712064577; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kZRl4rAR8F6LlebJ8bVBggowIiT1boRv+7wfppYfCzU=;
 b=mnz/VApjFkRFCtxy0h/HF24+/7Ol8JJ7rlCNPeGyFyjuWziHdOfZcJauxtFN450tb5
 jFgiDF6hewqgNtwGsTfUi7m7qASeicaRxRNI9mTOZ9g/H4FqxFgdkB+F9Zbd10HvQifo
 bAEq7LNXMBauV6kOVhulDlrfYrXtZTZr8eS/3Zb6CyBnUrd6ZVcQO0LzkE9WRIJcL7I8
 SMwMk8BU1QDD0mDoUipqJKsGQIRa2U6U40kBzRUx9luI5hWUhkvObQHnMPmZgyxHL9wO
 0tWiVtdLYLqT+Se+O7rVbc+Lvo2+0erItZnCP4OjOkjSJT59Ip3l7OsiBxGBgYDvYFqX
 FotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711459777; x=1712064577;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kZRl4rAR8F6LlebJ8bVBggowIiT1boRv+7wfppYfCzU=;
 b=PqZ/86wIFQtKLMGXcu1jYTjDtrpwHnYmo+Ap1GG9BksMlvhM9Kfraaxmyja8O6XVKz
 pbPaaDY8QJdeD7gXGYVvycFGl1MzwU1DMSf6essnbtVjeZANhJb8qrpoeHi/MiLucFdq
 reVxiVS14/LbND0FGHYULLu7r944hrVm9C+tu/GkzqNmrvSkCj/syHNPHna5DCaxApYo
 PpCUhr9ycz9r1PC4pfM+wZMKnMcutPE0eMn8Qrm61qKSr8JJgk/LusbFutUT5glvPaPq
 af7e3LhEb1HEimP+FqBKlyEZvdKXryBWLeLlaHBvOhO+BWZ/Ec2WHF0bCjQAnxqLmTfA
 60LA==
X-Gm-Message-State: AOJu0YyuENuoLbM6B0x69vDBMXiKA5YK60oUlmz5F1oQwzld+44Dtyqo
 D+Xw6JcqhbsXpCFyOHdjx+aCzV4JlN6k0MzhhLCKAaNU1Ky8y8o1KrFG4pwn77H4G9S5x4EO3/l
 8Gys9DjFOk56QYZ21r9SKyGy6nzWqWkd+wLY=
X-Google-Smtp-Source: AGHT+IGJ4ucXbZiueLwetHxUbEFitkqSGDGzfrsMXhzOvb6UObjCCGD27EqulxeHbAWVv2jzEeusgVZP5Of5fRXLzkE=
X-Received: by 2002:a17:906:27d9:b0:a46:6ba1:4c8c with SMTP id
 k25-20020a17090627d900b00a466ba14c8cmr964543ejc.44.1711459776429; Tue, 26 Mar
 2024 06:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240325213548.2881-1-me@petersenna.com>
 <ZgK58ZwkJxhF6G6C@ashyti-mobl2.lan>
In-Reply-To: <ZgK58ZwkJxhF6G6C@ashyti-mobl2.lan>
From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 26 Mar 2024 14:29:23 +0100
Message-ID: <CA+MoWDq0tpYTruJWd8joTivcFugnnHwSitpCSRRDurmsAYNbAQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] Fix memory access issue due to variable block
 scope
To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
