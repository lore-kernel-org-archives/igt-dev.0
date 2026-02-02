Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB835E83064
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D1810E56D;
	Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PkIsybkY";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E441910E4F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:56:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EB453C237F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:56:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1596D60767;
 Mon,  2 Feb 2026 14:56:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75845119A88F7; Mon,  2 Feb 2026 15:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770044167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AjlUuen3hCiYxE7cu3NT5rL1Wn3j/qI03DQ/XrSY8LU=;
 b=PkIsybkYCqCHYT8txgrKBTf55ES3a/DeYreNG+3/3TSq4FDRDRVJDE5u0QSriSMdcgKVwg
 zCHu7/gmn7zbzCsHdBWA/UrXAVMfeKtd9BoG2rOW9X6GGbdAOywBAeLQvx4+tVzRgr8feD
 uLyXYlvOsJU+qxBV0Q0n4vGCcwJXcQRJZcrK39mnmKcLTRD/PhphEwg0tek7w07UtN1Jzj
 Qm0Ns7Mk0Oi8F4YEirFucYpF1fdh+Ufj+9wAtBBZGhpHCB2dYXcU8XWL6B55N7fNOaWeiD
 uinNVYh17aDVFXTeqGl3+M75MABCAilC7zF7rUoOt2nZRYVDaqK3NGCgbPqWdQ==
Date: Mon, 2 Feb 2026 15:56:05 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 02/48] lib/igt_kms: Add helper to wait for a
 specific status on a connector
Message-ID: <20260202155605.69a35f73@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-2-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-2-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:32:41 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> During testing with chamelium, it is frequent to wait for a specific
> connector status. This new helper is polling the DRM API to wait for this
> status. This allows detecting it without notifier systems which can fail
> if hot plug detection is not working properly on the device under test.

...

> +/**
> + * igt_wait_for_connector_status:
> + * @drm_fd: drm file descriptor
> + * @connector_id: connector to monitor
> + * @timeout: maximum duration to wait, in second. Use -1.0 to set the ti=
meout
> + *           to igt_default_detect_timeout().
> + * @drm_mode: mode to wait for, see enum drmModeConnection
> + *
> + * Wait for at most @timeout that the connector @connector_id  status
> + * become @drm_mode
> + * Returns: true when the status is reached, false if there is a timeout
> + */
> +bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id,
> double timeout,
> +				   int drm_mode)
> +{
> +	drmModeConnector *connector;
> +	struct timespec start, end;
> +
> +	if (timeout =3D=3D -1.0)
> +		timeout =3D igt_default_display_detect_timeout();
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	end =3D start;
> +
> +	while (igt_time_elapsed(&start, &end) <=3D timeout) {
> +		connector =3D drmModeGetConnector(drm_fd, connector_id);
> +		if (connector && connector->connection =3D=3D drm_mode) {
> +			drmModeFreeConnector(connector);
> +			return true;
> +		}
> +		drmModeFreeConnector(connector);
> +		clock_gettime(CLOCK_MONOTONIC, &end);
> +	}

IIUC you are consuming a full CPU as long as you stay in the loop (10s max =
by
default).
You should add a sleep call here to avoid that. usleep(10000) maybe?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
