Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB9FEA4FC3
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FFB10E3EF;
	Mon, 23 Feb 2026 14:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mRcWMVFF";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECCE10E3EF
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:13:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A6FAF4E41032;
 Mon, 23 Feb 2026 14:13:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E2D25FD43;
 Mon, 23 Feb 2026 14:13:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EDDE510368E00; Mon, 23 Feb 2026 15:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771856013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xoHr2SrsvnMslwayBO6kJWEAHXFCAv0PaehgUXVj1BQ=;
 b=mRcWMVFFtVkD0SLV3elnYLpe756CkW/xpZJbdqk7FJRO0bJ3aX8lSxbptF48zJ9v0cs2Ll
 HHCmLFXTn8vWsHjahqLpKH7ASG3f7U2YCYwN3mBg/XBevYhxU+Y7ljVXRRAiUX/Vm46awI
 XWMKfAuZg+MyfHlydrI5YmOtH4ge3Go4zUyBPpKbDNzt/dNMHb/VeHdXiBfUNc2rE93KQO
 AFXyNhdCpOmAelD8j586d3Z0ACVTQYAGJeeP6C3Co3lZvJ5bt6SKaKotB7OvwY55d/e6il
 9dRuv9pV9xbbFrF7tz6mCyvt2oAQiiiUlhm6HS/+JOW1U3FtvGtRincwb22Qxg==
Date: Mon, 23 Feb 2026 15:13:31 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 20/48] lib/igt_kms: Automatically connect
 unigraf on display require
Message-ID: <20260223151331.69ab2289@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-20-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-20-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:27 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As Unigraf can emulate a display, automatically connect it for all
> devices. If a test is already using unigraf, this have no effect.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
