Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF09CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 09:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7334910E24E;
	Tue,  4 Nov 2025 09:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+kKmuyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BEC10E24E
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762248047; x=1793784047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gv+ITvwisLtc6c6d8ybdfrbl7Umed2heVfnrUG/Bp6Y=;
 b=B+kKmuyjdC0b7bxxgPKvNH9tNFQr7SxFAnwjv7Zti9c3vdZCZZpuUZmG
 X2VBUC/mTFf1vnEp1CpdCztQkctvglKNVQCK5yQAWR/hoQ8do6XXcFLDS
 8UqOKG0G8QXU/FMtP69X6oVBMg4tizI6GCc/1BC4bq02tanB1Uq7jBWM+
 tyY6/o1HTcr5SovnoMDNTwrxUP21masIgI4a9l7wpWmC3WLJO9PVpq2hz
 F7XuGlHmr2AWHb4fH98K7j8/K2OUgJH8wkrPUxWKJnZ81KGA+uthHcy1A
 R9W1q1cSt4e78C2Jsa9HFV7rdjstVBjYirMEMpox/aVklT2R7oKiwduBv w==;
X-CSE-ConnectionGUID: RyIhvCKYTo6EyRAYwcfkIA==
X-CSE-MsgGUID: FiC7LU14QMKyD2KqEYCO7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68174660"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68174660"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:20:46 -0800
X-CSE-ConnectionGUID: WM/wNxYnS7GTEdH+Op3Umw==
X-CSE-MsgGUID: t5XnNnwfQ1Cb+LPR8IjfVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="192276738"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 01:20:45 -0800
Date: Tue, 4 Nov 2025 10:20:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Simon Fairweather <simon.n.fairweather@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3] tools/intel_gpu_top: Add iteration option -n
Message-ID: <20251104092043.prlqk7teecophc5r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org,
 Simon Fairweather <simon.n.fairweather@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <20251027153247.109572-1-kamil.konieczny@linux.intel.com>
 <fzr6737mjmdkhfmkxh2uawj47gtzcuig3t4sqqtvtuqzme5pbx@evlm4bcue57t>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fzr6737mjmdkhfmkxh2uawj47gtzcuig3t4sqqtvtuqzme5pbx@evlm4bcue57t>
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
On 2025-11-03 at 12:05:14 +0000, Krzysztof Karas wrote:
> Hi Kamil,
> 
> > From: Simon Fairweather <simon.n.fairweather@gmail.com>
> > 
> > When using option -J or -c default is looping forever until user
> > break process. Lets introduce new option -n <number> and break
> > printing after reaching given number of iterations.
> > 
> > v2: corrected whitespaces, extended description (Kamil)
> > v3: reduced number of vars and changed printed help (Krzysztof)
> >   added description to man page (Tvrtko)
> > 
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> 
> [...]
> 
> >  		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
> >  		"\t[-p]            Default to showing physical engines instead of classes.\n"
> >  		"\t[-m]            Default to showing all memory regions.\n"
> > +		"\t[-n <number>]   Specify application running time as <number - 1> * <refresh period>\n"
> Passing 0 or negative causes the app to spin indefinitely.
> Furthermore, I think <number - 1> overcomplicates this endeavor.
> We should consider a few scenarios and sanitize the inputs:
> 
> -n 0 - we break out immediately after a single print,
> -n 1 (or any positive number) - the app works for
> 	<refresh period> amount of time,

Could be, so for n=1 it will print info two times? This in turn
is counter-ituitive, it imho specifies number of prints, not a
time. What you think about this help:

"\t[-n <number>]   Specify application running time as <number - 1> * <refresh period>\n"
"		   With options like -J it will print info <number> times. The default\n"
"		   value is -1 which means work until user breaks with 'q' or Ctrl-C\n"
"		   or sends signal.\n"

> -n -1 (or any negative number):
>  a) disallow that by returning an error and exiting the app,
>  OR
>  b) cast that to the closest value that makes sense (maybe 0?)
> 

-1 was a defualt, we should not change default behaviour.
Default was to print indefinitly so user can have that with -1.
Without allowing -1 it should remember that user did or did not
used -n option, so one more var.
With that only -n0 is edge case, no printing at all and exit immediatly.

Regards,
Kamil

> >  		"\n",
> >  		appname, DEFAULT_PERIOD_MS);
> >  	printf("To access interactive help, press 'h' while the application is running.\n");
> > @@ -2617,9 +2618,10 @@ int main(int argc, char **argv)
> >  	struct igt_device_card card;
> >  	char *codename = NULL;
> >  	struct timespec ts;
> > +	int iteration_count = 0;
> >  
> >  	/* Parse options */
> > -	while ((ch = getopt(argc, argv, "o:s:d:mpcJLlh")) != -1) {
> > +	while ((ch = getopt(argc, argv, "o:s:d:n:mpcJLlh")) != -1) {
> >  		switch (ch) {
> >  		case 'o':
> >  			output_path = optarg;
> > @@ -2630,6 +2632,9 @@ int main(int argc, char **argv)
> >  		case 'd':
> >  			opt_device = strdup(optarg);
> >  			break;
> > +		case 'n':
> > +			iteration_count = atoi(optarg);
> I'd suggest adding
> if (iteration_count =< 0)
> 	stop_top = true;
> 
> but I am a bit confused why there are 3 exit points from the
> main while loop:
>  1) the loop condition while (!stop_top) {,
>  2) if (stop_top) before while(!consumed),
>  3) if (stop_top) before if (output_mode == INTERACTIVE).
> 
> so maybe:
> 
> if (iteration_count =< 0)
> 	iteration_count = 1;
> 
> would be good enough?
> 
> > +			break;
> >  		case 'p':
> >  			physical_engines = true;
> >  			break;
> > @@ -2857,6 +2862,12 @@ int main(int argc, char **argv)
> >  		if (disp_clients != iclients.clients)
> >  			free_display_clients(disp_clients);
> >  
> > +		if (iteration_count > 0) {
> > +			--iteration_count;
> > +			if (!iteration_count)
> > +				stop_top = true;
> > +		}
> > +
> >  		if (stop_top)
> >  			break;
> >  
> > -- 
> > 2.51.1
> > 
> 
> -- 
> Best Regards,
> Krzysztof
