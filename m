Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A19FC3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 15:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB44B10EB00;
	Fri, 16 May 2025 15:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/IqsMIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7B510EB00
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747409891; x=1778945891;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MIsA/P7XuvG2efgPmzNliaede8oxZINZRvB4yTxKmaA=;
 b=M/IqsMIn228nX8T7GdRm13XgqgZ7jsPYpA28cpJyZfC0YtdoZUA2syoX
 xwetW4xKIIs/V/+XyvtZKvR4OzOEwEdArP3rFdzWECqL5QKNM2bKoiHNL
 umHho17rrw+LmFoC4oZ5vSQg2b/g7/j96ZdGffeMEatFZAPB21iOh+Tyt
 oigFuIOag5F2vba+Fv+Gbth93st5XrZr6DsOZnyoak6kK60zVnqEnwE5j
 JQenVwGgwTXsZbj3mmZ5UOaT+MhXDJ+kWYb7jcGO1Oosqgm7ChGbWek92
 hP4iHDPYTQ3yEMfPmw/eThh3RIKKbujRfzdgtJIyM5t+BaRGnPWTc9br2 w==;
X-CSE-ConnectionGUID: ALI15GCHTDGoSjZ122VA5g==
X-CSE-MsgGUID: 8tXsd1gkSeaVm7rFEEzmrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60776825"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60776825"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:38:10 -0700
X-CSE-ConnectionGUID: 7DX8HYbISjSqhcAbVLGBbA==
X-CSE-MsgGUID: FNUdrJi7TzuEJc7T41eWAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="139127928"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:38:09 -0700
Date: Fri, 16 May 2025 17:38:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 2/4] runner: fixup print/scan formatting for
 files in runner
Message-ID: <20250516153807.4dqp7gyf3ug2gd3a@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250516115811.135889-1-jan.sokolowski@intel.com>
 <20250516115811.135889-3-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250516115811.135889-3-jan.sokolowski@intel.com>
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
On 2025-05-16 at 11:58:09 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print/scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIu64.
> 

I do not see any PRIu64 in this patch? Only %lu replaced by %zu
where %zu stands for size_t, this is ok in executor.c
but imho not for SERIALIZE_UL

Regards,
Kamil

> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
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
