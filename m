Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341E6EA4FD2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 15:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBF710E2F1;
	Mon, 23 Feb 2026 15:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lwIXXIfp";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE2510E2F1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:14:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 58590C143CC;
 Mon, 23 Feb 2026 15:14:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2C1245FD59;
 Mon, 23 Feb 2026 15:13:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DACA710368FE0; Mon, 23 Feb 2026 16:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771859638; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4uWlOOs4meD+itJ1GgunQL8Va1DSc/RcXUisUN+nm/c=;
 b=lwIXXIfphO/XtcHK5/ybbn7FlPxhiM5ULM3w/dwmuXxZ4rMbOlcZevffU9tbMl4dBBGgWv
 tX3XH9l0P/Zwt9NOfHGHD9qPwEX6eJ2GCPD7bWf7ACH8TMjIWWbGMuto/Bm/aPCgMVMRa8
 73OIsH0V9SWYUNWxSpvLNyx7mQ0Uwlj15uYz39UzpZPhVYfpK/pgY43lua0T3DY8nYfB8s
 T+B5NsnpQVOonnzSYi5ciCn2C3SDP9W2dRqP01ScJCx3KVBOjGMveNx51J3mR4snv9bCET
 b8xdB5r2c3PdR1VrSow8yxNWhxeCiNa/O9wc+6XpPbgzn/iyYCALtK8po30g4w==
Date: Mon, 23 Feb 2026 16:13:57 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 33/48] lib/unigraf: add
 unigraf_get_connector_by_stream
Message-ID: <20260223161357.23701069@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-33-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-33-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:40 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As unigraf can emulate MST, we need a way to grab the corresponding DRM
> connector from the stream id.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
