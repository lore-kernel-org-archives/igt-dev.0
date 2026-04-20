Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFB0F588E3
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 16:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0734910E6DD;
	Mon, 20 Apr 2026 16:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VQqTACRC";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64D910E6DD
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 16:10:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 05073C5C996;
 Mon, 20 Apr 2026 16:10:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0AE9C5FFA5;
 Mon, 20 Apr 2026 16:10:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 61507104609EE; 
 Mon, 20 Apr 2026 18:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776701412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Vk7lD2GW9nwIJJiLgsh317PAmglywDxBATPB/Pzzzsk=;
 b=VQqTACRCldI3TmCJviqZN7tabQxbg0uYwVd+HnhFQuJuWfoGuf6kbaXQrOVIhZmrr+b0wA
 9Ec/DmI+A+Nrldrmcae6kSKdne1lKdsWrcFlohVH+Y9K2XiYsBw2kUHT1d8R94cBj0q2GP
 MqD5s4Of24jEEvu9TdWDINenkf9lybjeTFHwaZB+lhM4l/h/VbukoOpdgP+plJ5ffQ3nvQ
 9EfDF43wRPe6MyvVWMUjmoHxbnuywtF6+c3qAvOabgA8HZ5Xc7XHW9b+D9ZDmJN2+ReQ2h
 y87mWosgv5JumD2RU//YrJXuElKD1jOjTogGFPVWNYW25eS84rrGDWsr8ltz0g==
Date: Mon, 20 Apr 2026 18:10:10 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v10 22/49] lib/unigraf: Introduce device
 configuration
Message-ID: <20260420181010.17eae39e@kmaincent-XPS-13-7390>
In-Reply-To: <20260331-unigraf-integration-v10-22-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
 <20260331-unigraf-integration-v10-22-12266c34cc1d@bootlin.com>
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

On Tue, 31 Mar 2026 19:11:39 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As there could be multiple devices detected by libTSI, add a configuration
> field to ensure that igt will use the proper unigraf device.
>=20
> The unigraf integration will search for a [Unigraf] entry containing a
> Device=3D
>=20
> For example, it can look like:
>=20
> [Unigraf]
> Device=3DUCD-500 [2434C620]

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
