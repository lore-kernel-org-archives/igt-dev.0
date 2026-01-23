Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A517FD77897
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 17:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5926D10EB86;
	Fri, 23 Jan 2026 17:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="uCS/gCmD";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF3210EB86
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:38:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0185A1A2A3A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:38:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC8246070A;
 Fri, 23 Jan 2026 17:38:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B4C10119A818B; Fri, 23 Jan 2026 18:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769189927; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pydDHe8f1/U/Z5UdwJwH+efZadza/zO2IqnB1H0RKIY=;
 b=uCS/gCmDHLRJ5plUxrut0isL+DU8zbWqh2vb4kTWWze5hnssJJ1+FdlMxHLK81ZQt7sm8j
 i9idxp9j4rHWFG/lcL75FQ1S72qbYVTwkTSG7voddRJV2BplSlDJbxGepRLOjzez6siAhR
 z5XBhl6ygpW0zISFqsw07lyvztnXsikX/R2xfkfzcnFNrUrwYWcNp7UkjB4bxIwk9NxZk+
 ErgbNhXsEWwIZqWccRK/zh88bImHfX1ilD8+5OXHnhYLqYB5VMslRdbM9E5c2icnCJctJu
 Tv17prS7WFQOhaZcu7EnMXzHNOKmMcWize97/hMtTVfO0CiGhGEF5lQsKZb7Pw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:38:46 +0100
Message-Id: <DFW5HJYP2S7N.EYCWSASRS4T0@bootlin.com>
Subject: Re: [PATCH i-g-t v4 23/46] lib/unigraf: Introduce input configuration
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-23-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-23-0fc7bb1b4101@bootlin.com>
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
> As multiple input can be present on unigraf devices, add a configuration
> field to select the proper input. By default it will take the first
> available.
>
> The configuration can look like:
>
> [Unigraf]
> Device=3DUCD-500 [2434C620]
> Role=3DDisplayPort Source and Sink
> Input=3DDP RX
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
