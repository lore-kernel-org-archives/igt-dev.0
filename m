Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DEDE8305F
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C525310E569;
	Tue,  3 Feb 2026 08:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WzxlksXo";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F8E10E52A
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 16:44:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CBB514E423C1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 16:44:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 884AF60767;
 Mon,  2 Feb 2026 16:44:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D346119A88EE; Mon,  2 Feb 2026 17:44:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770050668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uzomLj6HrcAeb1W/+m3+lEQSj/rHsZF+lWUyuOYlHLQ=;
 b=WzxlksXoLulcB55EF20WYBxgvSnEF4ZdmvsGPmmLTNw+EK88VFzuxwyFHUHRmi2AnQT0fY
 7ZF/g3SrjB8MnwAVABqskpssWuXbk68zi3uZhh+wg1qs/bGvFl86hcbS4xCxx9hcWhYVHd
 W84bjsduxQQJOaEhL+72Mq2TPie9DkZYFc+wzfkKOc/986IqwbikqrWsdhN0g38sRrDVQg
 tLuX52g7UejzVsvtfsTQV9br5W1O2rai0VGlNZ4RLTzsxTElcdSjQqmGUZvFT9b258hbgg
 A0M9IB9Hil8lHaek6YMJ3DcbQBbT3FR1Kl6wplW8sl1hB3nnRkvVg1FPHnks3A==
Date: Mon, 2 Feb 2026 17:44:25 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 14/48] lib/monitor_edids: Add helper functions
 for using monitor_edid objects
Message-ID: <20260202174425.45617d82@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-14-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-14-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:32:53 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Introduce the functions edid_from_monitor_edid() and
> get_edids_for_connector_type(). The former converts a monitor_edid object
> to a struct edid, which can then be utilized by igt_kms helpers. The
> latter returns a list of monitor_edid objects for a specific connector
> with certain characteristics

...

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

I don't really know much about the edid content but shouldn't you have to
convert_hex_char_to_byte() also for the edid extensions?
Else ok to me.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
