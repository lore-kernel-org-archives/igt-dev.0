Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B406AC48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 13:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B5410E268;
	Wed, 14 Feb 2024 13:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwGFRnNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BEB10E260
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707917532; x=1739453532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j91xW7pnFv/ZO7D60X+4m9zGKU2AueIXHafLzMQomJs=;
 b=lwGFRnNe0O+lLcMbQRcVJ8YWOIhYVFUzqkXNVK5ipKMZsCvUvCKuhspH
 CIYewZorAOkz/539Jgszb3C/2P254UQQWMfTZfll4In0f+bv/zeuQMtf2
 Mahu1tkhBDMcCBrLKLpgUOhbGlSx0GDmZpvOJt9msv6GoRgqCNonn7doA
 GaNME3MlzeY2U3X/Xupl8E5mruLNfuWCQFBxGGzwIk0bQ888hBvdeCcW9
 xUuRzefI+e+bkEQWpeHx9q5Bl8035f0jS1gB5yECOgVhn7Tl0IcDVfh8O
 XwEKITMY9dMNMz1odumxj6AfUd+BybhfpmaPD54kkCGayqR34atJbRD0p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13350352"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="13350352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 05:32:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3258173"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.3.135])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 05:32:08 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: drop legacy path from filtered opens
Date: Wed, 14 Feb 2024 14:32:05 +0100
Message-ID: <2295161.IFkqi6BYcA@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240214131610.41709-1-kamil.konieczny@linux.intel.com>
References: <20240214131610.41709-1-kamil.konieczny@linux.intel.com>
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

On Wednesday, 14 February 2024 14:16:10 CET Kamil Konieczny wrote:
> For some multi-GPU tests user can check them on single-GPU board
> with the help of repeating same card in --device option or
> environment var IGT_DEVICE:
>=20
> sudo IGT_DEVICE=3Dpci:vendor=3DIntel,card=3D0\;pci:vendor=3DIntel,card=3D=
0 \
> 	build/tests/gem_basic --r multigpu-create-close
>=20
> but is unable to use it due to current implementation of device
> opening in function __drm_open_driver_another(). It will also
> prevent restricting multiGPU test to only two cards on three or
> four card board.
>=20
> To allow this separate legacy opening path from filtered one and
> do not fallback into legacy path when index for card exceeds
> number of filtered devices. Use local opened fds table only for
> legacy opens so that path is not affected.
> When filters are used for multi-GPU tests user should provide all
> of them needed for testing, this could be done with the help of
> incrementing filters or with "card=3Dall":
>=20
> sudo IGT_DEVICE=3Dpci:vendor=3DIntel,card=3Dall \
> 	build/tests/gem_basic --r multigpu-create-close
>=20
> v2: improving description, using filtered_count var (Janusz)
>   changing drmtest: to lib/drmtest: (Kamil)
>   adding Lukasz Laguna to Cc: (Kamil)
>=20
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  lib/drmtest.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 52b5a2020..e718d6291 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -481,13 +481,12 @@ static bool __get_card_for_nth_filter(int idx, stru=
ct igt_device_card *card)
>   *
>   * This function opens device in the following order:
>   *
> - * 1. when --device arguments are present:
> + * 1. when --device arguments are present or IGT_DEVICE env var is used:
>   *   * device scanning is executed,
>   *   * idx-th filter (starting with 0, filters are semicolon separated) =
is used
> - *   * if there is no idx-th filter, goto 2
> + *   * if there is no idx-th filter fail with -1
>   *   * first device maching the filter is selected
> - *   * if it's already opened (for indexes =3D 0..idx-1) we fail with -1
> - *   * otherwise open the device and return the fd
> + *   * open the device and return the fd
>   *
>   * 2. compatibility mode - open the first DRM device we can find that is=
 not
>   *    already opened for indexes 0..idx-1, searching up to 16 device nod=
es
> @@ -526,12 +525,19 @@ static bool __get_card_for_nth_filter(int idx, stru=
ct igt_device_card *card)
>   */
>  int __drm_open_driver_another(int idx, int chipset)
>  {
> +	int filter_count =3D igt_device_filter_count();
>  	int fd =3D -1;
> =20
> -	if (chipset !=3D DRIVER_VGEM && igt_device_filter_count() > idx) {
> +	if (chipset !=3D DRIVER_VGEM && filter_count) {
>  		struct igt_device_card card;
>  		bool found;
> =20
> +		if (idx < 0 || idx >=3D filter_count) {
> +			igt_warn("Cannot open, index out of bounds: %d, filter_count=3D%d\n",
> +				 idx, filter_count);
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
> -			igt_warn("card maching filter %d is already opened\n", idx);
>  		else
>  			fd =3D __open_driver_exact(card.card, chipset);
> =20
>  	} else {
>  		/* no filter for device idx, let's open whatever is available */
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




