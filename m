Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4E9E77184
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 16:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68D110EA15;
	Tue, 17 Dec 2024 16:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LX0h2uND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C172D10EA15
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734452541; x=1765988541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sZd4ziIjHLKcWAXxkZRyO1JAzjoIy/Av/MNR3PHEFD8=;
 b=LX0h2uNDBxRRoXOoeJc2Xw2jD4jkQGLVPvw0geUuteALmDLgzQvfEN17
 +fahylmP0KYIkRIhSl3WzfWMyHIBMTWhKoV/VWs3/9OJZI7+AUYOfe9fC
 pdtO8EjykWwnk0Yr3NyzgGC0pL5n+8nf2I1fULs4yEpbazOay/pO+7wHL
 /qu+6F8IhFBBlVhQd48T1jFrMJR5MB3DJl4HLrFbtRU8aDjTqGPRKbzPJ
 1FDRbLf2ViqtdK4v21YjDvwiOGv1OvW2P9tn/pPcIgnjMJIDf6unszdqE
 Y0R5Crmoxznt+Zasatl8Ghrh9/CKrCJkmaZWIlbqNfCbejCD0cZ62yGf6 A==;
X-CSE-ConnectionGUID: Dfnks0RaRXCV3XVmaEO1aA==
X-CSE-MsgGUID: mHts8HMvRY+PVLHjK9RWTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45893733"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45893733"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 08:22:20 -0800
X-CSE-ConnectionGUID: K1glB35OSFm/zlWjmPZZEw==
X-CSE-MsgGUID: RFXYMDTvRZKZ1qd7xgW9Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="98157921"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 08:22:17 -0800
Date: Tue, 17 Dec 2024 17:22:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_balancer: Decrease expected
 load value
Message-ID: <20241217162202.ojer3mq27yhga2s4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
References: <fjysvvdi7wbyamul3gxnaitsbnsbme27ikteqelhk6ukih75vs@cynz3yfs5gmx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fjysvvdi7wbyamul3gxnaitsbnsbme27ikteqelhk6ukih75vs@cynz3yfs5gmx>
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
On 2024-12-17 at 15:01:10 +0000, Sebastian Brzezinka wrote:
> Expected value of 0.90 may occasionally not be achieved, either be
> latency in the scheduler, or perf reporting. I'm lowering it to 0.85
> to match actual values ​​(87.5% in last fail).
> 
> Resolves: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12943
>

s/Resolves/Closes/

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Signed-off-by :Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tests/intel/gem_exec_balancer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> index e7c43f1b4..c3f0c938b 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -614,7 +614,7 @@ static void check_individual_engine(int i915,
>  
>  	close(pmu);
>  
> -	igt_assert_f(load > 0.90,
> +	igt_assert_f(load > 0.85,
>  		     "engine %d (class:instance %d:%d) was found to be only %.1f%% busy\n",
>  		     idx, ci[idx].engine_class, ci[idx].engine_instance, load*100);
>  }
> -- 
> 2.34.1
> 
