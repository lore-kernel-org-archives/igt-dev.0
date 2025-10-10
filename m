Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FF1CAC5BB
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 09:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F241610EB98;
	Fri, 10 Oct 2025 09:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmzOgwsR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BB410EB98
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 09:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760088217; x=1791624217;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3xYzCw7J9GEMDliScpkyhxkNCVaFnrGrYwuixBML098=;
 b=gmzOgwsR1QAlKyOt6MjWPYHn4mu4Qze9etPMGBgga9FqWcRPiBD9dpaZ
 BaUuCFYiwJpOd48TrDsF+avVb6lC6eANuKB9I8U/2+5ZvnHaCkVX+b76k
 PuxUNukaXOZOasUkTmkUGe3KtiO4FyUjVSEw4Xdnc+csma2bDORa8u4xF
 DGflOjrMcm+2I4MuvrNv0PAMOwNx3K4r/sRsLAmZY9cP80FxSPUitzLYJ
 eeJRxv0uglh5Xdyi7z7pZ0YGymnnzII0GCv24O3CiI5/WfajVt+qQWqOU
 Zufag4Y37ogxoHXDZ8+WgXK5wlKk3aFsFWLYrcZObfIedshWvm9f/2y6Z w==;
X-CSE-ConnectionGUID: rLi8Ry+KTz6oKFEEZLzi5Q==
X-CSE-MsgGUID: 7Ys5fBXSSJG9hz0Op1tjRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62333989"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62333989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:23:37 -0700
X-CSE-ConnectionGUID: o/aunfGmQxCqCpYCXAZIyg==
X-CSE-MsgGUID: 22Bf5KdYQmifl9IcaQ/XRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="185324071"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.136])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:23:36 -0700
Date: Fri, 10 Oct 2025 11:23:33 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com, 
 priyanka.dandamudi@intel.com
Subject: Re: [PATCH i-g-t v9 2/3] lib/intel/intel_compute: Add kernel lookup
 and validation for compute IP versions
Message-ID: <ossu42ykl4gz5noknqkxmcoy5k36lh2ril6xmnas6kuk55jzyy@pbeog6crfcj6>
References: <20251003052640.56068-1-sobin.thomas@intel.com>
 <20251003052640.56068-3-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003052640.56068-3-sobin.thomas@intel.com>
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

On Fri, Oct 03, 2025 at 05:26:20AM +0000, Sobin Thomas wrote:
> Introduce functions to locate compute square kernels based on IP version
> and validate their availability for preemption scenarios.
> 
> - intel_compute_find_kernels() returns the matching kernel entry.
> - validate_kernels() ensures required kernel variants are present
>   for compute and preemption kernels.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  lib/intel_compute.c | 90 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 69 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index ae656a4f6..ade0b44c1 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1921,23 +1921,80 @@ static const struct {
>  	},
>  };
>  
> +static const struct intel_compute_kernels
> +		*intel_compute_find_kernels(const struct intel_compute_kernels *kernels,
> +		unsigned int ip_ver)

This should be indented to function arguments.

Rest looks good to me, with nit you have to migrate kernel_entries
assignment from 1/3 to this patch.

With these nits addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +{
> +	if (!kernels) {
> +		igt_debug("%s: kernel_list is NULL\n", __func__);
> +		return NULL;
> +	}
> +
> +	while (kernels->kernel) {
> +		if (ip_ver == kernels->ip_ver)
> +			return kernels;
> +		kernels++;
> +	}
> +
> +	return NULL;
> +}
> +
> +static bool validate_kernels(const struct intel_compute_kernels *kernels,
> +			     bool check_preemption, bool threadgroup_preemption,
> +			     unsigned int ip_ver)
> +{
> +	if (!kernels) {
> +		igt_warn("No kernel entry found for IP version 0x%x\n", ip_ver);
> +		return false;
> +	}
> +
> +	if (!kernels->kernel) {
> +		igt_warn("Missing compute square kernel for IP version 0x%x\n", ip_ver);
> +		return false;
> +	}
> +
> +	if (!check_preemption)
> +		return true;
> +
> +	/* The following checks are only performed if preemption check is enabled. */
> +	if (threadgroup_preemption && !kernels->long_kernel) {
> +		igt_warn("Missing Long kernel for IP version 0x%x\n", ip_ver);
> +		return false;
> +	} else if (!threadgroup_preemption) {
> +		if (!kernels->sip_kernel) {
> +			igt_warn("Missing SIP kernel for IP version 0x%x\n", ip_ver);
> +			return false;
> +		}
> +		if (!kernels->loop_kernel) {
> +			igt_warn("Missing Loop kernel for IP version 0x%x\n", ip_ver);
> +			return false;
> +		}
> +	}
> +	return true;
> +}
> +
> +static int find_compute_batch(unsigned int ip_ver)
> +{
> +	for (int batch_idx = 0; batch_idx < ARRAY_SIZE(intel_compute_batches); batch_idx++)
> +		if (ip_ver == intel_compute_batches[batch_idx].ip_ver)
> +			return batch_idx;
> +	return -1;
> +}
> +
>  static bool __run_intel_compute_kernel(int fd,
>  				       struct drm_xe_engine_class_instance *eci,
>  				       struct user_execenv *user,
>  				       enum execenv_alloc_prefs alloc_prefs)
>  {
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> -	unsigned int batch;
> -	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
> +	int batch;
> +	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
>  	enum intel_driver driver = get_intel_driver(fd);
>  	const unsigned char *kernel;
>  	unsigned int kernel_size;
>  
> -	for (batch = 0; batch < ARRAY_SIZE(intel_compute_batches); batch++) {
> -		if (ip_ver == intel_compute_batches[batch].ip_ver)
> -			break;
> -	}
> -	if (batch == ARRAY_SIZE(intel_compute_batches)) {
> +	batch = find_compute_batch(ip_ver);
> +	if (batch < 0) {
>  		igt_debug("GPU version 0x%x not supported\n", ip_ver);
>  		return false;
>  	}
> @@ -1954,12 +2011,8 @@ static bool __run_intel_compute_kernel(int fd,
>  		kernel = user->kernel;
>  		kernel_size = user->kernel_size;
>  	} else {
> -		while (kernels->kernel) {
> -			if (ip_ver == kernels->ip_ver)
> -				break;
> -			kernels++;
> -		}
> -		if (!kernels->kernel)
> +		kernels = intel_compute_find_kernels(kernel_entries, ip_ver);
> +		if (!validate_kernels(kernels, false, false, ip_ver))
>  			return false;
>  		kernel = kernels->kernel;
>  		kernel_size = kernels->size;
> @@ -2270,18 +2323,13 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>  		return false;
>  	}
>  
> -	while (kernels->kernel) {
> -		if (ip_ver == kernels->ip_ver)
> -			break;
> -		kernels++;
> -	}
> -
>  	if (!is_preemptable(batch, required_preempt))
>  		return false;
>  
> -	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)
> -		return 0;
> +	kernels = intel_compute_find_kernels(kernel_entries, ip_ver);
>  
> +	if (!validate_kernels(kernels, true, threadgroup_preemption, ip_ver))
> +		return false;
>  	intel_compute_preempt_batches[batch].compute_exec(fd, kernels->long_kernel,
>  							  kernels->long_kernel_size,
>  							  kernels->kernel, kernels->size,
> -- 
> 2.51.0
> 
