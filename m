Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A592BD262A2
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A85F10E648;
	Tue, 20 Jan 2026 21:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Nm/wU4X3";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769DC10E648
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:10:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 33C81C214DF;
 Tue, 20 Jan 2026 21:09:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 59EFC606AB;
 Tue, 20 Jan 2026 21:10:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0324A119B0E3A; Tue, 20 Jan 2026 22:10:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QEXz8F/z/jPbyrfDTlSf4dKTlNlt2A4JuDtNpwj4xEU=;
 b=Nm/wU4X3KfRoX61n+gm8pkc2lOH6Yv3Mazz36AvC8E5SXaGmJTYIuE02CQW1fx0qKM+JRq
 DNiDxxpeBU3wyUtrSmR6zPaz/UCuv/gtx64ww4XdhBtE+EVb8ouq/aAnyhyvMqI7MQqesr
 X2SodQuKpGOkaJHkDBl0NE6zWp4SiRnGVZfdJfvFK1s8vdBocshsa3o3QuukW1ZJT6tJO4
 u6fI0bj7jfweDM+QF6bR0nE0aHAwR9ClFDLMM/gLsuHjQxJRfxdzZU6uZKo5zNxHmy3TzE
 haoMW6CKxjiULf367WVB133fTmzfQMfcpPspom89IFLkYPNyuWUSpqeYPlhATA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:10:24 +0100
Message-Id: <DFTQ3YL1UQEA.2HG6VKSKU01Q9@bootlin.com>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v4 03/46] lib/igt_kms: Add function to list
 connected connectors
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-3-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-3-0fc7bb1b4101@bootlin.com>
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
> Introduce the igt_get_connected_connectors() function, which returns a
> list of connector IDs that are currently connected according to DRM.
>
> This function includes a timeout mechanism because connectors can be
> unplugged at any time. Also, especially with MST, the connector can be
> listed by drmModeGetResources() but not yet accessible with
> drmModeGetConnector().
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 68 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f5bcd6d6b573..6392999bb341 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7621,6 +7621,29 @@ double igt_default_display_detect_timeout(void)
>  	return timeout;
>  }
>
> +static drmModeConnectorPtr igt_wait_for_connector(int drm_fd, unsigned i=
nt connector_id,
> +						  double timeout)
> +{
> +	drmModeConnectorPtr connector =3D NULL;
> +	struct timespec start, end;
> +
> +	connector =3D drmModeGetConnector(drm_fd, connector_id);
> +	/*
> +	 * This time is required as sometimes some id in the connector list are=
 not totally
> +	 * ready or can disappear
> +	 */
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	end =3D start;
> +
> +	while (!connector &&
> +	       igt_time_elapsed(&start, &end) <=3D timeout) {
> +		connector =3D drmModeGetConnector(drm_fd, connector_id);
> +		clock_gettime(CLOCK_MONOTONIC, &end);
> +	}
> +
> +	return connector;
> +}
> +
>  /**
>   * igt_wait_for_connector_status:
>   * @drm_fd: drm file descriptor
> @@ -7659,3 +7682,47 @@ bool igt_wait_for_connector_status(int drm_fd, uns=
igned int connector_id, double
>  		  connector_id);
>  	return false;
>  }
> +
> +/**
> + * igt_get_connected_connectors:
> + *
> + * @drm_fd: DRM file description
                        descriptor

With that fixed:
 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
