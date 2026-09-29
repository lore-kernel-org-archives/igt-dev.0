Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CEACA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 10:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF11210E064;
	Tue, 29 Sep 2026 10:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TywmNCvD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14ED310E064
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790677474; x=1822213474;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4QlYXEBp2nu4IAewWXjl+3ULndQ/3GVsVl2n2rBo3LY=;
 b=TywmNCvD0mwbvaQzxeqEfW4hqX4tXU4lG6D4vGD96bWkrRPjH5DzBv4i
 2cH1atkOIo1zJ3kOlPC4t/JCHFVqSxQhbux7njKWbCCBqZP1hCHLlBeK0
 zNB/x/mnqoCEum2ZO8sxC33ySNPZbMcUrUdfE7cAp3YyLA6NsAS44GaGh
 ppAR3QuXklDTZYzZW0EiikfApXCmgZF/mhnMJiOf87eFngG8n4ubB8Oes
 g+je7gztZeGOZ3I6AMTzxIqUL8+FNEylgyRhCfeqZDevG6NBW0yZQAXQB
 jUUA5Rm9E/d339A1OYxF0snht4oHNHXOqnrS4QKMcxpL/NMVDf0vQNZ7w w==;
X-CSE-ConnectionGUID: 5VHamd3HTjeTvK0v0TTrkQ==
X-CSE-MsgGUID: UMIjraa5TieSA7WqGm4Aqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91412545"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91412545"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:24:34 -0700
X-CSE-ConnectionGUID: /At3z2HzQW2fc8hSVf6HiA==
X-CSE-MsgGUID: 8i9xFCsMT36WZCW8ZMa4Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275479156"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:24:33 -0700
Date: Tue, 29 Sep 2026 12:24:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/2] benchmarks/tools: Preserve string const qualifiers
Message-ID: <20260929102430.hfxolrxgd4vysdo5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20260925193642.2627600-1-alex.hung@amd.com>
 <20260925193642.2627600-3-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925193642.2627600-3-alex.hung@amd.com>
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
On 2026-09-25 at 13:36:42 -0600, Alex Hung wrote:
> With glibc 2.43, string searches on const input return const pointers.
> Storing these results in char * variables causes compiler warnings.
> For example, str_to_engine() reports:
> 
>   warning: initialization discards 'const' qualifier
>     from pointer target type [-Wdiscarded-qualifiers]

Can you cite here a little more, not only a warning message
but also a line before?

> 
> Use const char * for string-search results in gem_wsim and
> intel_reg_spec. Keep a separate char * in intel_reg_spec to remove the
> newline from the allocated filename.
> 
> Assisted-by: Copilot:GPT-6-Astra
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  benchmarks/gem_wsim.c  | 2 +-
>  tools/intel_reg_spec.c | 7 ++++---

Please split this also into two separate patches, one for
benchmarks and one for tools.



Regards,
Kamil

>  2 files changed, 5 insertions(+), 4 deletions(-)
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
> diff --git a/tools/intel_reg_spec.c b/tools/intel_reg_spec.c
> index 632db6b9f..e51c90ec9 100644
> --- a/tools/intel_reg_spec.c
> +++ b/tools/intel_reg_spec.c
> @@ -228,6 +228,7 @@ static bool ignore_line(const char *line)
>  
>  static char *include_file(const char *line, const char *source)
>  {
> +	const char *source_dir;
>  	char *filename, *p;
>  
>  	line = skip_space(line);
> @@ -239,9 +240,9 @@ static char *include_file(const char *line, const char *source)
>  	if (!filename)
>  		return NULL;
>  
> -	p = strrchr(source, '/');
> -	if (p && *line != '/') {
> -		int len = p - source + 1;
> +	source_dir = strrchr(source, '/');
> +	if (source_dir && *line != '/') {
> +		int len = source_dir - source + 1;
>  
>  		memcpy(filename, source, len);
>  		strcpy(filename + len, line);
> -- 
> 2.43.0
> 
