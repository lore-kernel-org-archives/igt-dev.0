Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 22 Jan 2020 12:33:40 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200122103340.GH25209@platvala-desk.ger.corp.intel.com>
References: <20200122101043.21347-1-tvrtko.ursulin@linux.intel.com>
 <c4d26e02-2b86-7ebd-f848-8cb36882841d@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4d26e02-2b86-7ebd-f848-8cb36882841d@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_engine_topology: Generate
 engine names based on class
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
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 10:15:56AM +0000, Tvrtko Ursulin wrote:
> 
> On 22/01/2020 10:10, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > With the introduction of dynamic subtests we got one step closer towards
> > eliminating the duality of static and dynamic engine enumeration.
> > 
> > This patch makes one more step in that direction by removing the
> > dependency on the static list when generating probed engine names.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Andi Shyti <andi.shyti@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > ---
> >   lib/i915/gem_engine_topology.c | 39 +++++++++++++++++++---------------
> >   lib/igt_gt.h                   |  2 +-
> >   2 files changed, 23 insertions(+), 18 deletions(-)
> > 
> > diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> > index 790d455ff2ad..eff231800b77 100644
> > --- a/lib/i915/gem_engine_topology.c
> > +++ b/lib/i915/gem_engine_topology.c
> > @@ -97,39 +97,43 @@ static void ctx_map_engines(int fd, struct intel_engine_data *ed,
> >   	gem_context_set_param(fd, param);
> >   }
> > +static const char *class_names[] = {
> > +	[I915_ENGINE_CLASS_RENDER]	  = "rcs",
> > +	[I915_ENGINE_CLASS_COPY]	  = "bcs",
> > +	[I915_ENGINE_CLASS_VIDEO]	  = "vcs",
> > +	[I915_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
> > +};
> > +
> >   static void init_engine(struct intel_execution_engine2 *e2,
> >   			int class, int instance, uint64_t flags)
> >   {
> > -	const struct intel_execution_engine2 *__e2;
> > -	static const char *unknown_name = "unknown",
> > -			  *virtual_name = "virtual";
> > +	int ret;
> >   	e2->class    = class;
> >   	e2->instance = instance;
> > -	e2->flags    = flags;
> >   	/* engine is a virtual engine */
> >   	if (class == I915_ENGINE_CLASS_INVALID &&
> >   	    instance == I915_ENGINE_CLASS_INVALID_VIRTUAL) {
> > -		e2->name = virtual_name;
> > +		strcpy(e2->name, "virtual");
> >   		e2->is_virtual = true;
> >   		return;
> > +	} else {
> > +		e2->is_virtual = false;
> >   	}
> > -	__for_each_static_engine(__e2)
> > -		if (__e2->class == class && __e2->instance == instance)
> > -			break;
> > -
> > -	if (__e2->name) {
> > -		e2->name = __e2->name;
> > +	if (class < ARRAY_SIZE(class_names)) {
> > +		e2->flags = flags;
> > +		ret = snprintf(e2->name, sizeof(e2->name), "%s%u",
> > +			       class_names[class], instance);
> >   	} else {
> >   		igt_warn("found unknown engine (%d, %d)\n", class, instance);
> > -		e2->name = unknown_name;
> >   		e2->flags = -1;
> > +		ret = snprintf(e2->name, sizeof(e2->name), "%u-%u",
> > +			       class, instance);
> >   	}
> > -	/* just to remark it */
> > -	e2->is_virtual = false;
> > +	igt_assert(ret < sizeof(e2->name));
> >   }
> >   static void query_engine_list(int fd, struct intel_engine_data *ed)
> > @@ -223,7 +227,7 @@ struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id)
> >   			struct intel_execution_engine2 *__e2 =
> >   				&engine_data.engines[engine_data.nengines];
> > -			__e2->name       = e2->name;
> > +			strcpy(__e2->name, e2->name);
> >   			__e2->instance   = e2->instance;
> >   			__e2->class      = e2->class;
> >   			__e2->flags      = e2->flags;
> > @@ -297,12 +301,11 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags)
> >   		.class = -1,
> >   		.instance = -1,
> >   		.flags = -1,
> > -		.name = "invalid"
> >   	};
> >   	if (ring == I915_EXEC_DEFAULT) {
> >   		e2__.flags = I915_EXEC_DEFAULT;
> > -		e2__.name = "default";
> > +		strcpy(e2__.name, "default");
> >   	} else {
> >   		const struct intel_execution_engine2 *e2;
> > @@ -310,6 +313,8 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags)
> >   			if (e2->flags == ring)
> >   				return *e2;
> >   		}
> > +
> > +		strcpy(e2__.name, "invalid");
> >   	}
> >   	return e2__;
> > diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> > index 66088d39176a..6a8eceb68817 100644
> > --- a/lib/igt_gt.h
> > +++ b/lib/igt_gt.h
> > @@ -95,7 +95,7 @@ bool gem_can_store_dword(int fd, unsigned int engine);
> >   bool gem_class_can_store_dword(int fd, int class);
> >   extern const struct intel_execution_engine2 {
> > -	const char *name;
> > +	char name[16];
> 
> I forgot that with this approach I'd need to apply default names somewhere
> during IGT framework startup. :I As I forgot Petri you already had a patch
> which solves the overall problem. Will re-read your solution. Where did it
> get stuck btw?


To the feedback from Andi that a third table for kind of the same
thing is getting a bit much. And me being completely clueless about
GEM so couldn't quite get myself to push this further. If you can
convince Andi that the code will get cleaner now, we should be good :P


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
