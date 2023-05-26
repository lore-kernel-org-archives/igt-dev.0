Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A3710E1B5
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 06:13:23 +0000 (UTC)
Date: Fri, 26 May 2023 08:13:18 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526081318.7040b03e@maurocar-mobl2>
In-Reply-To: <20230525195517.tjiqaeya3e5wfey4@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-6-mauro.chehab@linux.intel.com>
 <20230525195517.tjiqaeya3e5wfey4@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 05/11] i915/gem_ctx_*: better
 document i915 context tests
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

On Thu, 25 May 2023 21:55:17 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2023-05-25 at 11:05:29 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Merge data from some ancillary internal documentation to improve
> > i915 gem_ctx test descriptions.
> > 
> > This patch was auto-generated via script.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  tests/i915/gem_ctx_bad_destroy.c |   4 ++
> >  tests/i915/gem_ctx_create.c      |  22 +++++-
> >  tests/i915/gem_ctx_engines.c     |   4 ++
> >  tests/i915/gem_ctx_exec.c        |  28 +++++++-
> >  tests/i915/gem_ctx_freq.c        |   4 ++
> >  tests/i915/gem_ctx_isolation.c   |  38 ++++++++++-
> >  tests/i915/gem_ctx_param.c       |  76 +++++++++++++++++++++
> >  tests/i915/gem_ctx_persistence.c | 112 +++++++++++++++++++++++++++++++
> >  tests/i915/gem_ctx_shared.c      |  37 +++++++++-
> >  9 files changed, 321 insertions(+), 4 deletions(-)

...

> > diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> > index 2c2da296d301..d50a90597e6f 100644

...

> >   * SUBTEST: preservation
> > + * Category: Infrastructure
> > + * Feature: context
> > + * Functionality: security
> > + * Sub-category: HW
> > + * Test category: GEM_Legacy
> >   *
> >   * SUBTEST: preservation-S3
> > + * Feature: context  
> 
> No other fields here?
> 
> >   *
> >   * SUBTEST: preservation-S4
> > + * Feature: context  
> 
> Same here, imho we can correct that later.

Agreed. Not all tests are documented with the same level of information.
By placing what we have at the source files, it should be easier to
keep them with the same level or details later on.

> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks!

Regards,
Mauro
