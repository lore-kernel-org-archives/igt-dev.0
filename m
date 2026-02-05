Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659D3ECD989
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 16:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127BC10E941;
	Thu,  5 Feb 2026 16:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GKi8fguq";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC54910E93A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 16:56:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 11A17C243AF
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 16:56:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D38776074D;
 Thu,  5 Feb 2026 16:56:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37128119A8891; Thu,  5 Feb 2026 17:56:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770310590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=C7t8KK5d58Uh4nFnb5QcgIWIKip+QCwoPgIEH0EL7B8=;
 b=GKi8fguq+XEb40t6WbNPCq1Z6Ju4cuibpU1CiAD1634+x0gwn9D5igaWmG4fZ5h7w3YKh6
 bRvHHwdLhWdKFbYHHni5pCDsHC08DBXoim5MqjFanX3VaPJwiYrSdVOTCFRB6NrbhxGtis
 uUCVKYSBUk0tnEIaM+Oo0RRLdjz1NhQRyn8yVnOg5+udirT/3Rm84IfVzJKnES445h3I/x
 r6UXXEOUlMUBxKShmauwr5/YqleLELUIj5lU+kYIlZzZytf+HKW6Uf/aXJODSbuCfl+b/e
 8L02/8ghgRlaO/ZUeQLHvGQ7oazPsOUzD03Zp1t13OnoJHScqRsIUCGFvmibwA==
Date: Thu, 5 Feb 2026 17:56:28 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 27/48] lib/unigraf: Allows sst/mst configuration
Message-ID: <20260205175628.45b09939@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-27-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-27-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:06 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Unigraf devices can emulate both SST and MST display port. In order to
> write tests using both, add fews helper to manipulate them.
>=20
> The define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT is taken from the
> python SDK, as it was not defined by the C sdk nor documented.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 109
> ++++++++++++++++++++++++++++++++++++++++++++++++++ lib/unigraf/unigraf.h |
> 12 ++++++ 2 files changed, 121 insertions(+)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 966e7d2a5077..4a3b0a5fc28e 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -105,6 +105,23 @@ static void _unigraf_write_u32(TSI_CONFIG_ID config_=
id,
> uint32_t value) _unigraf_write_u32(config_id, v);
> 	\ })
> =20
> +static uint32_t _unigraf_read_u32(TSI_CONFIG_ID config_id)
> +{
> +	uint32_t value;
> +
> +	igt_assert(unigraf_device);
> +	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, config_id,
> &value, sizeof(value)));
> +	return value;
> +}
> +
> +#define unigraf_read_u32(config_id)
> 	\
> +	({
> 	\
> +		uint32_t value;
> 		\
> +		value =3D _unigraf_read_u32((config_id));
> 		\
> +		unigraf_debug("Value read: " #config_id "=3D%d\n",
> value);	\
> +		value;
> 		\
> +	})

Why is there a define and a function that are doing the same thing ?
Same question for the write part patch 25. I missed it in the review.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
