Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C428D262A2
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCF810E660;
	Tue, 20 Jan 2026 21:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dWuywlhG";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5284F10E648
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:10:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 102E5C214FD
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:09:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 35F68606AB;
 Tue, 20 Jan 2026 21:10:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6EB0119B0E2B; Tue, 20 Jan 2026 22:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943418; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ebs5scn3Mq4+XT6CZjGhfImzssKHiWbZHNLDi7phWoM=;
 b=dWuywlhGDRbflvZrgnErwRl7G5llue50ti90uZW+k6MGPbIzaP47bYe9d4hBqInn30Vh0w
 6IdqIw6MdGJpdLNwy0aBeLBEKOGACPJdq9kiKCK6zyYZ/yrSGs3c/9GdclWdLosOndgRxQ
 mVjT4FFVfax4pD1GBlcBWfZMkHyi9wDeFKx871IiPqLazRRTQnzlzUdKnHKec/83cCSlay
 PbwWh+lOjVPqke4KMD9hs9DxNP81Pv84m1Wc5k6bB62nN/VObMtzScja0OM8YG26n2kCVl
 5ryqSXrRU/togDauDrV35OxJk/ujB+0OD1NRCYq/HX6DIdp7w2BmUKfSwPS5DQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:10:17 +0100
Message-Id: <DFTQ3V8NHXUK.1C4RPYSHTC1OD@bootlin.com>
Subject: Re: [PATCH i-g-t v4 05/46] lib/igt_kms: Add helper to wait for new
 connectors
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-5-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-5-0fc7bb1b4101@bootlin.com>
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
> Add list comparison utilities and a new function to wait for new
> connectors to appear on the system.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  lib/igt_kms.h |  6 ++++
>  2 files changed, 99 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6f2a8abbaf7d..c77c94d7c437 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7833,3 +7833,96 @@ uint32_t igt_get_connector_id_from_mst_path(int dr=
m_fd, const void *mst_path)
>
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
> +	for (int i =3D 0; i < list_len; i++) {
> +		if (list[i] =3D=3D value)
> +			return true;
> +	}
> +	return false;
> +}
> +
> +/**
> + * get_list_diff() - Compute and return the difference between two lists

Maybe s/difference/set difference/, because it's really what this function
does: a set difference.

> + *
> + * @list_a: Pointer to the first list to compare
> + * @list_a_len: Length of the first list
> + * @list_b: Pointer to the second list to compare
> + * @list_b_len: Length of the second list
> + * @diff: Out pointer for the difference. Can be null to only count new =
elements.

"new elements" here makes sense if you use this function in a given way:
list_a is new "new" list and list_b is the "old" list. So I'd rephrase
like:

 * @diff: Out pointer returning a list of items in list_a but not in
          list_b. Can be NULL to only count the elements.

> + *
> + * Returns the number of element which are in @list_a but not in @list_b=
.
> + */
> +int
> +get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *li=
st_b, int list_b_len,
> +	      uint32_t **diff)
> +{
> +	int diff_len =3D 0;
> +
> +	igt_assert((!list_a && list_a_len =3D=3D 0) || list_a);
> +	igt_assert((!list_b && list_b_len =3D=3D 0) || list_b);
> +
> +	if (diff)
> +		*diff =3D malloc(sizeof(**diff));
> +
> +	for (int i =3D 0; i < list_a_len; i++) {
> +		if (!list_contains(list_b, list_b_len, list_a[i])) {
> +			if (diff) {
> +				*diff =3D reallocarray(*diff, diff_len + 1, sizeof(**diff));
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
> + * @list_a: Pointer to the first list to compare
> + * @list_a_len: Length of the first list
> + * @list_b: Pointer to the second list to compare
> + * @list_b_len: Length of the second list
> + * @diff: Out pointer for the difference. Can be null.
> + *
> + * Returns the number of element which differ between the two lists.

These docs are a copy of the get_list_diff() docs, perhaps you forgot to
update them after copy-paste.

Based on the implementation I think this should sound like:

 * @newly_connected: Out pointer returning the list of connectors currently=
 found connected
 * @already_connected: Input pointer to list of connectors previously conne=
cted
 * @already_connected_count: Length of @already_connected
 * @drm_fd: DRM file descriptor
 *
 * Returns the number of connectors not in @already_connected and currently
 * found connected.

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
> +		newly_connected_count =3D igt_get_connected_connectors(drm_fd, newly_c=
onnected);
> +		clock_gettime(CLOCK_MONOTONIC, &end);
> +	} while (get_list_diff(*newly_connected, newly_connected_count,
> +			       already_connected, already_connected_count,
> +			       NULL) =3D=3D 0 &&
> +		 igt_time_elapsed(&start, &end) <=3D igt_default_display_detect_timeou=
t());
> +
> +	return newly_connected_count;
> +}

With the above fixed:
 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
