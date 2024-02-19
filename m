Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B73AC48BF8
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 11:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED50F10E29C;
	Mon, 19 Feb 2024 11:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTRN4MTZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A29510E29C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708342273; x=1739878273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mhGqz1cDYke6bzjAqgYcnGWj0goCk8I5rdGzrINJW3k=;
 b=LTRN4MTZQJ+9CZtU7uuNCaky0kgwqJi9hmxD1asgYuJNbYC3yZ2OcT0S
 WCWdmih3/ZderhS991MOEP1e3KQjU2Naa9ZdgWgrj5FJFWWUz5FPcbaYW
 fSDZt5sUF3sUDdSqKRCC6EsegzPWi2emCa8gunTAc7N1sFvZzHrwBtQC2
 OlP70jL1Sj40wcJekCr6lbbE7SpoF+03RNutAhd6jTX+6N4SgzzpUyxqh
 stUh5ckjQrgOmv6F8uA6ArdgkGp7W5B1T6d3q7fjhgfiC/ZJDvn4BV4Ng
 KfXhtyqLxCwXuFNXDCgHrYT3sMawZtxGcFMSsiB9g/wuJq/G3MF2O7PHy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2560046"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2560046"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4431953"
Received: from unknown (HELO localhost) ([10.246.5.157])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:29:08 -0800
Date: Mon, 19 Feb 2024 12:29:04 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Dominik Karol =?utf-8?B?UGnvv71+RXRrb2tp?=
 <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t v9 7/7] tests/intel/gem_exec_gttfill: simplify
 multiGPU subtest
Message-ID: <20240219112904.lt7h4h4wtmojypca@zkempczy-mobl2>
References: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
 <20240215161014.60304-8-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215161014.60304-8-kamil.konieczny@linux.intel.com>
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

On Thu, Feb 15, 2024 at 05:10:14PM +0100, Kamil Konieczny wrote:
> Simplify multi-GPU subtest with the help of new multigpu library.
> 
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Cc: "Dominik Karol Pi�~Etkoki" <dominik.karol.piatkowski@intel.com>

Sth weird with encoding happened above.

> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_exec_gttfill.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
> index 28c251915..f99ee54ef 100644
> --- a/tests/intel/gem_exec_gttfill.c
> +++ b/tests/intel/gem_exec_gttfill.c
> @@ -24,8 +24,8 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> -#include "igt_device_scan.h"
>  #include "igt_rand.h"
> +#include "intel_multigpu.h"
>  /**
>   * TEST: gem exec gttfill
>   * Description: Fill the GTT with batches.
> @@ -262,7 +262,7 @@ igt_main
>  {
>  	const struct intel_execution_engine2 *e;
>  	const intel_ctx_t *ctx;
> -	int i915 = -1, gpu_count;
> +	int i915 = -1;
>  
>  	igt_fixture {
>  		i915 = drm_open_driver(DRIVER_INTEL);
> @@ -296,17 +296,12 @@ igt_main
>  	igt_fixture {
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(i915, ctx);
> -		// prepare multigpu tests
> -		gpu_count = igt_device_filter_count();
>  	}
>  
>  	igt_subtest("multigpu-basic") { /* run on two or more discrete cards */
> -		igt_require(gpu_count > 1);
> -		igt_multi_fork(child, gpu_count) {
> -			int g_fd;
> +		gem_require_multigpu(2);
> +		igt_multi_fork_foreach_gpu(g_fd, DRIVER_INTEL) {
>  			// prepare
> -			g_fd = __drm_open_driver_another(child, DRIVER_INTEL);
> -			igt_assert(g_fd >= 0);
>  			ctx = intel_ctx_create_all_physical(g_fd);
>  			igt_fork_hang_detector(g_fd);
>  			// subtest
> @@ -314,7 +309,6 @@ igt_main
>  			// release resources
>  			igt_stop_hang_detector();
>  			intel_ctx_destroy(g_fd, ctx);
> -			drm_close_driver(g_fd);
>  		}
>  
>  		igt_waitchildren();
> -- 
> 2.42.0
> 

Looks good to me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
