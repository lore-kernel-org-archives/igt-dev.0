Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677C9D77899
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 17:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1893410EB85;
	Fri, 23 Jan 2026 17:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aQxIwYSk";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD1310EB85
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:40:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D60A01A2A3A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:40:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AD1436070A;
 Fri, 23 Jan 2026 17:40:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 280AF119A80FC; Fri, 23 Jan 2026 18:40:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769190006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=n2QxQ/ZVXk5aEBm+86zf4kxjWuTFuYosDYB7wtx+C3Y=;
 b=aQxIwYSkNTYFIWRQq33tt/t23PkcJ5U0At/0OZVlJyvjQClHR+2qSOqtEh+O8GVj5af1og
 KiJXYhEnRBTmCfVoBYiib5zHYn9GIOpcfYIEIbqv+N2vxd7TXKvffNdlNFxpuNAmxcLmRZ
 cWa7vHsSULBLSCtd5Ue4bYRB6IBr4bvYA11lRhh6YTaSC6jGfHH64Y8Rt3ekQHli1Ez/0Y
 aEk3KnZXlHFVAhYEtJSvkLzcS9HziSmEa0BW5xmh1gBkN8GmthbNnA3D/zqbOWf48smKp+
 uMn1r8Waan50nOyt7lLsbbX+H+Ay4Wuphtqf7WK6uGHjiU1RaE7zWwmXI84qrg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:40:04 +0100
Message-Id: <DFW5IJZ9AR2G.25FGG0XOMW9KE@bootlin.com>
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v4 25/46] lib/unigraf: Add unigraf assert and
 deassert helpers
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-25-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-25-0fc7bb1b4101@bootlin.com>
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

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> Unigraf is able to manipulate the HPD line of the connector, add few
> helpers to manipulate them.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

[...]

> @@ -290,3 +310,23 @@ void unigraf_require_device(int drm_fd)
>
>  void unigraf_reset(void)
>  {}
> +
> +void unigraf_hpd_assert(void)
> +{
> +	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 1);
> +}
> +
> +void unigraf_hpd_pulse(int duration)
> +{
> +	// In theory this should work:
> +	// unigraf_write_u32(TSI_DPRX_HPD_PULSE_W, duration);
> +	// But this seems to be broken and this work:
                                                works

> --- a/lib/unigraf/unigraf.h
> +++ b/lib/unigraf/unigraf.h
> @@ -57,4 +57,26 @@ void unigraf_require_device(int drm_fd);
>   */
>  void unigraf_reset(void);
>
> +/**
> + * unigraf_hpd_deassert() - Deassert Hot Plug Detect signal
> + *
> + * This function deasserts the HPD signal, simulating a device disconnec=
tion.
> + */
> +void unigraf_hpd_deassert(void);
> +
> +/**
> + * unigraf_hpd_pulse() - Pulse the Hot Plug Detect signal
> + * @duration: The duration in milliseconds for which the HPD signal shou=
ld be pulsed
> + *
> + * This function pulses the HPD signal for the specified duration.
> + */

Maybe it's obvious to IGT developers, but not to me, whether the pulse is
deassert-wait-assert or assert-wait-deassert.

Also, as for other patches, should the docs be in the .c?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
