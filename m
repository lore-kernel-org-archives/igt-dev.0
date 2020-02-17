Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58926E930
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 11:36:12 +0000 (UTC)
From: "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>
Date: Mon, 17 Feb 2020 11:36:10 +0000
Message-ID: <a3b8867148e944498ef51b7f9f9b64f7@intel.com>
References: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
 <20200217110130.GH25209@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200217110130.GH25209@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: "Latvala, Petri" <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> From: Latvala, Petri <petri.latvala@intel.com>
> 
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
> > -			igt_kselftest_execute(&tst, tl,
> options, result);
> > -		free(tl);
> > +	igt_subtest_with_dynamic(filter ?: "all") {
> > +		igt_list_for_each_entry_safe(tl, tn, &tests, link)
> {
> > +			igt_dynamic_f("%s",
> unfilter(filter, tl->name))
> > +
> 	igt_kselftest_execute(&tst, tl, options, result);
> > +			free(tl);
> > +		}
> >  	}
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

Acked-by: Tomi Sarvela <tomi.p.sarvela@intel.com>

This is good: the discovery of sub-selftests will be done by the tests, so
we can drop the selftest.testlist and use common blacklist where applicable.

> Tomi, what do we run (and what do we want to) in BAT now? Objections
> to running selftests in shards mixed in with other tests?

BAT is running fast-feedback.testlist and after that from selftests:
igt@i915_selftest@live_*
igt@dmabuf@*

In other words, currently blacklisted selftests in BAT are:
igt@i915_selftest@{mock,perf}_*
igt@drm_mm@*
igt@kms_selftest@*

I don't mind selftests being shuffled through all the other tests, we have
the checks in place for taint/lockdep to recognize hopeless driver states
to force reboot.

> Runtime is a concern if all (FSVO all) selftests are launched with one
> entry in a testlist. What is the total runtime on a random platform
> for, say, i915_selftest subtests (post patch)? We might need to split
> more than just live/mock.

Runtimes for last functional selftest shard are from CI_DRM_7925:
tgl 186s
hsw 762s
glk 223s
icl 177s
kbl 199s
apl 284s
snb 112s
skl 763s

The obvious outliers are SKL and HSW:
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-skl10/igt_runner35.txt 
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-hsw5/igt_runner35.txt 

HSW due to timeout in live_gtt which wasted 10 minutes, SKL due to generic slowness
and in addition couple of drm_mm tests taking > 100s per subtest.
 
Tomi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
