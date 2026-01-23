Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E890D77897
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 17:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E12310EB85;
	Fri, 23 Jan 2026 17:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dfT08a0x";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789B810EB8D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:40:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 630F54E42225;
 Fri, 23 Jan 2026 17:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 38C676070A;
 Fri, 23 Jan 2026 17:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E3B66119A80FC; Fri, 23 Jan 2026 18:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769190033; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k5hKXP8IJR9E/GRxayL8dA9fnRmNUvD5n4gcprrs8I8=;
 b=dfT08a0xOh1O8syUiOUkSK9NEPyqkQwUDslDPLubM+Y/Di1e3VjDHeoNtW50A973u2lgja
 PA5Feu0+kEwEHeOhn2uBdKqJ/Nxj6WY6Icciq1urAWVlonU8KSiXG2JlHewmloJmWwikL9
 Kd1gSBKLDkoMGtv4R26MaEERvmp5NrWvzxmg/v0Yx3EWvzIWyMhKRyjcxW0cPsU5/KCJ7h
 0UZarNfan5EyjIXsYObeeb48zUqdXSoRadEpEDfz3g4q1Txdbe1qEDLHYL0TMVBjbMd30g
 s+JN+SPG1lgJx+dO5VJmsZ0Lim9roQ6K1rxfcOFJLrCZDy1sbWLaemdCo9cCHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:40:32 +0100
Message-Id: <DFW5IWQLH7IP.1YQH9SWGZFRL5@bootlin.com>
Subject: Re: [PATCH i-g-t v4 28/46] lib/unigraf: Add helpers to read and
 write edid
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-28-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-28-0fc7bb1b4101@bootlin.com>
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
> Read and writing EDID on unigraf can be useful to emulate different
> screens, add helpers to read and write them.
>
> There is a limitation on the libTSI.so, it is only possible to read EDID
> using buffers of size multiple of 128 bytes, and there is no way to query
> the actual EDID size. The current implementation can only read EDID up to
> 2048 bytes.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  lib/unigraf/unigraf.h | 21 +++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 9e77a052d755..2229202ea868 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -125,6 +125,21 @@ static uint32_t _unigraf_read_u32(TSI_CONFIG_ID conf=
ig_id)
>  		value;								\
>  	})
>
> +/**
> + * unigraf_write() - Helper to write a value to unigraf
> + * @dev: device handle, can be null for some config id

This function has no @dev parameter.

> + * @config: config id to write
> + * @data: data to write
> + * @data_len: length of the data
> + * Returns
> + */
> +static void unigraf_write(TSI_CONFIG_ID config, const void *data, size_t=
 data_len)
> +{
> +	unigraf_debug("Writing %zu bytes to 0x%x\n", data_len, config);
> +
> +	unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config, data, data=
_len));
> +}
> +
>  /**
>   * unigraf_device_count() - Return the number of scanned devices
>   *
> @@ -332,6 +347,31 @@ void unigraf_reset(void)
>  	unigraf_set_sst();
>  }
>
> +struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
> +{
> +	void *edid;
> +
> +	unigraf_debug("Read EDID for stream %d...\n", stream);
> +
> +	edid =3D malloc(2048);
> +	memset(edid, 0, 2048);
> +
> +	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
> +	*edid_size =3D unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device,
> +							  TSI_EDID_TE_INPUT,
> +							  edid, 2048));
> +
> +	return edid;
> +}
> +
> +void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32=
_t edid_size)
> +{
> +	unigraf_debug("Write EDID for stream %d...\n", stream);
> +
> +	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
> +	unigraf_write(TSI_EDID_TE_INPUT, edid, 2048);
> +}
> +
>  void unigraf_hpd_assert(void)
>  {
>  	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 1);
> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
> index 9fcae674b1d5..983a21bbd61b 100644
> --- a/lib/unigraf/unigraf.h
> +++ b/lib/unigraf/unigraf.h
> @@ -57,6 +57,27 @@ void unigraf_require_device(int drm_fd);
>   */
>  void unigraf_reset(void);
>
> +/**
> + * unigraf_read_edid() - Read the EDID from the specified input

"from the specified stream"?

> + * @dev: The device handle

This function has no @dev parameter.

> + * @stream: The stream ID to read the EDID from
> + * @edid_size: Pointer to an integer where the size of the EDID will be =
stored
> + *
> + * Returns: A pointer to the EDID structure, or NULL if the operation fa=
iled. The caller
> + * is responsible to free this pointer.
> + */
> +struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);

With the two @dev lines removed and the unigraf_read_edid() description fix=
ed:
 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
