Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <224cefba-4b48-c085-b0b5-952b62af29b3@intel.com>
References: <20200214194016.4054376-1-chris@chris-wilson.co.uk>
 <20200214194016.4054376-2-chris@chris-wilson.co.uk>
 <224cefba-4b48-c085-b0b5-952b62af29b3@intel.com>
Message-ID: <158171744428.15393.6774321422582015904@skylake-alporthouse-com>
Date: Fri, 14 Feb 2020 21:57:24 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] i915/gem_ctx_engine: Exercise
 for_each_context_engine() with custom engine[]
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Antonio Argenziano (2020-02-14 21:49:16)
> 
> 
> On 14/02/20 11:40, Chris Wilson wrote:
> > Set up a custom engine map with no engines, and check that the
> > for_each_context_engine() correctly iterates over nothing.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >   tests/i915/gem_ctx_engines.c | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> > 
> > diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> > index 063140e0f..6a2edd1e0 100644
> > --- a/tests/i915/gem_ctx_engines.c
> > +++ b/tests/i915/gem_ctx_engines.c
> > @@ -549,6 +549,31 @@ static void independent(int i915)
> >       gem_context_destroy(i915, param.ctx_id);
> >   }
> >   
> > +static void libapi(int i915)
> > +{
> > +     struct i915_context_param_engines engines = {};
> 
> Is there a case for invalid engines as well?

One would have to think what the behaviour should be :)

for_each_context_engine() should iterate over every engine defined,
providing you with (e->class, e->instance, e->pretty_name).

Invalid will still have an entry, maybe with "unknown".

for_each_physical_engine would skip invalid entries that are rejected by
the kernel. It's really just
	for_each_context_engine()
		for_each_if(gem_has_ring())

and I think I should drop the second loop here and focus on testing that
for_each_context_engine() simply reports back the class:inst we put
into the context.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
