Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F20DF588E3
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 16:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E2B10E6F5;
	Mon, 20 Apr 2026 16:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C9YeZxg9";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2EC10E6F5
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 16:29:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 88F334E42A74;
 Mon, 20 Apr 2026 16:29:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5E6A45FFA5;
 Mon, 20 Apr 2026 16:29:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C23D104609FD; 
 Mon, 20 Apr 2026 18:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776702591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wiPdWXHOlWRU8J2P4vLHSHODd6mHTTXVtoOoKxarEhs=;
 b=C9YeZxg90b44ikUDWRxOALtAd1IE1dIZ4xYpn/S2Lo/taIm3xS4ZYHmuQK5jVALc4SvOl+
 6xGstHBgwVAfsN+q6v0l/vd80MfXyYG5c93tmuf9XauVON2Ljxr2Ndd5wkkYXjyI/h1QXW
 QjYSyBXZUBvrNhU/81AOFqZxpAm4PBjqu+bIaO3pnlR8cyFqyI2EHLoODcdaQ0HM3ncw3f
 idxYdjDnKx8JEA4mKnsavEhXig1vupWgPJ89Fu/3OVpX68wdLZngtqsrhCGJIIkxhtKHpL
 cdmtqj6EkgaMmt2ga4e+D1wU0v/KLPdx9vTTLC66gG/8nXKHmzqRdchmSpO9qA==
Date: Mon, 20 Apr 2026 18:29:49 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v10 29/49] lib/unigraf: Add helpers to read and
 write edid
Message-ID: <20260420182949.3617291f@kmaincent-XPS-13-7390>
In-Reply-To: <20260331-unigraf-integration-v10-29-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
 <20260331-unigraf-integration-v10-29-12266c34cc1d@bootlin.com>
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

On Tue, 31 Mar 2026 19:11:46 +0200
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
>  lib/vendor/unigraf/unigraf.c | 60
> ++++++++++++++++++++++++++++++++++++++++++++ lib/vendor/unigraf/unigraf.h=
 |
> 4 +++ 2 files changed, 64 insertions(+)
>=20
> diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
> index 930dd129d091..68c322a0302b 100644
> --- a/lib/vendor/unigraf/unigraf.c
> +++ b/lib/vendor/unigraf/unigraf.c
> @@ -14,6 +14,7 @@
>  #include "unigraf.h"
>  #include "TSI.h"
>  #include "TSI_types.h"
> +#include "igt_aux.h"
>  #include "igt_rc.h"
> =20
>  #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt,
> unigraf_device, ##__VA_ARGS__) @@ -57,6 +58,11 @@ static char
> *unigraf_connector_name; */
>  #define UNIGRAF_DEFAULT_INPUT_NAME "DP RX"
> =20
> +/**
> + * UNIGRAF_EDID_MAX_SIZE - Max EDID size that can be read from the unigr=
af.
> The
> + */
> +#define UNIGRAF_EDID_MAX_SIZE 2048
> +
>  static void unigraf_close_device(void)
>  {
>  	if (!unigraf_device)
> @@ -128,6 +134,20 @@ static void unigraf_init(void)
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

Returns void? ;)
With this removed you can add my Reviewed-by.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
