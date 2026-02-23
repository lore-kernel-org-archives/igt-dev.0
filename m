Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E1BEA4FC1
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9446910E3F8;
	Mon, 23 Feb 2026 14:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1b7hWdPX";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7303E10E3F3
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:00:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BB582C143CA;
 Mon, 23 Feb 2026 14:00:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 983115FD43;
 Mon, 23 Feb 2026 14:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 83D9B10368D01; Mon, 23 Feb 2026 15:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771855217; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jNIC1N4pDcHp+OgCuJmwBA5dvZUQuC6JcrhkNfoA/1E=;
 b=1b7hWdPX4AEngYE9/4D7QR8bPMVvFYshup5fBsav776ZmxwpmtwuIZBeUVmGpfK6P5TwfR
 5uoS+Goh7H0/CH4eRtdI0wFySauE6UrZOq2c1XAS6Db32YyNl7OBxrvFp5DNL3Iye+G+dx
 cMmsP2328H/U4I9+B79TIozpVwAJH5VxSbzvR3A2GtgIUSHu/F9tUU5jV4ObiB/p33dpiE
 hq17jGOIIYmWUznG3qhGyDANK57NpIMPhc6LXw101W1HbvlIBiOZy6sU6sF3+CiN7Z0iFh
 s6PEpwCWkGST78AD5PhCf/PulfoHtdZMxZCXYfB9Biwg9a6bp/jhRafauB1Crg==
Date: Mon, 23 Feb 2026 15:00:14 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 05/48] lib/igt_kms: Add helper to wait for new
 connectors
Message-ID: <20260223150014.2eb4eef7@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-5-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-5-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:12 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Add list comparison utilities and a new function to wait for new
> connectors to appear on the system.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/igt_kms.c | 96
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ lib/igt_kms.h=
 |
> 6 ++++ 2 files changed, 102 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 8876ee8a11f7..514d905fe1fe 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8170,3 +8170,99 @@ uint32_t igt_get_connector_id_from_mst_path(int
> drm_fd, const void *mst_path)=20
>  	return 0;
>  }
> +
> +/**
> + * list_contains() - Search an element in the list
> + *
> + * @list: Pointer to the list to search into
> + * @list_len: Length of the list
> + * @value: Value to search in the list
> + *
> + * Returns true if @list contains @value
> + */
> +static bool list_contains(const uint32_t *list, int list_len, uint32_t v=
alue)
> +{
> +	igt_assert((!list && list_len =3D=3D 0) || list);

You could simply do this here: igt_assert(list_len =3D=3D 0 || list);


> +	for (int i =3D 0; i < list_len; i++) {
> +		if (list[i] =3D=3D value)
> +			return true;
> +	}

You can remove the for loop bracket for a cleaner code.

> +	return false;
> +}
> +
> +/**
> + * get_list_diff() - Compute and return the set difference between two l=
ists
> + *
> + * @list_a: Pointer to the first list to compare
> + * @list_a_len: Length of the first list
> + * @list_b: Pointer to the second list to compare
> + * @list_b_len: Length of the second list
> + * @diff: Out pointer returning a list of items in list_a but not
> + *        in list_b. Can be NULL to only count the elements.
> + *
> + * Returns the number of element which are in @list_a but not in @list_b.
> + */
> +int
> +get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t
> *list_b, int list_b_len,
> +	      uint32_t **diff)
> +{
> +	int diff_len =3D 0;
> +
> +	igt_assert((!list_a && list_a_len =3D=3D 0) || list_a);
> +	igt_assert((!list_b && list_b_len =3D=3D 0) || list_b);

Same here.

> +
> +	if (diff)
> +		*diff =3D malloc(sizeof(**diff));
> +
> +	for (int i =3D 0; i < list_a_len; i++) {
> +		if (!list_contains(list_b, list_b_len, list_a[i])) {
> +			if (diff) {
> +				*diff =3D reallocarray(*diff, diff_len + 1,
> sizeof(**diff));
> +				igt_assert(*diff);
> +				(*diff)[diff_len] =3D list_a[i];
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
> + * @newly_connected: Out pointer returning the list of connectors curren=
tly
> + *                   found connected
> + * @already_connected: Input pointer to list of connectors previously
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
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	clock_gettime(CLOCK_MONOTONIC, &end);
> +	do {
> +		if (*newly_connected)
> +			free(*newly_connected);
> +		newly_connected_count =3D igt_get_connected_connectors(drm_fd,
> newly_connected);
> +		clock_gettime(CLOCK_MONOTONIC, &end);
> +	} while (get_list_diff(*newly_connected, newly_connected_count,
> +			       already_connected, already_connected_count,
> +			       NULL) =3D=3D 0 &&
> +		 igt_time_elapsed(&start, &end) <=3D
> igt_default_display_detect_timeout());

!get_list_diff(...)

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
