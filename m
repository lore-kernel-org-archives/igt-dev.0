Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF76C47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 11:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B097110EB8E;
	Thu,  1 Feb 2024 11:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUSPG7oB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D3910EBD1
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706787240; x=1738323240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yS5WAiRZ2ymnG0ofKEDxkBeMfaT/I55xWntfqp3Bzws=;
 b=CUSPG7oBcXHkR7OIAWJ9dKeHggV1v1EHRCtlhFDESzifAI0pdKe2VIwx
 lzI+15LGVXhSWDxLkIK2wRKt7Ja8+tAEDGOdpzktYQc1p99cEnRosUypZ
 lvzKXZROOIqfLDWXXiOyiPUjjOn8njLGwSpeMefI6JBLpV0XvJnuloKhi
 MKU4oE1GKLx8aw/WKFrFb/vu3KNKdNXfXBH2T15sVNnjpUlGTGSnFwIAH
 aEoavF+mZZLhZlXnybfxqvPECWL5byEfsAx9qNDHU74+jU7Cz0s9Be0hf
 MhK3dcu1WvH1cGur/wH9Mtj1IATL0CuZgEHusNHmaCfVaSDuWW6Gw9IYh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2806904"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="2806904"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="37185498"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.219])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:32:55 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 3/8] lib/drmtest: allow opening cards out of order
Date: Thu, 01 Feb 2024 12:32:51 +0100
Message-ID: <2174136.GUh0CODmnK@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240130170722.44828-4-kamil.konieczny@linux.intel.com>
References: <20240130170722.44828-1-kamil.konieczny@linux.intel.com>
 <20240130170722.44828-4-kamil.konieczny@linux.intel.com>
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

On Tuesday, 30 January 2024 18:07:17 CET Kamil Konieczny wrote:
> Current __drm_open_driver_another() implementation prevents
> opening cards out of order, for example card 3 without previous
> opens of 0..2. This can be seen with three GPU cards system and
> gem_open_basic test:
>=20
> sudo IGT_DEVICE=3Dpci:vendor=3DIntel,card=3Dall build/tests/gem_basic --r=
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
=3D _opened_fds_count' failed.
> Received signal SIGABRT.
>=20
> Relax that condition. Also relax condition for filtered devices and
> allow them to open already opened ones, basically it will allow
> running multi-GPU scenarios on single-GPU system with filter:
>=20
> IGT_DEVICE=3Dpci:vendor=3DIntel,card=3D0\;pci:vendor=3DIntel,card=3D0
>=20
> Changes in __search_and_open() was suggested by Zbigniew.
>=20
> v5:
>  removed caching for names of opened cards
>  relaxed opening of filtered devices
>=20
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 72 +++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 53 insertions(+), 19 deletions(-)
>=20
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 73d9159af..6c6c21b1a 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -322,35 +322,53 @@ static int _opened_fds_count;
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
> =20
>  	assert(as_idx < ARRAY_SIZE(_opened_fds));
> -	assert(as_idx <=3D _opened_fds_count);
> +	assert(as_idx >=3D 0);
> =20
>  	/*
>  	 * we cannot even stat the device, so it's of no use - let's claim it's
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
> +	for (int i =3D 0, end =3D min(_opened_fds_count, as_idx); i < end; ++i)=
 {
> +		if (_opened_fds[i].fd =3D=3D -1)
> +			continue;
> =20
> -	for (int i =3D 0; i < as_idx; ++i) {
>  		/* did we cross filesystem boundary? */
>  		assert(_opened_fds[i].stat.st_dev =3D=3D new.st_dev);
> =20
> -		if (_opened_fds[i].stat.st_ino =3D=3D new.st_ino)
> +		if (_opened_fds[i].stat.st_ino =3D=3D new.st_ino) {
> +			*err =3D i;

Above you take care of err =3D=3D NULL case, here you don't.  I think you h=
ave to=20
choose one way or another and then handle it consequently.

Thanks,
Janusz

> +
>  			return true;
> +		}
>  	}
> =20
>  	return false;
> @@ -359,23 +377,39 @@ static bool _is_already_opened(const char *path, in=
t as_idx)
>  static int __search_and_open(const char *base, int offset, unsigned int =
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
> -		int fd;
> +		int fd =3D -1;
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
> +
> +		if (err >=3D 0)
> +			fd =3D __drm_open_device(name, chipset);
> +		if (fd !=3D -1) {
> +			++idx;
> +			if (idx < as_idx) {
> +				close(fd);
> +				continue;
> +			}
> =20
> -		fd =3D __drm_open_device(name, chipset);
> -		if (fd !=3D -1)
>  			return fd;
> +		}
>  	}
> =20
>  	return -1;
> @@ -486,8 +520,7 @@ static bool __get_card_for_nth_filter(int idx, struct=
 igt_device_card *card)
>   *   * idx-th filter (starting with 0, filters are semicolon separated) =
is used
>   *   * if there is no idx-th filter, goto 2
>   *   * first device maching the filter is selected
> - *   * if it's already opened (for indexes =3D 0..idx-1) we fail with -1
> - *   * otherwise open the device and return the fd
> + *   * open the device and return the fd
>   *
>   * 2. compatibility mode - open the first DRM device we can find that is=
 not
>   *    already opened for indexes 0..idx-1, searching up to 16 device nod=
es
> @@ -542,11 +575,12 @@ int __drm_open_driver_another(int idx, int chipset)
>  		if (!found || !strlen(card.card))
>  			igt_warn("No card matches the filter! [%s]\n",
>  				 igt_device_filter_get(idx));
> -		else if (_is_already_opened(card.card, idx))
> -			igt_warn("card maching filter %d is already opened\n", idx);
> -		else
> -			fd =3D __open_driver_exact(card.card, chipset);
> +		else {
> +			int ret;
> =20
> +			_is_already_opened(card.card, idx, &ret); /* check only filesystem bo=
undary */
> +			fd =3D __open_driver_exact(card.card, chipset);
> +		}
>  	} else {
>  		/* no filter for device idx, let's open whatever is available */
>  		fd =3D __open_driver("/dev/dri/card", 0, chipset, idx);
>=20




