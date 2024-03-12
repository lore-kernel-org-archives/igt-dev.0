Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFF7C54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4560112E50;
	Tue, 12 Mar 2024 14:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ive6njTs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB603112E50
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252963; x=1741788963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S7/sddCMXTEkGVOKYAX8Cnll0/o9Cshd8thucNl9Bh4=;
 b=ive6njTs+pue5esZKTdSbLQmuStWZg01G7+XgqFl6s0v+ZQlRfx11GRT
 RfjIegWLyFE9TNPFhfMMv0MEfOqNCnyEO1543B7dLJDdVhr+MD7zb52nF
 VtPC+WciR8zZz+IbcqfAMy6l8Rs7rUUP/Y1vieTHFyl4pHmaVBLj1FX8B
 /ge2Yxt7ZaWNmwK9a8IrlY+JnFMs4nR1NKjK6FLJzDAYn6ntbcYQhPAmP
 FUmjEPIX82hxsZCZtj+eCddH2sfMuoWxfN4E2q1K5UHo0dtF/PFhgKZlz
 XqtY/924VfZ6qEkxkpYZxD8opgakYrWuO8UcJDldRJT8n8qOybLSisu/R g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5133375"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5133375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11522025"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 07:15:29 -0700
Date: Tue, 12 Mar 2024 15:15:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: venkata.ramana.nayana@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than
 lmem
Message-ID: <20240312141526.ki75sj6qzr37q6cm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 venkata.ramana.nayana@intel.com, priyanka.dandamudi@intel.com,
 matthew.brost@intel.com, igt-dev@lists.freedesktop.org
References: <20240312071502.2188325-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240312071502.2188325-1-priyanka.dandamudi@intel.com>
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

Hi priyanka.dandamudi,
On 2024-03-12 at 12:45:02 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Currently the tests are failing with OOO memory error.
> Added code to skip the test if the system memory size is less than local
> memory size.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_evict.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 4de82c3bd..2dc3fe542 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -753,6 +753,8 @@ igt_main
>  		igt_require(xe_has_vram(fd));
>  		vram_size = xe_visible_vram_size(fd, 0);
>  		igt_assert(vram_size);
> +		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size >> 20),
> +			      "System memory is less than local memory \n");

Could you add here actual numbers, possibly in GB (if they diff in GB)?
Also, maybe it is worth add a TODO and restrict memory tested in such
a case? I mean that only part which will fit in SMEM will be evicted?

Regards,
Kamil
>  
>  		xe_for_each_engine(fd, hwe)
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
> -- 
> 2.25.1
> 
