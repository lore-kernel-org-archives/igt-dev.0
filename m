Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6690E10E531
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 08:52:53 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>
Date: Tue, 11 Oct 2022 10:52:47 +0200
Message-ID: <2202473.HovnAMPojK@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <20221011053418.1684877-2-riana.tauro@intel.com>
References: <20221011053418.1684877-1-riana.tauro@intel.com>
 <20221011053418.1684877-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/1] lib/igt_device_scan: clear
 igt_devs.devs_scanned in igt_devices_free
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, 11 October 2022 07:34:18 CEST Riana Tauro wrote:
> 1) igt_devices_scan returns with empty list if devs_scanned
>    is true and function is called after igt_devices_free
>    clear igt_devs.devs_scanned in igt_devices_free.
>=20
> 2) remove redudant code from igt_devices_scan and replace it with
>    igt_devices_free
>=20
> v2: optimize code in igt_devices_scan (Zbigniew)
> v3: update commit message (Janusz)
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  lib/igt_device_scan.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>=20
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index eb6b45b8..8b70e375 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1027,9 +1027,11 @@ void igt_devices_free(void)
>  	}
> =20
>  	igt_list_for_each_entry_safe(dev, tmp, &igt_devs.all, link) {
> +		igt_list_del(&dev->link);
>  		igt_device_free(dev);
>  		free(dev);
>  	}
> +	igt_devs.devs_scanned =3D false;
>  }
> =20
>  /**
> @@ -1043,22 +1045,8 @@ void igt_devices_free(void)
>   */
>  void igt_devices_scan(bool force)
>  {
> -	if (force && igt_devs.devs_scanned) {
> -		struct igt_device *dev, *tmp;
> -
> -		igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered,
> -					     link) {
> -			igt_list_del(&dev->link);
> -			free(dev);
> -		}
> -		igt_list_for_each_entry_safe(dev, tmp, &igt_devs.all, link) {
> -			igt_list_del(&dev->link);
> -			igt_device_free(dev);
> -			free(dev);
> -		}
> -
> -		igt_devs.devs_scanned =3D false;
> -	}
> +	if (force && igt_devs.devs_scanned)
> +		igt_devices_free();
> =20
>  	if (igt_devs.devs_scanned)
>  		return;
>=20



