Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ED6C982DC
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 12:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEFB10F354;
	Fri, 18 Sep 2026 12:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JITznV3s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2817D10F352
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789734056; x=1821270056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WRGMOMh9IAEqzlVGQWvz5Cr2K+o9RzHCLDtH2y29ZrA=;
 b=JITznV3s0T5vU4Hd8QBvrOjDA+G3TvClU3c5MRajZFH+sTX+thknabQ0
 TqH9u4Hqfuegsu5kIQKOfWQB9COsqYqIgJFRWYPm980tD4pHQzBgWFaJ8
 a6TGEJc+4Gz/bpnLnmcdZ/3XljfbEgBVMUTzXRGTPtqAgjRv3QY1xlFSB
 kFZz7TDCYDoTG9nc1ToBXP7ZZwLnlT1qPjCpigRI2/y7r9WPrH9rpJs7H
 YKV48LhaKkc1nh3MlAgfTGE5ZelTKb/uLkF/I7nasgKJ2x7cXkTJZu1HZ
 x9pDg5t+O411MgtmNaFr285dSAUTCBj1R8EryK1NLRSToZgmSIlqGD0PE w==;
X-CSE-ConnectionGUID: bqI7UbzmRwOuqXyr9+J4GA==
X-CSE-MsgGUID: gB8JvXBiT4CUzsOTN0Fwmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="92745461"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; d="scan'208";a="92745461"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 05:20:56 -0700
X-CSE-ConnectionGUID: aU9N5ipJT6msFpe1Jnkk+w==
X-CSE-MsgGUID: UIACqjlYSia0xGaBq59nJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; d="scan'208";a="268116117"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 05:20:55 -0700
Date: Fri, 18 Sep 2026 14:20:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_pmu: Ensure stash_gt_freq allocates
 sufficient storage
Message-ID: <20260918122029.57iplmhbjcf7txgc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260831204455.1242947-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831204455.1242947-2-matthew.d.roper@intel.com>
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

Hi Matt,
On 2026-08-31 at 13:44:56 -0700, Matt Roper wrote:
> stash_gt_freq() malloc's arrays based on the number of GTs returned by
> the kernel's query ioctl and then indexes into the arrays by uapi GT ID.
> This works fine if all GT IDs are consecutive (which is always the case
> on platforms today), but will be insufficient if future platforms allow
> the list to contain non-consecutive IDs (e.g., 0, 2, ...).  Allocate
> storage based on the maximum GT ID returned, not the number of GTs
> returned.  Some of the array indices will remain unused, but the
> xe_for_each_gt() loops will already skip over those unused entries
> properly.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  tests/intel/xe_pmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index a8ceac46c..ea8950ee5 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -1039,12 +1039,12 @@ static void unprovision_and_disable_vfs(int fd)
>  
>  static void stash_gt_freq(int fd, uint32_t **stash_min, uint32_t **stash_max)
>  {
> -	int num_gts, gt;
> +	int max_gt, gt;
>  
> -	num_gts = xe_number_gt(fd);
> +	max_gt = xe_dev_max_gt(fd);
>  
> -	*stash_min = (uint32_t *) malloc(sizeof(uint32_t) * num_gts);
> -	*stash_max = (uint32_t *) malloc(sizeof(uint32_t) * num_gts);
> +	*stash_min = (uint32_t *)calloc(max_gt + 1, sizeof(uint32_t));
> +	*stash_max = (uint32_t *)calloc(max_gt + 1, sizeof(uint32_t));
>  
>  	igt_skip_on(*stash_min == NULL || *stash_max == NULL);
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  
> -- 
> 2.55.0
> 
