Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9606EA4FC9
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C59E10E4A3;
	Mon, 23 Feb 2026 14:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HvHGng0m";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D1610E4A5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:34:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D7BF74E41030
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:34:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A84375FD43;
 Mon, 23 Feb 2026 14:34:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E915410368E1E; Mon, 23 Feb 2026 15:34:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771857268; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JOH8jhwK1Sky+r0QXU0tnyJGHmskdlJaWEHdOwkWORE=;
 b=HvHGng0mq97EvTft4j9y/QJ5LnHEtXZkFq7AgONLXZ0FBBibK96K4naujEAWDi3Qb6A1RC
 jr97+k63jKkroa4YQptRmnKG4EsdB6pPxVLOn8ckdv17tt6qnSpBw2aO26BcrkGs6L6Ml+
 uBWIcwoOU+dYapIPpDKfOGd54kKXptQMum6cM6rzNI0QaXqI1RgxAlzzTwRB4w1jWNTLm7
 mEG9R0l1RI4F3K8Pp5zjQ72FhactyzvvSp4T7WXyOBKDMyG+LH35Y3SuEHJRiBdreJqiIk
 gatOSqpdVgNxpyX+ahpUAOJSgGIDQhdoK1jhvTlD2jnhwopILfOIHrRcQmqjLA==
Date: Mon, 23 Feb 2026 15:34:25 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 27/48] lib/unigraf: Allows sst/mst configuration
Message-ID: <20260223153425.5f143597@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-27-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-27-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:34 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Unigraf devices can emulate both SST and MST display port. In order to
> write tests using both, add fews helper to manipulate them.
>=20
> The define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT is taken from the
> python SDK, as it was not defined by the C sdk nor documented.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
