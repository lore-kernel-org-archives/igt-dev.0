Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB5CD39405
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 09:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C4310E070;
	Thu,  2 Apr 2026 09:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzlvGUjq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D5D10E070
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 09:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775122776; x=1806658776;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U/4BHU2mqp+XfZpbvIbygVUiCAIb9NAETCrqjJ6Amjw=;
 b=TzlvGUjqr3UWCcawTGcz+Qti8app4V3r2zOyzLH+GkaUVCabhsjR1BYv
 Ys+pieyf5qEzHGzEqyUy7L5GuRX/j7UhAIKZ602jejPd3G7E5D4sdRSh1
 +6veTqd+PGK58yZDvzf0t2Lu27OIgw9bWg5XSPeLC7G9HQ5G7B+eCiKPi
 MCiReReIH+IAO3rGbbK9FRgJ8P1W8/qd6qKNjomF6Ko6p5yF+DSzBH8Kr
 d+tb2E4Ojis84Re9yEIqJi9IY3vYSDxK6yg1NQ36CB0Khci3I03XUlkk6
 q4StQIt3obuF3ynjGjLnD9ZB0X4Nu/CtUnjCJk95WAEFmmrdZ5NEGb0tZ Q==;
X-CSE-ConnectionGUID: S8R9zbkWSeWjqp978O6vDg==
X-CSE-MsgGUID: FKbGtq2jSe2OLDOutkObpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87573270"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="87573270"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 02:39:35 -0700
X-CSE-ConnectionGUID: cxWOHukATfC512uDraoX7w==
X-CSE-MsgGUID: MU3lAqkNTJyFkxrmGoz7Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="227200145"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 02:39:34 -0700
Date: Thu, 2 Apr 2026 11:39:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Use MAP_FAILED for mmap failures
Message-ID: <20260402093918.nqkkr3roy6t6sfk2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20260401223215.111418-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401223215.111418-1-ashutosh.dixit@intel.com>
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

Hi Ashutosh,
On 2026-04-01 at 15:32:15 -0700, Ashutosh Dixit wrote:
> Detect mmap failure using MAP_FAILED instead of NULL.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_oa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 387f29535e..9444f70cd6 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -4367,7 +4367,7 @@ static void *map_oa_buffer(u32 *size)
>  {
>  	void *vaddr = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
>  
> -	igt_assert(vaddr != NULL);
> +	igt_assert(vaddr != MAP_FAILED);
>  	*size = default_oa_buffer_size;
>  	return vaddr;
>  }
> -- 
> 2.48.1
> 
