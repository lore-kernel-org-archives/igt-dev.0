Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49AC10E82B
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Sep 2022 12:48:55 +0000 (UTC)
Date: Fri, 2 Sep 2022 14:48:40 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20220902144840.6728d805@maurocar-mobl2>
In-Reply-To: <YxCWediao6eQtbbq@platvala-desk.ger.corp.intel.com>
References: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
 <20220901063722.261828-2-mauro.chehab@linux.intel.com>
 <YxB5IMoe9slyOn/5@platvala-desk.ger.corp.intel.com>
 <20220901125609.242835c6@maurocar-mobl2>
 <20220901130946.53262572@maurocar-mobl2>
 <YxCWediao6eQtbbq@platvala-desk.ger.corp.intel.com>
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

On Thu, 1 Sep 2022 14:24:41 +0300
Petri Latvala <petri.latvala@intel.com> wrote:

> On Thu, Sep 01, 2022 at 01:09:46PM +0200, Mauro Carvalho Chehab wrote:
> > On Thu, 1 Sep 2022 12:56:09 +0200
> > Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> >   
> > > On Thu, 1 Sep 2022 12:19:28 +0300
> > > Petri Latvala <petri.latvala@intel.com> wrote:
> > >   
> > > > On Thu, Sep 01, 2022 at 08:36:09AM +0200, Mauro Carvalho Chehab wrote:    
> > > > > From: Chris Wilson <chris@chris-wilson.co.uk>
> > > > > 
> > > > > Start introducing standard types with automatic cleanup courtesy of
> > > > > gcc's __attribute__((cleanup)). As an example, we start with an fd
> > > > > that will automatically call close() on going out of scope, and
> > > > > crucially before atexit where we will want to check for resource leaks.
> > > > > 
> > > > > Suggested-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > > > Acked-by: Nirmoy Das <nirmoy.das@linux.intel.com>
> > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>    
> > > 
> > > ...
> > >   
> > > > > +void igt_cleanup_fd(int *fd);
> > > > > +#define igt_fd_t(x__) \
> > > > > +	int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
> > > > > +
> > > > > +#endif /* IGT_TYPES_H */    
> > > 
> > > ...
> > >   
> > > > 
> > > > This fails with clang currently, and might fail with gcc in the
> > > > future. longjmp is funky.    
> > > 
> > > It is unlikely that gcc would change it, but yeah, there's a possibility.
> > > 
> > > There's an easy to workaround: just check if CONFIG_CLANG_VERSION is
> > > defined, disabling the logic on such case with something like:
> > > 
> > > /*
> > >  * FIXME: on clang, stack variables are lost after setjmp()
> > >  */
> > > #ifdef CONFIG_CLANG_VERSION
> > > #  define igt_fd_t(x__) int x__
> > > #else
> > > #  define igt_fd_t(x__) \
> > >        int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
> > > #endif
> > > 
> > > This would keep the file descriptors opened on Clang, but it would
> > > at least solve for gcc.
> > >   
> > > > If an automatic (stack) variable is assigned after setjmp(), the
> > > > longjmp to "before" the assignment has the variable in unspecified
> > > > state as per the C spec. In the sense that the value can be either.    
> > > 
> > > I see. Yeah, handling undefined behavior cases are complex.
> > > 
> > > I guess one possible solution would be to define the macro as:
> > > 
> > > #define igt_fd_t(x__) \
> > >        static int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
> > > #endif
> > > 
> > > but I didn't check the C spec to see if this has a defined behavior,
> > > nor tested it.  
> > 
> > Answering myself:  this won't work, as the macro uses __cleanup__
> > atribute, which is only valid for stack-allocated variables:
> > 
> > 	../tests/i915/gem_request_retire.c:109:2: warning: '__cleanup__' attribute only applies to local variables [-Wignored-attributes]
> > 
> > A solution that would work would be to store a list of file
> > descriptors on a static list and then use it during cleanup time
> > (assuming that clang will still call the cleanup function with 
> > longjmp).   
> 
> Yeah the only thing that helps really is volatile. That is fully
> specified as per spec for this.
> 
> Having said that: What if igt_fd_t just used volatile across the
> board?

Do you mean folding this change on patch 01/74?

<snip>
diff --git a/lib/igt_types.c b/lib/igt_types.c
index 7416b0fffc04..392f30fcab23 100644
--- a/lib/igt_types.c
+++ b/lib/igt_types.c
@@ -7,7 +7,7 @@
 
 #include "igt_types.h"
 
-void igt_cleanup_fd(int *fd)
+void igt_cleanup_fd(volatile int *fd)
 {
 	if (!fd || *fd < 0)
 		return;
diff --git a/lib/igt_types.h b/lib/igt_types.h
index 1852026969ae..c4bc01ecdb3b 100644
--- a/lib/igt_types.h
+++ b/lib/igt_types.h
@@ -40,8 +40,8 @@
 /* Prevent use within the inner scope subtests, it will be broken by igt_skip */
 #define IGT_OUTER_SCOPE_INIT(x) ({ __igt_assert_in_outer_scope(); x; })
 
-void igt_cleanup_fd(int *fd);
+void igt_cleanup_fd(volatile int *fd);
 #define igt_fd_t(x__) \
-	int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
+	volatile int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
 
 #endif /* IGT_TYPES_H */

</snip>

This builds fine, but didn't try yet checking if it will do the right 
thing.

Regards,
Mauro
