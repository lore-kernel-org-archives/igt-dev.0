Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDC2EE20AA
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 14:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BB210E7F6;
	Fri,  6 Feb 2026 14:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VI6140aB";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B4810E7F6
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 14:41:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5E424C250C1;
 Fri,  6 Feb 2026 14:41:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C33CB60729;
 Fri,  6 Feb 2026 14:41:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A891119D1DAD; Fri,  6 Feb 2026 15:41:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770388863; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/ehlfv8Po4dAqGg0GQoYP/p9/sV46aaZlP81Ug+7U4U=;
 b=VI6140aBwQiloapqT/typ4wCgAdxLtVbUeaeM0cO1+ZSgvm0RowhVbCasyo1IeVsSAGPfa
 6ql0CQsG6YfiSbN3Qq9sQDSL7x/8hPwNY8r3cRgW0yAAAPXg4oqfuxA7PwjBFHhvxtLaqA
 sELxCAZ2OBernBAmJnUjQ9TMQ/kTnTSbktpNKLt5iJ4lQ4qXETkc29rXk7vfEvwB9xydwu
 Z65WAmNW262RV+pAU7K72QC+8f11TZwLR2iPii2H2KfZEtr/rr1g0oTY2xdd6p5yjv35IF
 uZTQX3XnYDjbZkSF40FBtrOnt9t5RXBAuSwrg6/ufx93dCly1glmohxEx4nhKw==
Date: Fri, 6 Feb 2026 15:41:00 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 33/48] lib/unigraf: add
 unigraf_get_connector_by_stream
Message-ID: <20260206154100.5341cdd2@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-33-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-33-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:12 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As unigraf can emulate MST, we need a way to grab the corresponding DRM
> connector from the stream id.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  lib/unigraf/unigraf.h |  2 ++
>  2 files changed, 42 insertions(+)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 643a3c1169ec..63dd7f62cc20 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -296,6 +296,46 @@ drmModeConnectorPtr unigraf_get_connector(int drm_fd)
>  	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
>  }
> =20
> +/**
> + * unigraf_get_connector_id_by_stream() - Get a connector id from a stre=
am id
> + * @drm_fd: DRM device where the unigraf is attached
> + * @stream_id: Stream to grab the connector from
> + */
> +int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id)
> +{
> +	drmModeConnectorPtr main_connector =3D unigraf_get_connector(drm_fd);
> +	drmModeResPtr res =3D drmModeGetResources(drm_fd);
> +
> +	char *mst_path;
> +	int mst_path_len =3D asprintf(&mst_path, "mst:%d-",
> main_connector->connector_id); +
> +	igt_assert(mst_path_len >=3D 0);
> +
> +	for (int i =3D 0; i < res->count_connectors; i++) {
> +		drmModePropertyBlobPtr path_blob =3D
> kmstest_get_path_blob(drm_fd,
> +
> res->connectors[i]); +
> +		if (path_blob && path_blob->length >=3D mst_path_len) {

IMHO adding to much if condition layers increase code complexity.
The following may be cleaner:

if (!path_blob || path_blob->length < mst_path_len)
	continue;


> +			if (memcmp(path_blob->data, mst_path, mst_path_len)
> =3D=3D 0) {
> +				if (stream_id =3D=3D 0) {

if (!memcmp(..)) {
	if (!stream_id) {
...


> +					drmModeFreePropertyBlob(path_blob);
> +					drmModeFreeResources(res);
> +					drmModeFreeConnector(main_connector);
> +					return res->connectors[i];
> +				}
> +				stream_id--;

The logic behind stream_id management is a bit confusing to me but well I am
not a drm expert so I may have missed something.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
