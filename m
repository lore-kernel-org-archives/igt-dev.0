Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF641C5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 12:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8719710E12B;
	Thu, 29 May 2025 12:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9ZUkOQr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAF610E12B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748521246; x=1780057246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ECds2tleyZUIsDyqnaPSA4KFrhKxqCAxsFMTz62q++0=;
 b=N9ZUkOQr+t2v1b1PQMHxM39F0L+Aehsy5LpfiK1LVVSi38QyfIUCzCYW
 PnPVCRI67M1NiepaR1dpcmcKjTL967K8neBjhRZjgDNReG5UPffg7Vvow
 /qdY2+B292m091XQflmUbCbUJnphs9jPC9wMXsMHr3V5gJwU1hAeYPC7R
 Jr5IY++kAFaW72MBDmt87VhetsY3U4yeqCS5VZudEyeSmLar13AUHpfP4
 xiGr2pt/h3PjsLHhZywETk2sl4vjOFCBRJa51Gd7CMKZUe7cNYaSJczsa
 1J6M2GTAcuukNadikPxQmeCK5cUVk2r0bQgqf9T3OGPq0SYluloxAs+fR Q==;
X-CSE-ConnectionGUID: BVi4ez+LR+SKArdhEK+gvA==
X-CSE-MsgGUID: PFCOJmbxQjuPNXem+UOhLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61980859"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="61980859"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 05:20:46 -0700
X-CSE-ConnectionGUID: 46Zy5ND1QMKkxzUaBpkYtA==
X-CSE-MsgGUID: obS/sVb8T/StJ7VepYXu5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="144527440"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 05:20:44 -0700
Date: Thu, 29 May 2025 14:20:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>, Alex Zuo <alex.zuo@intel.com>
Subject: Re: [PATCH] tests/intel/xe_vm: Fix assertion on the return value of
 mmap
Message-ID: <20250529122042.lowzdjmr4qv3ka7p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>,
 Alex Zuo <alex.zuo@intel.com>
References: <20250527215915.395919-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250527215915.395919-1-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2025-05-27 at 21:59:15 +0000, Shuicheng Lin wrote:
> The return value of mmap is stored in map, so the assertion should
> use map instead of data.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Alex Zuo <alex.zuo@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 5cbd56037..b5bba7b7e 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1846,7 +1846,7 @@ try_again_after_invalidate:
>  		map = mmap(from_user_pointer(addr), bo_size, PROT_READ |
>  			    PROT_WRITE, MAP_SHARED | MAP_FIXED |
>  			    MAP_ANONYMOUS, -1, 0);
> -		igt_assert(data != MAP_FAILED);
> +		igt_assert(map != MAP_FAILED);

Nice catch!
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		goto try_again_after_invalidate;
>  	}
>  
> -- 
> 2.25.1
> 
