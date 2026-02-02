Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1470E8306F
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A80F10E581;
	Tue,  3 Feb 2026 08:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YUDztfrG";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00F610E12C
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 18:05:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 574424E4232E;
 Mon,  2 Feb 2026 18:05:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1C06D60767;
 Mon,  2 Feb 2026 18:05:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5BD44119A8891; Mon,  2 Feb 2026 19:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770055521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=D7iopBJM3Hd9/6z0xtk3Q3OPC9VZ44AV+AdNdeS5H44=;
 b=YUDztfrGWAu1evVEh/ErtoPB6mgnDLFRUiOsurbRXifoE44Q1XAfJwkBD18fhNPcOhGfRx
 zgVQifmM4FLOP7VwRPxUGizLaD0axHiEffTd6PASvIfL83qqHecqUhKRHovw0HNfLWtVIi
 7oUQagsHcS5vunphnHn0GQmhRGFkttNovwMQsT2Rjmq5xJa6nZKrO7wa9VTvmUx4MgeHEP
 D3sBWKBIX7nC3Q+KsnGn1m1dbPAdWIljnyMsUqDaPqkfEAaT3wwuxgriKmdp0PV0pO+ek3
 kdfY5+mXh4NvTw/2CiTRgyTA4QWL7QFrrzHTEYNjh4sR6JvyVAK354U+IX7YwA==
Date: Mon, 2 Feb 2026 19:05:19 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 22/48] lib/unigraf: Introduce role configuration
Message-ID: <20260202190519.7c2c7548@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-22-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-22-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:01 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Some unigraf devices, like the UCD-500 can have multiple hardware
> configurations: displayport input/output, usbc input/output.
>=20
> The device configuration can look like:
>=20
> [Unigraf]
> Device=3DUCD-500 [2434C620]
> Role=3DDisplayPort Source and Sink
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 59
> ++++++++++++++++++++++++++++++++++++++++++++++++++- 1 file changed, 58
> insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 800e9c3545f4..fb901c38453e 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -29,6 +29,16 @@ static char *unigraf_connector_name;
>   */
>  #define UNIGRAF_CONFIG_DEVICE_NAME "Device"
> =20
> +/**
> + * UNIGRAF_CONFIG_DEVICE_ROLE - Key of the device role in the configurat=
ion
> file
> + */
> +#define UNIGRAF_CONFIG_DEVICE_ROLE "Role"
> +
> +/**
> + * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf
> device
> + */
> +#define UNIGRAF_DEFAULT_ROLE_NAME "USB-C, DP Alt Mode Source and Sink"
> +
>  static void unigraf_close_device(void)
>  {
>  	if (!unigraf_device)
> @@ -92,6 +102,25 @@ static int unigraf_find_device(char *request)
>  	return chosen_device;
>  }
> =20
> +static int unigraf_find_role(const char *request)
> +{
> +	int chosen_role =3D -1;
> +	int role_count =3D
> unigraf_assert(TSIX_DEV_GetDeviceRoleCount(unigraf_device)); +
> +	for (int i =3D 0; i < role_count; i++) {
> +		char role_name[UNIGRAF_NAME_MAX];
> +
> +		memset(role_name, 0, UNIGRAF_NAME_MAX);

Same as previous patch:
char role_name[UNIGRAF_NAME_MAX] =3D "";


> +		unigraf_assert(TSIX_DEV_GetDeviceRoleName(unigraf_device, i,
> +							  role_name,
> +							  UNIGRAF_NAME_MAX));
> +		unigraf_debug("Role %d: %s\n", i, role_name);
> +		if (!strncmp(role_name, request, UNIGRAF_NAME_MAX))
> +			chosen_role =3D i;

return chose_role;

> +	}
> +	return chosen_role;

return -ENODEV;

> +}
> +
>  /**
>   * unigraf_open_device() - Search and open a device.
>   * @drm_fd: File descriptor of the currently used drm device
> @@ -106,9 +135,10 @@ bool unigraf_open_device(int drm_fd)
>  	char *cfg_group =3D NULL;
>  	GError *cfg_error =3D NULL;
>  	char *cfg_device =3D NULL;
> +	char *cfg_role =3D NULL;
>  	int device_count;
>  	int chosen_device;
> -	int chosen_role =3D 0;
> +	int chosen_role;

Why?
And I missed it but the previous patch has also this change.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
