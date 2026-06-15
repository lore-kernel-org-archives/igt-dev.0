Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA8DCD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039D010E303;
	Mon, 15 Jun 2026 09:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTHhwFEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C189110E303
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781515206; x=1813051206;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5eaNpBCBUSCDv2lA5fpeb2ltCvD12BHTapDFF95hmeM=;
 b=OTHhwFEVqts0r//GmQzaSpfCCtrZu74jXK73a1GdrCztaVPRu4plBwtF
 ZlgJh+GtwsGE8j6nzAdEMwzxEvy6AqRNkSPRevXjNRX9qHPU5dYpQpbp1
 q0CvSvBYXAGHfI6EZg0UXloRdo9m1rK/backJmRMtStt0RGNzBTb+AHvM
 lCNYDkno6A5pxGcfpf1SJubBshww375K23K2GrL5V9Pd6e5h6ZgE9kqzC
 Z2+6xEZLch5LIPUc/BSrQKb2XQByUSbsiLkmwCBTbSezeNsWCkHDwDkf8
 UtZrAwW4TxPBY1Usu8gpafV2Hkx8PqJhBUYaupedZ/tH4Sq3J/1fP0Mat w==;
X-CSE-ConnectionGUID: v/eneRgKRA6BCZnzadKUTg==
X-CSE-MsgGUID: xqXfyr8OTaSwOxKXwFcMgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93742792"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="93742792"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:20:06 -0700
X-CSE-ConnectionGUID: dEymD6GBSumKQeEBe+ZFeQ==
X-CSE-MsgGUID: wERYIbT4SJSgkyBAxlHJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="285532342"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:20:05 -0700
Date: Mon, 15 Jun 2026 11:20:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, piotr.piorkowski@intel.com,
 kamil.konieczny@intel.com, nishit.sharma@intel.com
Subject: Re: [PATCH i-g-t] tests/xe_debugfs: Add debugfs entry read/write
 validation in root-dir
Message-ID: <20260615092002.uetesrm34266klmz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Thomas, Sobin" <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, piotr.piorkowski@intel.com,
 kamil.konieczny@intel.com, nishit.sharma@intel.com
References: <20260611094321.367638-1-sobin.thomas@intel.com>
 <20260611131442.s664iiyiecdaic4s@kamilkon-DESK.igk.intel.com>
 <a3f97e5e-7a59-4711-ac63-abe9dbf39b18@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a3f97e5e-7a59-4711-ac63-abe9dbf39b18@intel.com>
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

Hi Thomas,,
On 2026-06-15 at 09:47:39 +0530, Thomas, Sobin wrote:
> 
> On 6/11/2026 6:44 PM, Kamil Konieczny wrote:
> > Hi Sobin,
> > On 2026-06-11 at 09:43:21 +0000, Sobin Thomas wrote:
> > > Extend the root-dir subtest to validate additional Xe debugfs entries:
> > > 
> > All of below are optional, so imho write it before and do not
> > repeat it at every line. Something like:
> > 
> > Extend the root-dir subtest to validate additional optional Xe
> > debugfs entries:
> > 
> > - dgfx_pkg_residencies: Validate counter reads (non-empty)
> > ... rest follows ...
> > 
> > Please also write down what you mean by optional.
> > 
> > > - dgfx_pkg_residencies: Validate counter reads (optional, non-empty)
> > > - dgfx_pcie_link_residencies: Validate PCIE LINK string content (optional)
> > > - sriov_info: Validate entry is non-empty (optional)
> > > - workarounds: Validate entry is non-empty (optional)
> > > - atomic_svm_timeslice_ms: Validate integer read/write (optional)
> > > - poor_man_system_atomic_support: Validate boolean read/write (optional)
> > > - disable_late_binding: Validate boolean read/write (optional)
> > > 
> > > Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> > > ---
> > >   tests/intel/xe_debugfs.c | 198 +++++++++++++++++++++++++++++++++++----
> > >   1 file changed, 180 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> > > index 587e3e785..5e59424fe 100644
> > > --- a/tests/intel/xe_debugfs.c
> > > +++ b/tests/intel/xe_debugfs.c
> > > @@ -39,11 +39,24 @@ IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
> > >   	__m && ((__i) = __builtin_ctz(__m), 1);	\
> > >   	__m &= __m - 1)
> > > +/* Validation types for debugfs read tests */
> > > +enum debugfs_validate_type {
> > > +	VALIDATE_NONE,		/* Just check file exists */
> > Better name _EXIST but it could stay as is.
> > 
> > > +	VALIDATE_NON_EMPTY,	/* Just check buffer is not empty */
> > > +	VALIDATE_CONTAINS_STR,	/* Check buffer contains expected string */
> > > +	VALIDATE_INT_GE_ZERO,	/* Parse as integer, verify >= 0 */
> > > +	VALIDATE_BOOL,		/* Check bool value (0 or 1) */
> > > +};
> > > +
> > >   struct check_entry {
> > >   	const char *name_fmt;
> > >   	int mode;
> > > -	bool (*condition)(struct xe_device *xe_dev);
> > > +	bool optional;
> > > +	bool (*condition)(struct xe_device *xe_dev, void *params);
> > > +	void *cond_params;
> > >   	unsigned int (*iter_mask)(struct xe_device *xe_dev);
> > > +	enum debugfs_validate_type validate;
> > > +	const char *expected_str;
> > >   };
> > >   static unsigned int gt_iter_mask(struct xe_device *xe_dev)
> > > @@ -56,8 +69,13 @@ static unsigned int tile_iter_mask(struct xe_device *xe_dev)
> > >   	return xe_dev->tile_mask;
> > >   }
> > > -static bool has_vram(struct xe_device *xe_dev)
> > > +static bool has_vram_region(struct xe_device *xe_dev, void *params)
> > >   {
> > > +	uint8_t tile = (uint8_t)(uintptr_t)params;
> > > +
> > > +	if (!(xe_dev->tile_mask & (1u << tile)))
> > > +		return false;
> > > +
> > >   	return xe_dev->has_vram;
> > >   }
> > > @@ -131,16 +149,140 @@ static bool find_not_tested_files(int dir_fd, struct igt_list_head *hit_entries)
> > >   	return found_not_tested;
> > >   }
> > > -static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
> > > +/* Validate that debugfs buffer is non-empty or contains expected string */
> > > +static bool validate_string(int dirfd, const char *file_name, const char *expected_str)
> > > +{
> > > +	char buf[4096];
> > > +	int ret = 0;
> > > +
> > > +	ret = igt_sysfs_read(dirfd, file_name, buf, sizeof(buf) - 1);
> > > +	if (ret < 0)
> > > +		return false;
> > > +	buf[ret] = '\0';
> > > +
> > > +	/* Check for empty buffer */
> > > +	if (strlen(buf) == 0) {
> > > +		igt_warn("Empty output from %s\n", file_name);
> > > +		return false;
> > > +	}
> > > +
> > > +	/* If expecting specific string, verify it's present */
> > > +	if (expected_str && !strstr(buf, expected_str)) {
> > > +		igt_warn("Expected '%s' not found in %s\n", expected_str, file_name);
> > > +		return false;
> > > +	}
> > > +
> > > +	if (expected_str)
> > > +		igt_debug("Successfully read %s: found '%s'\n", file_name, expected_str);
> > > +	else
> > > +		igt_debug("Successfully read %s: %zd bytes\n%s\n", file_name, strlen(buf), buf);
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static const char *mode_to_str(int mode)
> > > +{
> > > +	switch (mode & O_ACCMODE) {
> > > +	case O_RDONLY: return "RO";
> > > +	case O_WRONLY: return "WO";
> > > +	case O_RDWR:   return "RW";
> > > +	default:       return "UNKNOWN";
> > > +	}
> > > +}
> > > +
> > > +static bool validate_bool_file(int dirfd, const char *file_name, int mode)
> > > +{
> > > +	int orig_val = 0, read_val = 0, test_val = 0;
> > > +
> > > +	if (igt_sysfs_scanf(dirfd, file_name, "%d", &orig_val) != 1 ||
> > > +	    (orig_val != 0 && orig_val != 1))
> > > +		return false;
> > > +
> > > +	if (mode == O_RDWR) {
> > > +		test_val = (orig_val == 0) ? 1 : 0;
> > > +
> > > +		if (igt_sysfs_printf(dirfd, file_name, "%d", test_val) < 0)
> > > +			return false;
> > > +
> > > +		if (igt_sysfs_scanf(dirfd, file_name, "%d", &read_val) != 1 || read_val != test_val)
> > > +			return false;
> > > +
> > > +		/* Restore original value */
> > > +		if (igt_sysfs_printf(dirfd, file_name, "%d", orig_val) < 0) {
> > > +			igt_warn("Failed to restore original value for %s\n", file_name);
> > > +			return false;
> > > +		}
> > > +	}
> > > +
> > > +	igt_info("Successfully validated %s bool %s\n", mode_to_str(mode), file_name);
> > Note igt_info() here, see below.
> > -> Agreed
> > > +	return true;
> > > +}
> > > +
> > > +static bool validate_int_file(int dirfd, const char *file_name, int mode)
> > > +{
> > > +	long orig_val = 0, new_val = 0, read_val = 0;
> > > +
> > > +	if (igt_sysfs_scanf(dirfd, file_name, "%ld", &orig_val) != 1)
> > > +		return false;
> > > +
> > > +	if (orig_val < 0)
> > > +		return false;
> > > +
> > > +	if (mode == O_RDWR) {
> > > +		new_val = orig_val + 1;
> > > +		if (igt_sysfs_printf(dirfd, file_name, "%ld", new_val) < 0)
> > > +			return false;
> > > +		if (igt_sysfs_scanf(dirfd, file_name, "%ld", &read_val) != 1)
> > > +			return false;
> > > +		if (read_val != new_val)
> > > +			return false;
> > > +		/* Restore original value */
> > > +		if (igt_sysfs_printf(dirfd, file_name, "%ld", orig_val) < 0) {
> > > +			igt_warn("Failed to restore original value for %s\n", file_name);
> > > +			return false;
> > > +		}
> > > +
> > > +		igt_debug("Successfully validated %s int %s: %ld -> %ld -> %ld\n",
> > > +			  mode_to_str(mode), file_name, orig_val, new_val, orig_val);
> > You have igt_info() above in bool check, why debug here?
> > Please be consistent, use one.
> > => Done
> > > +	} else {
> > > +		igt_debug("Successfully validated %s int %s: %ld\n",
> > > +			  mode_to_str(mode), file_name, orig_val);
> > Same here. Btw why not using igt_info() in all places exept one
> > warn at main function?
> > 
> > > +	}
> > > +	return true;
> > > +}
> > > +
> > > +static bool validate_debugfs_file(int dirfd, const char *file_name, int mode,
> > > +				  enum debugfs_validate_type validate, const char *expected_str)
> > >   {
> > > -	int fd = openat(dirfd, file_name, mode);
> > Keep this line.
> > 
> > > +	bool result = true;
> > > -	if (fd >= 0) {
> > > -		close(fd);
> > > +	if (faccessat(dirfd, file_name, F_OK, 0) < 0) {
> > > +		igt_debug("%s does not exist\n", file_name);
> > > +		return false;
> > > +	}
> > Remove this check here.
> > 
> > > +	if (validate == VALIDATE_NONE)
> > >   		return true;
> > > +
> > > +	switch (validate) {
> > > +	case VALIDATE_NON_EMPTY:
> > > +		result = validate_string(dirfd, file_name, NULL);
> > > +		break;
> > > +	case VALIDATE_CONTAINS_STR:
> > > +		result = validate_string(dirfd, file_name, expected_str);
> > > +		break;
> > > +	case VALIDATE_INT_GE_ZERO:
> > > +		result = validate_int_file(dirfd, file_name, mode);
> > > +		break;
> > > +	case VALIDATE_BOOL:
> > > +		result = validate_bool_file(dirfd, file_name, mode);
> > > +		break;
> > > +	default:
> > > +		igt_warn("Unknown validate type %d for %s\n", validate, file_name);
> > > +		result = false;
> > > +		break;
> > >   	}
> > > -	return false;
> > > +	return result;
> > >   }
> > >   /*
> > > @@ -160,7 +302,7 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
> > >   		unsigned int mask;
> > >   		unsigned int j;
> > > -		if (check->condition && !check->condition(xe_dev))
> > > +		if (check->condition && !check->condition(xe_dev, check->cond_params))
> > >   			continue;
> > >   		if (!check->iter_mask)
> > > @@ -209,10 +351,18 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
> > >   #pragma GCC diagnostic pop
> > >   			}
> > > -			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
> > > -				igt_warn("Missing debugfs file: %s\n", entry->name);
> > > -				missing_count++;
> > > +			if (!validate_debugfs_file(dir_fd, entry->name, check->mode,
> > > +						   check->validate, check->expected_str)) {
> > > +				if (check->optional) {
> > > +					igt_info("Optional entry %s not found/invalid (skipped)\n",
> > > +						 entry->name);
> > > +				} else {
> > > +					igt_warn("Missing or invalid debugfs file: %s\n",
> > > +						 entry->name);
> > > +					missing_count++;
> > > +				}
>
> Main intention was to  check only if the file is accessible  I will take care in next series for the fail count
>

It could help reading your answer when you will properly cite old,
and start your comment after a newline, then your comment without
any '>' chars at start of line, then a newline.

> > This seems wrong, it looks that if you have optional debugfs file
> > you will ignore error here. Imho you should keep original if():
> > 
> > 			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
> > 				if (check->optional) {
> > 					igt_info("Optional entry %s not found (skipped)\n",
> > 						 entry->name);
> > 				} else {
> > 					igt_info("Missing debugfs file: %s\n", entry->name);
> > 					missing_count++;
> > 				}
> > 			} else {
> > 				if (!validate_debugfs_file(dir_fd, entry->name, check->mode,
> > 						   check->validate, check->expected_str))
> > 					fail_count++;
> >   			}
> > 
> >    		}
> > 
> > Then at the end warn about any error:
> > 
> > 	if (fail_count || missing_count) {
> > 		igt_warn("Fails: %d missing debugfs file(s): %d\n", fail_count, missing_count);
> > 
> > > @@ -239,14 +389,25 @@ out:
> > >   static void test_root_dir(struct xe_device *xe_dev)
> > >   {
> > >   	const struct check_entry expected_files[] = {
> > > -		{ "clients", O_RDONLY },
> > > +		{ "clients", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> > > +		{ "disable_late_binding", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
> > >   		{ "forcewake_all", O_WRONLY },
> > >   		{ "gem_names", O_RDONLY },
> > > -		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
> > > -		{ "gtt_mm", O_RDONLY },
> > > -		{ "info", O_RDONLY },
> > > -		{ "name", O_RDONLY },
> > > -		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
> > > +		{ "gt%u", O_RDONLY, .iter_mask = gt_iter_mask },
> > > +		{ "gtt_mm", O_RDONLY, },
> > > +		{ "info", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> > > +		{ "name", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> > > +		{ "poor_man_system_atomic_support", O_RDWR, .optional = true,
> > > +		  .validate = VALIDATE_BOOL },
> > Keep it on one line.
> This was done to fix the check patch error.
> > > +		{ "dgfx_pkg_residencies", O_RDONLY, .optional = true,
> > > +		  .validate = VALIDATE_NON_EMPTY },
> > Same here.
> 
> This was done to fix the check patch error.
> 
> 
> > > +		{ "dgfx_pcie_link_residencies", O_RDONLY, .optional = true,
> > > +		  .validate = VALIDATE_CONTAINS_STR, .expected_str = "PCIE LINK" },
> > Same here.
> > 
> > > +		{ "sriov_info", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
> > > +		{ "workarounds", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
> > > +		{ "atomic_svm_timeslice_ms", O_RDWR, .optional = true,
> > > +		  .validate = VALIDATE_INT_GE_ZERO },
> > Same here.
> This was done to fix the check patch error. if we keep it in same line it
> will cause the line > 100 warning. So kept it in seperate lines.

In some cases, when line length is below 150...200, you could
keep it and ignore checkpatch warn, especially that there are
now big screens capable of displaying around 200 horizontal
chars. Also, it helps when using grep to have all text in one
line.

Regards,
Kamil

> > > +		{ "tile%u", O_RDONLY, .iter_mask = tile_iter_mask },
> > >   	};
> > >   	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
> > >   	int missing_count;
> > > @@ -276,7 +437,8 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
> > >   	const struct check_entry expected_files[] = {
> > >   		{ "ggtt", O_RDONLY },
> > >   		{ "sa_info", O_RDONLY },
> > > -		{ "vram_mm", O_RDONLY, has_vram },
> > > +		{ "vram_mm", O_RDONLY, .condition = has_vram_region,
> 
> > Same here.
> > 
> > Regards,
> > Kamil
> > 
> > > +		  .cond_params = (void *)(uintptr_t)tile },
> > >   	};
> > >   	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
> > >   	int missing_count;
> > > -- 
> > > 2.43.0
> > > 
