Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35BBC02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 14:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD5010E6ED;
	Wed, 15 Jan 2025 14:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfCBIEPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52D310E6ED
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 14:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736951172; x=1768487172;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wBkhLGPyh9/zD23wCtsaz3WaJNJS2XPNAuMVPo4HR1A=;
 b=bfCBIEPh2TM3EulA4PTNXnYQHNCdpvvEguRjuIqftd0+XUK3QAWKKk/5
 x8bWJRqKg9eM4rSfkoCCAZrDg2GjsVUngG73pVQu4pxJw6rmARY+SSK/r
 YDlTVA4LoOIFXFsBfoVwVicHdOli5RpTnhl1Bwxvy9h496dz4jGJTq5oN
 mTtJXac6thKrpj7lkXnAdg6pTkL9NANAFZq4se2dALWj1moE0k28GmqE2
 3/va5A7d/ynS1YYD4GrC7LuD8cxWunxVfr6ArCksdPus85FyEV6UaDPQE
 iha6XRs6s7e6RZIGrQH5fDDbeXKm9D8aS3cn1QvCrOXoqt3hAwYq8msjp Q==;
X-CSE-ConnectionGUID: sAFNgnZOT5+cfvWQr1TSyg==
X-CSE-MsgGUID: Ra5SVJFiR4SFOYkNgUtNoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37316474"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="37316474"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:26:12 -0800
X-CSE-ConnectionGUID: XD+kgup7T4SslyupEN35xA==
X-CSE-MsgGUID: yUfN28FQSA6Tur0EUc1wHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="136006031"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:26:11 -0800
Date: Wed, 15 Jan 2025 15:25:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_balancer: Decrease expected
 load value
Message-ID: <20250115142558.kknglewnvqjoatbw@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 Andi Shyti <andi.shyti@linux.intel.com>
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

This empty line should be removed.

> Signed-off-by :Sebastian Brzezinka <sebastian.brzezinka@intel.com>

there is space before colon ' :S' it should be:

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

Please use checkpatch.pl script from linux kernel also for igt,
you could find few helpfull options in CONTRIBUTING.md
Also I just noticed after a merge that you sent it without
r-b from Andi... and I forgot to cross-check mailing list...

Please remember to add r-b if it was given,
unless you make changes after that which justify removing r-b.

Your patch is now applied, thank you for contributing!

Regards,
Kamil

PS. Sorry Andi for missing your r-b, I tried to find out what todo
only on patchwork, what is strange your mail didn't get into patchwork.

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
