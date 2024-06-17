Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F96C27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 12:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9175710E36D;
	Mon, 17 Jun 2024 12:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMX8B6xI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D239710E36D
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 12:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718625777; x=1750161777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5X2ZcgX8CLVKHahoyUpWfljfTbLOAdY0o7e6NqtZy3s=;
 b=CMX8B6xI1bfrCbzbMpDx8ochvrEZfr5qCDm2df+ONTfeP+RFXdvW5qpx
 ce+BYRudEPckv7lInj0L7iwrnZ7j2C+g0jjCT0fb8p7HPmNpQBRBDsrSh
 OuQY1aTc+VCOk9MhizRh5eutwdeyDFu3cso2MGap4NofOUB7Oiv+B77SN
 asme16nq1/NLkSSricjkP1Hu3P6aadoEEHOhyE4YD4EvJ4Z0APNRDkXb7
 mS3ovV7d6qgDI2XjQuxBr+oM40KkDDV+baDYhWC6lBCbyWnIj/lOId+1w
 /QvDvsddT4DSvtvi0Acva/0ABikSSH8miUxsGZ4L1zB+A2dQXCavov0A/ g==;
X-CSE-ConnectionGUID: JvpI1zltRv6gpMpyEWIV5g==
X-CSE-MsgGUID: HNg9FIHWSI2dIoVNXTtZGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15163746"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="15163746"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 05:02:56 -0700
X-CSE-ConnectionGUID: OiFhWEPXRKaXGBtLX/3Zeg==
X-CSE-MsgGUID: NWzINNk7QqmdXxICqYOXUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="72377241"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 05:02:55 -0700
Date: Mon, 17 Jun 2024 14:02:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/i915_pm_rpm: warn and skip test if
 reading connector fails
Message-ID: <20240617115419.2i4s6k5op547hl26@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>
References: <20240614113320.197121-1-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614113320.197121-1-luciano.coelho@intel.com>
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

Hi Luca,
On 2024-06-14 at 14:33:20 +0300, Luca Coelho wrote:
> Fail test requirements if we can't set the initial data.  This is
> usually caused by not being able to retrieve a connector due to
> possible race-conditions.  In this case, we have issued a warning to
> cause the test to fail and not just skip.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Jani Saarinen <jani.saarinen@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/i915_pm_rpm.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index e0f395fa8a84..31758b1a5e35 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -506,7 +506,7 @@ static drmModePropertyBlobPtr get_connector_edid(drmModeConnectorPtr connector,
>  	return blob;
>  }
>  
> -static void init_mode_set_data(struct mode_set_data *data)
> +static bool init_mode_set_data(struct mode_set_data *data)
>  {
>  	data->res = drmModeGetResources(drm_fd);
>  	if (data->res) {
> @@ -518,7 +518,7 @@ static void init_mode_set_data(struct mode_set_data *data)
>  			if (!data->connectors[i]) {
>  				igt_warn("Could not read connector %u\n",
>  					 data->res->connectors[i]);
> -				continue;
> +				return false;
>  			}
>  
>  			data->edids[i] = get_connector_edid(data->connectors[i], i);
> @@ -529,6 +529,8 @@ static void init_mode_set_data(struct mode_set_data *data)
>  	}
>  
>  	init_modeset_cached_params(&ms_data);
> +
> +	return true;
>  }
>  
>  static void fini_mode_set_data(struct mode_set_data *data)
> @@ -598,8 +600,15 @@ static bool setup_environment(bool display_enabled)
>  
>  	ms_data.devid = intel_get_drm_devid(drm_fd);
>  
> -	if (display_enabled)
> -		init_mode_set_data(&ms_data);
> +	/*
> +	 * Fail test requirements if we can't set the initial data.
> +	 * This is usually caused by not being able to retrieve a
> +	 * connector due to possible race-conditions.  In this case,
> +	 * we should have issued a warning to cause the test to fail
> +	 * and not just skip.
> +	 */
> +	if (display_enabled && !init_mode_set_data(&ms_data))
> +		return false;
>  
>  	igt_pm_enable_sata_link_power_management();
>  
> -- 
> 2.39.2
> 
