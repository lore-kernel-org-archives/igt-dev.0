Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5676EC2B
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Nov 2021 21:59:44 +0000 (UTC)
Date: Tue, 2 Nov 2021 14:55:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20211102215510.GA15844@jons-linux-dev-box>
References: <20211022001844.36634-1-matthew.brost@intel.com>
 <e2bd14ef-7689-7947-b27f-a3f4d76edbe1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e2bd14ef-7689-7947-b27f-a3f4d76edbe1@intel.com>
Subject: Re: [igt-dev] [PATCH] i915/gem_exec_balancer: Test parallel execbuf
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 11:34:08AM -0700, Daniele Ceraolo Spurio wrote:
>=20
>=20
> On 10/21/2021 5:18 PM, Matthew Brost wrote:
> > Add basic parallel execbuf submission test which more or less just
> > submits the same BB in loop a which does an atomic increment to a memory
> > location. The memory location is checked at the end for the correct
> > value. Different sections use various IOCTL options (e.g. fences,
> > location of BBs, etc...).
> >=20
> > In addition to above sections, an additional section ensure the ordering
> > of parallel submission by submitting a spinning batch to 1 individual
> > engine, submit a parallel execbuf to all engines instances within the
> > class, verify none on parallel execbuf make to hardware, release
> > spinner, and finally verify everything has completed.
> >=20
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   include/drm-uapi/i915_drm.h    | 136 ++++++++-
> >   lib/intel_ctx.c                |  28 +-
> >   lib/intel_ctx.h                |   2 +
> >   lib/intel_reg.h                |   5 +
> >   tests/i915/gem_exec_balancer.c | 487 +++++++++++++++++++++++++++++++++
> >   5 files changed, 656 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> > index c788a1ab4..b57f52623 100644
> > --- a/include/drm-uapi/i915_drm.h
> > +++ b/include/drm-uapi/i915_drm.h
>=20
> The uapi file needs to be in sync with drm-next. If the changes have alre=
ady
> reached drm-next then we should just have a separate patch doing the file
> sync, otherwise these defs must move to lib/i915/i915_drm_local.h
>=20

I think the uAPI changes have landed in drm-next. I'm going to guess the
DIM script can sync header files for me. Let me look into this.=20


> > @@ -1824,6 +1824,7 @@ struct drm_i915_gem_context_param {
> >    * Extensions:
> >    *   i915_context_engines_load_balance (I915_CONTEXT_ENGINES_EXT_LOAD=
_BALANCE)
> >    *   i915_context_engines_bond (I915_CONTEXT_ENGINES_EXT_BOND)
> > + *   i915_context_engines_parallel_submit (I915_CONTEXT_ENGINES_EXT_PA=
RALLEL_SUBMIT)
> >    */
> >   #define I915_CONTEXT_PARAM_ENGINES	0xa
> > @@ -2104,10 +2105,137 @@ struct i915_context_engines_bond {
> >    * 	gem_execbuf(drm_fd, &execbuf);
> >    */
> > +/**
> > + * struct i915_context_engines_parallel_submit - Configure engine for
> > + * parallel submission.
> > + *
> > + * Setup a slot in the context engine map to allow multiple BBs to be =
submitted
> > + * in a single execbuf IOCTL. Those BBs will then be scheduled to run =
on the GPU
> > + * in parallel. Multiple hardware contexts are created internally in t=
he i915
> > + * run these BBs. Once a slot is configured for N BBs only N BBs can be
> > + * submitted in each execbuf IOCTL and this is implicit behavior e.g. =
The user
> > + * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL k=
nows how
> > + * many BBs there are based on the slot's configuration. The N BBs are=
 the last
> > + * N buffer objects or first N if I915_EXEC_BATCH_FIRST is set.
> > + *
> > + * The default placement behavior is to create implicit bonds between =
each
> > + * context if each context maps to more than 1 physical engine (e.g. c=
ontext is
> > + * a virtual engine). Also we only allow contexts of same engine class=
 and these
> > + * contexts must be in logically contiguous order. Examples of the pla=
cement
> > + * behavior described below. Lastly, the default is to not allow BBs to
> > + * preempted mid BB rather insert coordinated preemption on all hardwa=
re
> > + * contexts between each set of BBs. Flags may be added in the future =
to change
> > + * both of these default behaviors.
> > + *
> > + * Returns -EINVAL if hardware context placement configuration is inva=
lid or if
> > + * the placement configuration isn't supported on the platform / submi=
ssion
> > + * interface.
> > + * Returns -ENODEV if extension isn't supported on the platform / subm=
ission
> > + * interface.
> > + *
> > + * .. code-block:: none
> > + *
> > + *	Example 1 pseudo code:
> > + *	CS[X] =3D generic engine of same class, logical instance X
> > + *	INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NO=
NE
> > + *	set_engines(INVALID)
> > + *	set_parallel(engine_index=3D0, width=3D2, num_siblings=3D1,
> > + *		     engines=3DCS[0],CS[1])
> > + *
> > + *	Results in the following valid placement:
> > + *	CS[0], CS[1]
> > + *
> > + *	Example 2 pseudo code:
> > + *	CS[X] =3D generic engine of same class, logical instance X
> > + *	INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NO=
NE
> > + *	set_engines(INVALID)
> > + *	set_parallel(engine_index=3D0, width=3D2, num_siblings=3D2,
> > + *		     engines=3DCS[0],CS[2],CS[1],CS[3])
> > + *
> > + *	Results in the following valid placements:
> > + *	CS[0], CS[1]
> > + *	CS[2], CS[3]
> > + *
> > + *	This can also be thought of as 2 virtual engines described by 2-D a=
rray
> > + *	in the engines the field with bonds placed between each index of the
> > + *	virtual engines. e.g. CS[0] is bonded to CS[1], CS[2] is bonded to
> > + *	CS[3].
> > + *	VE[0] =3D CS[0], CS[2]
> > + *	VE[1] =3D CS[1], CS[3]
> > + *
> > + *	Example 3 pseudo code:
> > + *	CS[X] =3D generic engine of same class, logical instance X
> > + *	INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NO=
NE
> > + *	set_engines(INVALID)
> > + *	set_parallel(engine_index=3D0, width=3D2, num_siblings=3D2,
> > + *		     engines=3DCS[0],CS[1],CS[1],CS[3])
> > + *
> > + *	Results in the following valid and invalid placements:
> > + *	CS[0], CS[1]
> > + *	CS[1], CS[3] - Not logical contiguous, return -EINVAL
> > + */
> > +struct i915_context_engines_parallel_submit {
> > +	/**
> > +	 * @base: base user extension.
> > +	 */
> > +	struct i915_user_extension base;
> > +
> > +	/**
> > +	 * @engine_index: slot for parallel engine
> > +	 */
> > +	__u16 engine_index;
> > +
> > +	/**
> > +	 * @width: number of contexts per parallel engine
> > +	 */
> > +	__u16 width;
> > +
> > +	/**
> > +	 * @num_siblings: number of siblings per context
> > +	 */
> > +	__u16 num_siblings;
> > +
> > +	/**
> > +	 * @mbz16: reserved for future use; must be zero
> > +	 */
> > +	__u16 mbz16;
> > +
> > +	/**
> > +	 * @flags: all undefined flags must be zero, currently not defined fl=
ags
> > +	 */
> > +	__u64 flags;
> > +
> > +	/**
> > +	 * @mbz64: reserved for future use; must be zero
> > +	 */
> > +	__u64 mbz64[3];
> > +
> > +	/**
> > +	 * @engines: 2-d array of engine instances to configure parallel engi=
ne
> > +	 *
> > +	 * length =3D width (i) * num_siblings (j)
> > +	 * index =3D j + i * num_siblings
> > +	 */
> > +	struct i915_engine_class_instance engines[0];
> > +
> > +} __packed;
> > +
> > +#define I915_DEFINE_CONTEXT_ENGINES_PARALLEL_SUBMIT(name__, N__) struc=
t { \
> > +	struct i915_user_extension base; \
> > +	__u16 engine_index; \
> > +	__u16 width; \
> > +	__u16 num_siblings; \
> > +	__u16 mbz16; \
> > +	__u64 flags; \
> > +	__u64 mbz64[3]; \
> > +	struct i915_engine_class_instance engines[N__]; \
> > +} __attribute__((packed)) name__
> > +
> >   struct i915_context_param_engines {
> >   	__u64 extensions; /* linked chain of extension blocks, 0 terminates =
*/
> >   #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_e=
ngines_load_balance */
> >   #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_b=
ond */
> > +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context=
_engines_parallel_submit */
> >   	struct i915_engine_class_instance engines[0];
> >   } __attribute__((packed));
> > @@ -2726,14 +2854,20 @@ struct drm_i915_engine_info {
> >   	/** @flags: Engine flags. */
> >   	__u64 flags;
> > +#define I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE		(1 << 0)
> >   	/** @capabilities: Capabilities of this engine. */
> >   	__u64 capabilities;
> >   #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
> >   #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
> > +	/** @logical_instance: Logical instance of engine */
> > +	__u16 logical_instance;
> > +
> >   	/** @rsvd1: Reserved fields. */
> > -	__u64 rsvd1[4];
> > +	__u16 rsvd1[3];
> > +	/** @rsvd2: Reserved fields. */
> > +	__u64 rsvd2[3];
> >   };
> >   /**
> > diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
> > index f28c15544..11ec6fca4 100644
> > --- a/lib/intel_ctx.c
> > +++ b/lib/intel_ctx.c
> > @@ -83,6 +83,7 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *c=
fg, uint32_t *ctx_id)
> >   {
> >   	uint64_t ext_root =3D 0;
> >   	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(balance, GEM_MAX_ENGINES);
> > +	I915_DEFINE_CONTEXT_ENGINES_PARALLEL_SUBMIT(parallel, GEM_MAX_ENGINES=
);
> >   	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, GEM_MAX_ENGINES);
> >   	struct drm_i915_gem_context_create_ext_setparam engines_param, vm_pa=
ram;
> >   	struct drm_i915_gem_context_create_ext_setparam persist_param;
> > @@ -117,7 +118,29 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t=
 *cfg, uint32_t *ctx_id)
> >   		unsigned num_logical_engines;
> >   		memset(&engines, 0, sizeof(engines));
>=20
> Do we need an assert to make sure cfg->load_balance and cfg->parallel are
> not set at the same time?
>=20

Do we need to - no. Would it be a good idea? Yes. Will do.

> > -		if (cfg->load_balance) {
> > +		if (cfg->parallel) {
> > +			memset(&parallel, 0, sizeof(parallel));
> > +
> > +			num_logical_engines =3D 1;
> > +
> > +			parallel.base.name =3D
> > +				I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT;
> > +
> > +			engines.engines[0].engine_class =3D
> > +				I915_ENGINE_CLASS_INVALID;
> > +			engines.engines[0].engine_instance =3D
> > +				I915_ENGINE_CLASS_INVALID_NONE;
> > +
> > +			parallel.num_siblings =3D cfg->num_engines;
> > +			parallel.width =3D cfg->width;
> > +			for (i =3D 0; i < cfg->num_engines * cfg->width; i++) {
> > +				igt_assert_eq(cfg->engines[0].engine_class,
> > +					      cfg->engines[i].engine_class);
> > +				parallel.engines[i] =3D cfg->engines[i];
> > +			}
> > +
> > +			engines.extensions =3D to_user_pointer(&parallel);
> > +		} else if (cfg->load_balance) {
> >   			memset(&balance, 0, sizeof(balance));
> >   			/* In this case, the first engine is the virtual
> > @@ -127,6 +150,9 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t =
*cfg, uint32_t *ctx_id)
> >   			igt_assert(cfg->num_engines + 1 <=3D GEM_MAX_ENGINES);
> >   			num_logical_engines =3D cfg->num_engines + 1;
> > +			balance.base.name =3D
> > +				I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE;
> > +
> >   			engines.engines[0].engine_class =3D
> >   				I915_ENGINE_CLASS_INVALID;
> >   			engines.engines[0].engine_instance =3D
> > diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
> > index 9649f6d96..89c65fcd3 100644
> > --- a/lib/intel_ctx.h
> > +++ b/lib/intel_ctx.h
> > @@ -46,7 +46,9 @@ typedef struct intel_ctx_cfg {
> >   	uint32_t vm;
> >   	bool nopersist;
> >   	bool load_balance;
> > +	bool parallel;
> >   	unsigned int num_engines;
> > +	unsigned int width;
>=20
> Given that width is only set when parallel is true, we could potentially
> have a single var (parallel_width?) and check for it being > 0 instead of
> checking the bool. Just a thought, not a blocker.
>=20

The precedent seems to be just use a bool (e.g. nopersist, load_balance)
are already in place.

> >   	struct i915_engine_class_instance engines[GEM_MAX_ENGINES];
> >   } intel_ctx_cfg_t;
> > diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> > index c447525a0..44b0d480f 100644
> > --- a/lib/intel_reg.h
> > +++ b/lib/intel_reg.h
> > @@ -2642,6 +2642,11 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOF=
TWARE.
> >   #define STATE3D_COLOR_FACTOR	((0x3<<29)|(0x1d<<24)|(0x01<<16))
> > +/* Atomics */
> > +#define MI_ATOMIC			((0x2f << 23) | 2)
> > +#define   MI_ATOMIC_INLINE_DATA         (1 << 18)
> > +#define   MI_ATOMIC_ADD                 (0x7 << 8)
> > +
> >   /* Batch */
> >   #define MI_BATCH_BUFFER		((0x30 << 23) | 1)
> >   #define MI_BATCH_BUFFER_START	(0x31 << 23)
> > diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balan=
cer.c
> > index e4e5cda4a..171295777 100644
> > --- a/tests/i915/gem_exec_balancer.c
> > +++ b/tests/i915/gem_exec_balancer.c
> > @@ -25,6 +25,7 @@
> >   #include <sched.h>
> >   #include <sys/ioctl.h>
> >   #include <sys/signal.h>
> > +#include <poll.h>
> >   #include "i915/gem.h"
> >   #include "i915/gem_create.h"
> > @@ -56,6 +57,31 @@ static size_t sizeof_load_balance(int count)
> >   #define alloca0(sz) ({ size_t sz__ =3D (sz); memset(alloca(sz__), 0, =
sz__); })
> > +static int
> > +__i915_query(int fd, struct drm_i915_query *q)
> > +{
> > +	if (igt_ioctl(fd, DRM_IOCTL_I915_QUERY, q))
> > +		return -errno;
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +__i915_query_items(int fd, struct drm_i915_query_item *items, uint32_t=
 n_items)
> > +{
> > +	struct drm_i915_query q =3D {
> > +		.num_items =3D n_items,
> > +		.items_ptr =3D to_user_pointer(items),
> > +		};
> > +
> > +	return __i915_query(fd, &q);
> > +}
>=20
> Identical query helpers are implemented in a couple other places
> (lib/i915/intel_memory_region.c, tests/i915/i915_query.c), so I believe we
> have critical usage mass to move them to their own lib file.
>=20

Sure. That might be a follow up or just another patch in the series.

> > +
> > +#define i915_query_items(fd, items, n_items) do { \
> > +		igt_assert_eq(__i915_query_items(fd, items, n_items), 0); \
> > +		errno =3D 0; \
> > +	} while (0)
> > +
> >   static bool has_class_instance(int i915, uint16_t class, uint16_t ins=
tance)
> >   {
> >   	int fd;
> > @@ -2752,6 +2778,380 @@ static void nohangcheck(int i915)
> >   	close(params);
> >   }
> > +static void check_bo(int i915, uint32_t handle, unsigned int count, bo=
ol wait)
>=20
> s/count/expected? you're not using that variable as a count, just as a va=
lue
> to compare against
>

expected is a better name. Will change.
=20
> > +{
> > +	uint32_t *map;
> > +
> > +	map =3D gem_mmap__cpu(i915, handle, 0, 4096, PROT_READ);
> > +	if (wait)
> > +		gem_set_domain(i915, handle, I915_GEM_DOMAIN_CPU,
> > +			       I915_GEM_DOMAIN_CPU);
> > +	igt_assert_eq(map[0], count);
> > +	munmap(map, 4096);
> > +}
> > +
> > +static struct drm_i915_query_engine_info *query_engine_info(int i915)
> > +{
> > +	struct drm_i915_query_engine_info *engines;
> > +	struct drm_i915_query_item item;
> > +
> > +#define QUERY_SIZE	0x4000
> > +	engines =3D malloc(QUERY_SIZE);
> > +	igt_assert(engines);
> > +
> > +	memset(engines, 0, QUERY_SIZE);
> > +	memset(&item, 0, sizeof(item));
> > +	item.query_id =3D DRM_I915_QUERY_ENGINE_INFO;
> > +	item.data_ptr =3D to_user_pointer(engines);
> > +	item.length =3D QUERY_SIZE;
> > +
> > +	i915_query_items(i915, &item, 1);
>=20
> There is an helper you can use for this query (__gem_query_engines)
>=20

Yes, I think that will work.

> > +	igt_assert(item.length >=3D 0);
> > +	igt_assert(item.length <=3D QUERY_SIZE);
> > +#undef QUERY_SIZE
> > +
> > +	return engines;
> > +}
> > +
> > +/* This function only works if siblings contains all instances of a cl=
ass */
> > +static void logical_sort_siblings(int i915,
> > +				  struct i915_engine_class_instance *siblings,
> > +				  unsigned int count)
> > +{
> > +	struct i915_engine_class_instance *sorted;
> > +	struct drm_i915_query_engine_info *engines;
> > +	unsigned int i, j;
> > +
> > +	sorted =3D calloc(count, sizeof(*sorted));
> > +	igt_assert(sorted);
> > +
> > +	engines =3D query_engine_info(i915);
> > +
> > +	for (j =3D 0; j < count; ++j) {
> > +		for (i =3D 0; i < engines->num_engines; ++i) {
> > +			if (siblings[j].engine_class =3D=3D
> > +			    engines->engines[i].engine.engine_class &&
> > +			    siblings[j].engine_instance =3D=3D
> > +			    engines->engines[i].engine.engine_instance) {
> > +				uint16_t logical_instance =3D
> > +					engines->engines[i].logical_instance;
> > +
> > +				igt_assert(logical_instance < count);
> > +				igt_assert(!sorted[logical_instance].engine_class);
> > +				igt_assert(!sorted[logical_instance].engine_instance);
> > +
> > +				sorted[logical_instance] =3D siblings[j];
> > +				break;
> > +			}
> > +		}
> > +		igt_assert(i !=3D engines->num_engines);
> > +	}
> > +
> > +	memcpy(siblings, sorted, sizeof(*sorted) * count);
> > +	free(sorted);
> > +	free(engines);
> > +}
> > +
> > +#define PARALLEL_BB_FIRST		(0x1 << 0)
> > +#define PARALLEL_OUT_FENCE		(0x1 << 1)
> > +#define PARALLEL_IN_FENCE		(0x1 << 2)
> > +#define PARALLEL_SUBMIT_FENCE		(0x1 << 3)
> > +#define PARALLEL_CONTEXTS		(0x1 << 4)
> > +#define PARALLEL_VIRTUAL		(0x1 << 5)
> > +
> > +static void parallel_thread(int i915, unsigned int flags,
> > +			    struct i915_engine_class_instance *siblings,
> > +			    unsigned int count, unsigned int bb_per_execbuf)
> > +{
> > +	const intel_ctx_t *ctx =3D NULL;
> > +	int n, i, j, fence =3D 0;
> > +	uint32_t batch[16];
> > +	struct drm_i915_gem_execbuffer2 execbuf;
> > +	struct drm_i915_gem_exec_object2 obj[32];
>=20
> Max num of objects is 32, do we need an assert that bb_per_execbuf <=3D31=
 to
> leave room for the target BO? Or is that overkill since we likely won't h=
ave
> that many engines?
>

It can't hurt to future proof the code.
=20
> > +#define PARALLEL_BB_LOOP_COUNT	512
> > +	const intel_ctx_t *ctxs[PARALLEL_BB_LOOP_COUNT];
> > +	uint32_t target_bo_idx =3D 0;
> > +	uint32_t first_bb_idx =3D 1;
> > +	intel_ctx_cfg_t cfg;
> > +
> > +	if (flags & PARALLEL_BB_FIRST) {
> > +		target_bo_idx =3D bb_per_execbuf;
> > +		first_bb_idx =3D 0;
> > +	}
> > +
> > +	memset(&cfg, 0, sizeof(cfg));
> > +	if (flags & PARALLEL_VIRTUAL) {
> > +		cfg.parallel =3D true;
> > +		cfg.num_engines =3D count / bb_per_execbuf;
>=20
> igt_assert (count >=3D bb_per_execbuf && count % bb_per_execbuf =3D=3D 0)=
 to make
> sure the provided values are fine?
>

Sure.
=20
> > +		cfg.width =3D bb_per_execbuf;
> > +
> > +		for (i =3D 0; i < cfg.width; ++i)
> > +			for (j =3D 0; j < cfg.num_engines; ++j)
> > +				memcpy(cfg.engines + i * cfg.num_engines + j,
> > +				       siblings + j * cfg.width + i,
> > +				       sizeof(*siblings));
> > +	} else {
> > +		cfg.parallel =3D true;
> > +		cfg.num_engines =3D 1;
> > +		cfg.width =3D count;
>=20
> Here the usage of count vs bb_per_execbuf gets a bit counfusing. AFAICS
> using width =3D count here only works if=A0 count =3D bb_per_execbuf , be=
cause in
> the loop below we only create bb_per_execbuf batches. Why not use
> bb_per_execbuf directly for consistency? That would also allow you to pull
> the base cfg out of the if statement here and just always use:
>=20
> cfg.parallel =3D true;
> cfg.num_engines =3D count / bb_per_execbuf;
> cfg.width =3D bb_per_execbuf;
>=20
> Because if count =3D bb_per_execbuf it resolves to the same values anyway.
>

I think that works.
=20
> > +		memcpy(cfg.engines, siblings, sizeof(*siblings) * count);
> > +	}
> > +	ctx =3D intel_ctx_create(i915, &cfg);
> > +
> > +	i =3D 0;
> > +	batch[i] =3D MI_ATOMIC | MI_ATOMIC_INLINE_DATA |
> > +		MI_ATOMIC_ADD;
> > +#define TARGET_BO_OFFSET	(0x1 << 16)
> > +	batch[++i] =3D TARGET_BO_OFFSET;
> > +	batch[++i] =3D 0;
> > +	batch[++i] =3D 1;
> > +	batch[++i] =3D MI_BATCH_BUFFER_END;
> > +
> > +	memset(obj, 0, sizeof(obj));
> > +	obj[target_bo_idx].offset =3D TARGET_BO_OFFSET;
> > +	obj[target_bo_idx].flags =3D EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> > +	obj[target_bo_idx].handle =3D gem_create(i915, 4096);
> > +
> > +	for (i =3D first_bb_idx; i < bb_per_execbuf + first_bb_idx; ++i) {
> > +		obj[i].handle =3D gem_create(i915, 4096);
> > +		gem_write(i915, obj[i].handle, 0, batch,
> > +			  sizeof(batch));
> > +	}
> > +
> > +	memset(&execbuf, 0, sizeof(execbuf));
> > +	execbuf.buffers_ptr =3D to_user_pointer(obj);
> > +	execbuf.buffer_count =3D bb_per_execbuf + 1;
> > +	execbuf.flags |=3D I915_EXEC_HANDLE_LUT;
> > +	if (flags & PARALLEL_BB_FIRST)
> > +		execbuf.flags |=3D I915_EXEC_BATCH_FIRST;
> > +	if (flags & PARALLEL_OUT_FENCE)
> > +		execbuf.flags |=3D I915_EXEC_FENCE_OUT;
> > +	execbuf.buffers_ptr =3D to_user_pointer(obj);
> > +	execbuf.rsvd1 =3D ctx->id;
> > +
> > +	for (n =3D 0; n < PARALLEL_BB_LOOP_COUNT; ++n) {
> > +		for (i =3D 0; i < count / bb_per_execbuf; ++i ) {
>=20
> As discussed offline, this internal loop doesn't do anything (we only ever
> cycle once) and should be removed.
>=20

Agree, this stale code from a previous version of the test.

> > +			execbuf.flags &=3D ~0x3full;
> > +			execbuf.flags |=3D i;
> > +			gem_execbuf_wr(i915, &execbuf);
> > +
> > +			if (flags & PARALLEL_OUT_FENCE) {
> > +				igt_assert_eq(sync_fence_wait(execbuf.rsvd2 >> 32,
> > +							      1000), 0);
> > +				igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
> > +
> > +				if (fence)
> > +					close(fence);
> > +				fence =3D execbuf.rsvd2 >> 32;
> > +
> > +				if (flags & PARALLEL_SUBMIT_FENCE) {
> > +					execbuf.flags |=3D
> > +						I915_EXEC_FENCE_SUBMIT;
> > +					execbuf.rsvd2 >>=3D 32;
> > +				} else if (flags &  PARALLEL_IN_FENCE) {
> > +					execbuf.flags |=3D
> > +						I915_EXEC_FENCE_IN;
> > +					execbuf.rsvd2 >>=3D 32;
> > +				} else {
> > +					execbuf.rsvd2 =3D 0;
> > +				}
> > +			}
> > +
> > +			if (flags & PARALLEL_VIRTUAL)
> > +				break;
> > +		}
> > +
> > +		if (flags & PARALLEL_CONTEXTS) {
> > +			ctxs[n] =3D ctx;
> > +			ctx =3D intel_ctx_create(i915, &cfg);
> > +			execbuf.rsvd1 =3D ctx->id;
> > +		}
> > +	}
> > +	if (fence)
> > +		close(fence);
> > +
> > +	check_bo(i915, obj[target_bo_idx].handle, flags & PARALLEL_VIRTUAL ?
> > +		 bb_per_execbuf * PARALLEL_BB_LOOP_COUNT :
> > +		 count * PARALLEL_BB_LOOP_COUNT, true);
>=20
> same as above, can just use bb_per_execbuf unconditionally here
>

Yep.

> > +
> > +	intel_ctx_destroy(i915, ctx);
> > +	for (i =3D 0; flags & PARALLEL_CONTEXTS &&
> > +	     i < PARALLEL_BB_LOOP_COUNT; ++i) {
> > +		intel_ctx_destroy(i915, ctxs[i]);
> > +	}
> > +	for (i =3D 0; i < bb_per_execbuf + 1; ++i)
> > +		gem_close(i915, obj[i].handle);
> > +}
> > +
> > +static void parallel(int i915, unsigned int flags)
> > +{
> > +	for (int class =3D 0; class < 32; class++) {
>=20
> I think we usually avoid declaring variables inside the for loops
> statements, even if the recent C standards allow it, but not sure if we h=
ave
> an official style in this regard. there is multiple instance of this in t=
his
> file.
>=20

Sure.

> > +		struct i915_engine_class_instance *siblings;
> > +		unsigned int count, bb_per_execbuf;
> > +
> > +		siblings =3D list_engines(i915, 1u << class, &count);
> > +		if (!siblings)
> > +			continue;
> > +
> > +		if (count < 2) {
> > +			free(siblings);
> > +			continue;
> > +		}
> > +
> > +		logical_sort_siblings(i915, siblings, count);
> > +		bb_per_execbuf =3D count;
> > +
> > +		parallel_thread(i915, flags, siblings,
> > +				count, bb_per_execbuf);
> > +
> > +		free(siblings);
> > +	}
> > +}
> > +
> > +static void parallel_balancer(int i915, unsigned int flags)
> > +{
> > +	for (int class =3D 0; class < 32; class++) {
> > +		struct i915_engine_class_instance *siblings;
> > +		unsigned int count;
> > +
> > +		siblings =3D list_engines(i915, 1u << class, &count);
> > +		if (!siblings)
> > +			continue;
> > +
> > +		if (count < 4) {
> > +			free(siblings);
> > +			continue;
> > +		}
> > +
> > +		logical_sort_siblings(i915, siblings, count);
> > +
> > +		for (unsigned int bb_per_execbuf =3D 2;;) {
> > +			igt_fork(child, count / bb_per_execbuf)
> > +				parallel_thread(i915,
> > +						flags | PARALLEL_VIRTUAL,
> > +						siblings,
> > +						count,
> > +						bb_per_execbuf);
>=20
> As a possible future improvement IMO it'd be nice to check that 2 parallel
> VEs are deployed to the HW at the same time. The test will currently pass
> even if they are serialized. Not a blocker.
>

We probably will need spinners to do this as with short running batches the=
 2
parallel VEs probably will never actually be on the hardware at the same
time because they more less switch in and switch out at such a fast rate
only 1 will actually be scheduled at a time. Agree this would be a good
test to have though. Likely need a whole new functions / test sections
to do this. Again this might be in a follow up or another patch later in
this series.
=20
> > +			igt_waitchildren();
> > +
> > +			if (count / ++bb_per_execbuf <=3D 1)
> > +				break;
>=20
> bikeshed: why not just put this in the if statement?
>=20
> for (bb =3D 2; count / bb > 1 ; ++bb)
>=20
> not a blocker.
>

That works.
=20
> > +		}
> > +
> > +		free(siblings);
> > +	}
> > +}
> > +
> > +static bool fence_busy(int fence)
> > +{
> > +	return poll(&(struct pollfd){fence, POLLIN}, 1, 0) =3D=3D 0;
> > +}
> > +
> > +static void parallel_ordering(int i915, unsigned int flags)
>=20
> A one-line comment about the test to describe what it's doing would help
> IMO.
>

Sure. BTW, this section is fail with my current (on list) implementation
(rather weak) for parallel submission with execlists.
=20
> > +{
> > +	for (int class =3D 0; class < 32; class++) {
> > +		const intel_ctx_t *ctx =3D NULL, *spin_ctx =3D NULL;
> > +		struct i915_engine_class_instance *siblings;
> > +		unsigned int count;
> > +		int i =3D 0, fence =3D 0;
> > +		uint32_t batch[16];
> > +		struct drm_i915_gem_execbuffer2 execbuf;
> > +		struct drm_i915_gem_exec_object2 obj[32];
> > +		igt_spin_t *spin;
> > +		intel_ctx_cfg_t cfg;
> > +
> > +		siblings =3D list_engines(i915, 1u << class, &count);
> > +		if (!siblings)
> > +			continue;
> > +
> > +		if (count < 2) {
> > +			free(siblings);
> > +			continue;
> > +		}
> > +
> > +		logical_sort_siblings(i915, siblings, count);
> > +
> > +		memset(&cfg, 0, sizeof(cfg));
> > +		cfg.parallel =3D true;
> > +		cfg.num_engines =3D 1;
> > +		cfg.width =3D count;
> > +		memcpy(cfg.engines, siblings, sizeof(*siblings) * count);
> > +
> > +		ctx =3D intel_ctx_create(i915, &cfg);
> > +
> > +		batch[i] =3D MI_ATOMIC | MI_ATOMIC_INLINE_DATA |
> > +			MI_ATOMIC_ADD;
> > +		batch[++i] =3D TARGET_BO_OFFSET;
> > +		batch[++i] =3D 0;
> > +		batch[++i] =3D 1;
> > +		batch[++i] =3D MI_BATCH_BUFFER_END;
> > +
> > +		memset(obj, 0, sizeof(obj));
> > +		obj[0].offset =3D TARGET_BO_OFFSET;
> > +		obj[0].flags =3D EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> > +		obj[0].handle =3D gem_create(i915, 4096);
> > +
> > +		for (i =3D 1; i < count + 1; ++i) {
> > +			obj[i].handle =3D gem_create(i915, 4096);
> > +			gem_write(i915, obj[i].handle, 0, batch,
> > +				  sizeof(batch));
> > +		}
>=20
> The object setup code here is identical to the one in parallel_thread(),
> maybe move it to a common function?
>

Sure.
=20
> > +
> > +		memset(&execbuf, 0, sizeof(execbuf));
> > +		execbuf.buffers_ptr =3D to_user_pointer(obj);
> > +		execbuf.buffer_count =3D count + 1;
> > +		execbuf.flags |=3D I915_EXEC_HANDLE_LUT;
> > +		execbuf.flags |=3D I915_EXEC_NO_RELOC;
> > +		execbuf.flags |=3D I915_EXEC_FENCE_OUT;
> > +		execbuf.buffers_ptr =3D to_user_pointer(obj);
> > +		execbuf.rsvd1 =3D ctx->id;
> > +
> > +		/* Block parallel submission */
> > +		spin_ctx =3D ctx_create_engines(i915, siblings, count);
> > +		spin =3D __igt_spin_new(i915,
> > +				      .ctx =3D spin_ctx,
> > +				      .engine =3D 0,
> > +				      .flags =3D IGT_SPIN_FENCE_OUT |
> > +				      IGT_SPIN_NO_PREEMPTION);
> > +
> > +		/* Wait for spinners to start */
> > +		usleep(5 * 10000);
> > +		igt_assert(fence_busy(spin->out_fence));
> > +
> > +		/* Submit parallel execbuf */
> > +		gem_execbuf_wr(i915, &execbuf);
> > +		fence =3D execbuf.rsvd2 >> 32;
> > +
> > +		/*
> > +		 * Wait long enough for timeslcing to kick in but not
> > +		 * preemption. Spinner + parallel execbuf should be
> > +		 * active.
> > +		 */
> > +		usleep(25 * 10000);
>=20
> This is a pretty arbitrary number, what if the system has been set up wit=
h a
> longer timeslicing period (or none at all) and/or a shorter preemption
> timeout? IMO you should read those out of sysfs and tune the waits
> accordingly
>

I think we helpers for reading sysfs values, this should be easy enough
to add. How about we wait for 5x the timeslice or something? If values
are configured in way where that math doesn't work, this we just skip
this test.

Matt
=20
> Daniele
>=20
> > +		igt_assert(fence_busy(spin->out_fence));
> > +		igt_assert(fence_busy(fence));
> > +		check_bo(i915, obj[0].handle, 0, false);
> > +
> > +		/*
> > +		 * End spinner and wait for spinner + parallel execbuf
> > +		 * to compelte.
> > +		 */
> > +		igt_spin_end(spin);
> > +		igt_assert_eq(sync_fence_wait(fence, 1000), 0);
> > +		igt_assert_eq(sync_fence_status(fence), 1);
> > +		check_bo(i915, obj[0].handle, count, true);
> > +		close(fence);
> > +
> > +		/* Clean up */
> > +		intel_ctx_destroy(i915, ctx);
> > +		intel_ctx_destroy(i915, spin_ctx);
> > +		for (i =3D 0; i < count + 1; ++i)
> > +			gem_close(i915, obj[i].handle);
> > +		free(siblings);
> > +		igt_spin_free(i915, spin);
> > +	}
> > +}
> > +
> >   static bool has_persistence(int i915)
> >   {
> >   	struct drm_i915_gem_context_param p =3D {
> > @@ -2786,6 +3186,61 @@ static bool has_load_balancer(int i915)
> >   	return err =3D=3D 0;
> >   }
> > +static bool has_logical_mapping(int i915)
> > +{
> > +	struct drm_i915_query_engine_info *engines;
> > +	unsigned int i;
> > +
> > +	engines =3D query_engine_info(i915);
> > +
> > +	for (i =3D 0; i < engines->num_engines; ++i)
> > +		if (!(engines->engines[i].flags &
> > +		     I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE)) {
> > +			free(engines);
> > +			return false;
> > +		}
> > +
> > +	free(engines);
> > +	return true;
> > +}
> > +
> > +static bool has_parallel_execbuf(int i915)
> > +{
> > +	intel_ctx_cfg_t cfg =3D {
> > +		.parallel =3D true,
> > +		.num_engines =3D 1,
> > +	};
> > +	const intel_ctx_t *ctx =3D NULL;
> > +	int err;
> > +
> > +	for (int class =3D 0; class < 32; class++) {
> > +		struct i915_engine_class_instance *siblings;
> > +		unsigned int count;
> > +
> > +		siblings =3D list_engines(i915, 1u << class, &count);
> > +		if (!siblings)
> > +			continue;
> > +
> > +		if (count < 2) {
> > +			free(siblings);
> > +			continue;
> > +		}
> > +
> > +		logical_sort_siblings(i915, siblings, count);
> > +
> > +		cfg.width =3D count;
> > +		memcpy(cfg.engines, siblings, sizeof(*siblings) * count);
> > +		free(siblings);
> > +
> > +		err =3D __intel_ctx_create(i915, &cfg, &ctx);
> > +		intel_ctx_destroy(i915, ctx);
> > +
> > +		return err =3D=3D 0;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >   igt_main
> >   {
> >   	int i915 =3D -1;
> > @@ -2886,6 +3341,38 @@ igt_main
> >   		igt_stop_hang_detector();
> >   	}
> > +	igt_subtest_group {
> > +		igt_fixture {
> > +			igt_require(has_logical_mapping(i915));
> > +			igt_require(has_parallel_execbuf(i915));
> > +		}
> > +
> > +		igt_subtest("parallel-ordering")
> > +			parallel_ordering(i915, 0);
> > +
> > +		igt_subtest("parallel")
> > +			parallel(i915, 0);
> > +
> > +		igt_subtest("parallel-bb-first")
> > +			parallel(i915, PARALLEL_BB_FIRST);
> > +
> > +		igt_subtest("parallel-out-fence")
> > +			parallel(i915, PARALLEL_OUT_FENCE);
> > +
> > +		igt_subtest("parallel-keep-in-fence")
> > +			parallel(i915, PARALLEL_OUT_FENCE | PARALLEL_IN_FENCE);
> > +
> > +		igt_subtest("parallel-keep-submit-fence")
> > +			parallel(i915, PARALLEL_OUT_FENCE |
> > +				 PARALLEL_SUBMIT_FENCE);
> > +
> > +		igt_subtest("parallel-contexts")
> > +			parallel(i915, PARALLEL_CONTEXTS);
> > +
> > +		igt_subtest("parallel-balancer")
> > +			parallel_balancer(i915, 0);
> > +	}
> > +
> >   	igt_subtest_group {
> >   		igt_hang_t  hang;
>=20
>=20
>=20
>=20
