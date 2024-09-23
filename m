Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5E0CF9C6E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 11:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F2410E3DF;
	Mon, 23 Sep 2024 11:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9EwQzWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1624510E3DF
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727092015; x=1758628015;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=cg2kWMZtTl+2M9nR5v0y6SA/PdLK10G6U82ZTJCCIb4=;
 b=G9EwQzWQJtp89iHaxZqVtMOLwQ24KcKIYNbvVQ5MbH8VKM/eRymEIYLs
 y+jNETqc6PwsB8RxywBkWD7//2jBrHoObKMqB1TWAINnfoyPR2cvbHexg
 VnVdwwguB8CnSb6elVDgZgE0HurF0xCqnQ7wdJkfZmp9IuxOH5fXeZmNz
 Mo2GXSykmflFWYG0xhqBBW5llR4hRICxQSPorI5J1NuU1lkvPt3uut7+o
 mXUJCljnqF/4GCj0kV+4UhsEWmTak8xg4GorgT+WDuSxlG5+FM5X1iJta
 Lex+qb+jc01J2IidYin2NqOs46c7A4hAGKFkI/d1TvU2r0Y7dzB4lVbST g==;
X-CSE-ConnectionGUID: +LBCZ4H4SS2DJEL6wq+iZg==
X-CSE-MsgGUID: RNkPRvwbRAKZlFkHqM1Jqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25900982"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="25900982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:46:54 -0700
X-CSE-ConnectionGUID: q2RNiBDxTxmMFnxyHFeO5Q==
X-CSE-MsgGUID: 3GOMNdOIS6+Uf5x6MJhqZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="75813630"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:46:54 -0700
Date: Mon, 23 Sep 2024 14:47:19 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/7] lib/igt_kms: add DP link management helper
 functions
Message-ID: <ZvFVR4sIi9dsgP8k@ideak-desk.fi.intel.com>
References: <20240922212549.1361889-1-kunal1.joshi@intel.com>
 <20240922212549.1361889-2-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922212549.1361889-2-kunal1.joshi@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Sep 23, 2024 at 02:55:43AM +0530, Kunal Joshi wrote:
> Added helper functions for below
> - read current/max link_rate/lane_count
> - forcing link retraining
> - forcing link training failures
> - read pending retrain
> - read pending link training failures
> - checking output supports forcing lt failures
> - force link_rate/lane_count
> 
> v2: combine all link training debugfs in one patch (Imre)
>     remove unwanted valid output check (Imre)
>     return link_rate/lane_count marked with '*' or an error (Imre)
> 
> v3: add debugfs_connector_read/write helpers (Imre)
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 307 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  10 ++
>  2 files changed, 317 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b40470c02..c79d800eb 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -47,6 +47,7 @@
>  #include <poll.h>
>  #include <errno.h>
>  #include <time.h>
> +#include <ctype.h>
>  
>  #include <i915_drm.h>
>  
> @@ -6713,3 +6714,309 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
>  
>  	return num_scalers;
>  }
> +
> +/**
> + * igt_parse_marked_value:
> + * @buf: Buffer containing the content to parse
> + * @marked_char: The character marking the value to parse
> + * @result: Pointer to store the parsed value
> + *
> + * Finds the integer value in the buffer that is marked by the given character.
> + *
> + * Returns: 0 on success, -1 on failure
> + */
> +static int igt_parse_marked_value(const char *buf, char marked_char, int *result)
> +{
> +	char *star_ptr, *val_ptr;

It's not necessarily the '*' character, so the above should be called marked_ptr, or
remove the parameter, since always '*' is passed to the function.

> +
> +	/*
> +	 * Look for the marked character
> +	 */
> +	star_ptr = strchr(buf, marked_char);
> +
> +	if (star_ptr) {
> +		val_ptr = star_ptr - 1;
> +		while (val_ptr > buf && isdigit(*val_ptr))
> +			val_ptr--;
> +		val_ptr++;
> +		if (sscanf(val_ptr, "%d", result) == 1)
> +			return 0;
> +	}
> +	return -1;
> +}
> +
> +/**
> + * igt_debugfs_read_connector_file:
> + * @drm_fd: A drm file descriptor
> + * @conn_name: Name of the output connector
> + * @filename: The file to read from in the connector's directory
> + * @buf: Buffer to store the read content
> + * @buf_size: Size of the buffer
> + *
> + * Reads from a specific file in the connector's debugfs directory.
> + *
> + * Returns: 0 on success, -1 on failure.
> + */
> +static int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
> +				    const char *filename, char *buf,
> +				    size_t buf_size)
> +{
> +	int dir, res;
> +
> +	dir = igt_debugfs_connector_dir(drm_fd, conn_name, O_RDONLY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n", conn_name);
> +
> +	res = igt_debugfs_simple_read(dir, filename, buf, buf_size);
> +	close(dir);
> +
> +	if (res < 0)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_debugfs_write_connector_file:
> + * @drm_fd: A drm file descriptor
> + * @conn_name: Name of the output connector
> + * @filename: The file to write to in the connector's directory
> + * @data: Data to write to the file
> + * @data_size: Size of the data to write
> + *
> + * Writes to a specific file in the connector's debugfs directory.
> + *
> + * Returns: 0 on success, -1 on failure.
> + */
> +static int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,
> +				     const char *filename, const char *data,
> +				     size_t data_size)
> +{
> +	int dir, res;
> +
> +	dir = igt_debugfs_connector_dir(drm_fd, conn_name, O_DIRECTORY);

Using O_RDONLY here as well is enough, the directory does not change.

> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +		     conn_name);
> +
> +	res = igt_sysfs_write(dir, filename, data, data_size);
> +	close(dir);
> +
> +	if (res < 0)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_get_current_link_rate:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: link_rate if set for output else -1
> + */
> +int igt_get_current_link_rate(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int res, ret;
> +
> +	res = igt_debugfs_read_connector_file(drm_fd, output->name,
> +					       "i915_dp_force_link_rate",
> +					       buf, sizeof(buf));
> +	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_rate\n",
> +			       output->name);
> +	res = igt_parse_marked_value(buf, '*', &ret);
> +	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
> +	return ret;
> +}
> +
> +/**
> + * igt_get_current_lane_count:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: lane_count if set for output else -1
> + */
> +int igt_get_current_lane_count(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int res, ret;
> +
> +	res = igt_debugfs_read_connector_file(drm_fd, output->name,
> +					      "i915_dp_force_lane_count",
> +					      buf, sizeof(buf));
> +	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_lane_count\n",
> +			       output->name);
> +	res = igt_parse_marked_value(buf, '*', &ret);
> +	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
> +	return ret;
> +}
> +
> +/**
> + * igt_get_max_link_rate:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: max_link_rate
> + */
> +int igt_get_max_link_rate(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int res, ret;
> +
> +	res = igt_debugfs_read_connector_file(drm_fd, output->name,
> +					       "i915_dp_max_link_rate",
> +					       buf, sizeof(buf));
> +	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_link_rate\n",
> +		     output->name);
> +
> +	sscanf(buf, "%d", &ret);
> +	return ret;
> +}
> +
> +/**
> + * igt_get_max_link_rate:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: max_link_rate
> + */
> +int igt_get_max_lane_count(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int res, ret;
> +
> +	res = igt_debugfs_read_connector_file(drm_fd, output->name,
> +					       "i915_dp_max_lane_count",
> +					       buf, sizeof(buf));
> +	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_lane_count\n",
> +		     output->name);
> +
> +	sscanf(buf, "%d", &ret);
> +	return ret;
> +}
> +
> +/**
> + * igt_force_link_retrain:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + * @retrain_count: number of retraining required
> + *
> + * Force link retrain on the output.
> + */
> +void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
> +{
> +	char value[2];
> +	int res;
> +
> +	snprintf(value, sizeof(value), "%d", retrain_count);
> +	res = igt_debugfs_write_connector_file(drm_fd, output->name,
> +					       "i915_dp_force_link_retrain",
> +					       value, sizeof(value));

This just happens to work, since sizeof(value) is 2. Please use
strlen() instead.

> +	igt_assert_f(res == 0, "Unable to write to %s/i915_dp_force_link_retrain\n",
> +			  output->name);
> +}
> +
> +/**
> + * igt_force_lt_failure:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + * @failure_count: 1 for same link param and
> + *		   2 for reduced link params
> + *
> + * Force link training failure on the output.
> + * @failure_count: 1 for retraining with same link params
> + *		   2 for retraining with reduced link params
> + */
> +void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
> +{
> +	char value[2];
> +	int res;
> +
> +	snprintf(value, sizeof(value), "%d", failure_count);
> +	res = igt_debugfs_write_connector_file(drm_fd, output->name,
> +					       "i915_dp_force_link_training_failure",
> +					       value, sizeof(value));

Use strlen().

With the above fixed this is:
Reviewed-by: Imre Deak <imre.deak@intel.com>

> +	igt_assert_f(res == 0, "Unable to write to %s/i915_dp_force_link_training_failure\n",
> +			  output->name);
> +}
> +
> +/**
> + * igt_get_dp_link_retrain_disabled:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: True if link retrain disabled, false otherwise
> + */
> +bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int res;
> +
> +	res = igt_debugfs_read_connector_file(drm_fd, output->name,
> +					      "i915_dp_link_retrain_disabled",
> +					      buf, sizeof(buf));
> +	igt_assert_f(res == 0, "Unable to read %s/i915_dp_link_retrain_disabled\n",
> +			       output->name);
> +	return strstr(buf, "yes");
> +}
> +
> +/**
> + * Checks if the force link training failure debugfs
> + * is available for a specific output.
> + *
> + * @drmfd: file descriptor of the DRM device.
> + * @output: output to check.
> + * Returns:
> + *  true if the debugfs is available, false otherwise.
> + */
> +bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int res;
> +
> +	res = igt_debugfs_read_connector_file(drmfd, output->name,
> +					      "i915_dp_link_retrain_disabled",
> +					      buf, sizeof(buf));
> +	return res == 0;
> +}
> +
> +/**
> + * igt_get_dp_pending_lt_failures:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: Number of pending link training failures.
> + */
> +int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int res, ret;
> +
> +	res = igt_debugfs_read_connector_file(drm_fd, output->name,
> +					      "i915_dp_force_link_training_failure",
> +					      buf, sizeof(buf));
> +	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_training_failure\n",
> +			       output->name);
> +	sscanf(buf, "%d", &ret);
> +	return ret;
> +}
> +
> +/**
> + * igt_dp_pending_retrain:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: Number of pending link retrains.
> + */
> +int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int res, ret;
> +
> +	res = igt_debugfs_read_connector_file(drm_fd, output->name,
> +					      "i915_dp_force_link_retrain",
> +					      buf, sizeof(buf));
> +	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_retrain\n",
> +			       output->name);
> +	sscanf(buf, "%d", &ret);
> +	return ret;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 25ba50916..7d9c28d81 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1224,5 +1224,15 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
>  bool igt_check_output_is_dp_mst(igt_output_t *output);
>  int igt_get_dp_mst_connector_id(igt_output_t *output);
>  int get_num_scalers(igt_display_t *display, enum pipe pipe);
> +int igt_get_current_lane_count(int drm_fd, igt_output_t *output);
> +int igt_get_current_link_rate(int drm_fd, igt_output_t *output);
> +int igt_get_max_link_rate(int drm_fd, igt_output_t *output);
> +int igt_get_max_lane_count(int drm_fd, igt_output_t *output);
> +void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
> +void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
> +bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
> +bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
> +int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
> +int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
>  
>  #endif /* __IGT_KMS_H__ */
> -- 
> 2.43.0
> 
