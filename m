Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BEDECD985
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 16:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B092310E226;
	Thu,  5 Feb 2026 16:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fcFNbDXu";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A077710E226
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 16:36:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8E5EC1A2C2D;
 Thu,  5 Feb 2026 16:36:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5F0186074D;
 Thu,  5 Feb 2026 16:36:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8EAF4119A865B; Thu,  5 Feb 2026 17:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770309364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9lARbyQkIelyFluXyaQtFA6MwuNBkkUDydIfnHxZam4=;
 b=fcFNbDXu0HbSQEzCG9MJ+mkLHWP+BzAxtoBI3ZyLAiO2wtoiPB29eNXQxztL1uvz0KMrHO
 XzxdillsAbyGIUnJ/m6gxEIY4YFI3mVNCVDqUWshXn0dZ3uG08S6ebyQ+MOBUq99Cs2IuR
 24K0jlMn92hpDLMW6G1RMvglUfw8y/xVPlPn4JZ4V44xK7jDSD1f+3Rg55+lXLiDEqFjLx
 F+y1NUAkXioWLPetmMdWHpDs9mE/MgPgnKCMmTs/T1CBh5fbuPrLcaY3h0uLil7D0tsMgv
 Y1sj1FujFzlCiClE5BuBci6arTdZPa4tuXIuN4utwBs9Kpg+O8Xgbkz6CZdbdg==
Date: Thu, 5 Feb 2026 17:36:02 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 26/48] lib/unigraf: Add plug/unplug helpers
Message-ID: <20260205173602.5bfb21c8@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-26-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-26-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:05 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> The unigraf can emulate a full cable plug/unplug, so add helper to emulate
> this.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
