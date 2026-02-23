Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F94FEC1102
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 16:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF7910E167;
	Mon, 23 Feb 2026 16:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FvNYXjrI";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF5810E167
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 16:09:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C147D4E4102D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 16:09:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 987A85FD59;
 Mon, 23 Feb 2026 16:09:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2CA501036900D; Mon, 23 Feb 2026 17:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771862984; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=eTMbNK40vfSxJzHg6PJSACmtCWOJJvDUiDh5V4iV/tg=;
 b=FvNYXjrIuRulZ8DPgK7zd+2IcTqAL+4RvhPxVKTZl+uF+YprROdRgl79cMwCQ+4KKQ8pgl
 hPs5G7ApiFF5ZruR0LE9Tyj1nrd9IlWA0KZom1X/T1oniQzdpJ/WlL1KKA1xCr3sAblWlF
 Uwkysl3VRF8KTOhn4r8HSd0CSuE5E1a59Yw7PpNdP4l2z+t/6R6SKl8jhoc2u10U1HetMv
 JXhhNQ/MHXnCJXpFtiyTb0E3iGVAfRDpzQwfkcSU0+zOK7rp8PJ8DsayAUBAstxXBk0WfT
 IS8NjW/JyEVp3fjGDV3TpWtPVrbF+ZOFUHTNxUnFPARuIiXfgwFUHMmJm91khw==
Date: Mon, 23 Feb 2026 17:09:41 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 43/48] lib/igt_kms: Add helper to get a CRTC
 from an output
Message-ID: <20260223170941.41e23746@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-43-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-43-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:50 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Grabbing a valid CRTC from a specific output is useful when testing
> the output.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 20 ++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 22 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0c61ac6e2788..9f8e09008e19 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7937,3 +7937,23 @@ int igt_get_crtc_index_from_connector_id(int drm_f=
d,
> int connector_id) }
>  	return 0;
>  }
> +
> +/*

Use /** for function doc.
With this fixed you can add my R-by.

> + * igt_get_crtc_for_output:
> + * @display: display to fetch the CRTC
> + * @output: output to use
> + *
> + * Get a valid CRTC for a specific output. The return value is the first
> valid CRTC for a
> + * specific output.
> + */
> +igt_crtc_t *igt_get_crtc_for_output(igt_display_t *display,
> +				    igt_output_t *output)
> +{
> +	igt_crtc_t *crtc;
> +
> +	for_each_crtc(display, crtc)
> +		if (igt_crtc_connector_valid(crtc, output))
> +			return crtc;
> +
> +	return NULL;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 4b5f6fcc929b..716d203a7c2e 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1329,5 +1329,7 @@ get_list_diff(const uint32_t *list_a, int list_a_le=
n,
> const uint32_t *list_b, in uint32_t **diff);
> =20
>  int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
> +igt_crtc_t *igt_get_crtc_for_output(igt_display_t *display,
> +				    igt_output_t *output);
> =20
>  #endif /* __IGT_KMS_H__ */
>=20



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
