Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FCCC52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 07:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D8989D39;
	Tue, 27 Aug 2024 07:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXRMjRWS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F7710E1C7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724745114; x=1756281114;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P2zN4wqfZDkmrC8W9xJWmQlltHofpOG2b+Ki+lneVRg=;
 b=VXRMjRWSz1dIA3R8R6XRkVlWDyELlPOOwolV38WxSkRS3UisWxHmAZE6
 ApvrXIu074XYhyCXqxZXzTGp5ruvz/JOY/ShNI0kkswbkv5TA3tm0xNIQ
 IllEBA+D6OJHiPDycNnvaRPV0rLlgB++QdpTV9Xws6oEXQhJFcvpKAFX4
 +FWhm3oI3BhdfvVT/cFM/brGYNIB+wzadAE7j5hFZrlE/DMLCVOD+N6IK
 aq26d4vFT3ngb2qQ3LXq2JhzAOOF4VvA36qR0gmudL3R+UDbwLwcnJttU
 17dpouNEnvBUis7kWAu4l7xLtVUyxPmb/n8iQ7mHMUKgtn6/qgG9U0CfQ Q==;
X-CSE-ConnectionGUID: 1r9uwVDaTWa8UWwYNCBZ3A==
X-CSE-MsgGUID: QFlGWXL7Tlyak1GTMPE8Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33865409"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="33865409"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 00:51:54 -0700
X-CSE-ConnectionGUID: KqRMBdDPQzma3jCMJj+SVg==
X-CSE-MsgGUID: QZNabV8xREGCuPFQPOu9AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="63099863"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 00:51:52 -0700
Date: Tue, 27 Aug 2024 09:51:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, ihf@google.com,
 markyacoub@google.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t v2 01/39] lib/igt_kms: Add a detect timeout value
Message-ID: <20240827075148.uc35w6ydfjer6k72@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>, ihf@google.com,
 markyacoub@google.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
 <20240709-dev-remove-static-ports-v2-1-5adfc6985778@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709-dev-remove-static-ports-v2-1-5adfc6985778@bootlin.com>
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
On 2024-07-09 at 17:34:17 +0200, Louis Chauvet wrote:
> Some tests need to wait for a specific connector status. In order to make
> the timeout customisable for each target, add an option in the
> configuration file.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Could you split this series into smaller chunks for easier review?
+cc Vignesh

I also spotted one file with GPL licence, in IGT it should have
MIT or at least 'GPL or MIT'

This particular patch LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Btw for patches which touch KMS libs please add few
other kms developers, for example Bhanu and Juha-Pekka:

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Regards,
Kamil

> ---
>  lib/igt_core.c |  3 +++
>  lib/igt_kms.c  | 24 ++++++++++++++++++++++++
>  lib/igt_kms.h  |  9 +++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ff3e0392316..5f5adb553629 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -260,6 +260,9 @@
>   *	&num; It is not mandatory and allows overriding default values.
>   *	[DUT]
>   *	SuspendResumeDelay=10
> + *	&num; The following option define the timeout for detection feature
> + *	&num; (waiting for a connector status)
> + *	DetectTimeout=10.0
>   * ]|
>   *
>   * Some specific configuration options may be used by specific parts of IGT,
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 64318ef7fb15..4877da4c6c9d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -57,6 +57,7 @@
>  #include "intel_chipset.h"
>  #include "igt_debugfs.h"
>  #include "igt_device.h"
> +#include "igt_rc.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
>  #ifdef HAVE_CHAMELIUM
> @@ -6662,3 +6663,26 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
>  
>  	return num_scalers;
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
> +		else
> +			timeout = DEFAULT_DETECT_TIMEOUT;
> +
> +		first_call = false;
> +	}
> +
> +	return timeout;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 501d48763fb6..f89e1be86b30 100644
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
> @@ -1224,4 +1231,6 @@ bool igt_check_output_is_dp_mst(igt_output_t *output);
>  int igt_get_dp_mst_connector_id(igt_output_t *output);
>  int get_num_scalers(int drm_fd, enum pipe pipe);
>  
> +float igt_default_detect_timeout(void);
> +
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.44.2
> 
