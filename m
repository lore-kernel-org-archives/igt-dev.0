Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05423ECE579
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 15:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16CA10E5B0;
	Mon,  9 Sep 2024 15:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUx3MhJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979C610E5B0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725895404; x=1757431404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o/qEXUVcdcjOlxxUrJFZRJhYJgmuis7/S61ZukpjDiA=;
 b=dUx3MhJbC6UL56B5bOJnL+R8xZaASe6mapi0xFfb+bJ6FD4HT75syLkz
 tkGWDeoMs9+fb5me457YkD2e9WerIpZivN807y8AieUR4yCbvBO7+v8Qy
 ofohJqdGsPqJ0ATqT7z6RAetYWLKDqwE2BGST1lh3fMLYG6hsXGbuiJDR
 9rRdJVtoUGZrxSfmMBAEM4Zu+4JgrsbQdDzGBAyFf0wKdgwtsuMhNIDw6
 15Vrko+LwVEyiVIu+h+LvXH73/3GiKW2GSqom0u8jrhORTPAi9IP5nE6x
 72H+2tz0WTFRCWL+RcpTZ2jWv8f0xKyqbKtOIYr83Tuzb/pf5q4XpnJ82 w==;
X-CSE-ConnectionGUID: n7GrMec7T5KINBhFlVbheg==
X-CSE-MsgGUID: JZGm7eW5QH6BT1vZdDirDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35743144"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="35743144"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 08:23:23 -0700
X-CSE-ConnectionGUID: HZHiFAGCTj+irTiFuVZbcA==
X-CSE-MsgGUID: rCA0bIJUQJyo1IZHmlsMsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="66758459"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:23:20 -0700
Date: Mon, 9 Sep 2024 17:23:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alyssa Ross <hi@alyssa.is>, Mohammed Anas <triallax@tutanota.com>,
 Stefano Ragni <st3r4g@protonmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Reagan Bohan <xbjfk.github@gmail.com>, Yureka <yuka@yuka.dev>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_rpm: use basename from libgen.h
Message-ID: <20240909152317.ki7s7mfji2i6sdqb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alyssa Ross <hi@alyssa.is>,
 Mohammed Anas <triallax@tutanota.com>,
 Stefano Ragni <st3r4g@protonmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Reagan Bohan <xbjfk.github@gmail.com>, Yureka <yuka@yuka.dev>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20240904134948.1337335-1-hi@alyssa.is>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240904134948.1337335-1-hi@alyssa.is>
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

Hi Alyssa,
On 2024-09-04 at 15:49:48 +0200, Alyssa Ross wrote:
> musl only provides the libgen.h version of basename() that may modify
> it's argument.  That's fine in this case, because in the one use of
> basename() in this file, the buffer is never read from again.
> 
> Signed-off-by: Alyssa Ross <hi@alyssa.is>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/kms_pm_rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index 5af3e81bc..852e9cb5f 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -27,6 +27,7 @@
>  #endif
>  
>  #include <dirent.h>
> +#include <libgen.h>
>  
>  #include "config.h"
>  #include "i915/gem.h"
> 
> base-commit: fc3113c8c1e99797b2d4769aaf02265be64a7589
> -- 
> 2.45.2
> 
