Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799D6CAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 09:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1288D10E973;
	Fri, 19 Sep 2025 09:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PySto+Hq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D303F10E973
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758274519; x=1789810519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4aE0KhW37n81ZSI+L2kIrI5wXSD0yvrzOwBf1/xe5qs=;
 b=PySto+Hq9nUU4lUzRzozS73UQhNIFvLHeECoM76GZl+pMAR0YBQCgTNP
 7AHHOGc0VHiP4yjlSeoozWMttIxiYq9QlZ2KEP++r2iwuP34oCFc2IVPO
 VFA7ZA1fglFY7ERo2oQHmgRkoXXTibzBk8vU+gyrGM6la8cO5AGof8cQf
 gPXKKhuL4eLzYhi7fOzrwqTag/u8dWLgeKpnXxeyQBRbCK3jO4vZ0nrcF
 6/J+xVWBpFVRhhCAYE1U0Fml1lZCFrUw+USTRcLprQUs2V28F1Jyl+GG+
 BW9RwBmOsj9VHKps8S4VVVJxaKf0YZvvevfBaHTxHHDunI0UJ8CzhDhOM A==;
X-CSE-ConnectionGUID: bP5JL+jrRg63QorSISxNnA==
X-CSE-MsgGUID: 9kRQQIpbTni8mjomCgrskQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60565832"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60565832"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 02:35:19 -0700
X-CSE-ConnectionGUID: QaLw214eT0ytsi9K/6kFRg==
X-CSE-MsgGUID: SRSxS/4wS9uQgMkhukdwLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="199503096"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 02:34:08 -0700
Date: Fri, 19 Sep 2025 11:33:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 ashutosh.dixit@intel.com, himal.prasad.ghimiray@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH v8 1/1] tests/intel/xe_exec_system_allocator: Add
 pat-index-madvise
Message-ID: <20250919093351.lmukp57dmmnsv5ih@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 pravalika.gurram@intel.com, ashutosh.dixit@intel.com,
 himal.prasad.ghimiray@intel.com, kamil.konieczny@intel.com
References: <20250917171941.3025392-1-nishit.sharma@intel.com>
 <20250917171941.3025392-2-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917171941.3025392-2-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2025-09-17 at 17:19:41 +0000, nishit.sharma@intel.com wrote:
> From: Pravalika Gurram <pravalika.gurram@intel.com>
> 
> Add pat-index-madvise test to verify setting different
> pat_index values for multiple VMAs. This test uses
> madvise to set various pat_index values and
> verifies that different PAT values can be assigned to multiple
> VMAs as expected. Add skip for igpu.
> 
> v2:
>   - Remove macro which is not needed and alignment (Nishit)
>   - use existing struct by adding new member
>   - Remove num_ranges to NULL assignment
> v3:
>   - checkpatch.pl (Nishit)
> v4:
>   - skip test based on platform (Ashutosh)
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Himal Prasad <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>

For changes from v7 -> v8 this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/xe/xe_ioctl.c                      |  29 ++--
>  lib/xe/xe_ioctl.h                      |   4 +-
>  tests/intel/xe_exec_system_allocator.c | 186 +++++++++++++++++++++----
>  3 files changed, 178 insertions(+), 41 deletions(-)

[cut]

> +
> +	for (const struct section *s = intel_get_pat_idx_functions; s->name; s++) {
> +		igt_subtest_f("pat-index-%s", s->name) {
> +			if ((strstr(s->name, "madvise-pat-idx-wt-") ||
> +			     strstr(s->name, "madvise-pat-idx-uc-comp-")) &&
> +			     !xe_has_vram(fd)) {
> +				igt_skip("Skipping compression-related PAT index\n");
> +			}
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
>  		}
>  	}
>  
> -- 
> 2.43.0
> 
