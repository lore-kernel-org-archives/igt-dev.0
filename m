Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949A9C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 18:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4590B10E095;
	Thu, 12 Jun 2025 18:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2ZNp9Rv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAABD10E095
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749752231; x=1781288231;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ONtLgFq3bQsaj/YNGJBSEQXv2F/FXKWxERsP17TT2HY=;
 b=d2ZNp9RvBIbkTSsSPluWFlEGLb3PacCGVi+bNxWlOqAVfyGc/zFa+tFK
 0ha0KDdyjvnlEhxktNhSvM1EYfSSBjekjhvbkKYvB36LjPDoSf6rIB69l
 KPb4TwQ3vCFSN4wtOyox0RHEt5UZTXJi1BirYxkBK9FJtMNB/rSOByii3
 ubyYzZZn3eaVzkIEqgSbUZQorW7NEdl7zf0tkn25FN95aZ5m1cTSGvDyL
 w9dsxybJqOLXPMR7O0cWcuQHkbggDyA0AnIm30MYfrCwvwUgmjQGCmzFi
 bkT+f+8e4RoqYF68irR4Rt6LSlLnb4QOH+KlKH+IIMFcC5kAK0FI1rpvd A==;
X-CSE-ConnectionGUID: zdqfQkPDTzKRx+3LhewaQQ==
X-CSE-MsgGUID: v637/DTbTnCbgrCKdwkpFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="54580380"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="54580380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:17:10 -0700
X-CSE-ConnectionGUID: bN41kn0jTKK7NDtKrlA+qw==
X-CSE-MsgGUID: OPFGUYECQLqLZKONe419CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147458686"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:17:07 -0700
Date: Thu, 12 Jun 2025 20:17:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
Subject: Re: [PATCH i-g-t 3/5] Add tests: core_debugfs and
 core_debugfs_display_on_off
Message-ID: <20250612181705.kxxlepa624avuodb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
References: <20250522110126.628720-1-peter.senna@linux.intel.com>
 <20250522110126.628720-4-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250522110126.628720-4-peter.senna@linux.intel.com>
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
On 2025-05-22 at 13:00:46 +0200, Peter Senna Tschudin wrote:

I have few nits, it is not full review.

imho subject should be:

[PATCH i-g-t 3/5] tests: Add core_debugfs/_display_on_off

or

[PATCH i-g-t 3/5] tests: Add core_debugfs/_display

Or consider splitting this into two separate patches.
Also please check all 2...5 patches with checkpatch.pl
and fix alignemnt/whitespace and 'Comparison to NULL'.

Regards,
Kamil

> Introduces two GPU-agnostic tests, core_debugfs and
> core_debugfs_display_on_off. These tests are designed to function with
> any GPU, not limited to i915 and Xe.
> 
> core_debugfs: Attempts to open every file in debugfs associated with the
> GPU.
> 
> core_debugfs_display_on_off: Powers on all available displays before
> reading debugfs files, and then powers off all displays before reading
> the files again.
> 
> Cc: marcin.bernatowicz@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: ewelina.musial@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  docs/code_coverage.md                    |  18 +--
>  scripts/code_cov_selftest.sh             |   2 +-
>  tests/core_debugfs.c                     |  54 +++++++
>  tests/core_debugfs_display_on_off.c      | 171 +++++++++++++++++++++++
>  tests/intel-ci/fast-feedback.testlist    |   1 +
>  tests/intel-ci/xe-fast-feedback.testlist |   2 +
>  tests/meson.build                        |   2 +
>  7 files changed, 240 insertions(+), 10 deletions(-)
>  create mode 100644 tests/core_debugfs.c
>  create mode 100644 tests/core_debugfs_display_on_off.c
> 
> diff --git a/docs/code_coverage.md b/docs/code_coverage.md
> index 031611e69..236dbc70b 100644
> --- a/docs/code_coverage.md
> +++ b/docs/code_coverage.md
> @@ -162,23 +162,23 @@ For each script, the igt_runner passes just one parameter: the results
>  directory + the test name.
>  
>  For instance, if it is needed to run a test called
> -`intel_sysfs_debugfs (i915-debugfs-read-all-entries)` using `code_cov_capture`
> +`core_debugfs (debugfs-read-all-entries)` using `code_cov_capture`
>  parameter, e. g.:
>  
>  ```
> -$ echo "igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries" > my.testlist
> +$ echo "igt@core_debugfs@debugfs-read-all-entries" > my.testlist
>  $ ./scripts/run-tests.sh -T my.testlist -k ~/linux -c code_cov_capture -P
>  Found test list: "/basedir/igt/build/tests/test-list.txt"
> -[31410.499969] [1/1] intel_sysfs_debugfs (i915-debugfs-read-all-entries)
> +[31410.499969] [1/1] core_debugfs (debugfs-read-all-entries)
>  [31411.060446] Storing code coverage results...
> -[31418.01]     Code coverage wrote to /basedir/igt/results/code_cov/intel_sysfs_debugfs_i915_debugfs_read_all_entries.info
> +[31418.01]     Code coverage wrote to /basedir/igt/results/code_cov/core_debugfs_debugfs_read_all_entries.info
>  Done.
>  ```
>  
>  The script will be called as:
>  
>  ```
> -code_cov_capture results/code_cov/intel_sysfs_debugfs_i915_debugfs_read_all_entries
> +code_cov_capture results/code_cov/core_debugfs_debugfs_read_all_entries
>  ```
>  
>  Please notice that any character that it is not a number nor a letter at the
> @@ -376,7 +376,7 @@ OUT_DIR="${HOME}/results"
>  
>  mkdir -p $OUT_DIR/html
>  
> -echo "igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries" > $TESTLIST
> +echo "igt@core_debugfs@debugfs-read-all-entries" > $TESTLIST
>  echo "igt@core_auth@basic-auth" >> $TESTLIST
>  echo "igt@gem_exec_basic@basic" >> $TESTLIST
>  
> @@ -401,8 +401,8 @@ genhtml -q -s --legend --branch-coverage $OUT_DIR/results.info
>  Running such script produces the following output:
>  
>  ```
> -[3622.993304] [1/3] intel_sysfs_debugfs (i915-debugfs-read-all-entries)
> -[3631.95]     Code coverage wrote to results/code_cov/intel_sysfs_debugfs_i915_debugfs_read_all_entries.info
> +[3622.993304] [1/3] core_debugfs (debugfs-read-all-entries)
> +[3631.95]     Code coverage wrote to results/code_cov/core_debugfs_debugfs_read_all_entries.info
>  [3626.217016] Storing code coverage results...
>  [3631.957998] [2/3] core_auth (basic-auth)
>  [3638.03]     Code coverage wrote to results/code_cov/core_auth_basic_auth.info
> @@ -419,7 +419,7 @@ core_auth_basic_auth.info:
>  Ignored......: non-drm headers and source files where none of its code ran.
>  Source files.: 23.27% (165 of 709 total), 29.57% (165 of 558 filtered)
>  
> -intel_sysfs_debugfs_i915_debugfs_read_all_entries.info:
> +core_debugfs_debugfs_read_all_entries.info:
>    lines......: 19.3% (20266 of 104802 lines)
>    functions..: 17.5% (1922 of 10971 functions)
>    branches...: 12.7% (9462 of 74555 branches)
> diff --git a/scripts/code_cov_selftest.sh b/scripts/code_cov_selftest.sh
> index bc5ef7458..374068140 100755
> --- a/scripts/code_cov_selftest.sh
> +++ b/scripts/code_cov_selftest.sh
> @@ -13,7 +13,7 @@ if [ -z "$IGT_KERNEL_TREE" ] ; then
>          exit 1
>  fi
>  
> -TEST="igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries"
> +TEST="igt@core_debugfs@debugfs-read-all-entries"
>  
>  TESTLIST="my_tests.testlist"
>  GATHER="scripts/code_cov_gather_on_test.py"
> diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
> new file mode 100644
> index 000000000..a2f9a8dac
> --- /dev/null
> +++ b/tests/core_debugfs.c
> @@ -0,0 +1,54 @@
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
> + * TEST: debugfs test
> + * Description: Read entries from debugfs
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: uapi
> + *
> + * SUBTEST: debugfs-read-all-entries
> + * Description: Read all entries from debugfs path validating debugfs entries
> + */
> +
> +IGT_TEST_DESCRIPTION("Read entries from debugfs");
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
> +		igt_require(igt_dir != NULL);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	igt_describe("Read all entries from debugfs path.");
> +	igt_subtest("debugfs-read-all-entries") {
> +		igt_dir_scan_dirfd(igt_dir, -1);
> +		igt_dir_process_files(igt_dir, NULL, NULL);
> +	}
> +
> +	igt_fixture {
> +		igt_dir_destroy(igt_dir);
> +		close(debugfs);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/core_debugfs_display_on_off.c b/tests/core_debugfs_display_on_off.c
> new file mode 100644
> index 000000000..7f2ebc66a
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
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: uapi
> + *
> + * SUBTEST: debugfs-read-all-entries-display-off
> + * Description: Read all debugfs entries with display off.
> + *
> + * SUBTEST: debugfs-read-all-entries-display-on
> + * Description: Read all debugfs entries with display on.
> + */
> +
> +/** bool igt_kms_all_displays_on: Try to turn on all displays
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
> +		igt_require(igt_dir != NULL);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	igt_subtest_group
> +		kms_tests(fd, igt_dir);
> +
> +	igt_fixture {
> +		close(debugfs);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index db0dcb458..9d421f402 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -3,6 +3,7 @@ igt@i915_module_load@load
>  
>  # Keep alphabetically sorted by default
>  igt@core_auth@basic-auth
> +igt@core_debugfs@debugfs-read-all-entries
>  igt@fbdev@eof
>  igt@fbdev@info
>  igt@fbdev@nullptr
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 536c25836..c8bfc7fa7 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -7,6 +7,8 @@ igt@fbdev@nullptr
>  igt@fbdev@read
>  igt@fbdev@write
>  
> +igt@core_debugfs@debugfs-read-all-entries
> +
>  igt@kms_addfb_basic@addfb25-4-tiled
>  igt@kms_addfb_basic@addfb25-bad-modifier
>  igt@kms_addfb_basic@addfb25-modifier-no-flag
> diff --git a/tests/meson.build b/tests/meson.build
> index e2cef3de9..97633a53b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -1,5 +1,7 @@
>  test_progs = [
>  	'core_auth',
> +	'core_debugfs',
> +	'core_debugfs_display_on_off',
>  	'core_getclient',
>  	'core_getstats',
>  	'core_getversion',
> -- 
> 2.43.0
> 
