Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B5DE83067
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E3110E572;
	Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qtCPkTMz";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A664110E53A
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 18:10:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9AB731A2AEE
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 18:10:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 68A2A60767;
 Mon,  2 Feb 2026 18:10:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B25A119A8888; Mon,  2 Feb 2026 19:10:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770055824; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0m6JEGaNSZW/yY1tyfGwE6WM+S3/zSkVU3ETdzoNc44=;
 b=qtCPkTMzEe8k79VDR1UOJAeW5TQhXiVxmTnFovW+ep/u9nfE/6gE2ds4uKOmVtBnImgErG
 KZJMIoA/Br8puJ35beTEJEitajGOsT+2bbZ8ZmtUR+OqI+nBOMGdYmBfYARX2SZdh8UHoI
 eKpbtVeNm2v84LS3njdNRM9xRCKSrrcbuhqg4lei/gNHJSOd0R2DUHpV8iknA5NB5d+DJi
 cVo6DUotQYscsdJ2uS72Bny+wgOJaT+5OLuCSta3BDcjYhcZTZbIXd1BWlAHSy2VYdTSeT
 x7xWGpzB/TorJYH0oukFnG3KFVDK7Jfigb1OktwVL6HEBv3u23PBkz8bwxtq6g==
Date: Mon, 2 Feb 2026 19:10:22 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 24/48] lib/unigraf: Add reset function
Message-ID: <20260202191022.44a51863@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-24-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-24-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:03 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> To have a consistent state at the beginning of tests, add a unigraf_reset
> function that will restore a known state.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 12 ++++++++++++
>  lib/unigraf/unigraf.h |  2 ++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 1b31f7a44566..02ade26f7bdd 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -283,6 +283,8 @@ bool unigraf_open_device(int drm_fd)
>  	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
>  	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
> =20
> +	unigraf_reset();
> +
>  	return true;
>  }
> =20
> @@ -296,3 +298,13 @@ void unigraf_require_device(int drm_fd)
>  {
>  	igt_require(unigraf_open_device(drm_fd));
>  }
> +
> +/**
> + * unigraf_reset() - Reset the Unigraf device
> + *
> + * This function performs a hardware reset of the Unigraf device, restor=
ing
> it to a
> + * default state. This includes resetting all configuration parameters,
> stream settings,
> + * and link parameters to default values.
> + */
> +void unigraf_reset(void)
> +{}

Empty function??
Maybe add it when you really are doing something.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
