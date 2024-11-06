Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F474D44D58
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 13:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B38D10E281;
	Wed,  6 Nov 2024 13:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koarf6UT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7007D10E281
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 13:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730898106; x=1762434106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QyaTSlu+oyr8rmimn4J73I/pfuU3KQQka9dvAXi6qss=;
 b=koarf6UTinWUMHH91exBbcF09Mhv7Zj3XkOYskC2fWndesnm1OlE+mal
 3hWK76MqVMRbHE1V05whk8fzYXSHtRRXURkFS5pB34HppUJ8rPea91XMZ
 8u71/9GiqmYhulkC718HGpJFJCDlDQ2WMCBkczrhIx9q5ox7dF09RRj34
 IcaI3ojQqcXzdq+FJbfK4ROCOBTpuMRmLL9kRXhkIKoYaY304PmbtqTxC
 XytwXcmNUWAwmeqV2u57I2NzMoZmdPo8WTFNL+BdjAuqdaBRrddcqBS2e
 z0KxLoSA3klUIF4jPTyJfq+g1XhFuJeocBVflJJVcq6ClricSB7L42GZS Q==;
X-CSE-ConnectionGUID: bZEonyJuRQeVP9GYR/xGmw==
X-CSE-MsgGUID: 5fG3qY1SQj+mJvW/b48SrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30579167"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30579167"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 05:01:46 -0800
X-CSE-ConnectionGUID: PZ57UJY6SMuNsXYs49ZZHw==
X-CSE-MsgGUID: sRmS14IVRrCxKgkOc3GW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84165020"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:01:45 -0800
Date: Wed, 6 Nov 2024 14:01:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>
Cc: igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH i-g-t] lib/igt_profiling: add include for PATH_MAX constant
Message-ID: <20241106130143.z7di4t2er6oo56ac@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
References: <20241103171806.10248-1-arkamar@atlas.cz>
 <202411583120-ZynX2Bpb672E8EEZ-arkamar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202411583120-ZynX2Bpb672E8EEZ-arkamar@atlas.cz>
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

Hi Petr,
On 2024-11-05 at 09:31:20 +0100, Petr Vaněk wrote:
> PATH_MAX constant is defined in limits.h header file. It needs to be
> explicitly included in musl environment as it is not transitively
> available for any of available includes.
> 
> Fixes: 9366bee04d16 ("lib: Add DRM driver sysfs profiling knob toggling functions")
> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> Signed-off-by: Petr Vaněk <arkamar@atlas.cz>
> ---
> Resending the patch as it seems it did not make it to the list last
> time.

This could happen if you are not subscribed to igt-dev mailing list,
your patch was deliverd to ML with a few days delay.

Regards,
Kamil

> 
>  lib/igt_profiling.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> index b61506742..e1526ad98 100644
> --- a/lib/igt_profiling.c
> +++ b/lib/igt_profiling.c
> @@ -10,6 +10,7 @@
>  #include <assert.h>
>  #include <dirent.h>
>  #include <fcntl.h>
> +#include <limits.h>
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> -- 
> 2.45.2
> 


