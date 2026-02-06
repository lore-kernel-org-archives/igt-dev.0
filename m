Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC45EE20AC
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 15:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8913110E802;
	Fri,  6 Feb 2026 15:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GsznQBP/";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A93610E831
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:01:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 33395C250C5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:01:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9E85360729;
 Fri,  6 Feb 2026 15:01:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1E06119D1F83; Fri,  6 Feb 2026 16:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770390104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=E+7j3BV7ggXka4PkndhKE6PP8eQ1QICYRlfBLEPLn+c=;
 b=GsznQBP/eX/Yt/EV9PSalLawT9MgA6bJgPfb9CBu6ovcYStqZEr9emeLdCcj5arPwaaeIl
 wj08Mkp+9vCVhxtkWeuFQtR7W3fe3SxFFs3eaLsTbZJ8wqah1paBAMfPxWEOOEfRe9Ibsw
 hfgpVUl+Tsi//5Xl2Vi9IWCL7OHDA/MDyyTAxpHRRX12qUo5EXsl1giQBlHgSsb+2H2SnR
 s9auffhYgLsLNR9FeBV0xb81BLedmKc/YvbQjjn/cjGFooW4YWvz9QdvzTUosysoSY+jr/
 u5/nmWF9NJJJNwSIxnevg4qBKw5oDjutcB11VUL+0IwlcnWwyHMLq5wLj7fXUA==
Date: Fri, 6 Feb 2026 16:01:42 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 37/48] lib/i915/dp: Rename functions to avoid
 confusion
Message-ID: <20260206160142.25b0ad70@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-37-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-37-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:16 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Add the proper prefix for i915 dp-related functions.
> This will avoid confusion when using them.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
