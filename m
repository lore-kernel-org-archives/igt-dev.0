Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21899C8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 11:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA4310EA24;
	Fri, 11 Jul 2025 11:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2Wr1BHe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D0310EA24
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752233577; x=1783769577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TnvzqU2tbuhjO2BVsxnAVNoxmyBdcB50jNR/72iPDKA=;
 b=k2Wr1BHeKC7eNIEF4v7NukyooGtrN8x9ow1PIHOej9poJyV2IjNEhxLe
 0tf89+ElwC3iye02ZGXNJogpjxTR0N8zWtEqStk32VmHOzs+ycu4c99l9
 RnHc9htpuDM6nkBrzLkR+lzX+9hiPF5dKUGTQ34unMadt/P/Ftb9sOry/
 xRkMXDCoHekbsLRB7Xx839A+hs6zPsrz6nolsFbfyjNM0PmKe+YaY/REU
 WPrOV5xIOhYXBL9w6jLB4YwVbRJORx+viV4hhNk0+zhNHDLOK+ELh2UIv
 qFQy1fZ5f6fwgpD9PKhnkYtg/Lkqqk5MS4OhQvGuDhOe4DgoRqj1CG1tL w==;
X-CSE-ConnectionGUID: Bcf+Yi2gTyGtUbMAcyqTOQ==
X-CSE-MsgGUID: 4Z/3qdTtT8ahtC+42ukLTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="64787782"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="64787782"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 04:32:56 -0700
X-CSE-ConnectionGUID: +kpyCX7LRqKC5NAvRY019g==
X-CSE-MsgGUID: poM35QoCTP6fq5Nihh59bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="160897895"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 04:32:54 -0700
Date: Fri, 11 Jul 2025 13:32:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zlice555@gmail.com, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t v1 1/3] lib/igt_vc4: Fix musl libc compilation
Message-ID: <20250711113239.uxhsil4lkvbgnnm3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, zlice555@gmail.com,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
 <20250710190017.167735-5-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710190017.167735-5-kamil.konieczny@linux.intel.com>
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

Hi ,
On 2025-07-10 at 21:00:14 +0200, Kamil Konieczny wrote:
> Fix gcc compilation on Void Linux with musl C libs, where
> PAGE_SIZE is already defined.
> 

Sorry, I forgot adding vc4 developers to Cc:

Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>

Also +cc Andrzej Hajda <andrzej.hajda@intel.com>

> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_vc4.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
> index fe7173c50..165872ba2 100644
> --- a/lib/igt_vc4.h
> +++ b/lib/igt_vc4.h
> @@ -31,7 +31,13 @@
>  #include "igt_fb.h"
>  #include "vc4_drm.h"
>  
> -#define PAGE_SIZE 4096
> +#ifndef PAGE_SIZE
> +# define PAGE_SIZE 4096
> +#else
> +# if PAGE_SIZE != 4096
> +#  error "Unexpected PAGE_SIZE"
> +# endif
> +#endif

I am not sure if vc4 needs exactly 4KB as bo, or is it good
to have whatever comes from compilation environment?
Other proposed change was smaller:

#ifndef PAGE_SIZE
#define PAGE_SIZE 4096
#endif

Regards,
Kamil

>  
>  uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
>  int igt_vc4_create_bo(int fd, size_t size);
> -- 
> 2.50.1
> 
