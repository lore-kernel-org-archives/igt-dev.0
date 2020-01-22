Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76396F529
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2020 13:52:39 +0000 (UTC)
Date: Wed, 22 Jan 2020 15:52:36 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200122135236.GK25209@platvala-desk.ger.corp.intel.com>
References: <20191115121445.11693-1-petri.latvala@intel.com>
 <59311102-b402-49e5-7c62-b235123b3d0c@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59311102-b402-49e5-7c62-b235123b3d0c@linux.intel.com>
Subject: Re: [igt-dev] [RFC PATCH i-g-t] lib/i915: Generate engine names at
 runtime
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 01:44:58PM +0000, Tvrtko Ursulin wrote:
> 
> On 15/11/2019 12:14, Petri Latvala wrote:
> > The kernel supplies us an engine list with engine class and an
> > instance id. If the hardcoded engine list doesn't have the
> > class+instance we get, construct the engine name with printf instead
> > of calling additional engines "unknown".
> > 
> > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Andi Shyti <andi.shyti@intel.com>
> > Cc: Katarzyna Dec <katarzyna.dec@intel.com>
> > 
> > ---
> >   lib/i915/gem_engine_topology.c | 27 +++++++++++++++++++--------
> >   lib/i915/gem_engine_topology.h |  2 +-
> >   lib/igt_gt.c                   |  8 ++++++++
> >   lib/igt_gt.h                   |  7 ++++++-
> >   4 files changed, 34 insertions(+), 10 deletions(-)
> > 
> > diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> > index 790d455f..0707f237 100644
> > --- a/lib/i915/gem_engine_topology.c
> > +++ b/lib/i915/gem_engine_topology.c
> > @@ -103,6 +103,7 @@ static void init_engine(struct intel_execution_engine2 *e2,
> >   	const struct intel_execution_engine2 *__e2;
> >   	static const char *unknown_name = "unknown",
> >   			  *virtual_name = "virtual";
> > +	const struct intel_execution_engine_class *cls;
> >   	e2->class    = class;
> >   	e2->instance = instance;
> > @@ -111,7 +112,7 @@ static void init_engine(struct intel_execution_engine2 *e2,
> >   	/* engine is a virtual engine */
> >   	if (class == I915_ENGINE_CLASS_INVALID &&
> >   	    instance == I915_ENGINE_CLASS_INVALID_VIRTUAL) {
> > -		e2->name = virtual_name;
> > +		strncpy(e2->name, virtual_name, sizeof(e2->name));
> >   		e2->is_virtual = true;
> >   		return;
> >   	}
> > @@ -120,12 +121,22 @@ static void init_engine(struct intel_execution_engine2 *e2,
> >   		if (__e2->class == class && __e2->instance == instance)
> >   			break;
> > -	if (__e2->name) {
> > -		e2->name = __e2->name;
> > +	if (__e2->name[0]) {
> > +		strncpy(e2->name, __e2->name, sizeof(e2->name));
> >   	} else {
> > -		igt_warn("found unknown engine (%d, %d)\n", class, instance);
> > -		e2->name = unknown_name;
> > -		e2->flags = -1;
> > +		for (cls = intel_execution_engine_class_map; cls->name; cls++) {
> > +			if (cls->class == class) {
> > +				snprintf(e2->name, sizeof(e2->name), "%s%d", cls->name, instance);
> > +				igt_info("unknown but supported engine %s found\n", e2->name);
> > +				break;
> > +			}
> > +		}
> > +
> > +		if (!e2->name[0]) {
> > +			igt_info("found unknown engine (%d, %d)\n", class, instance);
> > +			strncpy(e2->name, unknown_name, sizeof(e2->name));
> > +			e2->flags = -1;
> > +		}
> >   	}
> >   	/* just to remark it */
> > @@ -223,7 +234,7 @@ struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id)
> >   			struct intel_execution_engine2 *__e2 =
> >   				&engine_data.engines[engine_data.nengines];
> > -			__e2->name       = e2->name;
> > +			strncpy(__e2->name, e2->name, sizeof(__e2->name));
> >   			__e2->instance   = e2->instance;
> >   			__e2->class      = e2->class;
> >   			__e2->flags      = e2->flags;
> > @@ -302,7 +313,7 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags)
> >   	if (ring == I915_EXEC_DEFAULT) {
> >   		e2__.flags = I915_EXEC_DEFAULT;
> > -		e2__.name = "default";
> > +		strncpy(e2__.name, "default", sizeof(e2__.name));
> >   	} else {
> >   		const struct intel_execution_engine2 *e2;
> > diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
> > index d98773e0..525741cc 100644
> > --- a/lib/i915/gem_engine_topology.h
> > +++ b/lib/i915/gem_engine_topology.h
> > @@ -61,7 +61,7 @@ bool gem_engine_is_equal(const struct intel_execution_engine2 *e1,
> >   struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
> >   #define __for_each_static_engine(e__) \
> > -	for ((e__) = intel_execution_engines2; (e__)->name; (e__)++)
> > +	for ((e__) = intel_execution_engines2; (e__)->name[0]; (e__)++)
> >   #define for_each_context_engine(fd__, ctx__, e__) \
> >   	for (struct intel_engine_data i__ = intel_init_engine_list(fd__, ctx__); \
> > diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> > index 256c7cbc..25e6c455 100644
> > --- a/lib/igt_gt.c
> > +++ b/lib/igt_gt.c
> > @@ -596,6 +596,14 @@ const struct intel_execution_engine2 intel_execution_engines2[] = {
> >   	{ }
> >   };
> > +const struct intel_execution_engine_class intel_execution_engine_class_map[] = {
> > +	{ "rcs", I915_ENGINE_CLASS_RENDER },
> > +	{ "bcs", I915_ENGINE_CLASS_COPY },
> > +	{ "vcs", I915_ENGINE_CLASS_VIDEO },
> > +	{ "vecs", I915_ENGINE_CLASS_VIDEO_ENHANCE },
> > +	{ }
> > +};
> > +
> >   int gem_execbuf_flags_to_engine_class(unsigned int flags)
> >   {
> >   	switch (flags & 0x3f) {
> > diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> > index 66088d39..0268031f 100644
> > --- a/lib/igt_gt.h
> > +++ b/lib/igt_gt.h
> > @@ -95,13 +95,18 @@ bool gem_can_store_dword(int fd, unsigned int engine);
> >   bool gem_class_can_store_dword(int fd, int class);
> >   extern const struct intel_execution_engine2 {
> > -	const char *name;
> > +	char name[10];
> 
> You have the same bug as I do in
> https://patchwork.freedesktop.org/series/72384/ in that
> __for_each_static_engine has no engine names? :) And I have another bug that
> I missed to adjust the iterator macro. :)

See the chunk above that edits __for_each_static_engine to check
(e__)->name[0] instead of (e__)->name, I think that was missing in
your version.

> Otherwise similar implementations. Lets do one of the two and get it over
> with... You were here first so do you want to send an update including past
> and latest tweaks? Or if you are busy I'll tweak my version into submission.

The minor details like cleaner looking loops over the name table and
the way you did init_engine() makes me lean towards going with your
code. I'll be happy to review it.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
