Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966BED2629E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E9F10E65B;
	Tue, 20 Jan 2026 21:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="p0/PO/m4";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D252D10E65B;
 Tue, 20 Jan 2026 21:10:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BE3521A2993;
 Tue, 20 Jan 2026 21:10:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8D056606AB;
 Tue, 20 Jan 2026 21:10:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 67D04119B0E2B; Tue, 20 Jan 2026 22:10:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/1iMlY8T+nkTe1n0V68HsbNsL+PUagsr5FC95+LQDL0=;
 b=p0/PO/m4YMMSdy2qq3xppldJxI9xC5z25bVrDL5ROt+QbzYUY/1pEDYgseWkDHklu9SzPk
 uj+f4NRsXuFebwfTbGLEaNo8hAKQ65/ZFFNV+huXqUQNWrBwLVg89bSc1v7bb6Zn6DYMbR
 9s+wp2gJpW1CuvMGuxryyNfndtemvVUB1uOD9sVlptKo/MVJEyfbrBE7HhttUG00w/WFP7
 zDvaLeP1kAJ2wF6QD7uIkL2zDatk7gsSjTzjXwwEXF/ESuPsNFUykbPmoZlN3aQNnMNTvE
 otNBMpsbMRwA4MpV/7e6css8euzRNP78kC+JMVeF+uBAqhkpuPB8NJOhXujkRg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:10:40 +0100
Message-Id: <DFTQ464JAVZI.18EGXLEUDWGLA@bootlin.com>
Subject: Re: [PATCH i-g-t v4 07/46] lib/igt_kms: Expose dump_connector_attrs
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-7-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-7-0fc7bb1b4101@bootlin.com>
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
> dump_connector_attrs is used by i915 DP helpers, so expose it from igt_km=
s
> to be able to reuse them.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 2 +-
>  lib/igt_kms.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f8d4037a68bf..a5b840e5aed3 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1682,7 +1682,7 @@ static bool connector_attr_set_debugfs(int drm_fd,
>  	return true;
>  }
>
> -static void dump_connector_attrs(void)
> +void dump_connector_attrs(void)

As you make this public, adding some docs would be a good idea. Same for
patches 8 and 9.

Otherwise looks good.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
