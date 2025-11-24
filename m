Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C171CFD347
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 18:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA7210E0BA;
	Mon, 24 Nov 2025 18:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moguDJqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E6910E0BA
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 18:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764009635; x=1795545635;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kf2sy+0EikzOx13F64pD5CooT8cSJLugrv6b+aqApqU=;
 b=moguDJqa9gHRiicZBMqtOvwQosdGb3s2gysabVxjZZUX0zTkhv/oCKoK
 5nUlcipjmsyZjn8edssVypqot8V1zIF9Kftj5Y6qdPpZNbIvVWE0ePmgf
 /KJ2xsejudYL3HutC/OmYedcO+jhKJlFVkIvi7hfXibKvgCYdbh4R2gHe
 iIeDNhwlFFVQgKZhz+jqb5b8oCcSLjHElzaiERrCjww4Q+JUofTeK4G6N
 4eLpVXLnfmFXTbKqsQKJuNSvOPN8ycabjuBxozUb3+zCkrcXFoSX6p89v
 TeVYwe3wu6Tz47vTO0KlXnMgkBKbi3Z7EKgf6JHPa8HrRZdZzYzZNgEsi w==;
X-CSE-ConnectionGUID: iftSVO7TSN+UJlSE0eiy0A==
X-CSE-MsgGUID: UQU2T5owTcmYaA86kAjAGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65716549"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="65716549"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 10:40:35 -0800
X-CSE-ConnectionGUID: wAnQXewHQ720E+vg00cFdg==
X-CSE-MsgGUID: juMwM1XaTbCogTQILP9Luw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="223070965"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:40:33 -0800
Date: Mon, 24 Nov 2025 19:40:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Simon Fairweather <simon.n.fairweather@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3] tools/intel_gpu_top: Add iteration option -n
Message-ID: <20251124184014.ut47czn5n5ciknut@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org,
 Simon Fairweather <simon.n.fairweather@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <20251027153247.109572-1-kamil.konieczny@linux.intel.com>
 <fzr6737mjmdkhfmkxh2uawj47gtzcuig3t4sqqtvtuqzme5pbx@evlm4bcue57t>
 <20251104092043.prlqk7teecophc5r@kamilkon-DESK.igk.intel.com>
 <waoe2s5ere3bcpkbzitkfhgpxc3fgrn7rbuwlqbd46ducnmhpq@64a6znrilzha>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <waoe2s5ere3bcpkbzitkfhgpxc3fgrn7rbuwlqbd46ducnmhpq@64a6znrilzha>
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
On 2025-11-06 at 07:32:18 +0000, Krzysztof Karas wrote:
> Hi,
> 
> resending my last message in the thread, because I omitted CCs
> by accident. Original message:
> 
> Hi Kamil,
> 
> On 2025-11-04 at 10:20:43 +0100, Kamil Konieczny wrote:
> > Hi Krzysztof,
> > On 2025-11-03 at 12:05:14 +0000, Krzysztof Karas wrote:
> > > Hi Kamil,
> > > 
> > > > From: Simon Fairweather <simon.n.fairweather@gmail.com>
> > > > 
> > > > When using option -J or -c default is looping forever until user
> > > > break process. Lets introduce new option -n <number> and break
> > > > printing after reaching given number of iterations.
> > > > 
> > > > v2: corrected whitespaces, extended description (Kamil)
> > > > v3: reduced number of vars and changed printed help (Krzysztof)
> > > >   added description to man page (Tvrtko)
> > > > 
> > > > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > > Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
> > > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > ---
> > > 
> > > [...]
> > > 
> > > >  		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
> > > >  		"\t[-p]            Default to showing physical engines instead of classes.\n"
> > > >  		"\t[-m]            Default to showing all memory regions.\n"
> > > > +		"\t[-n <number>]   Specify application running time as <number - 1> * <refresh period>\n"
> > > Passing 0 or negative causes the app to spin indefinitely.
> > > Furthermore, I think <number - 1> overcomplicates this endeavor.
> > > We should consider a few scenarios and sanitize the inputs:
> > > 
> > > -n 0 - we break out immediately after a single print,
> > > -n 1 (or any positive number) - the app works for
> > > 	<refresh period> amount of time,
> > 
> > Could be, so for n=1 it will print info two times? This in turn
> > is counter-ituitive, it imho specifies number of prints, not a
> > time.
> This! Since the value is not supposed to represent a time value,
> I think we can use "<number of prints> * <refresh period>" or
> something similar. See below.
> 
> > What you think about this help:
> > 
> > "\t[-n <number>]   Specify application running time as <number - 1> * <refresh period>\n"
> > "		   With options like -J it will print info <number> times. The default\n"
> > "		   value is -1 which means work until user breaks with 'q' or Ctrl-C\n"
> > "		   or sends signal.\n"
> 
> Maybe:
>  "\t[-n <number of prints>]   Specify application running time as\n"
>  "                <number of prints> * <refresh period>. Passing 0 or negative number\n"

Looks better but is still incorrect, for '-n1' it will print info
and immediatly exits, no wait with refresh period.

What about this:

"\t[-n <number>]   Specify running time as <number - 1> * <refresh period>. Passing 0 or\n"
"                negative number will run it in infinite loop until user breaks with q\n"
"                or Ctrl-C or sends a signal. With options like -J or -c it will print\n"
"                info <number> times.\n"

>  "                will wait until user breaks with q or Ctrl-C or sends a signal.\n"
>  "                With options like -J it will print info <number> times.\n"
> 
> I included the bit from my comment above and changed
> "The default" part to be more explicit about what happens when
> 0 or negative is passed. Then, when reading the value:
> 
> 		case 'n':
> 			iteration_count = atoi(optarg);
> 			if (iteration_count <= 0)
> 				iteration_count = -1;
> 			break;
> 
> We kill two birds with one stone by handling 0 edge case and
> using a known value of -1 to cause the indefinite loop, instead
> of keeping whatever negative number was passed by the user.
> What do you think?
> 
> [...]

Yes, looks ok, imho I will change atoi() into atol()

Regards,
Kamil

> 
> -- 
> Best Regards,
> Krzysztof
