Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3777BC531FC
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 08:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53ED10E028;
	Fri, 24 Jul 2026 08:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6j0GpZ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213D310E028
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784883077; x=1816419077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MFOIpNkO921DmioiEMmcW/CBANAg+1vH+kbJBeZYN3E=;
 b=m6j0GpZ+tDyB8LxvKUTi2dR5dBTa+s3cF7fw/3xr8GL5BZ/elJD+p7lc
 NKqDdg0dPAt2ZLU2peV5HmcHrpkjotCXvSe6rC6ONYSmFyrCbaHMAPcnJ
 +9VP/fb4iujuMYoXLWnKGQSRqRzwpXksf7YV7ln7aC6uRyFUpchMpQk9y
 2A4Ih0nYD8zi2NWjxEZq1JdnfATYyRr7SqBAk/bP5kyaIuMUX9IYKmDx7
 CiUKPC68E36cYn8/83RCvQs9agzauxFbXeFNgVBHdIakPVrVgvLa2zdPa
 FyofRDo0Rzw4McXUE32zrwFpqsVJNv1Xp9Xjrpm80YFDWRHfuP5fMeh2V A==;
X-CSE-ConnectionGUID: nVEuGnmTRieV96oS34kfjA==
X-CSE-MsgGUID: 51BzHFg7S1qBPyxzeoL1BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89439086"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="89439086"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 01:51:17 -0700
X-CSE-ConnectionGUID: 8HnLlhhzT8WrNNEYsQOnGQ==
X-CSE-MsgGUID: EMa8EWUAQGeKO2FOTYSUHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="252331846"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:51:15 -0700
Date: Fri, 24 Jul 2026 10:51:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, daniele.ceraolospurio@intel.com
Subject: Re: [PATCH i-g-t v3] tests/xe_debugfs: add uc debugfs validation and
 read tests
Message-ID: <20260724085101.2itnqn6n4hwbhe2i@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, daniele.ceraolospurio@intel.com
References: <20260717075248.2087974-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717075248.2087974-1-sobin.thomas@intel.com>
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

Hi Sobin,
On 2026-07-17 at 07:52:48 +0000, Sobin Thomas wrote:

I have only a nit about subject, please use 'intel/' in prefix,
also imho you could make it shorter:

[PATCH i-g-t v3] tests/intel/xe_debugfs: add uc debugfs validation


Regards,
Kamil

> Add coverage for GT-specific debugfs entries by introducing a new
> gt-dir subtest that validates the presence of required files in the
> GT debugfs hierarchy. The test currently verifies the existence of
> the following debugfs nodes:
> 
>   - uc/gsc_info
>   - uc/huc_info
>   - uc/guc_info
>   - uc/guc_pc
> 
> These additions improve validation of Xe GT debugfs interfaces and
> provide basic functional coverage for the GSC information debugfs node.
> 
> v2: Add support for guc and huc info (Daniele)
> v3: Added checks for the device nodes.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 120 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index da482157e..e7d89ec9d 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -451,6 +451,32 @@ skip:
>  	igt_skip("Failed to open debugfs directory\n");
>  }
>  
> +/**
> + * SUBTEST: gt-dir
> + * Description: Check required debugfs devnodes exist in the GT debugfs directory
> + */
> +static void test_gt_dir(struct xe_device *xe_dev, unsigned int gt)
> +{
> +	const struct check_entry expected_files[] = {
> +		{ "uc/gsc_info", O_RDONLY },
> +		{ "uc/huc_info", O_RDONLY },
> +		{ "uc/guc_info", O_RDONLY },
> +		{ "uc/guc_pc", O_RDONLY },
> +	};
> +	int debugfs_fd = igt_debugfs_gt_dir(xe_dev->fd, gt);
> +	int missing_count;
> +
> +	igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");
> +
> +	missing_count = debugfs_validate_entries(xe_dev, debugfs_fd, expected_files,
> +						 ARRAY_SIZE(expected_files));
> +
> +	close(debugfs_fd);
> +
> +	igt_fail_on_f(missing_count > 0, "Found %d missing debugfs files (see warnings above)\n",
> +		      missing_count);
> +}
> +
>  /**
>   * SUBTEST: tile-dir
>   * Description: Check required debugfs devnodes exist in the tile debugfs directory
> @@ -595,6 +621,71 @@ static void check_gt_reg_sr(int fd, int gt)
>  	igt_assert_eq(problems, 0);
>  }
>  
> +static void test_uc_info_read(struct xe_device *xe_dev, unsigned int gt, const char *node,
> +			      bool mandatory)
> +{
> +	int debugfs_fd = igt_debugfs_gt_dir(xe_dev->fd, gt);
> +	char *buf;
> +
> +	debugfs_fd = igt_debugfs_gt_dir(xe_dev->fd, gt);
> +	igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");
> +
> +	if (faccessat(debugfs_fd, node, F_OK, 0) < 0) {
> +		close(debugfs_fd);
> +		igt_fail_on_f(mandatory,
> +			      "Mandatory debugfs node %s is missing on GT-%u\n",
> +			      node, gt);
> +
> +		igt_skip("%s debugfs node not present on GT-%u\n",
> +			 node, gt);
> +	}
> +	buf = igt_sysfs_get(debugfs_fd, node);
> +
> +	igt_info("Successfully read %s: %zu bytes\n%s\n", node, strlen(buf), buf);
> +
> +	close(debugfs_fd);
> +	igt_assert_f(buf, "Failed to read %s debugfs file\n", node);
> +	igt_assert_f(buf[0] != '\0', "%s debugfs file is empty\n", node);
> +	free(buf);
> +}
> +
> +/**
> + * SUBTEST: gsc-info-read
> + * Description: Check GSC info debugfs devnode contents
> + */
> +static void test_gsc_info_read(struct xe_device *xe_dev, unsigned int gt)
> +{
> +	test_uc_info_read(xe_dev, gt, "uc/gsc_info", false);
> +}
> +
> +/**
> + * SUBTEST: huc-info-read
> + * Description: Check HUC info debugfs devnode contents
> + */
> +static void test_huc_info_read(struct xe_device *xe_dev, unsigned int gt)
> +{
> +	test_uc_info_read(xe_dev, gt, "uc/huc_info", false);
> +}
> +
> +/**
> + * SUBTEST: guc-pc-read
> + * Description: Read the guc pc info from the debugfs node contents
> + */
> +
> +static void test_guc_pc_info(struct xe_device *xe_dev, unsigned int gt)
> +{
> +	test_uc_info_read(xe_dev, gt, "uc/guc_pc", true);
> +}
> +
> +/**
> + * SUBTEST: guc-info-read
> + * Description: Check GUC info debugfs devnode contents
> + */
> +static void test_guc_info_read(struct xe_device *xe_dev, unsigned int gt)
> +{
> +	test_uc_info_read(xe_dev, gt, "uc/guc_info", true);
> +}
> +
>  const char *help_str =
>  	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
>  
> @@ -619,8 +710,9 @@ static int opt_handler(int option, int option_index, void *input)
>  int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  {
>  	struct xe_device *xe_dev;
> +	unsigned int gt;
>  	unsigned int t;
> -	int fd = -1, gt;
> +	int fd = -1;
>  
>  	igt_fixture() {
>  		fd = drm_open_driver_master(DRIVER_XE);
> @@ -633,6 +725,12 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	igt_subtest("root-dir")
>  		test_root_dir(xe_dev);
>  
> +	igt_describe("Check required debugfs devnodes exist in the GT debugfs directory.");
> +	igt_subtest_with_dynamic("gt-dir")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%u", gt)
> +				test_gt_dir(xe_dev, gt);
> +
>  	igt_describe("Check required debugfs devnodes exist in the tile debugfs directory.");
>  	igt_subtest_with_dynamic("tile-dir")
>  			xe_for_each_tile(fd, t)
> @@ -648,6 +746,26 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  			igt_dynamic_f("gt%d", gt)
>  				check_gt_reg_sr(fd, gt);
>  
> +	igt_describe("Check GSC info debugfs devnode contents.");
> +	igt_subtest_with_dynamic("gsc-info-read")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt-%u", gt)
> +				test_gsc_info_read(xe_dev, gt);
> +	igt_describe("Read GuC information from debugfs.");
> +	igt_subtest("guc-info-read")
> +		xe_for_each_gt(fd, gt)
> +			test_guc_info_read(xe_dev, gt);
> +
> +	igt_describe("Read HuC information from debugfs.");
> +	igt_subtest("huc-info-read")
> +		xe_for_each_gt(fd, gt)
> +			test_huc_info_read(xe_dev, gt);
> +
> +	igt_describe("Read guc pc information from debugfs.");
> +	igt_subtest("guc-pc-read")
> +		xe_for_each_gt(fd, gt)
> +			test_guc_pc_info(xe_dev, gt);
> +
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.52.0
> 
