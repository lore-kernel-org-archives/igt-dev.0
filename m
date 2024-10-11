Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A68D0EE12
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 16:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EE810EBA4;
	Fri, 11 Oct 2024 16:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Awx1fscT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9061E10EBA4
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728665721; x=1760201721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9CEeIijix8es/QOMepSxMYBsUpLBlqxBc5+/zhe2dk8=;
 b=Awx1fscTeGlSTzte0Y26X3yts5NeHhm04r0rYv24y0LKjT3NaUaispIs
 HFX7ghHgQJyv6jiEoxEx8xQ5yJK31r5/4r+vgss88qgCGiE1ytIhQ59KG
 sY8a+vwRzruFpj6Goysn0yNQzW7PPEvVf5i1Oz2ZvQqVlwwq1G4UrtJ8y
 aCIG3TwYxZwlNtMD1fqMuChClkSBknTeWUx/n7TQTKS+7XX4Y0ReMnqy5
 PiawsemokFxR3SOe/k7dBbY7IdVjaed+Zch+9ExRSNEpztZCHAF9aXZxq
 aDqQtvmpcpUO3tHQpkeRB99h3TG0GfOZ9pqoy2VbLgFF5L3V8DJ1DboX9 g==;
X-CSE-ConnectionGUID: QV1Pl7wCQHuNdMBO/ORrAQ==
X-CSE-MsgGUID: HP7zP5P0TB2xU/k21z66lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39466309"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="39466309"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 09:55:21 -0700
X-CSE-ConnectionGUID: GkLpn0g/R0SeS/sleRPmyA==
X-CSE-MsgGUID: 0Egr57gUSFyoPx8IfuO79A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="80968066"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 09:55:20 -0700
Date: Fri, 11 Oct 2024 18:55:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_query: Add debug messsage with
 calculated refclock
Message-ID: <20241011165503.nebm53bgoen6a6cf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241011030507.321961-1-lucas.demarchi@intel.com>
 <20241011030507.321961-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011030507.321961-2-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-10-10 at 22:05:06 -0500, Lucas De Marchi wrote:

small type in subject:

tests/intel/xe_query: Add debug messsage with calculated refclock
----------------------------------^^^
s/messsage/message/

with this fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> When debugging new hardware, it's useful to check the refclock matches
> the expectation. Calculated the expected reflock and print it for quick
> check. Eventually this could be a test on its own if the err is stable.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_query.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 9e0fa93dd..87ddb58bb 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -708,7 +708,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>  {
>  	struct drm_xe_query_engine_cycles ts1 = {};
>  	struct drm_xe_query_engine_cycles ts2 = {};
> -	uint64_t delta_cpu, delta_cs, delta_delta;
> +	uint64_t delta_cpu, delta_cs, delta_delta, calc_freq;
>  	unsigned int exec_queue;
>  	int i, usable = 0;
>  	igt_spin_t *spin;
> @@ -770,7 +770,10 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>  			delta_cs = (((1 << ts2.width) - ts2.engine_cycles) + ts1.engine_cycles) *
>  				   NSEC_PER_SEC / eng_ref_clock;
>  
> -		igt_debug("freq %u Hz\n", eng_ref_clock);
> +		calc_freq = (ts2.engine_cycles - ts1.engine_cycles) * NSEC_PER_SEC / delta_cpu;
> +
> +		igt_debug("freq %u Hz, calc_freq %"PRIu64" Hz, err %.3f%%\n", eng_ref_clock,
> +			  calc_freq, fabs((double)calc_freq - eng_ref_clock) * 100 / eng_ref_clock);
>  		igt_debug("delta_cpu[%"PRIu64"], delta_cs[%"PRIu64"]\n",
>  			  delta_cpu, delta_cs);
>  
> -- 
> 2.46.2
> 
