Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F61CF9C6E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 11:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C956310E3E8;
	Mon, 23 Sep 2024 11:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSjYsryO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE47710E3DF
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 11:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727092211; x=1758628211;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Y/NEbOFGHCrIJGPWagbbQEIbC2DVEDL3bo0BnX+oso4=;
 b=CSjYsryOFww4BVgbpboJHz5X0cWgnfODVgrKxJ7sNYdMrEbECAZDdS3V
 gaUWO3RJ9l4cIuJFY/4ktOEoc3+1XuAfui3RndwDbyyZ+V9u3Y/8KoXuj
 MLvmtWkaOajuioX95sMi+cJHBVWVe3cJkPSxa+cSmwF6Tegq9hTyqZEYR
 ASasqEdyNX3YEj7xX8jLI6q2Xz+KWkE4otv/nhYsNhctZuqY01ZxA+FG8
 cpbhT04R9rhEAZ1Piqnkc7kNdAjYa1HUTKsfWuDePiemLtdBzisA62shN
 MFBpjV2Mg14MoA4B80bfgT06cgco4zPQ8nz2eqzJaxc126xTySqwp1Llw g==;
X-CSE-ConnectionGUID: GaMNku7uTEiURlsKs+1N8w==
X-CSE-MsgGUID: 7ni/6MNGSjq1olyXdyzn2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="48560598"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="48560598"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:50:10 -0700
X-CSE-ConnectionGUID: BQ8qJtzXRAi+j+TLGUw7kg==
X-CSE-MsgGUID: S76Nvtl2SrWpaOjlNxe7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="75420101"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:50:09 -0700
Date: Mon, 23 Sep 2024 14:50:35 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/7] lib/igt_kms: add function to reset link params
Message-ID: <ZvFWC9rnVd_W5fXg@ideak-desk.fi.intel.com>
References: <20240922212549.1361889-1-kunal1.joshi@intel.com>
 <20240922212549.1361889-5-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922212549.1361889-5-kunal1.joshi@intel.com>
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

On Mon, Sep 23, 2024 at 02:55:46AM +0530, Kunal Joshi wrote:
> Writing auto to i915_dp_force_(link_rate/lane_count) and retraing
> afterwards sets max link param's supported by sink.Reset link rate
> and lane count to auto, also installs exit handler to set link rate
> and lane count to auto on exit
> 
> v2: no need to do link retraining (Imre)
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  lib/igt_kms.c | 32 ++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 33 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 011f3768a..96da33a48 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7062,3 +7062,35 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
>  	sscanf(buf, "%d", &ret);
>  	return ret;
>  }
> +
> +/**
> + * igt_reset_link_params:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Reset link rate and lane count to auto, also installs exit handler
> + * to set link rate and lane count to auto on exit
> + */
> +void igt_reset_link_params(int drm_fd, igt_output_t *output)
> +{
> +	bool valid;
> +	drmModeConnector *temp;
> +
> +	valid = true;
> +	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
> +						    "i915_dp_force_link_rate",
> +						    "auto", "auto", true);
> +	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
> +						    "i915_dp_force_lane_count",
> +						    "auto", "auto", true);
> +	igt_assert_f(valid, "Unable to set attr or install exit handler\n");
> +	dump_connector_attrs();
> +	igt_install_exit_handler(reset_connectors_at_exit);
> +
> +	/*
> +	 * To allow callers to always use GetConnectorCurrent we need to force a
> +	 * redetection here.
> +	 */
> +	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
> +	drmModeFreeConnector(temp);
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 34a671bce..264de4bb9 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1236,5 +1236,6 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
>  bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
>  int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
>  int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
> +void igt_reset_link_params(int drm_fd, igt_output_t *output);
>  
>  #endif /* __IGT_KMS_H__ */
> -- 
> 2.43.0
> 
