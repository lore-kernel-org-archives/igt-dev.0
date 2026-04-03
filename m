Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32771D730A2
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 05:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882C210E094;
	Fri,  3 Apr 2026 05:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8pM1/B+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D2D10E094
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 05:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775194858; x=1806730858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ObIo42AsM1YT+YZyjBPHnax+PBacG0APguSv3CA/wGI=;
 b=l8pM1/B+k2jwELF8exLFSNzrekCnKxas2iF8v4Tc4xYWhhXqtAhzFrbi
 GBZb6f1rDUnZuLUTlTvZDZ7X6oefPkGgO8dA4fxuki9FWPJWiNZzrIdOk
 1Flf05UDAVGYl2A9Odz9VFLJJ2gh2Fe4IOFRd4SDDrFawXYcYqoY+W6fg
 dhGU2VaZXy8LNPBywj4VRoCBUl9kGUn6ZKhwyhhuTqZYZHYT2NFQR73yR
 Id5ZAXNm2mDdtXABs9kFtrlpgYdu+/qR3Ig1AKBq8NPo0Cbdgsg+x4hQW
 vsBS8GO875rRVXmJQEZzbG6IBe+sqztVSuqh9J3S9zRpPXZlvdKJwCl4O g==;
X-CSE-ConnectionGUID: 0Sw61fcCQVS4c4aA8KN5zQ==
X-CSE-MsgGUID: rvo0k2BOT3qlOPt24FWpzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87713650"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="87713650"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 22:40:58 -0700
X-CSE-ConnectionGUID: rn57/eRGSHOvwYOHFvMdAQ==
X-CSE-MsgGUID: yf3EPCUQSOG/3QHcXAgu0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="220534072"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 22:40:55 -0700
Date: Fri, 3 Apr 2026 07:40:53 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 5/6] runner: Rename parsing function
Message-ID: <ia7rgxbpzbzvsdgcnhbtpiuwiad5qevoxkqblbn6t3zpzmhnwc@z3an5qxeuz4y>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-13-zbigniew.kempczynski@intel.com>
 <j4br6xwman62epext673yb7nyizxyva5xw4dpuvpuu7u2wlibl@42ts4c2e37lp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <j4br6xwman62epext673yb7nyizxyva5xw4dpuvpuu7u2wlibl@42ts4c2e37lp>
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

On Mon, Mar 30, 2026 at 08:07:39AM +0000, Krzysztof Karas wrote:
> Hi Zbigniew,
> 
> > Upcoming changes will use parsing function so rename it to some
> > generic name is necessary to avoid confusion.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> >  runner/settings.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> > 
> > diff --git a/runner/settings.c b/runner/settings.c
> > index 3ccf718701..7c29f2d3ab 100644
> > --- a/runner/settings.c
> > +++ b/runner/settings.c
> > @@ -364,16 +364,18 @@ static bool add_regex(struct regex_list *list, char *new)
> >  	return true;
> >  }
> >  
> > -static bool parse_blacklist(struct regex_list *exclude_regexes,
> > -			    char *blacklist_filename)
> > +static bool parse_list(struct regex_list *regexes,
> > +		       char *list_filename,
> > +		       const char *list_type)
> >  {
> >  	FILE *f;
> >  	char *line = NULL;
> >  	size_t line_len = 0;
> >  	bool status = false;
> >  
> > -	if ((f = fopen(blacklist_filename, "r")) == NULL) {
> > -		fprintf(stderr, "Cannot open blacklist file %s\n", blacklist_filename);
> > +	if ((f = fopen(list_filename, "r")) == NULL) {
> > +		fprintf(stderr, "Cannot open %s file %s\n",
> > +			list_filename, list_type);
> list_filename and list_type should be swapped.

Right, thanks for catching this flaw.

--
Zbigniew

> 
> >  		return false;
> >  	}
> >  	while (1) {
> > @@ -398,7 +400,7 @@ static bool parse_blacklist(struct regex_list *exclude_regexes,
> >  		if (str_size > 0) {
> >  			char *test_regex = strndup(line, str_size);
> >  
> > -			status = add_regex(exclude_regexes, test_regex);
> > +			status = add_regex(regexes, test_regex);
> >  			if (!status)
> >  				break;
> >  		}
> > @@ -845,8 +847,9 @@ bool parse_options(int argc, char **argv,
> >  			}
> >  			break;
> >  		case OPT_BLACKLIST:
> > -			if (!parse_blacklist(&settings->exclude_regexes,
> > -					     absolute_path(optarg)))
> > +			if (!parse_list(&settings->exclude_regexes,
> > +					absolute_path(optarg),
> > +					"blacklist"))
> >  				goto error;
> >  			break;
> >  		case OPT_LIST_ALL:
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Best Regards,
> Krzysztof
