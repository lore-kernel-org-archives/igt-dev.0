Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3E6C44506
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 18:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D1F10E85E;
	Wed, 21 Jan 2026 18:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ar7zCArV";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C36310E85E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 18:30:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CCCCBC21A8F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 18:30:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E02956070A;
 Wed, 21 Jan 2026 18:30:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D21A119B1BB7; Wed, 21 Jan 2026 19:30:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769020240; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fSd6ZOWalpYif0UGkgDDoFUWMXIBbOUjHvUz4stkBBc=;
 b=ar7zCArVHnj4bG9Z19r+kqGfRaJyw8lVtmNBd6kX9oQGOjiMMUf72s4WT232rgjcBql8LM
 qly2d8pS09LReHWTX07d7XnTfifhNvHH5eqptEA60IfYinYE06AJN7XBRo0+CqIA3WtOtG
 0qOm7w7onLj64v1Xm7RnZurHSF8aKR8a2gt7eerDyvZLaPI4/R/9CTBDeEkapukdmL4ABo
 X4l3XPUdMBem9tC/TYtr5dysowAscfb5OpyI0VIGLfpN0Hk4OnoOA+aPH/WWCwrl7KyYfJ
 dbpfJknmmBaQbxNfcffe1HlwZcjj0ULVWhhIwzi7w4Q4HhrqG3+Y+L0S4152lw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 19:30:38 +0100
Message-Id: <DFUHC6BXY5DQ.2S9P5CGCD7094@bootlin.com>
Subject: Re: [PATCH i-g-t v4 19/46] lib/unigraf: Initial Unigraf support
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-19-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-19-0fc7bb1b4101@bootlin.com>
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

Hi Louis,

I had replied LGTM but now noticed an issue, see below.

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> This introduce the basic boilerplate to connect to a unigraf device.
>
> This integration currently only supports one device openned to simplify
> its usage and cleanup.
>
> The functions unigraf_open_device and unigraf_require_device will registe=
r
> a handler to do proper cleanup on IGT exit.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

[...]

> +static int unigraf_open_count;

[...]

> +static void unigraf_exit_handler(int sig)
> +{
> +	if (unigraf_open_count)

This file-scope variable is never set.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
