Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841FAC54E4A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 17:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7EC10E370;
	Wed, 28 Feb 2024 17:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jT3ySyfp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D806B10E370
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709140968; x=1740676968;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ARHZSCSdpTfq5NVOi+iQsjizb5amUsPEmq2HZzSPhBw=;
 b=jT3ySyfpOm9vbtzF6fk8HsDY5Hf7whjFEVQIj6GBpMYxzpXFncOSP/os
 WrgqlLHrEOJTC3G+jmE77lRIO7SGH5udnFPd1lMEFspEFIaE6h3OY+jLj
 jOpDaRp1KbtUAqeq21cyChfs4mQFcrMbDo4mK+m6mrPOXl0V0i5zHMx1p
 9cNyD2I8ZbwVLbDMfd6lEGJmO7wins0n4QkbiedUAHcNncNEZuYnunr4m
 mLxBf/IytudNCLydpfAZ1fnqhjfkvotqOe1pNpgSnoABkuCTeVj9KBlp+
 a3TEsrPbemD/J3FT1f8zljFviFEe8DfeLLiumnmmr2U9QLqihy11dXhpi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3475868"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3475868"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 09:22:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12071770"
Received: from mshirdel-mobl.ger.corp.intel.com (HELO [10.252.23.117])
 ([10.252.23.117])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 09:22:46 -0800
Message-ID: <514273c6-505c-41b5-82b2-1fef437d0c23@intel.com>
Date: Wed, 28 Feb 2024 17:22:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 7/7] tests/xe_intel_bb: Dump do png without detiling
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
 <20240228145407.370325-8-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240228145407.370325-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 28/02/2024 14:54, Zbigniew Kempczyński wrote:
> On my work on Lunarlake I often needed to inspect surface without
> detiling. Replace dumping surface exactly how it looks in the memory.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Not sure how to parse "Dump do png" ?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_intel_bb.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index ef12715dea..c3a4b5450e 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -913,9 +913,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
>   	if (write_png) {
>   		snprintf(name, sizeof(name) - 1,
>   			 "render_dst_tiling_%d.png", tiling);
> -		intel_buf_write_to_png(&src, "render_src_tiling_none.png");
> -		intel_buf_write_to_png(&dst, name);
> -		intel_buf_write_to_png(&final, "render_final_tiling_none.png");
> +		intel_buf_raw_write_to_png(&src, "render_src_tiling_none.png");
> +		intel_buf_raw_write_to_png(&dst, name);
> +		intel_buf_raw_write_to_png(&final, "render_final_tiling_none.png");
>   	}
>   
>   	/* We'll fail on src <-> final compare so just warn */
