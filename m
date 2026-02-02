Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F33AE83063
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB9E10E56B;
	Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ub3ZX/Uk";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAB010E1C2
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:17:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8E6694E423CB;
 Mon,  2 Feb 2026 15:17:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 535DB6076C;
 Mon,  2 Feb 2026 15:17:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 359B4119A88EE; Mon,  2 Feb 2026 16:17:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770045442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fPOiMt/oIEs9zYVASIT/7ZAfhFiWYNVdxO8S9ptBoIU=;
 b=ub3ZX/UkDZj6clvl3a0DtWG4BUN7lRzuDOkrZgqSC/q/L3rA0k/2m6Aa27OybANdFvZIUv
 SNTojyqjHguIJgwSSyv8uj93keYKJLWjBuelAvRjtroqWCyWvJ1Fn8zpZGdX7WqVtjO/Vy
 PFIHIaBnpcgBaenyVrXDgm+qNL9PQbTJk6Coyw96WHMMP+q11MFdMQc2rutbqXJggXpNpw
 d130M3F6nRXr+kMEcwstsM9+EHAFe2mTwe0i8Q6dTWZm8EUOvz65EBL5EA/dc0eTXNQdpM
 hspJ2qTrRxWVXoYpQsCJfwr+K6Kig5Z0VKv/x0d6m2yGfEZHyFZvjYw77lDZGA==
Date: Mon, 2 Feb 2026 16:17:20 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 03/48] lib/igt_kms: Add function to list
 connected connectors
Message-ID: <20260202161720.3fe87446@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-3-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-3-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:32:42 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Introduce the igt_get_connected_connectors() function, which returns a
> list of connector IDs that are currently connected according to DRM.
>=20
> This function includes a timeout mechanism because connectors can be
> unplugged at any time. Also, especially with MST, the connector can be
> listed by drmModeGetResources() but not yet accessible with
> drmModeGetConnector().
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/igt_kms.c | 67
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ lib/igt_kms.h=
 |
> 1 + 2 files changed, 68 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 74178adc21b3..d8910a01c17c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8016,6 +8016,29 @@ double igt_default_display_detect_timeout(void)
>  	return timeout;
>  }
> =20
> +static drmModeConnectorPtr igt_wait_for_connector(int drm_fd, unsigned i=
nt
> connector_id,
> +						  double timeout)
> +{
> +	drmModeConnectorPtr connector =3D NULL;
> +	struct timespec start, end;
> +
> +	connector =3D drmModeGetConnector(drm_fd, connector_id);
> +	/*
> +	 * This time is required as sometimes some id in the connector list
> are not totally
> +	 * ready or can disappear
> +	 */
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	end =3D start;
> +
> +	while (!connector &&
> +	       igt_time_elapsed(&start, &end) <=3D timeout) {
> +		connector =3D drmModeGetConnector(drm_fd, connector_id);
> +		clock_gettime(CLOCK_MONOTONIC, &end);

Same here as patch 2. Maybe add usleep(10000).

> +	}
> +
> +	return connector;
> +}
> +
>  /**
>   * igt_wait_for_connector_status:
>   * @drm_fd: drm file descriptor
> @@ -8054,3 +8077,47 @@ bool igt_wait_for_connector_status(int drm_fd,
> unsigned int connector_id, double connector_id);
>  	return false;
>  }
> +
> +/**
> + * igt_get_connected_connectors:
> + *
> + * @drm_fd: DRM file descriptor
> + * @connector_ids: Out pointer for the list of connector ids connected. =
It
> must be freed by the
> + * caller.

Should the caller freed only the connector_ids pointer or also all the
connectors pointers that are inside the list? Maybe it needs a bit more
explanation here.

> + *
> + * This will probe all the connectors and return the list of all
> + * connected connectors.
> + * Returns: The number of connectors in @connector_ids
> + */
> +int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
> +{
> +	int connected_count =3D 0;
> +	double timeout =3D igt_default_display_detect_timeout();
> +	drmModeResPtr resources;
> +
> +	igt_assert(drm_fd);
> +	*connector_ids =3D NULL;
> +
> +	resources =3D drmModeGetResources(drm_fd);
> +	igt_assert(resources);
> +	for (int j =3D 0; j < resources->count_connectors; j++) {
> +		drmModeConnectorPtr connector =3D
> igt_wait_for_connector(drm_fd,
> +
> resources->connectors[j],
> +
> timeout); +
> +		if (connector) {
> +			if (connector->connection =3D=3D DRM_MODE_CONNECTED) {
> +				*connector_ids =3D reallocarray(*connector_ids,
> +							      connected_count
> +							      + 1,
> sizeof(**connector_ids));
> +				igt_assert(*connector_ids);
> +				(*connector_ids)[connected_count] =3D
> resources->connectors[j];
> +				connected_count++;
> +			}
> +			drmModeFreeConnector(connector);
> +		}
> +	}
> +	drmModeFreeResources(resources);
> +
> +	return connected_count;
> +}

It seems that igt support lists inspired by the kernel.
Why didn't you use the igt_list API here? It would be nicer to read.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
