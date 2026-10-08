Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D239DCA600E
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 10:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B4B10E6DD;
	Thu,  8 Oct 2026 10:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HiUk80O0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7531110E6DD
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 10:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791454346; x=1822990346;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Fvcy4Lk9dvgSFxtgZiQd0YW7ZqDX31ByhByATRXJa70=;
 b=HiUk80O0Lyncp2ZK9bufLjaL3GOs/E4Hm2Vxpu7hsrlD368u84BEUx3u
 VJL4nQmkIu80oZaaMHDbB3F6Uw+FtSICKva/U6WmpnxTHhnxoxB6JYVOT
 bVYRQcqHWb9TSiRBsIwFWvFCpcTDhqbWk+tMAKOoSWMUM/2Rqj7pp1iOF
 AlWNs8SpUegdjx4ujqZz3AWvySPEDDgyKM6HtucX2qm0xOq0ESqz2l6Gc
 OCO17lUF+34AZ370o//G1JT+kprCRjqIOi/Bkrok1hjNIaAfZcbf7xCPm
 uWh/8E5gPLnuAk/ko1xn3WkHBpBCt5w4JVCTnVIuNwtL98iP+TwD+EAE4 g==;
X-CSE-ConnectionGUID: p1MlOuHlS02/RYjgg+1fUA==
X-CSE-MsgGUID: PfY7s91BSQaRUymFFJhUeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="134693"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="134693"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:12:26 -0700
X-CSE-ConnectionGUID: tIZYjecfQKSbdYgkxsIbcA==
X-CSE-MsgGUID: /BT0L+OfTneWuovnVzqc6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="108696"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:12:25 -0700
Date: Thu, 8 Oct 2026 12:12:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Bernd Kuhls <bernd@kuhls.net>
Subject: Re: [PATCH i-g-t] lib/igt_platform_filter: Fix musl build
Message-ID: <20261008101222.o5tj52zdd5s57y5z@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Bernd Kuhls <bernd@kuhls.net>
References: <20261007160847.169029-1-kamil.konieczny@linux.intel.com>
 <c1c52d5186778ed3b3be6e5e8ca13c612d233bf9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1c52d5186778ed3b3be6e5e8ca13c612d233bf9@intel.com>
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

Hi Jani,
On 2026-10-07 at 19:33:48 +0300, Jani Nikula wrote:
> On Wed, 07 Oct 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > When using musl C libs, stdout/stderr are read-only vars and
> > compilation reports errors, for example:
> >
> > ../lib/igt_platform_filter.c: In function ‘igt_platform_filter_dump_to_file’:
> > ../lib/igt_platform_filter.c:551:16: error: assignment of read-only variable ‘stdout’
> >   551 |         stdout = f;
> >
> > Fix it on such platforms by dumping platform filters to stdout.
> >
> > Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > Cc: Jesse Zhang <jesse.zhang@amd.com>
> > Reported-by: Bernd Kuhls <bernd@kuhls.net>
> > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/211
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/igt_platform_filter.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
> > index 15b4e9690..c2c28e7f0 100644
> > --- a/lib/igt_platform_filter.c
> > +++ b/lib/igt_platform_filter.c
> > @@ -537,6 +537,7 @@ void igt_platform_filter_dump(void)
> >   */
> >  int igt_platform_filter_dump_to_file(const char *filename)
> >  {
> > +#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && !defined(__UCLIBC__)
> >  	FILE *old_stdout;
> >  	FILE *f;
> >  
> > @@ -549,14 +550,19 @@ int igt_platform_filter_dump_to_file(const char *filename)
> >  	/* Redirect stdout to file */
> >  	old_stdout = stdout;
> >  	stdout = f;
> > +#endif
> >  
> >  	igt_platform_filter_dump();
> >  
> > +#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && !defined(__UCLIBC__)
> >  	/* Restore stdout */
> >  	stdout = old_stdout;
> >  	fclose(f);
> >  
> >  	igt_info("Platform filter configuration dumped to: %s\n", filename);
> > +#else
> > +	igt_info("Platform filter configuration dumped\n");
> > +#endif
> >  	return 0;
> >  }
> 
> Funny, I was just saying ifdefs belong outside of the functions [1].
> 
> Here too, the code shared between the two conditional compilation
> branches are the igt_platform_filter_dump() call and return
> 0. Everything else is different, and the complex #if condition is
> duplicated. IMO would be cleaner to have the #if outside of the
> function.

I was thinking about something like:
	const char *s = dump_config();
	if (name) {
		f = fopen(name, "w");
		fwrite(s, strlen(s), 1, f);
		fclose(f)
	} else {
		igt_info("%s\n", s);
	}
but then relized that there is a stub caller inside, it will be hassle
and so I went with this was quick and ugly fix. Vitaly pointed that as
this function is now unused so it is ok to just remove it for now.

Regards,
Kamil

> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/d18d32cb4d1223e0dfb590abf6413a480c2a0aa1@intel.com
> 
> 
> -- 
> Jani Nikula, Intel
