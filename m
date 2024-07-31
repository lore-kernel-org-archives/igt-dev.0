Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2B6C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 15:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DB210E64D;
	Wed, 31 Jul 2024 15:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TC5iG4+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD85110E64B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722438172; x=1753974172;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xItlm4/mLu+ZYJNEJJ5k27IaRNFp/ieX9hBkXjQPiOU=;
 b=TC5iG4+bp4NzrH4abpjI213GicED6jonDee66Xx3chaq0mb2Xi2+ke5k
 dJW0/NhQL6rebu2L3T70Ixl154DVDuOIHNhHySnjO+pIQuqwTc2KLR08q
 Q0TkrmkSFZzuiish93vfM2CHgyjkkLO+FoAfKqi4pFrH2n2CZbSLn2Pr4
 jCG2tQqeTC1dEoy5bTkOx/GVbP497X/wk37xe+8BSS8mritGYbda++p2x
 2CtSG/wBE2iPb92N4krXHYOpp1n9ovEY0jFa3Ss+hXOJj+/GxZiA43o7j
 hEDRT+dFD6eNSB5+QOJxVFVKzBeXI62K+aMyoLSWLSD/BuWV1QaSoR/jd w==;
X-CSE-ConnectionGUID: YQ35CyL5TdWRC4s5Rq7naw==
X-CSE-MsgGUID: vNTOVgkvSq+tAEiKhFLb+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20141593"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20141593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 08:02:52 -0700
X-CSE-ConnectionGUID: U0lYKPyISGS0SvxejYFSjg==
X-CSE-MsgGUID: UZYbVgGyTqq6AT6emFrhhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59769579"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 08:02:50 -0700
Date: Wed, 31 Jul 2024 17:02:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 tursulin@igalia.com, lukasz.laguna@intel.com
Subject: Re: [PATCH v3 i-g-t 6/6] benchmarks/gem_wsim: Option to list
 physical engines
Message-ID: <20240731150247.e4xsvlvqoydoboiw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 tursulin@igalia.com, lukasz.laguna@intel.com
References: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
 <20240729175219.1636694-7-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729175219.1636694-7-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2024-07-29 at 19:52:19 +0200, Marcin Bernatowicz wrote:
> Added command line option (-l) to list physical engines.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/gem_wsim.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 0c022f9ce..c4fd00a6a 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -2989,6 +2989,7 @@ static void print_help(void)
>  "  -f <scale>        Scale factor for batch durations.\n"
>  "  -F <scale>        Scale factor for delays.\n"
>  "  -L                List GPUs.\n"
> +"  -l                List physical engines.\n"
>  "  -D <gpu>          One of the GPUs from -L.\n"
>  	);
>  }
> @@ -3048,10 +3049,42 @@ add_workload_arg(struct w_arg *w_args, unsigned int nr_args, char *w_arg,
>  	return w_args;
>  }
>  
> +static void list_engines(void)
> +{
> +	struct intel_engines *engines = query_engines();
> +	int engine_class_count[NUM_ENGINE_CLASSES] = {};
> +	unsigned int i;
> +
> +	for (i = 0; i < engines->nr_engines; ++i) {
> +		igt_assert_lt(engines->engines[i].engine_class, NUM_ENGINE_CLASSES);
> +		engine_class_count[engines->engines[i].engine_class]++;
> +	}
> +
> +	for (i = 0; i < engines->nr_engines; ++i) {
> +		if (engine_class_count[engines->engines[i].engine_class] > 1)
> +			printf("%s%u",
> +			       intel_engine_class_string(engines->engines[i].engine_class),
> +			       engines->engines[i].engine_instance + 1);
> +		else
> +			printf("%s",
> +			       intel_engine_class_string(engines->engines[i].engine_class));
> +
> +		if (is_xe && engines->engines[i].gt_id)
> +			printf("-%u", engines->engines[i].gt_id);
> +
> +		if (verbose > 3)
> +			printf(" [%d:%d:%d]", engines->engines[i].engine_class,
> +			       engines->engines[i].engine_instance,
> +			       engines->engines[i].gt_id);
> +		printf("\n");
> +	}
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	struct igt_device_card card = { };
>  	bool list_devices_arg = false;
> +	bool list_engines_arg = false;
>  	unsigned int repeat = 1;
>  	unsigned int clients = 1;
>  	unsigned int flags = 0;
> @@ -3074,11 +3107,14 @@ int main(int argc, char **argv)
>  	master_prng = time(NULL);
>  
>  	while ((c = getopt(argc, argv,
> -			   "LhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
> +			   "LlhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
>  		switch (c) {
>  		case 'L':
>  			list_devices_arg = true;
>  			break;
> +		case 'l':
> +			list_engines_arg = true;
> +			break;
>  		case 'D':
>  			device_arg = strdup(optarg);
>  			break;
> @@ -3199,6 +3235,11 @@ int main(int argc, char **argv)
>  	if (is_xe)
>  		xe_device_get(fd);
>  
> +	if (list_engines_arg) {
> +		list_engines();
> +		goto out;
> +	}
> +
>  	if (!nr_w_args) {
>  		wsim_err("No workload descriptor(s)!\n");
>  		goto err;
> -- 
> 2.31.1
> 
