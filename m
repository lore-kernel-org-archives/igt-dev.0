Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52115D30CDB
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 10:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF64110E320;
	Wed, 14 Jan 2026 10:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlQaQFEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D275210E320
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 10:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768386004; x=1799922004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hci5qmbb9WqFHg8I3o5A9UxSAB3xo3kdcmT2rf9rdhE=;
 b=hlQaQFEuXkS5Vbq4J5Z4XOekv6pvvdlQeUivq4zQHsr5UE3spYPAa35i
 OShJHGeb8do9UAWwJCrqlfa4Jd8bW5hqsy9o52AgNFM28XWxwfYqeU6UA
 eNrL3hG991s4Cq4pYFVi0IdTTkTir6GRzQRBM+F4GDFuPtsQtuLu3oW6h
 bDXIdE3PN2Wz78EeKQ0BtRAdE2C/spZN60eAGAAXT2oxlaPDPf/Dxxs3s
 u+r2UU/VrKlJhFE5A3o6jSRIeaHu4VDHVOt6Y7GxaHnWRHeEV6GNNq02o
 Cw3B5+2V23d9ffzbU7VI1hWu9WLtA8N9TWAUz915jvSd99fVB/qJ9VWSB g==;
X-CSE-ConnectionGUID: bMdSvGqCRYmWNothBLl1yg==
X-CSE-MsgGUID: nn/ZGD/tQdanOUg2ofqTCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80791710"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="80791710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 02:20:03 -0800
X-CSE-ConnectionGUID: SBuLuh7SSU2wEMh1JIbkiw==
X-CSE-MsgGUID: /F3fnhCQTZa4YPBK4Wvtuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204534334"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:20:02 -0800
Date: Wed, 14 Jan 2026 11:19:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add igt_info
 instead of igt_warn
Message-ID: <20260114101945.eusharuh4j24arjt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org
References: <20260114094247.851502-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114094247.851502-1-nishit.sharma@intel.com>
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
On 2026-01-14 at 09:42:47 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Replaced igt_warn with igt_info in test output to prevent non-critical
> warnings from being flagged as errors in CI runs. This change helps avoid
> cluttering CI logs with benign messages, ensuring that only relevant
> issues are highlighted during automated testing.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_system_allocator.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 8af66d76e..412ad0384 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1922,11 +1922,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		/*
>  		 * Due how system allocations work, we can't make this check
>  		 * 100% reliable, rather than fail the test, just print a
> -		 * warning message.
> +		 * message.
>  		 */
> -		if (pf_count != pf_count_after)
> -			igt_warn("pf_count(%d) != pf_count_after(%d)\n",
> +		if (pf_count != pf_count_after) {
> +			igt_info("Pagefault count: before=%d, after=%d\n",
>  				 pf_count, pf_count_after);
> +		}
>  	}
>  
>  cleanup:
> -- 
> 2.48.1
> 
