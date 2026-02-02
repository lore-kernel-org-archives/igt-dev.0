Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B125BE83062
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C2E10E57E;
	Tue,  3 Feb 2026 08:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nGLO3OX+";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32D210E503
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:51:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4D706C237F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:51:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7376560767;
 Mon,  2 Feb 2026 15:51:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E6826119A8888; Mon,  2 Feb 2026 16:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770047481; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vagOI134YoSEr8Q1n8ItowQ2B1CSnUg8XG923kLndVA=;
 b=nGLO3OX+ez6fZYzhiSApe0gfLYoiGtC6GY20qO/vpgqiX03EndaPCOp7/iTNjBJ8MHaGYY
 u4cfW5KzjVqQXoq5cflDtFYScOBhRmvWqm8W5fE6urRHUqIlJF/muN7U8sMF4ofXVBoqjq
 0+S98nWsAMIVTMvS/JsV0cTtoV9Xy2Qo8gt/WvX1m1uMnOvKiuZWkjdmdM5GYPGnQfxPKC
 +hFtGg3Q3KDhpn+EW5cymBUJ46+gVbxPu+qvwE2rHpkSznqp93otO4k0UQlw3nrIG/P7V9
 pXMkIProhAhd3Ui2rVhawhuavhFpdy6T2WAOSESSXrrHwYeaUT1zDW8wiiDeKQ==
Date: Mon, 2 Feb 2026 16:51:18 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 11/48] lib/igt_debugfs: Add const when make sense
Message-ID: <20260202165118.6b7bf558@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-11-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-11-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:32:50 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Const qualifier avoid unwanted modifications. Add const at place where
> it make sense.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
