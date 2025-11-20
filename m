Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F8CF8562
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 08:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26B210E719;
	Thu, 20 Nov 2025 08:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQmmYogl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494A710E71C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763629087; x=1795165087;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SOO5bg6UDErF2vyy7GaATKVIlPzK6k7vwT/VdzJKj8M=;
 b=SQmmYoglS5xoP9LjjygUCcMdKmrL0Y2eWDhhd4UjwTwpCDPhVZhbACyD
 ZBrpxWI616+N+9C5GRQurz2WRrrP1oQCON8L6aIb19TTpc2Zher27ftif
 z39HKH/JaUfVOEcvdRkM0QXU63yUaXS/cnrS81oRWhBnUBp9CThG2/NFy
 0Tq4nqvoN9u8HiCYfjsTtttK3rRBbo8e3KNio/EoCwlYrOtZeIer/dPmC
 6yPQS8/D0XuEs6Zvz4+o+DdhjWNsfypfqt6HhxMtzv8/Ewi61sNngpLP6
 fhBqz1JKOZkIRwFTrSRhIDRRtt5CLLFCHb583zJbt74Pq3afCZi8gTN3d Q==;
X-CSE-ConnectionGUID: w5TTq7hcQr6fE09YzToBtg==
X-CSE-MsgGUID: kTO4xEDESQC+ZlCl2a0cUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68297350"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="68297350"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 00:58:07 -0800
X-CSE-ConnectionGUID: xn8F2bmNQDCJMVdvQekKGw==
X-CSE-MsgGUID: JrIrrBPTRiGlwBH8I/Lvjw==
X-ExtLoop1: 1
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.80])
 ([172.28.182.80])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 00:58:05 -0800
Message-ID: <49b337e7-7e42-4e77-9dc0-b61deb0e06ae@linux.intel.com>
Date: Thu, 20 Nov 2025 09:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] tests/intel/debugfs: Rewrite tests to use
 array-based required debugfs file lists
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
 <20251113114615.3736269-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20251113114615.3736269-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 11/13/2025 12:46 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> The previous version of debugfs test contained inconsistent logic.
> Lets rewrite the test to use a single array-based list of required files.
> Add support for conditional requirements and dynamic index generation
> for entries like gt and tile dir.
>
> Also split out a dedicated subtest for validating the contents of the
> info debugfs node.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   tests/intel/xe_debugfs.c | 385 ++++++++++++++++++++++++++++-----------
>   1 file changed, 283 insertions(+), 102 deletions(-)
>
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 1005047132..2600880a7e 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -30,75 +30,284 @@ struct {
>    *
>    */
>   
> -IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
> +IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
> +
> +#define for_each_set_bit(i, mask)		\
> +	for (unsigned int _m = (mask);		\
> +	_m && ((i) = __builtin_ctz(_m), 1);	\
> +	_m &= _m - 1)
> +
> +struct check_entry {
> +	const char *name_fmt;
> +	int mode;
> +	bool (*condition)(struct xe_device *xe_dev);
> +	unsigned int (*iter_mask)(struct xe_device *xe_dev);
> +};
> +
> +static unsigned int gt_iter_mask(struct xe_device *xe_dev)
> +{
> +	return xe_dev->gt_mask;
> +}
> +
> +static unsigned int tile_iter_mask(struct xe_device *xe_dev)
> +{
> +	return xe_dev->tile_mask;
> +}
> +
> +static bool has_vram(struct xe_device *xe_dev)
> +{
> +	return xe_dev->has_vram;
> +}
> +
> +/* Validate the format of debugfs fmt file, allow only one %u literal */
> +static bool validate_debugfs_fmt(const char *fmt)
> +{
> +	bool found_u = false;
> +
> +	for (const char *p = fmt; *p; p++) {
> +		if (*p != '%')
> +			continue;
> +
> +		/* % at end of string → invalid */
> +		if (!p[1])
> +			return false;
> +
> +		/* must be exactly %u */
> +		if (p[1] != 'u')
> +			return false;
> +
> +		/* only one %u allowed */
> +		if (found_u)
> +			return false;
> +
> +		found_u = true;
> +
> +		/* skip u */
> +		p++; /* caller loop increments p again */
> +	}
> +
> +	return found_u;
> +}
> +
> +struct hit_entry {
> +	struct igt_list_head link;
> +	char name[64];
> +};
>   
> -static int xe_validate_entries(igt_dir_t *igt_dir,
> -			       const char * const str_val[], int str_cnt)
> +static bool find_no_tested_files(int dir_fd, struct igt_list_head *hit_entries)

NIT: s/find_no_tested_files/find_not_tested_files/  or warn_untested_files ?

>   {
>   	igt_dir_file_list_t *file_list_entry;
> +	bool found_not_tested = false;
> +	igt_dir_t *dir = igt_dir_create(dir_fd);
> +	int ret;
>   
> -	if (!igt_dir)
> -		return -1;
> +	igt_assert_f(dir, "Failed to create igt_dir_t for debugfs dir\n");
>   
> -	igt_dir_scan_dirfd(igt_dir, -1);
> +	ret = igt_dir_scan_dirfd(dir, 0);
> +	igt_assert_f(ret == 0, "Failed to scan debugfs directory\n");
>   
> -	for (int i = 0; i < str_cnt; i++) {
> -		int hit = 0;
>   
> -		igt_list_for_each_entry(file_list_entry,
> -					&igt_dir->file_list_head, link) {
> -			if (strcmp(file_list_entry->relative_path,
> -				   str_val[i]) == 0) {
> -				hit = 1;
> +	igt_list_for_each_entry(file_list_entry, &dir->file_list_head, link) {
> +		struct hit_entry *e;
> +		bool hit = false;
> +
> +		igt_list_for_each_entry(e, hit_entries, link) {
> +			if (strcmp(file_list_entry->relative_path, e->name) == 0) {
> +				hit = true;
>   				break;
>   			}
>   		}
>   
> -		if (!hit && opt.warn_on_not_hit)
> -			igt_warn("no test for: %s\n", str_val[i]);
> +		if (!hit) {
> +			igt_warn("No test for: %s\n", file_list_entry->relative_path);
> +			found_not_tested = true;
> +		}
>   	}
>   
> -	return 0;
> +	igt_dir_destroy(dir);
> +
> +	return found_not_tested;
> +}
> +
> +static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
> +{
> +	int fd = openat(dirfd, file_name, mode);
> +
> +	if (fd >= 0) {
> +		close(fd);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/*
> + * Return: negative error code on failure, or number of missing files
> + */
> +static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
> +				    const struct check_entry *expected_files, size_t size)
> +{
> +	struct igt_list_head hit_entries;
> +	int missing_count = 0;
> +	int err = 0;
> +
> +	IGT_INIT_LIST_HEAD(&hit_entries);
> +
> +	for (int i = 0; i < size; i++) {
> +		const struct check_entry *check = &expected_files[i];
> +		unsigned int mask;
> +		unsigned int j;
> +
> +		if (check->condition && !check->condition(xe_dev))
> +			continue;
> +
> +		if (!check->iter_mask)
> +			mask = BIT(0); /* to iterate once */
> +		else
> +			mask = check->iter_mask(xe_dev);
> +
> +		for_each_set_bit(j, mask) {
> +			struct hit_entry *entry;
> +
> +			entry = malloc(sizeof(*entry));
> +			if (!entry) {
> +				igt_warn("Failed to allocate memory for hit entry\n");
> +				err = -ENOMEM;
> +				goto out;
> +			}
> +
> +			igt_list_add(&entry->link, &hit_entries);
> +
> +			if (!check->iter_mask) {
> +				snprintf(entry->name, sizeof(entry->name), "%s", check->name_fmt);
> +			} else {
> +				int ret;
> +
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wformat-nonliteral"
> +				/**
> +				 * XXX: We ignore the compiler warning, but
> +				 * validate fmt at runtime.
> +				 */
> +				if (!validate_debugfs_fmt(check->name_fmt)) {
> +					igt_warn("Invalid debugfs name fmt: %s.\n",
> +						 check->name_fmt);
> +					err = -EBADF;
> +					goto out;
> +				}
> +
> +				ret = snprintf(entry->name, sizeof(entry->name),
> +					       check->name_fmt, j);
> +				if (ret < 0 || ret >= sizeof(entry->name)) {
> +					igt_warn("Debugfs format failed for: %s\n",
> +						 check->name_fmt);
> +					err = -EINVAL;
> +					goto out;
> +				}
> +#pragma GCC diagnostic pop
> +			}
> +
> +			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
> +				igt_warn("Missing debugfs file: %s\n", entry->name);
> +				missing_count++;
> +			}
> +		}
> +	}
> +
> +	if (opt.warn_on_not_hit)
> +		find_no_tested_files(dir_fd, &hit_entries);
> +
> +out:
> +	if (!igt_list_empty(&hit_entries)) {
> +		struct hit_entry *entry, *tmp;
> +
> +		igt_list_for_each_entry_safe(entry, tmp, &hit_entries, link) {
> +			igt_list_del(&entry->link);
> +			free(entry);
> +		}
> +	}
> +
> +	return (err < 0) ? err : missing_count;
>   }
>   
>   /**
> - * SUBTEST: xe-base
> - * Description: Check if various debugfs devnodes exist and test reading them
> + * SUBTEST: root-dir
> + * Description: Check required debugfs devnodes exist in the root debugfs directory
>    */
> -static void
> -xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
> +static void test_root_dir(struct xe_device *xe_dev)
>   {
> -	uint16_t devid = intel_get_drm_devid(fd);
> -	static const char * const expected_files[] = {
> -		"gt0",
> -		"gt1",
> -		"stolen_mm",
> -		"gtt_mm",
> -		"vram0_mm",
> -		"forcewake_all",
> -		"info",
> -		"gem_names",
> -		"clients",
> -		"name"
> +	const struct check_entry expected_files[] = {
> +		{ "clients", O_RDONLY },
> +		{ "forcewake_all", O_WRONLY },
> +		{ "gem_names", O_RDONLY },
> +		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
> +		{ "gtt_mm", O_RDONLY },
> +		{ "info", O_RDONLY },
> +		{ "name", O_RDONLY },
> +		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
> +		{ "vram%u_mm", O_RDONLY, has_vram, tile_iter_mask }, /* vram0_mm, vram1_mm, ... */
>   	};
> -	char reference[4096];
> -	int val = 0;
> +	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
> +	int missing_count;
>   
> -	igt_assert(config);
> -	sprintf(reference, "devid 0x%llx",
> -		config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> +	if (debugfs_fd < 0)
> +		goto skip;
>   
> -	sprintf(reference, "revid %lld",
> -		config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> +	missing_count = debugfs_validate_entries(xe_dev, debugfs_fd, expected_files,
> +						 ARRAY_SIZE(expected_files));
>   
> -	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> -		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
> +	close(debugfs_fd);
> +
> +	igt_fail_on_f(missing_count > 0, "Found %d missing debugfs files (see warnings above)\n",
> +		      missing_count);
> +
> +	return;
> +skip:
> +	igt_skip("Failed to open debugfs directory\n");
> +}
> +
> +/**
> + * SUBTEST: info-read
> + * Description: Check info debugfs devnode contents
> + */
> +static void test_info_read(struct xe_device *xe_dev)
> +{
> +	uint16_t devid = intel_get_drm_devid(xe_dev->fd);
> +	struct drm_xe_query_config *config;
> +	const char *name = "info";
> +	bool failed = false;
> +	char buf[4096];
> +	int val;
> +
> +	config = xe_config(xe_dev->fd);
> +
> +	igt_assert_f(config, "Failed to get xe config\n");
> +
> +	snprintf(buf, sizeof(buf), "devid 0x%llx",
> +		 config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
> +	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
> +		igt_warn("Missing devid in info debugfs\n");
> +		failed = true;
> +	}
> +
> +	snprintf(buf, sizeof(buf), "revid %lld",
> +		 config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
> +	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
> +		igt_warn("Missing revid in info debugfs\n");
> +		failed = true;
> +	}
>   
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> +	snprintf(buf, sizeof(buf),
> +		 "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
> +	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
> +		igt_warn("Missing is_dgfx in info debugfs\n");
> +		failed = true;
> +	}
>   
>   	if (intel_gen(devid) < 20) {
> +		val = -1;
> +
>   		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
>   		case 48:
>   			val = 3;
> @@ -106,57 +315,38 @@ xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
>   		case 57:
>   			val = 4;
>   			break;
> +		default:
> +			igt_warn("Unexpected va_bits value: %lld\n",
> +				 config->info[DRM_XE_QUERY_CONFIG_VA_BITS]);
> +			failed = true;
> +			break;
>   		}
>   
> -		sprintf(reference, "vm_max_level %d", val);
> -		igt_assert(igt_debugfs_search(fd, "info", reference));
> +		if (val != -1) {
> +			snprintf(buf, sizeof(buf), "vm_max_level %d", val);
> +			if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
> +				igt_warn("Missing vm_max_level in info debugfs\n");
> +				failed = true;
> +			}
> +		}
>   	}
>   
> -	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> -
> -	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
> -
> -	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
> -	igt_debugfs_dump(fd, "gtt_mm");
> -
> -	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
> -		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
> -		igt_debugfs_dump(fd, "vram0_mm");
> +	snprintf(buf, sizeof(buf), "tile_count %d", xe_sysfs_get_num_tiles(xe_dev->fd));
> +	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
> +		igt_warn("Missing tile_count in info debugfs\n");
> +		failed = true;
>   	}
>   
> -	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
> -		igt_debugfs_dump(fd, "stolen_mm");
> -
> -	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
> -	igt_debugfs_dump(fd, "clients");
> -
> -	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
> -	igt_debugfs_dump(fd, "gem_names");
> +	igt_fail_on_f(failed, "Some required info debugfs entries are missing\n");
>   
> -	xe_validate_entries(igt_dir, expected_files,
> -			    ARRAY_SIZE(expected_files));
> -}
> -
> -/**
> - * SUBTEST: xe-forcewake
> - * Description: Check forcewake debugfs devnode
> - */
> -static void
> -xe_test_forcewake(int fd)
> -{
> -	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
> -
> -	igt_assert_neq(handle, -1);
> -	close(handle);
>   }
>   
>   const char *help_str =
> -	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
> +	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
>   
>   struct option long_options[] = {
> -	{ "--warn-not-hit", no_argument, NULL, 'w'},
> -	{ 0, 0, 0, 0 }
> +	{ "warn-not-hit", no_argument, NULL, 'w'},
> +	{ }
>   };
>   
>   static int opt_handler(int option, int option_index, void *input)
> @@ -174,34 +364,25 @@ static int opt_handler(int option, int option_index, void *input)
>   
>   igt_main_args("", long_options, help_str, opt_handler, NULL)
>   {
> -	int debugfs = -1;
> +	struct xe_device *xe_dev;
>   	int fd = -1;
> -	igt_dir_t *igt_dir = NULL;
>   
>   	igt_fixture {
>   		fd = drm_open_driver_master(DRIVER_XE);
> -		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
> -		debugfs = igt_debugfs_dir(fd);
> -
> -		igt_dir = igt_dir_create(debugfs);
> -		igt_require(igt_dir);
> -
> +		xe_dev = xe_device_get(fd);
> +		igt_assert_f(xe_dev, "Failed to get xe device\n");
>   		kmstest_set_vt_graphics_mode();
>   	}
>   
> -	igt_describe("Check if various debugfs devnodes exist and test reading them.");
> -	igt_subtest("xe-base") {
> -		xe_test_base(fd, xe_config(fd), igt_dir);
> -	}
> -
> -	igt_describe("Check forcewake debugfs devnode");
> -	igt_subtest("xe-forcewake") {
> -		xe_test_forcewake(fd);
> -	}
> +	igt_describe("Check required debugfs devnodes exist in the root debugfs directory.");
> +	igt_subtest("root-dir")
> +		test_root_dir(xe_dev);
>   
> +	igt_describe("Check info debugfs devnode contents.");
> +	igt_subtest("info-read")
> +		test_info_read(xe_dev);
>   	igt_fixture {
> -		igt_dir_destroy(igt_dir);
> -		close(debugfs);
> +		xe_device_put(fd);
NIT: not needed, drm_close_driver should handle it
>   		drm_close_driver(fd);
>   	}
>   }

With some nits, LGTM

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

