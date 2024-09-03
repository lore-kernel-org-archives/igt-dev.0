Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68785CD342E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 13:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E64010E594;
	Tue,  3 Sep 2024 13:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgoKuAlX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3208B10E594
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 13:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725369081; x=1756905081;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=H5wRO8GgG6V2iwi8r7J/3H3fAjT7Hqsh1wl6qqoRZzI=;
 b=DgoKuAlXz2II6po4ZXvBg+/lfUoAYW3aN335a70UtPqX93bb9MTJsrsF
 MQM5V3JZjEBDhOdkTQ95KVXTihkzI8LINQK8YyEewJo3iXlOERPs9N6SI
 xqdsxXwVfi7PMRjInyEAe1LVblGcGCqpzGRIrJgUOvocah3GUtCa7RgH8
 ctbHmqdtqOET/zU17Qge1SseEORh5aqw4ef+tqA0+WxYx3qtIWO2exLhV
 so/K0Imy3GaLIvQ9d4BAGe5yxceVlb6RqcXd010QfHhVm2+NSOdJXExoU
 AJJ4yCadizWObcICNExzqYIU9VXu8SIZrHo82WLLwEZEV5+I+T+67jYtd w==;
X-CSE-ConnectionGUID: FLGVETAESuasP0UsPLA7DA==
X-CSE-MsgGUID: TlTs5oghT4+szcA8Sx/rCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41435261"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="41435261"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:11:21 -0700
X-CSE-ConnectionGUID: dE/INmlBQtK6OlrKxLydiQ==
X-CSE-MsgGUID: BG7vR4XNR3qje69WtlUkZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="64894212"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:11:20 -0700
Date: Tue, 3 Sep 2024 16:11:40 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link
 rate/lane count
Message-ID: <ZtcLDMfaefI28u2d@ideak-desk.fi.intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-4-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825200612.4036178-4-kunal1.joshi@intel.com>
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

On Mon, Aug 26, 2024 at 01:36:01AM +0530, Kunal Joshi wrote:
> i915_dp_max_(lane_count/link_rate) debugfs files expose max link
> rate/lane count for connector.add function to get max link rate/lane
> lane count for connector
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 4ef7f4d7f..21ea8550c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6763,3 +6763,61 @@ enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
>  
>  	return lane_count;
>  }
> +
> +/**
> + * igt_get_dp_max_link_rate:
> + * @drm_fd: A drm file descriptor
> + * @output: The output to query
> + *
> + * Get the max link rate supported by the sink.
> + *
> + * Returns: Max link rate supported by the sink.
> + */
> +enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int dir, res;
> +	int max_link_rate;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_DIRECTORY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +				 igt_output_name(output));
> +	res = igt_debugfs_simple_read(dir, "i915_dp_max_link_rate",
> +								  buf, sizeof(buf));
> +	close(dir);
> +	igt_require_f(res > 0, "Couldn't read i915_dp_max_link_rate");
> +
> +	igt_assert(sscanf(buf, "%d", &max_link_rate) == 1);
> +
> +	return max_link_rate;
> +}

The comments from the previous patch apply here too. This makes me
wonder if it'd make more sense to add all these DP link training debugfs
entries from one patch.

> +
> +/**
> + * igt_get_dp_max_lane_count:
> + * @drm_fd: A drm file descriptor
> + * @output: The output to query
> + *
> + * Get the max lane count supported by the sink.
> + *
> + * Returns: Max lane count supported by the sink.
> + */
> +enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int dir, res;
> +	int max_lane_count;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +				 igt_output_name(output));
> +	res = igt_debugfs_simple_read(dir, "i915_dp_max_lane_count",
> +								  buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	igt_assert(sscanf(buf, "%d", &max_lane_count) == 1);
> +
> +	return max_lane_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 9d42a2b35..1d3226c5c 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1249,5 +1249,7 @@ int igt_get_dp_mst_connector_id(igt_output_t *output);
>  int get_num_scalers(igt_display_t *display, enum pipe pipe);
>  enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
>  enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
> +enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
> +enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
>  
>  #endif /* __IGT_KMS_H__ */
> -- 
> 2.34.1
> 
