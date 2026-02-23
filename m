Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72A9EA4FC7
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8579710E3DB;
	Mon, 23 Feb 2026 14:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="rbhGcL3S";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6EC10E3DB
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:22:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 940A61A115F;
 Mon, 23 Feb 2026 14:22:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5B5FE5FD43;
 Mon, 23 Feb 2026 14:22:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9D9CD10368C22; Mon, 23 Feb 2026 15:22:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771856551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3hXHp7L/XkEXUesEwrf+Z4DXWH8Ew1SLsJI85vinh5k=;
 b=rbhGcL3SiOF58EtQhVSdQ/hy87qgdBOS4KRVZV4iaT1yY/BCPo+jqZTZgFO7OcGvEBcJzn
 4x6UsWpEIs13qkcWIfhizK5BfvuoW+SwGM3V3ojiJR47LAmy2uKh2rhbn1q8IjUZ3BZ3/3
 aonE7i8+fyPBqIk0YsYckpbFNtw30KLR9eNN3unP/C2fVWkHvIZCurLw6aTXGjbqwCKe6U
 IrMUzRbpceOP/5I+/tMUJxmDsD8G77/I5wnDjoyJ+uJhN05UtPFAmexMnfSNUVciKHdOJ7
 GwToAQL9Q66o8pGXqH5LVIpfqI25wqIMI4dk5DajYoUYhb8+/G0jvSRiopPeeA==
Date: Mon, 23 Feb 2026 15:22:29 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 21/48] lib/unigraf: Introduce device configuration
Message-ID: <20260223152229.59aaeb6a@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-21-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-21-73dc9143c8c1@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
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

On Mon, 23 Feb 2026 13:09:28 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As there could be multiple devices detected by libTSI, add a configuration
> field to ensure that igt will use the proper unigraf device.
>=20
> The unigraf integration will search for a [Unigraf] entry containing a
> Device=3D
>=20
> For example, it can look like:
>=20
> [Unigraf]
> Device=3DUCD-500 [2434C620]
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 57
> +++++++++++++++++++++++++++++++++++++++++++++++++-- 1 file changed, 55
> insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index df18ab178e16..ec709a55c106 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -10,8 +10,9 @@
>  #include <stdint.h>
> =20
>  #include "unigraf.h"
> -#include "TSI.h"
>  #include "TSI_types.h"
> +#include "TSI.h"

Nit: You move this include for nothing.

> +#include "igt_rc.h"
> =20
>  #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt,
> unigraf_device, ##__VA_ARGS__)=20
> @@ -19,6 +20,21 @@ static TSI_HANDLE unigraf_device;
>  static char *unigraf_default_edid;
>  static char *unigraf_connector_name;
> =20
> +/**
> + * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
> + */
> +#define UNIGRAF_NAME_MAX 1024
> +
> +/**
> + * UNIGRAF_CONFIG_GROUP - Name of the unigraf group in the configuration=
 file
> + */
> +#define UNIGRAF_CONFIG_GROUP "Unigraf"
> +
> +/**
> + * UNIGRAF_CONFIG_DEVICE_NAME - Key of the device name in the configurat=
ion
> file
> + */
> +#define UNIGRAF_CONFIG_DEVICE_NAME "Device"
> +
>  static void unigraf_close_device(void)
>  {
>  	if (!unigraf_device)
> @@ -65,6 +81,22 @@ static unsigned int unigraf_device_count(void)
>  	return unigraf_assert(TSIX_DEV_GetDeviceCount());
>  }
> =20
> +static int unigraf_find_device(char *request)
> +{
> +	int device_count =3D unigraf_device_count();
> +
> +	for (int i =3D 0; i < device_count; i++) {
> +		char dev_name[UNIGRAF_NAME_MAX] =3D "";
> +
> +		memset(dev_name, 0, UNIGRAF_NAME_MAX);

This memset is useless here.

> +		unigraf_assert(TSIX_DEV_GetDeviceName(i, dev_name,
> UNIGRAF_NAME_MAX));
> +		unigraf_debug("Detected unigraf device %d: %s\n", i,
> dev_name);
> +		if (!strncmp(dev_name, request, UNIGRAF_NAME_MAX))
> +			return i;
> +	}
> +	return -ENODEV;
> +}
> +
>  /**
>   * unigraf_open_device() - Search and open a device.
>   * @drm_fd: File descriptor of the currently used drm device
> @@ -76,8 +108,10 @@ static unsigned int unigraf_device_count(void)
>  bool unigraf_open_device(int drm_fd)
>  {
>  	TSI_RESULT r;
> +	GError *cfg_error =3D NULL;
> +	char *cfg_device =3D NULL;
>  	int device_count;
> -	int chosen_device =3D 0;
> +	int chosen_device;
>  	int chosen_role =3D 0;
>  	int chosen_input =3D 0;
> =20
> @@ -88,6 +122,15 @@ bool unigraf_open_device(int drm_fd)
> =20
>  	unigraf_init();
> =20
> +	if (igt_key_file) {
> +		cfg_device =3D g_key_file_get_string(igt_key_file,
> UNIGRAF_CONFIG_GROUP,
> +
> UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
> +		if (cfg_error) {
> +			unigraf_debug("No device name configured, uses first
> device available.\n");
> +			cfg_device =3D NULL;
> +		}
> +	}
> +
>  	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE,
> 0));=20
>  	device_count =3D unigraf_device_count();
> @@ -96,6 +139,16 @@ bool unigraf_open_device(int drm_fd)
>  		return false;
>  	}
> =20
> +	if (!cfg_device) {
> +		chosen_device =3D 0;
> +	} else {

Why removing the chosen_device initialization at the top of the function an=
d add
this if condition?
if (cfg_device) {...} is sufficient here.

> +		chosen_device =3D unigraf_find_device(cfg_device);
> +		if (chosen_device < 0) {
> +			igt_warn("The requested unigraf device %s is not
> found, err: %d.\n", cfg_device, chosen_device);
> +			return false;
> +		}
> +	}
> +
>  	unigraf_device =3D TSIX_DEV_OpenDevice(chosen_device, &r);
>  	unigraf_assert(r);
>  	igt_assert(unigraf_device);
>=20

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
