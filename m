Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1C110E2DF
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 15:49:34 +0000 (UTC)
Date: Mon, 11 Apr 2022 17:49:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Message-ID: <20220411174928.349caf14@maurocar-mobl2>
In-Reply-To: <669eb789-0e93-9585-15a0-f9fb0cf0fcd3@intel.com>
References: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
 <20220404062642.378928-13-mauro.chehab@linux.intel.com>
 <669eb789-0e93-9585-15a0-f9fb0cf0fcd3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 12/12] code_cov_parse_info: add support for
 generating html reports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 11 Apr 2022 15:15:19 +0200
Andrzej Hajda <andrzej.hajda@intel.com> wrote:

> > +sub generate_report()
> > +{
> > +	my $percent;
> > +	my $prolog = "";
> > +	my $epilog = "";
> > +	my @info_files = sort(keys %report);
> > +
> > +	$title = "Code coverage results" if ($title eq "");
> > +
> > +	if ($html_prolog) {
> > +		open IN, $html_prolog or die "Can't open prolog file";
> > +		$prolog .= $_ while (<IN>);
> > +		close IN;
> > +	}
> > +
> > +	if ($html_prolog) {  
> 
> $html_epilog

OK.

> Lots of code, I have always mixed feelings about code generating html. 
> It's maintainability is quite difficult.
> I am not UI/presentation expert, so it is hard to decide, but if there 
> are no better options (XML/XSLT, perl frameworks to generate reports, 
> ....), lets try it.

I would prefer to avoid using perl frameworks, as this makes harder
to package it, as it would add more dependencies to igt. Also, not
sure if this would actually affect the size, as we still need to store
the results per .info input file, and have the loops there to calculate
percentages.

As the idea here is not to have anything fancier than tables, I
guess the current code won't require too much maintenance. I could 
have opted to output ReST directly (or github-flavored markdown), 
or something as complex as docbook or LaTeX, but html seems more portable
and converting from html to either ReST (or any other markup language) is
as easy as calling pandoc.

Btw, using a text markup language would lose colors, as most markdown
languages don't allow changing font colors (I guess the only text markup
that supports color is asciidoc - which is a little bit odd). The colors
are helpful when trying to analyze the resulting data.

Also, I'm imagining a scenario in the future where CI would place the
output of those reports on some web page. so, producing html sounded
an interesting choice.

Regards,
Mauro
