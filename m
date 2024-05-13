Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9783AC25B75
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 13:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3492110E78C;
	Mon, 13 May 2024 13:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZV5l1M3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EC910E78C
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715605776; x=1747141776;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GGjWLRQgVLbubl3JItm5GLC+l7UX8eSPY9FHv2bzuDk=;
 b=bZV5l1M3xT2PHXJVaiDQf4474ZaTc5ueBqBHoQm89OfucMki9aftw95e
 bEzC4cBH99qD8FF8FW6uIL/4dOMB/DAwcfrkDbTrmw1TdsBtr5Nzb3lKw
 PanaPH1CW63zhYecI9UYnovHNHO2cELjIbT5fqZezLSOw5loPRdU2f1Bp
 vx0LhJPmIw6spwyn64Cq2KS8OWxxi05USnFFHiMrDk22dSx+y3vm+1Hyr
 5RwTiCcqH/b6OQH11J2Rx+KYDSE/gVhQXspvcNKWnClOFW34mbpwoPaKW
 /u/EohcLdG3A1dhtPb5GeIms8vBQ1bEovO6zafH2ED9mPkpdYYMwB6BG9 Q==;
X-CSE-ConnectionGUID: 8d0g9dJ0RLiRGcDv0fjYwQ==
X-CSE-MsgGUID: 57r4rGazReS2/YrbKSYmJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15329850"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="15329850"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:09:35 -0700
X-CSE-ConnectionGUID: L5iqzwbqRxSyVwLe/ntlTA==
X-CSE-MsgGUID: xkiB/ZOWR5GFAdmbp3iG9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="61513581"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:09:33 -0700
Date: Mon, 13 May 2024 15:09:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, quic_jesszhan@quicinc.com,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, adrinael@adrinael.net,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 juha-pekka.heikkila@intel.com
Subject: Re: [PATCH i-g-t v2] lib/igt_kms: move setting
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback
Message-ID: <20240513130930.supfmh4dfl2attph@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 quic_jesszhan@quicinc.com, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 adrinael@adrinael.net,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 juha-pekka.heikkila@intel.com
References: <20240510-wb_igt_fix-v2-1-e14eef87319b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240510-wb_igt_fix-v2-1-e14eef87319b@quicinc.com>
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
On 2024-05-10 at 11:09:35 -0700, Abhinav Kumar wrote:
> Currently DRM_CLIENT_CAP_WRITEBACK_CONNECTORS is set in the igt_display_require()
> which is invoked for all IGT tests irrespective of whether the rest of the
> writeback connector properties such as the FB_ID are set.
> 
> For the writeback connectors to function properly, additional setup steps are
> required (like setting up the output buffers and submitting the job). These steps
> are not a part of the default IGT setup, so there is no guarantee that the pipeline
> will be executed at all. This results in regressions for msm boards across multiple
> IGT tests on writeback connectors such as CTM related tests where CRC needs to
> be collected after the CTM has been applied in hardware.
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
> changes in v2:
> 	- use igt_require_f to print descriptive message
> 	- add msm card failure details in commit text
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Acked-by: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Thank you for contribution, I merged it. There are some fails
for Xe but on i915 all runs ok.
Adding to cc few kms devs from Intel - Bhanu and J-P.

Regards,
Kamil

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
> index 6cd685b37af2..f89b2d62fcc9 100644
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
> +		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
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
