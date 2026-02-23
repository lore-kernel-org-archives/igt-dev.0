Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F2FEA4FCA
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C2C10E48F;
	Mon, 23 Feb 2026 14:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aao/Pe9u";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ADF10E496
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:27:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9678EC143C7
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:27:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 691FC5FD43;
 Mon, 23 Feb 2026 14:27:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C51A510368E1E; Mon, 23 Feb 2026 15:26:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771856819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AKMdEY4npuZQA5zeg/a0ZYgCf3olwQ6gZvcc8ki2uk8=;
 b=aao/Pe9uNd0D202OIb0TAMLnQW3EBFhCrfWTQDVYDYB/Erayct9zuSsVtZDnzVdWPYQnqN
 rSTKx+blwNZtFGf1TlqLqYFm6Kg9PaSgfAtyb8tXe56w+I0CN6TVUTV8qH+AJfoCbFyu/u
 lnLBgZbAhcobzLPx+8hNIMVreQDsdlbKVGtm21r+R5p8K/cigMRJ1vDrgJxVe8klaz10lo
 Yp322C/U6V3uIAPmo+9qEk7NMM7z2SGOH5jlwE94dCmCeTqcq+/qfrXXctTXZIbWF/UKSl
 oUQDli/0dCfMS5UtN79YE7ul7t6pE8lX0lluPBrxoHZ/W/dhxJ6OWuHEDHdJRA==
Date: Mon, 23 Feb 2026 15:26:58 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 24/48] lib/unigraf: Add reset function
Message-ID: <20260223152658.583226d5@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-24-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-24-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:31 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> To have a consistent state at the beginning of tests, add a unigraf_reset
> function that will restore a known state.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
