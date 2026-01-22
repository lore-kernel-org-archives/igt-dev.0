Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7363DD6CFA4
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 20:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B65789109;
	Thu, 22 Jan 2026 20:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2DGGLRBc";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556F410E0F3
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 20:27:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E9D6D4E421FC
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 20:26:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A60F360711;
 Thu, 22 Jan 2026 20:26:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3BEAF119A8134; Thu, 22 Jan 2026 21:26:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769113618; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=h2nPGeNKgxeFgq8stQdw4cUdThfsiDJmA3BdK8uGlOw=;
 b=2DGGLRBcp8HhPCyPiFT+2IqEZ4jv6TlUBn00lH5reFghmE0d3Ql5YqnNnykQ7Wm0nhNQOi
 3IBLO2EdRnoF5iE+MDN8uKKInsc64JsesghKKHeli/Kva3PZTWQsJuRB/2AE6HGYRsWXSr
 f8NaYww46EUB4S/rnNFUkHbRAa8nlmY7I4oKTms0Too+gjW/+YkuJ2nUXMIashRfRFXkuO
 u1rwXApLtr0b24BJa3A7Nb779ot4qzq4H48syrfCcd2Y/+uFQwtqF93u5fIjdKW8uoAV6n
 o4MF0J4fU9mM6O/S6rNAzpdCK2bI3FVp/VL1FwtX2ICTd0tc8zjzLLPx30PdFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 21:26:55 +0100
Message-Id: <DFVEFRAUC2T7.D9GW26YNT9S5@bootlin.com>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v4 20/46] lib/igt_kms: Automatically connect
 unigraf on display require
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-20-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-20-0fc7bb1b4101@bootlin.com>
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

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> As Unigraf can emualte a display, automatically connect it for all
> devices. If a test is already using unigraf, this have no effect.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
