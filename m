Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AEED2629E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1943010E64E;
	Tue, 20 Jan 2026 21:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FpW9P0Aa";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB63D10E65B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:10:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9DA134E420EB
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:10:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 736B0606AB;
 Tue, 20 Jan 2026 21:10:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 39347119B0198; Tue, 20 Jan 2026 22:10:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943435; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=004VFJwEc9mJz8QSMcvhOZzvKKvtvdIn3HPKAn0zdkI=;
 b=FpW9P0Aau/aEDhI5ZUNjKDttt5cKGt4JBtFmr6H6CI8Lkqu6HHzMDxvuSkUJLeBjDHjsZb
 tLtNKFaqawvpfwzJSHymZvNjgdISWSHmED7+jtHr45u1ahdMXh8xMcmBObYIIpv0WziFb6
 gC59haIzPCSrqOE0bIsTHrBLVSOA4h718oCejGc5FZ9IfC3Sgj6mreqgGP3rAK3OIwawL7
 0mfXE9B2NEQAUlqLEheKEny6luVyZQylkV4Kwjs7dwk4HdM/ghlmpl0RcA157WntiWUpcs
 uNt3+JoU8WmH/k6jL0+K9JB1fE/Pw4K6oiHlAQuI5gaW94X1FJIrKOGEuqhunA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:10:33 +0100
Message-Id: <DFTQ42U8ZZXG.30IIDPS52E787@bootlin.com>
Subject: Re: [PATCH i-g-t v4 06/46] lib/igt_kms: Add helper to get a pipe
 from a connector
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-6-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-6-0fc7bb1b4101@bootlin.com>
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
> Currently there is no way to get a pipe from the connector. Add this tiny
> helper that will try to get the currently used pipe for a specific
> connector.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 34 ++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  8 ++++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c77c94d7c437..f8d4037a68bf 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7926,3 +7926,37 @@ int kms_wait_for_new_connectors(uint32_t **newly_c=
onnected,
>
>  	return newly_connected_count;
>  }
> +
> +enum pipe igt_get_pipe_from_connector(int drm_fd, int connector_id)

The function name suggests it takes a connector (a drmModeConnectorPtr
perhaps), but it takes a connector ID. I suggest renaming the function to
igt_get_pipe_from_connector_id() so that in case you need in the future a
function that takes a connector it will be intuitively named
igt_get_pipe_from_connector().

> +{
> +	drmModeObjectPropertiesPtr proplist;
> +	drmModePropertyPtr crtc_id_prop;
> +	drmModePropertyPtr prop;
> +	uint32_t crtc_id;
> +	enum pipe pipe_id;
> +	int i;
> +
> +	proplist =3D drmModeObjectGetProperties(drm_fd, connector_id, DRM_MODE_=
OBJECT_CONNECTOR);
> +	crtc_id_prop =3D NULL;
> +
> +	for (i =3D 0; i < proplist->count_props; i++) {
> +		prop =3D drmModeGetProperty(drm_fd, proplist->props[i]);
> +
> +		if (strcmp(prop->name, "CRTC_ID") =3D=3D 0) {
> +			crtc_id_prop =3D prop;
> +			break;
> +		}
> +		drmModeFreeProperty(prop);
> +	}
> +
> +	igt_assert(crtc_id_prop);
> +	igt_assert((crtc_id_prop->flags & DRM_MODE_PROP_EXTENDED_TYPE) =3D=3D D=
RM_MODE_PROP_OBJECT);
> +	crtc_id =3D proplist->prop_values[i];
> +	drmModeFreeProperty(crtc_id_prop);
> +	drmModeFreeObjectProperties(proplist);
> +	if (crtc_id !=3D 0) {
> +		pipe_id =3D kmstest_get_pipe_from_crtc_id(drm_fd, crtc_id);
> +		return pipe_id;
> +	}
> +	return PIPE_NONE;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 7b1d01efebf2..4184c3930cbd 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1315,4 +1315,12 @@ int kms_wait_for_new_connectors(uint32_t **newly_c=
onnected,
>  int
>  get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *li=
st_b, int list_b_len,
>  	      uint32_t **diff);
> +/**
> + * igt_get_pipe_from_connector() - Get a pipe from the connector id
> + * @drm_fd: drm file descriptor to which the connector belongs
> + * @connector_id: connector to inspect
> + *
> + * Returns PIPE_NONE if the connector is not connected to any pipe
> + */

Documentation is before the function definition (.c) elsewhere, why at the
declaration in this case?

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
