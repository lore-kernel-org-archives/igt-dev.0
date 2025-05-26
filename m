Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E90C54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 11:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981E410E355;
	Mon, 26 May 2025 11:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3q9XUWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F355310E358
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748258999; x=1779794999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TvFkp04CTK/GgZkas3w5vzBtG/6Xrl8fb8eEClYEhPA=;
 b=b3q9XUWw/xfC6s2Z0QQXf37A71zJJCnELNibiC3qOHxnU7dSwkUTTlSw
 U77s8dRBnWeD4JBfYMUdoJy08ky/HHDvMwFEMO4I9cGCCZl3wxFvlYJwb
 0UtVf/5rYh8HTHhW35NUlkDztvq8skNUk1mM7c9aRjtyYvlDETQdHzjTT
 Kb+4dbpOR5rg9x6hBc9bwVX+NfWOXMJSo6JgXs8lfNhTKQvy1kVV5C7Re
 hARBr8NsfiC0ocsp1t5I5bj4p94LkeGGbTkPsUPnTtiKAhGTYJfEZQooW
 SfhWpmJVDaEoO9CCiJQhw6c/St5pFe5qIaP+pZhN2P4Juswk29uFODwWh Q==;
X-CSE-ConnectionGUID: hDEg/EBNRzCrLwCQCd7sqg==
X-CSE-MsgGUID: FnVwBouZRNicxyp7wSPSzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="75627332"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="75627332"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 04:29:59 -0700
X-CSE-ConnectionGUID: nSv6XrZEQ7aengU1bVuGcA==
X-CSE-MsgGUID: Y2JEdqb5RzifygsMqVM34w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="143308189"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 04:29:57 -0700
Date: Mon, 26 May 2025 13:29:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH i-g-t v3 4/8] lib/igt_perf: fixup print/scan formatting
 for files in lib
Message-ID: <20250526112955.y3ifmwqbl4k7lj2m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20250526080740.67790-1-jan.sokolowski@intel.com>
 <20250526080740.67790-5-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526080740.67790-5-jan.sokolowski@intel.com>
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
On 2025-05-26 at 08:07:36 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print/scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. SCNx64.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  lib/igt_perf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index fb2b73915..2b7170094 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -5,6 +5,7 @@
>  #include <stdlib.h>
>  #include <string.h>
>  #include <sys/stat.h>
> +#include <inttypes.h>
>  #ifdef __linux__
>  #include <sys/sysinfo.h>
>  #include <sys/sysmacros.h>
> @@ -157,7 +158,7 @@ int perf_event_config(const char *device, const char *event, uint64_t *config)
>  		return -EINVAL;
>  
>  	buf[bytes] = '\0';
> -	ret = sscanf(buf, "event=0x%lx", config);
> +	ret = sscanf(buf, "event=0x%" SCNx64, config);

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	if (ret != 1)
>  		return -EINVAL;
>  
> -- 
> 2.34.1
> 
