Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCC1CCF9E5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 13:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4916F10E4AF;
	Mon, 27 Oct 2025 13:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jP4WJPg8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A48510E4AF
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 13:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761573448; x=1793109448;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wwVf8GUPYwNkaea+Iaxu6ZRtSYi3mkU1jdNlVweumFA=;
 b=jP4WJPg8c8TVUXtiHDJwmPzw11hHqUA5czLevTGmUbCg5U/5MQN1EpHc
 Qc9INfYLnkLVq6hDIB5HL1HGXoROmol4BDvRGBcZcUjIGjFqByOwu7tQQ
 OJUEFYDMbEUiGhSnyvSZg92n6/FL93tqBkJuDu1X/B8wN9vK7M6LaT0vb
 OvANzoXSlc7N2l+0OUd+DXR7FPQDHNkhyVoTlTpTLIdTSsi9nu1gF4mjT
 LxFZ0MznyXeJxfuYx+Qcvx8ljBhq0E7yUzTU1jssGAAuaF/497VEwpHQK
 KiiHmWcPv8qWRyCHUNyH75nc0VZz094/KFe1qUEm2F6l7Axn+jcaXyPVW g==;
X-CSE-ConnectionGUID: cc/+VL+RSoCHWVVZP6mmtQ==
X-CSE-MsgGUID: udcyAX53SeOmXapD+tSbEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67295439"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="67295439"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:57:27 -0700
X-CSE-ConnectionGUID: jxy5B0A/QSePtLhqRxaDew==
X-CSE-MsgGUID: LnpGxB+VQjOSj8SEms5dzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="190260633"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:57:25 -0700
Date: Mon, 27 Oct 2025 14:57:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>, igt-dev@lists.freedesktop.org,
 Simon Fairweather <simon.n.fairweather@gmail.com>
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: Add iteration option -n
Message-ID: <20251027135723.eoji32o3rw3avfob@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org,
 Simon Fairweather <simon.n.fairweather@gmail.com>
References: <20251016095649.31446-1-kamil.konieczny@linux.intel.com>
 <vf4drxg7dt5etivlwlgvbrxomkodvwrfpjm4jplicb3udecki4@uv5s3zp6t274>
 <90674e7c-c6cf-4fa4-a21f-2808e9835b92@ursulin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90674e7c-c6cf-4fa4-a21f-2808e9835b92@ursulin.net>
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

Hi Tvrtko,
On 2025-10-17 at 09:25:23 +0100, Tvrtko Ursulin wrote:
> 
> On 17/10/2025 08:29, Krzysztof Karas wrote:
> > Hi Kamil and Simon,
> > 
> > > When using option -J or -c default is looping forever until user
> > > break process. Lets introduce new option -n <number> and break
> > > printing after reaching given number of iterations.
> > > 
> > > v2: corrected whitespaces, extended description (Kamil)
> > > 
> > > Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
> > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > >   tools/intel_gpu_top.c | 15 ++++++++++++++-
> > >   1 file changed, 14 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> > > index 54e71e559..4bcac4b47 100644
> > > --- a/tools/intel_gpu_top.c
> > > +++ b/tools/intel_gpu_top.c
> > > @@ -1051,6 +1051,7 @@ usage(const char *appname)
> > >   		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
> > >   		"\t[-p]            Default to showing physical engines instead of classes.\n"
> > >   		"\t[-m]            Default to showing all memory regions.\n"
> > > +		"\t[-n]            Specify number of iterations. Can be used with -J or -c.\n"
> > I built this tool with the proposed change and found out that -n
> > applies regardless of -J or -c being added - it gives an overall
> > timeout for the application. If this is what you were aiming
> > for, then I'd rephrase:
> > "Specify number of iterations. Can be used with -J or -c."
> > to something like:
> > "Specify application runtime: n * refresh period (-s option)."
> > or:
> > "Specify application runtime n * refresh period (-s option).
> > Useful with -J and -c options."
> > if you want to hint it's usage.
> > 
> > >   		"\n",
> > >   		appname, DEFAULT_PERIOD_MS);
> > >   	igt_device_print_filter_types();
> > > @@ -2618,9 +2619,11 @@ int main(int argc, char **argv)
> > >   	struct igt_device_card card;
> > >   	char *codename = NULL;
> > >   	struct timespec ts;
> > > +	int iteration_value, iteration_count = 0;
> > > +	bool iteration_check = false;
> > I think iteration_check flag is redundant here, because you
> > could use iteration_value as the indicator:
> >   1) set iteration_value to 0
> >   2) if -n is used overwrite the variable to whatever user wants
> >   3) check later if the variable has value
> >   4) a) if it does then increment iteration_count
> >      b) if not then just spin indefinitely
> > 
> > >   	/* Parse options */
> > > -	while ((ch = getopt(argc, argv, "o:s:d:mpcJLlh")) != -1) {
> > > +	while ((ch = getopt(argc, argv, "o:s:d:n:mpcJLlh")) != -1) {
> > >   		switch (ch) {
> > >   		case 'o':
> > >   			output_path = optarg;
> > > @@ -2631,6 +2634,10 @@ int main(int argc, char **argv)
> > >   		case 'd':
> > >   			opt_device = strdup(optarg);
> > >   			break;
> > > +		case 'n':
> > > +			iteration_check = true;
> > > +			iteration_value = atoi(optarg);
> > > +			break;
> > >   		case 'p':
> > >   			physical_engines = true;
> > >   			break;
> > > @@ -2858,6 +2865,12 @@ int main(int argc, char **argv)
> > >   		if (disp_clients != iclients.clients)
> > >   			free_display_clients(disp_clients);
> > > +		if (iteration_check) {
> > > +			iteration_count++;
> > > +			if (iteration_count >= iteration_value)
> > > +				stop_top = true;
> > > +		}
> > As I mentioned above, this is not tied to -c or -J in any way,
> > so it applies a limit in main execution loop regardless of other
> > options.
> > I think the current idea is good, so its usage is not limited to
> > the -c/-J opts, but the explanation in "--help" section should
> > be changed.
> 
> +1 to all comments from Krzysztof.
> 
> Otherwise wanted to say that there is also the man page which needs to be
> updated.

Ah, right, I forgot about man page, thank you for reminder,
I will also change it.

Regards,
Kamil

> 
> Regards,
> 
> Tvrtko
> 
> > 
> > > +
> > >   		if (stop_top)
> > >   			break;
> > > -- 
> > > 2.51.0
> > > 
> > 
> 
