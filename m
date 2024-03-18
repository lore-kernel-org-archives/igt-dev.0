Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B14C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 09:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA9A10EF02;
	Mon, 18 Mar 2024 09:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVX33IVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDEB10F26A
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710755744; x=1742291744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uoqL8ltdeKbYKlOq0vtvstzfRBBYUo32dsyMCN+1IHE=;
 b=dVX33IVN703Mnf8eMVa259Cp+c3P+nIp7HA9obeMHODwcxSHc2HShOn1
 Fckk9RCmICjOKkG5myFYUVJpW5EMg2ascKsg2vFBceQpCvBc+4Qg9X33P
 yIsmaN9O2qU9SGCWcTwSzpSdDbwXX1U2zuSQU8GEdQrq3n4b1LzE0++Ru
 C/B5jWqXJCV/lvkP3Qae79iGgxWiUpEuaMKJ8zpZEH+YVa3PUJyStbIJy
 pEzyWMo5nL6HVkB5Hq56gqPHoNvoV8JAVNzfC96/kmsJWThOD6oEZHfFM
 T4/NJfawjVRZHYZljtVZt/zfv/8vGl+LzIq3PyRy43UwICq19uXHp7EhT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5418120"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5418120"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:55:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13454124"
Received: from unknown (HELO localhost) ([10.245.246.218])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:55:42 -0700
Date: Mon, 18 Mar 2024 10:55:37 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: Re: [PATCH i-g-t] lib/intel_compute: Do not assume engine class
Message-ID: <20240318095537.eivmsosxvp7t7ea6@zkempczy-mobl2>
References: <20240314213748.6323-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314213748.6323-1-nirmoy.das@intel.com>
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

On Thu, Mar 14, 2024 at 10:37:48PM +0100, Nirmoy Das wrote:
> Let the test decide what engine class to use instead of
> a lib function deciding it for tests.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  lib/intel_compute.c      | 20 +++-----------------
>  tests/intel/xe_compute.c | 21 ++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 9d3b97efe..c96e60027 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -81,24 +81,10 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
>  	execenv->driver = get_intel_driver(fd);
>  
>  	if (execenv->driver == INTEL_DRIVER_XE) {
> +		igt_fail_on(eci == NULL);
>  		execenv->vm = xe_vm_create(fd, 0, 0);
> -
> -		if (eci) {
> -			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
> -								   eci, 0);
> -		} else {
> -			uint16_t engine_class;
> -			uint32_t devid = intel_get_drm_devid(fd);
> -			const struct intel_device_info *info = intel_get_device_info(devid);
> -
> -			if (info->graphics_ver >= 12 && info->graphics_rel < 60)
> -				engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> -			else
> -				engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
> -
> -			execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
> -									 engine_class);
> -		}
> +		execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm, eci,
> +							   0);
>  	}
>  }
>  

I don't like this. You're moving logic which is common for compute
users outside, giving possibility to pass invalid queue. I vote
to not merge this.

--
Zbigniew

> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 42f42ca0c..cb98b00d5 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -163,9 +163,28 @@ test_compute_kernel_with_ccs_mode(int num_gt)
>  static void
>  test_compute_square(int fd)
>  {
> -	igt_require_f(run_intel_compute_kernel(fd), "GPU not supported\n");
> +	struct drm_xe_engine_class_instance *hwe;
> +	const struct intel_device_info *info;
> +	uint16_t engine_class;
> +	uint32_t devid = intel_get_drm_devid(fd);
> +
> +	info = intel_get_device_info(devid);
> +
> +	if (info->graphics_ver >= 12 && info->graphics_rel < 60)
> +		engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> +	else
> +		engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != engine_class)
> +			continue;
> +
> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe),
> +			      "GPU not supported\n");
> +	}
>  }
>  
> +
>  igt_main
>  {
>  	int xe, num_gt;
> -- 
> 2.42.0
> 
