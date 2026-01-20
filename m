Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19991D2629E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93DD10E666;
	Tue, 20 Jan 2026 21:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bQ7XKUMo";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFF210E666
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:10:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 66F8E4E420EB;
 Tue, 20 Jan 2026 21:10:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3DB99606AB;
 Tue, 20 Jan 2026 21:10:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D1403119B0198; Tue, 20 Jan 2026 22:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1ldGkJdzBeAnsCidqscItQ10aeHwEmFRKeuda8l/eok=;
 b=bQ7XKUMonJu2VW/Mj+DF1njHqyCTnxCmGdeWfqTPG2G2BL1foDrcHBscRMa5oBP7y4VsQ4
 oKBhMvfuh6E3+y9jrkfMh5VRNoh+qG3ExwXvxqxqwoOdcgWrBFHQPUHhXMMAgHYn5pusMJ
 GSMZRHJePEeqw1wXyK6cjBybxtoUPUaoj0hWZTNlljDZUQbUcswWBgHE0NgqD5O2RnQCz2
 yaFtXtTx/dKfqlMQBwjkke97ThTcOdGe+E/nH65IcZtK4eYd5LLFinHs7ndZfEWaLD2ajz
 2d+kMzDn8eRPjWxgTYVwIb+kJmIAwYaa+3rU68MEObkwrq6PnPeVoCMd4himdw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:10:04 +0100
Message-Id: <DFTQ3PBRSIWS.1JQ13A3O3SYFQ@bootlin.com>
Subject: Re: [PATCH i-g-t v4 04/46] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-4-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-4-0fc7bb1b4101@bootlin.com>
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

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> Introduce the functions igt_get_connector_from_name() and
> igt_get_connector_id_from_mst_path(). These functions serve to retrieve
> the connector object using a connector name and a connector ID from its
> MST path, respectively.
>
> Given that the connector id may not be consistent, especially with MST
> connectors, these functions are essential to recognize each connector eve=
n
> after system reboots and plug/unplug events.
>
> The function igt_get_connector_id_from_name() is a convenient wrapper for
> igt_get_connector_from_name() to streamline its usage when the caller onl=
y
> requires the connector id.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 107 ++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  lib/igt_kms.h |   3 ++
>  2 files changed, 110 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6392999bb341..6f2a8abbaf7d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -93,6 +93,10 @@
>  #define MAX_CONNECTORS 32
>  #define MAX_EDID 2
>  #define DISPLAY_TILE_BLOCK 0x12
> +/**
> + * define IGT_KMS_CONNECTOR_NAME_SIZE - Size used when a connector name =
is needed
> + */
> +#define IGT_KMS_CONNECTOR_NAME_SIZE 50
>
>  typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const =
char *value);
>
> @@ -7726,3 +7730,106 @@ int igt_get_connected_connectors(int drm_fd, uint=
32_t **connector_ids)
>
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
> +drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *=
port_name)
> +{
> +	drmModeResPtr res =3D drmModeGetResources(drm_fd);
> +	double timeout =3D igt_default_display_detect_timeout();
> +	int i, len;
> +
> +	if (!res)
> +		return NULL;
> +
> +	for (i =3D 0; i < res->count_connectors; i++) {
> +		char name[IGT_KMS_CONNECTOR_NAME_SIZE];
> +
> +		drmModeConnectorPtr connector =3D igt_wait_for_connector(drm_fd, res->=
connectors[i],
> +								       timeout);
> +
> +		if (connector) {
> +			/* We have to generate the connector name on our own */
> +			len =3D snprintf(name, ARRAY_SIZE(name), "%s-%u",

Any reason you prefer ARRAY_SIZE() over sizeof(), which I'd have expected
to see here??

Also, I see you are declaring most variables in the inner scope using them
instead of all at function scope. This is good, but you missed the 'len'
variable, which can be moved inside this scope.

> +				       kmstest_connector_type_str(connector->connector_type),
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
> +
> +	drmModeFreeResources(res);
> +
> +	return NULL;
> +}

With those fixed:
 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
