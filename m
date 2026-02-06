Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CFDEE20AB
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 15:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B2410E0EA;
	Fri,  6 Feb 2026 15:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="A58eaO1T";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31AB10E0EA
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:21:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5965EC250C5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:21:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C38A760729;
 Fri,  6 Feb 2026 15:21:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B8FD119D1FF1; Fri,  6 Feb 2026 16:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770391261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zbc3S7Dfa+Srh2sK+npxvRWsuDJh+fSk3bC0E67q0SE=;
 b=A58eaO1TPJrR7O5eP90CVTUzkehgc79fXqpdyK9u9qOC6S+VXyjZs4A6tEsT5kdUPUKbFh
 0bfESGRpntcN7EGL2sN0XanHonDq2qW7CnZQCOvSy8ZOxiYCra8C4S9pylV4ooMYwjKEsW
 0+euW6xGTtV7vEVhL4+aL9Fxei3KypYUZp7C9qh30qlcEmCXTtfbFJTlWALlol2OQjiiHW
 zCoHJhmLEsgpK3BCxn3Q+HWapEEqPXwX5S9vTKiIlF9Qqy7BB6wSFNsA9inIyFcvOLQN/J
 32RAXfDfpLqJeEuZdECjspAieAQJKlrPAFmVDpX3AuObIqwonFgkIdhxEhSOmw==
Date: Fri, 6 Feb 2026 16:20:58 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 41/48] lib/igt_dp: Create generic helpers for
 DP information
Message-ID: <20260206162058.6498a4ba@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-41-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-41-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:20 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> With the introduction of unigraf tests, there is no reason to limit the
> implementation to intel. Create easly extendable generic functions to
> help supporting multiple GPU.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_dp.c    | 164
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ lib/igt_dp.h    |
> 24 +++++++++ lib/meson.build |   1 +
>  3 files changed, 189 insertions(+)
>=20
> diff --git a/lib/igt_dp.c b/lib/igt_dp.c
> new file mode 100644
> index 000000000000..f2ee1f7b9975
> --- /dev/null
> +++ b/lib/igt_dp.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: MIT

Copyright?

> +//
> +#include "drmtest.h"
> +#include "i915/i915_dp.h"
> +#include "igt_amd.h"
> +#include "igt_core.h"
> +#include "igt_kms.h"
> +#include <stdint.h>
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
> +		// i915_dp_get_current_link_rate returns the value in tens
> of kb/s because
> +		// that what the kernel uses. Convert it to kb/s to have a
> sane unit...

/* ... */
For multiple line comment.

> +		return i915_dp_get_current_link_rate(drm_fd, output) * 10;
> +
> +	igt_assert_f(false, "Current drm device is not able to report used
> link rate\n");
> +	return -EINVAL;
> +}

...

> +int igt_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
> +{
> +	if (is_intel_device(drm_fd))
> +		// i915_dp_get_current_link_rate returns the value in tens
> of kb/s because
> +		// that what the kernel uses. Convert it to kb/s to be
> sane...

Same

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
> +		// i915_dp_get_current_link_rate returns the value in tens
> of kb/s because
> +		// that what the kernel uses. Convert it to kb/s to be
> sane...

Same

> +		return i915_dp_get_max_supported_rate(drm_fd, output) * 10;
> +
> +	igt_assert_f(false, "Current drm device is not able to report max
> link rate\n");
> +	return -EINVAL;
> +}

...

> + */
> +void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output)
> +{
> +	double timeout =3D igt_default_display_detect_timeout();
> +	struct timespec start, now;
> +	double elapsed;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +
> +	while (1) {
> +		if (igt_dp_get_pending_retrain(drm_fd, output) =3D=3D 0)

if (!igt_dp_get_pending_retrain(...))

> +			return;
> +
> +		clock_gettime(CLOCK_MONOTONIC, &now);
> +		elapsed =3D (now.tv_sec - start.tv_sec) +
> +					(now.tv_nsec - start.tv_nsec) / 1e9;
> +
> +		if (elapsed >=3D timeout)
> +			break;

Maybe a sleep is needed to not overload the cpu.

> +	}
> +	igt_assert_f(false, "Timeout waiting for pending retrain to
> complete\n"); +}

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
