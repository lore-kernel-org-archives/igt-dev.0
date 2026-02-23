Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCACDEA4FC2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2CA10E454;
	Mon, 23 Feb 2026 14:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aY5SUucn";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967D510E454
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:07:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 20D3B4E4102D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:07:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EBF425FD43;
 Mon, 23 Feb 2026 14:07:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5543610368DF6; Mon, 23 Feb 2026 15:07:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771855670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4B01RsV6Mt4ItkJdLDbZTJIsBtS3GEkeKx3C4UTHauE=;
 b=aY5SUucnsKgzL6qSrwz7nMo62irurVCDoRQNgkJ1G3YTw9wIfMERW8bysqEai0jGbWtoQS
 6ilR7jIJkLhua/7G3RSYtTs83un9gG9q8GmByCqugglZPTEJWAlQxwLLUb20J98WS7J41P
 d+7iQ5CqCW9g+/i7wfO1/9XTbZKa3cwnCL9H4A+WoShdHoaZoUpTKKxV4Rs8SGODfMgmoy
 W2zsLUgUulqwDf1EcQUh1i7fUSB2v+r8XvfOPrbg5EQyeQHaTmcmEPkvC6Dg+kD0R8Cer9
 h6CG18hxIeRb3qKgJXHF4epCU85lr9C2ydmwqBACouFvS7HnoRvRzfUdhBhhTw==
Date: Mon, 23 Feb 2026 15:07:47 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 14/48] lib/monitor_edids: Add helper functions
 for using monitor_edid objects
Message-ID: <20260223150747.3a4a9574@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-14-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-14-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:21 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Introduce the functions edid_from_monitor_edid() and
> get_edids_for_connector_type(). The former converts a monitor_edid object
> to a struct edid, which can then be utilized by igt_kms helpers. The
> latter returns a list of monitor_edid objects for a specific connector
> with certain characteristics
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/monitor_edids/dp_edids.h             |  3 ++
>  lib/monitor_edids/hdmi_edids.h           |  3 ++
>  lib/monitor_edids/monitor_edids_helper.c | 80
> ++++++++++++++++++++++++++++++++ lib/monitor_edids/monitor_edids_helper.h=
 |
> 7 ++- 4 files changed, 92 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/monitor_edids/dp_edids.h b/lib/monitor_edids/dp_edids.h
> index 144907558be1..07793381257e 100644
> --- a/lib/monitor_edids/dp_edids.h
> +++ b/lib/monitor_edids/dp_edids.h
> @@ -194,4 +194,7 @@ monitor_edid DP_EDIDS_NON_4K[] =3D {
> =20
>   };
> =20
> +#define DP_EDIDS_4K_COUNT ARRAY_SIZE(DP_EDIDS_4K)
> +#define DP_EDIDS_NON_4K_COUNT ARRAY_SIZE(DP_EDIDS_NON_4K)
> +
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
> diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edid=
s.h
> index f6cfe82ff6e1..3984241775c3 100644
> --- a/lib/monitor_edids/hdmi_edids.h
> +++ b/lib/monitor_edids/hdmi_edids.h
> @@ -604,4 +604,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] =3D {
>  		  "1620582c2500baac4200009e0000006b" },
>  };
> =20
> +#define HDMI_EDIDS_4K_COUNT ARRAY_SIZE(HDMI_EDIDS_4K)
> +#define HDMI_EDIDS_NON_4K_COUNT ARRAY_SIZE(HDMI_EDIDS_NON_4K)
> +
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_ */
> diff --git a/lib/monitor_edids/monitor_edids_helper.c
> b/lib/monitor_edids/monitor_edids_helper.c index 1cbf1c22f0bb..6043e7a084=
b3
> 100644 --- a/lib/monitor_edids/monitor_edids_helper.c
> +++ b/lib/monitor_edids/monitor_edids_helper.c
> @@ -15,6 +15,10 @@
>  #include <assert.h>
> =20
>  #include "igt_core.h"
> +#include "igt_edid.h"
> +#include "dp_edids.h"
> +#include "drmtest.h"
> +#include "hdmi_edids.h"
> =20
>  static uint8_t convert_hex_char_to_byte(char c)
>  {
> @@ -90,3 +94,79 @@ void free_chamelium_edid_from_monitor_edid(struct
> chamelium_edid *edid) free(edid);
>  	edid =3D NULL;
>  }
> +
> +/**
> + * edid_from_monitor_edid:
> + * @mon_edid: Monitor EDID to convert
> + *
> + * Get a struct edid from a monitor_edid. This returns a pointer to a ne=
wly
> allocated struct edid.
> + * The caller is in charge to free this pointer when required.
> + */
> +struct edid *edid_from_monitor_edid(const monitor_edid *mon_edid)
> +{
> +	uint8_t *raw_edid;
> +	size_t edid_size;
> +	int i;
> +
> +	edid_size =3D strlen(mon_edid->edid) / 2; /* each ascii is a nibble. */
> +	raw_edid =3D malloc(edid_size);
> +	igt_assert(raw_edid);
> +
> +	for (i =3D 0; i < edid_size; i++) {
> +		raw_edid[i] =3D convert_hex_char_to_byte(mon_edid->edid[i *
> 2]) << 4 |
> +			      convert_hex_char_to_byte(mon_edid->edid[i * 2
> + 1]);
> +	}
> +
> +	if (edid_get_size((struct edid *)raw_edid) > edid_size) {
> +		uint8_t *new_edid;
> +
> +		igt_debug("The edid size stored in the raw edid is longer
> than the edid stored in the table.");
> +		new_edid =3D realloc(raw_edid, edid_get_size((struct edid
> *)raw_edid));
> +		igt_assert(new_edid);
> +		raw_edid =3D new_edid;

You didn't take my last comment into account here? Was I mistaken?
> I don't really know much about the edid content but shouldn't you have to
> convert_hex_char_to_byte() also for the edid extensions?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
