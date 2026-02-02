Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B26CE8305D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A33510E57D;
	Tue,  3 Feb 2026 08:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NFcoj9s7";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1C710E2C0
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:41:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 25182C237F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:41:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E68960767;
 Mon,  2 Feb 2026 15:41:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10CBB119A8888; Mon,  2 Feb 2026 16:41:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770046881; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uE13h60Br2BtIumr58g35bNRT252M7IfbsUJxWbjk2o=;
 b=NFcoj9s71CZeKYb54SXO3wG9g6Z6uT7oFtqiUFYO8qwKGYE8hZbb03/iNId3Awu1CBH9g2
 +/D4PyrfUSlmFVNzJib22GchAhUr6gryAMgabAZ0sLMSW0q7KwuWHv6U+wfSSk+QWrV/vU
 pz2YDyM3FTUr1bITWQ+jULTLeVdpLUz3EG0pLYn4L26EY9l8tuGR4l7el8rCXr7z++fa0B
 bZKGHxMes8uX6Uj7CJz1LaW2DEsKHaerTFk1Qmzs2KJPy0OxDPwLcXZ61aw9bI3q5KUZT7
 SxIRsSxEsFMsfWbSrmRH6RgKEAu860OBCXT6wBehI3m2mWiRNS8myzSmU7kCQA==
Date: Mon, 2 Feb 2026 16:41:20 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 08/48] lib/igt_kms: Expose
 reset_connectors_at_exit
Message-ID: <20260202164120.279c61d3@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-8-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-8-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:32:47 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> reset_connectors_at_exit is used by i915 DP helpers, expose it so it can
> be reused in a different file.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
