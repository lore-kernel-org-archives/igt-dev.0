Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD3B10E1DD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 08:09:37 +0000 (UTC)
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 08:09:19 +0000
Message-ID: <BL0PR11MB3475C96B65402DE2315E88E5D9AFA@BL0PR11MB3475.namprd11.prod.outlook.com>
References: <20231103160148.94811-1-kamil.konieczny@linux.intel.com>
 <20231103160148.94811-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231103160148.94811-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] lib/drmtest: add multi-GPU
 helpers for filtered devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Acked-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Friday, November 3, 2023 5:02 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t v2 2/3] lib/drmtest: add multi-GPU helper=
s for
> filtered devices
>=20
> Created multiGPU helpers for filtering and opening GPU cards.
> Opening card depend only on index as chipset was given during filtering.
>=20
> v2: simplify filtering as it moved to igt_device_scan (Zbigniew)
>   simplify also opening, add new function chipset_to_vendor_str,
>   removed clearing opened devices as it is not essential (Kamil)
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 49
> +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/drmtest.h |  3 +++
>  2 files changed, 52 insertions(+)
>=20
> diff --git a/lib/drmtest.c b/lib/drmtest.c index e1da66c87..5c19fd21d 100=
644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -627,6 +627,11 @@ static const char *chipset_to_str(int chipset)
>  	}
>  }
>=20
> +static const char *chipset_to_vendor_str(int chipset) {
> +	return chipset =3D=3D DRIVER_XE ? chipset_to_str(DRIVER_INTEL) :
> +chipset_to_str(chipset); }
> +
>  /**
>   * drm_open_driver:
>   * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL @@=
 -
> 777,6 +782,50 @@ int drm_reopen_driver(int fd)
>  	return fd;
>  }
>=20
> +int drm_prepare_filtered_multigpu(int chipset) {
> +	const char *vendor =3D chipset_to_vendor_str(chipset);
> +
> +	return igt_device_prepare_filtered_view(vendor);
> +}
> +
> +/**
> + * drm_open_filtered_card:
> + * @idx: index for GPU to open
> + *
> + * Open N-th GPU from filtered list
> + *
> + * Returns:
> + * Opened device or -1 if error.
> + */
> +int drm_open_filtered_card(int idx)
> +{
> +	struct igt_device_card card;
> +	const char *filter;
> +	int fd =3D -1;
> +
> +	if (idx < 0 || idx >=3D igt_device_filter_count()) {
> +		igt_debug("Invalid filter index %d\n", idx);
> +		return -1;
> +	}
> +
> +	filter =3D igt_device_filter_get(idx);
> +	if (igt_device_card_match(filter, &card))
> +		fd =3D igt_open_card(&card);
> +
> +	if (fd >=3D 0) {
> +		igt_debug("Opened GPU%d card: %s\n", idx, card.card);
> +		log_opened_device_path(card.card);
> +		/* Cache xe_device struct. */
> +		if (is_xe_device(fd))
> +			xe_device_get(fd);
> +	} else {
> +		igt_debug("Opening GPU%d failed, card: %s\n", idx,
> card.card);
> +	}
> +
> +	return fd;
> +}
> +
>  void igt_require_amdgpu(int fd)
>  {
>  	igt_require(is_amdgpu_device(fd));
> diff --git a/lib/drmtest.h b/lib/drmtest.h index 97ab6e759..909a0c12c
> 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -109,6 +109,9 @@ int drm_close_driver(int fd);
>=20
>  int drm_reopen_driver(int fd);
>=20
> +int drm_prepare_filtered_multigpu(int chipset); int
> +drm_open_filtered_card(int idx);
> +
>  void igt_require_amdgpu(int fd);
>  void igt_require_intel(int fd);
>  void igt_require_i915(int fd);
> --
> 2.42.0
