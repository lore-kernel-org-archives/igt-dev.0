Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1035EC1101
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 16:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEAB8935C;
	Mon, 23 Feb 2026 16:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JR2lKJGH";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD848935C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 16:14:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2BF4A1A115F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 16:14:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 009D25FD59;
 Mon, 23 Feb 2026 16:14:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B38710368F42; Mon, 23 Feb 2026 17:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771863255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BYnPv+CGoyQn43GA9wDdpu76eD7APM62svTv6fCJJPs=;
 b=JR2lKJGHE2XGzm1qCRjIGfBRsMko35lnSonguolbEGwkicNYemJBE9pKurYC0vLDPIhTU4
 IcbNR6euOoVBixI49vYGvNyachkl0BwqnozES1wQ0wu8BoaWJgvoMy6UJoCsi1YEETFIZB
 CuGjJpHmqh/A1GQ72U1wy7cGFqhCPOwtIgMXmlvRHeCH9xIxkWztV80CF18v31BAuYqhZd
 aUvIrgoZxXlvCF9mAqzMDt1L0cz5cGwNK74nNrvxcMIFwlcBa9meDyttyQWxoSewf52aVq
 82YJjTI4SnjCB8V7dL0uj2JPXS0zBxb6ZaCl+PentIt7zytpjnxwyDGNs3YUSg==
Date: Mon, 23 Feb 2026 17:14:13 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 46/48] lib/unigraf: Add helpers to set maximum
 link rate
Message-ID: <20260223171413.61927b7d@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-46-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-46-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:53 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As link rate can vary on a display port link, add a way
> to change advertised link rate from unigraf.
>=20
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 53
> +++++++++++++++++++++++++++++++++++++++++++++++++++ lib/unigraf/unigraf.h=
 |
> 14 ++++++++++++++ 2 files changed, 67 insertions(+)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 038188182bc5..a18a90caad56 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -544,6 +544,7 @@ void unigraf_reset(void)
>  	unigraf_load_default_edid();
>  	unigraf_hpd_assert();
>  	unigraf_set_max_lane_count(4);
> +	unigraf_set_max_link_rate(UNIGRAF_RATE_8_10_GHZ);
>  }
> =20
>  /**
> @@ -832,3 +833,55 @@ int unigraf_get_max_lane_count(void)
>  					     &max_lanes, sizeof(max_lanes)));
>  	return max_lanes;
>  }
> +
> +/**
> + * unigraf_set_max_link_rate() - Set the maximum link rate advertised to=
 the
> DUT
> + * @rate: The maximum link rate to configure on the device. Actual value=
 is
> + *        @rate * 270000 kHz. Common values can be found in enum unigraf=
_rate

There is a parameter name error here.

> + *
> + * This function sets the maximum link rate that the device will adverti=
se
> on the DP link.
> + * The actual link rate used may be less than the requested value if the=
 DUT
> does not
> + * support/use it.
> + */
> +void unigraf_set_max_link_rate(int bandwidth)
> +{
> +	unigraf_write_u32(TSI_DPRX_MAX_LINK_RATE, bandwidth);
> +}

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
