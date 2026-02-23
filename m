Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A63AEA4FCF
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 15:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DE010E3AD;
	Mon, 23 Feb 2026 15:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="tf2VlW86";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1606910E3AD
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:03:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9369B1A115C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:03:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6A0B25FD59;
 Mon, 23 Feb 2026 15:03:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8BA0110368E7B; Mon, 23 Feb 2026 16:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771858986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tXxf9JOk1m8CdL09U87LuxGKbQKW4Rz1VWnJJ4j5DG0=;
 b=tf2VlW86tT6PlnM0CvkvYZsxNt2kYWRpy5Xsq78WjyZ0OcxqSQw7mgyBM7VO46vuMomb0o
 0ime2wFjTcKac4RTKA9PMZMIcILDwtSs/E4WWLta46//UuI9OgP0y29VzTVTL8FsjIcUjW
 Oi7qEig66EeiT5zoq9O858+/TbPl/D+SPKOmlf/4w5RVvFdlxB/I/pIw1xRmMBtaWx80C7
 lJBONuv5siYH9o0TRRB+efgNYWpLgD0g4l65OnYg3lkIBXpYbcwFnWlue4PIE0QO9MQag+
 oU+AxHaBl+tmSUKnz/88ByapgNC3y2x95epgzFa3CNLeHuKXqWMScgtW/pO+AA==
Date: Mon, 23 Feb 2026 16:03:03 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 29/48] lib/unigraf: Add connector and EDID
 configuration
Message-ID: <20260223160303.12ed9321@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-29-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-29-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:36 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As multiple connectors can be present on the DUT, add a configuration to
> tell which connector is used by the Unigraf and which EDID to use on the
> Unigraf.
>=20
> Complete list of EDID name supported can be found in
> lib/monitor_edids/{dp,hdmi}_edids.h
>=20
> The configuration will look like:
>=20
> [Unigraf]
> Device=3DUCD-500 [2434C620]
> Role=3DDisplayPort Source and Sink
> Input=3DDP RX
> Connector=3DDP-4
> EDID=3DDEL_16543_DELL_P2314T_DP
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 125
> +++++++++++++++++++++++++++++++++++++++++++++++++- lib/unigraf/unigraf.h |
> 3 ++ 2 files changed, 126 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 796848dd8fc7..549196bb90bd 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -13,7 +13,10 @@
>  #include "unigraf.h"
>  #include "TSI_types.h"
>  #include "TSI.h"
> +#include "igt_edid.h"
> +#include "igt_kms.h"
>  #include "igt_rc.h"
> +#include "monitor_edids/monitor_edids_helper.h"
> =20
>  #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt,
> unigraf_device, ##__VA_ARGS__)=20
> @@ -46,6 +49,16 @@ static char *unigraf_connector_name;
>   */
>  #define UNIGRAF_CONFIG_INPUT_NAME "Input"
> =20
> +/**
> + * UNIGRAF_CONFIG_CONNECTOR_NAME - Key of the connector name in the
> configuration file
> + */
> +#define UNIGRAF_CONFIG_CONNECTOR_NAME "Connector"
> +
> +/**
> + * UNIGRAF_CONFIG_EDID_NAME - Key of the EDID name in the configuration =
file
> + */
> +#define UNIGRAF_CONFIG_EDID_NAME "EDID"
> +
>  /**
>   * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf
> device */
> @@ -200,6 +213,82 @@ static int unigraf_find_input(const char *request)
>  	return -ENODEV;
>  }
> =20
> +static void unigraf_load_default_edid(void)
> +{
> +	struct edid *edid =3D get_edid_by_name(unigraf_default_edid);
> +
> +	if (edid) {
> +		for (int i =3D unigraf_get_mst_stream_max_count(); i > 0; i--)
> +			unigraf_write_edid(i - 1, edid, edid_get_size(edid));
> +	} else {
> +		igt_warn("Impossible to find an edid named \"%s\"",
> unigraf_default_edid);
> +		list_edid_names(IGT_LOG_WARN);
> +	}

I am nitpicking but separating the check from the action improve code clari=
ty:

	if (!edid){
		igt_warn("Impossible to find an edid named \"%s\"",
			 unigraf_default_edid); list_edid_names(IGT_LOG_WARN);
		return;
	}

	for(...)

With this fixed:
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
