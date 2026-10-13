Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48569CC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 17:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCA010E8FC;
	Tue, 13 Oct 2026 17:08:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D37C10E0FE
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 17:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791911286; x=1823447286;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RzQErc8IvzRJCzfcNfedbbzVDX3ot/KLRYeJOzqcOyo=;
 b=HL4Mg8mr9zzfx/H1FepwGsOsiHTMIc3AxDeVkda9HyUITTfhCVWQyU/z
 jxlcTKQk1BvBxw/K++y3JQ1/jl3MyxxnyXVeEUJ+q6ZoAWkTjFfBe1xkO
 Oo7R3GiB3JwpeouB6EIaMa7ERCC+gnPI2jjAC6Evjmc0nDVZuSDmZvr8g
 PYQ0Pocr53Vt9ImGxgw7jy6OCx/pczuEjBnkXqCENiZ13j4wfUjrqMARx
 MehJQl1mnbM0DDZzf/jfUY46Edhdh01NrQrtGA0sNiY0j1b81vAZujQgp
 95+gHeW3IJDQmLsaKXOHz2a2f0paucXfUJ03QjpvRs8eKVsBNGvesjfAR Q==;
X-CSE-ConnectionGUID: lyWd1uciTnSBz0MwSfBfHw==
X-CSE-MsgGUID: /zCUe+i9SYSWNc4pl9cKLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="638512"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="638512"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 10:08:06 -0700
X-CSE-ConnectionGUID: y/SDY4vLQsyClh8x2JBG3A==
X-CSE-MsgGUID: Qm2kmu3NRz227gPAeRuPQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1287836"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 10:07:48 -0700
Date: Tue, 13 Oct 2026 19:07:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_chamelium_stream: Fix warn about
 discarded const
Message-ID: <626bd3pla4n55aknkhtbv7fcvmyf6c4w6c2onqdfzv7cuw5qed@sgse6mrfqgm5>
References: <20261013151644.174387-1-kamil.konieczny@linux.intel.com>
 <20261013151644.174387-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013151644.174387-2-kamil.konieczny@linux.intel.com>
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

On Tue, Oct 13, 2026 at 05:16:43PM +0200, Kamil Konieczny wrote:
> Fix following warning which is observed on Ubuntu 26.04:
> 
> ../lib/igt_chamelium_stream.c: In function ‘parse_url_host’:
> ../lib/igt_chamelium_stream.c:119:15: warning: assignment
> 	discards ‘const’ qualifier from pointer target type
> 	[-Wdiscarded-qualifiers]
>   119 |         colon = strchr(url, ':');
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_chamelium_stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_chamelium_stream.c b/lib/igt_chamelium_stream.c
> index a8cd19e51..062feca26 100644
> --- a/lib/igt_chamelium_stream.c
> +++ b/lib/igt_chamelium_stream.c
> @@ -110,7 +110,7 @@ static const char *stream_error_str(enum stream_error err)
>  static char *parse_url_host(const char *url)
>  {
>  	static const char prefix[] = "http://";
> -	char *colon;
> +	const char *colon;
>  
>  	if (strstr(url, prefix) != url)
>  		return NULL;
> -- 
> 2.55.0
> 

Verified on 26.04, the warning is gone. So:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
