Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FFE10E76D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 11:47:15 +0000 (UTC)
Date: Fri, 3 Feb 2023 12:47:11 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20230203124711.0af4ba55@maurocar-mobl2>
In-Reply-To: <CAKMK7uFRQU2=2h4AD1VfVX4NEQzSrd_nODJF9XCLipzRurbQew@mail.gmail.com>
References: <20230203082650.2454081-1-mauro.chehab@linux.intel.com>
 <20230203082650.2454081-2-mauro.chehab@linux.intel.com>
 <874js311zb.fsf@intel.com>
 <CAKMK7uFRQU2=2h4AD1VfVX4NEQzSrd_nODJF9XCLipzRurbQew@mail.gmail.com>
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

On Fri, 3 Feb 2023 11:36:39 +0100
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Fri, 3 Feb 2023 at 11:24, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > On Fri, 03 Feb 2023, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:  
> > > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > >
> > > On a similar approach to Kernel's kernel-doc script, add a parser
> > > that will produce documentation from special-purpose documentation
> > > tags inside IGT tests.  
> >
> > kernel-doc is really not a great model to duplicate elsewhere.  
> 
> Yes.
> 
> Like just "yes".
> 
> Also quite frankly I think a large chunk of the problem many igts have
> (especially in the i915-gem area) is not the lacking documentation.

The goal is not to to change anything at the i915 documentation (or the
lack of), but, instead, to provide an infrastructure to have clear
test documentation and test plans for newer driver. We're basically
aiming on having test documentation for Xe, keeping it updated as the
tests and the driver changes.

In the specific case of the curent tests, there is a lack of proper
documentation in iGT. Right now we have around 62K tests on iGT upstream:

$ ./build/runner/igt_runner -L build/tests/|wc -l
62773

So far I was unable to identify any document describing what each test does,
on what platforms the tests run, etc. I bet not many people know what those
~62K tests on IGT actually does, and how many of them are ok to be removed,
covers some border cases on very platforms or had their scope replaced by
some other test.

The goal here is to have a tool that will help keeping the tests and their
respective documentation in a sane state.

> -Daniel
> 
> > Why hand craft another C parser? There's a cost to maintaining this, and
> > it's not helped by the choice of implementation language.
> >
> > The script alone isn't enough; how do you bolt this into other
> > documentation? More ad hoc scripting like
> > docs/reference/igt-gpu-tools/{generate_description_xml.py,generate_programs_xml.sh}?
> >  
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > ---
> > >  scripts/igt-doc | 647 ++++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 647 insertions(+)
> > >  create mode 100755 scripts/igt-doc
> > >
> > > diff --git a/scripts/igt-doc b/scripts/igt-doc
> > > new file mode 100755
> > > index 000000000000..3ed2be144e61
> > > --- /dev/null
> > > +++ b/scripts/igt-doc
> > > @@ -0,0 +1,647 @@
> > > +#!/usr/bin/env perl
> > > +# SPDX-License-Identifier: GPL-2.0  
> >
> > All of IGT is MIT, except the headers copied from kernel. Is this
> > GPL-2.0 because there's so much kernel-doc in it...
> >  
> > > +## Copyright (C) 2023    Intel Corporation                 ##
> > > +## Author: Mauro Carvalho Chehab <mchehab@kernel.org>      ##
> > > +## Inspired on Linux kernel-doc script                     ##  
> >
> > ...
> >  
> > > +igt-doc - Print formatted kernel documentation to stdout  
> >                              ^^^^^^
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center  
> 
> 
> 
