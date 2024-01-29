Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1EDC47DA9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 08:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA9110F673;
	Mon, 29 Jan 2024 08:47:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C61910F04C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 08:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706518053; x=1738054053;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TaBg966Wl1p3r6FweLex6XsquuK5vwwHDLjY8/WAwN0=;
 b=adVe3QvpSOmfUMZ711AzRIX0r/MtI99vzTXJf5psdrV+Z/70FB1SW8BD
 yXuo39FFX3Xbu2o1/FL6Evnr1d6g1Ebo4SXXYCqQRRWaqVPkKC7MRuf2R
 Kou3imnyrqz5fSoImAq56ertdKylbw8hxRhHamj8hZ5e+joJO7ZFMwMWi
 Vo4SmJv1Q7KHdiBe58CCwBpmplOrFnZcAqi4UveosOkQIJVsQN4uAMNM/
 nRixl4f/UGxGjEfZttIMDgSTc/5FIsmMFw8BsTqDJkNhMfFNSXjwQg38M
 G8FBEz8/i64S9qw3cMqrKnvcMdr6n3X1LoLHBTc11n97jRQ10GzMALxX6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="16419389"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="16419389"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 00:47:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="29448088"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 00:47:28 -0800
Date: Mon, 29 Jan 2024 09:47:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_exec_atomic: Skip on unsupported
 config
Message-ID: <20240129084706.4abndzwylmz6z4pe@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 janga.rahul.kumar@intel.com
References: <20240129080155.31648-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240129080155.31648-1-nirmoy.das@intel.com>
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Nirmoy,
On 2024-01-29 at 09:01:55 +0100, Nirmoy Das wrote:
> Atomics on system memory for dGPU is not functional
> at this moment hence skip on such configuration.
> 
> v2: remove the skip_on.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_atomic.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
> index 7ee80816c..48c70ec72 100644
> --- a/tests/intel/xe_exec_atomic.c
> +++ b/tests/intel/xe_exec_atomic.c
> @@ -112,9 +112,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  
>  static bool has_atomics(int fd, uint32_t region)
>  {
> -	/* System memory atomics on PVC doesn't work */
> -	if (region == system_memory(fd) &&
> -	    IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
> +	/* System memory atomics on dGPU is not functional as of now */
> +	if (region == system_memory(fd) && xe_has_vram(fd))
>  		return false;
>  
>  	return true;
> @@ -135,8 +134,8 @@ igt_main
>  			uint64_t memreg = all_memory_regions(fd), region;
>  
>  			xe_for_each_mem_region(fd, memreg, region) {
> -
> -				igt_skip_on(!has_atomics(fd, region));
> +				if (!has_atomics(fd, region))
> +					continue;
>  
>  				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
>  					      xe_engine_class_string(hwe->engine_class),
> -- 
> 2.42.0
> 
