Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56159EA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 13:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A1810E127;
	Mon, 23 Feb 2026 13:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P3RXOQYy";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8C910E127
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 13:21:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3B2784E41030;
 Mon, 23 Feb 2026 13:21:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1111E5FD43;
 Mon, 23 Feb 2026 13:21:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB61E10368F7B; Mon, 23 Feb 2026 14:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771852885; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=H6Mp+7oTpZpjOogGD+dsEo0kxu8f74/sqtcyedoSiQg=;
 b=P3RXOQYyuzwOg6rGk5vUSiqeR+FPeqT1t37Iei84BlquKNX+zviUthYL9JwauofZzasAwC
 ZjPKje6/+mhE9wnPVdKC+dVmyP60/z6yNy1ifE6rPDSrfVRv/hxyX0WMQVsiOjOrQayBRo
 ZMk2vKkZqAxXoaF2isyRaTdQWcnZOsoBwfLFWb/ODFuN0iQJMJ3URxKI1Ao8Thmx8mjdVW
 nQ80VbBqttD8qC8v2LemxWrlcAZPDj62IeHz++FIGaZrUzziKP0Lh95T/NMkcXq27YzDXj
 jrfN0Z2Q4qTK28ECJeA1MIEXoV22yHd8MAZvehkQKKSUPZBf/XUzayrBJu9HSw==
Date: Mon, 23 Feb 2026 14:21:22 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 01/48] lib/igt_kms: Add a detect timeout value
Message-ID: <20260223142122.2da1efb0@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-1-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-1-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:08 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Some tests need to wait for a specific connector status. In order to make
> the timeout customisable for each target, add an option in the
> configuration file.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
