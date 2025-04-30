Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E993BC3ABAC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 17:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A3010E751;
	Wed, 30 Apr 2025 17:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYOKF/Cz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6235E10E751
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746032836; x=1777568836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZAf8myU4E3kL21r/iW3BZgygW1dXd+bdaMqptbtg1dA=;
 b=mYOKF/CzDBKvsrGEED2ncROPbQmAdMWp3KN2kdIrJKyOBNtCNy8TKZZ4
 F9AslCzypQ72Qsi9+YH9eFUgD7s09hqXb1fj1JalPepSDt8gcu/VTtSg4
 fkFpEwSYsB6Wr59JxWguyXvFFbotFCRKxw2LA9jmEJpbKYhdcVwQvNPuk
 8QvSMBrpJRoqZjbAGchFK5f9gITWvV2lvSfky7XCPXSBVUGN2ORpTgMZ7
 gJveOyM08A/hJW0vQ3TKdFlfhMv6WC1b6Tsm2B9/bgg1TChtkDBNB9gZY
 GLR/GmDPvr6AbOhrp7W/nGtcDkUegVgQJoplNqv8OOkhhIc6WwkkiCYP8 g==;
X-CSE-ConnectionGUID: N6Q2iffsROespRsSCgVEvA==
X-CSE-MsgGUID: zO+1ZfxiSLKERC45kERnKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65117996"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="65117996"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 10:07:16 -0700
X-CSE-ConnectionGUID: JSNgUX87RtqH7W/r57V30w==
X-CSE-MsgGUID: xzWR0QEQTB+hF6wyemivhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="134677303"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 10:07:15 -0700
Date: Wed, 30 Apr 2025 19:07:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, sapna1.singh@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com
Subject: Re: [PATCH 2/5] Replace program_invocation_short_name with prog_name
 from command line
Message-ID: <20250430170711.tjkxpf6brif6n6r5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, sapna1.singh@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com
References: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
 <20250429204000.41537-3-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429204000.41537-3-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-04-29 at 20:39:57 +0000, Jeevaka Prabu Badrappan wrote:

write in subject which file you changed, so instead:

[PATCH 2/5] Replace program_invocation_short_name with prog_name from command line

write for example:

[PATCH 2/5] tools/gputop: find program name from command line

and implement it yourself in some sensible way,
for example search for last '/' and take nsmae from that.

Regards,
Kamil

> program_invocation_short_name is global variable provided by glibc.
> 
> Inorder to get the igt built for Android(without glibc), replaced the
> program_invocation_short_name with the prog_name.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  tools/gputop.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 43b01f566..ef868f670 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -335,7 +335,7 @@ struct gputop_args {
>  	unsigned long delay_usec;
>  };
>  
> -static void help(void)
> +static void help(char* prog_name)
>  {
>  	printf("Usage:\n"
>  	       "\t%s [options]\n\n"
> @@ -343,7 +343,7 @@ static void help(void)
>  	       "\t-h, --help                show this help\n"
>  	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>  	       "\t-n, --iterations =NUMBER  number of executions\n"
> -	       , program_invocation_short_name);
> +	       , prog_name);
>  }
>  
>  static int parse_args(int argc, char * const argv[], struct gputop_args *args)
> @@ -384,7 +384,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>  			}
>  			break;
>  		case 'h':
> -			help();
> +			help(argv[0]);
>  			return 0;
>  		default:
>  			fprintf(stderr, "Unkonwn option '%c'.\n", c);
> -- 
> 2.49.0
> 
