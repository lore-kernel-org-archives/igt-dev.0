Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F83C25B7E
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 07:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ED311200B;
	Tue, 28 May 2024 07:39:20 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCD811200B
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 07:39:19 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sBrQR-00000001FMd-3HD9; Tue, 28 May 2024 10:39:16 +0300
Message-ID: <8d60fa959418a4cb8ad8ddf813560141300a25ff.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Date: Tue, 28 May 2024 10:39:14 +0300
In-Reply-To: <20240523102019.6vqmsj4owuxm52oh@kamilkon-DESK.igk.intel.com>
References: <20240523084426.284894-1-luciano.coelho@intel.com>
 <20240523084426.284894-2-luciano.coelho@intel.com>
 <20240523102019.6vqmsj4owuxm52oh@kamilkon-DESK.igk.intel.com>
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

On Thu, 2024-05-23 at 12:20 +0200, Kamil Konieczny wrote:
> Hi Luca,
> On 2024-05-23 at 11:44:25 +0300, Luca Coelho wrote:
> > The drmModeGetConnector() function can return NULL in some cases, so
> > we need to check the return value before accessing it.  This is not
> > being checked in wait_for_connected_state(), so fix that.
> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  lib/igt_chamelium.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > index 016d5356630c..b1478654d02a 100644
> > --- a/lib/igt_chamelium.c
> > +++ b/lib/igt_chamelium.c
> > @@ -524,6 +524,9 @@ static bool wait_for_connected_state(int drm_fd,
> >  			drmModeConnector *connector =3D
> >  				drmModeGetConnector(drm_fd, connectors[i]);
> > =20
> > +			if (!connector)
> > +				break;
>=20
> Why break? btw please document what is that function
> tring to do, it looks strange.

I did not implement this function, so I'm not the best person to
document what it does, I think...


> Is it:
> wait for one connector to enter connected state
> or
> wait for all connectors to be connected?
>=20
> See below.
>=20
> > +
> >  			connected =3D connector->connection =3D=3D DRM_MODE_CONNECTED;
> > =20
> >  			drmModeFreeConnector(connector);
> > --=20
> > 2.39.2
> >=20
>=20
> Some comments on this function code:
>=20
> igt_until_timeout(CHAMELIUM_HOTPLUG_DETECTION_DELAY) {
>     bool connected;
>=20
>     for (int i =3D 0; i < connector_count; i++) {
>         drmModeConnector *connector =3D drmModeGetConnector(drm_fd, conne=
ctors[i]);
>=20
> 		if (!connector)
> 				continue;
>=20
>         connected =3D connector->connection =3D=3D DRM_MODE_CONNECTED;
>         drmModeFreeConnector(connector);
>=20
>         if (!connected)
> ------------^
>             break;
> ------------^
> Why break here? imho this should be:

It is the same thing that happens if the connector is not connected.=20
It will leave the inner loop and continue with the outer, timeout loop.


>         if (connected)
>             return true;
>=20
>         }
>=20
>     if (connected)
> ------------^
>         return true;
>=20
> This if(..)... could be then deleted.

The goal of this function seems to be to wait until all connectors are
connected.  As it is, we will only get to this place with connected =3D=3D
true if all the connectors are connected.  If we return true when the
first one is connected, we're changing the semantics of this function.

--
Cheers,
Luca.
