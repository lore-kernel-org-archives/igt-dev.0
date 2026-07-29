Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DC4C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9670910E04E;
	Wed, 29 Jul 2026 11:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QuQoDbO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4BE10EBB9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785325985; x=1816861985;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VTf6PC72QMl9K8IKe1fvPdeHN3aLURpRac5l1M53bQE=;
 b=QuQoDbO54nDH6VxAGaPGxhsHsOGBtUegJl681Qur1gXhETcGMujZhNhn
 V43rptw6Pt0pphkPCCoGUiKuUB7dUTapvcLwxQ/9xK0tRLLWT+lH56tTI
 O7jR4rSVB3TTagkPEUUYp4Y81NuDUCNDoOJaytNlJDiW8bEThK+KmrDU/
 G0WEcZzEYGU1acN6jodUmKml0d6DTEHb1BPntJ8fJgwnsiqu8PjUv4KIo
 kVqnVAzQRHFMRfupb/Eq0jfD8Ilj7hiX+DdtpC9JDC/vI6GJcXdGqCAAS
 gg+kmF0MrQyOyvAllo1dcEEbqIuN5DsGzpXVmC2RAbEV0GVg7NdWB2ikG Q==;
X-CSE-ConnectionGUID: 2LkRcEjoR+OLw8LTcJN0SA==
X-CSE-MsgGUID: URGXQZyVSgiBkDqgwummXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88467571"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="88467571"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:53:05 -0700
X-CSE-ConnectionGUID: 2T1dWcvFQT6RRPZFpAAToA==
X-CSE-MsgGUID: /fgLsG7dQcm7DwWrpMj+Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256064849"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 04:53:03 -0700
Date: Wed, 29 Jul 2026 13:53:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH] tests/intel/xe_debugfs: add GT-level debugfs coverage
Message-ID: <20260729115301.ilwn35x47m7qxozw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20260728061730.1296399-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728061730.1296399-1-smitha.balasubramanyam@intel.com>
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

Hi Smitha,
On 2026-07-28 at 11:47:30 +0530, Smitha Balasubramanyam wrote:
> Extend xe_debugfs with subtests exercising the GT-level debugfs
> attributes exposed by the Xe driver.
> 
> Subtests:
>  - gt-dir: presence and content check for unconditional GT attrs
>  - gt-default-lrc: reads per-engine-class default LRC attrs; skips
>    engine classes absent on the GT, fails if none are found
>  - gt-dir-pf-only: presence and content check for PF-only attrs;
>    skipped entirely on VF
>  - gt-stats-write: writes an invalid key to stats and verifies the
>    kernel rejects it with an error; confirms stats remains readable
>    after the rejected write
> 
> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 150 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 147 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index da482157e..74c9d7b0b 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -9,6 +9,7 @@
>  #include "igt.h"
>  #include "igt_debugfs.h"
>  #include "igt_dir.h"
> +#include "igt_sriov_device.h"

For SRIOV related changes +cc few devs:

Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>



Regards,
Kamil

>  #include "igt_sysfs.h"
>  #include "xe/xe_query.h"
>  
> @@ -16,6 +17,8 @@ struct {
>  	bool warn_on_not_hit;
>  } opt = { 0 };
>  
> +static int *gt_dirs;
> +
>  /**
>   * TEST: Xe debugfs test
>   * Description: Xe-specific debugfs tests. These are complementary to the
> @@ -30,6 +33,20 @@ struct {
>   *
>   * SUBTEST: check-gt-reg-sr
>   * Description: Check the reg_sr list associated with GTs for missing reg values
> + *
> + * SUBTEST: gt-dir
> + * Description: Check GT debugfs attrs present on all contexts for each GT.
> + *
> + * SUBTEST: gt-default-lrc
> + * Description: Validate default LRC content for each engine class present on
> + * each GT. Engine classes absent on the GT are skipped.
> + *
> + * SUBTEST: gt-dir-pf-only
> + * Description: Check that PF-only GT debugfs attrs are present for each GT on PF.
> + *
> + * SUBTEST: gt-stats-write
> + * Description: Write an invalid payload to the stats debugfs attribute for
> + * each GT to verify the kernel rejects malformed input with an error.
>   */
>  
>  IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
> @@ -166,10 +183,12 @@ static bool validate_string(int dirfd, const char *file_name, const char *expect
>  		return false;
>  	}
>  
> -	if (expected_str)
> +	if (expected_str) {
>  		igt_info("Successfully read %s: found '%s'\n", file_name, expected_str);
> -	else
> -		igt_info("Successfully read %s: %zd bytes\n%s\n", file_name, strlen(buf), buf);
> +	} else {
> +		igt_info("Successfully read %s: %zd bytes\n", file_name, strlen(buf));
> +		igt_debug("%s\n", buf);
> +	}
>  
>  	return true;
>  }
> @@ -595,6 +614,84 @@ static void check_gt_reg_sr(int fd, int gt)
>  	igt_assert_eq(problems, 0);
>  }
>  
> +static void test_gt_dir(struct xe_device *xe_dev, int gt)
> +{
> +	const struct check_entry expected_files[] = {
> +		{ "register-save-restore", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "hwconfig",              O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "stats",                 O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "force_reset",           O_WRONLY },
> +		{ "force_reset_sync",      O_WRONLY },
> +	};
> +	int missing_count = debugfs_validate_entries(xe_dev, gt_dirs[gt], expected_files,
> +						     ARRAY_SIZE(expected_files));
> +
> +	igt_fail_on_f(missing_count > 0,
> +		      "GT%d: %d GT debugfs attrs missing (see warnings above)\n",
> +		      gt, missing_count);
> +}
> +
> +static void test_gt_default_lrc(int gt)
> +{
> +	static const char * const lrc_attrs[] = {
> +		"default_lrc_rcs",
> +		"default_lrc_ccs",
> +		"default_lrc_bcs",
> +		"default_lrc_vcs",
> +		"default_lrc_vecs",
> +	};
> +	int engines_present = 0;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(lrc_attrs); i++) {
> +		if (!file_in_dir_exists(gt_dirs[gt], lrc_attrs[i], O_RDONLY)) {
> +			igt_info("GT%d: %s absent\n", gt, lrc_attrs[i]);
> +			continue;
> +		}
> +
> +		engines_present++;
> +		igt_assert_f(validate_debugfs_file(gt_dirs[gt], lrc_attrs[i],
> +						   O_RDONLY, VALIDATE_NON_EMPTY, NULL),
> +			     "GT%d: %s is empty or unreadable\n", gt, lrc_attrs[i]);
> +	}
> +
> +	igt_assert_f(engines_present > 0,
> +		     "GT%d: no default_lrc_* attrs found; expected at least one engine\n",
> +		     gt);
> +}
> +
> +static void test_gt_dir_pf_only(struct xe_device *xe_dev, int gt)
> +{
> +	const struct check_entry expected_files[] = {
> +		{ "hw_engines", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "steering",   O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +	};
> +	int missing_count = debugfs_validate_entries(xe_dev, gt_dirs[gt], expected_files,
> +						     ARRAY_SIZE(expected_files));
> +
> +	igt_fail_on_f(missing_count > 0,
> +		      "GT%d: %d PF-only GT debugfs attrs missing (see warnings above)\n",
> +		      gt, missing_count);
> +}
> +
> +static void test_gt_stats_write(int gt)
> +{
> +	char buf[4096];
> +	int len, wret;
> +
> +	len = igt_sysfs_read(gt_dirs[gt], "stats", buf, sizeof(buf) - 1);
> +	igt_assert_f(len > 0,
> +		     "GT%d: pre-write stats read failed or empty (%d)\n", gt, len);
> +
> +	wret = igt_sysfs_write(gt_dirs[gt], "stats", "invalid_key 0\n", strlen("invalid_key 0\n"));
> +	igt_assert_f(wret < 0,
> +		     "GT%d: stats write accepted invalid key (returned %d, expected error)\n",
> +		     gt, wret);
> +
> +	len = igt_sysfs_read(gt_dirs[gt], "stats", buf, sizeof(buf) - 1);
> +	igt_assert_f(len > 0,
> +		     "GT%d: stats still readable after rejected write (%d)\n", gt, len);
> +}
> +
>  const char *help_str =
>  	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
>  
> @@ -620,13 +717,28 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  {
>  	struct xe_device *xe_dev;
>  	unsigned int t;
> +	bool is_vf = false;
>  	int fd = -1, gt;
> +	int max_gt;
>  
>  	igt_fixture() {
>  		fd = drm_open_driver_master(DRIVER_XE);
>  		xe_dev = xe_device_get(fd);
>  		igt_assert_f(xe_dev, "Failed to get xe device\n");
>  		kmstest_set_vt_graphics_mode();
> +		is_vf = intel_is_vf_device(fd);
> +		max_gt = xe_dev_max_gt(fd);
> +
> +		gt_dirs = malloc((max_gt + 1) * sizeof(*gt_dirs));
> +		igt_assert(gt_dirs);
> +		for (int i = 0; i <= max_gt; i++)
> +			gt_dirs[i] = -1;
> +		xe_for_each_gt(fd, gt) {
> +			gt_dirs[gt] = igt_debugfs_gt_dir(fd, gt);
> +			igt_assert_f(gt_dirs[gt] >= 0,
> +				     "GT%d: failed to open GT debugfs directory\n",
> +				     gt);
> +		}
>  	}
>  
>  	igt_describe("Check required debugfs devnodes exist in the root debugfs directory.");
> @@ -643,12 +755,44 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	igt_subtest("info-read")
>  		test_info_read(xe_dev);
>  
> +	igt_describe("Check GT debugfs attrs present on all contexts for each GT.");
> +	igt_subtest_with_dynamic("gt-dir")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%d", gt)
> +				test_gt_dir(xe_dev, gt);
> +
> +	igt_describe("Validate default LRC content for each engine class present on each GT.");
> +	igt_subtest_with_dynamic("gt-default-lrc")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%d", gt)
> +				test_gt_default_lrc(gt);
> +
> +	igt_describe("Check that PF-only GT debugfs attrs are present for each GT on PF.");
> +	igt_subtest_with_dynamic("gt-dir-pf-only") {
> +		igt_skip_on_f(is_vf, "PF-only attributes not present on VF\n");
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%d", gt)
> +				test_gt_dir_pf_only(xe_dev, gt);
> +	}
> +
> +	igt_describe("Write an invalid payload to the stats debugfs attribute for each GT.");
> +	igt_subtest_with_dynamic("gt-stats-write") {
> +		igt_require(geteuid() == 0);
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%d", gt)
> +				test_gt_stats_write(gt);
> +	}
> +
>  	igt_subtest_with_dynamic("check-gt-reg-sr")
>  		xe_for_each_gt(fd, gt)
>  			igt_dynamic_f("gt%d", gt)
>  				check_gt_reg_sr(fd, gt);
>  
>  	igt_fixture() {
> +		xe_for_each_gt(fd, gt)
> +			if (gt_dirs[gt] >= 0)
> +				close(gt_dirs[gt]);
> +		free(gt_dirs);
>  		drm_close_driver(fd);
>  	}
>  
> -- 
> 2.43.0
> 
