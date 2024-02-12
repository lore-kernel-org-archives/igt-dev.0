Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9CAC4829B
	for <igt-dev@archiver.kernel.org>; Mon, 12 Feb 2024 08:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498FD10E8AD;
	Mon, 12 Feb 2024 08:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRw1V2QP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BEF10E8AD
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2024 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707725598; x=1739261598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=E3zW1RMWJOMoPkWy9J8Wl8F+ouoRsiBn3FAuKekJ9xI=;
 b=KRw1V2QP5i5fFHVRRw+3eLGKQDc/GWFtHNB9mSgvh2YiX7X7ky1ENREw
 GMx6DbNyZS2H0xlx50oCik2Axi7lFARfQkeMykGVKtIjzDrBFUM/M6OgQ
 Z4xKSOZmh1HBKW7gd9BWmDrIH2a6nsRw8dvKcYJXSvi76dgd+rAEDUQ65
 31Gc3XWdUK11ezW1A/YJes7gDgITahTzY3rj9ZdO6I3vE0b/fnCZLSbVp
 kTu/U+jSZaoLSNlS16r9FAFH+i0sqMT9OCOnypVnBInRJy88lbqo1vbcZ
 vvj7HApBdlGr3YQ2XeDm1/xDb7O9VC9AvKZc3uvEzQHv+9zFTWuMw3RfV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1572506"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1572506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 00:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2827542"
Received: from mwasile-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.ger.corp.intel.com) ([10.213.3.56])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 00:13:15 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v8 3/8] lib/drmtest: allow opening cards out of order
Date: Mon, 12 Feb 2024 09:13:14 +0100
Message-ID: <3101975.U7HbjWM52l@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240209192917.sep2cjzogi7ggibe@kamilkon-desk.igk.intel.com>
References: <20240208135232.54382-1-kamil.konieczny@linux.intel.com>
 <1889393.1xdlsreqCQ@jkrzyszt-mobl2.ger.corp.intel.com>
 <20240209192917.sep2cjzogi7ggibe@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hi Kamil,

On Friday, 9 February 2024 20:29:17 CET Kamil Konieczny wrote:
> Hi Janusz,
> On 2024-02-09 at 18:02:37 +0100, Janusz Krzysztofik wrote:
> > Hi Kamil,
> >=20
> > On Thursday, 8 February 2024 14:52:27 CET Kamil Konieczny wrote:
> > > Current __drm_open_driver_another() implementation prevents
> > > opening cards out of order, for example card 3 without previous
> > > opens of 0..2. This can be seen with three GPU cards system and
> > > gem_open_basic test:
> > >=20
> > > sudo IGT_DEVICE=3Dpci:vendor=3DIntel,card=3Dall build/tests/gem_basic=
 --r multigpu-create-close
> > >=20
> > > IGT-Version: 1.28-g2548a539e (x86_64) (Linux: 6.7.0-rc5 x86_64)
> > > Using IGT_SRANDOM=3D1706630533 for randomisation
> > > Opened device: /dev/dri/card0
> > > Starting subtest: multigpu-create-close
> > > <g:0> Testing creating and closing an object.
> > > <g:1> Opened device: /dev/dri/card1
> > > <g:1> Testing creating and closing an object.
> > > gem_basic: ../lib/drmtest.c:341: _is_already_opened: Assertion `as_id=
x <=3D _opened_fds_count' failed.
> > > Received signal SIGABRT.
> > >=20
> > > Relax that condition and add some more debug prints.
> > >=20
> > > Changes in __search_and_open() was suggested by Zbigniew.
> > >=20
> > > v5: removed caching for names of opened cards
> > >  relaxed opening of filtered devices
> > > v6: fixed assingment in _is_already_open() (Janusz)
> > >  simplify use of this function
> > > v7: restore check for already opened filtered card (Janusz)
> > > v8: limit checks for N-th card to 0...N-1 range (Janusz)
> >=20
> > As we discussed, that was not my intention.
> >=20
>=20
> It may be reverted, see my proposition below.
>=20
> > >  simplify if-else in __search_and_open() (Kamil)
> > >=20
> > > Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > >  lib/drmtest.c | 73 +++++++++++++++++++++++++++++++++++++++----------=
=2D-
> > >  1 file changed, 56 insertions(+), 17 deletions(-)
> > >=20
> > > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > > index 73d9159af..62d31b000 100644
> > > --- a/lib/drmtest.c
> > > +++ b/lib/drmtest.c
> > > @@ -322,35 +322,54 @@ static int _opened_fds_count;
> > >  static void _set_opened_fd(int idx, int fd)
> > >  {
> > >  	assert(idx < ARRAY_SIZE(_opened_fds));
> > > -	assert(idx <=3D _opened_fds_count);
> > > +	assert(idx >=3D 0);
> > > =20
> > >  	_opened_fds[idx].fd =3D fd;
> > > =20
> > >  	assert(fstat(fd, &_opened_fds[idx].stat) =3D=3D 0);
> > > =20
> > > -	_opened_fds_count =3D idx+1;
> > > +	for (int n =3D _opened_fds_count; n < idx; n++)
> > > +		_opened_fds[n].fd =3D -1;
> > > +
> > > +	if (idx >=3D _opened_fds_count)
> > > +		_opened_fds_count =3D idx + 1;
> > >  }
> > > =20
> > > -static bool _is_already_opened(const char *path, int as_idx)
> > > +/* in *err returns -errno or index to _opened_fds[] */
> > > +static bool _is_already_opened(const char *path, int as_idx, int *er=
r)
> > >  {
> > >  	struct stat new;
> > > =20
> > >  	assert(as_idx < ARRAY_SIZE(_opened_fds));
> > > -	assert(as_idx <=3D _opened_fds_count);
> > > +	assert(as_idx >=3D 0);
> > > =20
> > >  	/*
> > >  	 * we cannot even stat the device, so it's of no use - let's claim =
it's
> > >  	 * already opened
> > >  	 */
> > > -	if (igt_debug_on(stat(path, &new) !=3D 0))
> > > +	if (igt_debug_on(stat(path, &new) !=3D 0)) {
> > > +		if (err)
> > > +			*err =3D -errno;
> > > +
> > >  		return true;
> > > +	}
> > > +
> > > +	if (err)
> > > +		*err =3D 0;
> > > +
> > > +	for (int i =3D 0, end =3D min(as_idx, _opened_fds_count); i < end; =
++i) {
> >=20
> > AFAICU from our talk, by limiting the scope to min(as_idx, _opened_fds_=
count)=20
> > you tried to address a different issue -- the as_idx-th card potentiall=
y=20
> > having been already opened before and added to the _opened_fds table, t=
hen=20
> > closed.
> >=20
>=20
> Old code here was:
> > > -	for (int i =3D 0; i < as_idx; ++i) {
>=20
> It can be changed to
>=20
> 	for (int i =3D 0; i < _opened_fds_count; ++i) {
>=20
> with additional code here:
>=20
>         if (i =3D=3D as_idx) continue;
>=20
> as we want to keep compatibility with previous behaviour which allows
>=20
> fd =3D drm_open_driver(DRIVER_XE);
> fd2 =3D drm_open_driver(DRIVER_XE);

OK, but then let's add a comment that explains that special case we need to=
=20
address for backward compatibility.

>=20
> Also note that old code was actually limiting checks here,
> after opening 0...3rd card, call to open card(1) will
> actually only check _opened_fds[0].

The old code could perform those checks within that limited scope only if i=
t=20
was able to open cards in random order, but it wasn't, then it was never=20
taking that path, was it?

>=20
> > > +		if (_opened_fds[i].fd =3D=3D -1)
> > > +			continue;
> > > =20
> > > -	for (int i =3D 0; i < as_idx; ++i) {
> > >  		/* did we cross filesystem boundary? */
> > >  		assert(_opened_fds[i].stat.st_dev =3D=3D new.st_dev);
> > > =20
> > > -		if (_opened_fds[i].stat.st_ino =3D=3D new.st_ino)
> > > +		if (_opened_fds[i].stat.st_ino =3D=3D new.st_ino) {
> > > +			if (err)
> > > +				*err =3D i;
> > > +
> > >  			return true;
> > > +		}
> > >  	}
> > > =20
> > >  	return false;
> > > @@ -359,23 +378,37 @@ static bool _is_already_opened(const char *path=
, int as_idx)
> > >  static int __search_and_open(const char *base, int offset, unsigned =
int chipset, int as_idx)
> > >  {
> > >  	const char *forced;
> > > +	int err;
> > > =20
> > >  	forced =3D forced_driver();
> > >  	if (forced)
> > >  		igt_debug("Force option used: Using driver %s\n", forced);
> > > =20
> > > -	for (int i =3D 0; i < 16; i++) {
> > > +	for (int i =3D 0, idx =3D -1; i < 16 && idx < as_idx; i++) {
> > >  		char name[80];
> > >  		int fd;
> > > =20
> > >  		sprintf(name, "%s%u", base, i + offset);
> > > =20
> > > -		if (_is_already_opened(name, as_idx))
> > > -			continue;
> > > +		if (_is_already_opened(name, as_idx, &err)) {
> > > +			if (err < 0)
> > > +				continue;
> > > +
> > > +			if (idx + 1 < as_idx) {
> > > +				++idx;
> > > +				continue;
> > > +			}
> > > +		}
> > > =20
> > >  		fd =3D __drm_open_device(name, chipset);
> > > -		if (fd !=3D -1)
> > > +		if (fd =3D=3D -1)
> > > +			continue;
> > > +
> > > +		++idx;
> > > +		if (idx =3D=3D as_idx)
> > >  			return fd;
> > > +
> > > +		close(fd);
> > >  	}
> > > =20
> > >  	return -1;
> > > @@ -486,7 +519,7 @@ static bool __get_card_for_nth_filter(int idx, st=
ruct igt_device_card *card)
> > >   *   * idx-th filter (starting with 0, filters are semicolon separat=
ed) is used
> > >   *   * if there is no idx-th filter, goto 2
> > >   *   * first device maching the filter is selected
> > > - *   * if it's already opened (for indexes =3D 0..idx-1) we fail wit=
h -1
> > > + *   * if it's already opened (for indexes !=3D idx) we fail with -1
> > >   *   * otherwise open the device and return the fd
> > >   *
> > >   * 2. compatibility mode - open the first DRM device we can find tha=
t is not
> > > @@ -531,6 +564,7 @@ int __drm_open_driver_another(int idx, int chipse=
t)
> > >  	if (chipset !=3D DRIVER_VGEM && igt_device_filter_count() > idx) {
> > >  		struct igt_device_card card;
> > >  		bool found;
> > > +		int err;
> > > =20
> > >  		found =3D __get_card_for_nth_filter(idx, &card);
> > > =20
> > > @@ -539,14 +573,19 @@ int __drm_open_driver_another(int idx, int chip=
set)
> > >  			found =3D __get_card_for_nth_filter(idx, &card);
> > >  		}
> > > =20
> > > -		if (!found || !strlen(card.card))
> > > +		if (!found || !strlen(card.card)) {
> > >  			igt_warn("No card matches the filter! [%s]\n",
> > >  				 igt_device_filter_get(idx));
> > > -		else if (_is_already_opened(card.card, idx))
> > > -			igt_warn("card maching filter %d is already opened\n", idx);
> > > -		else
> > > +		} else if (_is_already_opened(card.card, idx, &err)) {
> > > +			if (err < 0)
> > > +				igt_warn("cannot stat card maching filter %d errno=3D%d card=3D%=
s\n", idx, err, card.card);
> > > +			else if (idx !=3D err)
> > > +				igt_warn("card maching filter %d is already opened as %d, card=
=3D%s\n", idx, err, card.card);
> > > +			else
> >=20
> > Please note that if the aforementioned loop inside _is_already_opened()=
 is=20
> > limited to min(as_idx, _opened_fds_count) then the above else case is n=
ever=20
> > true since err can never reach idx, then the below assignment is dead c=
ode.
> >=20
>=20
> You are right, I would remove it. I was thinking about change
> here to drop idx !=3D err check, see below.
>=20
> > The issue with before opened and closed cards should be addressed in a=
=20
> > different way and with a separate patch, I believe, maybe by removing=20
> > cards from _opened_fds on close.
> >=20
> > Thanks,
> > Janusz
> >=20
>=20
> That was never done maybe because tests were run only once and
> mostly on one-card system. Also there are cases when dev wants to call
> close() directly, not with drm_close_driver(). After return from this
> function all _fds data is stale, especially after driver reload but
> this is a seperate problem.

Maybe we could provide a function that just cleans up _opened_fds(), to be=
=20
called after a user makes sure all cards have been closed and before next=20
attempt to reopen them.  Then your method for probing the number of cards b=
y=20
opening them and closing we were talking about could call that cleanup=20
function before return.

Thanks,
Janusz

> Imho use case for this was to open all cards in one go and test them.
>=20
> Seperate issue would be to decide it we allow use of repeated card=3D0
> like:
>=20
> sudo IGT_DEVICE=3Dpci:vendor=3DIntel,card=3D0\;pci:vendor=3DIntel,card=3D=
0 \
>     build/tests/gem_basic --r multigpu-create-close
>=20
> as now this will fail in igt_warn("card matching ... is already opened as=
 ...")
>=20
> Regards,
> Kamil
>=20
> > > +				fd =3D __open_driver_exact(card.card, chipset);
> > > +		} else {
> > >  			fd =3D __open_driver_exact(card.card, chipset);
> > > -
> > > +		}
> > >  	} else {
> > >  		/* no filter for device idx, let's open whatever is available */
> > >  		fd =3D __open_driver("/dev/dri/card", 0, chipset, idx);
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20




