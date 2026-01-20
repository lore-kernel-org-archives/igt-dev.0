Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC959D262A2
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F1D10E66A;
	Tue, 20 Jan 2026 21:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WmAPsGXQ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEBE10E66B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:11:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 82C4F4E420EB
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:11:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 59E8D606AB;
 Tue, 20 Jan 2026 21:11:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B084119B0198; Tue, 20 Jan 2026 22:11:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943471; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QE+6FVGStUoMAJbHSgMKsLFdWB2URAfQxaAIUG526vw=;
 b=WmAPsGXQlPfKGrJo3GrVQDsyBsp42NTYc5G6MnM4I0+hU5MAbsqLXkSD9fETqeZhfAIp9L
 1h7L2TzJNoH8O8M7PoN1qVdBjnQfHzsrdMh/OExNMYb2d935LnE/Wnk+X+kOBEvnJeIiZV
 3lde76RgdnUHJTFJ6k8ZtAzfU/3DVKbTNL/VYz7ZuZYCdtouY3s3AJ8Pn3Zs9Ee8L/B6yO
 bRB/wMw8V6wJHlIXTxQ7s8OPOk0kXtQQwyD3FOhI9QV33IY9E+HN0arKCImMxpRL2uqx3N
 BnieLRuN3CJULPMnggqVO0UEP3Z7x1cXy4tb9zs78fjnwH9s6mO6fT+P1V7Z8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:11:10 +0100
Message-Id: <DFTQ4JSPRGRS.2SJ680ZONPID7@bootlin.com>
Subject: Re: [PATCH i-g-t v4 12/46] lib/igt_amd: Add const when make sense
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-12-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-12-0fc7bb1b4101@bootlin.com>
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
> Const qualifier helps to avoid unwanted modification of a pointer.
> To help avoiding those errors, modify the function signature to
> use const.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
