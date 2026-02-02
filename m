Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF51E83069
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F3210E573;
	Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Wo8j+Tkj";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8099710E2C7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:51:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7179D1A2BF0
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:51:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4967460767;
 Mon,  2 Feb 2026 15:51:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 00A38119A8891; Mon,  2 Feb 2026 16:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770047509; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kcbxPoX7JptkYCViS4CN6kc1hOJaRl5+ljvNf2xRkFs=;
 b=Wo8j+TkjT1LzExHjdc67NVxpextO3nSH0FY6TpGGu6hh4lSt2FI6aux36hVVAfyZ/Dbg1k
 sGYdj9/A6xhdKGJalViExuTyIymP0XCqpa1Yg1T591mZ7XX09XF1pd4rP4PDtPKrr4sk89
 wCi5R3fNJrc8YzAV+QhrjIvi/L7MoS0lcpvk6VCk8rUR+RbaYBdh5B7Wh1aeyddDzvk4/z
 WL0Wvn+rR049oQdyChfJILTuvDquNEY0N66WeyaDJ6Ae6Zoc0w2s0nKvasw4Z4xCA8BJmK
 yx0kw1LxpLxyWQL6/WirJZ+1oYIc+SlWN32Xw4Z0bIh7QUux9uJlguLxVKbuVA==
Date: Mon, 2 Feb 2026 16:51:48 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 12/48] lib/igt_amd: Add const when make sense
Message-ID: <20260202165148.6c48f3b6@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-12-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-12-834af822eee7@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Tue, 03 Feb 2026 08:01:01 +0000
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

On Mon, 02 Feb 2026 15:32:51 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Const qualifier helps to avoid unwanted modification of a pointer.
> To help avoiding those errors, modify the function signature to
> use const.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
