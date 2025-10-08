Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B621CCA472
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 12:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2078210E7F8;
	Wed,  8 Oct 2025 12:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bClvWbyV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA7510E7F8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759926410; x=1791462410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zGT6xLhvXuE8sr+88h2mOsZXkVD9HLbji28EE0qTibU=;
 b=bClvWbyVsUIiuw8dK3Vfp3fD1LdpYFQvpfKFPClsVobaTt/0L8WeE3Ex
 WiCfOKKuHksV+mwwqd4NrLx7wFdcd+xJ+m+SfgH49YJYoLrvStjLRJck+
 ciigC8emvh57lO3G416Ni4jbdQwl5y3DybXRKxMkNOs/Jg7/YKAcxtVsb
 gDTRhkQWIkrfdOFtVNGhfAX45nUA5NJot0MAhziEIs+YcATEPsakGByak
 vHLRef9hzdUCd3Al2mWPAEe243zAHlOtBaP3rJWfj04CVF5Etfl9rtbwF
 ybdN797JMbtUzBtBpsIPquvu9u4jUUZoooPsDIjbweYh6VECB0SLdLN5w A==;
X-CSE-ConnectionGUID: x0I8yQtJTNWHkc/KyEQIPQ==
X-CSE-MsgGUID: J/9pFzI9TZePYXn/gwyT+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73218864"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="73218864"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 05:26:50 -0700
X-CSE-ConnectionGUID: if5xPBnRT8Knq1KXMZ4TJQ==
X-CSE-MsgGUID: oEHFa4aoRgWQp6P6PJLysg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180370324"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.63])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 05:26:36 -0700
Date: Wed, 8 Oct 2025 15:26:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com,
 zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t v4 1/1] tests/kms_concurrent: Add SYSVIPC support
 check
Message-ID: <aOZYebB0Q9hYC7UT@intel.com>
References: <20251008054812.545177-1-s.sebinraj@intel.com>
 <20251008054812.545177-2-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008054812.545177-2-s.sebinraj@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Oct 08, 2025 at 11:18:12AM +0530, S Sebinraj wrote:
> Check for System V IPC support in kms_concurrent test to handle
> targets that don't have SYSVIPC enabled in their kernel. Without this
> check, the test would fail with assertion errors when trying to use
> message queues.
> 
> The implementation checks if the target supports IPC,
> if not found it skips the test.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  lib/intel_allocator.c  | 25 ++++++++++++++++++++++++-
>  lib/intel_allocator.h  | 10 +++++++++-
>  tests/kms_concurrent.c |  4 +++-
>  3 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index d22c70f1f..fef286e35 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -839,14 +839,21 @@ void __intel_allocator_multiprocess_start(void)
>   *
>   * Note. This destroys all previously created allocators and theirs content.
>   */
> -void intel_allocator_multiprocess_start(void)
> +bool intel_allocator_multiprocess_start(void)
>  {
>  	alloc_info("allocator multiprocess start\n");
>  
> +	if (!device_supports_sysvipc()) {
> +		igt_warn("Device does not support SYSVIPC, multiprocess not supported\n");
> +		return false;
> +	}
> +
>  	igt_assert_f(child_pid == -1,
>  		     "Allocator thread can be spawned only in main IGT process\n");
>  	__intel_allocator_multiprocess_prepare();
>  	__intel_allocator_multiprocess_start();
> +
> +	return true;
>  }
>  
>  /**
> @@ -879,6 +886,22 @@ void intel_allocator_multiprocess_stop(void)
>  	}
>  }
>  
> +/**
> + * Checks if the current device supports SYSVIPC by verifying the existence and accessibility
> + * of the /proc/sysvipc directory.
> + * Returns: true if accessible for read and write, false otherwise.
> + */
> +bool device_supports_sysvipc(void)

"device" makes me think of the drm device/gpu. "system" or something would
seem better. 

> +{
> +	char path[128] = {'\0'};
> +
> +	snprintf(path, sizeof(path), "/proc/sysvipc");

What? Just pass the string directly to access.

> +	if (access(path, R_OK | W_OK) == 0)
> +		return true;
> +
> +	return false;
> +}
> +
>  static void track_ahnd(int fd, uint64_t ahnd, uint32_t vm)
>  {
>  	struct ahnd_info *ainfo;
> diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
> index 4b6292f06..24ce6dbfa 100644
> --- a/lib/intel_allocator.h
> +++ b/lib/intel_allocator.h
> @@ -166,9 +166,17 @@ struct intel_allocator {
>  void intel_allocator_init(void);
>  void __intel_allocator_multiprocess_prepare(void);
>  void __intel_allocator_multiprocess_start(void);
> -void intel_allocator_multiprocess_start(void);
> +bool intel_allocator_multiprocess_start(void);
>  void intel_allocator_multiprocess_stop(void);
>  
> +/**
> + * device_supports_sysvipc:
> + *
> + * A function to check if the device supports IPC
> + * @return: true or false
> + * */
> +bool device_supports_sysvipc(void);
> +
>  uint64_t intel_allocator_open(int fd, uint32_t ctx, uint8_t allocator_type);
>  uint64_t intel_allocator_open_full(int fd, uint32_t ctx,
>  				   uint64_t start, uint64_t end,
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 4f16f8b89..ab9ae29a8 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -395,8 +395,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_require(data.display.is_atomic);
>  		igt_display_require_output(&data.display);
> +
>  		if (is_intel_device(data.drm_fd))
> -			intel_allocator_multiprocess_start();
> +			igt_require_f(!intel_allocator_multiprocess_start(),
> +							"Allocator failure, no SYSV IPC\n");
>  	}
>  
>  	run_tests_for_pipe(&data);
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
