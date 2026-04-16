Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CC5F8A16D
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 12:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3845710E1D3;
	Thu, 16 Apr 2026 12:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHB2iud5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFE510E1D3
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776343217; x=1807879217;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cZwgrCHxYajMF2D85Ue5/7rhHdkR021HxtBSmS+i8vI=;
 b=QHB2iud5rs5X6Chs6Bqs6+XzgwlnvezktRfDXfAljY9YxHSwrI+w3z8l
 aXpIWsMcP/IbM7dZtWcCG16wz/g8stX3I76VrFII96PV8UTRZil6CU3dZ
 4qGwxrcar6tlNDkKAnMlGn/2CYbLuWvPw8efkJ3N3kTRG8LamDa9ori50
 gxEJjXM8KvNjPBF80+rplYNChFkOYt/U9GPwQSxt1WzqKTcYrdELrtUz5
 +zgKpPFTtxyy01DjB0uxKiJJDZXuK2qRnbwS5Apur8SCGfjFUrW0H6AdJ
 1EEuaqlQC+XGES8VULOTJSq/XSndZnJqGnu5dyz+mPdmKMBxCMRt6LEZI Q==;
X-CSE-ConnectionGUID: WUh6QnRVT1Kdg25YaQ2Fjw==
X-CSE-MsgGUID: L+szxx/CQxiElq/n+4XGlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77214092"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77214092"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 05:40:16 -0700
X-CSE-ConnectionGUID: 5dhgiQGZRbOsXldeIxsoSg==
X-CSE-MsgGUID: PSkKH8PARRSmpPLY158xsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230576543"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 05:40:13 -0700
Date: Thu, 16 Apr 2026 14:39:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 peter.senna@linux.intel.com, piotr.rudnicki@intel.com,
 mika.kuoppala@intel.com
Subject: Re: [PATCH i-g-t v2 1/1] lib/igt_core: flush output on each line
Message-ID: <20260416123947.k4y4plmrb75urbqo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 peter.senna@linux.intel.com, piotr.rudnicki@intel.com,
 mika.kuoppala@intel.com
References: <20260416083910.1011732-1-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260416083910.1011732-1-jan.sokolowski@intel.com>
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
On 2026-04-16 at 10:39:10 +0200, Jan Sokolowski wrote:
> It was found while running tests that if a test launches threads with

imho you could write directly here:

I found while running ....

> even more subthreads, some igt_debug calls might not print their lines.
> 
> Fflush after each line to make sure we see everything we want to see.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
> 
> v2: Only flushes if no runner is connected as it's not needed otherwise.
> 
> ---
>  lib/igt_core.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 65325f08d4..4479201972 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3294,10 +3294,8 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>  	pthread_mutex_lock(&print_mutex);
>  
>  	/* use stderr for warning messages and above */
> -	if (level >= IGT_LOG_WARN) {
> +	if (level >= IGT_LOG_WARN)
>  		file = stderr;
> -		fflush(stdout);
> -	}
>  	else
>  		file = stdout;
>  
> @@ -3309,6 +3307,13 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>  		_log_line_fprintf(file, "%s%s", thread_id, line);
>  	}
>  
> +	/* Ensure output is flushed explicitly, as concurrent test threads
> +	 * may otherwise cause messages to be dropped or reordered.
> +	 * Runner uses sockets so it's not needed there.
> +	 */
> +	if (!runner_connected())
> +		fflush(file);
> +
>  	pthread_mutex_unlock(&print_mutex);
>  
>  out:
> -- 
> 2.43.0
> 
