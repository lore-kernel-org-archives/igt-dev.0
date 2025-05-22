Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82D1C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 11:36:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC7710EACB;
	Thu, 22 May 2025 11:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XS0b14jW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8E110EACB
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747913803; x=1779449803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W9G61rvmob8QN4/Piooqv8uWjEpcjSFz0jvBkdo70Ek=;
 b=XS0b14jWj32zrb8QjAZOTH0OIOeIJTKbuCMuvbSFsclOFbZuRuPPoWBn
 2Aldw79k08W1Mkn7Jrg7bEhhrd/n/s3vNNX18D/LNyXR+IvtnP75AO1mQ
 jvPLgFxGEpnVYwfDsSiXLw6AzYM2I9iyBdZ92IdyPzsYrMN37JB+ZSYuX
 zhLGd0AK833m2VN3u0UgC2qkuTRP753JCUCnTvdNm3DjAYs1Be78j5jKI
 cNmvLrQTYhgIJA3eBB00LnaAG+OZkQYSz+j0KVhJxA0nCm3dISa4+hm66
 mUEHXS4/6BHuz4v0x0c0DowHoCVb5337m/Xw8ZbG2Ikl0ynvG14nMQ9xk g==;
X-CSE-ConnectionGUID: e9CuHOCORJiLtjB3bN/GYA==
X-CSE-MsgGUID: UTEQ+e3dQju4Ag6mdPkdwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49183771"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="49183771"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:36:42 -0700
X-CSE-ConnectionGUID: h1HrQlFAS3CIKegBYPAFsA==
X-CSE-MsgGUID: H1+tIuhPRna3HMDfgcN61g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="141064874"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 04:36:40 -0700
Date: Thu, 22 May 2025 13:36:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v9 12/14] tests/intel/xe_create: Conditionally
 define PAGE_SIZE for non-Android platforms
Message-ID: <20250522113637.gz4wwhfhcqczdcsg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
 <20250519151135.43874-13-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519151135.43874-13-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-05-19 at 15:11:33 +0000, Jeevaka Prabu Badrappan wrote:
> Ensure PAGE_SIZE is defined only if it is not already defined,
> addressing compatibility with Android where PAGE_SIZE is predefined.
> 
> Note: PAGE_SIZE is defined in multiple files; a cleanup will be
> addressed in a future patch series.

I will drop this cleanup sentence before merge.
imho this could be done in one of xe headers (which every xe test
includes) and then fixing sources. Up to you.

> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_create.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index b22084c84..e8b8bb025 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -18,7 +18,9 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> +#ifndef PAGE_SIZE
>  #define PAGE_SIZE 0x1000
> +#endif
>  
>  static struct param {
>  	unsigned int quantity;
> -- 
> 2.49.0
> 
