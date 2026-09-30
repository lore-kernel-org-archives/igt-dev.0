Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC0ACA5FC5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 13:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1358B10F40C;
	Wed, 30 Sep 2026 13:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8eEDiBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A5110F3D7
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790775723; x=1822311723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P/39T4ZsvMA5UbUSOnx3wgnI+4XgWQ5ox834PhULDaI=;
 b=b8eEDiBRYth+9ugz0Ff0yNBR+KbZDxDC40Ip26OohEXaJYIXnHwSy2IN
 77lSu1nwaYKThlRFwvMFb/+tJOrmIJxvM0A+DF9Un8JI6WgmzXlghwipG
 NWNOqcmuuO4J2LlGSIcVrEOac7aanZrHHmLnLeIsCtbyAGZYqbZ4t713F
 BPtjHtO5szbWQ0HrG2+ub+a37OcF6zJGI/LqAGL6/XtqoJKYDfKYHVxAf
 0Xbx0OZJWVHOxs/4SvhkNZ6Xka0+mJMMGzc+zn6eZaR4boqQ0T0aYACJ0
 KGglM7RT976Sie9p22SzW0LKAAjbvTbRpVl60a3JATPxKwUhyG298s9zE w==;
X-CSE-ConnectionGUID: vqM2ULUtRByo0lTRy0EJkg==
X-CSE-MsgGUID: baUjWqx8Slih4yEyFcK91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90727323"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90727323"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:42:02 -0700
X-CSE-ConnectionGUID: oBBIc+IURDyAwOaN9jORyA==
X-CSE-MsgGUID: xXTylTQkSxafpWlELlLDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="280449219"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:42:01 -0700
Date: Wed, 30 Sep 2026 15:41:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 1/5] benchmarks/gem_wsim: Preserve const
 qualifiers
Message-ID: <20260930134145.ofvjjjqm62prbkqz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20260929154950.838280-1-alex.hung@amd.com>
 <20260929154950.838280-2-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929154950.838280-2-alex.hung@amd.com>
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

Hi Alex,
On 2026-09-29 at 11:49:46 -0400, Alex Hung wrote:
> With glibc 2.43, strchr() on const input returns a const pointer.
> Storing that result in char * causes a discarded-qualifier warning
> in str_to_engine().
> 
> The following warning is observed on Ubuntu 26.04 (wrapped):
> 
>   ../benchmarks/gem_wsim.c: In function 'str_to_engine':
>   ../benchmarks/gem_wsim.c:590:27: warning:
>     initialization discards 'const' qualifier from pointer target type
>     [-Wdiscarded-qualifiers]
> 
> Use const char * for the engine separator, which is only read.
> 
> Assisted-by: Copilot:GPT-6-Astra
> Signed-off-by: Alex Hung <alex.hung@amd.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  benchmarks/gem_wsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 1a4139279..8cdf940f9 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -587,7 +587,7 @@ static intel_engine_t str_to_engine(const char *str)
>  	}
>  
>  	if (str[pos]) {
> -		char *s = strchr(&str[pos], '-');
> +		const char *s = strchr(&str[pos], '-');
>  		char *endptr = NULL;
>  		long id;
>  
> -- 
> 2.53.0
> 
