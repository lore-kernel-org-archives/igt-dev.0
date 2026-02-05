Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7D6ECD985
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 16:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC0E10E211;
	Thu,  5 Feb 2026 16:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gOoN+etA";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A979910E211
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 16:33:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 330D21A2C31
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 16:33:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 091906074D;
 Thu,  5 Feb 2026 16:33:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DDA0E119A865B; Thu,  5 Feb 2026 17:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770309195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/6xOdzHcZBu9bmBE3kkpkp2b+m0ChFZNFuUWkTks44U=;
 b=gOoN+etAMe1V/c+otGI1lBj0qBDYtmIiJS90SXQhulj67sTyhcZiRzbzDL6/6Qvnfi6HD1
 9D/VeNdIISMCN5eMoHt847hgVYced7/TvrOVEz2RPQgPwchcMcOrTHS7xM/SqQ36rm6b1S
 l0jbmBIceYk8pKMqAuuxT7MCl6B9Q+eKlw+mg/uw0+aIdK4BS0i10JF7KZqeFOilR+EbaM
 uz4EFCTmcgd9XwsoJwlu9iRSJimMmCB94JEER84r2QgU2NtZcjGdyZI2LYN6U6naDEh/oT
 LscYuyLcuJuhtIabcmYKMhHkEMAfxYQZN9RFUpWX/mfxEa1KENOyZaMVIcMg3w==
Date: Thu, 5 Feb 2026 17:33:12 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 25/48] lib/unigraf: Add unigraf assert and
 deassert helpers
Message-ID: <20260205173312.5d2bb854@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-25-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-25-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:04 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Unigraf is able to manipulate the HPD line of the connector, add few
> helpers to manipulate them.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 56
> +++++++++++++++++++++++++++++++++++++++++++++++++++ lib/unigraf/unigraf.h=
 |
> 6 ++++++ 2 files changed, 62 insertions(+)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 02ade26f7bdd..b7e31a887a88 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -85,6 +85,26 @@ static void unigraf_init(void)
>  	igt_install_exit_handler(unigraf_exit_handler);
>  }
> =20
> +/**
> + * _unigraf_write_u32 - Write a 32-bit value to a TSI configuration item
> + * @config_id: The configuration item ID to write to
> + * @value: The 32-bit value to write
> + *
> + * This function writes a 32-bit value to the specified TSI configuration
> item.
> + */
> +static void _unigraf_write_u32(TSI_CONFIG_ID config_id, uint32_t value)
> +{
> +	igt_assert(unigraf_device);
> +	unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config_id,
> &value, sizeof(value))); +}
> +
> +#define unigraf_write_u32(config_id, value)
> 	\
> +	({

I think you should cast a void here as you are not returning anything.
(void)({

> 	\
> +		uint32_t v =3D (value);
> 	\
> +		unigraf_debug("Value write: " #config_id "=3D%d...\n",
> v);	\
> +		_unigraf_write_u32(config_id, v);
> 	\
> +	})
> +

...

> + * This function pulses the HPD signal for the specified duration.
> + */
> +void unigraf_hpd_pulse(int duration)
> +{
> +	// In theory this should work:
> +	// unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, duration);
> +	// But this seems to be broken and this works:

Use /* ... */ comment here.
// is for one line only comment.

> +	unigraf_hpd_deassert();
> +	usleep(duration);
> +	unigraf_hpd_assert();
> +}

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
