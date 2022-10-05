Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9D810E464
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 07:41:47 +0000 (UTC)
Date: Wed, 5 Oct 2022 09:41:39 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20221005094139.6ae27831@maurocar-mobl2>
In-Reply-To: <10813270.BaYr0rKQ5T@jkrzyszt-mobl1.ger.corp.intel.com>
References: <cover.1664173031.git.mchehab@kernel.org>
 <50da9d5c006ba73f8464eb0cee1e40257a00486e.1664173031.git.mchehab@kernel.org>
 <YzcISxi01TrOL4aU@kamilkon-desk1>
 <10813270.BaYr0rKQ5T@jkrzyszt-mobl1.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 01/76] lib: Introduce typed cleanups
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 04 Oct 2022 12:17:20 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> > > +#include "igt_core.h"
> > > +#include "igt_types.h"  
> > 
> > Please put here description with IGT_TEST_DESCRIPTION() macro.
> >   
> > > +
> > > +igt_main
> > > +{  
> > 
> > Please put description before test with igt_describe().  
> 
> AFAICS none of lib/tests/*, except igt_describe that needs those clauses 
> because it exercises them, follows that convention.  If you found them 
> helpful then OK, that could be a field for improvement, but that should not 
> block adding new self IGT tests as needed, I believe.

True, but on the other hand, it doesn't hurt adding descriptions. As
such change is trivial enough, I'll add them.
> 
> > 
> > Also copy comment from main test that after running this
> > SIGABORT is intentional.  
> 
> Since this test is added to lib_fail_tests category (see below changes to lib/
> tests/meson.build) then I don't think we need further clarifications.

Same here.

> 
> Thanks,
> Janusz
