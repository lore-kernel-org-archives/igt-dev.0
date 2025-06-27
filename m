Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ED2C7EE2A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 16:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA1E10EA6A;
	Fri, 27 Jun 2025 16:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxVgsU91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133A110EA6A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751041159; x=1782577159;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z7gmaIWJG/fHEfV3W+JNhdFrxsix0HD2WxjRpkSxZDQ=;
 b=CxVgsU91OxNAitZ7hFLjiBG5x4A/aT5OtRT8K2+KvMUZ8IbTZoZNEjxO
 vF8ziqoEO40OZkr1Ei4Ooh/qB7oNGS4O2WbjKn7hfGynyld1ym4WJ887y
 zjyjyU51Lm07E7bdy9AIRGW6Lg8YoLgiSxCfOI3GyyfnfnfBmvRoud92w
 srsKqdSy/76u9oylzh1HPOut4PqryXGhkwYjkesOkDNH5oXXcIZChy2NG
 KYkXIIx0DG9UBZiyvJ6d7UH+Zl9QZFG91gKVnmuXXIVcM4zSMjl24QDiY
 CYuLDjYzvLQgCpKzsp5wF659oWGdFOe9X9AqzuH0uSANbkCKm31L+dobo Q==;
X-CSE-ConnectionGUID: 2vxUmAhQQWal3uRQn9DisQ==
X-CSE-MsgGUID: o3n0mTuXTeyRG5NFwz1Pjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53300592"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53300592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:19:19 -0700
X-CSE-ConnectionGUID: Swx4l6RHQEGKkPlOzhbmvg==
X-CSE-MsgGUID: hW/mE1upQ821rr+RHDdQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="183881708"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:19:17 -0700
Date: Fri, 27 Jun 2025 18:19:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
Subject: Re: [v4,2/7] lib/i915/intel_fbc: Add fbc supported check based on wa
Message-ID: <aF7Eg90UHe2h857y@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
References: <20250627060446.29615-3-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627060446.29615-3-mohammed.thasleem@intel.com>
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

On 2025-06-27 at 11:34:41 +0530, Mohammed Thasleem wrote:
> This will check the fbc supported based on given workarunds.
> 
> v2: Add intel_wa header file.
> v3: Add xe check. (Kamil)
> v4: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)

Please see comments below.

> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/i915/intel_fbc.c | 25 +++++++++++++++++++++++++
>  lib/i915/intel_fbc.h |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index a8ded0a59..722899432 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -9,6 +9,7 @@
>  #include "igt_psr.h"
>  
>  #include "intel_fbc.h"
> +#include "intel_wa.h"
>  
>  #define FBC_STATUS_BUF_LEN 128
>  
> @@ -200,3 +201,27 @@ bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode)
>  
>  	return fbc_supported;
>  }
> +
> +/**
> + * intel_is_fbc_disabled_by_wa
> + *
> + * @fd: fd of the device
> + *
> + * This function pass the WA to igt_has_intel_wa to check WA on available GTs

imho this should be:

 * This function check if WA is present on some GT, which in turn make
 * FBC not possible

> + *
> + * Returns:
> + * true if wa is not equal to 1, and false if wa is equal to 1

imho this should be reversed, also each return value in its own line,
so better:

 * true:  if WA is applied and FBC id disabled
 * false: otherwise

> + * true if wa is not equal to 1, and false if wa is equal to 1

Also, please do not translate C source code into english.

> + */
> +bool intel_is_fbc_disabled_by_wa(int fd)
> +{
> +	int wa;
> +	const char *wa_fbc_disabled = "16023588340";
> +
> +	if (!is_xe_device(fd))
> +		return true;

Should be:

		return false;

> +
> +	wa = igt_has_intel_wa(fd, wa_fbc_disabled);
> +	igt_assert_f(wa >= 0, "WA path not found on GTs\n");

Do you really need this assert here?

> +
> +	return wa != 1;

Should be:

	return wa == 1;

Update also caller sites into:

igt_skip_on_f(data.feature == FEATURE_FBC && intel_is_fbc_disabled_by_wa(data.drm_fd),
	      "WA has disabled FBC on BMG\n");

Also align to first char after '('.

Regards,
Kamil

> +}
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index fcafe6049..fe9edcbc3 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -19,5 +19,6 @@ bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
>  void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height);
>  bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
>  bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode);
> +bool intel_is_fbc_disabled_by_wa(int fd);
>  
>  #endif
