Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D983DC54F2E
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 13:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B27D10E2A9;
	Fri, 23 May 2025 13:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mo5Vw1ep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B1B10E2A9
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 13:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748006521; x=1779542521;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HBNSGO0JHfq2zJ8o2Abh0+bYNZEXqHfS00dwbE1N/nM=;
 b=mo5Vw1epj7dGd+Dws/Y/Tycz54MakT1O2XAf0eGhoVqhrjj1/B+gWT6M
 FwfETmv9IoISqe5DXRwagjZhhcJyiGWN7pCec18aWuw1BEGzmB9ZZcELf
 I4/UDVvarVIlTyzbpE3qVK3ysZXY1UKFVeoq27zPOya3wXANzzaDGeqi8
 2p4L7MODppcBIpkuexxe7V5nbtlA9N01mM0dUHyRogj5JAyUYohDx+Cve
 x5cPlFPJCabzVDRYzoSHu97yjER3qOmei2+9q1nLSrojS9/ADBqExbvGA
 UAlkhJyoz7c2iCTrlOA8TxYWsuI6JazRoE5aBJA9eHq6+cSuCSggi0OH4 Q==;
X-CSE-ConnectionGUID: yY09d0MJR1q6n7+D+F8e2Q==
X-CSE-MsgGUID: mG7yUFBFScKInfEhyeQveQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49767801"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="49767801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 06:22:01 -0700
X-CSE-ConnectionGUID: wCWD8K56Q7i0/wlht4w+Vw==
X-CSE-MsgGUID: 8BOZLRtvRmuZ8soUpFokaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="146130107"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.155])
 ([10.245.254.155])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 06:22:00 -0700
Message-ID: <049cff66-d288-4972-b2a6-b9a6a70cf41f@linux.intel.com>
Date: Fri, 23 May 2025 15:21:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 5/8] lib/xe/xe_sriov*: fixup print/scan
 formatting for files in lib
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250519113010.125751-1-jan.sokolowski@intel.com>
 <20250519113010.125751-6-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250519113010.125751-6-jan.sokolowski@intel.com>
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



On 5/19/2025 1:30 PM, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print/scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. SCNu64.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   lib/xe/xe_sriov_debugfs.c      | 18 +++++++++---------
>   lib/xe/xe_sriov_provisioning.c |  2 +-
>   2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index 8f30fa312..9b743f657 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -105,18 +105,18 @@ static int parse_provisioned_range(const char *line,
>   	switch (res) {
>   	case XE_SRIOV_SHARED_RES_CONTEXTS:
>   	case XE_SRIOV_SHARED_RES_DOORBELLS:
> -		if (sscanf(line, "VF%u: %lu-%lu", &range->vf_id, &range->start, &range->end) == 3)
> +		if (sscanf(line, "VF%u: %" SCNu64 "-%" SCNu64, &range->vf_id, &range->start, &range->end) == 3)
>   			ret = 0;
>   		break;
>   	case XE_SRIOV_SHARED_RES_GGTT:
> -		if (sscanf(line, "VF%u: %lx-%lx", &range->vf_id, &range->start, &range->end) == 3)
> +		if (sscanf(line, "VF%u: %" SCNx64 "-%" SCNx64, &range->vf_id, &range->start, &range->end) == 3)
>   			ret = 0;
>   		break;
>   	case XE_SRIOV_SHARED_RES_LMEM:
>   		/* Convert to an inclusive range as is the case for other resources.
>   		 * The start is always 0 and the end is the value read - 1.
>   		 */
> -		if (sscanf(line, "VF%u: %lu", &range->vf_id, &range->end) == 2)
> +		if (sscanf(line, "VF%u: %" SCNu64, &range->vf_id, &range->end) == 2)
>   			ret = 0;
>   		if (!range->end)
>   			return -1;
> @@ -232,8 +232,8 @@ static int validate_vf_ids(enum xe_sriov_shared_res res,
>   				  nr_ranges);
>   			for (unsigned int i = 0; i < limit; i++) {
>   				igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
> -						  "%s:VF%u: %lx-%lx\n" :
> -						  "%s:VF%u: %lu-%lu\n",
> +						  "%s:VF%u: %" PRIx64 "-%" PRIx64 "\n" :
> +						  "%s:VF%u: %" PRIu64 "-%" PRIu64 "\n",
>   					  xe_sriov_shared_res_to_string(res),
>   					  ranges[i].vf_id, ranges[i].start, ranges[i].end);
>   			}
> @@ -504,16 +504,16 @@ int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
>   	while (getline(&line, &n, file) >= 0) {
>   		switch (res) {
>   		case XE_SRIOV_SHARED_RES_CONTEXTS:
> -			ret = sscanf(line, "GuC contexts: %lu", value);
> +			ret = sscanf(line, "GuC contexts: %" SCNu64, value);
>   			break;
>   		case XE_SRIOV_SHARED_RES_DOORBELLS:
> -			ret = sscanf(line, "GuC doorbells: %lu", value);
> +			ret = sscanf(line, "GuC doorbells: %" SCNu64, value);
>   			break;
>   		case XE_SRIOV_SHARED_RES_GGTT:
> -			ret = sscanf(line, "GGTT size: %lu", value);
> +			ret = sscanf(line, "GGTT size: %" SCNu64, value);
>   			break;
>   		case XE_SRIOV_SHARED_RES_LMEM:
> -			ret = sscanf(line, "LMEM size: %lu", value);
> +			ret = sscanf(line, "LMEM size: %" SCNu64, value);
>   			break;
>   		}
>   
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index aa265247e..2a02f7cc8 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -75,7 +75,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
>   
>   	*ranges = new_ranges;
>   	if (*nr_ranges < MAX_DEBUG_ENTRIES)
> -		igt_debug("Found VF%u GGTT range [%#x-%#x] num_ptes=%ld\n",
> +		igt_debug("Found VF%u GGTT range [%#x-%#x] num_ptes=%zu\n",
>   			  vf_id, start, end,
>   			  (end - start + sizeof(xe_ggtt_pte_t)) /
>   			  sizeof(xe_ggtt_pte_t));
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
