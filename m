Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D507310E763
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 11:13:50 +0000 (UTC)
Date: Fri, 3 Feb 2023 12:13:46 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Petri Latvala <adrinael@adrinael.net>
Message-ID: <20230203121346.1c991030@maurocar-mobl2>
In-Reply-To: <Y9ze++qjDfKudq0P@adrinael.net>
References: <20230203082650.2454081-1-mauro.chehab@linux.intel.com>
 <20230203082650.2454081-2-mauro.chehab@linux.intel.com>
 <Y9ze++qjDfKudq0P@adrinael.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] scripts: add a parser to produce
 documentation from Kernel C file metatags
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 3 Feb 2023 12:16:27 +0200
Petri Latvala <adrinael@adrinael.net> wrote:

> On Fri, Feb 03, 2023 at 09:26:50AM +0100, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > On a similar approach to Kernel's kernel-doc script, add a parser
> > that will produce documentation from special-purpose documentation
> > tags inside IGT tests.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  scripts/igt-doc | 647 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 647 insertions(+)
> >  create mode 100755 scripts/igt-doc
> > 
> > diff --git a/scripts/igt-doc b/scripts/igt-doc
> > new file mode 100755
> > index 000000000000..3ed2be144e61
> > --- /dev/null
> > +++ b/scripts/igt-doc
> > @@ -0,0 +1,647 @@
> > +#!/usr/bin/env perl  
> 
> 
> When you talked about this beforehand, you talked about using
> Python. Does this need to be a perl script? I mean, it's from kernel,
> I understand that, but I'll be completely unable to review perl code
> myself =(

No, I didn't talk about writing it in Python. There are a couple of
reasons why I opted to use Perl:

1. kernel-doc script is in perl too. It probably makes sense to also
   add support the Kernel itself for test-related tags, in order to be
   able to document KUnit tests. By using the same language, it is 
   easier to place automation there too;

2. We have already perl scripts inside IGT (see code_cov_parse_info);

3. Perl APIs are *a lot* more stable than Python; scripts written
   a long time ago still runs OK without changes. Python, on the other
   hand, keeps deprecating their APIs or changing them on non-compatible
   ways from time to time, requiring more maintainance efforts just due
   to its API changes.

4. I believe that each programmer should pick its own poison, writing
   stuff using the environments they're more comfortable with. 
   I'm not a Python programmer. I can probably review and write basic
   changes on it, but writing something new there, using dictionaries
   on an optimized code [1] is something that it would require a lot
   of time from my side.

[1] this script takes 100ms to parse and convert a set of tags for all
    Xe IGT tags into ReST. On the (few) attempts I did to write similar
    scripts, Python performed a lot worse.

Regards,
Mauro
