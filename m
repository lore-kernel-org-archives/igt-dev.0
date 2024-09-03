Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE14CD3430
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 13:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19D810E5A1;
	Tue,  3 Sep 2024 13:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPB2aKAN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F8210E5A1
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 13:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725368895; x=1756904895;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=r82UVL46oj9rlWyWti/USm3QavBGckxkbLNp++sKvts=;
 b=FPB2aKANNTJP4PlcHGBtUlR3WcDgO0QxiPPOqsiCMmXtThU/34jpiBmo
 G+MhBPEK/y/0D2VLodgUWqD8sttCo1k/vvjO6bi3K2R/gH5vRZQxz4RD2
 XxBRxmmw4WmeV/JlcD3S0W0QcD21BVE+AUxls4YlDN5ghaGtQToWXvw+r
 EGf+EQkVirUxhsSaLqoKn1Iym0Sh8fbCe43wqYokUcCnbSMidg84kdTgs
 IBEZWwqz//ocnl/HBcpxzpGDV6aH3Tz6BpGhTJ7yw4TXwUP2RI4Dsu9SX
 9o35txufGQXvhj+NFZvu7YiwtUdnRimhm/COs4c61QxWmd+Vwk99T7S3b Q==;
X-CSE-ConnectionGUID: js2cEZZERTC0dqyxctMHQg==
X-CSE-MsgGUID: 5ue96voTQ1SfGRkRWrW8mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27845434"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="27845434"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:08:15 -0700
X-CSE-ConnectionGUID: yktdpVd5T3KL/kR6QpjX1g==
X-CSE-MsgGUID: 90kU3BxhTSWi9D7yX7hfjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="69045973"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:08:14 -0700
Date: Tue, 3 Sep 2024 16:08:36 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/14] lib/igt_kms: add helper to get current link
 rate/ lane count for connector
Message-ID: <ZtcKVEMveXWJVCO9@ideak-desk.fi.intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-3-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825200612.4036178-3-kunal1.joshi@intel.com>
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

On Mon, Aug 26, 2024 at 01:36:00AM +0530, Kunal Joshi wrote:
> i915_dp_force_(lane_count/link_rate) debugfs files expoose
> current link rate/lane count for connector.add helper to get
> current link rate/ lane count for connector
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index dd530dbab..4ef7f4d7f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6705,3 +6705,61 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
>  
>  	return num_scalers;
>  }
> +
> +/**
> + * igt_get_dp_link_rate_set_for_output:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: Link rate set for the output.
> + */
> +enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int dir, res;
> +	int link_rate;
> +
> +	igt_require_f(output->name, "Invalid output");

It's strange to check this in these library functions. I'd think the
caller should make sure already that it's a valid output, how can it
become invalid in the test this patchset adds?

> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +				 igt_output_name(output));
> +	res = igt_debugfs_simple_read(dir, "i915_dp_force_link_rate", buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res > 0);

res == 0 is also valid.

> +
> +	if (strstr(buf, "[auto]"))
> +		igt_assert(sscanf(strstr(buf, "*") - 6, "%d", &link_rate) == 1);
> +	else
> +		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &link_rate) == 1);

I suppose this should return the rate used for an active output. It
should be the one with the '*' marker, regardless if the rate is getting
selected automatically or forced. In case it's forced the selected rate
could be different than the target with the '[]' markers (if the sink
doesn't support the target rate). So I think this should return the one
marked with '*' or an error if such is not found (when the output is
disabled).

> +
> +	return link_rate;
> +}
> +
> +/**
> + * igt_get_dp_lane_count_set_for_output:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: Lane count set for the output.
> + */
> +enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int dir, res;
> +	int lane_count;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
> +				 igt_output_name(output));
> +	res = igt_debugfs_simple_read(dir, "i915_dp_force_lane_count", buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	if (strstr(buf, "[auto]"))
> +		igt_assert(sscanf(strstr(buf, "*") - 2, "%d", &lane_count) == 1);
> +	else
> +		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &lane_count) == 1);

The same as above apply in this function too.

> +
> +	return lane_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 999921f9f..9d42a2b35 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1247,5 +1247,7 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
>  bool igt_check_output_is_dp_mst(igt_output_t *output);
>  int igt_get_dp_mst_connector_id(igt_output_t *output);
>  int get_num_scalers(igt_display_t *display, enum pipe pipe);
> +enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
> +enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
>  
>  #endif /* __IGT_KMS_H__ */
> -- 
> 2.34.1
> 
