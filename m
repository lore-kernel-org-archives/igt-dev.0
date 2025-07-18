Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E8BC83F17
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 15:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969FD10E9EC;
	Fri, 18 Jul 2025 15:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLF+6QWU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1100D10E9EC
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752854106; x=1784390106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=t9bUcheCAmAKne/b7bHV4LdeeNxgw1wtXbu/jECA00I=;
 b=OLF+6QWUOWmp5DE1aC67YoBwS2XkFtx10x3lyhdxps2faNsQnp2aY3KW
 5m9t5nW1CXwFcuAG6iA5XrY8XNIO1k3Lf1zwpPRpkzTNwyR9ufiQug/hr
 GVRF1LfqFe1PKNgHRnZDafGwq1yP2YzzeMHAySBN40UjmvA+9E3KWKxhZ
 ljPapfE13QcF4TF1xT7D8mnQRqg4W0zOyx27Xcb7xXzLlA7qWaiMOtCpx
 kjLFxaW4d/JRu+/RFBRstc+Kfebp6JO8KZfbaCeFo4S4IbMWQe2JQjflU
 ZOOBDjmlCsliIQBC+YCYHZWkfIkA3GyknVO96C43NcCofihWuyexgo2Qy A==;
X-CSE-ConnectionGUID: QOwR467XQ6qYytLj6+qfzw==
X-CSE-MsgGUID: 0rx0aWqHQ+K3dlMolKhsRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="77688914"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="77688914"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:55:05 -0700
X-CSE-ConnectionGUID: sQXX18OqSlKRW/1Zb1y7vQ==
X-CSE-MsgGUID: wblyWg1/QJiB5SoHXS0jdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="158653538"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 08:55:03 -0700
Date: Fri, 18 Jul 2025 17:55:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 michal.wajdeczko@intel.com, karthik.b.s@intel.com, ewelina.musial@intel.com
Subject: Re: [PATCH v6 i-g-t 3/6] tests: Add kms_debugfs
Message-ID: <20250718155501.oo274ds4qtn6umrj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 igt-dev@lists.freedesktop.org, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, ewelina.musial@intel.com
References: <20250716093656.169619-1-peter.senna@linux.intel.com>
 <20250716093656.169619-4-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716093656.169619-4-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-07-16 at 11:36:51 +0200, Peter Senna Tschudin wrote:
> Introduce kms_debugfs that is expected to work with any GPU, not limited
> to i915 and Xe. The test powers off all available displays before
> reading debugfs files, and then powers on all displays before reading
> the files again.
> 
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: michal.wajdeczko@intel.com
> Cc: karthik.b.s@intel.com
> Cc: ewelina.musial@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> v6:
>  - use the new igt_fit_modes_in_bw()
> 
> v5:
>  - use igt_dir_process_files_simple()
> 
> v4:
>  - change test name to kms_debugfs
>  - use the wrapper function igt_fit_modes_in_bw()
>  - use igt_display_require_output() to ensure there is at least one display
> 
> v3:
>  - renamed the test
>  - Removed reference to sysfs from comments  (thanks Kamil)
>  - Updated description to match the display part (thanks Kamil)
>  - Moved from "display" to "heads". Our CI uses "headless" to refer
>    to a DUT without display and it is shorter
>  - renamed subtests for shorter names (thanks Kamil)
>  - fixed comments style (thanks Kamil)
>  - updated CC list
>  - changed the order to test first with all heads off then with all heads on
>    to prevent the need from powering on the heads at the end of the test
>    (thanks Kamil)
>  - removed snprintf from test names (thanks Kamil)
>  - removed subtest group (thanks Kamil)
>  - deleted kms_tests() and moved the code to igt_main (thanks Kamil)
> 
> v2:
>  - changed style of comparison to NULL
>  - moved to a separate patch
> 
>  tests/kms_debugfs.c | 133 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build   |   1 +
>  2 files changed, 134 insertions(+)
>  create mode 100644 tests/kms_debugfs.c
> 
> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
> new file mode 100644
> index 000000000..f8a3360e6
> --- /dev/null
> +++ b/tests/kms_debugfs.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_debugfs.h"
> +#include "igt_dir.h"
> +
> +/**
> + * TEST: kms debugfs test
> + * Description: Read entries from debugfs with all displays on and with
> + *		all displays off.
> + *
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: uapi
> + *
> + * SUBTEST: display-off-read-all
> + * Description: Read all debugfs entries with display off.
> + *
> + * SUBTEST: display-on-read-all
> + * Description: Read all debugfs entries with display on.
> + */
> +
> +/**
> + * igt_display_all_on: Try to turn on all displays
> + * @display: pointer to the igt_display structure
> + *
> + * Returns: void
> + */
> +static void igt_display_all_on(igt_display_t *display)
> +{
> +	struct igt_fb fb[IGT_MAX_PIPES];
> +	enum pipe pipe;
> +
> +	/* try to light all pipes */
> +	for_each_pipe(display, pipe) {
> +		igt_output_t *output;
> +
> +		for_each_valid_output_on_pipe(display, pipe, output) {
> +			igt_plane_t *primary;
> +			drmModeModeInfo *mode;
> +
> +			if (output->pending_pipe != PIPE_NONE)
> +				continue;
> +
> +			igt_output_set_pipe(output, pipe);
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			mode = igt_output_get_mode(output);
> +			igt_create_pattern_fb(display->drm_fd,
> +					      mode->hdisplay, mode->vdisplay,
> +					      DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
> +
> +			/* Set a valid fb as some debugfs like to
> +			 * inspect it on a active pipe
> +			 */
> +			igt_plane_set_fb(primary, &fb[pipe]);
> +			break;
> +		}
> +	}
> +
> +	/* Skip if bandwidth is insufficient for all simultaneous displays */
> +	igt_require(igt_fit_modes_in_bw(display));
> +}
> +
> +/**
> + * igt_display_all_off: Try to turn off all displays
> + * @display: pointer to the igt_display structure
> + *
> + * Returns: void
> + */
> +static void igt_display_all_off(igt_display_t *display)
> +{
> +	enum pipe pipe;
> +	igt_output_t *output;
> +	igt_plane_t *plane;
> +
> +	for_each_connected_output(display, output)
> +		igt_output_set_pipe(output, PIPE_NONE);
> +
> +	for_each_pipe(display, pipe)
> +		for_each_plane_on_pipe(display, pipe, plane)
> +			igt_plane_set_fb(plane, NULL);
> +
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +
> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
> +
> +igt_main
> +{
> +	int debugfs = -1;
> +	igt_display_t *display;
> +	int fd = -1;
> +
> +	igt_fixture {
> +		fd = drm_open_driver_master(DRIVER_ANY);
> +		debugfs = igt_debugfs_dir(fd);
> +		igt_require(debugfs >= 0);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		display = calloc(1, sizeof(*display));
> +		igt_display_require(display, fd);
> +
> +		/* Make sure we have at least one output connected */
> +		igt_display_require_output(display);
> +	}
> +
> +	igt_subtest("display-off-read-all") {
> +		igt_display_all_off(display);
> +
> +		igt_dir_process_files_simple(debugfs);
> +	}
> +
> +	igt_subtest("display-on-read-all") {
> +		/* try to light all pipes */
> +		igt_display_all_on(display);
> +
> +		igt_dir_process_files_simple(debugfs);
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(display);

Missing free() here:

free(display);

Regards,
Kamil

> +		close(debugfs);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 16c699bba..568e7db00 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -29,6 +29,7 @@ test_progs = [
>  	'kms_cursor_crc',
>  	'kms_cursor_edge_walk',
>  	'kms_cursor_legacy',
> +	'kms_debugfs',
>  	'kms_dither',
>  	'kms_display_modes',
>  	'kms_dp_aux_dev',
> -- 
> 2.43.0
> 
