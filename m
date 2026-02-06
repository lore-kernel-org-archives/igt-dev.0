Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3B1EE20AF
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 15:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D1F10E0C1;
	Fri,  6 Feb 2026 15:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JR7TAwAP";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401F510E0C1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:13:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E92A74E4243B;
 Fri,  6 Feb 2026 15:13:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B9B7B60729;
 Fri,  6 Feb 2026 15:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 13F2D119D1FD5; Fri,  6 Feb 2026 16:13:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770390816; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QxoFHceX1k30Ois2y2tEF9wCMV4z/rXb9bwN9/viVkU=;
 b=JR7TAwAP1oeLrO5FOd5nLMinImVYpnJHCpoKy5nMSjDTtMSBJ4AOoZ+t1Eq1zJUkyJR5hG
 UqwPP5dgMOubY/S0LAordlvJGib47w60m2sEXo8j4bMc8DRlbwy8Iz5C4bxjwA+MwxGCEt
 bLg+wNIQ4YeTsyP7Bj8J5RBcVV1ZrYXB7QpIHEAF9d7fueJLGRjDd0pQ6opPw1OrXxSt8d
 HapZSRjeJBR2ETll9GDa2XFvITQkwnXgpPL6bAGaMaXGx2wXNRjTxpyEbTGBjFY28BNGwn
 IRVCTn2BjwGyirF4+wh7BIxtrEX1g7twOMH1mQmgwp/AFDSIGKYHqhmW8H7Zag==
Date: Fri, 6 Feb 2026 16:13:34 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 40/48] lib/i915/dp: Use igt_output_name instead
 of private field
Message-ID: <20260206161334.1cf09410@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-40-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-40-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:19 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> output->name is a private field, use the common helper igt_output_name
> instead of the field directly.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
