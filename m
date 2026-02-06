Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E3CEE20AA
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 14:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7F410E7EC;
	Fri,  6 Feb 2026 14:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BJs2X2Sx";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2C710E7EC
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 14:26:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D22D8C243B8;
 Fri,  6 Feb 2026 14:26:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3FA7B60729;
 Fri,  6 Feb 2026 14:26:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D4E95119D1ED6; Fri,  6 Feb 2026 15:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770388010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OIcfHb9PO3B7m29tOmp9L/h9IfpMgvFOOYyoClJIoUE=;
 b=BJs2X2SxVH0bwjQ573aYZuAhYYlWVyGqEQVo8uE3bq7Rln7GQYZSsIHP5RRP1iNnf7GiOR
 UOFZ8XkUQiJgoljqER/NXShF8V7TosWWKuHm/TsceGcmsRh0v1cqFsrb2/IjSaPtWBimG4
 MiYYCPoa6nRqXUyoqqffGtpMGrkInoJvQSOR9yPsCCs/9TopHbMmUB5uc+NikGF5elkzjy
 miGHfyDq4/7P7YV3qw42MO1LN/E/R7QbmKpbuq7PWqlZvnIHu1HNSBTzB21xLEAO3+gC98
 feqBbdC3YIFoSVNBtZrM0ydZAPk56dABKX3jQqnaYuG8S30oua/0NahCJf6u6w==
Date: Fri, 6 Feb 2026 15:26:49 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 31/48] lib/unigraf: Add unigraf CRC capture
Message-ID: <20260206152649.43206082@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-31-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-31-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:10 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As unigraf devices are able to grab a CRC for the current video stream,
> add an helper to read the CRC.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
