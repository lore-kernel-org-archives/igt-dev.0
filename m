Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F9BC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 09:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA37410E230;
	Mon, 20 May 2024 09:31:53 +0000 (UTC)
X-Greylist: delayed 1799 seconds by postgrey-1.36 at gabe;
 Mon, 20 May 2024 09:31:51 UTC
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598B310E230
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 09:31:51 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1s8ytv-000000015N8-2Tmk; Mon, 20 May 2024 12:01:48 +0300
Message-ID: <681d41ac1ddf0bc3779aa7289e8914f2c9b5b768.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Date: Mon, 20 May 2024 12:01:46 +0300
In-Reply-To: <20240515172253.lavtpwd7sj2maauj@kamilkon-DESK.igk.intel.com>
References: <20240514094957.862770-1-luciano.coelho@intel.com>
 <20240515172253.lavtpwd7sj2maauj@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] lib/igt_kms: add retry loop in
 igt_enable_connectors()
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

On Wed, 2024-05-15 at 19:22 +0200, Kamil Konieczny wrote:
> Hi Luca,
> On 2024-05-14 at 12:49:57 +0300, Luca Coelho wrote:
> > Sometimes the connector is not fully initialized yet when we try to
> > read it in igt_enable_connectors() and this causes a warning to be
> > issued and the test to fail.  This can happen in normal situations,
> > because there's no synchronization between the driver and IGT.  In
> > some tests we load the module and immediately start reading the
> > information, but the driver may not be fully initialized at that
> > point, causing the problem.
> >=20
> > To prevent this, add a retry loop in igt_enable_connectors() so we
> > retry a few times, after a small delay, to wait for the initialization
> > to complete.
> >=20
> > The number of retries and the delay between retries were chose after
> > running lots of tests, but these values may have to be adjusted after
> > running more tests on different machines.
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10436
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  lib/igt_kms.c | 29 +++++++++++++++++++++++++----
> >  1 file changed, 25 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index f82102144ea1..3832bf54a2fc 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -5386,7 +5386,10 @@ void igt_wait_for_vblank(int drm_fd, int crtc_of=
fset)
> >   */
> >  void igt_enable_connectors(int drm_fd)
> >  {
> > +#define MAX_TRIES	10
> > +#define SLEEP_DURATION	50000
> >  	drmModeRes *res;
> > +	int tries;
> > =20
> >  	res =3D drmModeGetResources(drm_fd);
> >  	if (!res)
> > @@ -5395,10 +5398,28 @@ void igt_enable_connectors(int drm_fd)
> >  	for (int i =3D 0; i < res->count_connectors; i++) {
> >  		drmModeConnector *c;
> > =20
> > -		/* Do a probe. This may be the first action after booting */
> > -		c =3D drmModeGetConnector(drm_fd, res->connectors[i]);
> > -		if (!c) {
> > -			igt_warn("Could not read connector %u: %m\n", res->connectors[i]);
> > +		/*
> > +		 * The kernel returns the count of connectors before
> > +		 * they're all fully set up, so we can have a race
> > +		 * condition where we try to get the connector when
> > +		 * it's not fully set up yet.  To avoid failing here
> > +		 * in these cases, retry a few times.
> > +		 */
> > +		for (tries =3D 0; tries < MAX_TRIES; tries++) {
> > +			/* Do a probe. This may be the first action after booting */
> > +			c =3D drmModeGetConnector(drm_fd, res->connectors[i]);
> > +			if (c)
> > +				break;
> > +
> > +			igt_info("Could not read connector %u: %m (try %d of %d)\n",
> ----------- ^
> Use igt_debug or print summary after for(tries < MAX_TRIES) loop.

Right, this is better as igt_debug.  I'll change it.


>=20
> > +				  res->connectors[i], tries, MAX_TRIES);
> > +
> > +			usleep(SLEEP_DURATION);
> > +		}
> > +
> > +		if (tries =3D=3D MAX_TRIES) {
> > +			igt_warn("Could not read connector %u after %d tries, skipping\n",
> > +				 res->connectors[i], MAX_TRIES);
> >  			continue;
>=20
> How long could it take in worst case?

The values I used were based on a lot of trials on a local machine
where I could reproduce the issue.  We usually pass after the first
retry, which is after a 50 msec delay.  The maximum number of retries I
have needed was 4, which is a 200 msec delay.  This is the worst case I
have seen.  But to be sure, I chose to do 10 retries (500 msecs).

IOW, if everything goes well (i.e. no retry is needed), there's no
additional delay compared to before my patch.  If a retry is needed,
the added delay is going to be between 50 and 200 msecs.

I'll send v2 in a bit.

--
Cheers,
Luca.
