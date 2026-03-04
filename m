Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97198EF8FFC
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 16:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A87B10EA4E;
	Wed,  4 Mar 2026 16:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwKFRfg9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C087210EA7B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772641109; x=1804177109;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mt8nvVwOZQ7JavTrG7wcuxifn6ORXpiJVRf0LxVbk64=;
 b=dwKFRfg9l5psMF1g3rAJNKr934lqxYbL3a4ZPjo2wK1AuG5Ci48ZEef2
 DLjgPb8a0rN4wroHnGcCCnDBVzrF91zWldJrNaXNDJiRqx9vMHTXc9TRD
 bssrekFI0QnkuVqxtBhJLybb+c0nmkge+6GkYXCTL/KLw+LQ5+6HTd6fZ
 AmmIpekAJ2yKBfwWcTqOFzghrhgvmZf83qaZsAbsGobEqoR32BJzC8NkP
 TyYyFSaeHtFsiqP3xRM10RtJzoX8dU+YI4sqp3mvY6js74LIAtQYyy0n2
 rmSGuRDxlcKZVk9z0iOlSbKYOa5MHqdqx1hhtdU0GdGpXwzjVR/Ka5Nwx g==;
X-CSE-ConnectionGUID: lHZo+UuES6mYhg8O3RIq7Q==
X-CSE-MsgGUID: cBRICajzT0OlXeEke9I8sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85055328"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="85055328"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:18:28 -0800
X-CSE-ConnectionGUID: i/EbBv7HSomLH3KPF5Lzzw==
X-CSE-MsgGUID: iNQpPVF4TZOo2XikfJswEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="222548717"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:18:27 -0800
Date: Wed, 4 Mar 2026 17:18:24 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com, 
 thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH i-g-t 3/5] tests/intel/xe_exec_system_allocator: Add hw
 engine argument for compute
Message-ID: <4rt2at637ifd3f3u3gyhejh27vuqfjyvb62k7wyd6k47wys2aw@mlfzt26jlos5>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
 <20260128173412.1319610-4-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128173412.1319610-4-francois.dugast@intel.com>
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

On Wed, Jan 28, 2026 at 06:29:08PM +0100, Francois Dugast wrote:
> Until now the hardware engine was selected implicitely during execution
> of run_intel_compute_kernel(). Instead, allow user to use a specific
> hardware engine, which will be helpful when reading GT stats.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index c5193f81e..d577eb4f3 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2202,7 +2202,8 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>   * @range-device-host:				touch the whole buffer, from the device then from the host
>   */
>  static void
> -test_compute(int fd, size_t size, unsigned int flags, int loops)
> +test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> +	     unsigned int flags, int loops)
>  {
>  	struct drm_xe_sync sync = {
>  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> @@ -2238,7 +2239,7 @@ test_compute(int fd, size_t size, unsigned int flags, int loops)
>  
>  		memset(compute_input, (rand() & 0xff), size);
>  
> -		run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> +		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
>  
>  		free(compute_input);
>  	}
> @@ -2647,15 +2648,23 @@ int igt_main()
>  	}
>  
>  	igt_subtest("compute")
> -		test_compute(fd, SZ_2M, 0, svm_compute_loops);
> +		xe_for_each_engine(fd, hwe)
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +				test_compute(fd, hwe, SZ_2M, 0, svm_compute_loops);
>  
>  	for (const struct section *s = csections; s->name; s++) {
>  		igt_subtest_f("eu-fault-4k-%s", s->name)
> -			test_compute(fd, SZ_4K, s->flags, svm_compute_loops);
> +			xe_for_each_engine(fd, hwe)
> +				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +					test_compute(fd, hwe, SZ_4K, s->flags, svm_compute_loops);
>  		igt_subtest_f("eu-fault-64k-%s", s->name)
> -			test_compute(fd, SZ_64K, s->flags, svm_compute_loops);
> +			xe_for_each_engine(fd, hwe)
> +				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +					test_compute(fd, hwe, SZ_64K, s->flags, svm_compute_loops);
>  		igt_subtest_f("eu-fault-2m-%s", s->name)
> -			test_compute(fd, SZ_2M, s->flags, svm_compute_loops);
> +			xe_for_each_engine(fd, hwe)
> +				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +					test_compute(fd, hwe, SZ_2M, s->flags, svm_compute_loops);
>  	}
>  
>  	igt_fixture() {
> -- 
> 2.43.0
> 
