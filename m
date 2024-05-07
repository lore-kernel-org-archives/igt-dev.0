Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B461C25B4F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 18:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368191125B3;
	Tue,  7 May 2024 18:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAcgaPn3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5671125B3
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 18:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715106258; x=1746642258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1L9ZraG55DLOLSeDcIAgzMZJd9jvKRicAlL9brzOg+s=;
 b=SAcgaPn3x0hLCfTrOw2XztSijvAf/Avj51aoU7cBtFTMljTEUXrecg5z
 VNvwB0pWzJVwxvtpnvz1xmZmL9FCxX8Pe8E7ruaXDes0kzkyCu97+wD4z
 sG/8rhZb510wPxaHHNwb+rlfzRl+dvK1beCSA9mrKrtLrcGw+yQ0vRmrf
 aEr7SqMWW69o/9dMjKHR8QCGFnNT7igHRw2S0UY9b7Xpvx5J2Vc3Bu9Q8
 jGNTxg52AAZiegF76EMpS7PyIfaJ8g9DnN3GpwQPVAAyOwyEqv2w1Coz+
 7oeRW3nf7GrzZwfkpUwCEefQY+4kNqCLRlcx7BBsimf83L4Ztxbo3VyGi g==;
X-CSE-ConnectionGUID: Z8avgFB/S9ihAzvegK2ucA==
X-CSE-MsgGUID: s+YX/X+NQ62q5LKoUJKAPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10774162"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="10774162"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 11:24:18 -0700
X-CSE-ConnectionGUID: LfdTQF0SQ3CyTBcO+KM9xg==
X-CSE-MsgGUID: YjrUEkPNTpy5cucD7eYQWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="28494976"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 11:24:16 -0700
Date: Tue, 7 May 2024 20:24:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 2/4] gputop: Add option parsing
Message-ID: <20240507182414.ex5avcnl2sm5ddf4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240501173303.115737-1-lucas.demarchi@intel.com>
 <20240501173303.115737-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240501173303.115737-3-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-05-01 at 12:33:01 -0500, Lucas De Marchi wrote:
> Add skeleton for option parsing, with just a -h/--help to be used
> for additional options later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/gputop.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 7fd9e9790..481e79753 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -292,11 +292,62 @@ static void clrscr(void)
>  	printf("\033[H\033[J");
>  }
>  
> +struct gputop_args {
> +};
> +
> +static void help(void)
> +{
> +	printf("Usage:\n"
> +	       "\t%s [options]\n\n"
> +	       "Options:\n"
> +	       "\t-h, --help                show this help\n"
> +	       , program_invocation_short_name);
> +}
> +
> +static int parse_args(int argc, char * const argv[], struct gputop_args *args)
> +{
> +	static const char cmdopts_s[] = "h";
> +	static const struct option cmdopts[] = {
> +	       {"help", no_argument, 0, 'h'},
> +	       { }
> +	};
> +
> +	/* defaults */
> +	memset(args, 0, sizeof(*args));
> +
> +	for (;;) {
> +		int c, idx = 0;
> +
> +		c = getopt_long(argc, argv, cmdopts_s, cmdopts, &idx);
> +		if (c == -1)
> +			break;
> +
> +		switch (c) {
> +		case 'h':
> +			help();
> +			return 0;
> +		default:
> +			fprintf(stderr, "Unkonwn option '%c'.\n", c);
> +			return -1;
> +		}
> +	}
> +
> +	return 1;
> +}
> +
>  int main(int argc, char **argv)
>  {
> +	struct gputop_args args;
>  	unsigned int period_us = 2e6;
>  	struct igt_drm_clients *clients = NULL;
>  	int con_w = -1, con_h = -1;
> +	int ret;
> +
> +	ret = parse_args(argc, argv, &args);
> +	if (ret < 0)
> +		return EXIT_FAILURE;
> +	if (!ret)
> +		return EXIT_SUCCESS;
>  
>  	clients = igt_drm_clients_init(NULL);
>  	if (!clients)
> -- 
> 2.45.0
> 
