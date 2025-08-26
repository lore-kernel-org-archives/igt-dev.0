Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C67CA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 15:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DC510E37B;
	Tue, 26 Aug 2025 15:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9rnmwFU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8901D10E37B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 15:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756222818; x=1787758818;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8jqfvXaHxS/cg9ZkPO6awlkbKaoobErI+965sLNyfSU=;
 b=I9rnmwFUXbK0YE1WX6MYsdnVIgWE0Qz4Hjd9DsdP/iu8jQGTsft+h91g
 4YFvwIRvxb30pR5BrfridMZaQnzB4IIDHXZ+iUdZiEFCzBYLTsn7OV45n
 mO81gi09jFqBrWjk/q9GQMFvwF1dBQKX+G+2i/arXWqJdNnXYnMhCnsu5
 1aJo5TYiDmmhxM5BdyndGiGC/qelpOSIVxjmvQYEmgNSX+AKVgfJPq7dk
 MnvqE1hT9rSf+RJ+UWaqmxXDoXYJ4PsBARndiFlhwDHwxkMzBuq3uLvPl
 RaACrFkBj9WoLxkPcQd8stYTfoH3vvTRhSaPs76qBHlYjyok8NZZoI8vf w==;
X-CSE-ConnectionGUID: QQ+Y+XrTQ4WGzrnxrvWwZg==
X-CSE-MsgGUID: ThQCWjeLTFq90v3WsQeLHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58522229"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58522229"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 08:40:17 -0700
X-CSE-ConnectionGUID: 1f6UWPyuRy6FWxLksnQpfw==
X-CSE-MsgGUID: MAV6QtiOTh62H++iSo63lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="200549761"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 08:40:13 -0700
Date: Tue, 26 Aug 2025 17:39:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t 1/1] tests/xe_evict_ccs:Adjust object size as per
 VRAM
Message-ID: <20250826153959.wox4n55idnicw4l3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com
References: <20250826055049.505047-1-sobin.thomas@intel.com>
 <20250826055049.505047-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250826055049.505047-2-sobin.thomas@intel.com>
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

Hi Sobin,
On 2025-08-26 at 05:50:49 +0000, Sobin Thomas wrote:

change subject, add 'intel/' prefix, also add space after ':'
so it will be like:

[PATCH i-g-t 1/1] tests/intel/xe_evict_ccs: Adjust object size as per VRAM

> Some BIOS configurations do not support or enable resizable BAR,
> resulting in a maximum BAR size of 256MB. This patch adjusts the

s/This patch adjust/Adjust/

> maximum object size used in test conditions based on the available
> VRAM.
> 
> v2: Adjusted the subject name
> 
> v3: Inco-operated review comments [kamil]
> 
> v4: Fixed typo.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_evict_ccs.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
> index 281d27015..841ed2997 100644
> --- a/tests/intel/xe_evict_ccs.c
> +++ b/tests/intel/xe_evict_ccs.c
> @@ -343,6 +343,35 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
>  	igt_debug("nproc: %d, mem per proc: %dMB\n", nproc, config->mb_per_proc);
>  }
>  
> +static void adjust_params_for_vram_size(uint64_t vram_size)
> +{
> +	uint64_t vram_mb = vram_size / (1024 * 1024);
> +	int recommended_max_size_kb;
> +	bool user_set_max_size = (params.max_size_kb != MAX_OBJ_KB);

Maybe you should remember that user changed this?
What if user will give MAX_OBJ_KB as input param?

> +
> +	 /* max_object_mb = VRAM_mb / 64, clamped between 2MB and 256MB
> +	  * Formula works for all VRAM sizes with consistent behavior

Remove this 2nd sentence and make it a one-liner comment.

> +	  */
> +	int max_object_mb = vram_mb / MIN_OBJ_KB;
> +
> +	max_object_mb = max_t(int, 2, min_t(int, max_object_mb, 256));
> +	recommended_max_size_kb = max_object_mb * 1024;
> +
> +	igt_info("VRAM (%"PRIu64"MB): Calculated %d%% usage, %dMB max objects\n",
> +		 vram_mb, params.vram_percent, max_object_mb);
> +
> +	if (user_set_max_size) {

Warn only when user actually wants to have larger size, so add:

	if (user_set_max_size &&
	    recommended_max_size_kb < params.max_size_kb) {

> +		igt_warn("User specified max object size (%dKB) may not be"
> +				"optimal for %"PRIu64"MB VRAM (recommended: %dKB)\n",
> +				params.max_size_kb, vram_mb, recommended_max_size_kb);

Any reason for printing sizes in KB? Imho it is better to print
in MB or both.

Regards,
Kamil

> +	} else {
> +		params.max_size_kb = recommended_max_size_kb;
> +	}
> +
> +	igt_info("Final settings: %d%% VRAM, %dMB max object\n",
> +		 params.vram_percent, params.max_size_kb / 1024);
> +}
> +
>  static void evict_ccs(int fd, uint32_t flags, const struct param *param)
>  {
>  	struct config config;
> @@ -500,6 +529,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
>  		igt_require(xe_has_vram(fd));
>  		vram_size = xe_visible_vram_size(fd, 0);
>  		igt_assert(vram_size);
> +		adjust_params_for_vram_size(vram_size);
>  		has_flatccs = HAS_FLATCCS(intel_get_drm_devid(fd));
>  	}
>  
> -- 
> 2.34.1
> 
