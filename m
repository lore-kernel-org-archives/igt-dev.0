Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E7EC71148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 17:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B04210E1DE;
	Fri, 13 Jun 2025 17:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHAqYUoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C3510E1DE
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 17:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749837289; x=1781373289;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vSbm0NRIg9wsDO5VwUgQS3nuM2EZpvVi9le+W9UPxQ4=;
 b=CHAqYUoBSG7J09g4wye5eKDMyKbBCPxsVsYDFnqiQFFWQBmYCaNkdIU4
 pP4gxUM4JxAikLtMUciOu5jmsucOdQqDCljPxAXy+4C0GCjs9XTXZu2EV
 vvTg/euD4rWsfdJWu+7ZBQuLX0wpHsmRs7+/ym6p0Ip2cY0smQepMaKQE
 aT2ArC/eRZ8jYq/wcP+rsDTOkXy7ppo78xhnKADvOtx2O7vORPr1/T6DD
 xXGs39pB4iVZkzELRr9MhkDAX45iuVdaf6NTocAAucrhYA3Rfn83Y8rQ5
 y+Zq/7FGrXi47DcDHqCMa2mXrYRjFhzSDofraA7l5oTGAP4SCiQxxXLFi w==;
X-CSE-ConnectionGUID: OGJSVByNR8+VgIyR+uiSqA==
X-CSE-MsgGUID: bhJWWslsQOq8/O53fcKewg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51778539"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="51778539"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 10:54:49 -0700
X-CSE-ConnectionGUID: O1oCezocRJi9L6gY9offsA==
X-CSE-MsgGUID: rfKu2zJWQmCwW7N1jJJ/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="148778498"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 10:54:45 -0700
Date: Fri, 13 Jun 2025 19:54:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com, Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH v2 i-g-t 3/6] tests: Add core_debugfs_display_on_off
Message-ID: <20250613175442.druvatjw3a7kcudw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com, Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250613105146.106581-1-peter.senna@linux.intel.com>
 <20250613105146.106581-4-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613105146.106581-4-peter.senna@linux.intel.com>
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
On 2025-06-13 at 12:51:42 +0200, Peter Senna Tschudin wrote:

this is not full review, I only have few nits, see below.

> Introduce core_debugfs_display_on_off that is expected to work with any
> GPU, not limited to i915 and Xe. The test powers on all available
> displays before reading debugfs files, and then powers off all displays
> before reading the files again.
> 
> Cc: marcin.bernatowicz@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: ewelina.musial@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> v2:
>  - changed style of comparison to NULL
>  - moved to a separate patch
> 
>  tests/core_debugfs_display_on_off.c | 171 ++++++++++++++++++++++++++++
>  tests/meson.build                   |   1 +
>  2 files changed, 172 insertions(+)
>  create mode 100644 tests/core_debugfs_display_on_off.c

imho test name should be shorter, like core_debugfs_display.c

> 
> diff --git a/tests/core_debugfs_display_on_off.c b/tests/core_debugfs_display_on_off.c
> new file mode 100644
> index 000000000..b7dd96208
> --- /dev/null
> +++ b/tests/core_debugfs_display_on_off.c
> @@ -0,0 +1,171 @@
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
> + * TEST: debugfs display on/off test
> + * Description: Read entries from debugfs, and sysfs paths.

Please also write about display in description.
Is this for both debugfs and sysfs? Test name has only 'debugfs'
so imho you should remove 'sysfs'

> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: uapi
> + *
> + * SUBTEST: debugfs-read-all-entries-display-off

imho subtest name should be shorter, like: off-read-all

> + * Description: Read all debugfs entries with display off.
> + *
> + * SUBTEST: debugfs-read-all-entries-display-on

Same here, imho better: on-read-all

Or it could go with 'display-' prefix:

display-off-read-all

display-on-read-all

+cc Karthik, Juha-Pekka and Swati

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

> + * Description: Read all debugfs entries with display on.
> + */
> +
> +/** bool igt_kms_all_displays_on: Try to turn on all displays

imho:

/**
 * bool igt_kms_all_displays_on: Try to turn on all displays

> + * @fd: file descriptor for the drm device
> + *
> + * Returns: void
> + */
> +static void igt_display_all_on(igt_display_t *display)
> +{
> +	struct igt_fb fb[IGT_MAX_PIPES];
> +	enum pipe pipe;
> +	int ret;
> +
> +	/* try to light all pipes */
> +retry:
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
> +						mode->hdisplay, mode->vdisplay,
> +						DRM_FORMAT_XRGB8888,
> +						DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
> +
> +			/* Set a valid fb as some debugfs like to
> +			 * inspect it on a active pipe
> +			 */
> +			igt_plane_set_fb(primary, &fb[pipe]);
> +			break;
> +		}
> +	}
> +
> +	if (display->is_atomic)
> +		ret = igt_display_try_commit_atomic(display,
> +				DRM_MODE_ATOMIC_TEST_ONLY |
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);
> +	else
> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
> +
> +	if (ret) {
> +		igt_output_t *output;
> +		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
> +
> +		igt_require_f(found, "No valid mode combo found.\n");

Why require here? We want just displays on, why break when
not hi-res here? Karthik or Swati, please help with this.

> +
> +		for_each_connected_output(display, output)
> +			igt_output_set_pipe(output, PIPE_NONE);
> +
> +		goto retry;
> +	}
> +
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +
> +/** bool igt_kms_all_displays_off: Try to turn off all displays
> + * @fd: file descriptor for the drm device
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
> +static void kms_tests(int fd, igt_dir_t *igt_dir)
> +{

Please move this code to igt_main below.

> +	igt_display_t *display;
> +	char test_name[64];
> +
> +	display = calloc(1, sizeof(*display));
> +
> +	igt_fixture
> +		igt_display_require(display, fd);
> +
> +	snprintf(test_name, sizeof(test_name),
> +		 "debugfs-read-all-entries-display-on");
> +
> +	igt_subtest(test_name) {

Use directly name, why snprintf to test_name?

	igt_subtest("on-read-all") {

> +		/* try to light all pipes */
> +		igt_display_all_on(display);
> +
> +		igt_dir_scan_dirfd(igt_dir, -1);
> +		igt_dir_process_files(igt_dir, NULL, NULL);
> +	}
> +
> +	snprintf(test_name, sizeof(test_name),
> +		 "debugfs-read-all-entries-display-off");
> +
> +	igt_subtest(test_name) {

Same here:
	igt_subtest("off-read-all") {

> +		igt_display_all_off(display);
> +
> +		igt_dir_scan_dirfd(igt_dir, -1);
> +		igt_dir_process_files(igt_dir, NULL, NULL);
> +	}
> +
> +	igt_fixture
> +		igt_display_fini(display);
> +}
> +
> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
> +
> +igt_main
> +{
> +	int debugfs = -1;
> +	int fd = -1;
> +	igt_dir_t *igt_dir = NULL;
> +
> +	igt_fixture {
> +		fd = drm_open_driver_master(DRIVER_ANY);
> +		debugfs = igt_debugfs_dir(fd);
> +		igt_require(debugfs >= 0);
> +
> +		igt_dir = igt_dir_create(debugfs);
> +		igt_require(igt_dir);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	igt_subtest_group
> +		kms_tests(fd, igt_dir);

No need for subtest group when only display is here.

> +
> +	igt_fixture {

Should we turn on all displays here?

Regards,
Kamil

> +		close(debugfs);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index fa62cbeb9..c05c023ef 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -1,6 +1,7 @@
>  test_progs = [
>  	'core_auth',
>  	'core_debugfs',
> +	'core_debugfs_display_on_off',
>  	'core_getclient',
>  	'core_getstats',
>  	'core_getversion',
> -- 
> 2.43.0
> 
