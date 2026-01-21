Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69678C44506
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 18:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D6510E247;
	Wed, 21 Jan 2026 18:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1f+XgQsX";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7080610E853
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 18:23:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A302BC21A8F;
 Wed, 21 Jan 2026 18:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D15426070A;
 Wed, 21 Jan 2026 18:23:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D9E57119B1BA9; Wed, 21 Jan 2026 19:23:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769019828; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=776mO7vaQLKtphopbMP9+U0RfT/bEQqqZWs6fcvppdE=;
 b=1f+XgQsX39LUApjuM2ZlgMw8iLmWwDhB40TeTxidJeNQFK4Ql0/2dllv8UKkg1vGP3gwHJ
 V7ZbQ0khI8ta5bW/jW1AmIQ+CPTWYpCK2SHhZHDLH9OU+kwtCrHVGkWYY4LYKXzirUhOoT
 ZaZnScOHNrPI02Guy05y/xM/SkKeakQk5eN5IuKuNHWaKLi5eRYoeztspz3ecMB+/GcBqF
 fRuUpHQrAIQqLTZ+yli1tz1ksE9Z5XVCVmbgYlbwwKDg1I1G2wzHutCkrJz90VM0Y7xOy3
 TepTALzvDGaPam6hjox1xG2crEAOMBu1xt7euZB/uo7PsoIAGwmi7mQ1YkCciA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 19:23:46 +0100
Message-Id: <DFUH6WZBTXNA.3IEC9MAWF8Z9U@bootlin.com>
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
> --- a/lib/unigraf/TSI.h
> +++ b/lib/unigraf/TSI.h
> @@ -210,14 +210,6 @@ TSI_RESULT TSIX_DEV_GetDeviceRoleCount(TSI_HANDLE De=
vice);
>  TSI_RESULT TSIX_DEV_GetDeviceRoleName(TSI_HANDLE Device, int RoleIndex,
>  				      char *RoleNameString, unsigned int RoleStringMaxLength);
>
> -/**
> - * TSIX_VIN_GetInputCount() - Get the number of video inputs available o=
n a device
> - * @Device: Device handle to query
> - *
> - * Returns: >=3D0 in case of success, the number of video inputs availab=
le on the device
> - */
> -TSI_RESULT TSIX_VIN_GetInputCount(TSI_HANDLE Device);

Why?

Otherwise LGTM.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
