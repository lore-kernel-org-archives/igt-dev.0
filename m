Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FA5C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 11:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B29110E8FE;
	Mon, 13 Jul 2026 11:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="licj1nx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDFF10E8FE
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783940615; x=1815476615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JA0pkg31uSZ0YuXoolct20SWlN9bqB2vkjfgXNK90Z0=;
 b=licj1nx+/s6CJ+Giw43IwFacdSVwvC7K3uHyIDr1huKI8GhOM5Fxq815
 CUraFSV8lkDlZUAcmcU5cnoX5yJStdtuyC4QFx2aAXMCrcLcCoF4KvMrK
 auIZdgK2hUnNen3XGmaVRSqV6jvArcZK2Gsh6VAcI4BRj+Y9J84PULmLc
 1QafAYddSJJrL8rB3IkUQe5MxmR9icD3tg+BNrtuSSMAdwW0fp7jd1n6I
 prCBI52Wt/o+UTzIZLLyoZ50VA1RIKbjWYpj1unADyccYOyXRf3DLtBZa
 geJNGFZ86XXMFf46RJXmCsimO2a7SrW2hsOolVtgxWB6ohmF3RrIS73jV A==;
X-CSE-ConnectionGUID: cWaoEU8mRda8d3RRv/YwrQ==
X-CSE-MsgGUID: Xo5TeTqyThuLgIFuVGLU8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84401142"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84401142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 04:03:34 -0700
X-CSE-ConnectionGUID: /7ZiYDmpRnCo+FyusLVDGQ==
X-CSE-MsgGUID: fqdIgBjWRpK6pvV3Ep6aAw==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:03:33 -0700
Date: Mon, 13 Jul 2026 13:03:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tools/intel_gpu_frequency: include limits.h to
 fix musl build
Message-ID: <20260713110316.r3dlpa34ttlo4uld@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bernd Kuhls <bernd@kuhls.net>, igt-dev@lists.freedesktop.org
References: <20260710184619.2347456-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710184619.2347456-1-bernd@kuhls.net>
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

Hi Bernd,
On 2026-07-10 at 20:46:18 +0200, Bernd Kuhls wrote:
> Fixes build error seen with musl-based toolchains:
> 
> ../tools/intel_gpu_frequency.c:90:19: error:
>  ‘PATH_MAX’ undeclared (first use in this function)
>    90 |         char path[PATH_MAX];
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tools/intel_gpu_frequency.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
> index 6316c2e58..7df7f331d 100644
> --- a/tools/intel_gpu_frequency.c
> +++ b/tools/intel_gpu_frequency.c
> @@ -25,6 +25,7 @@
>  #include <dirent.h>
>  #include <fcntl.h>
>  #include <getopt.h>
> +#include <limits.h>
>  #include <stdio.h>
>  #include <time.h>
>  #include <unistd.h>
> -- 
> 2.47.3
> 
