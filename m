Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0184FE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 15:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9445E10E04F;
	Tue, 17 Dec 2024 15:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kd+eLtCA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CD910E04F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734448512; x=1765984512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sc1dNtoSGS7g0juIFHVjW0BrzTuZhjGJhIYF7kSKhQo=;
 b=Kd+eLtCA5jTZjgJrVcZIwt8+gUQV5veAe2wUb9QL8J+XySvrHXjonlCt
 /S/hwakSJtzKxBf1qG0bUUjqqOV7Y/7ulzmfKNMB4KJl/O2yobFuAR2HI
 rPsYKtHUc37QjiyXpLQvtAZhor6S2mbqv3M8gyFKiDMzoBnoDyj3fiNfl
 lV8xyyXaYPHM0n/yXXqtx2sxX+IPHTpcRui3H/LbwviOCtPndHlqWSHHd
 9WTw9pwfTUHm4tG/mhD5smGODbWQEtktESaJgy0ZtGfAIxX360ntUuCmK
 F5lRcaIrH6Qs3FYH0mJ4W1rfVI3xCafGIkWWpFI+2tBmJ490hydfh7+lz A==;
X-CSE-ConnectionGUID: FI0RBoS9St+x8L9OlOcCYA==
X-CSE-MsgGUID: 7LNG+kjzQNWCKqlCYAA1Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45572079"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="45572079"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 07:15:12 -0800
X-CSE-ConnectionGUID: OFeX7VCaQt6qT/WJ/6fi2Q==
X-CSE-MsgGUID: r/0lYe5JTg+NpN88M8aiNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102647851"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.153])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 07:15:12 -0800
Date: Tue, 17 Dec 2024 09:15:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ilia Levi <ilia.levi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Use suffix for casting to long to
 avoid overflow
Message-ID: <epqvxhpjy6fndm5j65rqxsm74qfgotnkpmh3vv7jjab7yllvs7@rumx3g7g27r2>
References: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
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

On Tue, Dec 17, 2024 at 11:58:07AM +0100, Zbigniew Kempczyński wrote:
>Multiplication without using casting to long (long) for at least
>one argument in expression may cause overflow especially when we're
>using this for calculating timeouts in nanoseconds precision.
>
>Ensure we're picking valid ul/ull suffix for base definitions for
>all dependents.
>
>Reported-by: Ilia Levi <ilia.levi@intel.com>
>Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/163
>

drop this newline so the lines above are also part of the git trailer.

>Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Ilia Levi <ilia.levi@intel.com>
>---
> lib/igt_core.h | 10 ++++++++--
> 1 file changed, 8 insertions(+), 2 deletions(-)
>
>diff --git a/lib/igt_core.h b/lib/igt_core.h
>index 90f57402f0..1b6e70182b 100644
>--- a/lib/igt_core.h
>+++ b/lib/igt_core.h
>@@ -1517,11 +1517,17 @@ void igt_kmsg(const char *format, ...);
> #define le32_to_cpu(x)  (x)
> #endif
>
>-#define MSEC_PER_SEC (1000u)
>+#if __WORDSIZE == 64

we could just use ull regardless of wordsize

but overall lgtm. With those changes: Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>+#define MSEC_PER_SEC (1000ul)
>+#define USEC_PER_MSEC (1000ul)
>+#else
>+#define MSEC_PER_SEC (1000ull)
>+#define USEC_PER_MSEC (1000ull)
>+#endif
>+
> #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
> #define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
> #define NSEC_PER_SEC (1000u * USEC_PER_SEC)
>-#define USEC_PER_MSEC (1000u)
> #define NSEC_PER_MSEC (1000u * USEC_PER_MSEC)
>
> #define for_if(expr__) if (!(expr__)) {} else
>-- 
>2.34.1
>
