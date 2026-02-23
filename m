Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53711EA4FD8
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 15:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A6A10E2F4;
	Mon, 23 Feb 2026 15:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Tt2Cl/iF";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBA010E2F4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:45:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 127234E40F59;
 Mon, 23 Feb 2026 15:45:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DDC1A5FD59;
 Mon, 23 Feb 2026 15:45:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3156E10368FE8; Mon, 23 Feb 2026 16:45:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771861530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UfQxZIv5NqR4yrKeOM0EmZXXlYYzp02j6v4TIAGMat8=;
 b=Tt2Cl/iFn4sHKFzbHkooypIbJzm56RKumzFMn1uVdIX/UxWU9ymrLGULL8d76DADBhULWE
 AhUbbFNXhJe6q3i0vJPw/B50r9gSPzzsNxG4QFc2ur3czZii5id3q+nVvDjIdKmr1OQvza
 P0wEaZcANdCYMS5ZStjYBXesWuLaEJEHtfkGkG/eHD7VKUvt+NeyFssxyLkmJsNYVi0h5t
 CDWBYQYItOy/qudrIl71NrvBy6+17AeuxVYipjdPlTaN9Leqy6AT1JROvoZ7AWxeGksfZ6
 Rd0M1JKkzt15MMMDLdMVo92QxtRaXRpcQ/5ceVJIdCkT2xE32fcSNCYNOCqQdA==
Date: Mon, 23 Feb 2026 16:45:28 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 38/48] lib/i915/dp: Add helper to get maximum
 supported rate
Message-ID: <20260223164528.4ab457c7@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-38-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-38-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:45 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Some GPU can't reach all the DP rates. To avoid false positive during
> testing with unigraf, add an helper to filter tests based on the maximum
> supported rate of the current GPU.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
