Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E51EC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 17:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC51E10FEA7;
	Wed, 27 Mar 2024 17:35:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D28210FEA7
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 17:35:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AB95240004
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 17:35:00 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so21078366b.1
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 10:35:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWOKcwY+Il6N+vA0hZ1wwzCzibENam4oCqdB5946SOVBeT9wAWbHPV5VhGekcbK0C5NA1mkFLO+FrrT5O3M3gxi7w7HZQ9qxywVwss2QQ==
X-Gm-Message-State: AOJu0YwM/ikG2O5jxxWoJjXqRvdp6UeM7ftAqJqxWp+1AnApTQN5ddge
 cY3sykHUq3IyJIQ+tHOxXkEDM7AhDCVrDurjtCYdthpfOhxXkMuL59EBhZ6sZ4A9sYg9sbTGHSu
 qV31xvi3i9uLmxOX9MMnp6kWl4OQ=
X-Google-Smtp-Source: AGHT+IGFIMGWKkDGfQ3wn4RD2TtW/z6ei0eMWlmTVdWFwFcOK8lNO1yew4SWy0susbK4PJcA4B0HRwrHcqsKRrPK1Es=
X-Received: by 2002:a17:906:8305:b0:a4d:f8d7:8546 with SMTP id
 j5-20020a170906830500b00a4df8d78546mr239532ejx.7.1711560900673; Wed, 27 Mar
 2024 10:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240325213548.2881-1-me@petersenna.com>
 <ZgK58ZwkJxhF6G6C@ashyti-mobl2.lan>
 <CA+MoWDpEpvpfbGEroLCCi=6dA+qeGu_i6h9VhYt3HMZyfzZ8Ug@mail.gmail.com>
 <20240326182006.xwloqd3ks4vsartq@kamilkon-desk.igk.intel.com>
 <CA+MoWDoKgm43ysBsN+Ta2KG6jSOKuLkznCVxobyfCVzrJKDRZg@mail.gmail.com>
 <20240327165932.wnp332o5rcbnikyk@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240327165932.wnp332o5rcbnikyk@kamilkon-desk.igk.intel.com>
From: Peter Senna Tschudin <me@petersenna.com>
Date: Wed, 27 Mar 2024 18:34:47 +0100
X-Gmail-Original-Message-ID: <CA+MoWDpKVrjku8Tb8VpbPAwkZ62y_kU9OmHpHbBYC+7eVbvmMA@mail.gmail.com>
Message-ID: <CA+MoWDpKVrjku8Tb8VpbPAwkZ62y_kU9OmHpHbBYC+7eVbvmMA@mail.gmail.com>
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

On Wed, Mar 27, 2024 at 5:59=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Peter,
>
> On 2024-03-26 at 22:41:27 +0100, Peter Senna Tschudin wrote:
> > Hi Kamil,
> >
> > Thank you for your email!
> >
> > On Tue, Mar 26, 2024 at 7:20=E2=80=AFPM Kamil Konieczny
> > <kamil.konieczny@linux.intel.com> wrote:
> > >
> > > Hi peter.senna,
> > > On 2024-03-26 at 14:18:43 +0100, Peter Senna Tschudin wrote:
> > > > Hi Andi,
> > > >
> > > > Thank you for your reply.
> > > >
> > > > On Tue, Mar 26, 2024 at 1:05=E2=80=AFPM Andi Shyti <andi.shyti@linu=
x.intel.com> wrote:
> > > > >
> > > > > Hey Peter,
> > > > >
> > > > > On Mon, Mar 25, 2024 at 10:35:48PM +0100, Peter Senna Tschudin wr=
ote:
> > > > > > This patch fixes the tests gem_exec_capture@many-4k-incremental=
 and
> > > > > > gem_exec_capture@many-4k-zero that are currently failing with a=
n invalid file
> > > > > > descriptor error.
> > > > >
> > > > > where is gem_exec_capture calling for_each_ctx_cfg_engine()?
> > > >
> > > > many(), userptr(), capture_invisible()
> > > >     find_first_available_engine()
> > > >         for_each_ctx_engine()
> > > >
> > > > When called by many(), 'e' gets corrupted when configure_hangs() tr=
ies
> > > > to assign 'e' to another variable. Then after 'e' is corrupted, the
> > > > call __captureN() will fail because it expects 'e' to be valid.
> > > >
> > >
> > > imho first step whould be to replace macro with a function:
> > >
> > > saved =3D find_first_available_engine(fd, ctx, e);
> >
> > When I was done with the replacement function, I found a simple
> > solution that seems to be adequate. I made a small change to
> > find_first_available_engine() to reassign e to an element of saved. My
> > patch v3 has the details. What do you think?
>
> I will reply to your v4 patch, it looks promising.

Thanks!

>
> >
> > May I ask you to increase the time the CI will waits for the tests to c=
omplete:
> >  - many-4k-zero: 2 minutes
> >  - many-4k-incremental: 5 minutes (It takes 4 minutes on my N3150)
>
> It is not posibble, sorry, as there are many of them and time adds up...

Should I send a patch to reduce the test sizes by half?

[...]
