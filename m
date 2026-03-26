Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7821B10A88E0
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 15:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E59510EAF6;
	Thu, 26 Mar 2026 15:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGc1ENEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A87C10EAF2
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774539548; x=1806075548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9o9pJBJgo0tB6H1kQZnVq9Vr/t9004y/1D0OanqXDXs=;
 b=dGc1ENEutob/BGo0zMjPXvu68wUc0WsVCzRxzVVnQ23lNnAgXYBvaxSq
 RRiiWJDS6aihH21cuJKXhiprNyl6nzAs4xRPEqYn71Umvg1McxOUZg0mS
 ehhu9txbf38MVS/IYTCnxKI1hbGsDrRoNGVuWVPuOf96Y6CTjXNrdqITQ
 ls8dKYxoGoYD+fJV61Gb2oc7l7XyHfieGh3u1JMe857RtID/kXYsWjlnX
 TAE+c2J744nBCg1GaP/W6cwh2GGSKlYeUyywF1xvqzNHJRYnZAjor6+vd
 lsuMy4IHnl1Kp0rCW6alTuEueWKsptX4ZB2HeuS8dUjvYb0uQY80l45xG g==;
X-CSE-ConnectionGUID: 1uJfCcgjQeWPahNVOat6BA==
X-CSE-MsgGUID: lFBSZ+DETn6q8mAy2Q7sTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86678486"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="86678486"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 08:39:08 -0700
X-CSE-ConnectionGUID: 6Rznrh8jTD2B8spqO+wH0w==
X-CSE-MsgGUID: +vZEGJlyS/WHVk0lGK8REQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="225294181"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.222])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 08:39:07 -0700
Date: Thu, 26 Mar 2026 16:39:03 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, peter.senna@linux.intel.com, 
 piotr.rudnicki@intel.com
Subject: Re: [PATCH i-g-t v1 1/1] lib/igt_core: flush output on each line
Message-ID: <ucockssbabmd3orxmsridophyscseb2jb4pzabpvhevstsprzn@32xk2sugvgue>
References: <20260325114901.256229-1-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325114901.256229-1-jan.sokolowski@intel.com>
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

On Wed, Mar 25, 2026 at 12:49:01PM +0100, Jan Sokolowski wrote:
> It was found while running tests that if a test launches threads with
> even more subthreads, some igt_debug calls might not print their lines.
> 
> Fflush after each line to make sure we see everything we want to see.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  lib/igt_core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 65325f08d..ed4f48d86 100644
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
> @@ -3309,6 +3307,11 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>  		_log_line_fprintf(file, "%s%s", thread_id, line);
>  	}
>  
> +	/* Ensure output is flushed explicitly, as concurrent test threads
> +	 * may otherwise cause messages to be dropped or reordered.
> +	 */
> +	fflush(file);

stderr is not buffered, so I bet this is no-op call.
fflush(stdout) is imo enough here. But I agree, fflush on the end
on stdout of this critical section is better.

With or without nit addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +
>  	pthread_mutex_unlock(&print_mutex);
>  
>  out:
> -- 
> 2.43.0
> 
