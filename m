Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AA1EE20A6
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 14:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA1F10E7F6;
	Fri,  6 Feb 2026 14:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Lw4AhpvY";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343CE10E051
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 14:54:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EB0841A2C54;
 Fri,  6 Feb 2026 14:54:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C063E60729;
 Fri,  6 Feb 2026 14:54:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD240119D1BE6; Fri,  6 Feb 2026 15:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770389644; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dtvpJNUZkHPsgM+uwJIvYWmIKeIkMXxhVkQbqen8XmE=;
 b=Lw4AhpvYhOfo1qR9NHJ9TfeJeDot3DYnvRIG+L+cGamCL5t5PKIng8C1nz2nIvCbXVHUN0
 TqZhNYIhPeAVKwqzJ56jzXQwEFcujHLssqi5Q1P3ACEt5H6svxy/z2Xi4yQFyRq8uOAPeE
 1Yz1rKDwIyKn2jAzJ/R0QLFJ+z6RQpkPSr/zgcKN2x/345h2danykwHxogaCmFlKiCoz3d
 5k5pqMuhSAKp9bMLykmelYDFGPCX0lT32BK8In+3k3X3xV2ZICAqbD2zPkgdsLhS3bjLqg
 ttwuq0NH/ifI2hqG7Q+F1tKSfdLARSQrR3jpv/G8E4qEznIsKmVEKi5pHqKNbg==
Date: Fri, 6 Feb 2026 15:54:01 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 35/48] lib/igt_pipe_crc: Add ungiraf crc
 calculation
Message-ID: <20260206155401.180e5a97@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-35-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-35-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:14 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

typo in the subject *ungiraf*

> Unigraf can read crc from the physical output, use this CRC instead of
> internal CRC when configured. This allows to also test the hardware signal
> generation.
>=20
> This small addition allows to use the unigraf device for most of the
> kms_* tests.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_pipe_crc.c    | 35 +++++++++++++++++++++++++++++++++++
>  lib/unigraf/unigraf.c | 23 +++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>=20
> diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
> index 9a79edd51531..7bb724311890 100644
> --- a/lib/igt_pipe_crc.c
> +++ b/lib/igt_pipe_crc.c
> @@ -3,9 +3,12 @@
>   * Copyright =C2=A9 2013 Intel Corporation
>   */
> =20
> +#include "igt_core.h"
> +#include "unigraf/unigraf.h"
>  #include <inttypes.h>
>  #include <sys/stat.h>
>  #include <sys/mount.h>
> +#include <xf86drmMode.h>
>  #ifdef __linux__
>  #include <sys/sysmacros.h>
>  #endif
> @@ -359,6 +362,38 @@ static void read_one_crc(igt_pipe_crc_t *pipe_crc,
> igt_crc_t *out) } while (ret =3D=3D -EINTR);
> =20
>  	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
> +
> +#if HAVE_UNIGRAF
> +	if (unigraf_open_device(pipe_crc->fd) && unigraf_use_crc()) {
> +		int crtc_index;
> +		int stream_id;
> +		drmModeConnectorPtr connector =3D
> unigraf_get_connector(pipe_crc->fd); +
> +		if (!connector)
> +			return;
> +
> +		crtc_index =3D
> igt_get_crtc_index_from_connector_id(pipe_crc->fd,
> +
> connector->connector_id);
> +		drmModeFreeConnector(connector);
> +
> +		if (crtc_index !=3D 0 && crtc_index =3D=3D pipe_crc->crtc_index) {

could crtc_index and pipe_crc->crtc_index be set to 0?
If that's not the case the first condition is useless.

Anyway if you keep it like that:
if (crtc_index && crtc_index =3D=3D pipe_crc->crtc_index) {

> +			unigraf_read_crc(0, out);
> +			return;
> +		}
> +
> +		for (stream_id =3D 0; stream_id <
> unigraf_get_mst_stream_count(); stream_id++) {
> +			int connector_id =3D
> unigraf_get_connector_id_by_stream(pipe_crc->fd,
> +
>  stream_id);
> +			crtc_index =3D
> igt_get_crtc_index_from_connector_id(pipe_crc->fd,
> +
> connector_id); +
> +			if (crtc_index !=3D 0 && crtc_index =3D=3D
> pipe_crc->crtc_index) {

Same here.

...

>  	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE,
> 0)); @@ -513,6 +531,11 @@ bool unigraf_open_device(int drm_fd)
> =20
>  	unigraf_reset();
> =20
> +	if (unigraf_stream_count =3D=3D 0)

if (!unigraf_stream_count)

> +		unigraf_set_sst();
> +	else
> +		unigraf_set_mst_stream_count(unigraf_stream_count);
> +
>  	return unigraf_connector_name !=3D NULL;
>  }
> =20
>=20



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
