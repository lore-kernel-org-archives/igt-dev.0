Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CE3C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 18:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7161125BB;
	Tue,  7 May 2024 18:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJd5Iru8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434301125C2
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 18:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715106421; x=1746642421;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bdzPfvNw8wONNrtnv2DbQCKK9Izi66glHK9XfV0bW4I=;
 b=nJd5Iru8jXsJYqzcJlJjbj3DT1dF82U8AfBt90b0TNwzFOGXHRGfZwkb
 u52yxH2zrixULcYU4iGXKmWRnclUoDKxImmhHX4A4djm+8hAX5BcCQTb2
 pfS9Uvri2q3Ck/tClKVNb7ar/SYDaOEm8AkSMR3RIrgoTsOOJXdyHd04c
 Opi+6TrkoZVX6UMHbD1u2Z+jMiFytgJ4iyud97RZPoHso4nhvjOj20ekU
 gc6hNyI7yVGx10XhLX1OW/jfNZJsLxhiW0c6NGPoNxaoj0Ubgsm6lRtBe
 OecxZXP/6/ukbN6h5F3bZo4JuWhy8PpnwyDqluMZcyxRTp5vnUgya31yH Q==;
X-CSE-ConnectionGUID: VLxSST0uS/WyLuyjTKD5zQ==
X-CSE-MsgGUID: q+ymuMjYRBWl+PXWYuSIjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14714501"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="14714501"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 11:27:01 -0700
X-CSE-ConnectionGUID: sCuDzMYvTqW0nzbYtPSIWQ==
X-CSE-MsgGUID: wpbyRplJSjKfJHm4BOontQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="51820425"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 11:26:59 -0700
Date: Tue, 7 May 2024 20:26:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 3/4] gputop: Allow to limit number of executions
Message-ID: <20240507182656.mlmbxzctvotqmtwz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240501173303.115737-1-lucas.demarchi@intel.com>
 <20240501173303.115737-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240501173303.115737-4-lucas.demarchi@intel.com>
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
On 2024-05-01 at 12:33:02 -0500, Lucas De Marchi wrote:
> Add argument to limit number of executions, similar to the one accepted
> by `top`. This allows testing changes and optimizations more easily.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/gputop.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 481e79753..1ac382a7e 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -293,6 +293,7 @@ static void clrscr(void)
>  }
>  
>  struct gputop_args {
> +	long n_iter;
>  };
>  
>  static void help(void)
> @@ -301,19 +302,22 @@ static void help(void)
>  	       "\t%s [options]\n\n"
>  	       "Options:\n"
>  	       "\t-h, --help                show this help\n"
> +	       "\t-n, --iterations =NUMBER  number of executions\n"
>  	       , program_invocation_short_name);
>  }
>  
>  static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>  {
> -	static const char cmdopts_s[] = "h";
> +	static const char cmdopts_s[] = "hn:";
>  	static const struct option cmdopts[] = {
>  	       {"help", no_argument, 0, 'h'},
> +	       {"iterations", required_argument, 0, 'n'},
>  	       { }
>  	};
>  
>  	/* defaults */
>  	memset(args, 0, sizeof(*args));
> +	args->n_iter = -1;
>  
>  	for (;;) {
>  		int c, idx = 0;
> @@ -323,6 +327,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>  			break;
>  
>  		switch (c) {
> +		case 'n':
> +			args->n_iter = strtol(optarg, NULL, 10);
> +			break;
>  		case 'h':
>  			help();
>  			return 0;
> @@ -342,6 +349,7 @@ int main(int argc, char **argv)
>  	struct igt_drm_clients *clients = NULL;
>  	int con_w = -1, con_h = -1;
>  	int ret;
> +	long n;
>  
>  	ret = parse_args(argc, argv, &args);
>  	if (ret < 0)
> @@ -349,13 +357,15 @@ int main(int argc, char **argv)
>  	if (!ret)
>  		return EXIT_SUCCESS;
>  
> +	n = args.n_iter;
> +
>  	clients = igt_drm_clients_init(NULL);
>  	if (!clients)
>  		exit(1);
>  
>  	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>  
> -	for (;;) {
> +	while (n != 0) {
>  		struct igt_drm_client *c, *prevc = NULL;
>  		int i, engine_w = 0, lines = 0;
>  
> @@ -381,6 +391,8 @@ int main(int argc, char **argv)
>  			printf("\n");
>  
>  		usleep(period_us);
> +		if (n > 0)
> +			n--;
>  	}
>  
>  	igt_drm_clients_free(clients);
> -- 
> 2.45.0
> 
