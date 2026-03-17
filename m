Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A94FED9E4
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 15:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717E610E5A0;
	Tue, 17 Mar 2026 15:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jIm5Suqr";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C85D10E5A0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:58:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 495A7C5505D;
 Tue, 17 Mar 2026 15:59:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D1C45FC9A;
 Tue, 17 Mar 2026 15:58:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6BDA610450603; Tue, 17 Mar 2026 16:58:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773763133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9005bcSTYs7jWickgsucukFIblWfevucUTUnqBwozS0=;
 b=jIm5SuqrHC3S3J8/R9xjUg+Jwg9kr0XGTE8p174yzQf551/BpyjfUQOhfESVJgcYMnBf3F
 V1MbeW5DlzTbZA6peURgluXA485K6GbMtnm5Z6DImeOmTugfCPTKGxZcLE3Tu1UPB9Juva
 TFzmG3X2EUrXiMEVvnMncJGSoUZi/EjWMQvze9Q4t9DWyzPctZUsLsDZZ3HiB65KteWnW3
 4rzIWGOw61ppw3zO9Zz0mI1FpVufoNOhBOHHE2B8qmBGgEsC/rf3sJpuVYWVuu1ANP67up
 pLVdLqRkv0aV1dNAvC+ySRA8L1h5+33QmcDCUydQZQwwVHPpfnuF6NjEtO4HUQ==
Date: Tue, 17 Mar 2026 16:58:51 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 46/49] docs/unigraf: Add unigraf documentation
Message-ID: <20260317165851.238dc279@kmaincent-XPS-13-7390>
In-Reply-To: <20260316-unigraf-integration-v9-46-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-46-a01dffc3b0cb@bootlin.com>
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

On Mon, 16 Mar 2026 17:18:07 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Add unigraf documentation to explain how to compile and use it with IGT.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
