Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E516DC83F17
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 12:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDD710E167;
	Mon, 28 Jul 2025 12:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqP0Uf+o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7BE10E167
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 12:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753705642; x=1785241642;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2BS9NfUYJunrT7/9SffsMpfYqEXDcP3QETb2KCD1+1k=;
 b=XqP0Uf+oa/gJkPhTpm71vcgNk8N0fnSxFJSGAPSk8awpTgbiz2HidjX1
 iwvmMlg9wLlpidsusJKCT9CZZhCyiYdFxAsNwuzSaN/3anfJX3trPc+xj
 GIqL7+OQ5bgsCgRpW19wWXZCTE1BZqj049+dR7C+7zFSDfX5AwlBm7N4H
 QHUMoyqwVAvDTOypcS1iE4JjwH00XGgqA8D67WehYnAQ6YwkbDaRUBBU9
 MV99KHCxKN0r3VilQhZn28kwi9u4F10r+q32yZYWeZGJs/b3LaAVyQvYb
 e+ksYxhilwop20XKi6pC6CgNgZkwuL9hYYkaKfxQJICPaJ93n5yfOHsrR w==;
X-CSE-ConnectionGUID: h/DloiNSSUydsb5GsSBMbw==
X-CSE-MsgGUID: pws2FPT2RxGSryKVwhr5JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55030364"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55030364"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 05:27:22 -0700
X-CSE-ConnectionGUID: IH7ENCkfSiqu29JE+yNGnw==
X-CSE-MsgGUID: veKWyknlTBS2vtrbumA68A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167733199"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 05:27:21 -0700
Date: Mon, 28 Jul 2025 14:27:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t 1/1] tests/xe_evict_ccs:Add check to update object
 param as per visible RAM
Message-ID: <20250728122703.l3jxd6jl5gb5ji5h@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
References: <20250723150508.552862-1-sobin.thomas@intel.com>
 <20250723150508.552862-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723150508.552862-2-sobin.thomas@intel.com>
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
On 2025-07-23 at 15:05:08 +0000, Sobin Thomas wrote:

I have few nits, first about subject:

[PATCH i-g-t 1/1] tests/xe_evict_ccs:Add check to update object param as per visible RAM

imho better:

[PATCH i-g-t 1/1] tests/intel/xe_evict_ccs: Ajust object size


> This change will modify the parameters for the test based on the
> available visible ram and update the max object size that is calculated
> based on the existing method

Rather then translating C-code into english, write here
why and when change is needed, also is this a fix for
some VRAM versus SRAM scenarios? What problem are you
solving?

> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_evict_ccs.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
> index 281d27015..9abff1389 100644
> --- a/tests/intel/xe_evict_ccs.c
> +++ b/tests/intel/xe_evict_ccs.c
> @@ -343,6 +343,31 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
>  	igt_debug("nproc: %d, mem per proc: %dMB\n", nproc, config->mb_per_proc);
>  }
>  
> +static void adjust_params_for_vram_size(uint64_t vram_size)
> +{
> +	uint64_t vram_mb = vram_size / (1024 * 1024);
> +	int recommended_max_size_kb;
> +	bool user_set_max_size = (params.max_size_kb != MAX_OBJ_KB);
> +	int max_object_mb = vram_mb / 64;

Why '64' is used here? If that is used also elsewhere
make it a define.

Regards,
Kamil

> +
> +	max_object_mb = max_t(int, 2, min_t(int, max_object_mb, 256));
> +	recommended_max_size_kb = max_object_mb * 1024;
> +
> +	igt_info("VRAM (%"PRIu64"MB): Calculated %d%% usage, %dMB max objects\n",
> +		 vram_mb, params.vram_percent, max_object_mb);
> +
> +	if (user_set_max_size) {
> +		igt_warn("User specified max object size (%dKB) may not be
> +				optimal for %"PRIu64"MB VRAM (recommended: %dKB)\n",
> +				params.max_size_kb, vram_mb, recommended_max_size_kb);
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
> @@ -500,6 +525,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
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
