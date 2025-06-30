Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A238C83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 16:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1454910E11D;
	Mon, 30 Jun 2025 16:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzaaV3hO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A5D10E11D
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751301540; x=1782837540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NryewXPab6MqS6MhIrk98nfjR5zvGu0Pk2+9eF4OIOI=;
 b=fzaaV3hOh0ACwnLyuCfoYV5YnK+qsLRI+Tiw1RqRWtcEN7xvK03yxOpI
 b1lYYBjo5V0B5M0gAeFXL/B4LDbiZHbBgMpfaXbjnIq1Wh1W5f4aOhRfF
 7qci3HxPx7DmYerddvX2CAnwy1aPAgo+eGb7Wx/RPDta63dku1hvYnp+r
 Yv9KFl0WWphNCwoVCZA2lIIzCGVe9B2UOAcN4Own5Zi4HjBbFTGi+j5OC
 y5DhEHKPuX2UkZOKCEkIvDcJmDAtyTn6fymGsvJfB5isuLHT7MpZvtlQr
 6qFTYFm1oLiWDTxYZKoMdgXtktws3RzToyJjrKXgt1XxsKEMECuwmI0CD w==;
X-CSE-ConnectionGUID: ZjnJgXhHR3Opbd9hxI7vOw==
X-CSE-MsgGUID: EvlPG45hREC+NARTQ38HUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53472601"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="53472601"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:38:59 -0700
X-CSE-ConnectionGUID: cbMy5Fe3T8yprhtntUMKBg==
X-CSE-MsgGUID: SKGh6EauSFWeNimCmTwctw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="153143400"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 09:38:58 -0700
Date: Mon, 30 Jun 2025 18:38:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
Subject: Re: [PATCH v5 2/7] lib/i915/intel_fbc: Add fbc supported check based
 on wa
Message-ID: <20250630163856.btzqsjkluqagean5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
References: <20250630134145.836-1-mohammed.thasleem@intel.com>
 <20250630134145.836-3-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630134145.836-3-mohammed.thasleem@intel.com>
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

Hi Mohammed,
On 2025-06-30 at 19:11:40 +0530, Mohammed Thasleem wrote:
> This will check the fbc supported based on given workarunds.
> 
> v2: Add intel_wa header file.
> v3: Add xe check. (Kamil)
> v4: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)
> v5: Updated function discription and return logic. (Kamil)
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/i915/intel_fbc.c | 27 +++++++++++++++++++++++++++
>  lib/i915/intel_fbc.h |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index a8ded0a59..a1a6de90e 100644
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
> @@ -200,3 +201,29 @@ bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode)
>  
>  	return fbc_supported;
>  }
> +
> +/**
> + * intel_is_fbc_disabled_by_wa
> + *
> + * @fd: fd of the device
> + *
> + * This function check if WA is present on some GT, which in turn make
> + * FBC not possible
> + *
> + * Returns:
> + * true: if WA is applied and FBC id disabled
> + * false: otherwise
> + */
> +bool intel_is_fbc_disabled_by_wa(int fd)
> +{
> +	int wa;
> +	const char *wa_fbc_disabled = "16023588340";
> +
> +	if (!is_xe_device(fd))
> +		return false;
> +
> +	wa = igt_has_intel_wa(fd, wa_fbc_disabled);
> +	igt_assert_f(wa >= 0, "WA path not found on GTs\n");
> +
> +	return wa == 1;
> +}

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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
> -- 
> 2.25.1
> 
