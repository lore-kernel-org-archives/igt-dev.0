Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8685CD5BD0
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 09:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978CF10E489;
	Tue, 26 May 2026 09:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwojM75h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0392D10E610
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779787878; x=1811323878;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EQNDzhtiip6xqd5hTaYpdDYZx+gc96E4QC3Nozat8KA=;
 b=FwojM75htQUG/H58yBUwvrJOJd8AuAGV4zhY68fNfFPvmh40RYyzQm2o
 vinGhczO0BwJrjZa95IzCtrSMufOOrC/xK33+ZRqimPVSNi3qmAVF7bp1
 XAVyvfj/gAJ0pKtNEnjc0CqdvCqoRkNtklqyvKJWncvecS31KAAiMxL8/
 CGAa+VJKmawM4OL5bIXN9V5fpIrcztz3V+WSeDhg2bWW5/DoixHTETAMu
 wgv/TNOz/r2QsH4rZygJhQNjDPf5oHJCTZgyO6xEQwhRD7QuFkxmX3DS7
 P92ZXnEGEoTYFnpOSy46t3ELJjH91cuP/z0JOSu+MHRf3jQiRa09/4r1u g==;
X-CSE-ConnectionGUID: HzT1t0a0T66XS+Uiq9hkvQ==
X-CSE-MsgGUID: Q2WSm4o3QWWhPsbVRXIqFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="92067523"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="92067523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 02:31:18 -0700
X-CSE-ConnectionGUID: HWKpbThCTXG4GzNZlPt5jg==
X-CSE-MsgGUID: LjsuoC/7QWarRm+/4FhhWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="238849336"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 02:31:16 -0700
Date: Tue, 26 May 2026 11:31:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John Harrison <John.Harrison@Igalia.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kms: Fix for closing incorrect file handles
Message-ID: <20260526093113.ggux52ik7ve6rcnx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260525183932.3139043-1-John.Harrison@Igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525183932.3139043-1-John.Harrison@Igalia.com>
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

Hi John,
On 2026-05-25 at 11:39:32 -0700, John Harrison wrote:
> The writeback fence fd was only set to an invalid value if writeback
> was actually enabled. However, the cleanup code would close the handle
> if it was valid. As the uninitialised value is zero and zero is a
> valid handle, that meant that stdin was closed at cleanup!
> 
> Generally not a problem if clean up only happens at test exit. But if
> a test wanted to close and re-open the driver, then closing random
> file handles could lead to problems.
> 
> So make sure the handle is always invalid irrespective of the use of
> writeback.
> 

+cc Karthik and Swati as this is KMS code

> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> ---
>  lib/igt_kms.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e20307923..0f1ce03a9 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2764,10 +2764,9 @@ static void igt_output_reset(igt_output_t *output)
>  
>  	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID))
>  		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, 0);
> -	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR)) {
> +	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR))
>  		igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR);
> -		output->writeback_out_fence_fd = -1;
> -	}
> +	output->writeback_out_fence_fd = -1;

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. style looks strange, useally there should be a newline after if block.

>  	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
>  		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
>  					 "off");
> -- 
> 2.43.0
> 
