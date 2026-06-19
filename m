Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B78CD98F6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 11:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC0F10F54A;
	Fri, 19 Jun 2026 11:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtrGmQAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E31D10E08D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781869334; x=1813405334;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KxeTC3j3JcWe5eadQ5Rvd+WBSXwCSVgoTmy/XXOr2qQ=;
 b=GtrGmQApHsxGgjEN9/jzfyDOF/vlqvySlibGAE3WXmxYaNM7IusZBO8s
 hcBTYpjuN6cntQB42UhCkjLo03Bp2KgsTueabHaTG3XWWDz0npZboZBhp
 D1JTvcDLUZuZgO+bo4K62CJjxGfNUywl7i9rQIxuZ6AMG8DRpZwzEoTHf
 Js/gE8MWCYcYvRgp7PGsvOgGlr5RxQzQGiRb8xdLZolVZSYf/sLubmqhM
 coMxBGSEr8sizsDSQHfliqKzReFgL8fqtDuPqS4IKQV0PBLv0JYsWQoG3
 HwFLyoCgw2Qffa5pOkcuJG2mjse2/6ExJQoWHvNmWf0buKqE3DOKVMlm2 g==;
X-CSE-ConnectionGUID: D41t7/DhTL6jLJ9jSnnabg==
X-CSE-MsgGUID: XJPxQswbRZCBg2jOQfQANQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="105515834"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="105515834"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:42:14 -0700
X-CSE-ConnectionGUID: Fyks1hSkRqCLeEW1N66kEw==
X-CSE-MsgGUID: SrdTUt4lQcmkHkpYDQ4q+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="252940433"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 04:42:13 -0700
Date: Fri, 19 Jun 2026 13:42:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 piotr.piorkowski@intel.com
Subject: Re: [PATCH i-g-t v4 1/2] tests/intel/xe_debugfs: Add debugfs
 optional entry validation
Message-ID: <20260619114210.2t32udgcuw322vsk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 piotr.piorkowski@intel.com
References: <20260619083921.637427-1-sobin.thomas@intel.com>
 <20260619083921.637427-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260619083921.637427-2-sobin.thomas@intel.com>
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
On 2026-06-19 at 08:39:20 +0000, Sobin Thomas wrote:
> Extend the root-dir subtest to validate additional optional Xe debugfs
> entries. Optional entries are those that may not be present on all
> platforms or configurations — their absence is not treated as a failure.
> Validate:
> 
> - dgfx_pkg_residencies: Counter reads are non empty
> - dgfx_pcie_link_residencies: PCIE LINK string content
> - sriov_info: entry is non-empty
> - workarounds: entry is non-empty
> - atomic_svm_timeslice_ms: integer read/write
> - poor_man_system_atomic_support: boolean read/write
> - disable_late_binding: boolean read/write
> 
> v2: Fixed the optional file check and added fail count.
>     Replaced igt_debug with igt_info in few places  (Kamil)
> v3: Removed uniused condition params and restored has_vram() usage.
>     Used igt_info() for validation failure logs.
>     Kept only new optional debugfs entries in this patch. (Kamil)
> v4: Split scanf and check for the negative value. (Kamil)
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 182 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 179 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 587e3e785..43c436a77 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -39,11 +39,23 @@ IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
>  	__m && ((__i) = __builtin_ctz(__m), 1);	\
>  	__m &= __m - 1)
>  
> +/* Validation types for debugfs read tests */
> +enum debugfs_validate_type {
> +	VALIDATE_NONE,		/* Just check file exists */
> +	VALIDATE_NON_EMPTY,	/* Just check buffer is not empty */
> +	VALIDATE_CONTAINS_STR,	/* Check buffer contains expected string */
> +	VALIDATE_INT_GE_ZERO,	/* Parse as integer, verify >= 0 */
> +	VALIDATE_BOOL,		/* Check bool value (0 or 1) */
> +};
> +
>  struct check_entry {
>  	const char *name_fmt;
>  	int mode;
>  	bool (*condition)(struct xe_device *xe_dev);
>  	unsigned int (*iter_mask)(struct xe_device *xe_dev);
> +	bool optional;
> +	enum debugfs_validate_type validate;
> +	const char *expected_str;
>  };
>  
>  static unsigned int gt_iter_mask(struct xe_device *xe_dev)
> @@ -131,6 +143,116 @@ static bool find_not_tested_files(int dir_fd, struct igt_list_head *hit_entries)
>  	return found_not_tested;
>  }
>  
> +/* Validate that debugfs buffer is non-empty or contains expected string */
> +static bool validate_string(int dirfd, const char *file_name, const char *expected_str)
> +{
> +	char buf[4096];
> +	int ret = 0;
> +
> +	ret = igt_sysfs_read(dirfd, file_name, buf, sizeof(buf) - 1);
> +	if (ret < 0)
> +		return false;
> +	buf[ret] = '\0';
> +
> +	/* Check for empty buffer */
> +	if (strlen(buf) == 0) {
> +		igt_info("Empty output from %s\n", file_name);
> +		return false;
> +	}
> +
> +	/* If expecting specific string, verify it's present */
> +	if (expected_str && !strstr(buf, expected_str)) {
> +		igt_info("Expected '%s' not found in %s\n", expected_str, file_name);
> +		return false;
> +	}
> +
> +	if (expected_str)
> +		igt_info("Successfully read %s: found '%s'\n", file_name, expected_str);
> +	else
> +		igt_info("Successfully read %s: %zd bytes\n%s\n", file_name, strlen(buf), buf);
> +
> +	return true;
> +}
> +
> +static const char *mode_to_str(int mode)
> +{
> +	switch (mode & O_ACCMODE) {
> +	case O_RDONLY: return "RO";
> +	case O_WRONLY: return "WO";
> +	case O_RDWR:   return "RW";
> +	default:       return "UNKNOWN";
> +	}
> +}
> +
> +static bool validate_bool_file(int dirfd, const char *file_name, int mode)
> +{
> +	int orig_val = 0, read_val = 0, test_val = 0;
> +
> +	if (igt_sysfs_scanf(dirfd, file_name, "%d", &orig_val) != 1)
> +		return false;
> +
> +	if (orig_val != 0 && orig_val != 1) {
> +		igt_info("Unexpected bool value: %d\n", orig_val);
> +		return false;
> +	}
> +
> +	if (mode == O_RDWR) {
> +		test_val = orig_val ? 0 : 1;
> +
> +		if (igt_sysfs_printf(dirfd, file_name, "%d", test_val) < 0)

Add igt_info about failed write.

> +			return false;
> +
> +		if (igt_sysfs_scanf(dirfd, file_name, "%d", &read_val) != 1 || read_val != test_val)
> +			return false;
> +
> +		/* Restore original value */
> +		if (igt_sysfs_printf(dirfd, file_name, "%d", orig_val) < 0) {
> +			igt_warn("Failed to restore original value for %s\n", file_name);
> +			return false;
> +		}
> +	}
> +
> +	igt_info("Successfully validated %s bool %s\n", mode_to_str(mode), file_name);
> +	return true;
> +}
> +
> +static bool validate_int_file(int dirfd, const char *file_name, int mode)
> +{
> +	int orig_val = 0, new_val = 0, read_val = 0;
> +
> +	if (igt_sysfs_scanf(dirfd, file_name, "%d", &orig_val) != 1)
> +		return false;
> +
> +	if (orig_val < 0) {
> +		igt_info("\n Incorrect value read");

Why '\n' at begin? Also inform about negative value, so
		igt_info("Unexpected negative value\n");


> +		return false;
> +	}
> +
> +	if (mode == O_RDWR) {
> +		new_val = orig_val + 1;
> +		if (new_val < 0)
> +			new_val = orig_val - 1;
> +		if (igt_sysfs_printf(dirfd, file_name, "%d", new_val) < 0)

Add igt_info about failed write.

> +			return false;
> +		if (igt_sysfs_scanf(dirfd, file_name, "%d", &read_val) != 1)
> +			return false;
> +		if (read_val != new_val)

Add igt_info about unexpected value here, you could print both.

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +			return false;
> +		/* Restore original value */
> +		if (igt_sysfs_printf(dirfd, file_name, "%d", orig_val) < 0) {
> +			igt_warn("Failed to restore original value for %s\n", file_name);
> +			return false;
> +		}
> +
> +		igt_info("Successfully validated writing int %s: %d\n",
> +			  file_name, new_val);
> +	} else {
> +		igt_info("Successfully validated reading int %s: %d\n",
> +			  file_name, orig_val);
> +	}
> +	return true;
> +}
> +
>  static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
>  {
>  	int fd = openat(dirfd, file_name, mode);
> @@ -143,6 +265,36 @@ static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
>  	return false;
>  }
>  
> +static bool validate_debugfs_file(int dirfd, const char *file_name, int mode,
> +				  enum debugfs_validate_type validate, const char *expected_str)
> +{
> +	bool result = true;
> +
> +	if (validate == VALIDATE_NONE)
> +		return true;
> +
> +	switch (validate) {
> +	case VALIDATE_NON_EMPTY:
> +		result = validate_string(dirfd, file_name, NULL);
> +		break;
> +	case VALIDATE_CONTAINS_STR:
> +		result = validate_string(dirfd, file_name, expected_str);
> +		break;
> +	case VALIDATE_INT_GE_ZERO:
> +		result = validate_int_file(dirfd, file_name, mode);
> +		break;
> +	case VALIDATE_BOOL:
> +		result = validate_bool_file(dirfd, file_name, mode);
> +		break;
> +	default:
> +		igt_warn("Unknown validate type %d for %s\n", validate, file_name);
> +		result = false;
> +		break;
> +	}
> +
> +	return result;
> +}
> +
>  /*
>   * Return: negative error code on failure, or number of missing files
>   */
> @@ -151,6 +303,7 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
>  {
>  	struct igt_list_head hit_entries;
>  	int missing_count = 0;
> +	int fail_count = 0;
>  	int err = 0;
>  
>  	IGT_INIT_LIST_HEAD(&hit_entries);
> @@ -210,9 +363,22 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
>  			}
>  
>  			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
> -				igt_warn("Missing debugfs file: %s\n", entry->name);
> -				missing_count++;
> +				if (check->optional) {
> +					igt_info("Optional entry %s not found (skipped)\n",
> +						 entry->name);
> +				} else {
> +					igt_info("Missing debugfs file: %s\n",
> +						 entry->name);
> +					missing_count++;
> +				}
> +			} else {
> +				if (!validate_debugfs_file(dir_fd, entry->name, check->mode,
> +							   check->validate, check->expected_str)) {
> +					igt_info("Fail at debugfs file: %s\n", entry->name);
> +					fail_count++;
> +				}
>  			}
> +
>  		}
>  	}
>  
> @@ -229,7 +395,10 @@ out:
>  		}
>  	}
>  
> -	return (err < 0) ? err : missing_count;
> +	if (fail_count || missing_count)
> +		igt_warn("Fails: %d missing debugfs file(s): %d\n", fail_count, missing_count);
> +
> +	return (err < 0) ? err : (missing_count + fail_count);
>  }
>  
>  /**
> @@ -240,6 +409,7 @@ static void test_root_dir(struct xe_device *xe_dev)
>  {
>  	const struct check_entry expected_files[] = {
>  		{ "clients", O_RDONLY },
> +		{ "disable_late_binding", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
>  		{ "forcewake_all", O_WRONLY },
>  		{ "gem_names", O_RDONLY },
>  		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
> @@ -247,6 +417,12 @@ static void test_root_dir(struct xe_device *xe_dev)
>  		{ "info", O_RDONLY },
>  		{ "name", O_RDONLY },
>  		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
> +		{ "poor_man_system_atomic_support", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
> +		{ "dgfx_pkg_residencies", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
> +		{ "dgfx_pcie_link_residencies", O_RDONLY, .optional = true, .validate = VALIDATE_CONTAINS_STR, .expected_str = "PCIE LINK" },
> +		{ "sriov_info", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
> +		{ "workarounds", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
> +		{ "atomic_svm_timeslice_ms", O_RDWR, .optional = true, .validate = VALIDATE_INT_GE_ZERO },
>  	};
>  	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
>  	int missing_count;
> -- 
> 2.52.0
> 
