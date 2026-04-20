Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DCFF588EE
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 16:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED73E10E6DE;
	Mon, 20 Apr 2026 16:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GKqFd95X";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396E110E6DE
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 16:07:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8626E4E429F8;
 Mon, 20 Apr 2026 16:07:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C2A35FFA5;
 Mon, 20 Apr 2026 16:07:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B28A910460A04; 
 Mon, 20 Apr 2026 18:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776701234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Pa7q90H6Tua9Mls9kl/o+FNhkg97b4QbUtuFOhzRVNg=;
 b=GKqFd95XNTfks4EW+Ih3xVRBxQ8ed3pNt+1s39+XIFpbL456MqVdbdI+octTk6wcWlMQeb
 r5c/sXnJ082UNiSJlaOk+F5/NwvffX4/dcCczorJ3eYUJM084zFpnZQVd5HbDy726mV2hp
 nT2/OTDxU1CQNiqHWsNPlFUzbQHbz5mTInJlvZ/gXaLEfBz1mVIMsdCUq1HyoazoVkXBDU
 n1FfyQmKIYhgaT93jnbjfrixxFDACc8Nu5mrO2FQkOdg1Xi3/JujIch6CQ3y2BHcgYaGL4
 FoNSwvzNdJ8en8lNKo4nsjbtlWz2GRNXUR6Bg2ZwY58cn5/rpgAAwMy4zKDHxA==
Date: Mon, 20 Apr 2026 18:07:13 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v10 44/49] lib/igt_kms: Add helper to get a CRTC
 from an output
Message-ID: <20260420180713.591558a6@kmaincent-XPS-13-7390>
In-Reply-To: <20260331-unigraf-integration-v10-44-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
 <20260331-unigraf-integration-v10-44-12266c34cc1d@bootlin.com>
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

On Tue, 31 Mar 2026 19:12:01 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Grabbing a valid CRTC from a specific output is useful when testing
> the output.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
