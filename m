Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D5A10E0DB
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 12:25:46 +0000 (UTC)
Date: Tue, 14 Feb 2023 13:25:40 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230214132540.22b035ea@maurocar-mobl2>
In-Reply-To: <20230213161538.b5f7hvawc7hbx3ub@kamilkon-desk1>
References: <20230209115712.3240666-1-mauro.chehab@linux.intel.com>
 <20230209115712.3240666-2-mauro.chehab@linux.intel.com>
 <20230213161538.b5f7hvawc7hbx3ub@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/1] scripts:igt-doc.py: add a parser
 to document tests inlined
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

On Mon, 13 Feb 2023 17:15:38 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2023-02-09 at 12:57:12 +0100, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Tests need to be documentation, as otherwise its goal will be
> > lost with time. Keeping documentation out of the sources is also
> > not such a good idea, as they tend to bitrot.
> > 
> > So, add a script to allow keeping the documentation inlined, and
> > add tools to verify if the documentation has gaps.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  scripts/igt_doc.py | 487 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 487 insertions(+)
> >  create mode 100755 scripts/igt_doc.py
> > 
> > diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> > new file mode 100755
> > index 000000000000..292d99c1ef92
> > --- /dev/null
> > +++ b/scripts/igt_doc.py
> > @@ -0,0 +1,487 @@
> > +#!/usr/bin/env python3
> > +# pylint: disable=C0301,R0914,R0912,R0915
> > +# SPDX-License-Identifier: GPL-2.0  
> ----------------------------- ^
> This should be MIT

I'll then dual-license it with "(GPL-2.0 OR MIT)". I prefer keeping it
also being licensed as GPL, just in case we might end needing it
somewhere else.

> > +
> > +## Copyright (C) 2023    Intel Corporation                 ##
> > +## Author: Mauro Carvalho Chehab <mchehab@kernel.org>      ##
> > +##                                                         ##
> > +## Allow keeping inlined test documentation and validate   ##
> > +## if the documentation is kept updated.                   ##
> > +
> > +"""Maintain test plan and test implementation documentation on IGT."""
> > +
> > +import argparse
> > +import fileinput
> > +import re
> > +import subprocess
> > +import sys
> > +
> > +IGT_BUILD_PATH = 'build/'
> > +IGT_RUNNER = '/runner/igt_runner'
> > +
> > +# Fields that mat be inside TEST and SUBTEST macros
> > +fields = [
> > +    'Category',       # Hardware building block / Software building block / ...
> > +    'Sub-category',   # waitfence / dmabuf/ sysfs / debugfs / ...
> > +    'Coverered functionality', # basic test / ...  
> ------------^^
> Covered

I'll just place "Functionality".

> 
> > +    'Test type',      # functionality test / pereformance / stress  
> -------------------------------------------------- ^
> performance
> 
> > +    'Run type',       # BAT / workarouds / stress / developer-specific / ...  
> ------------------------------------------------------ ^
> I am not sure what is it.

I'll drop "developer-specific".

> 
> +cc Petri
> 
> Regards,
> Kamil
