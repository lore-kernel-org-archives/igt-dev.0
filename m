Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359C1CCF9E5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 13:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D846810E06C;
	Mon, 27 Oct 2025 13:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vn6QnrTN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D3B10E06C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761573245; x=1793109245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2X8kGUL9wKi/KsDfU46XNt3f+TGBb6lZ5hL4II3cAOE=;
 b=Vn6QnrTNt00EEZFKEloapuPhtSTruaNR/ZYHJGwlZXfxfMZY35e9e8pq
 N+JDbOmq4QkvPIzrR/4GsEOMH/qfNd7gYUZWVSaL7937RpghJuvg53zbj
 Wv1YI5IccX0SFPQkgXGy87OVrTv59X7ayhDcwLJUq/DXxwMkck1vLLxDG
 se71mwnf3uedE5rUit2dgw2QyxCEF9s1d8jfs3h/pRekZZsgMy8O6KoK7
 t9/PA83xCATw181QBgKPMot8m+IIRHVryYMOhosvzDTphKekxU0GSA9mQ
 y0WJsZFyqxEQ5+vgsCfmj9hOunHXE2mj58hD1m6vym9C36t4hYvEwaodG Q==;
X-CSE-ConnectionGUID: tn976HeFQT6md5o5lv8D7A==
X-CSE-MsgGUID: KkkdaJrFSUyGVS5hNyKhHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67295090"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="67295090"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:54:04 -0700
X-CSE-ConnectionGUID: IqaedXn8S/urglR8uRwbYg==
X-CSE-MsgGUID: Ud7rVHNyT4arotRCU9p8nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="189360040"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:54:03 -0700
Date: Mon, 27 Oct 2025 14:53:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Simon Fairweather <simon.n.fairweather@gmail.com>
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: Add iteration option -n
Message-ID: <20251027135351.wrwx33pyjax23pnc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org,
 Simon Fairweather <simon.n.fairweather@gmail.com>
References: <20251016095649.31446-1-kamil.konieczny@linux.intel.com>
 <vf4drxg7dt5etivlwlgvbrxomkodvwrfpjm4jplicb3udecki4@uv5s3zp6t274>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <vf4drxg7dt5etivlwlgvbrxomkodvwrfpjm4jplicb3udecki4@uv5s3zp6t274>
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

Hi Krzysztof,
On 2025-10-17 at 07:29:59 +0000, Krzysztof Karas wrote:
> Hi Kamil and Simon,
> 
> > When using option -J or -c default is looping forever until user
> > break process. Lets introduce new option -n <number> and break
> > printing after reaching given number of iterations.
> > 
> > v2: corrected whitespaces, extended description (Kamil)
> > 
> > Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tools/intel_gpu_top.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> > index 54e71e559..4bcac4b47 100644
> > --- a/tools/intel_gpu_top.c
> > +++ b/tools/intel_gpu_top.c
> > @@ -1051,6 +1051,7 @@ usage(const char *appname)
> >  		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
> >  		"\t[-p]            Default to showing physical engines instead of classes.\n"
> >  		"\t[-m]            Default to showing all memory regions.\n"
> > +		"\t[-n]            Specify number of iterations. Can be used with -J or -c.\n"
> I built this tool with the proposed change and found out that -n
> applies regardless of -J or -c being added - it gives an overall
> timeout for the application. If this is what you were aiming
> for, then I'd rephrase:
> "Specify number of iterations. Can be used with -J or -c."
> to something like:
> "Specify application runtime: n * refresh period (-s option)."
> or:
> "Specify application runtime n * refresh period (-s option).
> Useful with -J and -c options."
> if you want to hint it's usage.

Good point, I will use former with somewhat more elaborate:

"\t[-n <number>]   Specify application running time as <number> * <refresh period>\n"

and will drop mension of -s option.

> 
> >  		"\n",
> >  		appname, DEFAULT_PERIOD_MS);
> >  	igt_device_print_filter_types();
> > @@ -2618,9 +2619,11 @@ int main(int argc, char **argv)
> >  	struct igt_device_card card;
> >  	char *codename = NULL;
> >  	struct timespec ts;
> > +	int iteration_value, iteration_count = 0;
> > +	bool iteration_check = false;
> I think iteration_check flag is redundant here, because you
> could use iteration_value as the indicator:
>  1) set iteration_value to 0
>  2) if -n is used overwrite the variable to whatever user wants
>  3) check later if the variable has value
>  4) a) if it does then increment iteration_count
>     b) if not then just spin indefinitely

Good point, I dropped iteration_check var.

> 
> >  	/* Parse options */
> > -	while ((ch = getopt(argc, argv, "o:s:d:mpcJLlh")) != -1) {
> > +	while ((ch = getopt(argc, argv, "o:s:d:n:mpcJLlh")) != -1) {
> >  		switch (ch) {
> >  		case 'o':
> >  			output_path = optarg;
> > @@ -2631,6 +2634,10 @@ int main(int argc, char **argv)
> >  		case 'd':
> >  			opt_device = strdup(optarg);
> >  			break;
> > +		case 'n':
> > +			iteration_check = true;
> > +			iteration_value = atoi(optarg);
> > +			break;
> >  		case 'p':
> >  			physical_engines = true;
> >  			break;
> > @@ -2858,6 +2865,12 @@ int main(int argc, char **argv)
> >  		if (disp_clients != iclients.clients)
> >  			free_display_clients(disp_clients);
> >  
> > +		if (iteration_check) {
> > +			iteration_count++;
> > +			if (iteration_count >= iteration_value)
> > +				stop_top = true;
> > +		}
> As I mentioned above, this is not tied to -c or -J in any way,
> so it applies a limit in main execution loop regardless of other
> options.
> I think the current idea is good, so its usage is not limited to
> the -c/-J opts, but the explanation in "--help" section should
> be changed.
> 

Thank you for your comments.

Regards,
Kamil

> > +
> >  		if (stop_top)
> >  			break;
> >  
> > -- 
> > 2.51.0
> > 
> 
> -- 
> Best Regards,
> Krzysztof
