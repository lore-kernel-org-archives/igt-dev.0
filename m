Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3BE10E151
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 18:52:41 +0000 (UTC)
Message-ID: <e990af92-7040-0b2a-026d-c5beb1f8b4a1@linux.intel.com>
Date: Tue, 26 Sep 2023 20:52:34 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
 <20230926084451.1732748-15-marcin.bernatowicz@linux.intel.com>
 <8a00ea58-419c-af02-dc5a-0c868ce887f8@linux.intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <8a00ea58-419c-af02-dc5a-0c868ce887f8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 14/14] benchmarks/gem_wsim: added basic
 xe support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 9/26/2023 3:10 PM, Tvrtko Ursulin wrote:
> 
> On 26/09/2023 09:44, Marcin Bernatowicz wrote:
>> Added basic xe support. Single binary handles both i915 and Xe devices.
>>
>> Some functionality is still missing: working sets, bonding.
>>
>> The tool is handy for scheduling tests, we find it useful to verify vGPU
>> profiles defining different execution quantum/preemption timeout
>> settings.
>>
>> There is also some rationale for the tool in following thread:
>> https://lore.kernel.org/dri-devel/a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com/
>>
>> With this patch it should be possible to run following on xe device:
>>
>> gem_wsim -w benchmarks/wsim/media_load_balance_fhd26u7.wsim -c 36 -r 600
>>
>> Best with drm debug logs disabled:
>>
>> echo 0 > /sys/module/drm/parameters/debug
>>
>> v2: minimizing divergence - same workload syntax for both drivers,
>>      so most existing examples should run on xe unmodified (Tvrtko)
> 
> Awesome!
> 
>>      This version creates one common VM per workload.
>>      Explicit VM management, compute mode will come in next patchset.
> 
> I think this is going quite well and is looking promising we will end up 
> with something clean.
> 
> The only thing I feel needs to be said ahead of time is that I am not 
> convinced we should be merging any xe specific changes until xe arrives 
> upstream.

I will create a patchset "benchmarks/gem_wsim: fixes and improvements" 
with code not related to xe and then some xe specific ones in 
"benchmarks/gem_wsim: added basic xe support".

> 
> But much good progress with refactoring, cleanup and review can still be 
> made.
> 
I've two bigger refactors for parse_workload and run_workload (to split 
both big loops). In short I introduced w_step_xxx_parse, w_step_xxx_run 
for each step type and have a w_step_parse, w_step_run functions called 
from parse_workload, run_workload accordingly. It may easy a bit a 
maintenance if one of backends needs other handling.

>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   benchmarks/gem_wsim.c  | 515 ++++++++++++++++++++++++++++++++++++++---
>>   benchmarks/wsim/README |   6 +-
>>   2 files changed, 485 insertions(+), 36 deletions(-)
>>
>> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
>> index 7703ca822..c83ed4882 100644
>> --- a/benchmarks/gem_wsim.c
>> +++ b/benchmarks/gem_wsim.c
>> @@ -62,6 +62,12 @@
>>   #include "i915/gem_engine_topology.h"
>>   #include "i915/gem_mman.h"
>> +#include "igt_syncobj.h"
>> +#include "intel_allocator.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_spin.h"
>> +
>>   enum intel_engine_id {
>>       DEFAULT,
>>       RCS,
>> @@ -109,6 +115,10 @@ struct deps {
>>       struct dep_entry *list;
>>   };
>> +#define for_each_dep(__dep, __deps) \
>> +    for (int __i = 0; __i < __deps.nr && \
>> +         (__dep = &__deps.list[__i]); ++__i)
> 
> Could you make use of this macro outside xe too? Like in do_eb()? If so 
> you could extract it and merge ahead of time.
> 
sure
>> +
>>   struct w_arg {
>>       char *filename;
>>       char *desc;
>> @@ -177,10 +187,30 @@ struct w_step {
>>       struct drm_i915_gem_execbuffer2 eb;
>>       struct drm_i915_gem_exec_object2 *obj;
>>       struct drm_i915_gem_relocation_entry reloc[3];
>> +
>> +    struct drm_xe_exec exec;
>> +    size_t bb_size;
>> +    struct xe_spin *spin;
>> +    struct drm_xe_sync *syncs;
> 
> Lets think how to create backend specific containers here and make them 
> an union. So it is clear what gets used in each case and that it is 
> mutually exclusive. It may end up requiring a separate refactoring 
> patch(-es) which move the i915 bits into the i915 unions/namespace.

> 
> I know gem_wsim did not have that much a focus for clean design, but now 
> that 2nd backend is coming I think it is much more important for ease of 
> maintenance in the future.

good point
> 
>> +
>>       uint32_t bb_handle;
>>       uint32_t *bb_duration;
>>   };
>> +struct vm {
> 
> Everything xe specific please prefix with xe_. Structs, functions, etc.
> 
ok
>> +    uint32_t id;
>> +    bool compute_mode;
>> +    uint64_t ahnd;
>> +};
>> +
>> +struct exec_queue {
>> +    uint32_t id;
>> +    struct drm_xe_engine_class_instance hwe;
>> +    /* for qd_throttle */
>> +    unsigned int nrequest;
>> +    struct igt_list_head requests;
>> +};
>> +
>>   struct ctx {
>>       uint32_t id;
>>       int priority;
>> @@ -190,6 +220,10 @@ struct ctx {
>>       struct bond *bonds;
>>       bool load_balance;
>>       uint64_t sseu;
>> +    /* reference to vm */
>> +    struct vm *vm;
>> +    /* queue for each class */
>> +    struct exec_queue queues[NUM_ENGINES];
>>   };
>>   struct workload {
>> @@ -213,7 +247,10 @@ struct workload {
>>       unsigned int nr_ctxs;
>>       struct ctx *ctx_list;
>> -    struct working_set **working_sets; /* array indexed by set id */
> 
> Comment got lost.
> 
ups
>> +    unsigned int nr_vms;
>> +    struct vm *vm_list;
>> +
>> +    struct working_set **working_sets;
>>       int max_working_set_id;
>>       int sync_timeline;
>> @@ -223,6 +260,18 @@ struct workload {
>>       unsigned int nrequest[NUM_ENGINES];
>>   };
>> +#define for_each_ctx(__ctx, __wrk) \
>> +    for (int __i = 0; __i < (__wrk)->nr_ctxs && \
>> +         (__ctx = &(__wrk)->ctx_list[__i]); ++__i)
>> +
>> +#define for_each_exec_queue(__eq, __ctx) \
>> +        for (int __j = 0; __j < NUM_ENGINES && ((__eq) = 
>> &((__ctx)->queues[__j])); ++__j) \
>> +            for_if((__eq)->id > 0)
>> +
>> +#define for_each_vm(__vm, __wrk) \
>> +    for (int __i = 0; __i < (__wrk)->nr_vms && \
>> +         (__vm = &(__wrk)->vm_list[__i]); ++__i)
>> +
>>   static unsigned int master_prng;
>>   static int verbose = 1;
>> @@ -231,6 +280,8 @@ static struct drm_i915_gem_context_param_sseu 
>> device_sseu = {
>>       .slice_mask = -1 /* Force read on first use. */
>>   };
>> +static bool is_xe;
> 
> Put it next to global 'int fd'.

ok
> 
>> +
>>   #define SYNCEDCLIENTS    (1<<1)
>>   #define DEPSYNC        (1<<2)
>>   #define FLAG_SSEU    (1<<3)
>> @@ -247,7 +298,10 @@ static const char *ring_str_map[NUM_ENGINES] = {
>>   static void w_step_sync(struct w_step *w)
>>   {
>> -    gem_sync(fd, w->obj[0].handle);
>> +    if (is_xe)
>> +        igt_assert(syncobj_wait(fd, &w->syncs[0].handle, 1, 
>> INT64_MAX, 0, NULL));
>> +    else
>> +        gem_sync(fd, w->obj[0].handle);
>>   }
>>   static int read_timestamp_frequency(int i915)
>> @@ -351,15 +405,23 @@ parse_dependency(unsigned int nr_steps, struct 
>> w_step *w, char *str)
>>           if (entry.target > 0 || ((int)nr_steps + entry.target) < 0)
>>               return -1;
>> -        add_dep(&w->data_deps, entry);
>> +        /* only fence deps in xe, let f-1 <==> -1 */
>> +        if (is_xe)
>> +            add_dep(&w->fence_deps, entry);
>> +        else
>> +            add_dep(&w->data_deps, entry);
>>           break;
>>       case 's':
>> -        submit_fence = true;
>> +        /* no submit fence in xe ? */
>> +        if (!is_xe)
>> +            submit_fence = true;
>>           /* Fall-through. */
>>       case 'f':
>> -        /* Multiple fences not yet supported. */
>> -        igt_assert_eq(w->fence_deps.nr, 0);
>> +        /* xe supports multiple fences */
>> +        if (!is_xe)
>> +            /* Multiple fences not yet supported. */
>> +            igt_assert_eq(w->fence_deps.nr, 0);
>>           entry.target = atoi(++str);
>>           if (entry.target > 0 || ((int)nr_steps + entry.target) < 0)
>> @@ -469,7 +531,17 @@ static struct intel_engine_data *query_engines(void)
>>       if (engines.nengines)
>>           return &engines;
>> -    engines = intel_engine_list_of_physical(fd);
>> +    if (is_xe) {
>> +        struct drm_xe_engine_class_instance *hwe;
>> +
>> +        xe_for_each_hw_engine(fd, hwe) {
>> +            engines.engines[engines.nengines].class = hwe->engine_class;
>> +            engines.engines[engines.nengines].instance = 
>> hwe->engine_instance;
>> +            engines.nengines++;
>> +        }
>> +    } else
>> +        engines = intel_engine_list_of_physical(fd);
>> +
>>       igt_assert(engines.nengines);
>>       return &engines;
>>   }
>> @@ -562,6 +634,40 @@ get_engine(enum intel_engine_id engine)
>>       return ci;
>>   }
>> +static struct drm_xe_engine_class_instance
>> +get_xe_engine(enum intel_engine_id engine)
>> +{
>> +    struct drm_xe_engine_class_instance ci;
>> +
>> +    switch (engine) {
>> +    case DEFAULT:
>> +    case RCS:
>> +        ci.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
>> +        ci.engine_instance = 0;
>> +        break;
>> +    case BCS:
>> +        ci.engine_class = DRM_XE_ENGINE_CLASS_COPY;
>> +        ci.engine_instance = 0;
>> +        break;
>> +    case VCS1:
>> +        ci.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
>> +        ci.engine_instance = 0;
>> +        break;
>> +    case VCS2:
>> +        ci.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
>> +        ci.engine_instance = 1;
>> +        break;
>> +    case VECS:
>> +        ci.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
>> +        ci.engine_instance = 0;
>> +        break;
>> +    default:
>> +        igt_assert(0);
>> +    };
>> +
>> +    return ci;
>> +}
>> +
>>   static int parse_engine_map(struct w_step *step, const char *_str)
>>   {
>>       char *token, *tctx = NULL, *tstart = (char *)_str;
>> @@ -838,6 +944,13 @@ parse_workload(struct w_arg *arg, unsigned int 
>> flags, double scale_dur,
>>               } else if (!strcmp(field, "P")) {
>>                   unsigned int nr = 0;
>> +                if (is_xe) {
>> +                    if (verbose > 3)
>> +                        printf("skipped line: %s\n", _token);
> 
> There are no priorities at all in xe?

There are exec queue properties like 
job_timeout_ms/timeslice_us/preemption_timeout_us/persistence/priority 
(DRM_SCHED_PRIORITY_MIN, DRM_SCHED_PRIORITY_NORMAL, 
DRM_SCHED_PRIORITY_HIGH).

I'm thinking on extending the step to allow for engine granularity if 
provided like P.1.value[.engine_map], otherwise for all engines
or
having something more generic like Property step with syntax:
P.ctx.[jt=value.ts=value.pt=value.pr=value.mp=VCS|RCS|..]
making properties optional, we can specify only the one we need to 
change, example to modify priority on all exec queues in 1st context:
P.1.pr=-1

> 
> I'd make this a warning level print during parsing, that is printed if 
> verbose > 0.

ok
> 
>> +                    free(token);
>> +                    continue;
>> +                }
>> +
>>                   while ((field = strtok_r(fstart, ".", &fctx))) {
>>                       tmp = atoi(field);
>>                       check_arg(nr == 0 && tmp <= 0,
>> @@ -864,6 +977,13 @@ parse_workload(struct w_arg *arg, unsigned int 
>> flags, double scale_dur,
>>               } else if (!strcmp(field, "S")) {
>>                   unsigned int nr = 0;
>> +                if (is_xe) {
>> +                    if (verbose > 3)
>> +                        printf("skipped line: %s\n", _token);
> 
> This one probably best if fails parsing with an user friendly message.
ok
> >> +                    free(token);
>> +                    continue;
>> +                }
>> +
>>                   while ((field = strtok_r(fstart, ".", &fctx))) {
>>                       tmp = atoi(field);
>>                       check_arg(tmp <= 0 && nr == 0,
>> @@ -977,6 +1097,12 @@ parse_workload(struct w_arg *arg, unsigned int 
>> flags, double scale_dur,
>>               } else if (!strcmp(field, "b")) {
>>                   unsigned int nr = 0;
>> +                if (is_xe) {
>> +                    if (verbose > 3)
>> +                        printf("skipped line: %s\n", _token);
> 
> Ditto.
> 
>> +                    free(token);
>> +                    continue;
>> +                }
>>                   while ((field = strtok_r(fstart, ".", &fctx))) {
>>                       check_arg(nr > 2,
>>                             "Invalid bond format at step %u!\n",
>> @@ -1041,7 +1167,7 @@ parse_workload(struct w_arg *arg, unsigned int 
>> flags, double scale_dur,
>>               }
>>               tmp = atoi(field);
>> -            check_arg(tmp < 0, "Invalid ctx id at step %u!\n",
>> +            check_arg(tmp <= 0, "Invalid context id at step %u!\n",
> 
> If context id 0, eg. '0.RCS.1000.0.0', works today, please make this a 
> separate patch which adds a new restriction. If it doesn't work then 
> still make it a separate patch which fixes the validation bug.

Looks my mistake (previously exec_queues started with 0)

> 
>>                     nr_steps);
>>               step.context = tmp;
>> @@ -1054,7 +1180,7 @@ parse_workload(struct w_arg *arg, unsigned int 
>> flags, double scale_dur,
>>               i = str_to_engine(field);
>>               check_arg(i < 0,
>> -                  "Invalid engine id at step %u!\n", nr_steps);
>> +                "Invalid engine id at step %u!\n", nr_steps);
> 
> Noise which breaks indentation. :)
> 
>>               valid++;
>> @@ -1288,6 +1414,20 @@ __get_ctx(struct workload *wrk, const struct 
>> w_step *w)
>>       return &wrk->ctx_list[w->context];
>>   }
>> +static struct exec_queue *
>> +get_eq(struct workload *wrk, const struct w_step *w)
>> +{
>> +    igt_assert(w->engine >= 0 && w->engine < NUM_ENGINES);
>> +
>> +    return &__get_ctx(wrk, w)->queues[w->engine];
>> +}
>> +
>> +static struct vm *
>> +get_vm(struct workload *wrk, const struct w_step *w)
>> +{
>> +    return wrk->vm_list;
>> +}
>> +
>>   static uint32_t mmio_base(int i915, enum intel_engine_id engine, int 
>> gen)
>>   {
>>       const char *name;
>> @@ -1540,6 +1680,61 @@ alloc_step_batch(struct workload *wrk, struct 
>> w_step *w)
>>   #endif
>>   }
>> +static void
>> +xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>> +{
>> +    struct vm *vm = get_vm(wrk, w);
>> +    struct exec_queue *eq = get_eq(wrk, w);
>> +    struct dep_entry *dep;
>> +    int i;
>> +
>> +    w->bb_size = ALIGN(sizeof(*w->spin) + xe_cs_prefetch_size(fd),
>> +               xe_get_default_alignment(fd));
>> +    w->bb_handle = xe_bo_create(fd, 0, vm->id, w->bb_size);
>> +    w->spin = xe_bo_map(fd, w->bb_handle, w->bb_size);
>> +    w->exec.address =
>> +        intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, 
>> w->bb_size,
>> +                            0, ALLOC_STRATEGY_LOW_TO_HIGH);
>> +    xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->exec.address, 
>> w->bb_size);
>> +    xe_spin_init_opts(w->spin, .addr = w->exec.address,
>> +                   .preempt = (w->preempt_us > 0),
>> +                   .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe.gt_id,
>> +                                1000LL * get_duration(wrk, w)));
>> +    w->exec.exec_queue_id = eq->id;
>> +    w->exec.num_batch_buffer = 1;
>> +    /* always at least one out fence */
>> +    w->exec.num_syncs = 1;
>> +    /* count syncs */
>> +    igt_assert_eq(0, w->data_deps.nr);
>> +    for_each_dep(dep, w->fence_deps) {
>> +        int dep_idx = w->idx + dep->target;
>> +
>> +        igt_assert(dep_idx >= 0 && dep_idx < w->idx);
>> +        igt_assert(wrk->steps[dep_idx].type == SW_FENCE ||
>> +               wrk->steps[dep_idx].type == BATCH);
>> +
>> +        w->exec.num_syncs++;
>> +    }
>> +    w->syncs = calloc(w->exec.num_syncs, sizeof(*w->syncs));
>> +    /* fill syncs */
>> +    i = 0;
>> +    /* out fence */
>> +    w->syncs[i].handle = syncobj_create(fd, 0);
>> +    w->syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
>> +    /* in fence(s) */
>> +    for_each_dep(dep, w->fence_deps) {
>> +        int dep_idx = w->idx + dep->target;
>> +
>> +        igt_assert(wrk->steps[dep_idx].type == SW_FENCE ||
>> +               wrk->steps[dep_idx].type == BATCH);
>> +        igt_assert(wrk->steps[dep_idx].syncs && 
>> wrk->steps[dep_idx].syncs[0].handle);
>> +
>> +        w->syncs[i].handle = wrk->steps[dep_idx].syncs[0].handle;
>> +        w->syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ;
>> +    }
>> +    w->exec.syncs = to_user_pointer(w->syncs);
>> +}
>> +
>>   static bool set_priority(uint32_t ctx_id, int prio)
>>   {
>>       struct drm_i915_gem_context_param param = {
>> @@ -1766,6 +1961,61 @@ static void measure_active_set(struct workload 
>> *wrk)
>>   #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, 
>> sz__); })
>> +static void vm_create(struct vm *vm)
>> +{
>> +    uint32_t flags = 0;
>> +
>> +    if (vm->compute_mode)
>> +        flags |= DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
>> +             DRM_XE_VM_CREATE_COMPUTE_MODE;
>> +
>> +    vm->id = xe_vm_create(fd, flags, 0);
>> +}
>> +
>> +static void exec_queue_create(struct ctx *ctx, struct exec_queue *eq)
>> +{
>> +    struct drm_xe_exec_queue_create create = {
>> +        .vm_id = ctx->vm->id,
>> +        .width = 1,
>> +        .num_placements = 1,
>> +        .instances = to_user_pointer(&eq->hwe),
>> +    };
>> +    struct drm_xe_engine_class_instance *eci = NULL;
>> +
>> +    if (ctx->load_balance && eq->hwe.engine_class == 
>> DRM_XE_ENGINE_CLASS_VIDEO_DECODE) {
>> +        struct drm_xe_engine_class_instance *hwe;
>> +        int i;
>> +
>> +        for (i = 0; i < ctx->engine_map_count; ++i)
>> +            igt_assert(ctx->engine_map[i] == VCS || 
>> ctx->engine_map[i] == VCS1 ||
>> +                   ctx->engine_map[i] == VCS2);
>> +
>> +        eci = calloc(16, sizeof(struct drm_xe_engine_class_instance));
>> +        create.num_placements = 0;
>> +        xe_for_each_hw_engine(fd, hwe) {
>> +            if (hwe->engine_class != DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
>> +                hwe->gt_id != 0)
>> +                continue;
>> +
>> +            igt_assert(create.num_placements < 16);
>> +            eci[create.num_placements++] = *hwe;
>> +        }
>> +        igt_assert(create.num_placements);
>> +        create.instances = to_user_pointer(eci);
>> +
>> +        if (verbose > 3)
>> +            printf("num_placements=%d class=%d gt=%d\n", 
>> create.num_placements,
>> +                eq->hwe.engine_class, eq->hwe.gt_id);
>> +    }
>> +
>> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, 
>> &create), 0);
>> +
>> +    if (eci)
>> +        free(eci);
>> +
>> +    eq->id = create.exec_queue_id;
>> +}
>> +
>>   static int prepare_contexts(unsigned int id, struct workload *wrk)
>>   {
>>       uint32_t share_vm = 0;
>> @@ -1796,6 +2046,84 @@ static int prepare_contexts(unsigned int id, 
>> struct workload *wrk)
>>           max_ctx = ctx;
>>       }
>> +    if (is_xe) {
> 
> Shouldn't the i915 and xe parts be mutually exclusive? Or xe ctx setup 
> depends on some parts of the existing setup run?

I probably need to split better, the common step is allocate_contexts.

> 
>> +        int engine_classes[NUM_ENGINES] = {};
>> +
>> +        /* shortcut, create one vm */
>> +        wrk->nr_vms = 1;
>> +        wrk->vm_list = calloc(wrk->nr_vms, sizeof(struct vm));
>> +        wrk->vm_list->compute_mode = false;
>> +        vm_create(wrk->vm_list);
>> +        wrk->vm_list->ahnd =
>> +            intel_allocator_open(fd, wrk->vm_list->id, 
>> INTEL_ALLOCATOR_RELOC);
>> +
>> +        /* create exec queues of each referenced engine class */
>> +        for (j = 0; j < wrk->nr_ctxs; j++) {
>> +            struct ctx *ctx = &wrk->ctx_list[j];
>> +
>> +            /* link with vm */
>> +            ctx->vm = wrk->vm_list;
>> +
>> +            for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
>> +                if (w->context != j)
>> +                    continue;
>> +
>> +                if (w->type == ENGINE_MAP) {
>> +                    ctx->engine_map = w->engine_map;
>> +                    ctx->engine_map_count = w->engine_map_count;
>> +                } else if (w->type == LOAD_BALANCE) {
>> +                    if (!ctx->engine_map) {
>> +                        wsim_err("Load balancing needs an engine 
>> map!\n");
>> +                        return 1;
>> +                    }
>> +                    if (intel_gen(intel_get_drm_devid(fd)) < 11) {
>> +                        wsim_err("Load balancing needs relative mmio 
>> support, gen11+!\n");
>> +                        return 1;
>> +                    }
>> +                    ctx->load_balance = w->load_balance;
>> +                }
>> +            }
>> +
>> +            /* create exec queue for each referenced engine */
>> +            for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
>> +                if (w->context != j)
>> +                    continue;
>> +
>> +                if (w->type == BATCH)
>> +                    engine_classes[w->engine]++;
>> +            }
>> +
>> +            for (i = 0; i < NUM_ENGINES; i++) {
>> +                if (engine_classes[i]) {
>> +                    if (verbose > 3)
>> +                        printf("%u ctx[%d] eq(%s) load_balance=%d\n",
>> +                            id, j, ring_str_map[i], ctx->load_balance);
>> +                    if (i == VCS) {
>> +                        ctx->queues[i].hwe.engine_class =
>> +                            get_xe_engine(VCS1).engine_class;
>> +                        ctx->queues[i].hwe.engine_instance = 1;
>> +                    } else
>> +                        ctx->queues[i].hwe = get_xe_engine(i);
>> +                    exec_queue_create(ctx, &ctx->queues[i]);
>> +                    /* init request list */
>> +                    IGT_INIT_LIST_HEAD(&ctx->queues[i].requests);
>> +                    ctx->queues[i].nrequest = 0;
>> +                }
>> +                engine_classes[i] = 0;
>> +            }
>> +        }
>> +
>> +        /* create syncobjs for SW_FENCE */
>> +        for (j = 0, i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++)
>> +            if (w->type == SW_FENCE) {
>> +                w->syncs = calloc(1, sizeof(struct drm_xe_sync));
>> +                w->syncs[0].handle = syncobj_create(fd, 0);
>> +                w->syncs[0].flags = DRM_XE_SYNC_SYNCOBJ;
>> +            }
>> +
>> +        return 0;
>> +    }
>> +
>>       /*
>>        * Transfer over engine map configuration from the workload step.
>>        */
>> @@ -2075,7 +2403,8 @@ static int prepare_workload(unsigned int id, 
>> struct workload *wrk)
>>           }
>>       }
>> -    prepare_working_sets(id, wrk);
>> +    if (!is_xe)
>> +        prepare_working_sets(id, wrk);
> 
> Lets make it error out during parsing, with a user friendly message, 
> when working sets are used.
> 
>>       /*
>>        * Allocate batch buffers.
>> @@ -2084,10 +2413,14 @@ static int prepare_workload(unsigned int id, 
>> struct workload *wrk)
>>           if (w->type != BATCH)
>>               continue;
>> -        alloc_step_batch(wrk, w);
>> +        if (is_xe)
>> +            xe_alloc_step_batch(wrk, w);
>> +        else
>> +            alloc_step_batch(wrk, w);
>>       }
>> -    measure_active_set(wrk);
>> +    if (!is_xe)
>> +        measure_active_set(wrk);
>>       return 0;
>>   }
>> @@ -2134,6 +2467,31 @@ static void w_sync_to(struct workload *wrk, 
>> struct w_step *w, int target)
>>       w_step_sync(&wrk->steps[target]);
>>   }
>> +static void do_xe_exec(struct workload *wrk, struct w_step *w)
>> +{
>> +    struct exec_queue *eq = get_eq(wrk, w);
>> +
>> +    igt_assert(w->emit_fence <= 0);
>> +    if (w->emit_fence == -1)
>> +        syncobj_reset(fd, &w->syncs[0].handle, 1);
>> +
>> +    /* update duration if random */
>> +    if (w->duration.max != w->duration.min)
>> +        xe_spin_init_opts(w->spin, .addr = w->exec.address,
>> +                       .preempt = (w->preempt_us > 0),
>> +                       .ctx_ticks = duration_to_ctx_ticks(fd, 
>> eq->hwe.gt_id,
>> +                                1000LL * get_duration(wrk, w)));
>> +    xe_exec(fd, &w->exec);
>> +
>> +    /* for qd_throttle */
>> +    if (w->rq_link.prev != NULL || w->rq_link.next != NULL) {
>> +        igt_list_del(&w->rq_link);
>> +        eq->nrequest--;
>> +    }
>> +    igt_list_add_tail(&w->rq_link, &eq->requests);
>> +    eq->nrequest++;
>> +}
>> +
>>   static void
>>   do_eb(struct workload *wrk, struct w_step *w, enum intel_engine_id 
>> engine)
>>   {
>> @@ -2258,6 +2616,10 @@ static void *run_workload(void *data)
>>                       sw_sync_timeline_create_fence(wrk->sync_timeline,
>>                                         cur_seqno + w->idx);
>>                   igt_assert(w->emit_fence > 0);
>> +                if (is_xe)
>> +                    /* Convert sync file to syncobj */
>> +                    syncobj_import_sync_file(fd, w->syncs[0].handle,
>> +                                 w->emit_fence);
>>                   continue;
>>               } else if (w->type == SW_FENCE_SIGNAL) {
>>                   int tgt = w->idx + w->target;
>> @@ -2270,6 +2632,9 @@ static void *run_workload(void *data)
>>                   sw_sync_timeline_inc(wrk->sync_timeline, inc);
>>                   continue;
>>               } else if (w->type == CTX_PRIORITY) {
>> +                if (is_xe)
>> +                    continue;
>> +
>>                   if (w->priority != 
>> wrk->ctx_list[w->context].priority) {
>>                       struct drm_i915_gem_context_param param = {
>>                           .ctx_id = wrk->ctx_list[w->context].id,
>> @@ -2289,7 +2654,10 @@ static void *run_workload(void *data)
>>                   igt_assert(wrk->steps[t_idx].type == BATCH);
>>                   
>> igt_assert(wrk->steps[t_idx].duration.unbound_duration);
>> -                *wrk->steps[t_idx].bb_duration = 0xffffffff;
>> +                if (is_xe)
>> +                    xe_spin_end(wrk->steps[t_idx].spin);
>> +                else
>> +                    *wrk->steps[t_idx].bb_duration = 0xffffffff;
>>                   __sync_synchronize();
>>                   continue;
>>               } else if (w->type == SSEU) {
>> @@ -2321,15 +2689,19 @@ static void *run_workload(void *data)
>>               if (throttle > 0)
>>                   w_sync_to(wrk, w, i - throttle);
>> -            do_eb(wrk, w, engine);
>> +            if (is_xe)
>> +                do_xe_exec(wrk, w);
>> +            else {
>> +                do_eb(wrk, w, engine);
>> -            if (w->request != -1) {
>> -                igt_list_del(&w->rq_link);
>> -                wrk->nrequest[w->request]--;
>> +                if (w->request != -1) {
>> +                    igt_list_del(&w->rq_link);
>> +                    wrk->nrequest[w->request]--;
>> +                }
>> +                w->request = engine;
>> +                igt_list_add_tail(&w->rq_link, &wrk->requests[engine]);
>> +                wrk->nrequest[engine]++;
> 
> Is the rq list management the same in here and do_xe_exec? If so please 
> consolidate into a common wrapper, which can then branch off into i915 
> and xe specific parts.

I need to revisit this.
> 
>>               }
>> -            w->request = engine;
>> -            igt_list_add_tail(&w->rq_link, &wrk->requests[engine]);
>> -            wrk->nrequest[engine]++;
>>               if (!wrk->run)
>>                   break;
>> @@ -2338,17 +2710,32 @@ static void *run_workload(void *data)
>>                   w_step_sync(w);
>>               if (qd_throttle > 0) {
>> -                while (wrk->nrequest[engine] > qd_throttle) {
>> -                    struct w_step *s;
>> +                if (is_xe) {
>> +                    struct exec_queue *eq = get_eq(wrk, w);
>> +
>> +                    while (eq->nrequest > qd_throttle) {
>> +                        struct w_step *s;
>> +
>> +                        s = igt_list_first_entry(&eq->requests, s, 
>> rq_link);
>> +
>> +                        w_step_sync(s);
>> -                    s = igt_list_first_entry(&wrk->requests[engine],
>> -                                 s, rq_link);
>> +                        igt_list_del(&s->rq_link);
>> +                        eq->nrequest--;
>> +                    }
>> +                } else {
>> +                    while (wrk->nrequest[engine] > qd_throttle) {
>> +                        struct w_step *s;
>> +
>> +                        s = igt_list_first_entry(&wrk->requests[engine],
>> +                                    s, rq_link);
>>                           w_step_sync(s);
>> -                    s->request = -1;
>> -                    igt_list_del(&s->rq_link);
>> -                    wrk->nrequest[engine]--;
>> +                        s->request = -1;
>> +                        igt_list_del(&s->rq_link);
>> +                        wrk->nrequest[engine]--;
>> +                    }
> 
> Hm okay throttling is kind of very similar but not exactly the same. 
> What is the conceptual difference?

I need to revisit this code. Probably we can unify it now.
We want to throttle the number of requests on all exec queues of given type.
> >>                   }
>>               }
>>           }
>> @@ -2365,18 +2752,51 @@ static void *run_workload(void *data)
>>           for (i = 0, w = wrk->steps; wrk->run && (i < wrk->nr_steps);
>>                i++, w++) {
>>               if (w->emit_fence > 0) {
>> -                close(w->emit_fence);
>> -                w->emit_fence = -1;
>> +                if (is_xe) {
>> +                    igt_assert(w->type == SW_FENCE);
>> +                    close(w->emit_fence);
>> +                    w->emit_fence = -1;
>> +                    syncobj_reset(fd, &w->syncs[0].handle, 1);
>> +                } else {
>> +                    close(w->emit_fence);
>> +                    w->emit_fence = -1;
>> +                }
>>               }
>>           }
>>       }
>> -    for (i = 0; i < NUM_ENGINES; i++) {
>> -        if (!wrk->nrequest[i])
>> -            continue;
>> +    if (is_xe) {
>> +        struct exec_queue *eq;
>> +        struct ctx *ctx;
>> -        w = igt_list_last_entry(&wrk->requests[i], w, rq_link);
>> -        w_step_sync(w);
>> +        for_each_ctx(ctx, wrk)
>> +            for_each_exec_queue(eq, ctx)
>> +                if (eq->nrequest) {
>> +                    w = igt_list_last_entry(&eq->requests, w, rq_link);
>> +                    w_step_sync(w);
>> +                }
>> +
>> +        for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
>> +            if (w->type == BATCH) {
>> +                syncobj_destroy(fd, w->syncs[0].handle);
>> +                free(w->syncs);
>> +                xe_vm_unbind_sync(fd, get_vm(wrk, w)->id, 0, 
>> w->exec.address,
>> +                          w->bb_size);
>> +                gem_munmap(w->spin, w->bb_size);
>> +                gem_close(fd, w->bb_handle);
>> +            } else if (w->type == SW_FENCE) {
>> +                syncobj_destroy(fd, w->syncs[0].handle);
>> +                free(w->syncs);
>> +            }
>> +        }
>> +    } else {
>> +        for (i = 0; i < NUM_ENGINES; i++) {
>> +            if (!wrk->nrequest[i])
>> +                continue;
>> +
>> +            w = igt_list_last_entry(&wrk->requests[i], w, rq_link);
>> +            w_step_sync(w);
>> +        }
>>       }
>>       clock_gettime(CLOCK_MONOTONIC, &t_end);
>> @@ -2398,6 +2818,23 @@ static void *run_workload(void *data)
>>   static void fini_workload(struct workload *wrk)
>>   {
>> +    if (is_xe) {
>> +        struct exec_queue *eq;
>> +        struct ctx *ctx;
>> +        struct vm *vm;
>> +
>> +        for_each_ctx(ctx, wrk)
>> +            for_each_exec_queue(eq, ctx) {
>> +                xe_exec_queue_destroy(fd, eq->id);
>> +                eq->id = 0;
>> +            }
>> +        for_each_vm(vm, wrk) {
>> +            put_ahnd(vm->ahnd);
>> +            xe_vm_destroy(fd, vm->id);
>> +        }
>> +        free(wrk->vm_list);
>> +        wrk->nr_vms = 0;
>> +    }
>>       free(wrk->steps);
>>       free(wrk);
>>   }
>> @@ -2605,8 +3042,12 @@ int main(int argc, char **argv)
>>           ret = igt_device_find_first_i915_discrete_card(&card);
>>           if (!ret)
>>               ret = igt_device_find_integrated_card(&card);
>> +        if (!ret)
>> +            ret = igt_device_find_first_xe_discrete_card(&card);
>> +        if (!ret)
>> +            ret = igt_device_find_xe_integrated_card(&card);
>>           if (!ret) {
>> -            wsim_err("No device filter specified and no i915 devices 
>> found!\n");
>> +            wsim_err("No device filter specified and no intel devices 
>> found!\n");
>>               return EXIT_FAILURE;
>>           }
>>       }
>> @@ -2629,6 +3070,10 @@ int main(int argc, char **argv)
>>       if (verbose > 1)
>>           printf("Using device %s\n", drm_dev);
>> +    is_xe = is_xe_device(fd);
>> +    if (is_xe)
>> +        xe_device_get(fd);
> 
> What does this do, out of curiosity? There is no put AFAICT.

It reads (via ioctls) many device properties (query gts, engines, 
topology..) and caches that in a map with fd as a key. So calls like

xe_for_each_hw_engine(fd, hwe) {
  ...
}

xe_has_vram, xe_number_hw_engines... (in lib/xe_query)

are using that cached data.

And indeed the put is missing and should be next to close(fd).
> 
>> +
>>       if (!nr_w_args) {
>>           wsim_err("No workload descriptor(s)!\n");
>>           goto err;
>> diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
>> index e4fd61645..f49a73989 100644
>> --- a/benchmarks/wsim/README
>> +++ b/benchmarks/wsim/README
>> @@ -88,6 +88,10 @@ Batch durations can also be specified as infinite 
>> by using the '*' in the
>>   duration field. Such batches must be ended by the terminate command 
>> ('T')
>>   otherwise they will cause a GPU hang to be reported.
>> +Note: On Xe Batch dependencies are expressed with syncobjects,
>> +so there is no difference between f-1 and -1
>> +ex. 1.1000.-2.0 is same as 1.1000.f-2.0.
>> +
> 
> Maybe add a "chapter" talking about the differences between i915 and xe, 
> for all the ones which may be relevant. This one in particular may not 
> have any practical effect, dont' know. Presumably mixing explicit fence 
> creating with implicit, simulated data dependencies all works fine?
> 
> Or maybe on top of that we will end up needing two chapters to list the 
> commands only available for each backend.

Sound reasonable.

> 
>>   Sync (fd) fences
>>   ----------------
>> @@ -131,7 +135,7 @@ runnable. When the second RCS batch completes the 
>> standalone fence is signaled
>>   which allows the two VCS batches to be executed. Finally we wait 
>> until the both
>>   VCS batches have completed before starting the (optional) next 
>> iteration.
>> -Submit fences
>> +Submit fences (i915 only?)
> 
> s/?//
> 
>>   -------------
>>   Submit fences are a type of input fence which are signalled when the 
>> originating
> 
> Regards,
> 
> Tvrtko

Thanks a lot for review
--
marcin
