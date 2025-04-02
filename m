Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B29C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 11:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606B510E70B;
	Wed,  2 Apr 2025 11:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7atYVta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BA010E70B
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 11:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743592552; x=1775128552;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Hqo+wRibWUrx+d3N+mIR41Bkskta89B1/ozQrzZVcOg=;
 b=e7atYVtaDNeerdFqBpySupsCpAh6/hzDEzp5XshvMokbsujU6lyitgJr
 SjyIY039Ir5Qybpu8Lpr9v1vXORQLaZCckNE7rlwqEv19mSDgCxeD4eEs
 ENldoJ/UvhhG0qkMpK2fUQL1FjMRGB/wItmLbELsEXJltv+WN6322JKeS
 +f3femD3LrRSC5q4qt8kbMkMog8m/ta+IBcEMsLD+6Dtg71Xl+NThCuzW
 e6wfZ5zcFYl135gue1HR48AVMX5U1ZdyveNUzm8iNKBnhaxFt5aog7ea7
 ZCUkGE3NOkeU07y7CngVYj6FNqwpG66WXG3CCMQVfkzTxuWQDWSArLdFl Q==;
X-CSE-ConnectionGUID: rbGcgMIlSTyFo5qtS9r6pA==
X-CSE-MsgGUID: OvMw7IoCQ0mqCE/3JNAhNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55943496"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="55943496"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 04:15:51 -0700
X-CSE-ConnectionGUID: EGOv/n29Q1aM1P99Sy98Lw==
X-CSE-MsgGUID: kQtWIlMyQVqF95fm+G5UwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="131647449"
Received: from dkreft-mobl3.ger.corp.intel.com (HELO [10.246.0.151])
 ([10.246.0.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 04:15:50 -0700
Message-ID: <8e72dab2-1bb0-41c4-8a1d-d409689cd61c@linux.intel.com>
Date: Wed, 2 Apr 2025 13:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/1] runner/executor: Use bootime for time checks
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20250328163342.119140-1-kamil.konieczny@linux.intel.com>
 <20250328163342.119140-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250328163342.119140-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Kamil,

On 3/28/2025 5:33 PM, Kamil Konieczny wrote:
> Runner is printing time to stdout/stderr with CLOCK_BOOTTIME but
> when measuring time for a test it is using an igt library which
> uses CLOCK_MONOTONIC. This leads to an errors when calculating
> time left for tests using suspend or hibernate. For example log:
> 
> [77.376851] [020/123] (932s left) kms_flip (2x-flip-vs-suspend)
> [77.592412] Starting subtest: 2x-flip-vs-suspend
> [77.604996] Starting dynamic subtest: AB-DP2-HDMI-A3
> [115.135795] Dynamic subtest AB-DP2-HDMI-A3: SUCCESS (6.776s)
> 
> shows test runs for around 6 seconds, while wall time shows
> it took around 38 seconds.
> 
>   Create a separate, runner specific function for time measure
> and use it where current time is needed.
> 
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Reported-by: Karol Krol <karol.krol@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/executor.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 9c8bf90f0..30e2420af 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -47,6 +47,12 @@ static struct {
>  	size_t num_dogs;
>  } watchdogs;
>  
> +static void runner_gettime(struct timespec *tv)
> +{
> +	if (clock_gettime(CLOCK_BOOTTIME, tv))
> +		clock_gettime(CLOCK_REALTIME, tv);
> +}

Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>



> +
>  __attribute__((format(printf, 2, 3)))
>  static void __logf__(FILE *stream, const char *fmt, ...)
>  {
> @@ -54,8 +60,7 @@ static void __logf__(FILE *stream, const char *fmt, ...)
>  	struct timespec tv;
>  	va_list ap;
>  
> -	if (clock_gettime(CLOCK_BOOTTIME, &tv))
> -		clock_gettime(CLOCK_REALTIME, &tv);
> +	runner_gettime(&tv);
>  	fprintf(stream, "[%ld.%06ld] ", tv.tv_sec, tv.tv_nsec / 1000);
>  
>  	va_start(ap, fmt);
> @@ -961,7 +966,7 @@ static int monitor_output(pid_t child,
>  	bool socket_comms_used = false; /* whether the test actually uses comms */
>  	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
>  
> -	igt_gettime(&time_beg);
> +	runner_gettime(&time_beg);
>  	time_last_activity = time_last_subtest = time_killed = time_beg;
>  
>  	if (errfd > nfds)
> @@ -1024,7 +1029,7 @@ static int monitor_output(pid_t child,
>  			return -1;
>  		}
>  
> -		igt_gettime(&time_now);
> +		runner_gettime(&time_now);
>  
>  		/* TODO: Refactor these handlers to their own functions */
>  		if (outfd >= 0 && FD_ISSET(outfd, &set)) {

