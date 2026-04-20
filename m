Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4185F588EE
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 16:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5369010E6E0;
	Mon, 20 Apr 2026 16:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YvkaXpzl";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB7410E6D9
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 16:06:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0865AC5C996;
 Mon, 20 Apr 2026 16:07:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 163135FFA5;
 Mon, 20 Apr 2026 16:06:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4AAFE104609EE; 
 Mon, 20 Apr 2026 18:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776701188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OHbbiJGa0d2C5VhjsymM+JQXd+F17Fh+ZQfrLDE3i2o=;
 b=YvkaXpzl11rN+hVG/2zkwbHv86ECVVoVzB886lByaep1M2j9UIV0oxezqqT/QmZUGoYTLE
 Dj1dHrUiO9flyVhQKlpkSHoKpRFKPpTtyHIJRn16OeM2gCD/Kt4TWq/wZ9FLKZZGcIFG8e
 EGk8P8D6QRTqgRA21urI/OsZendvUxooqovlPWfrbHRPSM5lKbTm55dNDfXNt3ZbvdaNYy
 xmqRCckUX/g0uUnjdN4cYttVZIuQe9R4Du1Tk/nyTjxl+v7LARisal0Wfiw4QwRk+NTWl6
 5kYpA0tP06cgy6v4O6GxgKEGps2p9nD1kEb19icaGbI5r/mV2S6F85FCcLa0Kw==
Date: Mon, 20 Apr 2026 18:06:26 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v10 46/49] docs/unigraf: Add unigraf documentation
Message-ID: <20260420180626.292467b1@kmaincent-XPS-13-7390>
In-Reply-To: <20260331-unigraf-integration-v10-46-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
 <20260331-unigraf-integration-v10-46-12266c34cc1d@bootlin.com>
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

On Tue, 31 Mar 2026 19:12:03 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Add unigraf documentation to explain how to compile and use it with IGT.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
