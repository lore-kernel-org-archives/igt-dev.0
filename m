Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DB0E83066
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4149A10E56F;
	Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DzPrDGI9";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BE810E2C0
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:37:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 89C1FC237F5
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:37:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB0AD60767;
 Mon,  2 Feb 2026 15:37:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C95E5119A8888; Mon,  2 Feb 2026 16:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770046644; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gIyM2sdgWHfpQOvvmb9ZqHNVpm6FoT1e9duBIHvauuo=;
 b=DzPrDGI9MG5C9hvcqFd7Kbj+S5gYZqdvch+IWaIvu2UC26oqAnDUmTuxCSAl1H24gSepYw
 icCiSTxgjMnFCwoAWiItcHskldxXGeBT4HRmy6V7aD9O5mv08GWuRPMW+j2IjxsUxRLxAn
 vTGiPVwQGQ1qDk6hoj78bJDEWcf27nfSOP/mXXegwnv8rHEyzTY08QfMD8R1okkvI+RuCX
 5vZGZM9yem0aA4l+X82dj22dlwrzGsvRDheUIH0uKM1P+2vgzeHEiGZ9JEfta4+d1Rm0fb
 J4wBkiBNAtWp91uTeUFgstHdgO4viql0njtvRIgKjh1DUH/a8CDruDUquaiqNQ==
Date: Mon, 2 Feb 2026 16:37:21 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 04/48] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
Message-ID: <20260202163721.6f4b86ab@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-4-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-4-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:32:43 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Introduce the functions igt_get_connector_from_name() and
> igt_get_connector_id_from_mst_path(). These functions serve to retrieve
> the connector object using a connector name and a connector ID from its
> MST path, respectively.
>=20
> Given that the connector id may not be consistent, especially with MST
> connectors, these functions are essential to recognize each connector even
> after system reboots and plug/unplug events.
>=20
> The function igt_get_connector_id_from_name() is a convenient wrapper for
> igt_get_connector_from_name() to streamline its usage when the caller only
> requires the connector id.

Only nitpick from me.
With these fixed:
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/igt_kms.c | 108
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ lib/igt_kms.h |
> 3 ++ 2 files changed, 111 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d8910a01c17c..2d39f1cafc2c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -95,6 +95,10 @@
>  #define MAX_EDID 2
>  #define DISPLAY_TILE_BLOCK 0x12
>  #define MAX_NUM_COLOROPS 256
> +/**
> + * define IGT_KMS_CONNECTOR_NAME_SIZE - Size used when a connector name =
is
> needed

You should remove the define word in the comment part, it is useless.

> + */
> +#define IGT_KMS_CONNECTOR_NAME_SIZE 50
> =20
>  typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const =
char
> *value);=20
> @@ -8121,3 +8125,107 @@ int igt_get_connected_connectors(int drm_fd, uint=
32_t
> **connector_ids)=20
>  	return connected_count;
>  }
> +
> +/**
> + * igt_get_connector_from_name:
> + * @drm_fd: DRM file descriptor
> + * @port_name: Port name to search
> + *
> + * Returns: The connector if found, NULL otherwise. The pointer must
> + * be freed with drmModeFreeConnector()
> + */
> +drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char
> *port_name) +{
> +	drmModeResPtr res =3D drmModeGetResources(drm_fd);
> +	double timeout =3D igt_default_display_detect_timeout();
> +	int i;

I know it comes from a kernel developer whim but the reverse xmas tree
appearance is clean. It would be nice to move to it for future version. :)=
=20

> +
> +	if (!res)
> +		return NULL;
> +
> +	for (i =3D 0; i < res->count_connectors; i++) {
> +		char name[IGT_KMS_CONNECTOR_NAME_SIZE];
> +		int len;
> +
> +		drmModeConnectorPtr connector =3D
> igt_wait_for_connector(drm_fd, res->connectors[i],
> +
> timeout); +
> +		if (connector) {
> +			/* We have to generate the connector name on our own
> */
> +			len =3D snprintf(name, sizeof(name), "%s-%u",
> +
> kmstest_connector_type_str(connector->connector_type),
> +				       connector->connector_type_id);
> +			name[len] =3D 0;
> +
> +			if (strcmp(port_name, name) =3D=3D 0) {
> +				drmModeFreeResources(res);
> +
> +				return connector;
> +			}
> +
> +			drmModeFreeConnector(connector);
> +		}
> +	}

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
