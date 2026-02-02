Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F9CE8305D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8730D10E568;
	Tue,  3 Feb 2026 08:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XuKN1EyJ";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A06A10E2C0
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:40:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D9F461A2BEF;
 Mon,  2 Feb 2026 15:39:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AE5D160767;
 Mon,  2 Feb 2026 15:39:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E0EB119A88EE; Mon,  2 Feb 2026 16:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770046799; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=649mF5FR3sRbd9RATFaefEMNKsb908+NBFFx6Soy6eM=;
 b=XuKN1EyJVe+GyxgjHwfzy9bthClaTLtPKryOwK0JYjOhGEG6dLjqxQc7G0z3dz4dncXCfJ
 S5kAX5nFmC7gduCipKurpyL5slma/5XDwmpL4Ll1/lChBI5jkAgBASpk+gx3Jhb6D3LmrB
 fexyeZhuH9GfREQit123+2id9VNbGR/3pHWuZvpIts8BS6Cd6P79Z7swzuYCCANXRznCxL
 Ld2UTB8JymvN53lhuZ8bSOddmPpsNHK4YM2XmyFQg2QYLk0zSiT9gzNpSJ4Amexx8Bx16G
 cMORuEB+PUrVce7W1uhthy2oTDwjPKUkbqByT4oQujiAQvRFHIYPHkZHPnfD9Q==
Date: Mon, 2 Feb 2026 16:39:57 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 06/48] lib/igt_kms: Add helper to get a pipe
 from a connector
Message-ID: <20260202163957.31bc813e@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-6-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-6-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:32:45 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Currently there is no way to get a pipe from the connector. Add this tiny
> helper that will try to get the currently used pipe for a specific
> connector.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  3 +++
>  2 files changed, 44 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6122de8d877f..e24140fc117f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8325,3 +8325,44 @@ int kms_wait_for_new_connectors(uint32_t
> **newly_connected,=20
>  	return newly_connected_count;
>  }
> +
> +/**
> + * igt_get_crtc_index_from_connector_id() - Get a pipe from the connecto=
r id
> + * @drm_fd: drm file descriptor to which the connector belongs
> + * @connector_id: connector to inspect
> + *
> + * Returns 0 if the connector is not connected to any pipe
> + */
> +int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
> +{
> +	drmModeObjectPropertiesPtr proplist;
> +	drmModePropertyPtr crtc_id_prop;
> +	drmModePropertyPtr prop;
> +	uint32_t crtc_id;
> +	enum pipe crtc_index;
> +	int i;

Reverse xmas tree. ;)
Else
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

> +
> +	proplist =3D drmModeObjectGetProperties(drm_fd, connector_id,
> DRM_MODE_OBJECT_CONNECTOR);
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
> +	igt_assert((crtc_id_prop->flags & DRM_MODE_PROP_EXTENDED_TYPE) =3D=3D
> DRM_MODE_PROP_OBJECT);
> +	crtc_id =3D proplist->prop_values[i];
> +	drmModeFreeProperty(crtc_id_prop);
> +	drmModeFreeObjectProperties(proplist);
> +	if (crtc_id !=3D 0) {
> +		crtc_index =3D kmstest_get_pipe_from_crtc_id(drm_fd, crtc_id);
> +		return crtc_index;
> +	}
> +	return 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 6843b6ae2e96..f2eaad61fdf7 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1329,4 +1329,7 @@ int kms_wait_for_new_connectors(uint32_t
> **newly_connected, int
>  get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t
> *list_b, int list_b_len, uint32_t **diff);
> +
> +int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
> +
>  #endif /* __IGT_KMS_H__ */
>=20



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
