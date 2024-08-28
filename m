Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE662C5AE5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 15:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CF510E55D;
	Wed, 28 Aug 2024 15:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbNr2SDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D245010E55D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724857257; x=1756393257;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LX8LcOQ12E+DEw2AaAvx4umUCjdwsFA5bvPbVcz0S1U=;
 b=PbNr2SDxSvkoWYzYKeZ5X0SLyUI2rQO0zRiBljd8QovXftPwMZIJa+EI
 T0uDPJtFWq882lEx5IpvfZOChiKgxtR/59Y0zMNkUt87fpryy4tvR+1cO
 bjP7BmV6TA1UiM6GLaESRpyjzauZcapo8O68yHBbAYJwJihhNOl2UakUl
 Klboov1OtrXFHUlZPldoNumhbGQZqMinPMBiwfLz5UOWYdQsO0zzXKuEz
 5C8DedUzDkuDeJecL/Q3J2yAJHxeS9OFwf1HwtdV6wDb15KkbH+aPIfdY
 27/UZx7MS6dV04l/RF5MvoK5dVwcPtZZ4h/aBFPPRRR1ZkmebpmTIIRIa A==;
X-CSE-ConnectionGUID: v+7iv62iSPiy0iEmwFLnkQ==
X-CSE-MsgGUID: OIs1PklkTdayBUr/ZmSa3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27159824"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="27159824"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:00:56 -0700
X-CSE-ConnectionGUID: lg7fNRgjQ1aMNw8btOTcXA==
X-CSE-MsgGUID: zbPPDEz+QIC7KcYUtnphIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67611926"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:00:54 -0700
Message-ID: <af20a300-6bf4-4bdb-8852-fee95787b5e3@linux.intel.com>
Date: Wed, 28 Aug 2024 17:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 08/10] tests/intel/xe_drm_fdinfo: Remove unused
 flags
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
 <20240827165449.1706784-9-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240827165449.1706784-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 8/27/2024 6:54 PM, Lucas De Marchi wrote:
> single() is the only test function that is used by multiple kinds of
> tests and controlled by flags. The others simply pass the same flags
> every time. Simplify the tests by removing the bogus checks.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c | 81 +++++++++++++++++--------------------
>   1 file changed, 38 insertions(+), 43 deletions(-)
>
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 46c96dbe0..23edeea40 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -538,7 +538,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
>   }
>   
>   static void
> -busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
> +busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
>   {
>   	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>   	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> @@ -547,20 +547,20 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int fl
>   	int class;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> -	if (flags & TEST_BUSY) {
> -		ctx = spin_ctx_init(fd, hwe, vm);
> -		spin_sync_start(fd, ctx);
> -	}
> +
> +	ctx = spin_ctx_init(fd, hwe, vm);
> +	spin_sync_start(fd, ctx);
>   
>   	read_engine_cycles(fd, pceu1);
>   	usleep(batch_duration_usec);
> -	if (flags & TEST_TRAILING_IDLE)
> -		spin_sync_end(fd, ctx);
> +	spin_sync_end(fd, ctx);
>   	read_engine_cycles(fd, pceu2);
>   
> -	xe_for_each_engine_class(class)
> -		check_results(pceu1, pceu2, class,
> -			      hwe->engine_class == class ? flags : 0);
> +	xe_for_each_engine_class(class) {
> +		bool idle = hwe->engine_class != class;
> +
> +		check_results(pceu1, pceu2, class, idle ? 0 : TEST_BUSY);
> +	}
>   
>   	spin_sync_end(fd, ctx);
>   	spin_ctx_destroy(fd, ctx);
> @@ -594,8 +594,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
>   }
>   
>   static void
> -most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
> -		    unsigned int flags)
> +most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
>   {
>   	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>   	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> @@ -605,32 +604,31 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
>   	int class;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> -	if (flags & TEST_BUSY) {
> -		/* spin on one hwe per class except the target class hwes */
> -		xe_for_each_engine(fd, _hwe) {
> -			int _class = _hwe->engine_class;
>   
> -			if (_class == hwe->engine_class || ctx[_class])
> -				continue;
> +	/* spin on one hwe per class except the target class hwes */
> +	xe_for_each_engine(fd, _hwe) {
> +		int _class = _hwe->engine_class;
>   
> -			ctx[_class] = spin_ctx_init(fd, _hwe, vm);
> -			spin_sync_start(fd, ctx[_class]);
> -		}
> +		if (_class == hwe->engine_class || ctx[_class])
> +			continue;
> +
> +		ctx[_class] = spin_ctx_init(fd, _hwe, vm);
> +		spin_sync_start(fd, ctx[_class]);
>   	}
>   
>   	read_engine_cycles(fd, pceu1);
>   	usleep(batch_duration_usec);
> -	if (flags & TEST_TRAILING_IDLE)
> -		xe_for_each_engine_class(class)
> -			spin_sync_end(fd, ctx[class]);
> +	xe_for_each_engine_class(class)
> +		spin_sync_end(fd, ctx[class]);
>   	read_engine_cycles(fd, pceu2);
>   
>   	xe_for_each_engine_class(class) {
> +		bool idle = hwe->engine_class == class;
> +
>   		if (!ctx[class])
>   			continue;
>   
> -		check_results(pceu1, pceu2, class,
> -			      hwe->engine_class == class ? 0 : flags);
> +		check_results(pceu1, pceu2, class, idle ? 0 : TEST_BUSY);
>   		spin_sync_end(fd, ctx[class]);
>   		spin_ctx_destroy(fd, ctx[class]);
>   	}
> @@ -639,7 +637,7 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
>   }
>   
>   static void
> -all_busy_check_all(int fd, unsigned int flags)
> +all_busy_check_all(int fd)
>   {
>   	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>   	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> @@ -649,31 +647,28 @@ all_busy_check_all(int fd, unsigned int flags)
>   	int class;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> -	if (flags & TEST_BUSY) {
> -		/* spin on one hwe per class */
> -		xe_for_each_engine(fd, hwe) {
> -			class = hwe->engine_class;
>   
> -			if (ctx[class])
> -				continue;
> +	/* spin on one hwe per class */
> +	xe_for_each_engine(fd, hwe) {
> +		class = hwe->engine_class;
> +		if (ctx[class])
> +			continue;
>   
> -			ctx[class] = spin_ctx_init(fd, hwe, vm);
> -			spin_sync_start(fd, ctx[class]);
> -		}
> +		ctx[class] = spin_ctx_init(fd, hwe, vm);
> +		spin_sync_start(fd, ctx[class]);
>   	}
>   
>   	read_engine_cycles(fd, pceu1);
>   	usleep(batch_duration_usec);
> -	if (flags & TEST_TRAILING_IDLE)
> -		xe_for_each_engine_class(class)
> -			spin_sync_end(fd, ctx[class]);
> +	xe_for_each_engine_class(class)
> +		spin_sync_end(fd, ctx[class]);
>   	read_engine_cycles(fd, pceu2);
>   
>   	xe_for_each_engine_class(class) {
>   		if (!ctx[class])
>   			continue;
>   
> -		check_results(pceu1, pceu2, class, flags);
> +		check_results(pceu1, pceu2, class, TEST_BUSY);
>   		spin_sync_end(fd, ctx[class]);
>   		spin_ctx_destroy(fd, ctx[class]);
>   	}
> @@ -715,14 +710,14 @@ igt_main
>   
>   	igt_subtest("drm-busy-idle-check-all")
>   		xe_for_each_engine(xe, hwe)
> -			busy_check_all(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
> +			busy_check_all(xe, hwe);
>   
>   	igt_subtest("drm-most-busy-idle-check-all")
>   		xe_for_each_engine(xe, hwe)
> -			most_busy_check_all(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
> +			most_busy_check_all(xe, hwe);
>   
>   	igt_subtest("drm-all-busy-idle-check-all")
> -		all_busy_check_all(xe, TEST_BUSY | TEST_TRAILING_IDLE);
> +		all_busy_check_all(xe);
>   
>   	igt_subtest("drm-busy-exec-queue-destroy-idle")
>   		xe_for_each_engine(xe, hwe)
