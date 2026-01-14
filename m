Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD320D31A26
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 08:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8FE10E5D5;
	Wed, 14 Jan 2026 08:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6H/BkY6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F117E10E5D5
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 08:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768378916; x=1799914916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l0XFm0POBTdF7CCo/O/kxT0UchT1HVo3mKZTLvKQdkY=;
 b=H6H/BkY6K3ZQ4+77b/jpaJVq2bDcqx8QnuBZnN4p7S4q4qRPungosELW
 2dN7cCfMbAIpI42+Udn+BAeMqsWNc89JbjC7IjSRfygQYJGuSG0woH4Wl
 edXBGvxuy2DxLG7Ouq6XjcByBZXtRuGpeO6Q/XtsUFvUNiZotGlSeStZI
 hWVRkpGQQzBsXfoJxpqKQG4K2ZYFfubMbQXLY1kfkMgF/N5kqSAfRgD+Q
 vyR1qHz4nKoWhnKx4tcRhxcoAev/SY9+fqNgWY7EVioJrKq9//vqoiyx4
 9ELz05CJfMPUcHfx0nyCdDu2xIjmh7VUgfk74I1Zs74I4TgA3MK0nk2ck A==;
X-CSE-ConnectionGUID: 28M2ukEbTle6ZUkIuY+ECA==
X-CSE-MsgGUID: aC8OzYlXQH+/ASQyKDdNhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69582282"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69582282"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 00:21:55 -0800
X-CSE-ConnectionGUID: BQvcSdaeTZ6I5zG46ilT1g==
X-CSE-MsgGUID: yizC+zWNRdyYZWVh3duaXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204405769"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:21:55 -0800
Date: Wed, 14 Jan 2026 09:21:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add
 igt_debug instead of igt_warn
Message-ID: <20260114082151.dcyfkhpxsaw2dyls@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
References: <20260113161520.675912-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113161520.675912-1-nishit.sharma@intel.com>
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
On 2026-01-13 at 16:15:20 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Replaced igt_warn with igt_debug in test output to prevent non-critical
> warnings from being flagged as errors in CI runs. This change helps avoid
> cluttering CI logs with benign messages, ensuring that only relevant
> issues are highlighted during automated testing.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 8af66d76e..945c56535 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1924,9 +1924,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		 * 100% reliable, rather than fail the test, just print a
>  		 * warning message.
>  		 */
> -		if (pf_count != pf_count_after)
> -			igt_warn("pf_count(%d) != pf_count_after(%d)\n",
> +		if (pf_count != pf_count_after) {
> +			igt_debug("Pagefault count %s\n",
> +				  pf_count != pf_count_after

You already checked it at if() above.

> +				  ? "pf count changed"
> +				  : "pf count not changed");
> +			igt_info("pf_count(%d) != pf_count_after(%d)\n",

Please use either igt_debug or igt_info, not both, as you print
the same info here.

Regards,
Kamil

>  				 pf_count, pf_count_after);
> +		}
>  	}
>  
>  cleanup:
> -- 
> 2.48.1
> 
