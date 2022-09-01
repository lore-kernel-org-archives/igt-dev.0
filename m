Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C5210E66D
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 10:56:15 +0000 (UTC)
Date: Thu, 1 Sep 2022 12:56:09 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20220901125609.242835c6@maurocar-mobl2>
In-Reply-To: <YxB5IMoe9slyOn/5@platvala-desk.ger.corp.intel.com>
References: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
 <20220901063722.261828-2-mauro.chehab@linux.intel.com>
 <YxB5IMoe9slyOn/5@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 01/74] lib: Introduce typed cleanups
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

On Thu, 1 Sep 2022 12:19:28 +0300
Petri Latvala <petri.latvala@intel.com> wrote:

> On Thu, Sep 01, 2022 at 08:36:09AM +0200, Mauro Carvalho Chehab wrote:
> > From: Chris Wilson <chris@chris-wilson.co.uk>
> > 
> > Start introducing standard types with automatic cleanup courtesy of
> > gcc's __attribute__((cleanup)). As an example, we start with an fd
> > that will automatically call close() on going out of scope, and
> > crucially before atexit where we will want to check for resource leaks.
> > 
> > Suggested-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Acked-by: Nirmoy Das <nirmoy.das@linux.intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

...

> > +void igt_cleanup_fd(int *fd);
> > +#define igt_fd_t(x__) \
> > +	int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
> > +
> > +#endif /* IGT_TYPES_H */

...

> 
> This fails with clang currently, and might fail with gcc in the
> future. longjmp is funky.

It is unlikely that gcc would change it, but yeah, there's a possibility.

There's an easy to workaround: just check if CONFIG_CLANG_VERSION is
defined, disabling the logic on such case with something like:

/*
 * FIXME: on clang, stack variables are lost after setjmp()
 */
#ifdef CONFIG_CLANG_VERSION
#  define igt_fd_t(x__) int x__
#else
#  define igt_fd_t(x__) \
       int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
#endif

This would keep the file descriptors opened on Clang, but it would
at least solve for gcc.

> If an automatic (stack) variable is assigned after setjmp(), the
> longjmp to "before" the assignment has the variable in unspecified
> state as per the C spec. In the sense that the value can be either.

I see. Yeah, handling undefined behavior cases are complex.

I guess one possible solution would be to define the macro as:

#define igt_fd_t(x__) \
       static int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
#endif

but I didn't check the C spec to see if this has a defined behavior,
nor tested it.

> We've already had to deal with some of this, see the comment at the
> beginning of runner/runner_tests.c and the sprinkled use of volatile
> for variables that are declared in subtest_group scope.
> 
> (It could be a gcc implementation detail but variables declared in
> igt_main scope have been fine in testing this curiosity)

Regards,
Mauro
