Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FE8D262A2
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C912F10E664;
	Tue, 20 Jan 2026 21:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aBRQJk8X";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015CD10E66A
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:11:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E5D711A2999;
 Tue, 20 Jan 2026 21:11:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BCB03606AB;
 Tue, 20 Jan 2026 21:11:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1C14119B0198; Tue, 20 Jan 2026 22:11:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QE+6FVGStUoMAJbHSgMKsLFdWB2URAfQxaAIUG526vw=;
 b=aBRQJk8XuXCYXJUZOaE+mTboJ8CTl8xu7ywKDWEvjZjySA6kQ2Nmo03t0SmIbF/XJ30XfM
 2PJweKpE4gsmX9HFW28b+QtH65X/IENst5nM/9MhvQo2ZMfRXC554GNr8iB11Ua/aCIW0H
 utWImtB9QAKuxT0ts11dNslYrk601kupBl/jvHwBy+johyt+hzZjVcitUHsxdrG44PfBXd
 qkgVDRZm+odn1m+me/GH2GbZjPrTQp+RpmgYZdQRQ+fwpgMvP6TeJTHlen+q0HmQr6Ubs2
 5Ltu44J+8nJ28yi/3Oo4PxYi56n1RNZA81hiG87LEC5+6P1NAC38GLFrXSN9Ow==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:11:17 +0100
Message-Id: <DFTQ4MTBK08V.2SXW0QU0C4HQV@bootlin.com>
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v4 13/46] lib/igt_kms: Add const when make sense
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-13-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-13-0fc7bb1b4101@bootlin.com>
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
