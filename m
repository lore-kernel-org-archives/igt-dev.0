Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3778EE20AA
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 14:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9304D10E7EC;
	Fri,  6 Feb 2026 14:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hCR3xnDd";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6CD10E7EC
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 14:26:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 56E6A4E42443;
 Fri,  6 Feb 2026 14:26:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D62060729;
 Fri,  6 Feb 2026 14:26:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 24896119D1EDD; Fri,  6 Feb 2026 15:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770387973; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9PvVQ3cq5i5qUHsgS9iNGWkt/wF1q9TKy7pQyuKcRgM=;
 b=hCR3xnDdvIEFlZew61H9OA95FZtLXJD/O0aNFLPudC+yYgtqKONbt5fmrr6rVROBYax58D
 tGVFcAVJYI2u6BzG0rTVNgMnyiRY8QquAhGGmeME1kKjdmTOZ4lpewxxqjXBt7swOWK75f
 +aMJ/nSWlizunU7eyIAFQWM/0AtEoHmE3cKyhk1CP8PP7BIOypFdYlpy3F3KL0FG53e2SU
 HdNnh+9nxD73Pv5vPaJ5Jl8JjY+F3Hh1HMuyGKPBCetqRbX0LbDQaxkPJTJrM20F+P24Ac
 b3qLx2TYxi/kKD56XvOcGvp41mxbKSLFhn+xykPMkiEPLTqy6ok8/CHL9IRsSw==
Date: Fri, 6 Feb 2026 15:26:10 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 32/48] lib/unigraf: Add configuration for CRC
 usage
Message-ID: <20260206152610.10f17a82@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-32-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-32-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:11 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As Unigraf devices are able to compute a CRC for the input image, add a
> configuration file option to use them.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
