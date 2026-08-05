Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F5CC55822
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 07:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5A110E18D;
	Wed,  5 Aug 2026 07:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaSPOO71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2F510E18D
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 07:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785914116; x=1817450116;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=lr3K2Ii4Xd+gxteJLC8btnEeDFzDjae4nsfNzmjtZxk=;
 b=jaSPOO71wz8R5nFPXV6V7Azh6kEvj+YK4z1jP6NzLSxSDVdiy9Bi9MBu
 PzZbN043AuO2WGhw3lsYTodOIKX2cEn7aK9ypjFoWNFpuFTtKgg2FkoTk
 yDrDdf65WVRAJBK1QcybFDlx3KNstk7LkHYE3SLP5kASHQwHcUgCsEE+q
 meHaUX7/EFQf4oOwwNq7MxVmTVGpvFict+kDQZz1CIYyJKzQgALha+j5D
 pwT+duJV+kTF5kPRENKZYDle8oHUvBQ8EMDi/M9kKKK4nJK9y2K9GpNVW
 mYfJ0Er/kbtaRPfxY/9Oz9dCPAUt2XQcjjnD0d2LtiIzuAhvINpxZ7qid w==;
X-CSE-ConnectionGUID: Sm9ZFygMQ3OtYjIlzUKhKw==
X-CSE-MsgGUID: kCW2TmLtT1C5jHD2xYRADg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="109268007"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="109268007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 00:15:16 -0700
X-CSE-ConnectionGUID: CLd1/o5ZQ+i9+iQA0e1bfA==
X-CSE-MsgGUID: 9LVHx87SSLKbR5LMxKxx/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="261792057"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.64])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 00:15:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 ankit.k.nautiyal@intel.com, Naladala Ramanaidu
 <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
In-Reply-To: <20260804231702.602029-2-ramanaidu.naladala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260804231702.602029-1-ramanaidu.naladala@intel.com>
 <20260804231702.602029-2-ramanaidu.naladala@intel.com>
Date: Wed, 05 Aug 2026 10:15:11 +0300
Message-ID: <0b81eb19e3abd4fa359cb10c19ed420fac424e64@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 05 Aug 2026, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrot=
e:
> Introduce a new helper library for Variable Refresh Rate (VRR).
>
> Add helpers to validate targeted refresh-rate testing.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  lib/igt_vrr.c   | 150 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_vrr.h   |  45 +++++++++++++++
>  lib/meson.build |   1 +
>  3 files changed, 196 insertions(+)
>  create mode 100644 lib/igt_vrr.c
>  create mode 100644 lib/igt_vrr.h
>
> diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
> new file mode 100644
> index 000000000..a11cc8adc
> --- /dev/null
> +++ b/lib/igt_vrr.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#include <inttypes.h>
> +
> +#include "igt_vrr.h"
> +
> +/**
> + * igt_cmrr_debugfs_write:
> + * @fd: DRM file descriptor.
> + * @crtc: CRTC whose VRR debugfs node is to be updated.
> + * @vrefresh: Target refresh rate to program.
> + * @cmrr_flag: CMRR mode to configure (video, non-video, or disable).
> + *
> + * Write the target CMRR refresh rate configuration to the per-CRTC
> + * VRR debugfs interface.
> + *
> + * Returns:
> + * None.
> + */
> +void
> +igt_target_rr_debugfs_write(int fd, igt_crtc_t *crtc,
> +			    uint32_t vrefresh,
> +			    uint32_t cmrr_flag)
> +{
> +	char buf[32];
> +	char path[64];
> +	uint32_t len, ret;
> +	uint64_t cmrr_value;
> +
> +	ret =3D snprintf(path, sizeof(path),
> +		       "crtc-%d/intel_vrr_target_refresh_rate",
> +		       crtc->pipe);

crtc->pipe usage here is plain wrong.

Besides, aren't there already helpers for debugfs read/write? If not,
there should be generic helpers.

> +	igt_assert(ret > 0 && ret < sizeof(path));
> +
> +	switch (cmrr_flag) {
> +	case CMRR_VIDEO_MODE:
> +		cmrr_value =3D vrefresh * CMRR_NUMERATOR;
> +		len =3D snprintf(buf, sizeof(buf),
> +			       "%" PRIu64 "/%llu",
> +			       cmrr_value,
> +			       CMRR_VIDEO_MODE_DENOMINATOR);
> +		igt_assert(len > 0 && len < sizeof(buf));
> +		break;
> +
> +	case CMRR_NON_VIDEO_MODE:
> +		cmrr_value =3D vrefresh * CMRR_NUMERATOR;
> +		len =3D snprintf(buf, sizeof(buf),
> +			       "%" PRIu64 "/%llu",
> +			       cmrr_value,
> +			       CMRR_DENOMINATOR);
> +		igt_assert(len > 0 && len < sizeof(buf));
> +		break;
> +
> +	default:
> +		cmrr_value =3D 0 * CMRR_NUMERATOR;
> +		len =3D snprintf(buf, sizeof(buf),
> +			       "%" PRIu64 "/0", cmrr_value);
> +		igt_assert(len > 0 && len < sizeof(buf));
> +		break;
> +	}
> +
> +	__igt_debugfs_write(fd, path, buf, len);
> +}
> +
> +/**
> + * igt_cmrr_debugfs_read:
> + * @fd: DRM file descriptor.
> + * @crtc: CRTC whose VRR debugfs node is to be read.
> + *
> + * Read the configured CMRR mode from the per-CRTC VRR debugfs node.
> + *
> + * Return: The configured CMRR mode (video, non-video, or disabled).
> + */
> +uint32_t
> +igt_target_rr_debugfs_read(int fd, igt_crtc_t *crtc)
> +{
> +	char buf[32];
> +	char path[64];
> +	uint32_t ret;
> +	uint64_t numerator, denominator;
> +
> +	ret =3D snprintf(path, sizeof(path),
> +		       "crtc-%d/intel_vrr_target_refresh_rate",
> +		       crtc->pipe);

Ditto.

BR,
Jani.


> +	igt_assert(ret > 0 && ret < sizeof(path));
> +
> +	igt_debugfs_read(fd, path, buf);
> +
> +	ret =3D sscanf(buf, "%" SCNu64 "/%" SCNu64,
> +		     &numerator, &denominator);
> +	igt_assert(ret =3D=3D 2);
> +
> +	if (denominator =3D=3D CMRR_VIDEO_MODE_DENOMINATOR)
> +		return CMRR_VIDEO_MODE;
> +
> +	if (denominator =3D=3D CMRR_DENOMINATOR)
> +		return CMRR_NON_VIDEO_MODE;
> +
> +	if (denominator =3D=3D 0)
> +		return CMRR_DISABLE;
> +
> +	return CMRR_DISABLE;
> +}
> +
> +/**
> + * igt_vrr_mode_line_refresh_hz:
> + * @mode: DRM display mode used for the calculation
> + *
> + * Compute the refresh rate directly from the mode timing parameters.
> + *
> + * Returns: Refresh rate in Hz as a floating-point value.
> + */
> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode)
> +{
> +	return (double)mode->clock * 1000.0 / ((double)mode->htotal * (double)m=
ode->vtotal);
> +}
> +
> +/**
> + * igt_vrr_get_mode_with_video_timeing:
> + * @output: Display output containing connector mode list
> + * @fps: Requested integer refresh rate in Hz
> + * @matched_mode: Returned mode that matches @fps
> + *
> + * Find and return a connector mode that matches the requested
> + * video timing refresh rate in Hz.
> + *
> + * Returns: true when a mode is found, false otherwise
> + */
> +
> +bool igt_vrr_get_mode_with_video_timeing(igt_output_t *output,
> +					 uint32_t fps,
> +					 drmModeModeInfo *matched_mode)
> +{
> +	drmModeConnectorPtr connector;
> +
> +	connector =3D output->config.connector;
> +	if (!connector)
> +		return false;
> +
> +	for (int i =3D 0; i < connector->count_modes; i++) {
> +		if (connector->modes[i].vrefresh =3D=3D fps) {
> +			*matched_mode =3D connector->modes[i];
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h
> new file mode 100644
> index 000000000..7724f60a1
> --- /dev/null
> +++ b/lib/igt_vrr.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_VRR_H
> +#define IGT_VRR_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +#define CMRR_NUMERATOR 1000ULL
> +#define CMRR_DENOMINATOR 1000ULL
> +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL
> +#define TARGET_RR_SAMP_COUNT 100
> +
> +enum {
> +	CMRR_VIDEO_MODE,
> +	CMRR_NON_VIDEO_MODE,
> +	CMRR_DISABLE,
> +};
> +
> +const uint32_t igt_vrr_standard_video_timing_fps[] =3D {
> +	24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 200, 240,
> +};
> +
> +const uint32_t igt_vrr_standard_video_timing_fps_count =3D
> +	ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
> +
> +void
> +igt_target_rr_debugfs_write(int fd, igt_crtc_t *crtc,
> +			    uint32_t vrefresh,
> +			    uint32_t cmrr_flag);
> +uint32_t
> +igt_target_rr_debugfs_read(int fd, igt_crtc_t *crtc);
> +
> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
> +
> +bool igt_vrr_get_mode_with_video_timeing(igt_output_t *output,
> +					 uint32_t fps,
> +					 drmModeModeInfo *matched_mode);
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index 3001b473e..8675bd4a6 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -22,6 +22,7 @@ lib_sources =3D [
>  	'igt_configfs.c',
>  	'igt_facts.c',
>  	'igt_crc.c',
> +        'igt_vrr.c',
>  	'igt_debugfs.c',
>  	'igt_device.c',
>  	'igt_device_scan.c',

--=20
Jani Nikula, Intel
