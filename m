Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC7C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 18:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3816B10E2BD;
	Mon, 19 May 2025 18:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwFTXtlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866C910E2BD
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 18:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747680138; x=1779216138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s7ZFLWJ91xZg+rsutMPFDBY1gSM5Z+pS7vjNnl45hvU=;
 b=dwFTXtlgSFpopVHTm6EAKxrtWDHlYh05se2N3+VANLX6BiC0Jz/tsXNu
 AHBcKnPr54LpsmZbt+k0FynsIN1xK2DYnWQeyfTuBcNFjv2uAY9INGPP6
 /BnIqQTYN+UzVzGX+rQPKVTuv2DpyRg6pl112e0qRoS/WG0eIwXOIYcBc
 hXEdC0wsftV2XjS4RsCfxmN5y+0omSLBfMca67lyuaS+fLBIJ0FZmX2rl
 /TsNJm0DuhZZLKIiFIoS/851KQ34BwDg/z3u8mGQkFRwVW7jACZSaK1Nu
 JGCJlaOsDZcMoaZLpXSnyHZa3cTPwdxgeM/E9jgY36eTjtl1xcYObbVic g==;
X-CSE-ConnectionGUID: H28ipBiWS7OjAVZOhr+wzw==
X-CSE-MsgGUID: u8tQhGZ3S0u93E3c5mEsdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60625414"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="60625414"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 11:42:16 -0700
X-CSE-ConnectionGUID: rUG2ToCsTna1PbFBOb7qgg==
X-CSE-MsgGUID: 4UEjTD9nQTCPF+fvgwhZRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="170482500"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 11:42:15 -0700
Date: Mon, 19 May 2025 20:42:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 7/8] runner: fixup print/scan formatting for
 files in runner
Message-ID: <20250519184212.3ssu2thekhve7ybh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250519113010.125751-1-jan.sokolowski@intel.com>
 <20250519113010.125751-8-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519113010.125751-8-jan.sokolowski@intel.com>
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
On 2025-05-19 at 11:30:09 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print/scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. zu for sizes.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  runner/executor.c | 2 +-
>  runner/settings.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 41f521e56..661305006 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1582,7 +1582,7 @@ static int monitor_output(pid_t child,
>  		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
>  			char disk[1024];
>  
> -			snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded at dmesg dump, %ld > %ld\n", disk_usage, settings->disk_usage_limit);
> +			snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded at dmesg dump, %zu > %zu\n", disk_usage, settings->disk_usage_limit);
>  			if (settings->log_level >= LOG_LEVEL_NORMAL) {
>  				outf("%s", disk);
>  				fflush(stdout);
> diff --git a/runner/settings.c b/runner/settings.c
> index 1d34c5bfe..a7d5dbc97 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -1166,7 +1166,7 @@ static ssize_t unescape_str(char *buf, size_t *n_src)
>  
>  #define SERIALIZE_LINE(f, s, name, fmt) fprintf(f, "%s : " fmt "\n", #name, s->name)
>  #define SERIALIZE_INT(f, s, name) SERIALIZE_LINE(f, s, name, "%d")
> -#define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%lu")
> +#define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%zu")
>  #define SERIALIZE_STR(f, s, name) do {		\
>  		if (s->name) {			\
>  			fputs(#name " : ", f);	\
> -- 
> 2.34.1
> 
