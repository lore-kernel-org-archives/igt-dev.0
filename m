Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31099EE20A6
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 15:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80FB10E1B8;
	Fri,  6 Feb 2026 15:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="THXPzR8T";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCD310E03C
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:41:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3AD601A2C4D;
 Fri,  6 Feb 2026 15:41:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11AD760729;
 Fri,  6 Feb 2026 15:41:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AC775119D2066; Fri,  6 Feb 2026 16:41:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770392461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=X3iqyoL/2HpFGQ2pVnS1xeuZ6HveckEeQ3gKYlWFV8g=;
 b=THXPzR8TeSh2/kUu+XYmHBx4BhkdMGxGoU45PME0oPHrL8K646WQsUauoHdrROpxiOeemH
 ZF38loZjnr9vW/Eb9TZ8NrlF6vJuBXVTXPa8pQxPyRFSmmLx/5/k5X3lL3tJ3WEaWYrpLY
 NTbtnDW/7T/LzphsuSsYKuhfR3ca2i9u9uCmtzydnPn1vjuTOtR4IjHktIc2YXpTQushez
 VCDmnTfypuTo4lSk+Dus/c4eDy8pbjxGIcs9IaZuVwxcASZ1w8QUXy4lWy+OrjLP4HXsfz
 GDv/tGUCPCSHc+mTLeR7SNnvW1l8PxCe8zQeYH8QOVRArNW5vWtGA+31RtkVPA==
Date: Fri, 6 Feb 2026 16:41:00 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 47/48] lib/unigraf: Add helpers to get the
 current LT status
Message-ID: <20260206164100.1da69d26@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-47-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-47-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:26 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> To ensure that the link training was correct, grab actual link
> training status from unigraf.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
