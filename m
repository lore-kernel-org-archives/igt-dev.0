Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6455E10E771
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 11:37:33 +0000 (UTC)
Date: Fri, 3 Feb 2023 12:37:29 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230203123729.7f32fd8f@maurocar-mobl2>
In-Reply-To: <874js311zb.fsf@intel.com>
References: <20230203082650.2454081-1-mauro.chehab@linux.intel.com>
 <20230203082650.2454081-2-mauro.chehab@linux.intel.com>
 <874js311zb.fsf@intel.com>
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

On Fri, 03 Feb 2023 12:23:52 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Fri, 03 Feb 2023, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >
> > On a similar approach to Kernel's kernel-doc script, add a parser
> > that will produce documentation from special-purpose documentation
> > tags inside IGT tests.  
> 
> kernel-doc is really not a great model to duplicate elsewhere.

Why not? Kernel has been succeed keeping its interfaces documented. Ok,
there would be other alternatives to be used, but the main point is really
to keep the documentation as close as possible to the source code, in a
parseable way. 

> Why hand craft another C parser? There's a cost to maintaining this, and
> it's not helped by the choice of implementation language.

There is always a cost of maintaining documentation, and a cost of not
having them.

One of the biggest costs we have is related to the time for CI to run
IGT tests. The more tests we add, the higher the costs increase. That's
by far the most relevant cost here.

Right now, there are tests written several years ago, that people don't
have a clear idea why they're doing, and if they should belong to a
basic acceptance criteria or if some other tests are already covering
the functionality of them. So, multiple tests for the same feature could
end being running as part of the test plans, increasing the costs of
running such tests (energy costs, machine costs, etc).

Having test plans documenting what's inside each test file allows to
decide what of those tests make sense to run for each new patch added
to the tree, and what of those are there just to cover some borderline
cases and won't need to be run every time.

> The script alone isn't enough; how do you bolt this into other
> documentation? More ad hoc scripting like
> docs/reference/igt-gpu-tools/{generate_description_xml.py,generate_programs_xml.sh}?

No need. This script could be called to produce, let's say, Xe documentation by adding
a target at tests/xe/meson.build that would do something similar to:

	${SRCDIR}/scripts/igt-doc ${SRCDIR}/tests/xe/*.c > ${DESTDIR}/docs/xe_tests.rst

And CI would be running:

	${SRCDIR}/scripts/igt-doc ${SRCDIR}/tests/xe/*.c --check

In order to verify if all the tests inside a given directory (in this 
example, tests/xe) are documented.

With such automation in place, if someone writes a new test or subtest
and forgets to update the test description, CI could return warning
messages, asking the developer to fill in the gaps.

Regards,
Mauro
