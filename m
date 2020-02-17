Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BC96E92F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 11:17:31 +0000 (UTC)
Date: Mon, 17 Feb 2020 13:17:28 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200217111728.GI25209@platvala-desk.ger.corp.intel.com>
References: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
 <20200217110130.GH25209@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217110130.GH25209@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Update selftests to use dynamic
 subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 17, 2020 at 01:01:30PM +0200, Petri Latvala wrote:
> On Fri, Feb 14, 2020 at 09:48:29PM +0000, Chris Wilson wrote:
> > Use the new igt_subtest_with_dynamic to nicely group the dynamic
> > subtests together.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
> > ---
> >  lib/igt_kmod.c | 23 +++++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 05019c24c..e701545d3 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -21,6 +21,7 @@
> >   * IN THE SOFTWARE.
> >   */
> >  
> > +#include <ctype.h>
> >  #include <signal.h>
> >  #include <errno.h>
> >  
> > @@ -602,6 +603,18 @@ void igt_kselftest_fini(struct igt_kselftest *tst)
> >  	kmod_module_unref(tst->kmod);
> >  }
> >  
> > +static const char *unfilter(const char *filter, const char *name)
> > +{
> > +	if (!filter)
> > +		return name;
> > +
> > +	name += strlen(filter);
> > +	if (!isalpha(*name))
> > +		name++;
> > +
> > +	return name;
> > +}
> > +
> >  void igt_kselftests(const char *module_name,
> >  		    const char *options,
> >  		    const char *result,
> > @@ -618,10 +631,12 @@ void igt_kselftests(const char *module_name,
> >  		igt_require(igt_kselftest_begin(&tst) == 0);
> >  
> >  	igt_kselftest_get_tests(tst.kmod, filter, &tests);
> > -	igt_list_for_each_entry_safe(tl, tn, &tests, link) {
> > -		igt_subtest_f("%s", tl->name)
> > -			igt_kselftest_execute(&tst, tl, options, result);
> > -		free(tl);
> > +	igt_subtest_with_dynamic(filter ?: "all") {
> > +		igt_list_for_each_entry_safe(tl, tn, &tests, link) {
> > +			igt_dynamic_f("%s", unfilter(filter, tl->name))
> > +				igt_kselftest_execute(&tst, tl, options, result);
> > +			free(tl);
> > +		}
> >  	}
> 
> 
> 
> Thanks for starting this, exactly what dynamic subtests are for.
> 
> Pre-acked-by: Petri Latvala <petri.latvala@intel.com>
> 
> CI side should be made ready before landing this. With kernel
> selftests being now launched from statically enumerable subtests,
> selftests can be added to fast-feedback.testlist and un-blacklisted
> from shards where applicable.
> 
> Tomi, what do we run (and what do we want to) in BAT now? Objections
> to running selftests in shards mixed in with other tests?
> 
> Runtime is a concern if all (FSVO all) selftests are launched with one
> entry in a testlist. What is the total runtime on a random platform
> for, say, i915_selftest subtests (post patch)? We might need to split
> more than just live/mock.


Oh, and in the same patch you can do this:

Find the ugliest line you can find in tests/igt_command_line.sh and
change it to a prettier one.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
