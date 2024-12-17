Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C659E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 16:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BAE10EA15;
	Tue, 17 Dec 2024 16:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZC20jdyu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C858010EA15
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734452586; x=1765988586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HdKOZu8tZf1eixwOL1zaQaom93kSlrZcaEWkwF6xsQM=;
 b=ZC20jdyu2HI+NxlKATU6HoxUoWv4R1IsZyWjlrFXCF/P5ZfaUazUy5W1
 DILn31htGn/mU5coShF6vNZm3S06MDzy6Jl2gOeXqZUkHQ7cPPIvGKC1t
 auHyBEsnyCw/pdrnAmFyf2iTHmZtsH2vVzm9nysTlwpHS0Ie2vLpEei8r
 QGLV3deFcx156KmBm7HUEZcLk7UirSZCpK91B8EgR2MOSD+7Q1qy30cAk
 f/aPIonU5Xo2GuGje0s9QcQwTNRdUjmcKriDljOXO0zMEbaT5OSDQAWty
 XicHrRWAK6YsXjXsj23xgVNbLKgFrvJQ53/O3Op2F0biZnAJcMZCr6V5J w==;
X-CSE-ConnectionGUID: qq7DzXy3R4ufWJchHrwDVQ==
X-CSE-MsgGUID: X/pHZXUmQb6t3hbrs5vNyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="35035956"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="35035956"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 08:23:05 -0800
X-CSE-ConnectionGUID: MLnokeLhS7yzpgK3bLapgg==
X-CSE-MsgGUID: LJkSdNEWTxCzkkWrzLDMRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="97364019"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 08:23:04 -0800
Date: Tue, 17 Dec 2024 17:23:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
Subject: Re: [PATCH] tests/intel/gem_exec_balancer: Decrease required load in
 `full` test
Message-ID: <20241217162302.u52qy7ji5zlfahm5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
References: <uupn5abwcptf6p4zdaz4ozl5utjcwij2sjlebrlgkqw3xupxma@nvacr67vd6tf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <uupn5abwcptf6p4zdaz4ozl5utjcwij2sjlebrlgkqw3xupxma@nvacr67vd6tf>
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

Hi Sebastian,
On 2024-12-17 at 15:06:41 +0000, Sebastian Brzezinka wrote:
> Adjust the minimal load in the `full` test. It's a minor tolerance
> issue expected 90% got 86.6%.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13003

Remove empty line, with this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tests/intel/gem_exec_balancer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> index c3f0c938b..46ea19a2a 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -1815,7 +1815,7 @@ static void full(int i915, unsigned int flags)
>  
>  		free(ci);
>  
> -		igt_assert_f(load > 0.90,
> +		igt_assert_f(load > 0.85,
>  			     "minimum load for %d x class:%d was found to be only %.1f%% busy\n",
>  			     count, class, load*100);
>  		gem_quiescent_gpu(i915);
> -- 
> 2.34.1
> 
