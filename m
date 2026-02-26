Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76359FD8FCE
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 15:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD0110E99B;
	Thu, 26 Feb 2026 15:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKJLajAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C6710E99B
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772121397; x=1803657397;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=h1MOtDiNu56YtPaKrqMJLbnVusHMCU1tIVyfcYLYZYk=;
 b=cKJLajApT34vZmcs+lGsfxTO52RgjzYgmhoI4UuPPlh9x+/qVbq1ZLUH
 d8c5I9i5cC3sSa8B3wK98LtETrTTipFCHe4E/3Yq3KyBN6uRE+GB8fQqX
 dLtm7ffBoIbrhHQntqgmMd+tfxrdnCfnmgVpHmAvtC8rYhaXxrIFIsPUb
 MvktlYH2vm3hpbu+wk0BTFGXcRdJMfcP4wXgwAFC+9UszxOSC685UO3Kb
 DVD2+KPL1gXXO6XQuh140YNi3giEgaWv18pC1IsiCN0Jyyn8ZP9w5gslL
 GcVjfQjitSqbxaSF9cH40bmNNFjJf0uNqlgqLCEoHWyVAFwz9O5HNQ3BV g==;
X-CSE-ConnectionGUID: u7U1MpMfSaKX/mqSs9A0VA==
X-CSE-MsgGUID: OnC4d7c2SOaAEbv6CGSpZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73254421"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73254421"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 07:56:37 -0800
X-CSE-ConnectionGUID: NCzMEHl1Q3qzDz6sjy+MTQ==
X-CSE-MsgGUID: 4PEXLzGlQdG/Y9NbTbHOng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216732137"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 07:56:34 -0800
Date: Thu, 26 Feb 2026 16:56:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 41/48] lib/igt_dp: Create generic helpers for DP
 information
Message-ID: <20260226155618.t35wuvussggovz56@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-41-73dc9143c8c1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-unigraf-integration-v7-41-73dc9143c8c1@bootlin.com>
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

Hi Louis,
On 2026-02-23 at 13:09:48 +0100, Louis Chauvet wrote:
> With the introduction of unigraf tests, there is no reason to limit the
> implementation to intel. Create easly extendable generic functions to
> help supporting multiple GPU.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_dp.c    | 177 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_dp.h    |  30 ++++++++++
>  lib/meson.build |   1 +
>  3 files changed, 208 insertions(+)
> 
> diff --git a/lib/igt_dp.c b/lib/igt_dp.c
> new file mode 100644
> index 000000000000..0920a43af5e9
> --- /dev/null
> +++ b/lib/igt_dp.c
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Google
> + *
> + * Authors:
> + *   Louis Chauvet <louis.chauvet@bootlin.com>
> + */
> +
> +#include "drmtest.h"
> +#include "i915/i915_dp.h"
> +#include "igt_amd.h"
> +#include "igt_core.h"
> +#include "igt_kms.h"
> +#include <stdint.h>

Please move system include before all igt ones.

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
> +		 * i915_dp_get_current_link_rate returns the value in tens of kb/s because
> +		 * that what the kernel uses. Convert it to kb/s to have a sane unit...
> +		 */
> +		return i915_dp_get_current_link_rate(drm_fd, output) * 10;
> +
> +	igt_assert_f(false, "Current drm device is not able to report used link rate\n");

Add newline before return, here and in similar places below.

Regards,
Kamil

> +	return -EINVAL;
> +}
> +
> +/**
> + * igt_dp_get_current_lane_count: Get current lane count on a display port
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
> +	igt_assert_f(false, "Current drm device is not able to report used lane count\n");
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
> +		 * i915_dp_get_max_link_rate returns the value in tens of kb/s because
> +		 * that what the kernel uses. Convert it to kb/s to have a sane unit...
> +		 */
> +		return i915_dp_get_max_link_rate(drm_fd, output) * 10;
> +
> +	igt_assert_f(false, "Current drm device is not able to report max link rate\n");
> +	return -EINVAL;
> +}
> +
> +/**
> + * igt_dp_get_max_supported_rate: Get maximum supported link rate on a display port
> + * @drm_fd: DRM file descriptor
> + * @output: igt_output_t object representing the display port
> + *
> + * Returns:
> + * The maximum supported link rate in kb/s, or a negative error code on failure.
> + */
> +int igt_dp_get_max_supported_rate(int drm_fd, igt_output_t *output)
> +{
> +	if (is_intel_device(drm_fd))
> +		/*
> +		 * i915_dp_get_max_supported_rate returns the value in tens of kb/s because
> +		 * that what the kernel uses. Convert it to kb/s to have a sane unit...
> +		 */
> +		return i915_dp_get_max_supported_rate(drm_fd, output) * 10;
> +
> +	igt_assert_f(false, "Current drm device is not able to report max link rate\n");
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
> +	igt_assert_f(false, "Current drm device is not able to report max lane count\n");
> +	return -EINVAL;
> +}
> +
> +/**
> + * igt_dp_force_link_retrain: Force link retraining on a display port
> + * @drm_fd:		DRM file descriptor
> + * @output:		igt_output_t object representing the display port
> + * @retrain_count:	Number of times to retrain the link
> + */
> +void igt_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
> +{
> +	if (is_intel_device(drm_fd)) {
> +		i915_dp_force_link_retrain(drm_fd, output, retrain_count);
> +		return;
> +	}
> +
> +	igt_assert_f(false, "Current drm device does not support link retraining\n");
> +}
> +
> +/**
> + * igt_dp_get_pending_retrain: Get pending link retrain count
> + * @drm_fd:		DRM file descriptor
> + * @output:		igt_output_t object representing the display port
> + *
> + * Returns:
> + * The number of pending retrain operations, or a negative error code on failure.
> + */
> +int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
> +{
> +	if (is_intel_device(drm_fd))
> +		return i915_dp_get_pending_retrain(drm_fd, output);
> +
> +	igt_assert_f(false, "Current drm device does not support pending retrain count checking\n");
> +	return -EINVAL;
> +}
> +
> +/**
> + * igt_dp_wait_pending_retrain: Wait for pending link retrain operations to complete
> + * @drm_fd:		DRM file descriptor
> + * @output:		igt_output_t object representing the display port
> + *
> + * This function waits for any pending link retrain operations to complete on the
> + * specified display port. It polls the debugfs interface for the pending retrain
> + * count until it reaches zero, indicating all retrain operations have completed.
> + */
> +void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output)
> +{
> +	double timeout = igt_default_display_detect_timeout();
> +	struct timespec start, now;
> +	double elapsed;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +
> +	while (1) {
> +		if (!igt_dp_get_pending_retrain(drm_fd, output))
> +			return;
> +
> +		clock_gettime(CLOCK_MONOTONIC, &now);
> +		elapsed = (now.tv_sec - start.tv_sec) +
> +					(now.tv_nsec - start.tv_nsec) / 1e9;
> +
> +		if (elapsed >= timeout)
> +			break;
> +		usleep(10);
> +	}
> +	igt_assert_f(false, "Timeout waiting for pending retrain to complete\n");
> +}
> diff --git a/lib/igt_dp.h b/lib/igt_dp.h
> new file mode 100644
> index 000000000000..0c56ad2ec8b1
> --- /dev/null
> +++ b/lib/igt_dp.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Google
> + *
> + * Authors:
> + *   Louis Chauvet <louis.chauvet@bootlin.com>
> + */
> +
> +#ifndef _IGT_DP_H_
> +#define _IGT_DP_H_
> +
> +#include "igt_kms.h"
> +
> +int igt_dp_get_current_link_rate(int drm_fd, igt_output_t *output);
> +
> +int igt_dp_get_current_lane_count(int drm_fd, igt_output_t *output);
> +
> +int igt_dp_get_max_link_rate(int drm_fd, igt_output_t *output);
> +
> +int igt_dp_get_max_supported_rate(int drm_fd, igt_output_t *output);
> +
> +int igt_dp_get_max_lane_count(int drm_fd, igt_output_t *output);
> +
> +void igt_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
> +
> +int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
> +
> +void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output);
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index e7f2d3a77799..98074685afda 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -29,6 +29,7 @@ lib_sources = [
>  	'igt_drm_fdinfo.c',
>          'igt_fs.c',
>  	'igt_aux.c',
> +	'igt_dp.c',
>  	'igt_gt.c',
>  	'igt_halffloat.c',
>  	'igt_hwmon.c',
> 
> -- 
> 2.52.0
> 
