Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C448FCA0FF7
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 10:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733A210EB7E;
	Fri, 29 Aug 2025 10:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lT7PPgJo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0851410EB7D
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756462406; x=1787998406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zZuvn83UtkDane9e85yNU1C24bq6vTrspWUx8hLP868=;
 b=lT7PPgJod9oX9oNBEvjLtQHji7H8N0Ms/qf6wsz3XzBrLJ83BS6CWa3s
 C7K20cui9g73CSnaKn/aRBj9qXT2lK0/nImpP7HpOqmltrIBYekztuvLM
 xC2EsfOysMNF+OCIcQyd6vIBxcAW0aL1KH9m/UAt/ZersInYKmIzsj5NX
 xWQFm3Ea+F1hPVAmJzj5vAiduNi9fYuUHGsPq3TBrNwz0ZVMWlw+nQAyC
 P33jwQaM9V7U7TVj41xBvvzE0E7vCVsmrwyqRKwEFPCtoQNwpxUSuGDO6
 lpQbGjhw+0QrQNL6tVxW7xfZSBRtG1Mbz7cL5HGFsnuIJQQAcPNk5Ov8o Q==;
X-CSE-ConnectionGUID: MejGSCPcQg21dZi8/B1TrQ==
X-CSE-MsgGUID: E8Mc5NX8SMiGsFTOwy/yeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="70184698"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70184698"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:13:25 -0700
X-CSE-ConnectionGUID: ywi3ZXGxRVK9oFdYzpmjoQ==
X-CSE-MsgGUID: E5hUJVRhSIe5s/AF3jnXYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169600411"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:13:23 -0700
Date: Fri, 29 Aug 2025 12:13:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_evict_ccs: This patch adjust object
 size as per VRAM
Message-ID: <20250829101307.4uocrsrz3xuevojq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com
References: <20250829035609.858784-1-sobin.thomas@intel.com>
 <20250829035609.858784-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829035609.858784-2-sobin.thomas@intel.com>
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
On 2025-08-29 at 03:56:09 +0000, Sobin Thomas wrote:

overall looks good, few nits left, see below.

first nit about subject, s/This patch //

Also looking into desciption below, maybe even better will be:

[PATCH i-g-t] tests/intel/xe_evict_ccs: adjust object size for non-resizable BAR

> Some BIOS configurations do not support or enable resizable BAR,
> resulting in a maximum BAR size of 256MB. This patch adjusts the

Same here s/This patch adjusts/Adjust/

> maximum object size used in test conditions based on the available

s/conditions//

> VRAM.
> 
> v2: Adjusted the subject name
> 
> v3: Inco-operated review comments [kamil]
> 
> v4: Fixed typo.
> 
> v5: Fixed review comment for igt warnings and commit subject. [kamil]
>     Fixed the condition for user provided max size value. [kamil]
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_evict_ccs.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
> index 281d27015..16abba4ec 100644
> --- a/tests/intel/xe_evict_ccs.c
> +++ b/tests/intel/xe_evict_ccs.c
> @@ -39,12 +39,14 @@ static struct param {
>  	int vram_percent;
>  	int min_size_kb;
>  	int max_size_kb;
> +	bool user_set_max_size;
>  	bool verify;
>  } params = {
>  	.num_objs = 0,
>  	.vram_percent = OVERCOMMIT_VRAM_PERCENT,
>  	.min_size_kb = MIN_OBJ_KB,
>  	.max_size_kb = MAX_OBJ_KB,
> +	.user_set_max_size = false,
>  };
>  
>  struct object {
> @@ -343,6 +345,34 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
>  	igt_debug("nproc: %d, mem per proc: %dMB\n", nproc, config->mb_per_proc);
>  }
>  
> +static void adjust_params_for_vram_size(uint64_t vram_size)
> +{
> +	uint64_t vram_mb = vram_size / (1024 * 1024);
> +	int recommended_max_size_kb = 0;

No need for this init, it is set below.

> +	int max_object_mb = vram_mb / MIN_OBJ_KB;

In description you wrote that on non-resizable BAR this is up
to 256MB so imho you should just skip all calculations if
vram_mb > 256MB and use tests default.

> +
> +	/* max_object_mb clamped between 2MB and 256MB */
> +	max_object_mb = max_t(int, 2, min_t(int, max_object_mb, 256));
> +	recommended_max_size_kb = max_object_mb * 1024;
> +
> +	igt_info("VRAM (%"PRIu64"MB): Calculated %d%% usage, %dMB max objects\n",
> +		 vram_mb, params.vram_percent, max_object_mb);
> +
> +	if (params.user_set_max_size &&
----------- ^
> +		params.max_size_kb > recommended_max_size_kb) {

Align to previous:
	if (params.user_set_max_size &&
	    params.max_size_kb > recommended_max_size_kb) {


> +		igt_warn("User specified size (%dMB) may not be optimal for %"PRIu64"MB VRAM\n"
> +				"(recommended size: %dMB)\n",

Align.

> +				params.max_size_kb / 1024, vram_mb,

Align.

> +				recommended_max_size_kb / 1024);

Align.

> +
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
> @@ -440,6 +470,7 @@ static int opt_handler(int opt, int opt_index, void *data)
>  		break;
>  	case 'S':
>  		params.max_size_kb = atoi(optarg);
> +		params.user_set_max_size = true;

Yes, this make it explicit.

Regards,
Kamil

>  		igt_debug("Max size kb: %d\n", params.max_size_kb);
>  		break;
>  	case 'V':
> @@ -500,6 +531,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
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
