Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DF7CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 08:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAF410E65B;
	Tue,  9 Sep 2025 08:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8Cab1Z+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850AE10E65B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 08:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757407366; x=1788943366;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pqC/DkjOIca1mhMCTO9TjGhwO9vRexUhf50+dA3BsSs=;
 b=L8Cab1Z+i+7eU+x6lh4qh9MnT1Ep/mObwCd6kdoX+LcSv/AOPoUqAxFX
 OVz0FBR4bYg2wxKmeQiiTAPfTfYpZhW26bicuUmOUC7MEy4THZJ1CNmxa
 gvQbo0tIPujqInFkzh2YT+2X3eW7XWgd+N8XAgGKMcpQevxNZnIsO873t
 2uG91ebF/EVT9aXFpC2YhyvmTkPiAT8SAAE98NoAPBfxb6hvDO4Z84B7H
 gtzdl6K8KdsgqpsVzqzfgLIpQQwRd6H8naYtDQCw7o92FkzeZoKZUivBf
 u/vFA4ZxC1UH4RSxTFaYelYpw5JdkkiO7Con3xyCOkGJgIXDe3/3IZ86c A==;
X-CSE-ConnectionGUID: V7tvvtM3QlyVmP5MLeNKtA==
X-CSE-MsgGUID: lUey9mm/QiW8KH2UN1xmFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59749038"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59749038"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:42:46 -0700
X-CSE-ConnectionGUID: 3vnl8cHnSrOecCLW14H5Fw==
X-CSE-MsgGUID: TCdOYogzSF2oigy+LzpvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="172191970"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:42:44 -0700
Date: Tue, 9 Sep 2025 10:42:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_concurrent: Add SYSVIPC support check
Message-ID: <20250909084241.kowpxt55wwicrp6n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250908084631.2676274-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Please use cover letter and give an example of such error
or give a link to bug report. On which systems you observe
this? I am afraid that almost none of tests will run
without it (maybe some core_ will do).

> 
> The implementation checks if the target supports IPC,
> if not found it skips the test.
> 

+cc Zbigniew
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

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

Please add this after all includes, not here.

Regards,
Kamil

> +
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
