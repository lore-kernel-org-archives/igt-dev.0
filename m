Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01ACCCD1B3
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 14:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608B910E26C;
	Wed, 18 Sep 2024 14:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdIaR3rd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA8510E26C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726670107; x=1758206107;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=P+lqrQ8L34vOnNQKeogLkUGpFnMOSixH9pjudkPEJV8=;
 b=bdIaR3rdTOlqhMPej8DmAlM3AJFJv7Ei5I1Z8hMlKGmyw4P3PGmQZ7y8
 M1Vl9Ib2QKD9a5wBNC+fxHGTp+3Kpu/ESqz2JcDWaPMuTbuYMajOeYwEw
 iC9oNIo5PgeUgiVrIMGrD59XkG40u2dNFb7g/xbpQFygiqL+zk+jDUACw
 QhndiZ10gq2OQvpJ8HbXPuuoueXaxKSHM7pMK00L2DPQAfmP3aHR+zUin
 YeFA9OWsGl2G8dBMn0F9tr1qvNB3Tk52Gs36UxmkUl2rRtVVq5YTrb0W/
 bddI0GaUhvsR/Mp8owmSLtIZ5cBua4Nezi/6+IH2n5Uh052ru5lemhb7D g==;
X-CSE-ConnectionGUID: haKmTzI3RouDOUZiblA3YA==
X-CSE-MsgGUID: fQE/lTLOQbGQZ/WFaIoDKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25745577"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25745577"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:35:07 -0700
X-CSE-ConnectionGUID: BX7ldXtVQHGRtv/2pitRxA==
X-CSE-MsgGUID: N+qpxBepRUCrWGPOUoSO0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69465881"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:35:06 -0700
Date: Wed, 18 Sep 2024 17:35:31 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/6] lib/igt_kms: add function to reset link params
Message-ID: <ZurlM6IhzPX2ALXw@ideak-desk.fi.intel.com>
References: <20240912062839.760661-1-kunal1.joshi@intel.com>
 <20240912062839.760661-5-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912062839.760661-5-kunal1.joshi@intel.com>
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

On Thu, Sep 12, 2024 at 11:58:37AM +0530, Kunal Joshi wrote:
> Writing auto to i915_dp_force_(link_rate/lane_count) and retraing
> afterwards sets max link param's supported by sink.Reset link rate
> and lane count to auto, also installs exit handler to set link rate
> and lane count to auto on exit
> 
> v2: no need to do link retraining (Imre)
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 34 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a7f8d0f83..f841a69da 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6957,3 +6957,36 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
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
> +	igt_require_f(output->name, "Invalid output");

The above check got removed for the rest of similar helpers.

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
> index 9dca09d93..3c867031e 100644
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
