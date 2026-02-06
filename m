Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FB4EE20AF
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 15:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5698410E7FF;
	Fri,  6 Feb 2026 15:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hQRbzngY";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A134710E815
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:26:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6DB691A2C4B;
 Fri,  6 Feb 2026 15:26:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 43F3A60729;
 Fri,  6 Feb 2026 15:26:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 88465119D1FFC; Fri,  6 Feb 2026 16:26:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770391598; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZPUXNrvaFwSxBBKXpDd6CnHY3hHQ+61Iha4d/2UbaIg=;
 b=hQRbzngYm0VnT6xyR2Yf86kn2SYL3i9P83jinOImSm4AsObbLCrZVARxlRO/ANhvh47OnM
 v4MHvqznKxswqLTHjmGpkZuLApSk0Chv356Esg0ZcLor+0rOYzfM3fvPah/8HEZkzCXVLP
 H8tTmTCcwyhCPHd8LyXEiCpxt2vjcqgpZwhJul/lrpsJyV/O/R5Iau3H3KyCxMIdQLyV6n
 oAtys0lHpEawyovA7n1riYxNSiGqYgoEAJNVeoIu+JYOgUJHq7KB08/3soMO1TA+uTl4l7
 vux6rsJHabzDGd5PvMjNdmQ+2D+2LtouxP+cgbJzX1BA2rTcYPoPRGgUeHJMgg==
Date: Fri, 6 Feb 2026 16:26:36 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 43/48] lib/igt_kms: Add helper to get a pipe
 from an output
Message-ID: <20260206162636.4a6b01fd@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-43-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-43-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:22 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Grabbing a valid pipe from a specific output is useful when testing
> the output.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 22 ++++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 24 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index cab42bd4ceb0..aeb09c9f0abe 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7997,3 +7997,25 @@ int igt_get_crtc_index_from_connector_id(int drm_f=
d,
> int connector_id) }
>  	return 0;
>  }
> +
> +/*
> + * igt_get_pipe_for_output:
> + * @display: display to fetch the pipes
> + * @output: output to use
> + *
> + * Get a valid pipe for a specific output. The return value is the pipe
> first valid pipe for a
> + * specific output.
> + */
> +enum pipe igt_get_pipe_for_output(igt_display_t *display,
> +				  igt_output_t *output)
> +{
> +	enum pipe pipe;
> +
> +	for_each_pipe(display, pipe) {
> +		if (igt_output_is_connected(output) &&
> +		    (output->config.valid_crtc_idx_mask & (1 << (pipe))))
> +			return pipe;
> +	}

You can remove the bracket here.
With this fixed:
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
