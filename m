Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3663CCF9E5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 11:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CEB10E07F;
	Mon, 27 Oct 2025 11:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjN4t6Iu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFB110E07F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761565225; x=1793101225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/r1F2/10bXmu5PEnI+Zfkff1Wf8AnLqGaqK1deibrzY=;
 b=SjN4t6Iuo8NJFNDeZ4oq3ML97UJlH10veKOA1cNt5+BL2JD5Ycsa/LMF
 IU4OsnpDbxajfJ3JVoygQn3Z3ZCEe7kLkonxMAPmYCQBmsHuQKN/jBEvk
 ievjhWdPZgrzSI32whxEWZHKN5ryutLsF0Ek7NSoF99LbgvlOM/g9fGnI
 BPnM6epwSSSDoINDTs2TEBBnMZIq38eQKfQzc/f+XrsiaCJGlH790Fa9A
 O/iXZNdT60BPOzLVjWHY/vY865G0Q5xehUfAVeSkhMdzvM4E6aco3YsV7
 p147VQeLLpOy7uSzJ+ti+LOIT7c2CtHnJV7DhlWhUWGu0JmagHcTu7SXq g==;
X-CSE-ConnectionGUID: LX+1Z8L5SQWe7/cCcGZ13Q==
X-CSE-MsgGUID: dBSbpEoXSjiLUJTpO75C4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66254925"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="66254925"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:40:25 -0700
X-CSE-ConnectionGUID: Pxdn/faCT0eRuXOyl5YTRw==
X-CSE-MsgGUID: Zf9w4m5+SdiVdGICRga5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="222231235"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:40:23 -0700
Date: Mon, 27 Oct 2025 12:40:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 dmitry.v.rogozhkin@intel.com
Subject: Re: [PATCH i-g-t 1/3] intel_gpu_top: Show interactive help in usage
 output
Message-ID: <20251027114007.i3vfy7lhxldmcuhz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 dmitry.v.rogozhkin@intel.com
References: <cover.1761225010.git.sebastian.brzezinka@intel.com>
 <1d0a1c1a321f3d5f78973b74c99836447b986085.1761225010.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1d0a1c1a321f3d5f78973b74c99836447b986085.1761225010.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2025-10-23 at 13:21:24 +0000, Sebastian Brzezinka wrote:

small nit about subject, please use prefix 'tools/' so subject
will be:

[PATCH i-g-t 1/3] tools/intel_gpu_top: Show interactive help in usage output

No need for resend, it could be added at merge.

> Moved show_help_screen() closer to its usage in usage(). Updated
> the usage output to include a message about accessing interactive
> help with 'h'.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

With above addressed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_gpu_top.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 54e71e559..f1b7ab46f 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1033,6 +1033,20 @@ print_percentage_bar(double percent, double max, int max_len, bool numeric)
>  
>  #define DEFAULT_PERIOD_MS (1000)
>  
> +static void show_help_screen(void)
> +{
> +	printf("Help for interactive commands:\n\n"
> +"    '1'    Toggle between aggregated engine class and physical engine mode.\n"
> +"    'n'    Toggle display of numeric client busyness overlay.\n"
> +"    's'    Toggle between sort modes (runtime, total runtime, pid, client id).\n"
> +"    'i'    Toggle display of clients which used no GPU time.\n"
> +"    'H'    Toggle between per PID aggregation and individual clients.\n"
> +"    'm'    Toggle between aggregated memory regions and full breakdown.\n"
> +"\n"
> +"    'h' or 'q'    Exit interactive help.\n"
> +"\n");
> +}
> +
>  static void
>  usage(const char *appname)
>  {
> @@ -1053,6 +1067,8 @@ usage(const char *appname)
>  		"\t[-m]            Default to showing all memory regions.\n"
>  		"\n",
>  		appname, DEFAULT_PERIOD_MS);
> +	printf("To access interactive help, press 'h' while the application is running.\n");
> +	show_help_screen();
>  	igt_device_print_filter_types();
>  }
>  
> @@ -2470,21 +2486,6 @@ static bool has_drm_fdinfo(const struct igt_device_card *card)
>  	return cnt > 0;
>  }
>  
> -static void show_help_screen(void)
> -{
> -	printf(
> -"Help for interactive commands:\n\n"
> -"    '1'    Toggle between aggregated engine class and physical engine mode.\n"
> -"    'n'    Toggle display of numeric client busyness overlay.\n"
> -"    's'    Toggle between sort modes (runtime, total runtime, pid, client id).\n"
> -"    'i'    Toggle display of clients which used no GPU time.\n"
> -"    'H'    Toggle between per PID aggregation and individual clients.\n"
> -"    'm'    Toggle between aggregated memory regions and full breakdown.\n"
> -"\n"
> -"    'h' or 'q'    Exit interactive help.\n"
> -"\n");
> -}
> -
>  static int gettime(struct timespec *ts)
>  {
>  	memset(ts, 0, sizeof(*ts));
> -- 
> 2.34.1
> 
