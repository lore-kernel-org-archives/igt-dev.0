Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456FA10E198
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Feb 2023 21:07:34 +0000 (UTC)
Date: Wed, 22 Feb 2023 22:07:30 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230222220730.0f1e9251@maurocar-mobl2>
In-Reply-To: <20230221181517.pgt2apt7mczaikmx@ldmartin-desk2.jf.intel.com>
References: <20230214123530.22525-1-mauro.chehab@linux.intel.com>
 <20230221181517.pgt2apt7mczaikmx@ldmartin-desk2.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 0/1] Add a script to allow inlined
 test documentation
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

On Tue, 21 Feb 2023 10:15:17 -0800
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> On Tue, Feb 14, 2023 at 01:35:29PM +0100, Mauro Carvalho Chehab wrote:
> >From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >
> >Keeping documentation updated is hard, as text documents gets outdated
> >when code changes. The best practices are to keep documentation as close
> >as possible to the code.
> >
> >This script allows adding documentation inside special tags at the
> >C files, and validate if the documentation actually meets the code.
> >
> >It is meant to be used by the new Intel Xe driver, in the process of
> >being upstreamed. It can be used also for other drivers, as well.
> >
> >It supports three modes of operation:
> >
> >1) Output documentation in ReST format (default if no arg provided):
> >
> >	$ scripts/igt-doc.py --files tests/xe/*.c --rest
> >
> >2) Output a list of tests that are documented
> >
> >	$ scripts/igt-doc.py --files tests/xe/*.c --show-subtests
> >
> >3) Compare the documented testlists with IGT runner testlist:
> >
> >	$ scripts/igt-doc.py --files tests/xe/*.c --check-testlist
> >
> >The idea is to add automation to generate the ReST files at the
> >Xe meson.build file. Once all documentation for Xe is placed inline,
> >the CI for it can also use this script to discover documentation
> >gaps.  
> 
> 
> once upon a time there was the initiative to document the tests and the
> decision was also to encode this information close to the tests. AFAIK
> then we got lib/tests/igt_describe.c and testst to be documented with
> IGT_TEST_DESCRIPTION().  Main reason I believe was that it's then also
> possible to know what the test is doing by running the test itself.
> Was extending that considered?  There is even
> .gitlab-ci.yml:test:list-undocumented-tests

Yes, I saw that, but IMO, it is not the best way to go. I mean, every
time a new field is placed, one has to create and test new macros.

It also makes harder to be parsed by a tool, in order to produce a
documentation grouped by functionality. 

> >Both modes (1) and (2) can be tested by running:
> >
> >	$ ./scripts/igt_doc.py --files ./scripts/igt_doc.py
> >
> >This will use the strings inside the class docstring added on version
> >3, parsing them as if they're C file documentatoin.  
> 
> If using comments is the way to go now, I don't have any issue with
> that. But we probably need to convert the old documentation to the new
> one.

Let's focus first on the new Xe driver, as documenting and converting
documentation from existing tests takes time. 

> Also, to cover the gap that the binary is not self-documented
> anymore, could we  run this script to create a blob and then call
> objcopy to glue it together with the test binary? This way --describe
> would continue to work.

What would be the advantage of having binaries documented? I can't
see any.

IMO, in long term the best would be to deprecate IGT_TEST_DESCRIPTION(),
as the documentation itself will be built via meson compile.

What it could be done (IMO, not worth the efforts) would be to make
"--describe" call igt_doc.py to print a parsed version of the
documentation. 

Regards,
Mauro
