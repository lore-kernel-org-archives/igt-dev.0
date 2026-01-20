Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ECED2629E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94CD10E664;
	Tue, 20 Jan 2026 21:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="u3OSJVvI";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A94210E66A
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:11:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6F2D51A2995;
 Tue, 20 Jan 2026 21:11:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3FCEF606AB;
 Tue, 20 Jan 2026 21:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9B7F119B0E2B; Tue, 20 Jan 2026 22:11:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PZzyukyrTSq8pESA2Q7Y7jFC6IgziAyIe+QtUKqiPNI=;
 b=u3OSJVvIXffLa7tAvnf+C+soRoT5MkaUfMAdl/1iUqg+++v0tBW/8mEIn2qWjUvTXUAzOB
 5sT4Q5V2Fr4BNScQVnNar3CS4GGE+HRVVXAuE4YcfcbGPZjxpu7ePfFSw81TkLuzQtaeWk
 TSpyrihJog+e6EoVA6vUugmVruo7FqkmkB/BG+f9AoEO7tGi7Xq8Cp/EWHTEBbk2KTp8Tj
 pFOF400FY9BCMYf5pQuvkkjusek3/qVUyeRyY6cpvA/cL7MnDRmZ2aHZsLApcFt2J5LzH7
 yhW4XZ3Va1SQIACIxaEcz22nfkRXrMVG4DrUgwr/03H13KBaJFFCK5WU6KxJEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:11:02 +0100
Message-Id: <DFTQ4G25RWCL.1WD44MRU64ICU@bootlin.com>
Subject: Re: [PATCH i-g-t v4 11/46] lib/igt_debugfs: Add const when make sense
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-11-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-11-0fc7bb1b4101@bootlin.com>
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
> Const qualifier avoid unwanted modifications. Add const at place where
> it make sense.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
