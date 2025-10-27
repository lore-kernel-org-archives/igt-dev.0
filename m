Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F881CCF9EC
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 11:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210EA10E07F;
	Mon, 27 Oct 2025 11:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmQgl0R+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D687A10E07F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761565387; x=1793101387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5sik4FK7WYtAm+G3qgo7TigOnFi9nikso6r7R6IsnD8=;
 b=YmQgl0R+RkuliVXYr1j2ipugjGcEkkUKGdI9IruKSzCcnHOM8B0zpH0m
 XXRJQljrKesyhhRy8ZAbu+oNKVyXhhuT3lX8sx/oQNC/SX4fzwEFnif2g
 bIC0rjCDzMjf4n0/JK3U6AtDDTgOFspsHZElchtdHSbXkMvqI5yeL2Ec4
 yg/oEs0jOg2RxkUUFHV/1jSHPKrOGilr7eklHa6FZ45IYNk8IbkMUINuA
 aUD2Bhxnx3K9tTO0XIO3EERw56qH4L/lKK1bgowT3xquNLbs/mHUo088g
 5K2ngNzpyckBdvj0SegFWQIw06qRI5V2vkkCpFpGjFxKUK1h8a9tIzQ7W Q==;
X-CSE-ConnectionGUID: Tjl6XNAXScOButwY07WbFw==
X-CSE-MsgGUID: ZIfNBwwnQOaeiNSK3Pbjsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67284336"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="67284336"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:43:07 -0700
X-CSE-ConnectionGUID: ohTyzbFuSm+YAzgKdtjGLw==
X-CSE-MsgGUID: kLVrpWRiTj+uvWRhTC82sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="190154217"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:43:05 -0700
Date: Mon, 27 Oct 2025 12:43:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 dmitry.v.rogozhkin@intel.com
Subject: Re: [PATCH i-g-t 2/3] intel_gpu_top: Refactor flag toggling logic
Message-ID: <20251027114303.ye7yjc47oflyz6gp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 dmitry.v.rogozhkin@intel.com
References: <cover.1761225010.git.sebastian.brzezinka@intel.com>
 <d45675703a882bf4b718c3e4427912b911a9b868.1761225010.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d45675703a882bf4b718c3e4427912b911a9b868.1761225010.git.sebastian.brzezinka@intel.com>
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
On 2025-10-23 at 13:21:33 +0000, Sebastian Brzezinka wrote:
> Introduce `toggle_flag_and_set_msg()` helper to simplify repetitive
> flag toggling and header message updates. This reduces code duplication.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_gpu_top.c | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index f1b7ab46f..1bd88ba7c 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -2396,6 +2396,12 @@ static void process_help_stdin(void)
>  	}
>  }
>  
> +static void toggle_flag_and_set_msg(bool *flag, const char *msg_on, const char *msg_off)
> +{
> +	*flag ^= true;
> +	header_msg = *flag ? msg_on : msg_off;
> +}
> +
>  static void process_normal_stdin(void)
>  {
>  	for (;;) {
> @@ -2411,18 +2417,14 @@ static void process_normal_stdin(void)
>  			stop_top = true;
>  			break;
>  		case '1':
> -			class_view ^= true;
> -			if (class_view)
> -				header_msg = "Aggregating engine classes.";
> -			else
> -				header_msg = "Showing physical engines.";
> +			toggle_flag_and_set_msg(&class_view,
> +						"Aggregating engine classes.",
> +						"Showing physical engines.");
>  			break;
>  		case 'i':
> -			filter_idle ^= true;
> -			if (filter_idle)
> -				header_msg = "Hiding inactive clients.";
> -			else
> -				header_msg = "Showing inactive clients.";
> +			toggle_flag_and_set_msg(&filter_idle,
> +						"Hiding inactive clients.",
> +						"Showing inactive clients.");
>  			break;
>  		case 'n':
>  			numeric_clients ^= true;
> @@ -2434,18 +2436,14 @@ static void process_normal_stdin(void)
>  			in_help = true;
>  			break;
>  		case 'H':
> -			aggregate_pids ^= true;
> -			if (aggregate_pids)
> -				header_msg = "Aggregating clients.";
> -			else
> -				header_msg = "Showing individual clients.";
> +			toggle_flag_and_set_msg(&aggregate_pids,
> +						"Aggregating clients.",
> +						"Showing individual clients.");
>  			break;
>  		case 'm':
> -			aggregate_regions ^= true;
> -			if (aggregate_regions)
> -				header_msg = "Aggregating memory regions.";
> -			else
> -				header_msg = "Showing memory regions.";
> +			toggle_flag_and_set_msg(&aggregate_regions,
> +						"Aggregating memory regions.",
> +						"Showing memory regions.");
>  			break;
>  		};
>  	}
> -- 
> 2.34.1
> 
