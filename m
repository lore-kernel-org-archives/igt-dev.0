Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C41CC5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 14:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130CB88FBD;
	Tue,  3 Jun 2025 14:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6IuVuOm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9616210E607
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 14:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748959600; x=1780495600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aWVqtqI/5Vpu+Ox02tMyHceYva5Nb2F+iPY8z6lcovY=;
 b=K6IuVuOmf3eYBNeliol2ZYKjNOlk+fA8UcQwXvkPlfpX/E2i/6Yggou4
 8FkWvk1yGzb8eo4EVRF/qS9kzcXMszGMva2X9S+L1D7dgFxZUEdT1iMM/
 stJKLqAmnyJGJ6AJ1eMGm7UKqVITQNz9dIbNisWlBuZrCpRIKSZs53AB3
 7ZolqKCH7P09wJp7iZyRPH/VQBldkwyUGTMjvGO9ell11kzw66A5Kai9O
 RRAWlyr+WbZ1WIc4kNIvxLZyvf4fEMOxW+uoJ1JQQGczjgX3ScRtWnCgp
 8tLSAfMNDQh1qvLIF2NLBS97wNp5EfNjdsfQTD1CI4nPrwijTLnC/2eIK Q==;
X-CSE-ConnectionGUID: iJ8rrHhCRhy1EUKmxkrfMg==
X-CSE-MsgGUID: j9/40T77SPmO+uSeqqwIVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="38628167"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="38628167"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 07:06:40 -0700
X-CSE-ConnectionGUID: sdR8poJMTFiDA1YDlm14Aw==
X-CSE-MsgGUID: p1CquU8fSTGA8kt4euXQ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145830890"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 07:06:39 -0700
Date: Tue, 3 Jun 2025 16:06:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH i-g-t v5 4/9] lib/igt_perf: fix scan formatting for
 32-bit compilation
Message-ID: <20250603140636.hfehjf2ywrhiu2bv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20250603111107.3170529-1-jan.sokolowski@intel.com>
 <20250603111107.3170529-5-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603111107.3170529-5-jan.sokolowski@intel.com>
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

Hi Jan,
On 2025-06-03 at 11:11:02 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. SCNx64.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_perf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index fb2b73915..fe60241a4 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -1,5 +1,6 @@
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <inttypes.h>
>  #include <limits.h>
>  #include <stdint.h>
>  #include <stdlib.h>
> @@ -157,7 +158,7 @@ int perf_event_config(const char *device, const char *event, uint64_t *config)
>  		return -EINVAL;
>  
>  	buf[bytes] = '\0';
> -	ret = sscanf(buf, "event=0x%lx", config);
> +	ret = sscanf(buf, "event=0x%" SCNx64, config);
>  	if (ret != 1)
>  		return -EINVAL;
>  
> -- 
> 2.34.1
> 
