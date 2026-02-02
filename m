Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B6EE83065
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6CB10E584;
	Tue,  3 Feb 2026 08:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kxwz9MNe";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD77110E53A
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 18:08:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 92DA31A2B96;
 Mon,  2 Feb 2026 18:08:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2170360767;
 Mon,  2 Feb 2026 18:08:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E8A3119A8891; Mon,  2 Feb 2026 19:08:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770055684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KFGLafvEwNiFRucGyCh4qIPGW0ka8+nxm621RpGz38w=;
 b=kxwz9MNewu6itD9NuYhFxbuLsuWzlFo5jLEXbSm5UYzKcXpId9qRpxHmerC/xILVNNtFgy
 eBLvfvk69MZFmZx7N5deBp/xs6L5+Zq9gh383lGrSvqJ0nvnjYzPZN0imFohwEHViFspVL
 LAj175hYNXOS7znAn/3RCfqq+tb84VsVaqFeyLUAyOJ7bGQfuLzUM8rSnxeS9Gk2UhN2de
 +V+NgvJ+E+0SIahbsZMvmhp4G0YcvuiXgCgk/orn2y+z7iLPTvvjlUtuoOgpIpHQaHRzCO
 0r/02SfzzBIctPfIXP/mI5V4oOSKxzcrDjKbD6X93RiVqxGYdt4E3k3Jrbt6Pw==
Date: Mon, 2 Feb 2026 19:08:02 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 23/48] lib/unigraf: Introduce input configuration
Message-ID: <20260202190802.5eebe8d2@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-23-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-23-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:02 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As multiple input can be present on unigraf devices, add a configuration
> field to select the proper input. By default it will take the first
> available.
>=20
> The configuration can look like:
>=20
> [Unigraf]
> Device=3DUCD-500 [2434C620]
> Role=3DDisplayPort Source and Sink
> Input=3DDP RX
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 59
> ++++++++++++++++++++++++++++++++++++++++++++++++++- 1 file changed, 58
> insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index fb901c38453e..1b31f7a44566 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -34,11 +34,21 @@ static char *unigraf_connector_name;
>   */
>  #define UNIGRAF_CONFIG_DEVICE_ROLE "Role"
> =20
> +/**
> + * UNIGRAF_CONFIG_INPUT_NAME - Key of the input name in the configuration
> file
> + */
> +#define UNIGRAF_CONFIG_INPUT_NAME "Input"
> +
>  /**
>   * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf
> device */
>  #define UNIGRAF_DEFAULT_ROLE_NAME "USB-C, DP Alt Mode Source and Sink"
> =20
> +/**
> + * UNIGRAF_DEFAULT_INPUT_NAME - Default input name to search on the unig=
raf
> device
> + */
> +#define UNIGRAF_DEFAULT_INPUT_NAME "DP RX"
> +
>  static void unigraf_close_device(void)
>  {
>  	if (!unigraf_device)
> @@ -121,6 +131,24 @@ static int unigraf_find_role(const char *request)
>  	return chosen_role;
>  }
> =20
> +static int unigraf_find_input(const char *request)
> +{
> +	int chosen_input =3D -1;
> +	int role_count =3D
> unigraf_assert(TSIX_VIN_GetInputCount(unigraf_device)); +
> +	for (int i =3D 0; i < role_count; i++) {
> +		char input_name[UNIGRAF_NAME_MAX];
> +
> +		memset(input_name, 0, UNIGRAF_NAME_MAX);

Same as previous patch:
char input_name[UNIGRAF_NAME_MAX] =3D "";

> +		unigraf_assert(TSIX_VIN_GetInputName(unigraf_device, i,
> +						     input_name,
> UNIGRAF_NAME_MAX));
> +		unigraf_debug("Input %d: %s\n", i, input_name);
> +		if (!strncmp(input_name, request, UNIGRAF_NAME_MAX))
> +			chosen_input =3D i;

return chosen_input;

> +	}
> +	return chosen_input;

return -ENODEV;

> +}
> +
>  /**
>   * unigraf_open_device() - Search and open a device.
>   * @drm_fd: File descriptor of the currently used drm device
> @@ -136,10 +164,11 @@ bool unigraf_open_device(int drm_fd)
>  	GError *cfg_error =3D NULL;
>  	char *cfg_device =3D NULL;
>  	char *cfg_role =3D NULL;
> +	char *cfg_input =3D NULL;
>  	int device_count;
>  	int chosen_device;
>  	int chosen_role;
> -	int chosen_input =3D 0;
> +	int chosen_input;

Why?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
