Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ADACF65E3
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 11:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5267C10E401;
	Mon, 26 Jan 2026 11:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WMzVRge7";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D1410E401;
 Mon, 26 Jan 2026 11:28:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 207194E42298;
 Mon, 26 Jan 2026 11:28:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EC6EC60717;
 Mon, 26 Jan 2026 11:28:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A2B99119A80E2; Mon, 26 Jan 2026 12:28:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769426886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zhthlyYPjfbuUz3jDmURDCGvTdJARyQmNVnqHrRx3NU=;
 b=WMzVRge7clAIxrjLx8buJ4dj5ydx2rd4dvislAwMyNQo0qe/N7FJ3B4yFmC1/tokUE4i2i
 XV1BA/z5mzqPoQpbsRa/NmEveeB/iTkh/aB0cX8BR4k7Q0Uzx8bB72Axt58yA2IMZKU8wt
 rN6ENO58DsIw/kAM2uY9C0drZmUOayRn2ClTDyHfSqOLKZvr17q59SqhYbNJj6LHcrrfsk
 aqisGDeGu7Ay2yc6FCKN9mw8ShJQ2HyeEWMViGPNzF5rrR6zWOKEd9wN8GZ0MCFrK6cjcu
 jItUAm0Lb7fGaqmJl1sUTzFGURmzltWNpIqIyphNVRog80v5utI6+6t9ZLJ1rw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 12:28:05 +0100
Message-Id: <DFYHHDD2LYNJ.2CRLAG63M98Z2@bootlin.com>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v4 22/46] lib/unigraf: Introduce role configuration
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-22-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-22-0fc7bb1b4101@bootlin.com>
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
> Some unigraf devices, like the UCD-500 can have multiple hardware
> configurations: displayport input/output, usbc input/output.
>
> The device configuration can look like:
>
> [Unigraf]
> Device=3DUCD-500 [2434C620]
> Role=3DDisplayPort Source and Sink
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 65 +++++++++++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 62 insertions(+), 3 deletions(-)
>
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 304567467b27..0b8fe11a957b 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -19,18 +19,30 @@ static TSI_HANDLE unigraf_device;
>  static char *unigraf_default_edid;
>  static char *unigraf_connector_name;
>
> +/**
> + * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
> + */
> +#define UNIGRAF_NAME_MAX 1024
> +
>  /**
>   * UNIGRAF_CONFIG_GROUP - Name of the unigraf group in the configuration=
 file
>   */
>  #define UNIGRAF_CONFIG_GROUP "Unigraf"
> +
>  /**
>   * UNIGRAF_CONFIG_DEVICE_NAME - Key of the device name in the configurat=
ion file
>   */
>  #define UNIGRAF_CONFIG_DEVICE_NAME "Device"
> +
>  /**
> - * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
> + * UNIGRAF_CONFIG_DEVICE_ROLE - Key of the device role in the configurat=
ion file
>   */
> -#define UNIGRAF_NAME_MAX 1024
> +#define UNIGRAF_CONFIG_DEVICE_ROLE "Role"

Based on my comment to patch 21 you won't need to move or touch
UNIGRAF_NAME_MAX at all in this patch. The diff about
UNIGRAF_CONFIG_DEVICE_ROLE will also become clean after that.

With that done you can add:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
