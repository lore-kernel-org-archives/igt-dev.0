Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671DBEA4FC3
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1510210E4BE;
	Mon, 23 Feb 2026 14:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2YTX6BGz";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A0810E4B0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:37:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 77B9FC143C9;
 Mon, 23 Feb 2026 14:37:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4B9585FD43;
 Mon, 23 Feb 2026 14:37:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD45210368F53; Mon, 23 Feb 2026 15:37:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771857431; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/w79Uhbn0IrdbSftL0Qmg10OgpPDrdjvxpWkE/xxBDU=;
 b=2YTX6BGzcMhUBzq/pQp0m/idEAGcugcSvrbmb8BPRTNrKaVzPoyIhW6fvyIqxbjqVcbIH+
 M3FLPfak6HU8/wks3QnYV+nCKWzQsmUQklYSR5rECTdxMMrFRyyH+gPUsyU5eiKo8t23H9
 u6hdmykxKXg+HDySWjOyaO86HMWMVuoid8+Xb9qkxZ1dNNgeV+c4dbx0ngsNQqh//HtjJW
 yHUvlcCcSyIKF4F3PWYqxC4q+EY6XnUyhpD5D/tWBZNSJKNroIyrrxP951apg+VypCwdXB
 L+8quynGsR0uzwEXbIkhlaUUvveZcl6Wa3zWuTDvvacgrRnICmXYivA59KFEow==
Date: Mon, 23 Feb 2026 15:37:09 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 28/48] lib/unigraf: Add helpers to read and
 write edid
Message-ID: <20260223153709.733d166f@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-28-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-28-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:35 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Read and writing EDID on unigraf can be useful to emulate different
> screens, add helpers to read and write them.
>=20
> There is a limitation on the libTSI.so, it is only possible to read EDID
> using buffers of size multiple of 128 bytes, and there is no way to query
> the actual EDID size. The current implementation can only read EDID up to
> 2048 bytes.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 55
> +++++++++++++++++++++++++++++++++++++++++++++++++++ lib/unigraf/unigraf.h=
 |
> 4 ++++ 2 files changed, 59 insertions(+)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 56a1fbe71827..796848dd8fc7 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -127,6 +127,20 @@ static void unigraf_init(void)
>  		value;
> 						\ })
> =20
> +/**
> + * unigraf_write() - Helper to write a value to unigraf
> + * @config: config id to write
> + * @data: data to write
> + * @data_len: length of the data
> + * Returns
> + */
> +static void unigraf_write(TSI_CONFIG_ID config, const void *data, size_t
> data_len) +{
> +	unigraf_debug("Writing %zu bytes to 0x%x\n", data_len, config);
> +
> +	unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config, data,
> data_len)); +}
> +
>  /**
>   * unigraf_device_count() - Return the number of scanned devices
>   *
> @@ -332,6 +346,47 @@ void unigraf_reset(void)
>  	unigraf_set_sst();
>  }
> =20
> +/**
> + * unigraf_read_edid() - Read the EDID from the specified stream
> + * @stream: The stream ID to read the EDID from
> + * @edid_size: Pointer to an integer where the size of the EDID will be
> stored
> + *
> + * Returns: A pointer to the EDID structure, or NULL if the operation
> failed. The caller
> + * is responsible to free this pointer.
> + */
> +struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
> +{
> +	void *edid;
> +
> +	unigraf_debug("Read EDID for stream %d...\n", stream);
> +
> +	edid =3D malloc(2048);
> +	memset(edid, 0, 2048);

You didn't take my last comment into account to use calloc?

Also what is the point of the edid_size parameter if you hard code it to 20=
48?

> +
> +	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
> +	*edid_size =3D unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device,
> +							  TSI_EDID_TE_INPUT,
> +							  edid, 2048));
> +
> +	return edid;
> +}

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
