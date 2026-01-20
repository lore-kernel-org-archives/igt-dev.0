Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA03D2629E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26A810E077;
	Tue, 20 Jan 2026 21:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ouMwi5gd";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBCF10E64E
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:09:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8EB411A2993;
 Tue, 20 Jan 2026 21:09:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 63C09606AB;
 Tue, 20 Jan 2026 21:09:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4980C119B0198; Tue, 20 Jan 2026 22:09:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Lp+Ua/wXf5RbMt0IqtRDbpSS5hBEIG4AsffY+WOXklk=;
 b=ouMwi5gdAPaS8XlOTC+XaqnN1GpD0L75UBtg+K+dBUphlKBb6EhTtTO+awvihAeQIH8aXt
 NWmid9yhoqpeFTSSM5K2Gy6HOQL+eAqKfHQLpzrrn6y97ug2vTVWNKr6UY45Tpenr5phRM
 QDf9ZIAd1JSZJXz+gMe33y2TLB4M52PXql86gsCCrXbH9Kp949hBwwC3tQ1oshQmc6TLnE
 58uhF1MOvrXnU7KRQfEKf4ahq4OzW0gr9Ib34tgA42bPXdokPmMiO9Q6MYB7kxsoKpy/3j
 WdmSNFJ9RJ9e3ZFIQrdOjXEMdsnzRrolyVPhH6vrVLKd+A1ywkTmDkYgxUEojw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:09:46 +0100
Message-Id: <DFTQ3HB3DLK6.2566BM8T49E4E@bootlin.com>
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v4 01/46] lib/igt_kms: Add a detect timeout value
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-1-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-1-0fc7bb1b4101@bootlin.com>
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
> Some tests need to wait for a specific connector status. In order to make
> the timeout customisable for each target, add an option in the
> configuration file.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
