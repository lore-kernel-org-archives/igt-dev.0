Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8ECCA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 09:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDDF10E644;
	Wed, 17 Sep 2025 09:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hc8gzNs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F38C10E644
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 09:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758102275; x=1789638275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QtvIGWIWYCqous40mM9/Ri9fYLAbmIkZT/V47o/gdMc=;
 b=hc8gzNs+ZiC5M7Pt+8TFUSKEEXR2gvDeCf2AMKw13TMqmv6yuUuwMoGT
 zM+F+GEUGV0chUxCr/RoLlZYTkS0lTybd7r9V2PAd/vlVGVQJdmZ42bBu
 CzXpwW4ZhQ1wW1uNdGUQDSao+IBxvXBlyeloZZGNHIsdL7DMxEVxSX5tW
 hpH224880H3J/NG3dEhmwxIwVEjTzSebbT6LXNXsk0XcSfL6bFyUvG7Zr
 3Cy7mhb5CC8VDYzVEa9NOYdvQj/tc3ISYMiM4fqisESsOGRLi8itKHV47
 bLuHvhYKd19f2zjX5U86rliHymgYi67YSI7w4+DYWe4ctRZDoHsNbMs64 A==;
X-CSE-ConnectionGUID: 35jKBFbpQA21w+m7u1ynjw==
X-CSE-MsgGUID: mTqMx8gESWWTzikfLeNUFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="85842231"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="85842231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 02:44:35 -0700
X-CSE-ConnectionGUID: x8dgoqfkQS+SPJM0S9cg7Q==
X-CSE-MsgGUID: QdcBIbsaStaZAREHClTleA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="175280438"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 02:44:33 -0700
Date: Wed, 17 Sep 2025 11:44:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com
Subject: Re: [PATCH v5 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Message-ID: <20250917094419.asrgnhpaclqb2fmf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com
References: <20250917035639.187462-1-sobin.thomas@intel.com>
 <20250917035639.187462-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917035639.187462-2-sobin.thomas@intel.com>
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
On 2025-09-17 at 03:56:39 +0000, Sobin Thomas wrote:
> On platforms (like PVC) that do not support walker mid-thread
> preemption, running tests in forked threads can lead to inconsistent
> states due to igt_skip being called mid-execution. Made changes to
> perform kernel preemption check at the beginning of each subtests.
> If the GPU version does not support the required features, the
> test is skipped gracefully, ensuring consistent behavior across
> different platforms.
> 
> TODO: Add the kernel for PVC

Please move this TODO as a comment into a source code,
not here, or/and you could also write it after '---' below.

> 
> v2: Fixed review comments to move the compatibility check
>     into the igt_fixture.
> 
> v3: Added check for thread group preemption and WMTP.
>     Added enum flags for preemption type as per review . [Zbigniew]
> 
> v4: Added check for preempt inside __run_intel_compute_kernel_preempt
>     Refactored the code.  [priyanka]
> 
> v5: Refactor for finding the kernel and out of bound check. [Zbigniew]
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>

---
Here you could add some comments so they will not be added into
a git log.

> ---
>  lib/intel_compute.c              | 95 +++++++++++++++++++++++++-------
>  lib/intel_compute.h              |  7 +++
>  tests/intel/xe_compute_preempt.c |  6 ++
>  3 files changed, 89 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 147dd2916..f698ea17d 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1921,14 +1921,33 @@ static const struct {
>  	},
>  };
>  
> +static const struct intel_compute_kernels
> +		*find_kernel(const struct intel_compute_kernels  *kernels,
> +		unsigned int ip_ver)
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
> +	igt_info("%s: No Match found for ip_ver=%u\n", __func__, ip_ver);
> +
> +	return NULL;
> +}
> +

[cut]

>  				continue;
> -- 
> 2.34.1

Please update your git, current version is 2.51.0 but any recent
from your distro should be ok.

Regards,
Kamil

