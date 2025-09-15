Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D159DCAC597
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 12:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749B210E46E;
	Mon, 15 Sep 2025 12:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbSXeAuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9FA10E46E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757938470; x=1789474470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VFFXyMofLzoBrjGOXO+76Z4SDSHQVUHBJZ8SrRYQzvQ=;
 b=BbSXeAuPfbeETEli4/ws6Ah1/QWMXeGX+dcS6YNyrYqoPvNAMkL6LROb
 IKhJE7JFnEsIhYo2kBQG6AT3AqVa2u4zBweINpLV2HlYUcluIPpCj6i3F
 9RLauVrXonpinFaRK2VhNTC0nHivynF5rfHCliKxJcQgJJcfCcCFhseau
 AiM9+SpxxghEW8Or+kNc6OWtVv7ARVDjZ66dHZd6ssQVQXYsq2R/qWgjq
 lfziNepwI5EM3uJLsbgwiJa7vwdd+f/qYrpGpHZFMVOclJCJsTUS9zIz3
 qyBY/+xE3UA2MtLTLVTsQc2CcsI6KuFnpU7c1pSCzB8dBPtbcYtO7/gHy A==;
X-CSE-ConnectionGUID: y2W5ZM1ySMCS/BXCWZNxMQ==
X-CSE-MsgGUID: 5Wrr+l6SQJGNp/k0lS2cXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="82777120"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="82777120"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:14:30 -0700
X-CSE-ConnectionGUID: iXVdSC2sQ9KSp0UrR4nWTQ==
X-CSE-MsgGUID: xrBC4b8ARLyh4IVe8AxIUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="205582197"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:14:28 -0700
Date: Mon, 15 Sep 2025 14:14:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com
Subject: Re: [PATCH i-g-t] tests/kms_concurrent: Add SYSVIPC support check
Message-ID: <20250915121425.iunhf3bqmffpw62g@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com
References: <20250908084631.2676274-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908084631.2676274-1-s.sebinraj@intel.com>
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

Hi S,
On 2025-09-08 at 14:16:31 +0530, S Sebinraj wrote:
> Check for System V IPC support in kms_concurrent test to handle
> targets that don't have SYSVIPC enabled in their kernel. Without this
> check, the test would fail with assertion errors when trying to use
> message queues.
> 
> The implementation checks if the target supports IPC,
> if not found it skips the test.

On what GPU/GPUs and board/s do you see this errors?
Depending on your answer, maybe a better solution would be
to turn off that part in igt_core and make a test running?

Please also give an example error log.

> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  lib/igt_core.h         |  2 ++
>  tests/kms_concurrent.c | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 6f462205f..413e83bc8 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -45,6 +45,8 @@
>  #include <getopt.h>
>  #include <unistd.h>
>  
> +bool device_supports_sysvipc(void);
> +

Move this below all #include

Regards,
Kamil

>  #ifdef __FreeBSD__
>  #include "igt_freebsd.h"
>  #endif
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 4f16f8b89..80512a140 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -107,6 +107,22 @@ static void test_fini(data_t *data, enum pipe pipe, int n_planes,
>  	data->fb = NULL;
>  }
>  
> +/**
> + * Checks if the current device supports SYSVIPC by verifying the existence and accessibility
> + * of the /proc/sysvipc directory.
> + * Returns: true if accessible for read and write, false otherwise.
> + */
> +bool device_supports_sysvipc(void)
> +{
> +	char path[128] = {'\0'};
> +
> +	snprintf(path, sizeof(path), "/proc/sysvipc");
> +	if (access(path, R_OK | W_OK) == 0)
> +		return true;
> +
> +	return false;
> +}
> +
>  static void
>  create_fb_for_mode_position(data_t *data, drmModeModeInfo *mode,
>  			    int *rect_x, int *rect_y,
> @@ -395,6 +411,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_require(data.display.is_atomic);
>  		igt_display_require_output(&data.display);
> +		igt_require(device_supports_sysvipc());
> +
>  		if (is_intel_device(data.drm_fd))
>  			intel_allocator_multiprocess_start();
>  	}
> -- 
> 2.34.1
> 
