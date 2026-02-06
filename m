Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920EAEE20AB
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 15:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D89110E812;
	Fri,  6 Feb 2026 15:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="J/DSV3Gz";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64D010E812
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:29:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C9D294E42446;
 Fri,  6 Feb 2026 15:29:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9A66E60729;
 Fri,  6 Feb 2026 15:29:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 534F1119D1F76; Fri,  6 Feb 2026 16:29:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770391784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lxhOMTJieAmGI1cajT+iLW3NwCYyit2uQ+G8n0tT6QU=;
 b=J/DSV3Gz1QnZGKobZzx4kmUrgBqkrHoJofzg6dJPJFns7Q6VkNLqa5EZJtc9ZxT4TyoImj
 CO0NP/3cfT5kHzZLHskT3ksJcsi4D76/m32plyTjELb7W5rWz3XKDwk0ulOSteezZXfNQU
 3Jnf7RZMwB45mM/n7zm1IJBiAp9ULJOorOWGK2AM2dY0tlGYXURPVoWHVt3CrBzM5ryoo3
 424EY9djz2Z+9CHQdpeaqeZlB89KEmcyrIfwp0a2YoixoK56oRv9E7trOR5xm0edwZZ4Ew
 uhkqvp9uHTQ87fqqCwZDJw9uyghodzLMjq01p2B4IL8D+JgLURrMmQ9hGW+TGw==
Date: Fri, 6 Feb 2026 16:29:41 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 45/48] docs/unigraf: Add unigraf documentation
Message-ID: <20260206162941.4a5f867b@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-45-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-45-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:24 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Add unigraf documentation to explain how to compile and use it with IGT.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  docs/unigraf.txt | 81
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, =
81
> insertions(+)
>=20
> diff --git a/docs/unigraf.txt b/docs/unigraf.txt
> new file mode 100644
> index 000000000000..49225a6f4e51
> --- /dev/null
> +++ b/docs/unigraf.txt
> @@ -0,0 +1,81 @@
> +Unigraf Support in IGT
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document provides information, instructions and for Unigraf support=
 in
> IGT. +
> +Introduction
> +------------
> +
> +Unigraf devices are a set of devices that can be used to test all sort of
> graphical +interface and signals. See Unigraf website for more information
> about all the +capabilities of earch devices: https://unigraf.fi
> +
> +Unigraf documentation
> +---------------------
> +
> +All the documentation for libTSI, the library used to communicate with t=
he
> unigraf, +can be found on unigraf website: TODO

TODO need to be done? ;)

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
