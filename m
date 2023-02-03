Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24EA10E04B
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 14:16:53 +0000 (UTC)
Date: Fri, 3 Feb 2023 15:16:29 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230203151629.08c9ede5@maurocar-mobl2>
In-Reply-To: <87tu02zxt2.fsf@intel.com>
References: <20230203082650.2454081-1-mauro.chehab@linux.intel.com>
 <20230203082650.2454081-2-mauro.chehab@linux.intel.com>
 <Y9ze++qjDfKudq0P@adrinael.net>
 <20230203121346.1c991030@maurocar-mobl2> <87tu02zxt2.fsf@intel.com>
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

On Fri, 03 Feb 2023 15:24:41 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Fri, 03 Feb 2023, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> > On Fri, 3 Feb 2023 12:16:27 +0200
> > Petri Latvala <adrinael@adrinael.net> wrote:
> >  
> >> On Fri, Feb 03, 2023 at 09:26:50AM +0100, Mauro Carvalho Chehab wrote:  
> >> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> > 
> >> > On a similar approach to Kernel's kernel-doc script, add a parser
> >> > that will produce documentation from special-purpose documentation
> >> > tags inside IGT tests.
> >> > 
> >> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> > ---
> >> >  scripts/igt-doc | 647 ++++++++++++++++++++++++++++++++++++++++++++++++
> >> >  1 file changed, 647 insertions(+)
> >> >  create mode 100755 scripts/igt-doc
> >> > 
> >> > diff --git a/scripts/igt-doc b/scripts/igt-doc
> >> > new file mode 100755
> >> > index 000000000000..3ed2be144e61
> >> > --- /dev/null
> >> > +++ b/scripts/igt-doc
> >> > @@ -0,0 +1,647 @@
> >> > +#!/usr/bin/env perl    
> >> 
> >> 
> >> When you talked about this beforehand, you talked about using
> >> Python. Does this need to be a perl script? I mean, it's from kernel,
> >> I understand that, but I'll be completely unable to review perl code
> >> myself =(  
> >
> > No, I didn't talk about writing it in Python. There are a couple of
> > reasons why I opted to use Perl:
> >
> > 1. kernel-doc script is in perl too. It probably makes sense to also
> >    add support the Kernel itself for test-related tags, in order to be
> >    able to document KUnit tests. By using the same language, it is 
> >    easier to place automation there too;  
> 
> I don't think kernel-doc the script is a good argument here. On the
> contrary, it should be an example of what not to do. It only exists as a
> perl script because of legacy, and nothing else.
> 
> > 2. We have already perl scripts inside IGT (see code_cov_parse_info);  
> 
> Which you added, and nobody else has touched since. Just saying.

So what? The same applies to almost all Python scripts there as well:

	$ for i in $(find . -name *.py); do echo -n "$i author(s):"; echo $(git log --pretty="%an" $i|sort|uniq); done
	./.gitlab-ci/list_undocumented_tests.py author(s):Arkadiusz Hiler
	./lib/i915/shaders/converter.py author(s):Katarzyna Dec
	./lib/i915/perf-configs/perf-equations-codegen.py author(s):Lionel Landwerlin
	./lib/i915/perf-configs/oa_guid_registry.py author(s):Lionel Landwerlin
	./lib/i915/perf-configs/codegen.py author(s):Arkadiusz Hiler Lionel Landwerlin
	./lib/i915/perf-configs/update-guids.py author(s):Lionel Landwerlin
	./lib/i915/perf-configs/mdapi-xml-convert.py author(s):Lionel Landwerlin
	./lib/i915/perf-configs/perf-registers-codegen.py author(s):Lionel Landwerlin
	./lib/i915/perf-configs/perf-metricset-codegen.py author(s):Lionel Landwerlin
	./docs/reference/igt-gpu-tools/generate_description_xml.py author(s):Arkadiusz Hiler
	./scripts/quick-testlist.py author(s):Thomas Wood
	./scripts/convert_itp.py author(s):Ben Widawsky
	./scripts/throttle.py author(s):Chris Wilson

The script had reviewers, so I'm not the only one working with perl.

> > 3. Perl APIs are *a lot* more stable than Python; scripts written
> >    a long time ago still runs OK without changes. Python, on the other
> >    hand, keeps deprecating their APIs or changing them on non-compatible
> >    ways from time to time, requiring more maintainance efforts just due
> >    to its API changes.
> >
> > 4. I believe that each programmer should pick its own poison, writing
> >    stuff using the environments they're more comfortable with. 
> >    I'm not a Python programmer. I can probably review and write basic
> >    changes on it, but writing something new there, using dictionaries
> >    on an optimized code [1] is something that it would require a lot
> >    of time from my side.  
> 
> The above holds if you're working alone in a silo. IGT is above all a
> team effort, and you need to consider the overall productivity of the
> team, and the team's ability to maintain the code. Who's going to step
> up if you're not there to do it? Are they going to have to rewrite the
> whole thing in some other language?

Frankly, I don't mind if anyone wants to write it on any other language,
or use some already-existing tool.

We're diverting from the issue: we need to have proper documentation
and a way to validate if the documentation is outdated.

That is the scope of this patch: to add a way to do that. If you have
a better solution, feel free to send the patches.

Regards,
Mauro
