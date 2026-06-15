Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B87CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 11:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E9010E3A8;
	Mon, 15 Jun 2026 11:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJB5vCfk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E1E10E372
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781522184; x=1813058184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YBlaaggZMDScKKA/YUO2ofJu4L9Z9em1Q8T4UIXm1FE=;
 b=IJB5vCfkqqh+YHUA5qYnug9s7BIXuK/Ic41zB4ckBOUxKDKYkXMMQ/19
 QTuOJvZMoyh6ZLD7Dvvmvea0ORaOsfHmZC8DTGaSlJKFVBfnCN7pSERoD
 OtGF3/3zHcxp/rSz3uvxwGUfDpk5gqsObN86Ht8bs5Qfm94ThG4ux6Mv2
 tzGJB/1gk+fUaAjhXB02JzsWJQnz/LxxRwMn3FfKCJN6HAfoC6/cSKpEQ
 BY9BcohKiIFVUYwSCrOHg/fe/8xrfeK37CkMtv79ulAGKSsRuF/gqwEr+
 HbIZFSW/Pq0s6s0ZF/QEMZBs2UpIBRu4EnmFMIUj4LkZ4Ox7jr6hlqDNX g==;
X-CSE-ConnectionGUID: tt8MCNI/RRSpJkETKryhmQ==
X-CSE-MsgGUID: 7e84zk6tT2CGLsX5snXBRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82270443"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82270443"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:16:23 -0700
X-CSE-ConnectionGUID: L5tS7P1SSzubayl9Hzjs6Q==
X-CSE-MsgGUID: 9Nsfew6jSEKEHvrK7ZMDUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="251721795"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 04:16:22 -0700
Date: Mon, 15 Jun 2026 13:16:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, piotr.piorkowski@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v2] tests/xe_debugfs: Add debugfs entry read/write
 validation in root-dir
Message-ID: <20260615111602.qnw46z5ijfivppfb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, piotr.piorkowski@intel.com,
 kamil.konieczny@intel.com
References: <20260615043050.603026-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615043050.603026-1-sobin.thomas@intel.com>
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
On 2026-06-15 at 04:30:50 +0000, Sobin Thomas wrote:

few minors still left, first about subject, add intel prefix:

[PATCH i-g-t v2] tests/intel/xe_debugfs: Add new optional entries validation

and then add only new optional entries, then
in 2nd patch modify existing ones (this is preferred way).

> Extend the root-dir subtest to validate additional optional Xe debugfs
> entries. Optional entries are those that may not be present on all
> platforms or configurations — their absence is not treated as a failure.
> 

Add word here:

Validate:
> - dgfx_pkg_residencies: Validate counter reads (non-empty)

and here remove s/Validate//

> - dgfx_pcie_link_residencies: Validate PCIE LINK string content

same here, and in following descriptions.

> - sriov_info: Validate entry is non-empty
> - workarounds: Validate entry is non-empty
> - atomic_svm_timeslice_ms: Validate integer read/write
> - poor_man_system_atomic_support: Validate boolean read/write
> - disable_late_binding: Validate boolean read/write
> 
> v2: Fixed the optional file check and added fail count.
>     Replaced igt_debug with igt_info in few places  (kamil)
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 198 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 184 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 587e3e785..d92e07092 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -39,11 +39,24 @@ IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
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
> -	bool (*condition)(struct xe_device *xe_dev);
> +	bool optional;
> +	bool (*condition)(struct xe_device *xe_dev, void *params);

Don't change it if you do not use 'params', keep original
function, see below at 'has_vram_region'.

> +	void *cond_params;

You could remove it.

>  	unsigned int (*iter_mask)(struct xe_device *xe_dev);
> +	enum debugfs_validate_type validate;
> +	const char *expected_str;
>  };
>  
>  static unsigned int gt_iter_mask(struct xe_device *xe_dev)
> @@ -56,7 +69,7 @@ static unsigned int tile_iter_mask(struct xe_device *xe_dev)
>  	return xe_dev->tile_mask;
>  }
>  
> -static bool has_vram(struct xe_device *xe_dev)
> +static bool has_vram_region(struct xe_device *xe_dev, void *params)

This 'params' is unused here.

>  {
>  	return xe_dev->has_vram;
>  }
> @@ -131,6 +144,108 @@ static bool find_not_tested_files(int dir_fd, struct igt_list_head *hit_entries)
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
> +		igt_warn("Empty output from %s\n", file_name);
> +		return false;
> +	}
> +
> +	/* If expecting specific string, verify it's present */
> +	if (expected_str && !strstr(buf, expected_str)) {
> +		igt_warn("Expected '%s' not found in %s\n", expected_str, file_name);

Change to igt_info.

> +		return false;
> +	}
> +
> +	if (expected_str)
> +		igt_debug("Successfully read %s: found '%s'\n", file_name, expected_str);
> +	else
> +		igt_debug("Successfully read %s: %zd bytes\n%s\n", file_name, strlen(buf), buf);
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
> +	if (igt_sysfs_scanf(dirfd, file_name, "%d", &orig_val) != 1 ||
> +	    (orig_val != 0 && orig_val != 1))
> +		return false;
> +
> +	if (mode == O_RDWR) {
> +		test_val = (orig_val == 0) ? 1 : 0;
> +
> +		if (igt_sysfs_printf(dirfd, file_name, "%d", test_val) < 0)
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
> +	long orig_val = 0, new_val = 0, read_val = 0;

Why long here? Either name it long_file or use int. Please
be consistent with function name.

> +
> +	if (igt_sysfs_scanf(dirfd, file_name, "%ld", &orig_val) != 1)
> +		return false;
> +
> +	if (orig_val < 0)
> +		return false;
> +
> +	if (mode == O_RDWR) {
> +		new_val = orig_val + 1;

Make sure you get >= 0 after this addition, so imho here:
		if (new_val < 0)
			new_val = orig_val - 1;

> +		if (igt_sysfs_printf(dirfd, file_name, "%ld", new_val) < 0)
> +			return false;
> +		if (igt_sysfs_scanf(dirfd, file_name, "%ld", &read_val) != 1)
> +			return false;
> +		if (read_val != new_val)
> +			return false;
> +		/* Restore original value */
> +		if (igt_sysfs_printf(dirfd, file_name, "%ld", orig_val) < 0) {
> +			igt_warn("Failed to restore original value for %s\n", file_name);
> +			return false;
> +		}
> +
> +		igt_info("Successfully validated %s int %s: %ld -> %ld -> %ld\n",

Add what you validated:
		igt_info("Successfully validated writing %s int %s: %ld\n",

> +			 mode_to_str(mode), file_name, orig_val, new_val, orig_val);

imho here you could drop mode_to_str(mode), you know it was O_RDWR

> +	} else {
> +		igt_info("Successfully validated %s int %s: %ld\n",

Please add info what you validated, add 'reading':
		igt_info("Successfully validated reading %s int %s: %ld\n",

> +			 mode_to_str(mode), file_name, orig_val);
> +	}
> +	return true;
> +}
> +
>  static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
>  {
>  	int fd = openat(dirfd, file_name, mode);
> @@ -139,10 +254,39 @@ static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
>  		close(fd);
>  		return true;
>  	}
> -
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
> @@ -151,6 +295,7 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
>  {
>  	struct igt_list_head hit_entries;
>  	int missing_count = 0;
> +	int fail_count = 0;
>  	int err = 0;
>  
>  	IGT_INIT_LIST_HEAD(&hit_entries);
> @@ -160,7 +305,7 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
>  		unsigned int mask;
>  		unsigned int j;
>  
> -		if (check->condition && !check->condition(xe_dev))
> +		if (check->condition && !check->condition(xe_dev, check->cond_params))
>  			continue;
>  
>  		if (!check->iter_mask)
> @@ -210,9 +355,20 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
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
> +							   check->validate, check->expected_str))

Add igt_info() here:
					{
					igt_info("Fail at debugfs file: %s\n", ...);

> +					fail_count++;
>  			}
> +
>  		}
>  	}
>  
> @@ -229,7 +385,10 @@ out:
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
> @@ -239,14 +398,25 @@ out:
>  static void test_root_dir(struct xe_device *xe_dev)
>  {
>  	const struct check_entry expected_files[] = {
> -		{ "clients", O_RDONLY },
> +		{ "clients", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "disable_late_binding", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
>  		{ "forcewake_all", O_WRONLY },
>  		{ "gem_names", O_RDONLY },
> -		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
> -		{ "gtt_mm", O_RDONLY },
> -		{ "info", O_RDONLY },
> -		{ "name", O_RDONLY },
> -		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
> +		{ "gt%u", O_RDONLY, .iter_mask = gt_iter_mask },
> +		{ "gtt_mm", O_RDONLY, },
> +		{ "info", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "name", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "poor_man_system_atomic_support", O_RDWR, .optional = true,
> +		  .validate = VALIDATE_BOOL },
> +		{ "dgfx_pkg_residencies", O_RDONLY, .optional = true,
> +		  .validate = VALIDATE_NON_EMPTY },
> +		{ "dgfx_pcie_link_residencies", O_RDONLY, .optional = true,
> +		  .validate = VALIDATE_CONTAINS_STR, .expected_str = "PCIE LINK" },
> +		{ "sriov_info", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
> +		{ "workarounds", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
> +		{ "atomic_svm_timeslice_ms", O_RDWR, .optional = true,
> +		  .validate = VALIDATE_INT_GE_ZERO },
> +		{ "tile%u", O_RDONLY, .iter_mask = tile_iter_mask },
>  	};
>  	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
>  	int missing_count;
> @@ -276,7 +446,7 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
>  	const struct check_entry expected_files[] = {
>  		{ "ggtt", O_RDONLY },
>  		{ "sa_info", O_RDONLY },
> -		{ "vram_mm", O_RDONLY, has_vram },
> +		{ "vram_mm", O_RDONLY, .condition = has_vram_region, .cond_params = (void *)&tile },

Please try to not modify existing tests (where possible).

Regards,
Kamil


>  	};
>  	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
>  	int missing_count;
> -- 
> 2.52.0
> 
