Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD516C83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 08:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD0910E973;
	Fri,  4 Jul 2025 08:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLfiYCvn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF35B10E973
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 08:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751616372; x=1783152372;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ygJwskg/y4T4cvs/AvOTuZlAls4hn0XGTFfKm9DOUZQ=;
 b=XLfiYCvnQ/pW7TbXnFnIr4racda8oImenhj9CHCEYLKe+UrhTEvDIALZ
 5dM11fRE8HPlHT+bEUV7SU23tonWxutQ9y6oXSYEWcOwbs+31bCjO5HfA
 7HHDfZaASWjI6JkqIiBObxmA1526Lcfytv2V9aME0MJTy0bZYxlO7mFF1
 Qxs3y3iV6qPs3gElDuNx46HxbW82ekCCce8D0SOH3eqrC5O8PwHbWFvlW
 Rp21zg/vDcNDYoNDxulXuxNXXcjefJ5CHbe53G5WucSXjie1OtgBI1gre
 8Ff/3heeOdVyw4P+EVBg1mDDECYk8NV5KIH92Wc9AV9H4hgE30bkp7iw6 w==;
X-CSE-ConnectionGUID: Yuw8NK8KTaK71ndldgStxw==
X-CSE-MsgGUID: lEgIBsSLRm2lntWeWNL3CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57724182"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="57724182"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:06:12 -0700
X-CSE-ConnectionGUID: MDmtrLYrSzOgtNiyeZHHjQ==
X-CSE-MsgGUID: X+Ki5PZKRiKAGLfkP7QYYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="159138108"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:06:08 -0700
Message-ID: <bb7e190c-203e-41f5-a367-baf5a0acf4ca@linux.intel.com>
Date: Fri, 4 Jul 2025 10:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 resend i-g-t 3/6] tests: Add core_debugfs_heads_power
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, michal.wajdeczko@intel.com,
 marcin.bernatowicz@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
 <20250616074240.45818-4-peter.senna@linux.intel.com>
 <aGbqZTPOpf79Xxx7@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <aGbqZTPOpf79Xxx7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 7/3/2025 10:39 PM, Rodrigo Vivi wrote:
> On Mon, Jun 16, 2025 at 09:42:35AM +0200, Peter Senna Tschudin wrote:
>> Introduce core_debugfs_heads_power that is expected to work with any
>> GPU, not limited to i915 and Xe. The test powers off all available
>> heads before reading debugfs files, and then powers on all heads
>> before reading the files again.
>>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: michal.wajdeczko@intel.com
>> Cc: marcin.bernatowicz@intel.com
>> Cc: kamil.konieczny@linux.intel.com
>> Cc: katarzyna.piecielska@intel.com
>> Cc: zbigniew.kempczynski@intel.com
>> Cc: ewelina.musial@intel.com
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>> v3:
>>  - renamed the test
>>  - Removed reference to sysfs from comments  (thanks Kamil)
>>  - Updated description to match the display part (thanks Kamil)
>>  - Moved from "display" to "heads". Our CI uses "headless" to refer
>>    to a DUT without display and it is shorter
>>  - renamed subtests for shorter names (thanks Kamil)
>>  - fixed comments style (thanks Kamil)
>>  - updated CC list
>>  - changed the order to test first with all heads off then with all heads on
>>    to prevent the need from powering on the heads at the end of the test
>>    (thanks Kamil)
>>  - removed snprintf from test names (thanks Kamil)
>>  - removed subtest group (thanks Kamil)
>>  - deleted kms_tests() and moved the code to igt_main (thanks Kamil)
>>
>> v2:
>>  - changed style of comparison to NULL
>>  - moved to a separate patch
>>
>>  tests/core_debugfs_heads_power.c | 156 +++++++++++++++++++++++++++++++
>>  tests/meson.build                |   1 +
>>  2 files changed, 157 insertions(+)
>>  create mode 100644 tests/core_debugfs_heads_power.c
>>
>> diff --git a/tests/core_debugfs_heads_power.c b/tests/core_debugfs_heads_power.c
>> new file mode 100644
>> index 000000000..1813986d8
>> --- /dev/null
>> +++ b/tests/core_debugfs_heads_power.c
>> @@ -0,0 +1,156 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "igt.h"
>> +#include "igt_debugfs.h"
>> +#include "igt_dir.h"
>> +
>> +/**
>> + * TEST: debugfs heads power test
> 
> Could we please use display instead of heads here?
> From display folks perspective heads might be indeed more clear because we will
> only use display if any 'head' is attached, but from folks outside of display
> world, heads will be a confusing term to be in the name of the test.
> 
> Or perhaps we name kms_debugfs 

My first name proposal was core_debugfs_display_on_off. This is
informative because it makes it explicit that this runs the test with
display on and with the display off. This name is also a good contrast
with the other test core_debugfs. Removing the on_off suffix makes the
name less informative.

Problem is that core_debugfs_display_on_off is a large name. So using
heads instead of display was an attempt to make the name shorter, but no
one liked it. We are waiting the KMS team to decide on which name they want.




> 
>> + * Description: Read entries from debugfs with all heads on and with all heads
>> + *		off.
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: debugfs
>> + * Feature: core
>> + * Test category: uapi
>> + *
>> + * SUBTEST: off-read-all
>> + * Description: Read all debugfs entries with heads off.
>> + *
>> + * SUBTEST: on-read-all
>> + * Description: Read all debugfs entries with heads on.
>> + */
>> +
>> +/**
>> + * bool igt_kms_all_displays_on: Try to turn on all heads
>> + * @display: pointer to the igt_display structure
>> + *
>> + * Returns: void
>> + */
>> +static void igt_display_all_on(igt_display_t *display)
>> +{
>> +	struct igt_fb fb[IGT_MAX_PIPES];
>> +	enum pipe pipe;
>> +	int ret;
>> +
>> +	/* try to light all pipes */
>> +retry:
>> +	for_each_pipe(display, pipe) {
>> +		igt_output_t *output;
>> +
>> +		for_each_valid_output_on_pipe(display, pipe, output) {
>> +			igt_plane_t *primary;
>> +			drmModeModeInfo *mode;
>> +
>> +			if (output->pending_pipe != PIPE_NONE)
>> +				continue;
>> +
>> +			igt_output_set_pipe(output, pipe);
>> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +			mode = igt_output_get_mode(output);
>> +			igt_create_pattern_fb(display->drm_fd,
>> +						mode->hdisplay, mode->vdisplay,
>> +						DRM_FORMAT_XRGB8888,
>> +						DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
>> +
>> +			/* Set a valid fb as some debugfs like to
>> +			 * inspect it on a active pipe
>> +			 */
>> +			igt_plane_set_fb(primary, &fb[pipe]);
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (display->is_atomic)
>> +		ret = igt_display_try_commit_atomic(display,
>> +				DRM_MODE_ATOMIC_TEST_ONLY |
>> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +				NULL);
>> +	else
>> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>> +
>> +	if (ret) {
>> +		igt_output_t *output;
>> +		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
>> +
>> +		igt_require_f(found, "No valid mode combo found.\n");
>> +
>> +		for_each_connected_output(display, output)
>> +			igt_output_set_pipe(output, PIPE_NONE);
>> +
>> +		goto retry;
>> +	}
>> +
>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>> +}
>> +
>> +/**
>> + * bool igt_kms_all_displays_off: Try to turn off all heads
>> + * @display: pointer to the igt_display structure
>> + *
>> + * Returns: void
>> + */
>> +static void igt_display_all_off(igt_display_t *display)
>> +{
>> +	enum pipe pipe;
>> +	igt_output_t *output;
>> +	igt_plane_t *plane;
>> +
>> +	for_each_connected_output(display, output)
>> +		igt_output_set_pipe(output, PIPE_NONE);
>> +
>> +	for_each_pipe(display, pipe)
>> +		for_each_plane_on_pipe(display, pipe, plane)
>> +			igt_plane_set_fb(plane, NULL);
>> +
>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>> +}
>> +
>> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
>> +
>> +igt_main
>> +{
>> +	int debugfs = -1;
>> +	igt_display_t *display;
>> +	int fd = -1;
>> +	igt_dir_t *igt_dir = NULL;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver_master(DRIVER_ANY);
>> +		debugfs = igt_debugfs_dir(fd);
>> +		igt_require(debugfs >= 0);
>> +
>> +		igt_dir = igt_dir_create(debugfs);
>> +		igt_require(igt_dir);
>> +
>> +		kmstest_set_vt_graphics_mode();
>> +
>> +		display = calloc(1, sizeof(*display));
>> +		igt_display_require(display, fd);
>> +	}
>> +
>> +	igt_subtest("off-read-all") {
>> +		igt_display_all_off(display);
>> +
>> +		igt_dir_scan_dirfd(igt_dir, -1);
>> +		igt_dir_process_files(igt_dir, NULL, NULL);
>> +	}
>> +
>> +	igt_subtest("on-read-all") {
>> +		/* try to light all pipes */
>> +		igt_display_all_on(display);
>> +
>> +		igt_dir_scan_dirfd(igt_dir, -1);
>> +		igt_dir_process_files(igt_dir, NULL, NULL);
>> +	}
>> +
>> +	igt_fixture {
>> +		igt_display_fini(display);
>> +		close(debugfs);
>> +		drm_close_driver(fd);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index fa62cbeb9..99dbd4feb 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -1,6 +1,7 @@
>>  test_progs = [
>>  	'core_auth',
>>  	'core_debugfs',
>> +	'core_debugfs_heads_power',
>>  	'core_getclient',
>>  	'core_getstats',
>>  	'core_getversion',
>> -- 
>> 2.43.0
>>

