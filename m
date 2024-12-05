Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C4AE7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 14:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D6210EEAC;
	Thu,  5 Dec 2024 14:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DE2FASUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4BE10EEAC
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 14:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733410195; x=1764946195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D/q5b9qf2eDQYvuLv81OgP0vHk+ZbczynRMrG6NPI0c=;
 b=DE2FASUv15jKQMMmFle7z75yn+yfIH7/99NQexFBO7kd6VLSBNsUB9hX
 3WTx7UgeTkm9cgQeaHd1zzlTpkQEVEHqnae4BzNeqhQhza+n7L2hG3oUM
 QIEu6oqZZIwCNFe3DoEDGLnmCbNqa8Sm8aJaaRRgBFbHP87JpqZXxbYrT
 xJZYrS1dXnaYOWbxi8OY0rnf7jucLSKiRhztByRCyMPC10jZogaQYHamO
 NVktdO27TM9drtZiQ8ZPOvAqkrhKqxSqRXvfa+spxSKssqfYROE6H6jtS
 QlDnBMzfB6UUIS+u7WOFPjLNtsl6Mky+FxRC5VeSlsGYmGhTo80cM1DOX g==;
X-CSE-ConnectionGUID: oDR4MQTjQueYWF/DIkeXYA==
X-CSE-MsgGUID: Jxw7DoI5Tv6hNADt3o9lUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44200529"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="44200529"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:49:54 -0800
X-CSE-ConnectionGUID: fbk+y9CeSy68LvsYHnOfVQ==
X-CSE-MsgGUID: +SafEWWgRE+qG1jyfsMMdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94190102"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 06:49:53 -0800
Date: Thu, 5 Dec 2024 15:49:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, alex.zuo@intel.com,
 saurabhg.gupta@intel.com, sai.gowtham.ch@intel.com
Subject: Re: [PATCH] lib/xe/xe_gt: Repair xe_gt_stats_get_count function
Message-ID: <20241205144949.vosg3vn6op5bftol@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, alex.zuo@intel.com,
 saurabhg.gupta@intel.com, sai.gowtham.ch@intel.com
References: <20241204154650.13327-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204154650.13327-1-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2024-12-04 at 15:46:50 +0000, Jonathan Cavitt wrote:
> Resolve the following issues:
> 
> - The target directory for the fopen does not take into consideration
>   the dri subdirectory and assumes the correct path is dri/0.  This
>   might not be the case.  Use the "minor" function and fstat to
>   generate the correct subdirectory.
> 
> - The fopen may fail and return a NULL pointer, causing the subsequent
>   fgets to generate a SIGSEGV.  Assert the file opened correctly.
> 
> - The file opened by fopen is never closed.  Close it.
> 
> Fixes: 10cefd82 ("tests/intel/xe_tlb: Add test to check TLB invalidation")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3212
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> CC: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/xe/xe_gt.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index cee892af96..493bf9793f 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -152,18 +152,28 @@ void xe_post_hang_ring(int fd, igt_hang_t arg)
>  int xe_gt_stats_get_count(int fd, int gt, const char *stat)
>  {
>  	FILE *f;
> +	struct stat st;
>  	char tlb_path[4096];
>  	char path[256];
>  	int count;
>  
> -	sprintf(path, "/sys/kernel/debug/dri/0/gt%d/stats", gt);
> +	igt_assert_eq(fstat(fd, &st), 0);
> +
> +	sprintf(path, "/sys/kernel/debug/dri/%d/gt%d/stats",
> +		minor(st.st_rdev), gt);
>  	f = fopen(path, "r");
>  
> +	igt_assert_f(f, "Failed to open /sys/kernel/debug/dri/%d/gt%d/stats",
> +		     minor(st.st_rdev), gt);
> +
>  	while (fgets(tlb_path, sizeof(tlb_path), f)) {
>  		if (strstr(tlb_path, stat) != NULL) {
>  			sscanf(tlb_path, "%*[^:]: %d", &count);
>  			break;
>  		}
>  	}
> +
> +	close(f);

I missed this, it should be fclose()
My r-b still holds,

Regards,
Kamil

> +
>  	return count;
>  }
> -- 
> 2.43.0
> 
