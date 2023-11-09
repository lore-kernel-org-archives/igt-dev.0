Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5535E10E1C9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 07:44:32 +0000 (UTC)
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 07:44:28 +0000
Message-ID: <BL0PR11MB3475768B3AC29C078D454DFDD9AFA@BL0PR11MB3475.namprd11.prod.outlook.com>
References: <20231103160148.94811-1-kamil.konieczny@linux.intel.com>
 <20231103160148.94811-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231103160148.94811-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/3] lib/igt_device_scan: add
 multigpu filtering view
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
> Subject: [igt-dev] [PATCH i-g-t v2 1/3] lib/igt_device_scan: add multigpu
> filtering view
>=20
> Created multiGPU filtering for GPU cards. When used with --device or
> IGT_DEVICE, this will just count cards found with given filtering options=
,
> otherwise will count them with the help of vendor filtering.
>     Filtering is not restricted and will allow to re-open already opened =
card, if
> user gives something like:
>=20
> IGT_DEVICE=3Dpci:vendor=3Dintel,device=3Ddiscrete,card=3D0\;pci:vendor=3D=
intel,device
> =3Ddiscrete,card=3D0
> or
> IGT_DEVICE=3Dpci:vendor=3Dintel,card=3D0\;pci:vendor=3Dintel,card=3D0
>=20
> For discrete cards one can use:
> IGT_DEVICE=3Dpci:vendor=3Dintel,device=3Ddiscrete,card=3Dall
>=20
> v2: move filtering into igt_device_scan.c (Zbigniew)
>   filter all GPUs, not only discrete (Zbigniew)
>   simplify checks for unsupported drivers like vgem (Kamil)
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_device_scan.c | 62
> +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device_scan.h |  3 +++
>  2 files changed, 65 insertions(+)
>=20
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c index
> f4f95fef3..fbf3fa482 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -2065,3 +2065,65 @@ int igt_open_render(struct igt_device_card *card)
>=20
>  	return open(card->render, O_RDWR);
>  }
> +
> +/**
> + * igt_device_prepare_filtered_view:
> + * @vendor: name for GPUs vendor to search, eg. "intel"
> + *
> + * Filter GPU devices for given vendor or with supplied --device
> + * option or IGT_DEVICE environment variable.
> + *
> + * Returns:
> + * Number of filtered GPUs for a vendor or number of filters.
> + */
> +int igt_device_prepare_filtered_view(const char *vendor) {
> +	int gpu_count;
> +
> +	gpu_count =3D igt_device_filter_count();
> +	if (!gpu_count) {
> +		char gpu_filter[256];
> +
> +		igt_assert(vendor);
> +		if (!strcmp(vendor, "vgem") || !strcmp(vendor, "other")) {
> +			igt_debug("Unsupported vendor: %s\n", vendor);
> +			return 0;
> +		}
> +
> +		if (!strcmp(vendor, "any")) {
> +			igt_debug("Chipset DRIVER_ANY unsupported
> without --device filters\n");
> +			return 0;
> +		}
> +
> +		igt_assert(snprintf(gpu_filter, sizeof(gpu_filter),
> "pci:vendor=3D%s,card=3Dall",
> +				    vendor) < sizeof(gpu_filter));
> +
> +		igt_device_filter_add(gpu_filter); // fill-in filters for all GPUs
> +		gpu_count =3D igt_device_filter_count();
> +		igt_debug("Found %d GPUs for vendor: %s\n", gpu_count,
> vendor);
> +	} else {
> +		struct igt_device_card card;
> +		bool found;
> +		int count =3D 0;
> +
> +		for (int i =3D 0; i < gpu_count; i++) {
> +			const char *filter;
> +
> +			filter =3D igt_device_filter_get(i);
> +			found =3D igt_device_card_match(filter, &card);
> +			if (found && strlen(card.card)) {
> +				igt_debug("Found GPU%d card %s\n", i,
> card.card);
> +				++count;
> +			}
> +		}
> +
> +		if (count < gpu_count) {
> +			igt_debug("Counted GPUs %d lower than number of
> filters %d\n", count, gpu_count);
> +			gpu_count =3D count;
> +		} else {
> +			igt_debug("Found %d GPUs\n", gpu_count);
> +		}
> +	}
> +
> +	return gpu_count;
> +}
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h index
> b8f6a843d..48690e236 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -93,4 +93,7 @@ char *igt_device_get_pretty_name(struct
> igt_device_card *card, bool numeric);  int igt_open_card(struct
> igt_device_card *card);  int igt_open_render(struct igt_device_card *card=
);
>=20
> +/* Add or use filters to match multiGPU devices */ int
> +igt_device_prepare_filtered_view(const char *vendor);
> +
>  #endif /* __IGT_DEVICE_SCAN_H__ */
> --
> 2.42.0
