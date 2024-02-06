Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C9BC4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 14:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB50112C46;
	Tue,  6 Feb 2024 14:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZA/ExxHb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F51112C46
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707229688; x=1738765688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dng5tirud4zR0FfhY2PHfmwkzgC3ZgpVfHZcZq77KRc=;
 b=ZA/ExxHbL7TREbX7UxzbCMg4FBIvrDDjRdB4ADKWagI7mElR6pJB7OOJ
 QUxSHIPSd7AiYbEwkEi90KRk2YSBUVQzUaiIKtezlMb0AQ1evB4n0YfYc
 wDNuokmfhktaPhARBVhyPocBUygU7AGGnve6cdF3U/xwCUEsBmY01HFRv
 Ry9T9DJpu3hpY966HYsAw3svZXNZs42NqGaL8LmDZ6v2djfv+gpsrus/G
 sCwZzSkC3csgYagHT/R0eL/dUBSBdVpi3ei7zwuUcQQjcPGvALKZyJ7MD
 bP1BQcH2s3foTyt//OxacEe5n5rsctXQNs6bIdtsUaTTcWaKAxgBEy1WB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="435895034"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="435895034"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 06:28:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1058190"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.162])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 06:27:58 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v7 3/8] lib/drmtest: allow opening cards out of order
Date: Tue, 06 Feb 2024 15:27:55 +0100
Message-ID: <3205712.5fSG56mABF@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240202153517.58281-4-kamil.konieczny@linux.intel.com>
References: <20240202153517.58281-1-kamil.konieczny@linux.intel.com>
 <20240202153517.58281-4-kamil.konieczny@linux.intel.com>
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

On Friday, 2 February 2024 16:35:12 CET Kamil Konieczny wrote:
> Current __drm_open_driver_another() implementation prevents
> opening cards out of order, for example card 3 without previous

How about "in random order" instead of "out of order", here and in commit=20
message (Subject: field)?

> opens of 0..2. This can be seen with three GPU cards system and
> gem_open_basic test:
>=20
> sudo IGT_DEVICE=3Dpci:vendor=3DIntel,card=3Dall build/tests/gem_basic --r=
=20
multigpu-create-close
>=20
> IGT-Version: 1.28-g2548a539e (x86_64) (Linux: 6.7.0-rc5 x86_64)
> Using IGT_SRANDOM=3D1706630533 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: multigpu-create-close
> <g:0> Testing creating and closing an object.
> <g:1> Opened device: /dev/dri/card1
> <g:1> Testing creating and closing an object.
> gem_basic: ../lib/drmtest.c:341: _is_already_opened: Assertion `as_idx <=
=3D=20
_opened_fds_count' failed.
> Received signal SIGABRT.
>=20
> Relax that condition
=2E.., in both _is_already_opened() and _set_opened_fd() which is called ne=
xt,=20
=2E..
> and=20
=2E.. add ...
> some more debug prints.

Is that what you meant?

>=20
> Changes in __search_and_open() was suggested by Zbigniew.

Either "Change ... was ..." or "Changes ... were ...".  However, ...

>=20
> v5: removed caching for names of opened cards
>  relaxed opening of filtered devices
> v6: fixed assingment in _is_already_open() (Janusz)
>  simplify use of this function
> v7: restore check for already opened filtered card (Janusz)
>=20
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 81 +++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 62 insertions(+), 19 deletions(-)
>=20
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 73d9159af..9101425bd 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -322,60 +322,97 @@ static int _opened_fds_count;
>  static void _set_opened_fd(int idx, int fd)
>  {
>  	assert(idx < ARRAY_SIZE(_opened_fds));
> -	assert(idx <=3D _opened_fds_count);
> +	assert(idx >=3D 0);
> =20
>  	_opened_fds[idx].fd =3D fd;
> =20
>  	assert(fstat(fd, &_opened_fds[idx].stat) =3D=3D 0);
> =20
> -	_opened_fds_count =3D idx+1;
> +	for (int n =3D _opened_fds_count; n < idx; n++)
> +		_opened_fds[n].fd =3D -1;
> +
> +	if (idx >=3D _opened_fds_count)
> +		_opened_fds_count =3D idx + 1;
>  }
> =20
> -static bool _is_already_opened(const char *path, int as_idx)
> +/* in *err returns -errno or index to _opened_fds[] */
> +static bool _is_already_opened(const char *path, int as_idx, int *err)
>  {
>  	struct stat new;
> +	bool found =3D false;
> =20
>  	assert(as_idx < ARRAY_SIZE(_opened_fds));
> -	assert(as_idx <=3D _opened_fds_count);
> +	assert(as_idx >=3D 0);
> =20
>  	/*
>  	 * we cannot even stat the device, so it's of no use - let's claim=20
it's
>  	 * already opened
>  	 */
> -	if (igt_debug_on(stat(path, &new) !=3D 0))
> +	if (igt_debug_on(stat(path, &new) !=3D 0)) {
> +		if (err)
> +			*err =3D -errno;
> +
>  		return true;
> +	}
> +
> +	if (err)
> +		*err =3D 0;
> +
> +	for (int i =3D 0; i < _opened_fds_count; ++i) {
> +		if (_opened_fds[i].fd =3D=3D -1)
> +			continue;
> =20
> -	for (int i =3D 0; i < as_idx; ++i) {
>  		/* did we cross filesystem boundary? */
>  		assert(_opened_fds[i].stat.st_dev =3D=3D new.st_dev);
> =20
> -		if (_opened_fds[i].stat.st_ino =3D=3D new.st_ino)
> -			return true;
> +		if (_opened_fds[i].stat.st_ino =3D=3D new.st_ino) {
> +			found =3D true;
> +			if (err)
> +				*err =3D i;
> +
> +			if (i !=3D as_idx)
> +				return true;
> +		}
>  	}
> =20
> -	return false;
> +	return found;
>  }
> =20
>  static int __search_and_open(const char *base, int offset, unsigned int=
=20
chipset, int as_idx)
>  {
>  	const char *forced;
> +	int err;
> =20
>  	forced =3D forced_driver();
>  	if (forced)
>  		igt_debug("Force option used: Using driver %s\n", forced);
> =20
> -	for (int i =3D 0; i < 16; i++) {
> +	for (int i =3D 0, idx =3D -1; i < 16 && idx < as_idx; i++) {
>  		char name[80];
>  		int fd;
> =20
>  		sprintf(name, "%s%u", base, i + offset);
> =20
> -		if (_is_already_opened(name, as_idx))
> -			continue;
> +		if (_is_already_opened(name, as_idx, &err)) {
> +			if (err < 0)
> +				continue;
> +
> +			if (idx + 1 < as_idx) {
> +				++idx;
> +				continue;
> +			}
> +		}
> =20
>  		fd =3D __drm_open_device(name, chipset);
> -		if (fd !=3D -1)
> +		if (fd !=3D -1) {
> +			++idx;
> +			if (idx < as_idx) {
> +				close(fd);
> +				continue;
> +			}
> +
>  			return fd;
> +		}
>  	}
> =20
>  	return -1;
> @@ -486,7 +523,7 @@ static bool __get_card_for_nth_filter(int idx, struct=
=20
igt_device_card *card)
>   *   * idx-th filter (starting with 0, filters are semicolon separated) =
is=20
used
>   *   * if there is no idx-th filter, goto 2
>   *   * first device maching the filter is selected
> - *   * if it's already opened (for indexes =3D 0..idx-1) we fail with -1
> + *   * if it's already opened (for indexes !=3D idx) we fail with -1
>   *   * otherwise open the device and return the fd
>   *
>   * 2. compatibility mode - open the first DRM device we can find that is=
=20
not
> @@ -531,6 +568,7 @@ int __drm_open_driver_another(int idx, int chipset)
>  	if (chipset !=3D DRIVER_VGEM && igt_device_filter_count() > idx) {
>  		struct igt_device_card card;
>  		bool found;
> +		int err;
> =20
>  		found =3D __get_card_for_nth_filter(idx, &card);
> =20
> @@ -539,14 +577,19 @@ int __drm_open_driver_another(int idx, int chipset)
>  			found =3D __get_card_for_nth_filter(idx, &card);
>  		}
> =20
> -		if (!found || !strlen(card.card))
> +		if (!found || !strlen(card.card)) {
>  			igt_warn("No card matches the filter! [%s]\n",
>  				 igt_device_filter_get(idx));
> -		else if (_is_already_opened(card.card, idx))
> -			igt_warn("card maching filter %d is already=20
opened\n", idx);
> -		else
> +		} else if (_is_already_opened(card.card, idx, &err)) {
> +			if (err < 0)
> +				igt_warn("cannot stat card maching=20
filter %d errno=3D%d card=3D%s\n", idx, err, card.card);
> +			else if (idx !=3D err)
> +				igt_warn("card maching filter %d is=20
already opened as %d, card=3D%s\n", idx, err, card.card);
> +			else
> +				fd =3D __open_driver_exact(card.card,=20
chipset);
> +		} else {
>  			fd =3D __open_driver_exact(card.card, chipset);
> -
> +		}
>  	} else {
>  		/* no filter for device idx, let's open whatever is=20
available */
>  		fd =3D __open_driver("/dev/dri/card", 0, chipset, idx);
>=20

I'm still not sure if all these changes are really needed for resolution of=
=20
the issue you called in your commit description.  Doesn't a significant par=
t=20
of them belong to a future patch that is going to allow reopening cards=20
already opened?  For me, the following subset of changes effectively kills =
the=20
failure that may now pop up when opening cards in random order.

Thanks,
Janusz

=2D--
@@ -320,34 +320,41 @@ static struct {
 static int _opened_fds_count;
=20
 static void _set_opened_fd(int idx, int fd)
 {
 	assert(idx < ARRAY_SIZE(_opened_fds));
=2D	assert(idx <=3D _opened_fds_count);
+	assert(idx >=3D 0);
=20
 	_opened_fds[idx].fd =3D fd;
=20
 	assert(fstat(fd, &_opened_fds[idx].stat) =3D=3D 0);
=20
=2D	_opened_fds_count =3D idx+1;
+	for (int n =3D _opened_fds_count; n < idx; n++)
+		_opened_fds[n].fd =3D -1;
+
+	if (idx >=3D _opened_fds_count)
+		_opened_fds_count =3D idx + 1;
 }
=20
 static bool _is_already_opened(const char *path, int as_idx)
 {
 	struct stat new;
=20
 	assert(as_idx < ARRAY_SIZE(_opened_fds));
=2D	assert(as_idx <=3D _opened_fds_count);
+	assert(as_idx >=3D 0);
=20
 	/*
 	 * we cannot even stat the device, so it's of no use - let's claim=20
it's
 	 * already opened
 	 */
 	if (igt_debug_on(stat(path, &new) !=3D 0))
 		return true;
=20
=2D	for (int i =3D 0; i < as_idx; ++i) {
+	for (int i =3D 0; i < _opened_fds_count; ++i) {
+		if (_opened_fds[i].fd =3D=3D -1)
+			continue;
+
 		/* did we cross filesystem boundary? */
 		assert(_opened_fds[i].stat.st_dev =3D=3D new.st_dev);
=20
 		if (_opened_fds[i].stat.st_ino =3D=3D new.st_ino)
 			return true;
@@ -484,11 +491,11 @@ static bool __get_card_for_nth_filter(int idx, struct=
=20
igt_device_card *card)
  * 1. when --device arguments are present:
  *   * device scanning is executed,
  *   * idx-th filter (starting with 0, filters are semicolon separated) is=
=20
used
  *   * if there is no idx-th filter, goto 2
  *   * first device maching the filter is selected
=2D *   * if it's already opened (for indexes =3D 0..idx-1) we fail with -1
+ *   * if it's already opened we fail with -1
  *   * otherwise open the device and return the fd
  *
  * 2. compatibility mode - open the first DRM device we can find that is n=
ot
  *    already opened for indexes 0..idx-1, searching up to 16 device nodes
  *





