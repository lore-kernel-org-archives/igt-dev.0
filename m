Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA47C3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 12:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2EB10E631;
	Wed, 14 May 2025 12:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bfj1vOsG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D857410E631
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747227037; x=1778763037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hm14RmrtFmp/ceY6GYJndzPvJlsRKSyj7TVn/hLXI5k=;
 b=Bfj1vOsGM3xdNHq2R7F4COXEU55rHiJJaBGhd8jbrZhKW82g89GyNs/h
 U7DEC6S7DxYRxZ7c92Lr1+mtRPezLtg7VVwQRjXkQLF4PQ92Yr5ULBymZ
 QxJRSY93eGsEgxYL7Uav0+IcFKoE3QvSyaYS4CbLbt0f5jWySk1oM5R+9
 pusiCDOQkqD5D5WMI2Wu4875ruQHUg/9MFAp1NNIYdpWrmDG3QCzW7TYl
 EIPkGHObVkAacZMHSEh3gy4wRxgdpKfU/f+CTJLTX3xMURn3M43tKm5cM
 Am4UATXW6aF1+nT0X3CzxJmBOZuV/ZIpvN/47I2gNKG2KiyO8kF8k4muH Q==;
X-CSE-ConnectionGUID: Y+8/g/JfQdimU83MaoGcxA==
X-CSE-MsgGUID: S0cPJvccRtCEillYdP74qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59753273"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="59753273"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:50:36 -0700
X-CSE-ConnectionGUID: a22S1Y/6QSaQVhKG8kPx7A==
X-CSE-MsgGUID: PM88EgrpQhqWnBSXlSPdtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="137951385"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:50:34 -0700
Date: Wed, 14 May 2025 14:50:30 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com, 
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 06/15] tools/gputop: find program name from command line
Message-ID: <7vjdzkakpuse56evjll5tifyv5d6jjhoka2gwcvvjgcxxe2ypn@npyrokadvx6m>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-7-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507160148.53857-7-jeevaka.badrappan@intel.com>
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

On Wed, May 07, 2025 at 04:01:39PM +0000, Jeevaka Prabu Badrappan wrote:
> program_invocation_short_name is global variable provided by glibc.
> 
> Inorder to get the igt built for Android(without glibc), find the
> program from command line without using program_invocation_short_name.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  tools/gputop.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 43b01f566..457a31969 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -335,15 +335,22 @@ struct gputop_args {
>  	unsigned long delay_usec;
>  };
>  
> -static void help(void)
> +static void help(char* full_path)

Minor nit 'char* full_path' -> 'char *full_path'.

With that:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  {
> +	const char *short_program_name = strrchr(full_path, '/');
> +	if (short_program_name) {
> +		short_program_name++;
> +	} else {
> +		short_program_name = full_path;
> +	}
> +
>  	printf("Usage:\n"
>  	       "\t%s [options]\n\n"
>  	       "Options:\n"
>  	       "\t-h, --help                show this help\n"
>  	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>  	       "\t-n, --iterations =NUMBER  number of executions\n"
> -	       , program_invocation_short_name);
> +	       , short_program_name);
>  }
>  
>  static int parse_args(int argc, char * const argv[], struct gputop_args *args)
> @@ -384,7 +391,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>  			}
>  			break;
>  		case 'h':
> -			help();
> +			help(argv[0]);
>  			return 0;
>  		default:
>  			fprintf(stderr, "Unkonwn option '%c'.\n", c);
> -- 
> 2.34.1
> 
