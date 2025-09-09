Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122BCCA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 08:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C9A10E655;
	Tue,  9 Sep 2025 08:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOk1G43T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA90110E655
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757406785; x=1788942785;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p9Z7ABVAVZzfs/ueKshgknPWX1uvvUER6VuKICkKJZs=;
 b=hOk1G43T3gJw7Hggn1ZlzefLd/q96Asqh9sLXeVNBCKaTKkKnUfChGJ9
 CxaRNaeoGdLyy1W+qCF7bfY3iW59/I5wb45XxlP3rzA4zP7YmyXDhwsht
 hN8MQBO8xga1YIhLOA/+/EfVpMYGHWEPrwSrwjvMivWHaNb0CS5jQsT3j
 MlZ+KoRF/qZfMcMWZLFtdg/rWoaHvyGmB3LfgoEp4pkNHRdtEsL7xJHaa
 t+lT+ZZQQF1aT3NeCJUdDD0wmTZGVjDLcoz+6j78t4NU3MXTMRmf7ubwG
 Tov3njs0Gggg+QwTGPx+4mBtcmFaQVvZIFpejnaxOkqgZkpddod1XtXJA Q==;
X-CSE-ConnectionGUID: qlFDF90oT4iYBlyWTIfxuA==
X-CSE-MsgGUID: dqtOypVRSJSZa2igxynP0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59828538"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59828538"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:33:05 -0700
X-CSE-ConnectionGUID: tO4JgC71Sh+uFVLrYMv59g==
X-CSE-MsgGUID: ZBnu+hLAQmWqNHwz8aXCvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="173490267"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:33:03 -0700
Date: Tue, 9 Sep 2025 10:33:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Cc: igt-dev@lists.freedesktop.org, dwarakanath.ramadeva@intel.com,
 pravalika.gurram@intel.com
Subject: Re: [PATCH v3 i-g-t 1/7] benchmarks/latency: Add xe_blt latency test
Message-ID: <20250909083300.yrgb7e5net2shtpv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>,
 igt-dev@lists.freedesktop.org, dwarakanath.ramadeva@intel.com,
 pravalika.gurram@intel.com
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250908144314.42275-10-gajendra.uttamchand@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908144314.42275-10-gajendra.uttamchand@intel.com>
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

Hi Gajendra,
On 2025-09-08 at 14:43:12 +0000, Gajendra Uttamchand wrote:
> From: Gurram Pravalika <pravalika.gurram@intel.com>

No need for adding From here unless this was done by Pravalika
and you just take it and resended. Also proper name would be:

Pravalika Gurram <pravalika.gurram@intel.com>

> 
> Add block transfer latency measurement test for the Intel XE
> driver. Measures performance of BLT operations for user-
> configurable buffer sizes, batch counts, and parallelism to
> identify transfer bottlenecks and regression patterns.
> 
> Test supports statistical sampling (repetitions, timed
> iterations) for reliable performance characterization of XE
> block transfer operations. Buffer size, batch count,
> repetitions, and CPU parallelism are configurable via command-
> line options.

Please describe here what you did, this is not adding anything
new but moving existing file to new folder, so no need to
add Pravalika as an author in 'From:' and 'Author:' below.

Description would be for example:

Move existing benchmark into folder intel_benachmark to
separate those from other tools.

Feel free to improve description.

> 
> V2: Added original author attribution and handle relocation
> preserving git history
> 
> Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
> Author:    Gurram Pravalika <pravalika.gurram@intel.com>

No need for Author here.

> ---
>  benchmarks/{ => latency}/xe_blt.c | 0

imho this folder should be 'intel_latency'
 rename benchmarks/{ => intel_latency}/xe_blt.c (100%)

Regards,
Kamil

>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename benchmarks/{ => latency}/xe_blt.c (100%)
> 
> diff --git a/benchmarks/xe_blt.c b/benchmarks/latency/xe_blt.c
> similarity index 100%
> rename from benchmarks/xe_blt.c
> rename to benchmarks/latency/xe_blt.c
> -- 
> 2.43.0
> 
