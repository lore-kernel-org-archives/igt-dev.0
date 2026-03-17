Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C096AFED9E4
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 15:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713E510E6C0;
	Tue, 17 Mar 2026 15:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gbYCkSB8";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C3610E6C0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:32:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1805C4E42656;
 Tue, 17 Mar 2026 15:32:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E22DF5FC9A;
 Tue, 17 Mar 2026 15:32:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 41218104504DD; Tue, 17 Mar 2026 16:32:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773761544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7QyqjarSkqDoSiFDF05jRMW33SiQclNlZzQbAQh2C8Y=;
 b=gbYCkSB8IfT3nhoEUeA8Qaf6zIu2janjgZgEfXEnxrTNgRPy/LVugncaFBQvFfCJeaJsvW
 3RVhvAE7ETb7kLRehwAuJafTQBM7QxM+tquPtmW4FnM2uCR5O1ZYpqwaGdFm42MKh0uE/Q
 mMS6DFH/nknusui1dOMU8RkdSZBAk2Zf655mkb9hQGJWCzYHHGXctM0yjMR9bIVDYJtW0g
 c3SvqyEcDD4zVnLAH/d7gxla5UmS1MhpAScV65f73wevcEvMu9JDjwF56tfJGYH10xzZc1
 TR7vUD1noLgh+o6+EtPXKNNVyAKVaH2jQPpHRayoAL2BahwajWySHoHnHtPz+Q==
Date: Tue, 17 Mar 2026 16:32:21 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 29/49] lib/unigraf: Add helpers to read and
 write edid
Message-ID: <20260317163221.42ca4019@kmaincent-XPS-13-7390>
In-Reply-To: <20260316-unigraf-integration-v9-29-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-29-a01dffc3b0cb@bootlin.com>
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

On Mon, 16 Mar 2026 17:17:50 +0100
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
>  lib/unigraf/unigraf.c | 59
> +++++++++++++++++++++++++++++++++++++++++++++++++++ lib/unigraf/unigraf.h=
 |
> 4 ++++ 2 files changed, 63 insertions(+)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index b752ff573ace..d06da6742e95 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -56,6 +56,11 @@ static char *unigraf_connector_name;
>   */
>  #define UNIGRAF_DEFAULT_INPUT_NAME "DP RX"
> =20
> +/**
> + * EDID_MAX_SIZE - Max EDID size that can be read from the unigraf. The
> + */

The ? Missing a sentence?

> +#define EDID_MAX_SIZE 2048
> +
>  static void unigraf_close_device(void)
>  {
>  	if (!unigraf_device)
> @@ -127,6 +132,20 @@ static void unigraf_init(void)
>  		value;
> 						\ })
> =20

...

> +
> +/**
> + * unigraf_write_edid() - Write EDID data to the specified stream
> + * @stream: The stream ID to write the EDID to
> + * @edid: Pointer to the EDID structure to write
> + * @edid_size: Size of the EDID data in bytes
> + *
> + * This function writes the provided EDID data to the specified stream.
> + */
> +void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32=
_t
> edid_size) +{

edid_size not used in the function.=20

> +	unigraf_debug("Write EDID for stream %d...\n", stream);
> +
> +	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
> +	unigraf_write(TSI_EDID_TE_INPUT, edid, 2048);

Use EDID_MAX_SIZE here or the edid_size parameter?=20

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
