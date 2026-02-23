Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314FBEC1101
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 16:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E2710E167;
	Mon, 23 Feb 2026 16:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MoQ2cmzo";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD56B10E167
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 16:11:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C6D094E40F5F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 16:11:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9DCAA5FD59;
 Mon, 23 Feb 2026 16:11:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A6501036900D; Mon, 23 Feb 2026 17:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771863112; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2/6ac+kqiklkSQmm84e7yucXY5cOW1FZTrSBB8viSUY=;
 b=MoQ2cmzoAPPOvd7iOCj0GtMIFa2TclD/VZDlOjFCnlopcTR7LsbmMcaF9cw3QYuYfVkvkQ
 hXgUdiX1MKduL722acebtj+uOucod+miJyCQJITi6ztIiLdPWokAnn0822PUbMxf/htiOQ
 e+w7lkUkeXANCatqCldJmQ+Y5MSJYO4LlpmtG4oF+WgveetpusgU7WV1Tw9JyeGhMzAWRt
 joIq9BMOJRzXviK0BHw63z6HkXjH4CWsu1QMSl29aQWAxFg/tEnxvBNWvCOdBjAwxgzvh9
 G/e7hDOceMaE5ixXvX9J7Lep5eBLQ7hlkdtRmGMY8UFdgz75au0pTlPPzK1NyA==
Date: Mon, 23 Feb 2026 17:11:50 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 45/48] docs/unigraf: Add unigraf documentation
Message-ID: <20260223171150.643ba7a3@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-45-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-45-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:52 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Add unigraf documentation to explain how to compile and use it with IGT.

Small report from claude AI:
  Multiple typos in docs/unigraf.txt:
  - "earch devices" =E2=86=92 "each device"
  - "firmawre" =E2=86=92 "firmware"
  - "Unfortunatly" =E2=86=92 "Unfortunately"
  - "underlaying" =E2=86=92 "underlying"
  - "information, instructions and for Unigraf support" =E2=86=92 "informat=
ion and
  instructions for Unigraf support"
  - MSTStreams=3D0' has a stray trailing single-quote
  - "(kms_plane, )" has an incomplete list with a dangling comma

With these fixed you can add my R-by.
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
