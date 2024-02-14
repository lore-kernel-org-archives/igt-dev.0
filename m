Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709E9C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 12:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1751310E219;
	Wed, 14 Feb 2024 12:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0wRgXxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5978C10E1E2
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707913174; x=1739449174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7399J1VSuX2hSJ8kAB79kmGLZrCY3MAQxAs9dGdhJxY=;
 b=j0wRgXxTy6cogHxp0kzmA7Ij9AJi/dvXSDyugVfSUPiCKoXQE7ZMuNLJ
 Q0r/kaMWHAUZJ4eFoEqhYJh6U8A+moKvZ7Vnh9bsF+YseAzW5qIPg1Wdi
 pTc71ag382JgKlORsYfqgdCOZsqK5Bad5GnoGOLZnssU82J1OmP2YekVh
 yh+FYJk3Ks72zI/nUHwd+f4sTp/OMnBr8VL84vF1GsyCLu9Imj2eEYgQr
 D2GVmtHT78A/XJuDFXYUCcMPBDHGVZ6Z5uGIb9r8sesXGgEvzbWUCpCAq
 pwt2H5U9NAK2UHFWMldTEICioEYFONPvbMMAVVLgIJrGNyPk6LiDQO4Cm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1861969"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1861969"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 04:19:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7808615"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.3.135])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 04:19:18 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>, Chris Wilson <chris@chris-wilson.co.uk>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v1] drmtest: drop legacy path from filtered opens
Date: Wed, 14 Feb 2024 13:19:14 +0100
Message-ID: <7089431.aoefvbuG5b@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240213175722.40003-1-kamil.konieczny@linux.intel.com>
References: <20240213175722.40003-1-kamil.konieczny@linux.intel.com>
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

On Tuesday, 13 February 2024 18:57:22 CET Kamil Konieczny wrote:
> Function __drm_open_driver_another() has two paths, first being
> for filtered devices, second for non-filtered ones. Separate
> them and do not fallback into legacy path when index for card
> exceeds number of filtered devices. Use local opened fds table
> only for legacy calls as this table can become stale after
> driver reload. In filtered one do not use opened fds guards as
> this is pointless, we already have info about card wanted by user
> and we do not need to check if we ancounter already opened one.
> Also allow opening the same device if user wants it, for example
> with repeating same card number in --device or IGT_DEVICE:
>=20
> sudo IGT_DEVICE=3Dpci:vendor=3DIntel,card=3D0\;pci:vendor=3DIntel,card=3D=
0 \
> 	build/tests/gem_basic --r multigpu-create-close

While the code below looks good to me, I'm missing an explicit why part fro=
m=20
your commit description, not to be deduced from the what part.  Potential=20
candidates:
=2D _opened_fds table can become stale after driver reload, we need to fix =
it,
=2D users need the ability to test their multi-gpu code on single-gpu=20
  configurations (e.g., because of limited availability of multi-gpu hardwa=
re=20
  for testing),
=2D to avoid confusion, a (sub)set of cards used by a multi-gpu tests shoul=
d be=20
  predictable: if the test may exercise all available cards in any order th=
en=20
  no device filters are needed, otherwise user provided device filters must=
=20
  enumerate every card the test is going to exercise and in correct order.

Thanks,
Janusz

>=20
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 52b5a2020..307c44ef6 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -481,13 +481,12 @@ static bool __get_card_for_nth_filter(int idx, stru=
ct=20
igt_device_card *card)
>   *
>   * This function opens device in the following order:
>   *
> - * 1. when --device arguments are present:
> + * 1. when --device arguments are present or IGT_DEVICE env var is used:
>   *   * device scanning is executed,
>   *   * idx-th filter (starting with 0, filters are semicolon separated) =
is=20
used
> - *   * if there is no idx-th filter, goto 2
> + *   * if there is no idx-th filter fail with -1
>   *   * first device maching the filter is selected
> - *   * if it's already opened (for indexes =3D 0..idx-1) we fail with -1
> - *   * otherwise open the device and return the fd
> + *   * open the device and return the fd
>   *
>   * 2. compatibility mode - open the first DRM device we can find that is=
=20
not
>   *    already opened for indexes 0..idx-1, searching up to 16 device nod=
es
> @@ -528,10 +527,17 @@ int __drm_open_driver_another(int idx, int chipset)
>  {
>  	int fd =3D -1;
> =20
> -	if (chipset !=3D DRIVER_VGEM && igt_device_filter_count() > idx) {
> +	if (chipset !=3D DRIVER_VGEM && igt_device_filter_count()) {
> +		int count =3D igt_device_filter_count();
>  		struct igt_device_card card;
>  		bool found;
> =20
> +		if (idx < 0 || idx >=3D count) {
> +			igt_warn("Cannot open, index into filter out of=20
bounds: %d, count=3D%d\n",
> +				 idx, count);
> +			return -1;
> +		}
> +
>  		found =3D __get_card_for_nth_filter(idx, &card);
> =20
>  		if (!found) {
> @@ -542,19 +548,17 @@ int __drm_open_driver_another(int idx, int chipset)
>  		if (!found || !strlen(card.card))
>  			igt_warn("No card matches the filter! [%s]\n",
>  				 igt_device_filter_get(idx));
> -		else if (_is_already_opened(card.card, idx))
> -			igt_warn("card maching filter %d is already=20
opened\n", idx);
>  		else
>  			fd =3D __open_driver_exact(card.card, chipset);
> =20
>  	} else {
>  		/* no filter for device idx, let's open whatever is=20
available */
>  		fd =3D __open_driver("/dev/dri/card", 0, chipset, idx);
> +		if (fd >=3D 0)
> +			_set_opened_fd(idx, fd);
>  	}
> =20
>  	if (fd >=3D 0) {
> -		_set_opened_fd(idx, fd);
> -
>  		/* Cache xe_device struct. */
>  		if (is_xe_device(fd))
>  			xe_device_get(fd);
>=20




