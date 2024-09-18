Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88040CCD1B3
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 14:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488C910E26C;
	Wed, 18 Sep 2024 14:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eM+n5o7s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BE110E26C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 14:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726669745; x=1758205745;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=47IUtEhzqhlQpgXNwrn85SaCyLKsGGiR4vayMKa+n8g=;
 b=eM+n5o7slyXr2+LOx1TYZOFmLKSAAXxLSSzeTFlnY7w+a1I8mR8ruNzL
 t4Vd1i9ymEupdP8LnzkDT73Z6fgyKupD0DzzFsr5svVm3hdAnUaUwezBE
 uO/HFPIGC/3gR14plZrK8ZhVf1QNHwIK2sGsgDGkSCOYr3c1Pu3Rx1V7o
 QMoF/szgZE0XeqleL3K2KY+LlIiLKh9w+xTCDgsbbRO4ilEJJx5CUqovZ
 jvopqscrnReMPl85hg2QNJ3AVhuva1QEYE1UZPcI6e5HdP3YSnS2tXTrb
 q487ATyQwH8mdqL2sZX21f7sjg5SLXdt9iHQkwTD0/JZQ3iKCmlC8GAU3 Q==;
X-CSE-ConnectionGUID: En4FRAqCR0KPqq215CM9Uw==
X-CSE-MsgGUID: fBtt1jF5TQ6cTxh2CJ0Fvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36717162"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="36717162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:29:05 -0700
X-CSE-ConnectionGUID: EUIKV+LgRwqQAE9NWnDyzg==
X-CSE-MsgGUID: UcwujvDCSsy2tv1soYMlcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="74405768"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:29:04 -0700
Date: Wed, 18 Sep 2024 17:29:28 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/6] lib/igt_kms: add DP link management helper
 functions
Message-ID: <ZurjyCEBLCYLhdSi@ideak-desk.fi.intel.com>
References: <20240912062839.760661-1-kunal1.joshi@intel.com>
 <20240912062839.760661-2-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912062839.760661-2-kunal1.joshi@intel.com>
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

On Thu, Sep 12, 2024 at 11:58:34AM +0530, Kunal Joshi wrote:
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
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 210 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  10 +++
>  2 files changed, 220 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index dd530dbab..f0ac1e5dc 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -61,6 +61,7 @@
>  #include "sw_sync.h"
>  #ifdef HAVE_CHAMELIUM
>  #include "igt_chamelium.h"
> +#include <ctype.h>
>  #endif
>  
>  /**
> @@ -6705,3 +6706,212 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
>  
>  	return num_scalers;
>  }
> +
> +/**
> + * igt_get_dp_link_param_set_for_output:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + * @link_param: 0 for lane count, 1 for link rate
> + *
> + * Returns: link_rate / lane_count if set for output else -1
> + */
> +int igt_get_dp_link_param_set_for_output(int drm_fd, igt_output_t *output, int link_param)

At the call-site it's not clear what link_param=0/1 means. Instead of
that param I'd rather add debugfs_connector_read/write helpers and
export these functions with a self-descriptive name (i.e. stg. like
igt_get_dp_current_link_rate/lane_count()).

> +{
> +	char *star_ptr, *param_ptr;
> +	char buf[512];
> +	int dir, res;
> +	int ret;
> +
> +	ret = -1;
> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +		     igt_output_name(output));
> +	res = igt_debugfs_simple_read(dir, link_param ? "i915_dp_force_link_rate" :
> +				      "i915_dp_force_lane_count", buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res >= 0);
> +
> +	/*
> +	 * Check we have a mode enabled for the output
> +	 * If so we will have current  active link rate
> +	 * marked with a *
> +	 */
> +	star_ptr = strstr(buf, "*");
> +
> +	if (star_ptr) {
> +		param_ptr = star_ptr - 1;
> +		while (param_ptr > buf && isdigit(*param_ptr))
> +			param_ptr--;
> +
> +		param_ptr++;
> +		igt_assert(sscanf(param_ptr, "%d", &ret) == 1);
> +	}
> +	return ret;
> +}
> +
> +/**
> + * igt_get_dp_max_link_param:
> + * @drm_fd: A drm file descriptor
> + * @output: The output to query
> + * @link_param: 0 for lane count, 1 for link rate
> + *
> + * Get the max link_rate / lane_count supported by the sink.
> + *
> + * Returns: max link_rate / lane_count supported by the sink.
> + */
> +int igt_get_dp_max_link_param(int drm_fd, igt_output_t *output, int link_param)
> +{
> +	char buf[512];
> +	int dir, res;
> +	int max_link_param;
> +
> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_DIRECTORY);

Not sure why O_DIRECTORY is used here and O_RDONLY elsewhere. This and
all the functions below could use common
debugfs_connector_read/write helpers discussed above.

> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +				 igt_output_name(output));
> +	res = igt_debugfs_simple_read(dir, link_param ? "i915_dp_max_link_rate" :
> +				      "i915_dp_max_lane_count", buf, sizeof(buf));
> +	close(dir);
> +	igt_require_f(res >= 0, "Couldn't read i915_dp_max_link_rate");
> +
> +	igt_assert(sscanf(buf, "%d", &max_link_param) == 1);
> +
> +	return max_link_param;
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
> +	int dir;
> +	char value[2];
> +
> +	snprintf(value, sizeof(value), "%d", retrain_count);
> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +			       igt_output_name(output));
> +	igt_sysfs_write(dir, "i915_dp_force_link_retrain", value, sizeof(value));
> +	close(dir);
> +}
> +
> +/**
> + * igt_force_lt_failure:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + * @failure_count: 1 for same link param and
> + *                2 for reduced link params
> + *
> + * Force link training failure on the output.
> + * @failure_count: 1 for retraining with same link params
> + *				   2 for retraining with reduced link params
> + */
> +void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
> +{
> +	int dir;
> +	char value[2];
> +
> +	snprintf(value, sizeof(value), "%d", failure_count);
> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +			       igt_output_name(output));
> +	igt_sysfs_write(dir, "i915_dp_force_link_training_failure",
> +			     value, sizeof(value));
> +	close(dir);
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
> +	int dir, res;
> +	char buf[512];
> +
> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +			       igt_output_name(output));
> +	res = igt_debugfs_simple_read(dir,
> +				      "i915_dp_link_retrain_disabled",
> +				      buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res >= 0);
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
> +	int debugfs_fd, ret;
> +	char buf[512];
> +
> +	igt_assert_f(output->name, "Invalid output\n");
> +	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
> +	if (debugfs_fd < 0)
> +		return false;
> +	ret = igt_debugfs_simple_read(debugfs_fd,
> +				      "i915_dp_force_link_training_failure",
> +				      buf, sizeof(buf));
> +	close(debugfs_fd);
> +	return ret >= 0;
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
> +	int dir, res, ret;
> +	char buf[512];
> +
> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +			       igt_output_name(output));
> +	res = igt_debugfs_simple_read(dir, "i915_dp_force_link_training_failure", buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res >= 0);
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
> +	int dir, res, ret;
> +	char buf[512];
> +
> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +			       igt_output_name(output));
> +	res = igt_debugfs_simple_read(dir, "i915_dp_force_link_retrain", buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res >= 0);
> +	sscanf(buf, "%d", &ret);
> +	return ret;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 25ba50916..895bc9d04 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1224,5 +1224,15 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
>  bool igt_check_output_is_dp_mst(igt_output_t *output);
>  int igt_get_dp_mst_connector_id(igt_output_t *output);
>  int get_num_scalers(igt_display_t *display, enum pipe pipe);
> +int igt_get_dp_link_param_set_for_output(int drm_fd, igt_output_t *output,
> +					 int link_param);
> +int igt_get_dp_max_link_param(int drm_fd, igt_output_t *output,
> +			      int link_param);
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
