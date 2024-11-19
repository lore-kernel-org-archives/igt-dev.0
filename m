Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31CDD62069
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 10:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B2010E612;
	Tue, 19 Nov 2024 10:24:24 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E559910E612
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 10:24:23 +0000 (UTC)
Received: from 91-155-254-6.elisa-laajakaista.fi ([91.155.254.6]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tDLP9-000000020Ag-1Zoh; Tue, 19 Nov 2024 12:24:20 +0200
Message-ID: <549c203abba22cbff91b79546a5ab6a72cab26ea.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Ryszard Knop <ryszard.knop@intel.com>, Janusz Krzysztofik	
 <janusz.krzysztofik@linux.intel.com>, Zbigniew =?UTF-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, 	luciano.coelho@intel.com
Date: Tue, 19 Nov 2024 12:24:17 +0200
In-Reply-To: <ae7b998d-6675-480e-9ce6-c822208b5009@linux.intel.com>
References: <384b983e-b1f5-4266-aa14-5739397bc7a1@linux.intel.com>
 <b7299a2dc50db417a360d702c660ec57b8733f34.camel@coelho.fi>
 <6ed12243-172d-433a-a203-4176be7ee53c@linux.intel.com>
 <51b9e5c77447517a40da09cc38222ef719801bb3.camel@coelho.fi>
 <ae7b998d-6675-480e-9ce6-c822208b5009@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v6] igt-runner fact checking
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

On Tue, 2024-11-19 at 11:07 +0100, Peter Senna Tschudin wrote:
>=20
> On 19.11.2024 09:19, Luca Coelho wrote:
> > On Mon, 2024-11-18 at 17:03 +0100, Peter Senna Tschudin wrote:
> > >=20
> > > On 18.11.2024 14:07, Luca Coelho wrote:
> > > > This makes me start thinking... it would be so much easier to make =
all
> > > > this in python.  Would it be possible to glue a python script to ig=
t-
> > > > runner (or whoever calls it) and get the data from dmesg, lsmod etc=
.?
> > > > Or otherwise aren't there any libraries already used by IGT that
> > > > include list handling?
> > >=20
> > > Absolutely no python here. Never! :-)
> >=20
> > Oh, well.  Can't really argue against dogmas...
>=20
> Wow, that was a low punch.

Oh, sorry for that, it was not my intention to punch you at all, much
less a low punch. ;) But it seemed like a dry, I-don't-even-want-to-
talk-about-it statement to me, without any explanations, which looks
like a dogma to me...


> This code is going to run about 1M times / day in our CI. There is histor=
y
> that precedes me working on IGT of issues created by trying to mix c and
> python in igt. The reasons for not trying python again are runtime overhe=
ad
> and the history of such attempts in igt that just made a bunch of people =
and
> our CI very upset.

Okay, now that's an explanation. :) It makes some sense, and obviously
I'm not trying to change how the entire IGT framework is implemented.=20
But looking at all this C code doing something that can be done in way
fewer lines in python, just got me wondering.

I think the previous IGT trials with python were probably not really
done right, because I'm pretty sure it could be made in a way that
would be very efficient.  Probably not having C invoke a shell to run
python, but some proper bindings, or maybe even better, having python
wrap around the C code.

In this specific case, I think you could neatly wrap some python around
igt-runner to gather these facts.  But TBH I don't even know the
details of how igt-runner and everything else is invoked in IGT...

In any case, if using python is an established no-no in IGT, all this
conversation is moot.

I'll reply to the rest of your email later, when I find some more time
again.


--
Cheers,
Luca.
