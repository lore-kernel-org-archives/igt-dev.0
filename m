Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FB8D44D77
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 14:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5073D10E166;
	Wed,  6 Nov 2024 14:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ax1Y4vtn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD0110E166
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 14:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730902359; x=1762438359;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UbGbLw8uyxe3X7gE17tWAu4ztIt9DOMXJNlGhFxYYBs=;
 b=Ax1Y4vtneDnQML4a1ZfamNvthI6ebMb8NPAV0nlHRqAuP6YsVeLNZU+8
 wcQwwABgJyCNVv4bqSv5vlUMGFg/yYijsI7KplgeYLyB6ZZsn7cJRwRwW
 pY7d5n7cddzAsgdPQvTS5CmpIpeDIbxyS8MZZ5BVOXhD5rmLO8gZxcM2S
 D4Z/NnqmTN6A1aoaNVZLacXE9lTKCkV+NPFTD5RJc6psfPsf2XHITMXQg
 pVkUQmGOJuzfbDIDlXFnmOYijrrAhOgU406I9vmydAx4Cq5E1uJHxpdQi
 1/MzIDzIx0tK54fYK17qMvtfG33hdp5Q/8n88mVw9ZLXtTuKB19I98MlP w==;
X-CSE-ConnectionGUID: 7oWJvk29SdqQjmKSQdG/gg==
X-CSE-MsgGUID: 4EKJkynsSYWwoMYPtzMAjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48163723"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48163723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:12:39 -0800
X-CSE-ConnectionGUID: p1TGMVH9ThSneMXfYcAl2w==
X-CSE-MsgGUID: pfkdRB2kSomSUUU3raIl6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="89147889"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 06:12:36 -0800
Date: Wed, 6 Nov 2024 15:12:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v2 1/5] lib/igt_kms: Add a detect timeout value
Message-ID: <20241106141233.yeflz6kw65exbyyg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
 <20241022-b4-cv3-01-igt-kms-v2-1-8f654694b513@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-b4-cv3-01-igt-kms-v2-1-8f654694b513@bootlin.com>
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

Hi Louis,
On 2024-10-22 at 12:28:35 +0200, Louis Chauvet wrote:
> Some tests need to wait for a specific connector status. In order to make
> the timeout customisable for each target, add an option in the
> configuration file.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_core.c |  3 +++
>  lib/igt_kms.c  | 24 ++++++++++++++++++++++++
>  lib/igt_kms.h  |  9 +++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 407f7b55187c..5f75141cc42e 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -265,6 +265,9 @@
>   *	&num; It is not mandatory and allows overriding default values.
>   *	[DUT]
>   *	SuspendResumeDelay=10
> + *	&num; The following option define the timeout for detection feature
> + *	&num; (waiting for a connector status)
> + *	DetectTimeout=10.0

You named it generic, could you keep it in igt_core?
Or name it DisplayDetectTimeout?

>   * ]|
>   *
>   * Some specific configuration options may be used by specific parts of IGT,
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index bb35d4b82c5a..195868646a14 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -58,6 +58,7 @@
>  #include "intel_chipset.h"
>  #include "igt_debugfs.h"
>  #include "igt_device.h"
> +#include "igt_rc.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
>  #ifdef HAVE_CHAMELIUM
> @@ -7119,3 +7120,26 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output)
>  	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
>  	drmModeFreeConnector(temp);
>  }
> +
> +/**
> + * igt_default_detect_timeout - Get the default timeout value for detection feature
> + *
> + * Some tests requires to wait for a specific connector status. This value will determine the
> + * timeout value for this waiting.
> + */
> +float igt_default_detect_timeout(void)
> +{
> +	static double timeout = 0.0;
> +	static bool first_call = true;
> +
> +	if (first_call) {
> +		if (igt_key_file)
> +			timeout = g_key_file_get_double(igt_key_file, "DUT", "DetectTimeout", NULL);

There could be errors here, please handle them.

Regards,
Kamil

> +		else
> +			timeout = DEFAULT_DETECT_TIMEOUT;
> +
> +		first_call = false;
> +	}
> +
> +	return timeout;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 2b26d2bbfff1..4f0030264d9f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -39,6 +39,13 @@
>  #include "igt_fb.h"
>  #include "ioctl_wrappers.h"
>  
> +/**
> + * define DEFAULT_DETECT_TIMEOUT - Default timeout used for some detection functions
> + *
> + * It can be overiden by option DetectTimeout in the .igtrc file.
> + */
> +#define DEFAULT_DETECT_TIMEOUT 10.0
> +
>  /* Low-level helpers with kmstest_ prefix */
>  
>  /**
> @@ -1254,4 +1261,6 @@ int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
>  int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
>  void igt_reset_link_params(int drm_fd, igt_output_t *output);
>  
> +float igt_default_detect_timeout(void);
> +
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.46.2
> 
