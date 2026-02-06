Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7362FEE20A6
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 15:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B9B10E1B8;
	Fri,  6 Feb 2026 15:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LeBJVUoN";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E3A10E1B8
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:45:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 06A03C250C5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:45:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6EAAD60729;
 Fri,  6 Feb 2026 15:45:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 148D6119D2001; Fri,  6 Feb 2026 16:45:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770392704; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rIhWbtxNXF7EiuW3Ko0RTJjQqCfXiYlRDcdGZbsZpn8=;
 b=LeBJVUoN9Yq51CvZ9QguZvjb7C2Lk1rIO10RT4n0v7JkPta497AfyBvcksq/C4SpxnSriZ
 6iXJ78NNd53WeveTQTzF2icYM8aheaEF7qwzf95MQCA/PFDQkKbNkvRMSnOpOjTaOuF+lA
 RQV/ApxCzCeiHYUY0Hpqc3jPQYKsDDoUGUaO1Yt+1m4Xdcsj6lJ83c2MEuuw0y1pH9Qx7j
 cd1s9MlU33CPfLH6yKSTleVflTtZj4nYNDKMk4M0dYS5zcF8V4P45wSpSApFqsrUsfPkOg
 jgngqhy10XB3QZaRsdzkzt3lxPbTtVyFKxiTzlXObHBa70SdopKj1EW8hVMgLg==
Date: Fri, 6 Feb 2026 16:45:03 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 48/48] tests/unigraf/unigraf_lt: Add test for
 link training
Message-ID: <20260206164503.16886b95@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-48-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-48-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:27 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> To test link trianing on various situation, add multiple link

typo: *training*

> training scenarios.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  tests/unigraf/meson.build  |   1 +
>  tests/unigraf/unigraf_lt.c | 178
> +++++++++++++++++++++++++++++++++++++++++++++ 2 files changed, 179
> insertions(+)
>=20
> diff --git a/tests/unigraf/meson.build b/tests/unigraf/meson.build
> index 4ef8c32151e4..22e64c0f389d 100644
> --- a/tests/unigraf/meson.build
> +++ b/tests/unigraf/meson.build
> @@ -1,5 +1,6 @@
>  unigraf_progs =3D [
>  	'unigraf_connectivity',
> +	'unigraf_lt',
>  ]
> =20
>  foreach prog : unigraf_progs
> diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
> new file mode 100644
> index 000000000000..ad3f3f91ec3c
> --- /dev/null
> +++ b/tests/unigraf/unigraf_lt.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: MIT

You forgot the copyright.

Else seems ok to me:
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
