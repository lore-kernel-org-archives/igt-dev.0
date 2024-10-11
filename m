Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B3BCFD316
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 10:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EBC10EAA1;
	Fri, 11 Oct 2024 10:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+Qc4a8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1C410EAA1
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728640991; x=1760176991;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DXJUnheTNyJRpu3Fs8ICS3hLScTN1m6005iaZNvQtnE=;
 b=c+Qc4a8Y4sd41kHgunTrhath39BGBvk//JbMo4msvYjQZm6tsdI+ziii
 /iX51FC1Wl7ml7ZS+IzRPvjffRrgDklpqm01eLlCyC5o0HGdHazBR5YWd
 KqSzpuOUbnHf0qa/m9nVGnrn3K9Pd8Q8qmBX2AQies59SHcdODo0Gdyzy
 6MVTDUkimU7aD4XbkOdhi4JnztTxmVef9eqwAA8x+Fp4UL4VwsXvRKEO0
 xl1mK24B74rHF5GEbeOCxutvHEdnbVIXttZ6dsocF8ViPCTr1z2cYU/a+
 HYM/UZqfnla+o3Pf6UiOK8Lk7hw/eBbUQY9Gb+239lH8n4eCV87kx7oTR w==;
X-CSE-ConnectionGUID: gJ8b7TeFSVyt5Az+0aXOnQ==
X-CSE-MsgGUID: sssSUFtpS1W3eLoeOxuiZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27980704"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="27980704"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 03:03:10 -0700
X-CSE-ConnectionGUID: SB8rJBEQTMmIZdfFfJL90Q==
X-CSE-MsgGUID: b6JOcI4QRP+vthbKKDQZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76868879"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 03:03:08 -0700
Date: Fri, 11 Oct 2024 12:03:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_tlb: Print tlb inval counts on
 failure
Message-ID: <20241011100306.eubqguiqm5pt4clb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241008202146.993745-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241008202146.993745-1-nirmoy.das@intel.com>
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

Hi Nirmoy,
On 2024-10-08 at 22:21:46 +0200, Nirmoy Das wrote:
> Print tlb inval counts on failure with igt_assert_lt_u64()

Looks good as it prints them but why u64? Actual type is int.

Regards,
Kamil

> 
> Cc: kamil.konieczny@linux.intel.com
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_tlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
> index 8104e45d8..15d89931c 100644
> --- a/tests/intel/xe_tlb.c
> +++ b/tests/intel/xe_tlb.c
> @@ -116,7 +116,7 @@ static void tlb_invalidation(int fd, struct drm_xe_engine_class_instance *eci)
>  	tlb_pos = xe_gt_stats_get_count(fd, eci->gt_id, stat);
>  	igt_assert_eq(data1->data, value1);
>  	igt_assert_eq(data2->data, value2);
> -	igt_assert(tlb_pos > tlb_pre);
> +	igt_assert_lt_u64(tlb_pre, tlb_pos);
>  
>  	syncobj_destroy(fd, sync[0].handle);
>  	syncobj_destroy(fd, syncobj);
> -- 
> 2.46.0
> 
