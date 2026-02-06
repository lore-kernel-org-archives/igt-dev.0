Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23EBEE20AF
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 15:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6251F10E821;
	Fri,  6 Feb 2026 15:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="II/B/zMF";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ED410E821
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:27:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 957B14E42443;
 Fri,  6 Feb 2026 15:27:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6B8EA60729;
 Fri,  6 Feb 2026 15:27:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CDAA119D201D; Fri,  6 Feb 2026 16:27:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770391649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=h6v6ugN86GV6Y37TwbN0y2ALmmBprLmRa/FYtZD8S7A=;
 b=II/B/zMFiVhS5QTTb0ASMThYvuyZJmIaY7WfhISvv/nFBWxYijV2DnALAoamxIL1wcDsfY
 BZj/MeOSqQQT04H0K3NzjoApnFJiOB5qNmT/123XpnRwwoB7RradhWgx/lLZDL7yQBr6Ql
 WNxxbMJOQgCOrk1ntRaoQ8jq871l1Xof9NSmtOH9ZkxrE/G2iUl8jTn4yMvbrqdVNPIu0z
 iiHdnky7dnmxXeEfpv/zgNhMYzD7FcqVuv7Lch0wZTry7N/1bIp+8JaBVsalD3TsF8+uJr
 QCSH+o5w9PrmdpMlapkSl898jXWgRDzRP0sq21jnXgYxOZACjzvfLKuxeXT4IQ==
Date: Fri, 6 Feb 2026 16:27:26 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 44/48] lib/unigraf: Add lane count configuration
Message-ID: <20260206162726.175a4e01@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-44-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-44-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:23 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As unigraf can emulate 1, 2 or 4 lanes display port connections, add
> helpers to configure the number of lanes.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
