Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F658EF9002
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 16:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD70010EA5B;
	Wed,  4 Mar 2026 16:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fP59nIlb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F4910EA4E
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772640800; x=1804176800;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oVeNzNFlPjmfNJNLbvLA5mVYW2K0K0l7XK14QNH97EY=;
 b=fP59nIlbN7OudIXzl09fCtnCph14S8UZ/WGdMmdBDMKn+0/jPfuSY/q6
 ltWKMW7H/EhD9WmNoTiaFHLgLwzg6u7sg5CwRdNn/IP3OVKaeYSCC6y9P
 W3Fo5jww2ulRdKLP4Vg9Kait65hnfQpybWSZK5vog+T7+NA6Hr4VVgnhc
 1CoUmaVVhSTRSpI8Cr/7zjCvKCL23fB0YInbEKNcc98pL5YUZl8FR0W+e
 1LgpDU10gcPJ5alnUYaRcskET21b+NTb1TdQo+DewAIqZx4EHYpbdVw+p
 LEFzUDmH2PMiUDdu7Sd5r2augViZsPkg8oOdaeyTMCGoDnnu7yJGAVWJ4 w==;
X-CSE-ConnectionGUID: svoQBk4uQKCSV1C6t1X43w==
X-CSE-MsgGUID: /yrQW9a8SRaG/WYg+6Z4fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85054560"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="85054560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:13:20 -0800
X-CSE-ConnectionGUID: GpTGqTg2ThOGJU7raUcTiA==
X-CSE-MsgGUID: OXUt4DJQScmk+dMWJIkOFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="222547820"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:13:19 -0800
Date: Wed, 4 Mar 2026 17:13:15 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com, 
 thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH i-g-t 1/5] tests/intel/xe_exec_system_allocator: Fix
 compute array migration size
Message-ID: <jp64zuwo26deddnpfohmpkx6yu6z2jvleugjisb5bfz74crxbj@r2g4h6jemhqd>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
 <20260128173412.1319610-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128173412.1319610-2-francois.dugast@intel.com>
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

On Wed, Jan 28, 2026 at 06:29:06PM +0100, Francois Dugast wrote:
> This fixes an issue where the migrated region size when handling the GPU
> page fault did not match test_compute()'s size argument.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 412ad0384..23a429f24 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2220,7 +2220,6 @@ test_compute(int fd, size_t size, unsigned int flags)
>  		.array_size = size / sizeof(float),
>  	};
>  	float *compute_input;
> -	int i;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>  	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
> @@ -2228,7 +2227,7 @@ test_compute(int fd, size_t size, unsigned int flags)
>  	bind_system_allocator(&sync, 1);
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  
> -	compute_input = aligned_alloc(SZ_2M, size);
> +	compute_input = aligned_alloc(size, size);
>  	igt_assert(compute_input);
>  
>  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> @@ -2236,8 +2235,7 @@ test_compute(int fd, size_t size, unsigned int flags)
>  	env.input_addr = to_user_pointer(compute_input);
>  	env.vm = vm;
>  
> -	for (i = 0; i < env.loop_count; i++)
> -		compute_input[i] = rand() / (float)RAND_MAX;
> +	memset(compute_input, (rand() & 0xff), size);

It might be rare case, but 0 may also be use to fill compute_input.
rand() % 255 + 1 would eliminate this possibility.

Regardless above nit:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  
>  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
>  
> -- 
> 2.43.0
> 
