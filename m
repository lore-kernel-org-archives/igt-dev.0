Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B41F588EE
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 16:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8233210E6E0;
	Mon, 20 Apr 2026 16:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="yAHTLW28";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDFA10E6DE
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 16:08:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 550441A3371;
 Mon, 20 Apr 2026 16:08:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2C4B55FFA5;
 Mon, 20 Apr 2026 16:08:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6CBAD104609FD; 
 Mon, 20 Apr 2026 18:08:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776701310; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NXL8JqjiZoOZ+NX5eZJtK3Xhs1Qo4d/82FzEgVKnLNU=;
 b=yAHTLW283TE8fmtu2fyBriW9ZVKTUcrcqK61OUl3D/Uzhz84ddZV5j7pMO9B+Tyzfn+/S5
 oFPQIqq+Smk4kLa+kDe7jr+BKorU26o1MoakTwdRiWEDeGpN1/FU2qQroBpkb0jCOIxBpV
 q/F61r0GPBwJy2oCUjNa49DonDMB52owISdMAK43OniU95ZrakYQoAeqqSzyXcd+q+/irB
 /l7/FD0Fh8nJSClGrRJzCTAIqDNrFiGxBLxBrvNAoztXGcYlP1Pckmtv6GY4e6eeuqYxLW
 PzJ/1N60miEy7ac0pygZb59r+xOJk/La5AWXLwf4dczBkx4XajBYDvAZDfWaVA==
Date: Mon, 20 Apr 2026 18:08:28 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v10 06/49] lib/tests: Add tests for array
 manipulations
Message-ID: <20260420180828.3b777965@kmaincent-XPS-13-7390>
In-Reply-To: <20260331-unigraf-integration-v10-6-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
 <20260331-unigraf-integration-v10-6-12266c34cc1d@bootlin.com>
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

On Tue, 31 Mar 2026 19:11:23 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As array manipulation functions are not trivial, add few tests to ensure
> they work properly.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
