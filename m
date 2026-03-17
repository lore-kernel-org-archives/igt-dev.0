Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361C0FED9E8
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 15:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F9810E6DA;
	Tue, 17 Mar 2026 15:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bPfFXe3S";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77A610E6DA
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:55:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6F5E01A2E05;
 Tue, 17 Mar 2026 15:55:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 42EB95FC9A;
 Tue, 17 Mar 2026 15:55:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3DA41045062E; Tue, 17 Mar 2026 16:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773762948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Vaygu8ttdX82GhQq5eRJYJ6Qhjs0odyUR8WhBRqwmCk=;
 b=bPfFXe3SItoNz4Fivsoq3q80rlvGpirK8MrGEdBkehhQ+yvJ2MxN5uhz300jCzn35w85ex
 mFfnIhucgvVpaLqN0tHTAcyYV/rTd9+e+Qc03R6sjjjgZ04Dxf6SsvUQMq5bUvtAN8m3GI
 anTDgGwaSLWj3W3d8PmO8O3/3IJIepEBH8PkqZTzVDc76W2gm5KmO03cIDZwuQb4IhjNFw
 syC/lxkHxy8XNqYsHXfAINznMbVHVQL2DxGPRpoFp8TWG7/p8bTh1sgn6bBJ+zMUQp/jWN
 +GGmEwd15uqQycZ+kHn9SBFx/C8Rt/OrLTkmrMUuqFXk8fjXP7wHWgnNKewVtA==
Date: Tue, 17 Mar 2026 16:55:45 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 42/49] lib/igt_dp: Create generic helpers for
 DP information
Message-ID: <20260317165545.49adf349@kmaincent-XPS-13-7390>
In-Reply-To: <20260316-unigraf-integration-v9-42-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-42-a01dffc3b0cb@bootlin.com>
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

On Mon, 16 Mar 2026 17:18:03 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> With the introduction of unigraf tests, there is no reason to limit the
> implementation to intel. Create easly extendable generic functions to
> help supporting multiple GPU.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_dp.c    | 177
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ lib/igt_dp.h    |
> 30 ++++++++++ lib/meson.build |   1 +
>  3 files changed, 208 insertions(+)
>=20
> diff --git a/lib/igt_dp.c b/lib/igt_dp.c
> new file mode 100644
> index 000000000000..a9c9eb3efede
> --- /dev/null
> +++ b/lib/igt_dp.c
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Google
> + *
> + * Authors:
> + *   Louis Chauvet <louis.chauvet@bootlin.com>
> + */
> +
> +#include <stdint.h>
> +
> +#include "drmtest.h"
> +#include "i915/i915_dp.h"
> +#include "igt_core.h"
> +#include "igt_kms.h"
> +#include "igt_dp.h"
> +
> +/**
> + * igt_dp_get_current_link_rate: Get current link rate on a display port
> + * @drm_fd: DRM file descriptor
> + * @output: igt_output_t object representing the display port
> + *
> + * Returns:
> + * The current link rate in kb/s, or a negative error code on failure.
> + */
> +int igt_dp_get_current_link_rate(int drm_fd, igt_output_t *output)
> +{
> +	if (is_intel_device(drm_fd))
> +		/*
> +		 * i915_dp_get_current_link_rate returns the value in tens
> of kb/s because
> +		 * that what the kernel uses. Convert it to kb/s to have a
> sane unit...
> +		 */
> +		return i915_dp_get_current_link_rate(drm_fd, output) * 10;
> +
> +	igt_assert_f(false, "Current drm device is not able to report used
> link rate\n");
> +	return -EINVAL;

Just wondering, shouldn't you use igt_skip() here, to skip the specific test
without exiting the test process?
Same question for the other igt_assert of this patch.

> +}
> +
> +/**
> + * igt_dp_get_current_lane_count: Get current lane count on a display po=
rt
> + * @drm_fd: DRM file descriptor
> + * @output: igt_output_t object representing the display port
> + *
> + * Returns:
> + * The number of active lanes, or a negative error code on failure.
> + */
> +int igt_dp_get_current_lane_count(int drm_fd, igt_output_t *output)
> +{
> +	if (is_intel_device(drm_fd))
> +		return i915_dp_get_current_lane_count(drm_fd, output);
> +
> +	igt_assert_f(false, "Current drm device is not able to report used
> lane count\n");
> +	return -EINVAL;
> +}
> +
> +/**
> + * igt_dp_get_max_link_rate: Get maximum link rate on a display port
> + * @drm_fd:		DRM file descriptor
> + * @output:		igt_output_t object representing the display port
> + *
> + * Returns:
> + * The maximum link rate in kb/s, or a negative error code on failure.
> + */
> +int igt_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
> +{
> +	if (is_intel_device(drm_fd))
> +		/*
> +		 * i915_dp_get_max_link_rate returns the value in tens of
> kb/s because
> +		 * that what the kernel uses. Convert it to kb/s to have a
> sane unit...
> +		 */
> +		return i915_dp_get_max_link_rate(drm_fd, output) * 10;
> +
> +	igt_assert_f(false, "Current drm device is not able to report max
> link rate\n");
> +	return -EINVAL;
> +}
> +
> +/**
> + * igt_dp_get_max_supported_rate: Get maximum supported link rate on a
> display port
> + * @drm_fd: DRM file descriptor
> + * @output: igt_output_t object representing the display port
> + *
> + * Returns:
> + * The maximum supported link rate in kb/s, or a negative error code on
> failure.
> + */
> +int igt_dp_get_max_supported_rate(int drm_fd, igt_output_t *output)
> +{
> +	if (is_intel_device(drm_fd))
> +		/*
> +		 * i915_dp_get_max_supported_rate returns the value in tens
> of kb/s because
> +		 * that what the kernel uses. Convert it to kb/s to have a
> sane unit...
> +		 */
> +		return i915_dp_get_max_supported_rate(drm_fd, output) * 10;
> +
> +	igt_assert_f(false, "Current drm device is not able to report max
> link rate\n");
> +	return -EINVAL;
> +}
> +
> +/**
> + * igt_dp_get_max_lane_count: Get maximum lane count on a display port
> + * @drm_fd: DRM file descriptor
> + * @output: igt_output_t object representing the display port
> + *
> + * Returns:
> + * The maximum number of lanes, or a negative error code on failure.
> + */
> +int igt_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
> +{
> +	if (is_intel_device(drm_fd))
> +		return i915_dp_get_max_lane_count(drm_fd, output);
> +
> +	igt_assert_f(false, "Current drm device is not able to report max
> lane count\n");
> +	return -EINVAL;
> +}
> +
> +/**
> + * igt_dp_force_link_retrain: Force link retraining on a display port
> + * @drm_fd:		DRM file descriptor
> + * @output:		igt_output_t object representing the display port
> + * @retrain_count:	Number of times to retrain the link
> + */
> +void igt_dp_force_link_retrain(int drm_fd, igt_output_t *output, int
> retrain_count) +{
> +	if (is_intel_device(drm_fd)) {
> +		i915_dp_force_link_retrain(drm_fd, output, retrain_count);
> +		return;
> +	}
> +
> +	igt_assert_f(false, "Current drm device does not support link
> retraining\n"); +}
> +
> +/**
> + * igt_dp_get_pending_retrain: Get pending link retrain count
> + * @drm_fd:		DRM file descriptor
> + * @output:		igt_output_t object representing the display port
> + *
> + * Returns:
> + * The number of pending retrain operations, or a negative error code on
> failure.
> + */
> +int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
> +{
> +	if (is_intel_device(drm_fd))
> +		return i915_dp_get_pending_retrain(drm_fd, output);
> +
> +	igt_assert_f(false, "Current drm device does not support pending
> retrain count checking\n");
> +	return -EINVAL;
> +}
> +
> +/**
> + * igt_dp_wait_pending_retrain: Wait for pending link retrain operations=
 to
> complete
> + * @drm_fd:		DRM file descriptor
> + * @output:		igt_output_t object representing the display port
> + *
> + * This function waits for any pending link retrain operations to comple=
te
> on the
> + * specified display port. It polls the debugfs interface for the pending
> retrain
> + * count until it reaches zero, indicating all retrain operations have
> completed.
> + */
> +void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output)
> +{
> +	double timeout =3D igt_default_display_detect_timeout();
> +	struct timespec start, now;
> +	double elapsed;
> +
> +	igt_assert_eq(igt_gettime(&start), 0);
> +
> +	while (1) {
> +		if (!igt_dp_get_pending_retrain(drm_fd, output))
> +			return;
> +
> +		igt_assert_eq(igt_gettime(&now), 0);
> +		elapsed =3D (now.tv_sec - start.tv_sec) +
> +					(now.tv_nsec - start.tv_nsec) / 1e9;
> +
> +		if (elapsed >=3D timeout)
> +			break;

igt_time_elapsed() ?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
