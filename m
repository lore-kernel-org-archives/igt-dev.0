Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3D5CF65E1
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 11:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F399010E1B9;
	Mon, 26 Jan 2026 11:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="0lvRAc0t";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C127D10E1CD
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 11:40:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C36EBC225BA;
 Mon, 26 Jan 2026 11:40:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F34B960717;
 Mon, 26 Jan 2026 11:40:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5F3C119A80E2; Mon, 26 Jan 2026 12:40:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769427629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+n3U/37GpFYhjgqMlPat6agjCE+xt2bl5J30pi2xBTc=;
 b=0lvRAc0t5DSPEMyXR+cSDhb5JoXLuFmAnMniPA0ulBwST61VmIgs651pj4fdEMzk4vqt9I
 CsbiJMRWCQd/NkPGY32jxNcmvqRdzn//b/u7TJ4OhDFieytJJ21g0MWNK+AEpMQ/qD5SDv
 MM8n9Bq7Rk7464Ie/zPkz+iaPmNYXZPtaKPpcIaFwHiWvutMQjRd5nxiDCWWhA+v4VKluy
 3pXsaqtlNe9GrqJZ1YuJ4QUkVlSl9Vg0F82AFuAG3NHY5s5eRjqZ5a8V/q6ZNFAGFm5ucp
 /lB8y9VHIW1cQEh65vTnESVS+1XhVkWZO/Dkw6qn0GM3Mz8FYtMS/pidgIyhTw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 12:40:27 +0100
Message-Id: <DFYHQU8C4GSO.226UHLCQNWAQG@bootlin.com>
Subject: Re: [PATCH i-g-t v4 29/46] lib/unigraf: Add connector configuration
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-29-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-29-0fc7bb1b4101@bootlin.com>
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

You are adding a connector config but also an EDID config, so the commit
message should mention both.

So:
-Subject: Add connector configuration
+Subject: Add connector and EDID configuration
?

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> As multiple connectors can be present on the DUT, add a configuration to
> tell which connector is used by the Unigraf.

+ "and which EDID to use." ?

>
> The configuration will look like:
>
> [Unigraf]
> Device=3DUCD-500 [2434C620]
> Role=3DDisplayPort Source and Sink
> Input=3DDP RX
> Connector=3DDP-4

+EDID=3D<some example string that makes sense>?

The code diff looks good.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
