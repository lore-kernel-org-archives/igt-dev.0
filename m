Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7723C25B7E
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 07:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8649010E2F9;
	Tue, 28 May 2024 07:20:53 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A338C10E2F9
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 07:20:51 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sBr8Y-00000001FLW-3mFu; Tue, 28 May 2024 10:20:47 +0300
Message-ID: <f003c69a790a56d7887effce1224b9601cf7b4bf.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Mark Yacoub
 <markyacoub@chromium.org>, Manasi Navare <navaremanasi@chromium.org>
Date: Tue, 28 May 2024 10:20:45 +0300
In-Reply-To: <20240524165835.txbj66ww34vrjm2q@kamilkon-DESK.igk.intel.com>
References: <20240523084426.284894-1-luciano.coelho@intel.com>
 <20240523084426.284894-2-luciano.coelho@intel.com>
 <20240524165835.txbj66ww34vrjm2q@kamilkon-DESK.igk.intel.com>
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

On Fri, 2024-05-24 at 18:58 +0200, Kamil Konieczny wrote:
> Hi Luca,

Hi Kamil,


> On 2024-05-23 at 11:44:25 +0300, Luca Coelho wrote:
>=20
> I have two nits, one about too long subject:
>=20
> [PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector() return v=
alue in wait_for_connected_state()

Yes, it's a bit too long, but I wanted to convey useful information in
the subject...


> imho better:
>=20
> [PATCH i-g-t 1/2] lib/igt_chamelium: avoid NULL dereference in wait_for_c=
onnected_state()

Okay, this is descriptive enough, but loses the context of the problem
with drmModeGetConnector(), which I'm addressing in this series.


> or even shorter:
>=20
> [PATCH i-g-t 1/2] lib/igt_chamelium: fix wait_for_connected_state()

IMHO this is way too generic.

What about this?

[PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector() return in =
wait_for_connected_state()

It's still sligthly over 80 chars, but conveys the full message (I just
remove "value" from it).  And the max 80 chars rule is so outdated that
it's not very strict even in the kernel nowadays...

> Maybe that should be changed to something else? See my other
> response.
>=20
> > The drmModeGetConnector() function can return NULL in some cases, so
> > we need to check the return value before accessing it.  This is not
> > being checked in wait_for_connected_state(), so fix that.
> >=20
>=20
> Also please add to Cc chromium devs, for example:
>=20
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Manasi Navare <navaremanasi@chromium.org>
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>

Done.  Thanks for pointing out!

--
Cheers,
Luca.
