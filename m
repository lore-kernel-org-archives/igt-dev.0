Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F51C61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 12:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D972710E1D3;
	Wed, 26 Aug 2026 12:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tf676kHh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F5710E1D3
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787745806; x=1819281806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ib5KWvYyK72sJG+2TGHVQUNp7uGbOGO5wU+5lRuGStk=;
 b=Tf676kHhIYN3/KuZUzJIYtwonqJxtOKa9Vvi/0O5FUWgw+in+N5Turk9
 EDs+qjU9yNeg0hvN6ve/eV5IipACI0u47qjPDFL7i9W1ZO5IgTDSgB8/f
 5PIm051xms18BX9ITn3h6F1Db4SISokaj3uXbp/JRdzo6SwAHR+nDlI/O
 76Lc0hcrOtqiJSp+cu0OPi6vorEmkHjM90XdDpaL6uo5lKxJ5QAgR3So9
 ChgQJrhIvvRLX/nqNs0HjozIFSHPhGNtOsEaKoyrb1ohNWYIpjk47spy3
 JvP417oWfuP8VL7KgXMp7gL5MsMdIjtNqnU667jR6SVdVXsmtiZpJ02nn w==;
X-CSE-ConnectionGUID: DdOfgO3zTEGV4mrEINrkNg==
X-CSE-MsgGUID: RIWJJrs7TxOurm85yhLLEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="87355667"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="87355667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 05:03:26 -0700
X-CSE-ConnectionGUID: JP907c2WQcek1w9m+fzLMw==
X-CSE-MsgGUID: HfCmASRIROGae6i/IH1fcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="268126663"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 05:03:24 -0700
Date: Wed, 26 Aug 2026 14:03:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, mitulkumar.ajitkumar.golani@intel.com,
 chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH i-g-t v5 2/3] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
Message-ID: <20260826120322.hnuce26rtgjfpcxr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org,
 mitulkumar.ajitkumar.golani@intel.com,
 chaitanya.kumar.borah@intel.com
References: <20260825183359.2791891-1-ramanaidu.naladala@intel.com>
 <20260825183359.2791891-3-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825183359.2791891-3-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2026-08-26 at 00:03:57 +0530, Naladala Ramanaidu wrote:

I have two small nits, first about subject:

[PATCH i-g-t v5 2/3] lib/igt_vrr:Add VRR helper library for display refresh rate testing

add space after 'igt_vrr:' so it will be:

[PATCH i-g-t v5 2/3] lib/igt_vrr: Add VRR helper library for display refresh rate testing

iSecond nit at end.

> Introduce a new helper library for Variable Refresh Rate (VRR).
> 
> Add helpers to validate targeted refresh-rate testing.
> 
> v2: Modify debugfs with helpers.
> v3: Add helper to check cmrr support.
>     Address review comments. (Mitul)
> v4: Address below review comments.
>     - Add source and rationale for standard timing refresh
>       rates. (Chaitanya)
>     - Restrict target RR debugfs helper to Intel devices. (Chaitanya)
>     - Make Intel target RR debugfs helper return bool instead of
>       asserting in the library. (Mitul)
>     - Avoid assertions in library functions and return status
>       instead. (karthik)
>     - Reorder source list as per naming convention.
>     - Rename cmrr_supported() to igt_vrr_target_refresh_rate_supported()
>       for consistency. (Chaitanya)
>     - Move CMRR-specific macros and enums from the library to the test
>       file. (Chaitanya)
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  lib/igt_vrr.c   | 149 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_vrr.h   |  29 ++++++++++
>  lib/meson.build |   1 +
>  3 files changed, 179 insertions(+)
>  create mode 100644 lib/igt_vrr.c
>  create mode 100644 lib/igt_vrr.h
> 
> diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
> new file mode 100644
> index 000000000..5b710b3cf
> --- /dev/null
> +++ b/lib/igt_vrr.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <inttypes.h>
> +
> +#include "igt_vrr.h"
> +#include "igt_sysfs.h"
> +
> +/**
> + * Integer refresh rates that sinks advertise as standard video timings, and
> + * for which a fractional (rate * 1000/1001) counterpart is also defined:
> + *
> + *  - 24, 25, 30, 50 and 60 Hz are the film and broadcast (PAL/NTSC) cadences
> + *    carried over into the CTA-861 video formats.
> + *  - 48, 96, 100, 120, 200 and 240 Hz are the integer multiples of those
> + *    cadences, also listed as CTA-861 video formats.
> + *  - 75, 90, 144, 165 and 180 Hz are VESA DMT/CVT and adaptive-sync panel
> + *    rates in common use.
> + *
> + * The fractional variant of each entry (e.g. 60 -> 59.94) is what a target
> + * refresh rate in video mode programs.
> + */
> +const uint32_t igt_vrr_standard_video_timing_fps[] = {
> +	24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 200, 240,
> +};
> +
> +const size_t igt_vrr_standard_video_timing_fps_count =
> +	ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
> +
> +/**
> + * igt_intel_target_rr_debugfs_write:
> + * @fd: DRM file descriptor.
> + * @crtc_index: Index of the CRTC.
> + * @numerator: Numerator of the target refresh rate fraction.
> + * @denominator: Denominator of the target refresh rate fraction.
> + *
> + * Write the target refresh rate configuration to the per-CRTC
> + * VRR debugfs interface. Passing 0/0 clears the target refresh
> + * rate.
> + *
> + * Returns:
> + * true if the target refresh rate was read successfully, false otherwise.
> + */
> +bool
> +igt_intel_target_rr_debugfs_write(int fd, int crtc_index,
> +				  uint32_t rr_numerator,
> +				  uint32_t rr_denominator)
> +{
> +	char buf[32];
> +	int ret, dir, len;
> +
> +	if (!is_intel_device(fd)) {
> +		igt_info("Not an Intel device\n");
> +		return false;
> +	}
> +
> +	len = snprintf(buf, sizeof(buf), "%u/%u", rr_numerator, rr_denominator);
> +	if (len <= 0 || len >= (int)sizeof(buf))
> +		return false;
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +	if (dir < 0)
> +		return false;
> +
> +	ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate", buf, len);
> +	close(dir);
> +
> +	return ret == len;
> +}
> +
> +/**
> + * igt_intel_target_rr_debugfs_read:
> + * @fd: DRM file descriptor.
> + * @crtc_index: Index of the CRTC.
> + * @buf: Buffer to store the target refresh rate string.
> + * @size: Size of @buf in bytes.
> + *
> + * Read the target refresh rate from the Intel per-CRTC VRR debugfs
> + * interface. The returned string is always NUL-terminated on success.
> + *
> + * Return:
> + * true if the target refresh rate was read successfully, false otherwise.
> + */
> +bool
> +igt_intel_target_rr_debugfs_read(int fd, int crtc_index, char *buf, size_t size)
> +{
> +	int ret, dir;
> +
> +	if (!buf || !size)
> +		return false;
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +	if (dir < 0)
> +		return false;
> +
> +	ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
> +			     buf, size - 1);
> +	close(dir);
> +
> +	if (ret < 0)
> +		return false;
> +
> +	buf[ret] = '\0';
> +
> +	return true;
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
> +	return (double)mode->clock * 1000.0 / ((double)mode->htotal * (double)mode->vtotal);
> +}
> +
> +/**
> + * igt_vrr_intel_target_refresh_rate_supported:
> + * @fd: DRM device file descriptor.
> + * @crtc_index: Index of the CRTC.
> + *
> + * Checks whether the intel_vrr_target_refresh_rate debugfs node is present
> + * for the specified CRTC, indicating CMRR support.
> + *
> + * Returns: true if CMRR is supported, false otherwise.
> + */
> +bool igt_vrr_intel_target_refresh_rate_supported(int fd, int crtc_index)
> +{
> +	int dir;
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +
> +	if (dir < 0)
> +		return false;
> +
> +	if (faccessat(dir, "intel_vrr_target_refresh_rate", F_OK, 0) == 0) {
> +		close(dir);
> +		return true;
> +	}
> +
> +	close(dir);
> +	return false;
> +}
> diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h
> new file mode 100644
> index 000000000..d56639727
> --- /dev/null
> +++ b/lib/igt_vrr.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_VRR_H
> +#define IGT_VRR_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>

Add newline here.

> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +extern const uint32_t igt_vrr_standard_video_timing_fps[];
> +extern const size_t igt_vrr_standard_video_timing_fps_count;
> +
> +bool
> +igt_intel_target_rr_debugfs_write(int fd, int crtc_index,
> +				  uint32_t rr_numerator,
> +				  uint32_t rr_denominator);
> +bool
> +igt_intel_target_rr_debugfs_read(int fd, int crtc_index,
> +				 char *buf, size_t size);
> +
> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
> +
> +bool igt_vrr_intel_target_refresh_rate_supported(int fd, int crtc_index);
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index a7cde027e..b5aece55a 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -56,6 +56,7 @@ lib_sources = [
>  	'igt_vec.c',
>  	'igt_vgem.c',
>  	'igt_vkms.c',
> +        'igt_vrr.c',

Please use one tab here, not spaces. Btw you can use checkpatch.pl
script from igt repo path, with .checkpatch.conf adjusted to igt. 


Regards,
Kamil


>  	'igt_x86.c',
>  	'instdone.c',
>  	'intel_allocator.c',
> -- 
> 2.43.0
> 
