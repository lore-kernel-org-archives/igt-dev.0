Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9101DCA1005
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 11:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492AC10E436;
	Mon,  1 Sep 2025 11:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+V/H2dW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3BB10E421
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 11:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756725251; x=1788261251;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vMR+WDjJ7RLsyAcverslh8GQOTKChtZcbkHXtfSeg+I=;
 b=m+V/H2dWSL8612RmVbXqawy1RDTYVo6bUV22RLIeNJXusDRQF5DrAMEc
 YnAB7TnjI8rwtDHPFL8rLKJg0AZvZ9G+0yA8uuF4FtGTBmbpvxyjVziHb
 j9nguHS3tJfdV5i0QQXJuB/7Bma3BmSOnTQI0CuBRiWMOLy57Stb8e2rg
 E1BMJ/DM3nRIneDyUw5+A/cX2xOfo6DdTEyJNZN6g0vC+fs2i9eeUHgRv
 fkPCN98jNjEsMdYSxk6sUsVhBowUayRvUAIfLVgbJ92V0t85dqHM7cRJm
 fekZW5Dq5S2XfttTjd+DAyTlT4+X4wp7rYf+EmlhT78h/lO89S3RKk+fN g==;
X-CSE-ConnectionGUID: 9wpyMHixSz6sEI9sVK85RQ==
X-CSE-MsgGUID: 9RS/e8arTB2y021+/1qgTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="59122893"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="59122893"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 04:14:11 -0700
X-CSE-ConnectionGUID: VzPzMXuMQWGWiLbaiGsMCA==
X-CSE-MsgGUID: PP0qB5TESRyL1ixC9MgQmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="175140145"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 04:14:09 -0700
Date: Mon, 1 Sep 2025 13:14:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_sriov_flr: Skip non-MAIN GTs
 when reading provisioning data
Message-ID: <20250901111406.feyft7brtzkiokn5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250829104037.649426-1-marcin.bernatowicz@linux.intel.com>
 <20250829104037.649426-3-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829104037.649426-3-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-08-29 at 12:40:37 +0200, Marcin Bernatowicz wrote:
> Provisioning (GGTT and LMEM) is exposed only on MAIN GTs.
> Non-MAIN GTs (e.g., MEDIA) do not provide provisioning data,
> so attempting to read it there previously caused skips.
> 
> Restrict the GGTT and LMEM subtests to MAIN GTs only.
> 
> Suggested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_sriov_flr.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index fc08703c0..448b63521 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -596,8 +596,9 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
>  {
>  	struct ggtt_data *gdata = (struct ggtt_data *)data;
>  
> -	if (xe_is_media_gt(data->pf_fd, data->gt)) {
> -		set_skip_reason(data, "GGTT unavailable on media GT\n");
> +	if (!xe_is_main_gt(data->pf_fd, data->gt)) {
> +		set_skip_reason(data, "GGTT provisioning not exposed on GT%d (non-MAIN)\n",
> +				data->gt);
>  		return;
>  	}
>  
> @@ -813,6 +814,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
>  	igt_assert(ldata->vf_lmem_size);
>  
>  	xe_for_each_gt(data->pf_fd, gt) {
> +		if (!xe_is_main_gt(data->pf_fd, gt))
> +			continue;
> +
>  		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
>  								  XE_SRIOV_SHARED_RES_LMEM,
>  								  gt, &ranges, &nr_ranges);
> -- 
> 2.31.1
> 
