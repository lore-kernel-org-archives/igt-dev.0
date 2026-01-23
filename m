Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7708CD77897
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 17:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D0610EB89;
	Fri, 23 Jan 2026 17:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="B/y+J7Mt";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4121810EB85
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:40:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 77650C1F1CA
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:40:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 254F26070A;
 Fri, 23 Jan 2026 17:40:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA36E119A818B; Fri, 23 Jan 2026 18:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769190024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9FyT62ER+kLXVDrpW38GPxxmiukj2cM71wxFu8bhX2Y=;
 b=B/y+J7MtYqdiCbB+lFx6sP3nO+VQdowL0Ti0r0ympHGW+e1JAYG0Ra1cCr6cDs9o3BRriR
 QMNKM2nXqVCz7JbUwCEUld/3CxkwQFXaRpH/YdFYF6z2GJn8RqHIaxltqYHFMl9GunG+4p
 XEjYiYVYdZ2QQPHoD14dyczGaMYt+1H10HmxF/6qhhpuo6SYrtxpgnS1Va96AY9Djfwkeu
 aLWQqBe7Ddg/ltzkqUT89P2zGRMRhKJCiQKqtRYuwmHd5RVxzLa7iJWiDF0Yv8UfgIKHLD
 o06gU/IB/02IkeDiGbGbL8v44YoU5HJ6BQSMHF9uG+TD8SUoFxdeMl1CCrLgjQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:40:23 +0100
Message-Id: <DFW5ISL9M9B9.2V3ASCXVZPTNH@bootlin.com>
Subject: Re: [PATCH i-g-t v4 27/46] lib/unigraf: Allows sst/mst configuration
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-27-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-27-0fc7bb1b4101@bootlin.com>
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
> Unigraf devices can emulate both SST and MST display port. In order to
> write tests using both, add fews helper to manipulate them.
>
> The define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT is taken from the
> python SDK, as it was not defined by the C sdk nor documented.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---

[...]

> +bool unigraf_set_mst_stream_count(int count)
> +{
> +	int new_count;
> +
> +	igt_assert_lte(count, unigraf_get_mst_stream_max_count());
> +
> +	unigraf_write_u32(TSI_DPRX_MST_SINK_COUNT, count);
> +	new_count =3D unigraf_get_mst_stream_count();
> +
> +	igt_warn_on_f(count !=3D new_count,
> +		      "IGT:%p: Requested MST stream count (%d) differ from what was ap=
plied by the device (%d)\n",
                                                               differs

> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
> index 14e5fd984159..9fcae674b1d5 100644
> --- a/lib/unigraf/unigraf.h
> +++ b/lib/unigraf/unigraf.h
> @@ -93,4 +93,42 @@ void unigraf_plug(void);
>   */
>  void unigraf_unplug(void);
>
> +/**
> + * unigraf_set_sst() - Configure the device for Single Stream Transport =
mode
> + *
> + * This function sets the device to operate in Single Stream Transport (=
SST) mode.
> + */
> +void unigraf_set_sst(void);
> +
> +/**
> + * unigraf_set_mst() - Configure the device for Multi Stream Transport m=
ode
> + *
> + * This function sets the device to operate in Multi Stream Transport (M=
ST) mode.
> + */
> +void unigraf_set_mst(void);
> +
> +/**
> + * unigraf_get_mst_stream_count() - Get the current number of MST stream=
s
> + *
> + * Returns: The current number of MST streams configured on the device.
> + */
> +int unigraf_get_mst_stream_count(void);
> +
> +/**
> + * unigraf_set_mst_stream_count() - Set the number of accepted stream co=
unt
> + *
> + * Returns true when the stream count was properly applied, false if the=
 final stream count
> + * is not the one requested
> + */
> +bool unigraf_set_mst_stream_count(int count);
> +
> +/**
> + * unigraf_get_mst_stream_max_count() - Get the maximum number of stream=
 count accepted by the
> + * device
> + * Caution: This function can be destructive to some configuration: the =
only way to get the
> + * information is to try and read the new value.
> + */
> +int unigraf_get_mst_stream_max_count(void);
> +void unigraf_select_stream(int stream);

This function is not documented.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
