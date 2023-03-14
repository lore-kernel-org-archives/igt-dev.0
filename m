Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9C110E771
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 10:49:59 +0000 (UTC)
Date: Tue, 14 Mar 2023 11:49:54 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230314114954.788f7484@maurocar-mobl2>
In-Reply-To: <20230314104459.41040-1-zbigniew.kempczynski@intel.com>
References: <20230314104459.41040-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe_query: Add device id helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 14 Mar 2023 11:44:59 +0100
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> Add support to query XE_QUERY_CONFIG_REV_AND_DEVICE_ID and xe_dev_id()
> helper.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/xe/xe_query.c | 17 +++++++++++++++++
>  lib/xe/xe_query.h |  4 ++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index a6926057f0..701ab8fde0 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -247,6 +247,7 @@ struct xe_device *xe_device_get(int fd)
>  	xe_dev->config =3D xe_query_config_new(fd);
>  	xe_dev->number_gt =3D xe_dev->config->info[XE_QUERY_CONFIG_GT_COUNT];
>  	xe_dev->va_bits =3D xe_dev->config->info[XE_QUERY_CONFIG_VA_BITS];
> +	xe_dev->rev_dev_id =3D xe_dev->config->info[XE_QUERY_CONFIG_REV_AND_DEV=
ICE_ID];
>  	xe_dev->gts =3D xe_query_gts_new(fd);
>  	xe_dev->memory_regions =3D __memory_regions(xe_dev->gts);
>  	xe_dev->hw_engines =3D xe_query_engines_new(fd, &xe_dev->number_hw_engi=
nes);
> @@ -465,6 +466,22 @@ xe_dev_FN(xe_supports_faults, supports_faults, bool);
>   */
>  xe_dev_FN(xe_va_bits, va_bits, uint32_t);
> =20
> +/**
> + * xe_dev_id:
> + * @fd: xe device fd
> + *
> + * Returns 16-bit device id for xe device @fd.
> + */
> +uint16_t xe_dev_id(int fd)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev =3D find_in_cache(fd);
> +	igt_assert(xe_dev);
> +
> +	return xe_dev->rev_dev_id & 0xffff;
> +}
> +
>  igt_constructor
>  {
>  	xe_device_cache_init();
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index fe1343f616..12d2800b48 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -58,6 +58,9 @@ struct xe_device {
> =20
>  	/** @va_bits: va length in bits */
>  	uint32_t va_bits;
> +
> +	/** @rev_dev_id: device id */
> +	uint16_t rev_dev_id;
>  };
> =20
>  #define for_each_hw_engine(__fd, __hwe) \
> @@ -85,6 +88,7 @@ bool xe_has_vram(int fd);
>  uint64_t xe_vram_size(int fd, int gt);
>  uint32_t xe_get_default_alignment(int fd);
>  uint32_t xe_va_bits(int fd);
> +uint16_t xe_dev_id(int fd);
>  bool xe_supports_faults(int fd);
>  const char *xe_engine_class_string(uint32_t engine_class);
> =20
