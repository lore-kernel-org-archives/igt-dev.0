Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB99C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 06:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7ACB10E0D0;
	Wed, 14 Aug 2024 06:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGAm7awl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C707210E0D0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723618347; x=1755154347;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8VvUvebfICn7aADMR968ow4Qw6G41uDR8lB4H+OgBhc=;
 b=iGAm7awlaxGZ+0GPuAcuTMnhVQIAeWbMs9Fss+vTFCEFm/3ML0uiGWi5
 X7SfnuoBu1BJcSrGnyAyXX1LLIxOtEtR+JkJZuEjWHCR9QVCoDHT4PZNH
 Q6jXJRdK0H9MM2JsU2t0qkOqj5PAOh4oIDM88JH0pVi34cvtgemt12IHm
 V2JUlIAPCroXF5E9YVJKiG0fo2sxgcDW6mGcdGrqLdreQJC2Wf/4Qc4/H
 FVnYiMyyAuHbSACc8Ot+AKNxO4MbTDWNsXQRS5W+cCtWaoEH+doeL2JYv
 q2JGSLJrf5tIHNmFmNNRuq05+YXvt3CnV131rIeTngnZgCTPSNXUOQ3EC w==;
X-CSE-ConnectionGUID: wtYHrIDuTB+rk+P7Kby/Rw==
X-CSE-MsgGUID: akc6LPlQT5ucPyRvmPk46Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21631053"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="21631053"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:52:26 -0700
X-CSE-ConnectionGUID: xJfZuizoSk2cGDajx8ZuKg==
X-CSE-MsgGUID: QvbYEf5PQQKmtxcimJNgOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="89724071"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.48])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:52:24 -0700
Date: Wed, 14 Aug 2024 08:52:20 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib/igt: Fix double include statement
Message-ID: <20240814065220.zeeyujc5jktfydbe@zkempczy-mobl2>
References: <20240812154139.54404-3-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240812154139.54404-3-krzysztof.niemiec@intel.com>
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

On Mon, Aug 12, 2024 at 05:41:41PM +0200, Krzysztof Niemiec wrote:
> igt_core.h is included two times in the igt.h header. Fix the header so
> that isn't the case anymore.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  lib/igt.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/lib/igt.h b/lib/igt.h
> index 7af3d10cb..58c39e098 100644
> --- a/lib/igt.h
> +++ b/lib/igt.h
> @@ -28,7 +28,6 @@
>  #include "i915_3d.h"
>  #include "igt_aux.h"
>  #include "igt_core.h"
> -#include "igt_core.h"
>  #include "igt_debugfs.h"
>  #include "igt_draw.h"
>  #include "igt_dummyload.h"
> -- 
> 2.34.1
>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
