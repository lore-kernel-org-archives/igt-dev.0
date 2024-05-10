Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDA9C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 14:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C570F10ED44;
	Fri, 10 May 2024 14:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeQy5xX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0662910E76C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715351422; x=1746887422;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qzBN6acLI9K6zEBoIRPsUSgBTnYNf2mfZQinR6rlCFQ=;
 b=CeQy5xX8FqdtLqtFwwInnvo9UH5EkNCzmd3CdbB1C/KWmkgdLpRX/uhg
 KVdUKbUoduKe0Lj9ryODp5cFLDmRWLdkAT3fj9O3RihIAQKfqpZN8oBN+
 N985lnuSeKD7bkiNt8aZm04Pr7CxNXsUrKDChPGeivrJ+CNg6ni53wucE
 HeLAAcLSwOe/MCUdH37cQppOmqyMZ4Ll17Kgs2qtihnl8YILvO8r9RVtE
 iiHtE/OL6xGHyGNSPCEkHKkUcsiln7iMHZ9p6gUph2QnnZjZCsuy1db5B
 G9zNrFopoBNVdJFKzBh92ah1sjxdKwKdlBdMLaCRbUmrpNSDaK+7EyGmA w==;
X-CSE-ConnectionGUID: uZfh/mWtR3+0GdgKoXYu6Q==
X-CSE-MsgGUID: FWx56mFWSCGx+RNX7yMFWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11460816"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11460816"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 07:30:21 -0700
X-CSE-ConnectionGUID: XEdiXj3dRMaQ3E9w+XmQMg==
X-CSE-MsgGUID: kTVSp7o6SmyiXtt8C36RVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34074131"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:30:19 -0700
Date: Fri, 10 May 2024 16:29:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, quic_jesszhan@quicinc.com,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, adrinael@adrinael.net
Subject: Re: [PATCH i-g-t] lib/igt_kms: move setting
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback
Message-ID: <20240510142959.67fw4vjorlvbptwb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 quic_jesszhan@quicinc.com, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 adrinael@adrinael.net
References: <20240509-wb_igt_fix-v1-1-41fc4b139390@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240509-wb_igt_fix-v1-1-41fc4b139390@quicinc.com>
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

Hi Abhinav,
On 2024-05-09 at 13:39:11 -0700, Abhinav Kumar wrote:
> Currently DRM_CLIENT_CAP_WRITEBACK_CONNECTORS is set in the igt_display_require()
> which is invoked for all IGT tests irrespective of whether the rest of the
> writeback connector properties such as the FB_ID are set.
> 
> For the writeback connectors to function properly, additional setup steps are required
> (like setting up the output buffers and submitting the job). These steps are not a part
> of the default IGT setup, so there is no guarantee that the pipeline will
> be executed at all.
> 
> It is unclear whether this is intentional to be able to run all IGT tests even
> with writeback connector or it is only kms_writeback which is supposed to
> be the one.
> 
> Lets try with the latter approach by setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
> only within kms_writeback.
> 
> changes since RFC:
> 	- minor fixes to commit message
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  lib/igt_kms.c         | 2 --
>  tests/kms_writeback.c | 5 +++++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 98d3fb79cd22..f82102144ea1 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2878,8 +2878,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>  		display->is_atomic = 1;
>  
> -	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> -
>  	resources = drmModeGetResources(display->drm_fd);
>  	if (!resources)
>  		goto out;
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 6cd685b37af2..3448dc06f891 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -558,6 +558,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>  	igt_fb_t input_fb, input_fb_10bit;
>  	drmModeModeInfo mode;
>  	unsigned int fb_id;
> +	int ret;
>  
>  	memset(&display, 0, sizeof(display));
>  
> @@ -570,6 +571,10 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>  
>  		igt_require(display.is_atomic);
>  
> +		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> +
> +		igt_require(!ret);
---------------------^
Use igt_require_f() or change 'ret' into has_writeback_connectors

With that it is

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

(plus ack from Petri on irc)

Regards,
Kamil

> +
>  		output = kms_writeback_get_output(&display);
>  		igt_require(output);
>  
> 
> ---
> base-commit: 4a5fd4e7cb2798636f6464e2bd61399f3242b322
> change-id: 20240509-wb_igt_fix-87169651e0da
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
