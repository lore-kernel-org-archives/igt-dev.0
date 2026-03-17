Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5A7FED9E0
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 14:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A0810E4AA;
	Tue, 17 Mar 2026 14:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PqeBSJGH";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA84510E3FC
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 14:56:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AB7E24E42656
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 14:56:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8386B5FC9A;
 Tue, 17 Mar 2026 14:56:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10E1610450604; Tue, 17 Mar 2026 15:56:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773759407; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pdbG/1rNuMS6ikdkvAi5yBDNowCGO9QFlr4rmflhuuU=;
 b=PqeBSJGHjgSnYlMmp07ifHvpBPm6fsZXNAJFMPmuREBWq/Fr9i3sRFu3hmx+N1l/Z7iYS9
 1EsJI/PTI5LPiVX2uZpfdsYD48FT+OzRmQSJJsMFeOZQRrwMJWiMMM2EIAAJGm8Wrxc67A
 4k5YYVI8KuR60xwTfkSsj/aqbOZ5IKfMJ1T2KPBicQYt233oRI4okHrla3ifDjHSiYV9MT
 Rh0y0jHMBa47GYVQIE4R1Tuy3vMK9PyUXUlVafGSQbcZxSqdGf+5v1+d9+pxvC3ZEHOtA7
 Ea190SSB0cG0YCYdZ6CmUEB45Ef+U8Pnmjtb+yEk/rnz6Oh3Sl5V4kRYoNh6Cw==
Date: Tue, 17 Mar 2026 15:56:44 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 05/49] lib/igt_kms: Add helper to wait for new
 connectors
Message-ID: <20260317155644.1d4ed9ab@kmaincent-XPS-13-7390>
In-Reply-To: <20260316-unigraf-integration-v9-5-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-5-a01dffc3b0cb@bootlin.com>
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

On Mon, 16 Mar 2026 17:17:26 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Add list comparison utilities and a new function to wait for new
> connectors to appear on the system.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/igt_kms.c | 97
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ lib/igt_kms.h=
 |
> 6 ++++ 2 files changed, 103 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f0f27ccda9d8..b220de419a70 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8322,3 +8322,100 @@ uint32_t igt_get_connector_id_from_mst_path(int
> drm_fd, const void *mst_path)=20
>  	return 0;
>  }
> +
> +/**
> + * array_contains() - Search an element in the array
> + *
> + * @array: Pointer to the array to search into
> + * @array_len: Length of the array
> + * @value: Value to search in the array
> + *
> + * Returns true if @array contains @value
> + */
> +static bool array_contains(const uint32_t *array, int array_len, uint32_t
> value) +{
> +	igt_assert(array_len =3D=3D 0 || array);
> +
> +	for (int i =3D 0; i < array_len; i++)
> +		if (array[i] =3D=3D value)
> +			return true;
> +
> +	return false;
> +}
> +
> +/**
> + * get_array_diff() - Compute and return the set difference between two
> arrays
> + *
> + * @array_a: Pointer to the first array to compare
> + * @array_a_len: Length of the first array
> + * @array_b: Pointer to the second array to compare
> + * @array_b_len: Length of the second array
> + * @diff: Out pointer returning a array of items in @array_a but not
> + *        in @array_b. Can be NULL to only count the elements.
> + *
> + * Returns the number of element which are in @array_a but not in @array=
_b.
> + */
> +int
> +get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t
> *array_b, int array_b_len,
> +	       uint32_t **diff)
> +{
> +	int diff_len =3D 0;
> +
> +	igt_assert(array_a_len =3D=3D 0 || array_a);
> +	igt_assert(array_b_len =3D=3D 0 || array_b);
> +
> +	if (diff)
> +		*diff =3D NULL;
> +
> +	for (int i =3D 0; i < array_a_len; i++) {
> +		if (!array_contains(array_b, array_b_len, array_a[i])) {
> +			if (diff) {
> +				*diff =3D reallocarray(*diff, diff_len + 1,
> sizeof(**diff));
> +				igt_assert(*diff);
> +				(*diff)[diff_len] =3D array_a[i];
> +			}
> +
> +			diff_len++;
> +		}
> +	}
> +
> +	return diff_len;
> +}
> +
> +/**
> + * kms_wait_for_new_connectors() - Wait for new connector to appear
> + *
> + * @newly_connected: Out pointer returning the array of connectors curre=
ntly
> + *                   found connected
> + * @already_connected: Input pointer to array of connectors previously
> + *                     connected
> + * @already_connected_count: Length of @already_connected
> + * @drm_fd: DRM file descriptor
> + *
> + * Returns the number of connectors not in @already_connected and curren=
tly
> + * found connected.
> + */
> +int kms_wait_for_new_connectors(uint32_t **newly_connected,
> +				const uint32_t *already_connected,
> +				int already_connected_count, int drm_fd)
> +{
> +	int newly_connected_count;
> +	struct timespec start, end;
> +
> +	igt_assert(newly_connected);
> +	igt_assert(drm_fd);

Are you sure 0 can't be set as DRM file descriptor?
With that fixed you can add my R-by.

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
