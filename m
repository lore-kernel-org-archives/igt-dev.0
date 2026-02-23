Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8F6EA4FCF
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 15:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4010E3CC;
	Mon, 23 Feb 2026 15:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iP1eUEyf";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B4210E3C4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:16:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 89EC3C143CC;
 Mon, 23 Feb 2026 15:16:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 607B45FD59;
 Mon, 23 Feb 2026 15:16:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7CBFA10368F9A; Mon, 23 Feb 2026 16:16:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771859773; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+Ib1s1/AExZeb3JLdLyMfe1gr7wqETV11UF7uWeEqjE=;
 b=iP1eUEyfuPlYFgz8tctKA6+/WDHSwWsiWXah+ZE2Q9RBT+6V0YZi3xQDay5AvSOy0uk8Al
 qH+glhylm1Ux2ubHfFHBnPTIl5WB+Wdsa68mljy7b6sKwteGyR4NCsWeZbDkKAP1/2xgwC
 CGwu/SUlDkmwF9F1bNsGnd2e4LOQCuaoUd2slHYcL7+uNDrMvzi/2I2TF154bndOovkPuN
 Fb6gT+H9/LzcPQ9vUkoeR/MpmIJmcNJyhACyMfJswL1HMbP7RUHUKKO2uxPAcCCOFK430V
 HWt/GV9O2tyh72fGv3yeIPfNKQKHhiRdObxJcLKNrQtKRoL6AaUrrw2RPLS8MA==
Date: Mon, 23 Feb 2026 16:16:11 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 35/48] lib/igt_pipe_crc: Add unigraf crc
 calculation
Message-ID: <20260223161611.07456d35@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-35-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-35-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:42 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Unigraf can read crc from the physical output, use this CRC instead of
> internal CRC when configured. This allows to also test the hardware signal
> generation.
>=20
> This small addition allows to use the unigraf device for most of the
> kms_* tests.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
