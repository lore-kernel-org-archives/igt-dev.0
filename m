Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBCBCA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 17:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F81F10E1F4;
	Thu, 14 Aug 2025 17:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EN+XZf61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042F810E1F4
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755191967; x=1786727967;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ILzAmIlYmgBhYMe3UaoFDUa5piz6wCYSPpzIIl4FZLI=;
 b=EN+XZf616bJAui4JtIW3aEIau74qpZPR9nFX7s6Njw8owaLOL/JuUxL5
 q0mNET5pVNh+OJPB4QW1Lip7WAjOmrsfNtcVvcF+0BoahvJFNGT0TFIEq
 b3wAUeTWR8Kied1UXwMNcS7coac4qf/USEDpyuAQ6getqKEcSTQpZF78K
 dM7Nm0uh1BxcuoBH1yH6xCpCla48UBaXQ+padkSIVDegvcpXU+OkfMNKp
 v8+o6Hw9UGutsp0R7EVnyyr4UjACTONCKCJJXHQxFiDmD246y9HnGs7n+
 9jQnt5j1pvaHyxLbOh6EON9riW5ydJ8u4lfK2XM3MSU2DbZKnZXNQ69d1 Q==;
X-CSE-ConnectionGUID: 6HJjS6XvR0e9/4e22y3ePA==
X-CSE-MsgGUID: +qe4ocZwRsOfSrnTi293uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57232246"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57232246"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 10:19:11 -0700
X-CSE-ConnectionGUID: G9LUNnocQ2K4KfTaVoYBLg==
X-CSE-MsgGUID: 2C/Xdxy3S2uiTu5RUZa37Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="203994399"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 10:19:10 -0700
Date: Thu, 14 Aug 2025 19:19:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/3] lib/intel_compute: loop_kernel_duration in Pipeline
Message-ID: <w6uwawcbjaojxjs7ieezdpaunkoqf5zxnxwmskflwelxofldym@uh2fuzorh7ic>
References: <20250814155814.130545-1-nishit.sharma@intel.com>
 <20250814155814.130545-2-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814155814.130545-2-nishit.sharma@intel.com>
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

On Thu, Aug 14, 2025 at 03:58:12PM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> To execute KERNEL in GPU for specific duration a brief sleep is
> required. New variable loop_kernel_duration is introduced in
> struct user_execenv which holds duration for sleep and during this
> duration the GPU will be running kernel.
> loop_kernel_duration is checked for all pipelines.

There's missing part from the 2/3 patch here.

You should explain what's for is loop kernel duration and why you've
selected sleep to control execution time of this loop kernel. You
should also explain why only single pipeline supports this method
of controlling execution time.

Code looks correct imo (apart of missing 2/3 part), but let's wait for CI.

--
Zbigniew

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/intel_compute.c | 21 ++++++++++++++++++++-
>  lib/intel_compute.h |  2 ++
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 147dd2916..125331c53 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -849,6 +849,9 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	uint16_t devid = intel_get_drm_devid(fd);
>  	int entries = ARRAY_SIZE(bo_dict);
>  
> +	if (user && (user->kernel || user->loop_kernel_duration))
> +		igt_skip("Pipeline doesn't support loop_kernel\n");
> +
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
>  	/* Set dynamic sizes */
> @@ -1131,6 +1134,9 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	int entries = ARRAY_SIZE(bo_dict);
>  
> +	if (user && (user->kernel || user->loop_kernel_duration))
> +		igt_skip("Pipeline doesn't support loop_kernel\n");
> +
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
>  	/* Set dynamic sizes */
> @@ -1343,6 +1349,9 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	int entries = ARRAY_SIZE(bo_dict);
>  
> +	if (user && (user->kernel || user->loop_kernel_duration))
> +		igt_skip("Pipeline doesn't support loop_kernel\n");
> +
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
>  	/* Set dynamic sizes */
> @@ -1731,6 +1740,9 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	int entries = ARRAY_SIZE(bo_dict);
>  
> +	if (user && (user->kernel || user->loop_kernel_duration))
> +		igt_skip("Pipeline doesn't support loop_kernel\n");
> +
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
>  	/* Set dynamic sizes */
> @@ -1849,7 +1861,14 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  				    OFFSET_KERNEL, 0, false,
>  				    execenv.array_size);
>  
> -	bo_execenv_exec(&execenv, ADDR_BATCH);
> +	if (user && user->loop_kernel_duration) {
> +		bo_execenv_exec_async(&execenv, ADDR_BATCH);
> +		igt_measured_usleep(user->loop_kernel_duration);
> +		((int *)bo_dict[4].data)[0] = MAGIC_LOOP_STOP;
> +		bo_execenv_sync(&execenv);
> +		user->skip_results_check = 1;
> +	} else
> +		bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	if (!user || (user && !user->skip_results_check))
>  		bo_check_square(input_data, output_data, execenv.array_size);
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index 412791d07..54a1c7f82 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -63,6 +63,8 @@ struct user_execenv {
>  	uint64_t input_addr;
>  	/** @output_addr: override default address of the output array if provided */
>  	uint64_t output_addr;
> +	/** @loop_kernel_duration: duration till kernel should execute in gpu **/
> +	uint64_t loop_kernel_duration;
>  };
>  
>  enum execenv_alloc_prefs {
> -- 
> 2.43.0
> 
