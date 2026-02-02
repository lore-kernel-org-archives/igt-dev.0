Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4E0E8306B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D4510E575;
	Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SORCUfVQ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B474610E535
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 17:41:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0FA794E423C1;
 Mon,  2 Feb 2026 17:41:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C94C860767;
 Mon,  2 Feb 2026 17:41:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBD17119A8888; Mon,  2 Feb 2026 18:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770054075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XmbvgjUQaTVQ/+qRBv9sVo81zvm4WNxuaTjo/wuiHNU=;
 b=SORCUfVQ4qQrw7mM5FqGAZPbK8M+0DcbslTr08LRrgqspcSeUh50lCp7px7LoQraC3fF76
 nk79F0SPsoTWJgG42xPbBtDjHEZtWBxKDEFcNlmHpd05THpTD6/VieufBlCjQq1XAObZew
 9TjauTgl205zZctl5USb6NU4S7PRaZbL0VqBw5FRzaFLXULLUTVQnLxB6/SarSbc5MkTS2
 xv+7Jo9aisDliDNjiAUWqQzi8CXDnA92k3jA8gYdHEfZOD6zTg/hg7EG+MmXriFM9byF2K
 wRwy4DyB0BA3XZ3xB8pB6eSxRYtsDuxNjiOfcaYOrhJDltdUzrSxPd1mrREG2w==
Date: Mon, 2 Feb 2026 18:41:12 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 21/48] lib/unigraf: Introduce device configuration
Message-ID: <20260202184112.679fb61f@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-21-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-21-834af822eee7@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Tue, 03 Feb 2026 08:01:01 +0000
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

On Mon, 02 Feb 2026 15:33:00 +0100
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
>  lib/unigraf/unigraf.c | 74
> +++++++++++++++++++++++++++++++++++++++++++++++++-- 1 file changed, 72
> insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 3318c95fbbb6..800e9c3545f4 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -4,8 +4,9 @@
>  #include <stdint.h>
> =20
>  #include "unigraf.h"
> -#include "TSI.h"
>  #include "TSI_types.h"
> +#include "TSI.h"
> +#include "igt_rc.h"
> =20
>  #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt,
> unigraf_device, ##__VA_ARGS__)=20
> @@ -13,6 +14,21 @@ static TSI_HANDLE unigraf_device;
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
> @@ -59,6 +75,23 @@ static unsigned int unigraf_device_count(void)
>  	return unigraf_assert(TSIX_DEV_GetDeviceCount());
>  }
> =20
> +static int unigraf_find_device(char *request)
> +{
> +	int chosen_device =3D -1;
> +	int device_count =3D unigraf_device_count();
> +
> +	for (int i =3D 0; i < device_count; i++) {
> +		char dev_name[UNIGRAF_NAME_MAX];
> +
> +		memset(dev_name, 0, UNIGRAF_NAME_MAX);

Do you really need to set all the bytes to 0?
Isn't the following sufficient?=20
char dev_name[UNIGRAF_NAME_MAX] =3D "";

> +		unigraf_assert(TSIX_DEV_GetDeviceName(i, dev_name,
> UNIGRAF_NAME_MAX));
> +		unigraf_debug("Detected unigraf device %d: %s\n", i,
> dev_name);
> +		if (!strncmp(dev_name, request, UNIGRAF_NAME_MAX))
> +			chosen_device =3D i;

You should directly return chosen_device here to avoid processing the full =
loop.=20
And return -ENODEV below.

> +	}
> +	return chosen_device;
> +}
> +
>  /**
>   * unigraf_open_device() - Search and open a device.
>   * @drm_fd: File descriptor of the currently used drm device
> @@ -70,8 +103,11 @@ static unsigned int unigraf_device_count(void)
>  bool unigraf_open_device(int drm_fd)
>  {
>  	TSI_RESULT r;
> +	char *cfg_group =3D NULL;
> +	GError *cfg_error =3D NULL;
> +	char *cfg_device =3D NULL;
>  	int device_count;
> -	int chosen_device =3D 0;
> +	int chosen_device;
>  	int chosen_role =3D 0;
>  	int chosen_input =3D 0;
> =20
> @@ -82,6 +118,30 @@ bool unigraf_open_device(int drm_fd)
> =20
>  	unigraf_init();
> =20
> +	if (igt_key_file) {
> +		char **group_list =3D g_key_file_get_groups(igt_key_file,
> NULL); +
> +		for (int i =3D 0; group_list[i]; i++) {
> +			if (strcmp(group_list[i], UNIGRAF_CONFIG_GROUP))
> +				continue;
> +			cfg_group =3D strdup(group_list[i]);
> +		}

I think the following is better:

if (!strncmp(group_list[i], UNIGRAF_CONFIG_GROUP, sizeof(UNIGRAF_CONFIG_GRO=
UP))) {
	cfg_group =3D strndup(group_list[i], sizeof(UNIGRAF_CONFIG_GROUP));
	break;
}

In fact the cfg_group variable content is always UNIGRAF_CONFIG_GROUP or nu=
ll.
So maybe you don't need it and simply add a group_found boolean?


> +		g_strfreev(group_list);
> +	}
> +
> +	if (!cfg_group) {
> +		unigraf_debug("No device configured, will try to find the
> first available.\n");
> +		cfg_device =3D NULL;
> +		unigraf_connector_name =3D NULL;
> +	} else {
> +		cfg_device =3D g_key_file_get_string(igt_key_file, cfg_group,
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
> @@ -90,6 +150,16 @@ bool unigraf_open_device(int drm_fd)
>  		return false;
>  	}
> =20
> +	if (!cfg_device) {
> +		chosen_device =3D 0;
> +	} else {
> +		chosen_device =3D unigraf_find_device(cfg_device);
> +		if (chosen_device =3D=3D -1) {

And here it will be:
if (chosen_device < 0) {

> +			igt_warn("The requested unigraf device %s is not
> found.\n", cfg_device);
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
