Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AC7E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 19:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A82910E030;
	Thu, 19 Dec 2024 19:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnfMBVcL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1778B10E292
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734635557; x=1766171557;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YB+1qk6bkygp+2p/rIytBA9igl5JY6bI47BxXfFVxMo=;
 b=WnfMBVcLIiJY+a2K/n05EXJzX/PvLU4lS83CFuHNRo95UX94cXpPs1nx
 f1Bv3QRIi9ItNXRvfkc8TivcQB3dRSkR042AmhHYCxq3+AXGEzQWfQVtw
 5VoY6W/yQDZ78hSeYerWHXaKWMsQx2476ElF9kFneyIdeyZhlrYGqDtUq
 OYsB6HmaoGx13V9ic5ix/fE5xZDDalc/MysA2ojs56lo9wTRo0VaAOXys
 0rD9nAue5Usl9F+a1YbIo6fUtP21zH34QJ+ZOWXSoRdMl89a9WD2qt8S2
 CKT7dmto9kXzXoX2Q+gsMFSz3DOVm3tzFfG5B/LQO4NwBu1oEiBilZrqP Q==;
X-CSE-ConnectionGUID: YDw50u1MRoy5ukBlecQZYA==
X-CSE-MsgGUID: 0hQrMQr5QdyPedbOe8P9Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46548497"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="46548497"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 11:12:37 -0800
X-CSE-ConnectionGUID: s5U0neAaSpGrDZhOOLiDcg==
X-CSE-MsgGUID: Pb0oGe31TV6uKDTh27YZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129252301"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 11:12:33 -0800
Date: Thu, 19 Dec 2024 20:12:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@igmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com,
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v3 1/5] lib/igt_kms: Add a detect timeout value
Message-ID: <20241219191231.loqlfntlzlj7knqc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@igmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com,
 Swati Sharma <swati2.sharma@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
 <20241122-b4-cv3-01-igt-kms-v3-1-c5ced6976e11@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-b4-cv3-01-igt-kms-v3-1-c5ced6976e11@bootlin.com>
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
On 2024-11-22 at 16:19:04 +0100, Louis Chauvet wrote:

sorry for late response.

> Some tests need to wait for a specific connector status. In order to make
> the timeout customisable for each target, add an option in the
> configuration file.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

I changed Bhanu address to: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Also +cc Swati and Khartik
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>

> ---
>  lib/igt_core.c |  3 +++
>  lib/igt_kms.c  | 33 +++++++++++++++++++++++++++++++++
>  lib/igt_kms.h  |  9 +++++++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 407f7b55187ceac4cbc0645c629a7fbb17f89575..22d80a1497a9faca85def70d688427cd7d553d60 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -265,6 +265,9 @@
>   *	&num; It is not mandatory and allows overriding default values.
>   *	[DUT]
>   *	SuspendResumeDelay=10

Add newline here to separate this:

    *

> + *	&num; The following option define the timeout for detection feature
> + *	&num; (waiting for a connector status)
> + *	DisplayDetectTimeout=10.0
>   * ]|
>   *
>   * Some specific configuration options may be used by specific parts of IGT,
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5d8096a17596ca592a274800140804edec6d7422..0b76a47eb2135cca21881d97c2fd78e724d9a30e 100644
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
> @@ -7185,3 +7186,35 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>  
>  	return 0;
>  }
> +
> +/**
> + * igt_default_detect_timeout:
> + *
> + * Get the default timeout value for detection feature
> + *
> + * Some tests requires to wait for a specific connector status. This value will determine the
> + * timeout value for this waiting.
> + */
> +float igt_default_detect_timeout(void)

Please rename to igt_default_display_detect_timeout(void)

Why not returning double?

> +{
> +	static double timeout = 0.0;
> +	static bool first_call = true;
> +	GError *error = NULL;
> +
> +	if (first_call) {
> +		if (igt_key_file) {
> +			timeout = g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTimeout", &error);
> +			if (error) {
> +				igt_warn("Failed to read DisplayDetectTimeout, defaulting to %f\n", DEFAULT_DETECT_TIMEOUT);

Why warn? Is this mandatory?

> +				g_clear_error(&error);
> +				timeout = DEFAULT_DETECT_TIMEOUT;
> +			}
> +		} else {
> +			timeout = DEFAULT_DETECT_TIMEOUT;
> +		}
> +
> +		first_call = false;
> +	}
> +
> +	return timeout;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index bd154d1c19e9f36ec61f29d953df149b0642465d..3509283b6da5b3fdbd70ebdc9bdd241326bc5073 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -40,6 +40,13 @@
>  #include "igt_fb.h"
>  #include "ioctl_wrappers.h"
>  
> +/**
> + * define DEFAULT_DETECT_TIMEOUT - Default timeout used for some detection functions

Please add also quontities used, I guess it is seconds but write
it down.

> + *
> + * It can be overiden by option DetectTimeout in the .igtrc file.
> + */
> +#define DEFAULT_DETECT_TIMEOUT 10.0

Is it ok to have 10 seconds as a default?
Overall looks good.

Regards,
Kamil

> +
>  /* Low-level helpers with kmstest_ prefix */
>  
>  /**
> @@ -1266,4 +1273,6 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output);
>  int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>  int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>  
> +float igt_default_detect_timeout(void);
> +
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.47.0
> 
