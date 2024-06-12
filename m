Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3033C27C77
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C5310E858;
	Wed, 12 Jun 2024 13:55:45 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA0010E863
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 13:55:43 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sHORw-00000001aVO-15dh; Wed, 12 Jun 2024 16:55:40 +0300
Message-ID: <484d11acf8da0ff94a5627e7fd996b75aedb063c.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Mark Yacoub <markyacoub@chromium.org>, Manasi Navare
 <navaremanasi@chromium.org>
Date: Wed, 12 Jun 2024 16:55:38 +0300
In-Reply-To: <20240607143806.n5pxivsbfnt5ugbg@kamilkon-DESK.igk.intel.com>
References: <20240528075855.463729-1-luciano.coelho@intel.com>
 <20240528075855.463729-2-luciano.coelho@intel.com>
 <20240529160646.nv6ovnpgw7ttzilz@kamilkon-DESK.igk.intel.com>
 <6815028c4c13d8c2d3c5080389fdfc4067dbd501.camel@coelho.fi>
 <20240607143806.n5pxivsbfnt5ugbg@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_chamelium: check
 drmModeGetConnector() return in wait_for_connected_state()
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

On Fri, 2024-06-07 at 16:38 +0200, Kamil Konieczny wrote:
> Hi Luca,
> On 2024-05-30 at 00:13:24 +0300, Luca Coelho wrote:
> > On Wed, 2024-05-29 at 18:06 +0200, Kamil Konieczny wrote:
> > > Hi Luca,
> >=20
> > Hi Kamil,
> >=20
> > > On 2024-05-28 at 10:58:54 +0300, Luca Coelho wrote:
> > >=20
> > > change now looks ok but why did you ignored my suggestion
> > > about short subject?
> >=20
> > Oh, sorry, but I didn't _ignore_ your suggestion.  I replied to it,
> > expressed my opinion and explained why I didn't think it needed to be
> > changed.
> >=20
> >=20
> > > Please see CONTRIBUTING.md about test
> > > description:
> > > The description should contain the spirit of the test (what is
> > > the general idea behind the test) and *not* the letter (C to English
> > > translation of the test).
> >=20
> > This is not a new test, so I think this doesn't really apply.  This is
> > a very specific fix in a very specific place of an existing test and I
> > think getting a general idea of what was wrong in the code and why it
> > needs to be changed is the right thing to describe here.
> >=20
> > This text you quoted is about what should be in igt_describe() and not
> > in the commit message, right?
> >=20
> >=20
> >=20
> > > The same principle apply to your subject description of change,
> > > it should be short, not 'translation from C code of a change'.
> > > It should also be rather short, up to 75 chars (or maybe even 65)
> > > to keep it all in mailing list discussion.
> > > You coould also look into:
> > > https://patchwork.freedesktop.org/series/134188/
> > >=20
> > > So imho here, instead of:
> > > lib/igt_chamelium: check drmModeGetConnector() return in wait_for_con=
nected_state()
> >=20
> > This describes what was fixed and where.
> >=20
>=20
> You can read it in patch itself after 'diff --git a/...'

Of course, the code change will show it, but it's good to know what
it's about with a quick glance.


> > > imho better:
> > > lib/igt_chamelium: Fix NULL dereferencing bug in wait_for_connected_s=
tate()
> >=20
> > This describes that something was fixed and where, without specifying
> > what was fixed.
> >=20
> >=20
> > > or even better:
> > > lib/igt_chamelium: Fix bug in wait_for_connected_state()
> >=20
> > This is even more generic and there could be several bugfixes in this
> > function which would end up with the same commit subject...
> >=20
> >=20
> > > or maybe:
> > > lib/igt_chamelium: check drmModeGetConnector() return value before us=
e
> >=20
> > Conversely,this describes what was fixed but not where.
> >=20
> >=20
> > > You could propose other subject if you find a better description.
> >=20
> > I generally follow the kernel's coding style.  One important part of
> > the subject line, IMHO, is the uniqueness and identifiability of it.=
=20
> > Like explained here[1]:
> >=20
> > "[...]the ``summary phrase`` of your email becomes a
> > globally-unique identifier for that patch.  It propagates all the way
> > into the ``git`` changelog.  The ``summary phrase`` may later be used
> > in
> > developer discussions which refer to the patch.  People will want to
> > google for the ``summary phrase`` to read discussion regarding that
> > patch.  It will also be the only thing that people may quickly see
> > when, two or three months later, they are going through perhaps
> > thousands of patches using tools such as ``gitk`` or ``git log
> > --oneline``."
> >=20
> > I admit that the subject is a bit long, but it actually contains only 5
> > relevant words.  The function names are rather long and, with about 20
> > characters of boilerplate ("lib/igt_chamelium: ") and 47 chars only in
> > function names, it's literally impossible to keep the subject line
> > inside the 70-75 recommended length while still keeping it descriptive
> > and unique...
> >=20
>=20
> What will you write if you will make change in a few functions?

It's obviously case-by-case.  And it should briefly describe what
changed.  If it's something in many functions, there should still be a
common theme for the change in all functions.  For instance:

foo: change bar in all affected functions


> Well, I agree that 70-75 is only recomendation, not strict rule.

Everyone should always strive to fit it (or at least make sure it's as
concise as possible), but if some symbols you want to mention there are
very long, trying to keep it under 70-75 is moot.

--
Cheers,
Luca.
