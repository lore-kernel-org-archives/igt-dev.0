Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C783DCD98CC
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 05:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAF710E56F;
	Fri, 12 Jun 2026 05:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtXox2yS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF6510E56F
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 05:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781241255; x=1812777255;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sCKRJv4GYlxMdR2CuHnXdV7mZWUXLwPv4CePWh7COMM=;
 b=mtXox2ySFjPnvY7CsMNhwKYaf+yyYTk1HEKlLTdJEXWfo9PpW/F86Gl4
 GmwMbRNo/ecOqjRAy6WvavLx95mU6xg0tTG8tqIpjnMJ+IkpXkaf2VkWj
 SP1+rFjLtmvLuk7FVludUEIOUDrj6229io9XONm+rFqQP/RgTPv4IS6Uk
 hMNxvYUI9ywwCIGMQprrLcYQlglKoBKUvzMwCqZ368oVr29qZv/IdNgdL
 rW4Q3qKVOoGpHyU/+ED03rRJS77DiybSsgqb4KmrecwqPHoDeM65davMK
 QcCpj7bIwy9JgZDTplBBhK90fhw9OhWoJAiLKjhXutFaOu43hhb1clKwz g==;
X-CSE-ConnectionGUID: PuuD1xmNR8asYIiriIz5MQ==
X-CSE-MsgGUID: Wshb/SjGQ4ebD1p65KxLTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92388272"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="92388272"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 22:14:14 -0700
X-CSE-ConnectionGUID: Z4Ji9F2ZSziykSA4xBkX5Q==
X-CSE-MsgGUID: VgYq29niQBiObJYsVLvgvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="248610805"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.118.194])
 ([10.66.118.194])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 22:14:13 -0700
Message-ID: <801eff6f-eb98-4179-ab5b-16c4222cc0c6@intel.com>
Date: Fri, 12 Jun 2026 10:44:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v3,
 1/3] lib/igt_kms: Add MST bandwidth-fitting support and helpers
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, ramanaidu.naladala@intel.com
References: <20260527135109.3291120-2-sowmiya.s@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260527135109.3291120-2-sowmiya.s@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello Sowmiya,

On 27-05-2026 19:21, Sowmiya S wrote:
> Add helpers to handle shared-link DP bandwidth fitting for
> MST/daisy-chain configurations.
>
> On MST hubs/daisy-chains multiple streams share one DP link
> and a joint atomic commit can be rejected unless modes are
> chosen to fit the link BW. This will centralizes MST detection
> and fitting so tests can request fitting only when required.
>
> v2: Remove the flag used for caching values and update the
> function name to better describe its functionality (Jani)
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   lib/igt_kms.c | 37 +++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 39 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e20307923..639a5f80b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2746,6 +2746,7 @@ static void igt_output_reset(igt_output_t *output)
>   {
>   	output->pending_crtc = NULL;
>   	output->use_override_mode = false;
> +	output->bw_fit_applied = false;
>   	memset(&output->override_mode, 0, sizeof(output->override_mode));
>   
>   	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, 0);
> @@ -5384,6 +5385,7 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
>   		int ret;
>   
>   		igt_output_override_mode(output, mode);
> +		output->bw_fit_applied = true;
>   
>   		if (__override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, base + 1))
>   			return true;
> @@ -5453,6 +5455,11 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
>   {
>   	int ret;
>   
> +	igt_output_t *output;
> +
> +	for_each_output(display, output)
> +		output->bw_fit_applied = false;
> +
>   	if (display->is_atomic)
>   		ret = igt_display_try_commit_atomic(display,
>   						    DRM_MODE_ATOMIC_TEST_ONLY |
> @@ -5473,6 +5480,36 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
>   	return true;
>   }
>   
> +/**
> + * igt_require_mst_link_bw:
> + * @display: a pointer to an #igt_display_t structure
> + *
> + * When two or more DP-MST streams share the same upstream link, a joint
> + * atomic commit may be rejected by the driver if the combined stream
> + * bandwidth exceeds the link capacity.  This function detects that
> + * situation and, when found, calls igt_fit_modes_in_bw() to select mode
> + * overrides that satisfy the shared-link BW budget.  The test is skipped
> + * if no valid combination can be found.  No-op when fewer than two active
> + * MST streams are present.
> + */
> +void igt_require_mst_link_bw(igt_display_t *display)
> +{
> +	igt_output_t *output;
> +	int active_mst = 0;
> +
> +	for_each_output(display, output) {
> +		if (output->pending_crtc &&
> +			igt_check_output_is_dp_mst(output))
> +			active_mst++;
Here we would need to find mst output which share's one root
For below case we don't need to fit bw since neither link shares bw
Platform -> Hub1 -> Display1
Platform -> Hub2 -> Display1

We need it for below cases
Platform -> Hub1 -> Display1 -> Display2

Also since we need to consider tunnels for fitting bw,
As shared bandwidth for DP tunnel whether MST/SST shares the same link.
Refer intel_dp_tunnel_atomic_check_link, 
drm_dp_tunnel_atomic_check_group_bw
> +	}
> +
> +	if (active_mst < 2)
> +		return;
> +
> +	igt_require_f(igt_fit_modes_in_bw(display),
> +			  "No valid mode combination fits available MST link BW\n");
> +}
> +
>   /**
>    * igt_crtc_refresh:
>    * @crtc: CRTC to refresh
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c2a3099de..eab4dfded 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -508,6 +508,7 @@ typedef struct {
>   
>   	/* bitmask of changed properties */
>   	uint64_t changed;
> +	bool bw_fit_applied;
I see bw_fit_applied added and toggled but not used anywhere
Please check if this is required.

Thanks and Regards
Kunal Joshi

>   
>   	uint32_t props[IGT_NUM_CONNECTOR_PROPS];
>   	uint64_t values[IGT_NUM_CONNECTOR_PROPS];
> @@ -1293,6 +1294,7 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
>   uint64_t igt_get_writeback_fb_id(igt_output_t *output);
>   void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
>   void igt_get_and_wait_out_fence(igt_output_t *output);
> +void igt_require_mst_link_bw(igt_display_t *display);
>   
>   igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
>   
