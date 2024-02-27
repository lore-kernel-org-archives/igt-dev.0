Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37087C54798
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 16:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD0E10E2D8;
	Tue, 27 Feb 2024 16:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQhh2ldb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D81B10E2D8
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 16:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709051820; x=1740587820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqi6pGm/wrCByCYJN/fAB6QRHlXMbNK3YpkngihFK4I=;
 b=RQhh2ldbILq7Foaq9GRAZEAiXn08laHopeEdgF/qYUz+j5kzjqVFEtcH
 ATc1N6EBSzRNuLFMZ8+wWHarYgjdibXlhlzGuewVGGm3VWDf4pVCyBiMC
 IyNUmVBI5PWfR67Ck46hrLQaJFuUWc4O1HYQtIyIQ/bxideHd3nxCbaDI
 wQ33vYWX/hHST5CRgp9z73FeBE8Z42X1885DOmePiyBD3THz8h/ZM0bl0
 RddYVDjU8+eV8ZWNeFd3JIXxTjUXhI7zVhV82Cn0JBQyWH/p0QYdWoN2E
 lKT75KKY22IHWV1HA66hWM7uYeOdF28n4upvEDj1uQTz1uaDtZEPt/0rW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14825836"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="14825836"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 08:36:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7078188"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.4.234])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 08:36:56 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v5] lib/drmtest: drop legacy check from filtered
 opens
Date: Tue, 27 Feb 2024 17:36:52 +0100
Message-ID: <13467275.uLZWGnKmhe@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240219173534.38360-1-kamil.konieczny@linux.intel.com>
References: <20240219173534.38360-1-kamil.konieczny@linux.intel.com>
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

On Monday, 19 February 2024 18:35:34 CET Kamil Konieczny wrote:
> For some multi-GPU tests user can check them on single-GPU board
> with the help of repeating same card in --device option or
> environment var IGT_DEVICE:
>=20
> sudo IGT_DEVICE=3Dpci:vendor=3DIntel,card=3D0\;pci:vendor=3DIntel,card=3D=
0 \
> 	build/tests/gem_basic --r multigpu-create-close
>=20
> but is unable to use it due to current implementation of device
> opening in function __drm_open_driver_another().
>=20
> To allow this drop legacy check for already opened device when
> using filters.

The _is_already_opened(fd) check, introduced together with=20
__drm_open_driver_another() by commit 4e0597fd0c6eae ("lib/drmtest: Introdu=
ce=20
__drm_open_driver_another"), was added to both legacy and filter based=20
processing paths.  Commit description didn't clarify its purpose.

I'm not sure if and why we should keep it in the legacy path while removing=
 it=20
from the filter based.

Thanks,
Janusz

>=20
> v2: improving description, using filtered_count var (Janusz)
>   changing drmtest: to lib/drmtest: (Kamil)
>   adding Lukasz Laguna to Cc: (Kamil)
> v3: for out-of-bound index print debug, not a warning (Kamil)
> v4: restored using filters number for filtered path and restored
>   setting opened fds for legacy tests, changed description (Kamil)
> v5: drop check for negative idx (Janusz, Zbigniew)
>=20
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> ---
>  lib/drmtest.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 52b5a2020..aa1096e96 100644
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
> @@ -542,8 +541,6 @@ int __drm_open_driver_another(int idx, int chipset)
>  		if (!found || !strlen(card.card))
>  			igt_warn("No card matches the filter! [%s]\n",
>  				 igt_device_filter_get(idx));
> -		else if (_is_already_opened(card.card, idx))
> -			igt_warn("card maching filter %d is already opened\n", idx);
>  		else
>  			fd =3D __open_driver_exact(card.card, chipset);
> =20
>=20




