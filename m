Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078A9C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 21:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBDA11A658;
	Wed, 29 May 2024 21:35:54 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C615B11A658
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 21:35:52 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239] helo=hazy.lan)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sCQxY-00000001HjJ-3lXN; Thu, 30 May 2024 00:35:49 +0300
Message-ID: <8d0b8d9dd8d1dfcea27dcf96290e8500873de653.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Mark Yacoub
 <markyacoub@chromium.org>, Manasi Navare <navaremanasi@chromium.org>
Date: Thu, 30 May 2024 00:35:48 +0300
In-Reply-To: <20240529171624.e5r5fljcxjjowtjx@kamilkon-DESK.igk.intel.com>
References: <20240523084426.284894-1-luciano.coelho@intel.com>
 <20240523084426.284894-2-luciano.coelho@intel.com>
 <20240524165835.txbj66ww34vrjm2q@kamilkon-DESK.igk.intel.com>
 <f003c69a790a56d7887effce1224b9601cf7b4bf.camel@coelho.fi>
 <20240529171624.e5r5fljcxjjowtjx@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 1/2] lib/igt_chamelium: check
 drmModeGetConnector() return value in wait_for_connected_state()
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

On Wed, 2024-05-29 at 19:16 +0200, Kamil Konieczny wrote:
> Hi Luca,
> On 2024-05-28 at 10:20:45 +0300, Luca Coelho wrote:
> > On Fri, 2024-05-24 at 18:58 +0200, Kamil Konieczny wrote:
> > > Hi Luca,
> >=20
> > Hi Kamil,
> >=20
> >=20
> > > On 2024-05-23 at 11:44:25 +0300, Luca Coelho wrote:
> > >=20
> > > I have two nits, one about too long subject:
> > >=20
> > > [PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector() retu=
rn value in wait_for_connected_state()
> >=20
> > Yes, it's a bit too long, but I wanted to convey useful information in
> > the subject...
> >=20
> >=20
> > > imho better:
> > >=20
> > > [PATCH i-g-t 1/2] lib/igt_chamelium: avoid NULL dereference in wait_f=
or_connected_state()
> >=20
> > Okay, this is descriptive enough, but loses the context of the problem
> > with drmModeGetConnector(), which I'm addressing in this series.
> >=20
> >=20
> > > or even shorter:
> > >=20
> > > [PATCH i-g-t 1/2] lib/igt_chamelium: fix wait_for_connected_state()
> >=20
> > IMHO this is way too generic.
> >=20
> > What about this?
> >=20
> > [PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector() return=
 in wait_for_connected_state()
>=20
> imho still too long, another idea:
>=20
> lib/igt_chamelium: check drmModeGetConnector() before using

Yeah, thanks, I think this is usable.  I'll change it.  Sorry, I just
saw this reply now, well after I had resubmitted my patches.

--
Cheers,
Luca.
