Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932F0CD343A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 14:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2045010E5BE;
	Tue,  3 Sep 2024 14:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hY6DTPMT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BEC10E5BE
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725373553; x=1756909553;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=8x7UX6sAZHVwk9N/qaPYrz8NXX8lT/rhnIt3LFTZCw4=;
 b=hY6DTPMTN3iy4P/PN/0yBaZDMkpCVaM3vbeeOkECybQIDKF/IJguqVnf
 nXnC1cp60yhUQp1JV9okKF/DQos+W9NNr88KN9TPf/idNSlOPpIsrQrQ1
 YwdexeYzEvxy2BA5IybvQBmsSoVgqsoCz/bfu5PbqwoLxtpsiGPU106qt
 98W4EKxJlGdqLG88HPbF8n7JAjfo5/5a5xkspWA9vj6LqYHEI7uwAYT/l
 iuMzbOHhmjIn6u/7rLkkSHHFnJ79xPVCpnpp+EUtW8ohGt+BuPo8aYBA/
 aCDMLIPAIxD9A6hEsl9mB8kXizhp6GyCkTJ34akQ6yvUgJcxr4h8IiAcR g==;
X-CSE-ConnectionGUID: To/xpWDMTcycMLBeGg/Dnw==
X-CSE-MsgGUID: lZgmbI+/Ro2WoL6zKPnArw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27730875"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="27730875"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 07:25:52 -0700
X-CSE-ConnectionGUID: aX6asaM9QiW+LlrCELiLYA==
X-CSE-MsgGUID: WgOSAOe3QG2Rrwz37Pc1Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="65441648"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 07:25:51 -0700
Date: Tue, 3 Sep 2024 17:26:13 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 11/14] lib/igt_kms: add function to reset link params
Message-ID: <ZtcchZEiGan9msTA@ideak-desk.fi.intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-12-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825200612.4036178-12-kunal1.joshi@intel.com>
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

On Mon, Aug 26, 2024 at 01:36:09AM +0530, Kunal Joshi wrote:
> Writing auto to i915_dp_force_(link_rate/lane_count) and retraing
> afterwards sets max link param's supported by sink.Reset link rate
> and lane count to auto, also installs exit handler to set link rate
> and lane count to auto on exit
> ---
>  lib/igt_kms.c | 36 ++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 37 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e0533f6ae..b7511ccfc 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7000,3 +7000,39 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
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
> +	valid = true;
> +	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
> +						    "i915_dp_force_link_rate",
> +						    "auto", "auto");
> +	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
> +						    "i915_dp_force_lane_count",
> +						    "auto", "auto");

Couldn't the above use the corresponding helpers added? I don't see
those used elsewhere.

> +	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
> +						    "i915_dp_force_link_retrain",
> +						    "1", "1");

Not sure if this is needed, if the link params are reset before a
modeset. The latter does a link training anyway if needed.


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
> index 3d7842b36..847609379 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1259,5 +1259,6 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
>  bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
>  int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
>  int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
> +void igt_reset_link_params(int drm_fd, igt_output_t *output);
>  
>  #endif /* __IGT_KMS_H__ */
> -- 
> 2.34.1
> 
