Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3727BD262A2
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E146F10E64E;
	Tue, 20 Jan 2026 21:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wylz05Ll";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC68510E664;
 Tue, 20 Jan 2026 21:09:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 96B984E421BA;
 Tue, 20 Jan 2026 21:09:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E80E606AB;
 Tue, 20 Jan 2026 21:09:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4766D119B0E2B; Tue, 20 Jan 2026 22:09:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NzcTw4fYTj0qrL2PjCrxfyWRjKsER3+yuG0spj+IjQ0=;
 b=wylz05LlYmcLZ4yAKiXvyLaV2c2M5MQxAc848vFvOQBVCLZTY3kBB1BHmbw+FKC9qBofWR
 ugUD1Um2mmWuapiL1oyG9BLS3ek/DeZDj9/gAS5uUUj3wy/aJO/bbqXEUjvEMSOTtviIkh
 wbVcF7jPvgoFSaP3Ivv90zXB/grXlN8zwSsehNqbwGLJ+LO/kWuU/iqpHOcP8M0UArpCCQ
 ky8mkblGpNoiwsZ7HC53ZXGbXCtXC3vjW7AopKvCyq10NKUfgw7pfpCSo4Jp5vWhrpTkL5
 32abcwN7oCwPFIcrPZaIjrlY7J9p/qzeYenZV58D1EbVC/MiYBfjt5tV6kVUoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:09:52 +0100
Message-Id: <DFTQ3K278OCG.1LV4KYVE9KOZG@bootlin.com>
Subject: Re: [PATCH i-g-t v4 02/46] lib/igt_kms: Add helper to wait for a
 specific status on a connector
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-2-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-2-0fc7bb1b4101@bootlin.com>
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
> During testing with chamelium, it is frequent to wait for a specific
> connector status. This new helper is polling the DRM API to wait for this
> status. This allows detecting it without notifier systems which can fail
> if hot plug detection is not working properly on the device under test.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
