Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB30FF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 07:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02D410E078;
	Tue, 28 Apr 2026 07:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJzC9/xj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECA210E303
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777360576; x=1808896576;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=A7Wo7ooiUYRLeA8OyEFgzdCXnu2b8Jh35q8v3KK3tU8=;
 b=hJzC9/xjfcxj5Brca8iDKFZ4Fa882HVEvfyWHoXyfnLi7zx5Ia8id266
 vA8vNrC6tqKiB4I3fjGlQ9MNp3UlkRuBOLQ3AuI1/sU12JaGR+VnpAG9L
 NNa5H3ylsAvNQeWkZf3FjGlsPYMAKMaxkRFyYSQd+kwuVz4jw/+4pzylR
 9rI57PRbkfp0sXaXkzratf9IjJM3VB/Gn/3GHTFHFvc3yrym1W2TQ6nP3
 sDlQikuEOfxMZ/KY2vrj8Wl/2GkfIiXNkQwKe0bbfyfsDDYv5Pl3zcgz0
 dngrFdgZv3x3copCeFs3fah+3G6RhATMUwJIK2DkhPPaaS4LH8enUXQ/W w==;
X-CSE-ConnectionGUID: cX1L7xpTQI27WYdGueGVzw==
X-CSE-MsgGUID: dwQcJ0g2TmGikKV61+O8hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89348074"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="89348074"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:16:16 -0700
X-CSE-ConnectionGUID: KC2GWuUCQvuMNgJZzddTsA==
X-CSE-MsgGUID: tn724rzYQbGq9S/8uQ5JNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="271998279"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:16:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>, Kory
 Maincent <kory.maincent@bootlin.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v1 01/25] lib/igt_kms: Add a detect timeout value
In-Reply-To: <20260428044644.257001-2-mohammed.bilal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
 <20260428044644.257001-2-mohammed.bilal@intel.com>
Date: Tue, 28 Apr 2026 10:16:11 +0300
Message-ID: <c816f3870779c3fa55e8658533cee63e2cf21ff7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 28 Apr 2026, Mohammed Bilal <mohammed.bilal@intel.com> wrote:
> +/**
> + * igt_default_display_detect_timeout:
> + *
> + * Get the default timeout value for detection feature
> + *
> + * Some tests requires to wait for a specific connector status. This value will determine the
> + * timeout value for this waiting.
> + */
> +double igt_default_display_detect_timeout(void)

What is the unit?

Why is it a double? Makes no sense to me.

Typically you'd make it seconds, and if that's not accurate enough, make
it milliseconds.

BR,
Jani.

> +{
> +        static double timeout = 0.0;
> +        static bool first_call = true;
> +        GError *error = NULL;
> +
> +        if (first_call) {
> +                if (igt_key_file) {
> +                        timeout = g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTimeout",&error);
> +                        if (error) {
> +                                igt_debug("Failed to read DisplayDetectTimeout, defaulting to %f\n",DEFAULT_DETECT_TIMEOUT);
> +                                g_clear_error(&error);
> +                                timeout = DEFAULT_DETECT_TIMEOUT;
> +                        }
> +                } else {
> +                        timeout = DEFAULT_DETECT_TIMEOUT;
> +                }
>  
> -	igt_skip_on_f(!n, "No CRTCs on device\n");
> +                first_call = false;
> +        }
>  
> -	return crtcs[rand() % n];
> +        return timeout;
>  }
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index fcbb6a5ad..b10df1d8d 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -40,6 +40,14 @@
>  #include "igt_fb.h"
>  #include "ioctl_wrappers.h"
>  
> +/**
> + * define DEFAULT_DETECT_TIMEOUT - Default timeout in second used for some screen detection
> + * functions
> + *
> + * It can be overiden by option DetectTimeout in the .igtrc file.
> + */
> +#define DEFAULT_DETECT_TIMEOUT 10.0
> +
>  /* Low-level helpers with kmstest_ prefix */
>  
>  /**
> @@ -1289,4 +1297,6 @@ void igt_get_and_wait_out_fence(igt_output_t *output);
>  
>  igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
>  
> +double igt_default_display_detect_timeout(void);
> +
>  #endif /* __IGT_KMS_H__ */

-- 
Jani Nikula, Intel
