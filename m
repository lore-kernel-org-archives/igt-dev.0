Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82837D77897
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 17:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DED10EB86;
	Fri, 23 Jan 2026 17:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fRbfOLLL";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118A310EB89
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:39:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EDA724E42225;
 Fri, 23 Jan 2026 17:39:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C46AE6070A;
 Fri, 23 Jan 2026 17:39:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 60FAE119A80FC; Fri, 23 Jan 2026 18:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769189954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MFtA2TT28y2DRguJFaVMtBy9ARYyyQTvcl1WAc3/iMg=;
 b=fRbfOLLLMgVT/thfIZCKUkQ6Hl3NNapiDo4z29y5biGLM28I95Rulmpo8PUiHtsGSJQ+zr
 90iMwo9m50GIxOTginowbfMIyzzRULfs0dX+QV7HwyHq7NnaGLTLZouRqX23gN3u41tDdB
 0lhNTOIkhIFeDgjczlp8q1vsXM/1bYt64npsVRog+KitK+jX+QvwCvINL6jb6HxxVx241r
 ghQ5RWc6f8HIh+KkMuALishfLPZk0FysjEe6KkeFv2Cpjvxkb6DbymEmHNlIq9VonSddHb
 zmBKbfSYtx0JyHL3saeMICj3Vq+lrhGksMwIcqF+Q5obK0HmgY3DY5Y5fq2vBQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:39:12 +0100
Message-Id: <DFW5HW67WXYW.5H7F04N5IRML@bootlin.com>
Subject: Re: [PATCH i-g-t v4 24/46] lib/unigraf: Add reset function
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-24-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-24-0fc7bb1b4101@bootlin.com>
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
> To have a consistent state at the beginning of tests, add a unigraf_reset
> function that will restore a known state.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 5 +++++
>  lib/unigraf/unigraf.h | 9 +++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 59a85e1b84c9..e96c7fc3a91e 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -278,6 +278,8 @@ bool unigraf_open_device(int drm_fd)
>  	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
>  	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
>
> +	unigraf_reset();
> +
>  	return true;
>  }
>
> @@ -285,3 +287,6 @@ void unigraf_require_device(int drm_fd)
>  {
>  	igt_require(unigraf_open_device(drm_fd));
>  }
> +
> +void unigraf_reset(void)
> +{}

Weird implementation :) But OK, code is added in patch 26.

> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
> index a93bd464bac3..76f4f8878c2c 100644
> --- a/lib/unigraf/unigraf.h
> +++ b/lib/unigraf/unigraf.h
> @@ -48,4 +48,13 @@ bool unigraf_open_device(int drm_fd);
>   */
>  void unigraf_require_device(int drm_fd);
>
> +/**
> + * unigraf_reset() - Reset the Unigraf device
> + *
> + * This function performs a hardware reset of the Unigraf device, restor=
ing it to a
> + * default state. This includes resetting all configuration parameters, =
stream settings,
> + * and link parameters to default values.
> + */
> +void unigraf_reset(void);

Why declaring it in a header file when it's implemented and used in the
same .c file? It should rather be static.

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
