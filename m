Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD9DCCF9EE
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 17:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DCD10E211;
	Wed, 29 Oct 2025 17:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjVpZHhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9B410E211
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761759339; x=1793295339;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yOSbUd7JZbaPi/oYCOGN+05YSmSNelxJ5eWc3zqRrGk=;
 b=bjVpZHhNmwK5YjKOihtCIVyYLIT+Yfw3xedq0dvH5OQW6YfsNYUO8f+1
 fDP2xJqKfpvXl13lJEyib1uOKLQl3lPKjxOV0TzHCaFmtXlXZr/2/buGE
 NQQGjiMRZsSkROXlr0V6ZMF6pSkUvJl2uWaJNyG9YrLSrsRuC9YECtAFH
 lFEJc0BhkjkKB6j5KIhsv3w77cLCC/dTxoG+e1aZ0BBMcIKs9n+2R+tDm
 0ObxWAhECgsYCoNP2sVrnR/0Wtn/CGiguYXj2uX2UOHKfeqHylIEIBD+o
 KMyw2oFwX+yxbhp55ZFCSTddgBGLRvCpAX3qmyA95H/S+Ot+bu+VLFtxT w==;
X-CSE-ConnectionGUID: PtjGsVqVSmynEwgcBLHCEA==
X-CSE-MsgGUID: DOgqil84SlqW5AVSMQW68A==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="86518323"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="86518323"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 10:35:38 -0700
X-CSE-ConnectionGUID: RXuCpduRQHiIkqp1qmiUyw==
X-CSE-MsgGUID: wKwV5djYToOAhxjUF4ZVFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="186073253"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.148])
 ([172.28.180.148])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 10:35:36 -0700
Message-ID: <4814972e-31ec-4d27-99d8-1dc9a1afcb3c@linux.intel.com>
Date: Wed, 29 Oct 2025 18:35:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tests/xe_sriov_flr: extend VF FLR test for
 multi-tile Xe devices
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251027161440.2906378-1-piotr.piorkowski@intel.com>
 <20251027161440.2906378-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20251027161440.2906378-4-piotr.piorkowski@intel.com>
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


On 10/27/2025 5:14 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Let's introduce tile-level iteration and per-tile resource management
> for GGTT, LMEM, and register subchecks.
>
> Key updates:
>   - Add xe_number_tiles() and xe_tile_get_main_gt_id() helpers.
>   - Introduce xe_for_each_tile() macro for tile iteration.
>   - Refactor subcheck callbacks to include tile-aware arguments.
>   - Replace GT-based logic with per-tile handling for GGTT and LMEM.
>
> v2:
>   - define separate data for each tile in subcheck
>   - report the result for each tile separately
>   - use igt_hweight instead__builtin_popcountll
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   lib/xe/xe_query.c          |  45 +++
>   lib/xe/xe_query.h          |   6 +
>   tests/intel/xe_sriov_flr.c | 558 ++++++++++++++++++++-----------------
>   3 files changed, 359 insertions(+), 250 deletions(-)
>
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index a89e0b980..13391bd02 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -515,6 +515,22 @@ unsigned int xe_dev_max_gt(int fd)
>   	return igt_fls(xe_dev->gt_mask) - 1;
>   }
>   
> +/**
> + * xe_number_tiles
> + * @fd: xe device fd
> + *
> + * Return number of tiles for xe device fd.
> + */
> +uint8_t xe_number_tiles(int fd)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev = find_in_cache(fd);
> +	igt_assert(xe_dev);
> +
> +	return igt_hweight(xe_dev->tile_mask);
> +}
> +
>   /**
>    * all_memory_regions:
>    * @fd: xe device fd
> @@ -995,6 +1011,35 @@ uint16_t xe_gt_get_tile_id(int fd, int gt)
>   	return xe_dev->gt_list->gt_list[gt].tile_id;
>   }
>   
> +/**
> + * xe_tile_get_main_gt_id:
> + * @fd: xe device fd
> + * @tile: tile id
> + *
> + * Returns main GT ID for given @tile.
> + */
> +uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile)
> +{
> +	struct xe_device *xe_dev;
> +	int gt_id = -1;
> +
> +	xe_dev = find_in_cache(fd);
> +	igt_assert(xe_dev);
> +
> +	for (int i = 0; i < xe_dev->gt_list->num_gt; i++) {
> +		const struct drm_xe_gt *gt_data = &xe_dev->gt_list->gt_list[i];
> +
> +		if (gt_data->tile_id == tile && gt_data->type == DRM_XE_QUERY_GT_TYPE_MAIN) {
> +			gt_id = gt_data->gt_id;
> +			break;
> +		}
> +	}
> +
> +	igt_assert_f(gt_id >= 0, "No main GT found for tile %d\n", tile);
> +
> +	return gt_id;
> +}
> +
>   /**
>    * xe_hwconfig_lookup_value:
>    * @fd: xe device fd
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 715b64e2f..25f115ae5 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -86,6 +86,10 @@ struct xe_device {
>   	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
>   	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
>   	     igt_unique(__mask) &= ~(1ull << __gt))
> +#define xe_for_each_tile(__fd, __tile) \
> +	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
> +	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
> +	     igt_unique(__mask) &= ~(1ull << __tile))
>   #define xe_for_each_mem_region(__fd, __memreg, __r) \
>   	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
>   		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
> @@ -101,6 +105,7 @@ struct xe_device {
>   
>   unsigned int xe_number_gt(int fd);
>   unsigned int xe_dev_max_gt(int fd);
> +uint8_t xe_number_tiles(int fd);
>   uint64_t all_memory_regions(int fd);
>   uint64_t system_memory(int fd);
>   const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
> @@ -135,6 +140,7 @@ uint16_t xe_gt_type(int fd, int gt);
>   bool xe_is_media_gt(int fd, int gt);
>   bool xe_is_main_gt(int fd, int gt);
>   uint16_t xe_gt_get_tile_id(int fd, int gt);
> +uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
>   uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
>   int xe_query_pxp_status(int fd);
>   int xe_wait_for_pxp_init(int fd);
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 077ed15af..cf9422176 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -53,7 +53,9 @@

the above lib changes should go to separate patch

>   
>   IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
>   
> -const char *SKIP_REASON = "SKIP";
> +#define STOP_REASON_ABORT "ABORT"
> +#define STOP_REASON_FAIL "FAIL"
> +#define STOP_REASON_SKIP "SKIP"
>   
>   /**
>    * struct subcheck_data - Base structure for subcheck data.
> @@ -66,8 +68,6 @@ const char *SKIP_REASON = "SKIP";
>    * @pf_fd: File descriptor for the Physical Function.
>    * @num_vfs: Number of Virtual Functions (VFs) enabled and under test. This count is
>    *           used to iterate over and manage the VFs during the testing process.
> - * @gt: GT under test. This identifier is used to specify a particular GT
> - *      for operations when GT-specific testing is required.
>    * @stop_reason: Pointer to a string that indicates why a subcheck should skip or fail.
>    *               This field is crucial for controlling the flow of subcheck execution.
>    *               If set, it should prevent further execution of the current subcheck,
> @@ -79,12 +79,11 @@ const char *SKIP_REASON = "SKIP";
>    * Example usage:
>    * A typical use of this structure involves initializing it with the necessary test setup
>    * parameters, checking the `stop_reason` field before proceeding with each subcheck operation,
> - * and using `pf_fd`, `num_vfs`, and `gt` as needed based on the specific subcheck requirements.
> + * and using `pf_fd` and `num_vfs` as needed based on the specific subcheck requirements.
>    */
>   struct subcheck_data {
>   	int pf_fd;
> -	int num_vfs;
> -	int gt;
> +	unsigned int num_vfs;
>   	char *stop_reason;
>   };

I would replace the gt with tile, that should allow to remove the 
xe_for_each_tile loops "explosion"

and keep verify_flr intact

>   
> @@ -100,37 +99,47 @@ struct subcheck_data {
>    *
>    * @name: Name of the subcheck operation, used for identification and reporting.
>    *
> + * @alloc: Allocate resources for the subcheck.
> + *   @param data: Shared data needed for allocation.
> + *   @param tile: Tile index for multi-tile devices.
> + *   @param num_vfs: Number of VFs enabled on the PF.
> + *
>    * @init: Initialize the subcheck environment.
>    *   Sets up the initial state required for the subcheck, including preparing
>    *   resources and ensuring the system is ready for testing.
>    *   @param data: Shared data needed for initialization.
> + *   @param tile: Tile index for multi-tile devices.
>    *
>    * @prepare_vf: Prepare subcheck data for a specific VF.
>    *   Called for each VF before FLR is performed. It might involve marking
>    *   specific memory regions or setting up PTE addresses.
> - *   @param vf_id: Identifier of the VF being prepared.
>    *   @param data: Shared common data.
> + *   @param tile: Tile index for multi-tile devices.
> + *   @param vf_id: Identifier of the VF being prepared.
>    *
>    * @verify_vf: Verify the state of a VF after FLR.
>    *   Checks the VF's state post FLR to ensure the expected results,
>    *   such as verifying that only the FLRed VF has its state reset.
> + *   @param data: Shared common data.
> + *   @param tile: Tile index for multi-tile devices.
>    *   @param vf_id: Identifier of the VF to verify.
>    *   @param flr_vf_id: Identifier of the VF that underwent FLR.
> - *   @param data: Shared common data.
>    *
>    * @cleanup: Clean up the subcheck environment.
>    *   Releases resources and restores the system to its original state
>    *   after the subchecks, ensuring no resource leaks and preparing the system
>    *   for subsequent tests.
>    *   @param data: Shared common data.
> + *   @param tile: Tile index for multi-tile devices.
>    */
>   struct subcheck {
> -	struct subcheck_data *data;
> +	struct subcheck_data **data;
>   	const char *name;
> -	void (*init)(struct subcheck_data *data);
> -	void (*prepare_vf)(int vf_id, struct subcheck_data *data);
> -	void (*verify_vf)(int vf_id, int flr_vf_id, struct subcheck_data *data);
> -	void (*cleanup)(struct subcheck_data *data);
> +	void (*alloc)(struct subcheck_data *data, uint8_t tile, unsigned int num_vfs);
> +	void (*init)(struct subcheck_data *data, uint8_t tile);
> +	void (*prepare_vf)(struct subcheck_data *data, uint8_t tile, int vf_id);
> +	void (*verify_vf)(struct subcheck_data *data, uint8_t tile, int vf_id, int flr_vf_id);
> +	void (*cleanup)(struct subcheck_data *data, uint8_t tile);
>   };
>   
>   __attribute__((format(printf, 3, 0)))
> @@ -154,12 +163,12 @@ static void set_stop_reason_v(struct subcheck_data *data, const char *prefix,
>   }
>   
>   __attribute__((format(printf, 2, 3)))
> -static void set_skip_reason(struct subcheck_data *data, const char *format, ...)
> +static void set_abort_reason(struct subcheck_data *data, const char *format, ...)
>   {
>   	va_list args;
>   
>   	va_start(args, format);
> -	set_stop_reason_v(data, SKIP_REASON, format, args);
> +	set_stop_reason_v(data, STOP_REASON_ABORT, format, args);
>   	va_end(args);
>   }
>   
> @@ -169,22 +178,36 @@ static void set_fail_reason(struct subcheck_data *data, const char *format, ...)
>   	va_list args;
>   
>   	va_start(args, format);
> -	set_stop_reason_v(data, "FAIL", format, args);
> +	set_stop_reason_v(data, STOP_REASON_FAIL, format, args);
>   	va_end(args);
>   }
>   
> -static bool subcheck_can_proceed(const struct subcheck *check)
> +__attribute__((format(printf, 2, 3)))
> +static void set_skip_reason(struct subcheck_data *data, const char *format, ...)
>   {
> -	return !check->data->stop_reason;
> +	va_list args;
> +
> +	va_start(args, format);
> +	set_stop_reason_v(data, STOP_REASON_SKIP, format, args);
> +	va_end(args);
> +}
> +
> +static bool subcheck_can_proceed(const struct subcheck *check, uint8_t tile)
> +{
> +	return !check->data[tile]->stop_reason;
>   }
>   
>   static int count_subchecks_with_stop_reason(struct subcheck *checks, int num_checks)
>   {
>   	int subchecks_with_stop_reason = 0;
> +	int pf_fd = checks[0].data[0]->pf_fd;
> +	uint8_t tile;
>   
> -	for (int i = 0; i < num_checks; ++i)
> -		if (!subcheck_can_proceed(&checks[i]))
> -			subchecks_with_stop_reason++;
> +	xe_for_each_tile(pf_fd, tile) {
> +		for (int i = 0; i < num_checks; ++i)
> +			if (!subcheck_can_proceed(&checks[i], tile))
> +				subchecks_with_stop_reason++;
> +	}
>   
>   	return subchecks_with_stop_reason;
>   }
> @@ -194,29 +217,34 @@ static bool no_subchecks_can_proceed(struct subcheck *checks, int num_checks)
>   	return count_subchecks_with_stop_reason(checks, num_checks) == num_checks;
>   }
>   
> -static bool is_subcheck_skipped(struct subcheck *subcheck)
> +static bool is_subcheck_skipped(struct subcheck *subcheck, uint8_t tile)
>   {
> -	return subcheck->data && subcheck->data->stop_reason &&
> -	       !strncmp(SKIP_REASON, subcheck->data->stop_reason, strlen(SKIP_REASON));
> +	return subcheck->data && subcheck->data[tile]->stop_reason &&
> +	       !strncmp(STOP_REASON_SKIP, subcheck->data[tile]->stop_reason,
> +			strlen(STOP_REASON_SKIP));
>   }
>   
>   static void subchecks_report_results(struct subcheck *checks, int num_checks)
>   {
>   	int fails = 0, skips = 0;
> -
> -	for (int i = 0; i < num_checks; ++i) {
> -		if (checks[i].data->stop_reason) {
> -			if (is_subcheck_skipped(&checks[i])) {
> -				igt_info("%s: %s", checks[i].name,
> -					 checks[i].data->stop_reason);
> -				skips++;
> +	int pf_fd = checks[0].data[0]->pf_fd;
> +	uint8_t tile;
> +
> +	xe_for_each_tile(pf_fd, tile) {
> +		for (int i = 0; i < num_checks; ++i) {
> +			if (checks[i].data[tile]->stop_reason) {
> +				if (is_subcheck_skipped(&checks[i], tile)) {
> +					igt_info("Tile%d %s: %s", tile, checks[i].name,
> +						 checks[i].data[tile]->stop_reason);
> +					skips++;
> +				} else {
> +					igt_critical("Tile%d %s: %s", tile, checks[i].name,
> +						     checks[i].data[tile]->stop_reason);
> +					fails++;
> +				}
>   			} else {
> -				igt_critical("%s: %s", checks[i].name,
> -					     checks[i].data->stop_reason);
> -				fails++;
> +				igt_info("Tile%d %s: SUCCESS\n", tile, checks[i].name);
>   			}
> -		} else {
> -			igt_info("%s: SUCCESS\n", checks[i].name);
>   		}
>   	}
>   
> @@ -269,10 +297,11 @@ typedef int (*flr_exec_strategy)(int pf_fd, int num_vfs,
>    * A timeout is used to wait for FLR operations to complete.
>    */
>   static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
> -		       int num_checks, flr_exec_strategy exec_strategy)
> +		       size_t num_checks, flr_exec_strategy exec_strategy)
>   {
>   	const int wait_flr_ms = 200;
>   	int i, vf_id, flr_vf_id = -1;
> +	uint8_t tile;
>   
>   	igt_sriov_disable_driver_autoprobe(pf_fd);
>   	igt_sriov_enable_vfs(pf_fd, num_vfs);
> @@ -283,13 +312,20 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   	if (igt_warn_on(igt_pci_system_reinit()))
>   		goto disable_vfs;
>   
> -	for (i = 0; i < num_checks; ++i)
> -		checks[i].init(checks[i].data);
> +	xe_for_each_tile(pf_fd, tile) {
> +		for (i = 0; i < num_checks; ++i) {
> +			if (checks[i].alloc)
> +				checks[i].alloc(checks[i].data[tile], tile, num_vfs);
>   
> -	for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
> -		for (i = 0; i < num_checks; ++i)
> -			if (subcheck_can_proceed(&checks[i]))
> -				checks[i].prepare_vf(vf_id, checks[i].data);
> +			if (subcheck_can_proceed(&checks[i], tile))
> +				checks[i].init(checks[i].data[tile], tile);
> +		}
> +
> +		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
> +			for (i = 0; i < num_checks; ++i)
> +				if (subcheck_can_proceed(&checks[i], tile))
> +					checks[i].prepare_vf(checks[i].data[tile], tile, vf_id);
> +	}
>   
>   	if (no_subchecks_can_proceed(checks, num_checks))
>   		goto cleanup;
> @@ -298,8 +334,10 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   	flr_vf_id = exec_strategy(pf_fd, num_vfs, checks, num_checks, wait_flr_ms);
>   
>   cleanup:
> -	for (i = 0; i < num_checks; ++i)
> -		checks[i].cleanup(checks[i].data);
> +	xe_for_each_tile(pf_fd, tile)
> +		for (i = 0; i < num_checks; ++i)
> +			if (checks[i].cleanup)
> +				checks[i].cleanup(checks[i].data[tile], tile);
>   
>   disable_vfs:
>   	igt_sriov_disable_vfs(pf_fd);
> @@ -315,6 +353,7 @@ static int execute_sequential_flr(int pf_fd, int num_vfs,
>   				  const int wait_flr_ms)
>   {
>   	int i, vf_id, flr_vf_id = 1;
> +	uint8_t tile;
>   
>   	do {
>   		if (igt_warn_on_f(!igt_sriov_device_reset(pf_fd, flr_vf_id),
> @@ -324,16 +363,20 @@ static int execute_sequential_flr(int pf_fd, int num_vfs,
>   		/* Assume FLR is finished after wait_flr_ms */
>   		usleep(wait_flr_ms * 1000);
>   
> -		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
> -			for (i = 0; i < num_checks; ++i)
> -				if (subcheck_can_proceed(&checks[i]))
> -					checks[i].verify_vf(vf_id, flr_vf_id, checks[i].data);
> -
> -		/* Reinitialize test data for the FLRed VF */
> -		if (flr_vf_id < num_vfs)
> -			for (i = 0; i < num_checks; ++i)
> -				if (subcheck_can_proceed(&checks[i]))
> -					checks[i].prepare_vf(flr_vf_id, checks[i].data);
> +		xe_for_each_tile(pf_fd, tile) {
> +			for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
> +				for (i = 0; i < num_checks; ++i)
> +					if (subcheck_can_proceed(&checks[i], tile))
> +						checks[i].verify_vf(checks[i].data[tile],
> +								    tile, vf_id, flr_vf_id);
> +
> +			/* Reinitialize test data for the FLRed VF */
> +			if (flr_vf_id < num_vfs)
> +				for (i = 0; i < num_checks; ++i)
> +					if (subcheck_can_proceed(&checks[i], tile))
> +						checks[i].prepare_vf(checks[i].data[tile], tile,
> +								     flr_vf_id);
> +		}
>   
>   		if (no_subchecks_can_proceed(checks, num_checks))
>   			break;
> @@ -420,9 +463,12 @@ cleanup_threads:
>   		pthread_join(threads[i], NULL);
>   
>   	if (last_vf_id) {
> -		for (k = 0; k < num_checks; ++k)
> -			set_skip_reason(checks[k].data,
> -					"Thread creation failed for VF%u\n", last_vf_id);
> +		uint8_t tile;
> +
> +		xe_for_each_tile(pf_fd, tile)
> +			for (k = 0; k < num_checks; ++k)
> +				set_skip_reason(checks[k].data[tile],
> +						"Thread creation failed for VF%u\n", last_vf_id);
>   		return 0;
>   	}
>   
> @@ -431,15 +477,19 @@ cleanup_threads:
>   
>   	/* Verify results */
>   	for (i = 0; i < created_threads; ++i) {
> +		uint8_t tile;
> +
>   		vf_id = thread_data[i].vf_id;
>   
>   		/* Skip already checked VF or if the FLR initiation failed */
>   		if (vf_id == last_vf_id || thread_data[i].result != 0)
>   			continue;
>   
> -		for (k = 0; k < num_checks; ++k)
> -			if (subcheck_can_proceed(&checks[k]))
> -				checks[k].verify_vf(vf_id, vf_id, checks[k].data);
> +		xe_for_each_tile(pf_fd, tile)
> +			for (k = 0; k < num_checks; ++k)
> +				if (subcheck_can_proceed(&checks[k], tile))
> +					checks[k].verify_vf(checks[k].data[tile], tile, vf_id,
> +							    vf_id);
>   
>   		if (no_subchecks_can_proceed(checks, num_checks))
>   			break;
> @@ -470,8 +520,8 @@ static int execute_parallel_flr_twice(int pf_fd, int num_vfs,
>   #define GGTT_PTE_ADDR_SHIFT			12
>   
>   struct ggtt_ops {
> -	void (*set_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
> -	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
> +	void (*set_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
> +	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset);
>   };
>   
>   struct ggtt_provisioned_offset_range {
> @@ -491,69 +541,79 @@ struct ggtt_data {
>   	struct ggtt_ops ggtt;
>   };
>   
> -static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
> +static void ggtt_subcheck_alloc(struct subcheck_data *data, uint8_t tile, unsigned int num_vfs)
>   {
> -	return xe_mmio_ggtt_read(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset);
> +	struct ggtt_data *gdata = (struct ggtt_data *)data;
> +
> +	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
> +	if (!gdata->pte_offsets) {
> +		set_abort_reason(data, "Failed to allocate memory for pte_offsets on tile %u\n",
> +				 tile);
> +		return;
> +	}
> +}
> +
> +static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset)
> +{
> +	return xe_mmio_ggtt_read(mmio, tile, pte_offset);
>   }
>   
> -static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
> +static void intel_set_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset,
> +			  xe_ggtt_pte_t pte)
>   {
> -	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
> +	xe_mmio_ggtt_write(mmio, tile, pte_offset, pte);
>   }
>   
> -static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
> +static void intel_mtl_set_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset,
> +			      xe_ggtt_pte_t pte)
>   {
> -	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
> +	xe_mmio_ggtt_write(mmio, tile, pte_offset, pte);
>   
>   	/* force flush by read some MMIO register */
> -	xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), GEN12_VF_CAP_REG);
> +	xe_mmio_tile_read32(mmio, tile, GEN12_VF_CAP_REG);
>   }
>   
> -static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
> -			uint8_t gpa, xe_ggtt_pte_t *out)
> +static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
> +			uint32_t pte_offset, uint8_t gpa, xe_ggtt_pte_t *out)
>   {
>   	xe_ggtt_pte_t pte;
>   
> -	pte = ggtt->get_pte(mmio, gt, pte_offset);
> +	pte = ggtt->get_pte(mmio, tile, pte_offset);
>   	pte &= ~GGTT_PTE_TEST_FIELD_MASK;
>   	pte |= ((xe_ggtt_pte_t)gpa << GGTT_PTE_ADDR_SHIFT) & GGTT_PTE_TEST_FIELD_MASK;
> -	ggtt->set_pte(mmio, gt, pte_offset, pte);
> -	*out = ggtt->get_pte(mmio, gt, pte_offset);
> +	ggtt->set_pte(mmio, tile, pte_offset, pte);
> +	*out = ggtt->get_pte(mmio, tile, pte_offset);
>   
>   	return *out == pte;
>   }
>   
> -static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
> -			  uint8_t expected_gpa, xe_ggtt_pte_t *out)
> +static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
> +			  uint32_t pte_offset, uint8_t expected_gpa, xe_ggtt_pte_t *out)
>   {
>   	uint8_t val;
>   
> -	*out = ggtt->get_pte(mmio, gt, pte_offset);
> +	*out = ggtt->get_pte(mmio, tile, pte_offset);
>   	val = (uint8_t)((*out & GGTT_PTE_TEST_FIELD_MASK) >> GGTT_PTE_ADDR_SHIFT);
>   
>   	return val == expected_gpa;
>   }
>   
> -static bool is_intel_mmio_initialized(const struct intel_mmio_data *mmio)
> -{
> -	return mmio->dev;
> -}
> -
> -static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
> +static void populate_ggtt_pte_offsets(struct ggtt_data *gdata, uint8_t tile)
>   {
>   	int ret, pf_fd = gdata->base.pf_fd, num_vfs = gdata->base.num_vfs;
>   	struct xe_sriov_provisioned_range *ranges;
> -	unsigned int nr_ranges, gt = gdata->base.gt;
> +	unsigned int nr_ranges;
>   
>   	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
>   	igt_assert(gdata->pte_offsets);
>   
> -	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, xe_gt_get_tile_id(pf_fd, gt),
> -							 gdata->mmio, &ranges, &nr_ranges);
> +	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, gdata->mmio, &ranges,
> +							 &nr_ranges);
>   	if (ret) {
> -		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
> -				gt, ret);
> -		return -1;
> +		set_abort_reason(&gdata->base,
> +				 "Tile%u: Failed to scan GGTT PTE offset ranges (%d)\n",
> +				 tile, ret);
> +		return;
>   	}
>   
>   	for (unsigned int i = 0; i < nr_ranges; ++i) {
> @@ -563,46 +623,38 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>   			continue;
>   
>   		if (vf_id < 1 || vf_id > num_vfs) {
> -			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
> -					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
> -			free(ranges);
> -			return -1;
> +			set_abort_reason(&gdata->base,
> +					 "Tile%u: Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
> +					 tile, vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
> +			goto out;
>   		}
>   
>   		if (gdata->pte_offsets[vf_id].end) {
> -			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
> -					vf_id);
> -			free(ranges);
> -			return -1;
> +			set_abort_reason(&gdata->base,
> +					 "Tile%u: Duplicate GGTT PTE offset range for VF%u\n",
> +					 tile, vf_id);
> +			goto out;
>   		}
>   
>   		gdata->pte_offsets[vf_id].start = ranges[i].start;
>   		gdata->pte_offsets[vf_id].end = ranges[i].end;
>   	}
>   
> -	free(ranges);
> -
>   	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
>   		if (!gdata->pte_offsets[vf_id].end) {
> -			set_skip_reason(&gdata->base,
> -					"Failed to find VF%u provisioned GGTT PTE offset range\n",
> -					vf_id);
> -			return -1;
> +			set_abort_reason(&gdata->base,
> +					 "Tile%u: Failed to find VF%u provisioned GGTT PTE offset range\n",
> +					 tile, vf_id);
> +			goto out;
>   		}
> -
> -	return 0;
> +out:
> +	free(ranges);
>   }
>   
> -static void ggtt_subcheck_init(struct subcheck_data *data)
> +static void ggtt_subcheck_init(struct subcheck_data *data, uint8_t tile)
>   {
>   	struct ggtt_data *gdata = (struct ggtt_data *)data;
>   
> -	if (!xe_is_main_gt(data->pf_fd, data->gt)) {
> -		set_skip_reason(data, "GGTT provisioning not exposed on GT%d (non-MAIN)\n",
> -				data->gt);
> -		return;
> -	}
> -
>   	gdata->ggtt.get_pte = intel_get_pte;
>   	if (IS_METEORLAKE(intel_get_drm_devid(data->pf_fd)))
>   		gdata->ggtt.set_pte = intel_mtl_set_pte;
> @@ -610,16 +662,16 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
>   		gdata->ggtt.set_pte = intel_set_pte;
>   
>   	if (gdata->mmio) {
> -		if (!is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
> -			xe_mmio_vf_access_init(data->pf_fd, 0 /*PF*/, gdata->mmio);
> +		if (!xe_mmio_is_initialized(gdata->mmio))
> +			xe_mmio_access_init(data->pf_fd, gdata->mmio);
>   
> -		populate_ggtt_pte_offsets(gdata);
> +		populate_ggtt_pte_offsets(gdata, tile);
>   	} else {
> -		set_skip_reason(data, "xe_mmio is NULL\n");
> +		set_abort_reason(data, "xe_mmio is NULL\n");
>   	}
>   }
>   
> -static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
> +static void ggtt_subcheck_prepare_vf(struct subcheck_data *data, uint8_t tile, int vf_id)
>   {
>   	struct ggtt_data *gdata = (struct ggtt_data *)data;
>   	xe_ggtt_pte_t pte;
> @@ -628,22 +680,23 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>   	if (data->stop_reason)
>   		return;
>   
> -	igt_debug("Prepare gpa on VF%u offset range [%#x-%#x]\n", vf_id,
> +	igt_debug("Tile%u: Prepare gpa on VF%u offset range [%#x-%#x]\n", tile, vf_id,
>   		  gdata->pte_offsets[vf_id].start,
>   		  gdata->pte_offsets[vf_id].end);
>   
>   	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
> -		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
> +		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, tile, pte_offset,
>   				 (uint8_t)vf_id, &pte)) {
>   			set_skip_reason(data,
> -					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
> -					vf_id, pte, pte_offset);
> +					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x on tile%u\n",
> +					vf_id, pte, pte_offset, tile);
>   			return;
>   		}
>   	}
>   }
>   
> -static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
> +static void ggtt_subcheck_verify_vf(struct subcheck_data *data, uint8_t tile, int vf_id,
> +				    int flr_vf_id)
>   {
>   	struct ggtt_data *gdata = (struct ggtt_data *)data;
>   	uint8_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
> @@ -654,25 +707,22 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>   		return;
>   
>   	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
> -		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
> +		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, tile, pte_offset,
>   				   expected, &pte)) {
>   			set_fail_reason(data,
> -					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
> -					flr_vf_id, vf_id, pte, pte_offset);
> +					"Tile%u: GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
> +					tile, flr_vf_id, vf_id, pte, pte_offset);
>   			return;
>   		}
>   	}
>   }
>   
> -static void ggtt_subcheck_cleanup(struct subcheck_data *data)
> +static void ggtt_subcheck_cleanup(struct subcheck_data *data, uint8_t num_tiles)
>   {
>   	struct ggtt_data *gdata = (struct ggtt_data *)data;
>   
>   	free(gdata->pte_offsets);
> -	if (gdata->mmio && is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
> -		xe_mmio_access_fini(gdata->mmio);
>   }
> -
>   struct lmem_data {
>   	struct subcheck_data base;
>   	size_t *vf_lmem_size;
> @@ -680,6 +730,23 @@ struct lmem_data {
>   
>   const size_t STEP = SZ_1M;
>   
> +static void lmem_subcheck_alloc(struct subcheck_data *data, uint8_t tile, unsigned int num_vfs)
> +{
> +	struct lmem_data *ldata = (struct lmem_data *)data;
> +
> +	if (!xe_has_vram(data->pf_fd)) {
> +		set_skip_reason(data, "No LMEM\n");
> +		return;
> +	}
> +
> +	ldata->vf_lmem_size = calloc(num_vfs + 1, sizeof(*ldata->vf_lmem_size));
> +	if (!ldata->vf_lmem_size) {
> +		set_abort_reason(data, "Failed to allocate memory for vf_lmem_size on tile %u\n",
> +				 tile);
> +		return;
> +	}
> +}
> +
>   static bool lmem_write_pattern(struct vram_mapping *m, uint8_t value, size_t start, size_t step)
>   {
>   	uint8_t read;
> @@ -735,66 +802,51 @@ static bool lmem_mmap_write_munmap(int pf_fd, int vf_num, size_t length, char va
>   	return result;
>   }
>   
> -static int populate_vf_lmem_sizes(struct subcheck_data *data)
> +static void populate_vf_lmem_sizes(struct subcheck_data *data, uint8_t tile)
>   {
>   	struct lmem_data *ldata = (struct lmem_data *)data;
> +	unsigned int main_gt = xe_tile_get_main_gt_id(data->pf_fd, tile);
>   	struct xe_sriov_provisioned_range *ranges;
> -	unsigned int nr_ranges, gt;
> +	unsigned int nr_ranges;
>   	int ret;
>   
> -	ldata->vf_lmem_size = calloc(data->num_vfs + 1, sizeof(size_t));
> -	igt_assert(ldata->vf_lmem_size);
> -
> -	xe_for_each_gt(data->pf_fd, gt) {
> -		if (!xe_is_main_gt(data->pf_fd, gt))
> -			continue;
> -
> -		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
> -								  XE_SRIOV_SHARED_RES_LMEM,
> -								  gt, &ranges, &nr_ranges);
> -		if (ret) {
> -			set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
> -					xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
> -					gt, ret);
> -			return -1;
> -		}
> -
> -		for (unsigned int i = 0; i < nr_ranges; ++i) {
> -			const unsigned int vf_id = ranges[i].vf_id;
> +	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd, XE_SRIOV_SHARED_RES_LMEM,
> +							  main_gt, &ranges, &nr_ranges);
> +	if (ret) {
> +		set_abort_reason(data, "Tile%u: Failed read %s on main GT (%d)\n", tile,
> +				 xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
> +				 ret);
> +		return;
> +	}
>   
> -			igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
> -			/* Sum the allocation for vf_id (inclusive range) */
> -			ldata->vf_lmem_size[vf_id] += ranges[i].end - ranges[i].start + 1;
> -		}
> +	for (unsigned int i = 0; i < nr_ranges; ++i) {
> +		const unsigned int vf_id = ranges[i].vf_id;
>   
> -		free(ranges);
> +		igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
> +		/* Sum the allocation for vf_id (inclusive range) */
> +		ldata->vf_lmem_size[vf_id] += ranges[i].end - ranges[i].start + 1;
>   	}
>   
> +	free(ranges);
> +
>   	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
>   		if (!ldata->vf_lmem_size[vf_id]) {
> -			set_skip_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
> -			return -1;
> +			set_abort_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
> +			return;
>   		}
>   
> -	return 0;
> +	return;
>   }
>   
> -static void lmem_subcheck_init(struct subcheck_data *data)
> +static void lmem_subcheck_init(struct subcheck_data *data, uint8_t tile)
>   {
>   	igt_assert_fd(data->pf_fd);
>   	igt_assert(data->num_vfs);
>   
> -	if (!xe_has_vram(data->pf_fd)) {
> -		set_skip_reason(data, "No LMEM\n");
> -		return;
> -	}
> -
> -	if (populate_vf_lmem_sizes(data))
> -		/* skip reason set in populate_vf_lmem_sizes */
> -		return;
> +	populate_vf_lmem_sizes(data, tile);
>   }
>   
> -static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
> +static void lmem_subcheck_prepare_vf(struct subcheck_data *data, uint8_t tile, int vf_id)
>   {
>   	struct lmem_data *ldata = (struct lmem_data *)data;
>   
> @@ -805,11 +857,12 @@ static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>   
>   	if (!lmem_mmap_write_munmap(data->pf_fd, vf_id,
>   				    ldata->vf_lmem_size[vf_id], vf_id)) {
> -		set_skip_reason(data, "LMEM write failed on VF%u\n", vf_id);
> +		set_abort_reason(data, "LMEM write failed on VF%u\n", vf_id);
>   	}
>   }
>   
> -static void lmem_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
> +static void lmem_subcheck_verify_vf(struct subcheck_data *data, uint8_t tile, int vf_id,
> +				    int flr_vf_id)
>   {
>   	struct lmem_data *ldata = (struct lmem_data *)data;
>   	char expected = (vf_id == flr_vf_id) ? 0 : vf_id;
> @@ -825,7 +878,7 @@ static void lmem_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>   	}
>   }
>   
> -static void lmem_subcheck_cleanup(struct subcheck_data *data)
> +static void lmem_subcheck_cleanup(struct subcheck_data *data, uint8_t num_tiles)
>   {
>   	struct lmem_data *ldata = (struct lmem_data *)data;
>   
> @@ -839,12 +892,12 @@ static void lmem_subcheck_cleanup(struct subcheck_data *data)
>   
>   struct regs_data {
>   	struct subcheck_data base;
> -	struct intel_mmio_data *mmio;
> +	struct xe_mmio *mmio;
>   	uint32_t reg_addr;
>   	int reg_count;
>   };
>   
> -static void regs_subcheck_init(struct subcheck_data *data)
> +static void regs_subcheck_init(struct subcheck_data *data, uint8_t tile)
>   {
>   	struct regs_data *rdata = (struct regs_data *)data;
>   
> @@ -854,7 +907,7 @@ static void regs_subcheck_init(struct subcheck_data *data)
>   	}
>   }
>   
> -static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
> +static void regs_subcheck_prepare_vf(struct subcheck_data *data, uint8_t tile, int vf_id)
>   {
>   	struct regs_data *rdata = (struct regs_data *)data;
>   	uint32_t reg;
> @@ -863,32 +916,22 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>   	if (data->stop_reason)
>   		return;
>   
> -	if (!is_intel_mmio_initialized(&rdata->mmio[vf_id])) {
> -		struct pci_device *pci_dev = __igt_device_get_pci_device(data->pf_fd, vf_id);
> -
> -		if (!pci_dev) {
> -			set_skip_reason(data, "No PCI device found for VF%u\n", vf_id);
> -			return;
> -		}
> -
> -		if (intel_register_access_init(&rdata->mmio[vf_id], pci_dev, false)) {
> -			set_skip_reason(data, "Failed to get access to VF%u MMIO\n", vf_id);
> -			return;
> -		}
> -	}
> +	if (!xe_mmio_is_initialized(&rdata->mmio[vf_id]))
> +		xe_mmio_vf_access_init(data->pf_fd, vf_id, &rdata->mmio[vf_id]);
>   
>   	for (i = 0; i < rdata->reg_count; i++) {
>   		reg = rdata->reg_addr + i * 4;
>   
> -		intel_register_write(&rdata->mmio[vf_id], reg, vf_id);
> -		if (intel_register_read(&rdata->mmio[vf_id], reg) != vf_id) {
> +		xe_mmio_tile_write32(&rdata->mmio[vf_id], tile, reg, vf_id);
> +		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], tile, reg) != vf_id) {
>   			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
>   			return;
>   		}
>   	}
>   }
>   
> -static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
> +static void regs_subcheck_verify_vf(struct subcheck_data *data, uint8_t tile, int vf_id,
> +				    int flr_vf_id)
>   {
>   	struct regs_data *rdata = (struct regs_data *)data;
>   	uint32_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
> @@ -901,7 +944,7 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>   	for (i = 0; i < rdata->reg_count; i++) {
>   		reg = rdata->reg_addr + i * 4;
>   
> -		if (intel_register_read(&rdata->mmio[vf_id], reg) != expected) {
> +		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], tile, reg) != expected) {
>   			set_fail_reason(data,
>   					"Registers check after VF%u FLR failed on VF%u\n",
>   					flr_vf_id, vf_id);
> @@ -910,84 +953,99 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>   	}
>   }
>   
> -static void regs_subcheck_cleanup(struct subcheck_data *data)
> +static void cleanup_mmio(struct xe_mmio *mmio, unsigned int num_vfs)
>   {
> -	struct regs_data *rdata = (struct regs_data *)data;
> -	int i;
> -
> -	if (rdata->mmio)
> -		for (i = 1; i <= data->num_vfs; ++i)
> -			if (is_intel_mmio_initialized(&rdata->mmio[i]))
> -				intel_register_access_fini(&rdata->mmio[i]);
> +	for (unsigned int vf_id = 0; vf_id <= num_vfs; ++vf_id) {
> +		if (xe_mmio_is_initialized(&mmio[vf_id]))
> +			xe_mmio_access_fini(&mmio[vf_id]);
> +	}
>   }
>   
> -static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
> +static void clear_tests(const int pf_fd, const unsigned int num_vfs,
> +			const flr_exec_strategy exec_strategy)
>   {
> -	struct xe_mmio xemmio = { };
> -	const unsigned int num_gts = xe_number_gt(pf_fd);
> -	struct ggtt_data gdata[num_gts];
> +	struct subcheck_data base = { .pf_fd = pf_fd, .num_vfs = num_vfs };
> +	struct xe_mmio *mmio = calloc(1 + num_vfs, sizeof(*mmio));
> +	uint8_t num_tiles = xe_number_tiles(pf_fd);
> +	struct ggtt_data gdata = {
> +		.base = base,
> +		.mmio = mmio,
> +	};
>   	struct lmem_data ldata = {
> -		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs }
> +		.base = base,
>   	};
> -	struct intel_mmio_data mmio[num_vfs + 1];
>   	struct regs_data scratch_data = {
> -		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
> +		.base = base,
>   		.mmio = mmio,
>   		.reg_addr = SCRATCH_REG,
>   		.reg_count = SCRATCH_REG_COUNT
>   	};
>   	struct regs_data media_scratch_data = {
> -		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
> +		.base = base,
>   		.mmio = mmio,
>   		.reg_addr = MED_SCRATCH_REG,
>   		.reg_count = MED_SCRATCH_REG_COUNT
>   	};
> -	const unsigned int num_checks = num_gts + 3;
> -	struct subcheck checks[num_checks];
> -	int i = 0, gt_id;
> +	struct ggtt_data *gdata_tiles[num_tiles];
> +	struct lmem_data *ldata_tiles[num_tiles];
> +	struct regs_data *sdata_tiles[num_tiles];
> +	struct regs_data *msdata_tiles[num_tiles];
> +
> +	for (int i = 0; i < num_tiles; i++) {
> +		gdata_tiles[i] = &gdata;
> +		ldata_tiles[i] = &ldata;
> +		sdata_tiles[i] = &scratch_data;
> +		msdata_tiles[i] = &media_scratch_data;
> +	}

Hmm, does it work for multi-tile ? It looks we share the stop_reason and 
I'm not sure on other fields like pte_offsets etc. ?

I think each tile can have its own set of subchecks without a need to 
subcheck_data array.

--

marcin

>   
> -	memset(mmio, 0, sizeof(mmio));
> +	{
> +		struct subcheck checks[] = {
> +			{
> +				.data = (struct subcheck_data **)gdata_tiles,
> +				.name = "clear-ggtt",
> +				.alloc = ggtt_subcheck_alloc,
> +				.init = ggtt_subcheck_init,
> +				.prepare_vf = ggtt_subcheck_prepare_vf,
> +				.verify_vf = ggtt_subcheck_verify_vf,
> +				.cleanup = ggtt_subcheck_cleanup
> +			},
> +			{
> +				.data = (struct subcheck_data **)ldata_tiles,
> +				.name = "clear-lmem",
> +				.alloc = lmem_subcheck_alloc,
> +				.init = lmem_subcheck_init,
> +				.prepare_vf = lmem_subcheck_prepare_vf,
> +				.verify_vf = lmem_subcheck_verify_vf,
> +				.cleanup = lmem_subcheck_cleanup
> +			},
> +			{
> +				.data = (struct subcheck_data **)sdata_tiles,
> +				.name = "clear-scratch-regs",
> +				.alloc = NULL,
> +				.init = regs_subcheck_init,
> +				.prepare_vf = regs_subcheck_prepare_vf,
> +				.verify_vf = regs_subcheck_verify_vf,
> +				.cleanup = NULL
> +			},
> +			{
> +				.data = (struct subcheck_data **)msdata_tiles,
> +				.name = "clear-media-scratch-regs",
> +				.alloc = NULL,
> +				.init = regs_subcheck_init,
> +				.prepare_vf = regs_subcheck_prepare_vf,
> +				.verify_vf = regs_subcheck_verify_vf,
> +				.cleanup = NULL
> +			}
>   
> -	xe_for_each_gt(pf_fd, gt_id) {
> -		gdata[i] = (struct ggtt_data){
> -			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = gt_id },
> -			.mmio = &xemmio
>   		};
> -		checks[i] = (struct subcheck){
> -			.data = (struct subcheck_data *)&gdata[i],
> -			.name = "clear-ggtt",
> -			.init = ggtt_subcheck_init,
> -			.prepare_vf = ggtt_subcheck_prepare_vf,
> -			.verify_vf = ggtt_subcheck_verify_vf,
> -			.cleanup = ggtt_subcheck_cleanup
> -		};
> -		i++;
> -	}
> -	checks[i++] = (struct subcheck) {
> -		.data = (struct subcheck_data *)&ldata,
> -		.name = "clear-lmem",
> -		.init = lmem_subcheck_init,
> -		.prepare_vf = lmem_subcheck_prepare_vf,
> -		.verify_vf = lmem_subcheck_verify_vf,
> -		.cleanup = lmem_subcheck_cleanup };
> -	checks[i++] = (struct subcheck) {
> -		.data = (struct subcheck_data *)&scratch_data,
> -		.name = "clear-scratch-regs",
> -		.init = regs_subcheck_init,
> -		.prepare_vf = regs_subcheck_prepare_vf,
> -		.verify_vf = regs_subcheck_verify_vf,
> -		.cleanup = regs_subcheck_cleanup };
> -	checks[i++] = (struct subcheck) {
> -		.data = (struct subcheck_data *)&media_scratch_data,
> -		.name = "clear-media-scratch-regs",
> -		.init = regs_subcheck_init,
> -		.prepare_vf = regs_subcheck_prepare_vf,
> -		.verify_vf = regs_subcheck_verify_vf,
> -		.cleanup = regs_subcheck_cleanup
> -	};
> -	igt_assert_eq(i, num_checks);
>   
> -	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
> +		igt_abort_on_f(!mmio, "Failed to allocate memory for mmio array\n");
> +
> +		verify_flr(pf_fd, num_vfs, checks, ARRAY_SIZE(checks), exec_strategy);
> +
> +		cleanup_mmio(mmio, num_vfs);
> +		free(mmio);
> +	}
>   }
>   
>   igt_main
