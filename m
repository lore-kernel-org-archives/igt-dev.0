Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416D2CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 14:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB00C10EDC4;
	Wed,  6 May 2026 14:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPC5CSlQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB05410EDC4
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778077563; x=1809613563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NlHrI6uLAnaIIZ7EPSi3J1RmWd/5zYVWvrybWQMRl6Q=;
 b=PPC5CSlQhPBqrGAKKhmmAYm7dMSrpOMOcW8OCPCO8zCCZN8EXXCCxPDJ
 O0FkznJQ/tUSMWmkrNFuu+qfiR+tMyIMP1hQRaGFE99Icl5shHDYnH21a
 kR7ez4+GR7XjpaiLWoD7vU9+G8CadY9syHNA0tYnU5dgcN4WNjbdqfaMf
 beXcWMAjBT9gXvhDYJMaS1qbGE4vFyueIrngrGGikx+fI7v78fJgh01xg
 f8l0Vv5gXszjZoow/BABZPRD+mLGeUiD4U8xl3+GBU/xoMdirMh1K9Bce
 SWJcX88wyLXMgQ4YwkGBMhGPUmVFzLuxHxYIxBUsw6Dif0xIJN+W0ZQbZ w==;
X-CSE-ConnectionGUID: mofOANFiQbmXJKBDEpF5kA==
X-CSE-MsgGUID: milVH0sFSm6zdcj3QOfGfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78158018"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78158018"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:26:03 -0700
X-CSE-ConnectionGUID: w8pM2wN2Q7mteiJqx3ja0w==
X-CSE-MsgGUID: tRNVobQ0R5egkaCTBKnzfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="241161998"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 07:26:02 -0700
Date: Wed, 6 May 2026 16:25:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] core: add timestamps to logs
Message-ID: <20260506142559.c6dc7hcz2bo364qx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ryszard Knop <ryszard.knop@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
References: <20260505-add_timestamps_to_logs-v1-1-2d95f499fdfb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505-add_timestamps_to_logs-v1-1-2d95f499fdfb@intel.com>
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

Hi Andrzej,
On 2026-05-05 at 16:46:27 +0200, Andrzej Hajda wrote:

please use longer prefix, also these changes only debug logs,
so imho better subject:

[PATCH] lib/igt_core: add timestamps to error logs

See for example results here:
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15100/shard-lnl-2/igt@core_auth@many-magics.html

> IGT tests run often time consuming tasks. Timestamps should simplify
> time analysis and matching with kernel logs.
> Since IGT is closely connected with the kernel let's use the same format.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/igt_core.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 4f79c02948ab..e11b181e7a82 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3227,10 +3227,15 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>  		formatted_line = strdup(line);
>  		if (!formatted_line)
>  			goto out;
> -	} else if (asprintf(&formatted_line, "(%s:%d) %s%s%s%s: %s", program_name,
> -		     getpid(), thread_id, (domain) ? domain : "", (domain) ? "-" : "",
> -		     igt_log_level_str[level], line) == -1) {
> -		goto out;
> +	} else {
> +		struct timespec ts;
> +
> +		igt_gettime(&ts);
> +		if (asprintf(&formatted_line, "[%5ld.%06ld] (%s:%d) %s%s%s%s: %s", (long)ts.tv_sec,

Can you align it to igt_runner format? It is %ld.%06ld
see grep 6ld runner/*.c

Regards,
Kamil

> +			     ts.tv_nsec / 1000, program_name, getpid(), thread_id,
> +			     (domain) ? domain : "", (domain) ? "-" : "", igt_log_level_str[level],
> +			     line) == -1)
> +			goto out;
>  	}
>  
>  	if (line[strlen(line) - 1] == '\n')
> 
> ---
> base-commit: 8eb6e58f00d39b3bb79ffc501eb020b36c8f8c31
> change-id: 20260430-add_timestamps_to_logs-d84fdfd7ef4c
> 
> Best regards,
> --  
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
