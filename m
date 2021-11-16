Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492B76F385
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 10:32:06 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id i9so20013751qki.3
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 02:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20211115071610.14773-1-zbigniew.kempczynski@intel.com>
 <20211115071610.14773-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211115071610.14773-2-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 16 Nov 2021 10:31:38 +0000
Message-ID: <CAM0jSHNi38e0H+8jXrZJ+RRcqkAzCCdQnYHhht67gg2-xLNqrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_lmem_swapping: Add
 the gem_lmem_swapping test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 15 Nov 2021 at 07:16, Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> From: CQ Tang <cq.tang@intel.com>
>
> This test exercises the lmem eviction functionality with one
> dynamic subtest per lmem region.
>
> In essence the various subtests create lmem buffers objects consuming mor=
e
> lmem memory than available and check that they are successful submitting
> workload subsets whose lmem size requirements are smaller than the total
> amount of lmem available, forcing eviction of buffer objects under
> various conditions.
>
> v2: - addressing review comments (handling seed, minor cleanups) (Zbignie=
w)
>     - add dynamic_lmem_subtest() macro (Maarten)
>
> v3: - make seed unique for each process (Zbigniew)
>     - add simple igt_describe() (Petri)
>
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Co-developed-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> Co-developed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Co-developed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.co=
m>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Acked-by: Petri Latvala <petri.latvala@intel.com>
> ---
>  tests/i915/gem_lmem_swapping.c | 550 +++++++++++++++++++++++++++++++++
>  tests/meson.build              |   1 +
>  2 files changed, 551 insertions(+)
>  create mode 100644 tests/i915/gem_lmem_swapping.c
>
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swappin=
g.c
> new file mode 100644
> index 000000000..786110338
> --- /dev/null
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -0,0 +1,550 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2021 Intel Corporation
> + */
> +
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +#include "i915/gem_vm.h"
> +#include "i915/intel_memory_region.h"
> +#include "igt.h"
> +#include "igt_kmod.h"
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <errno.h>
> +#include <sys/stat.h>
> +#include <sys/ioctl.h>
> +#include <sys/time.h>
> +#include <sys/wait.h>
> +#include "drm.h"
> +
> +IGT_TEST_DESCRIPTION("Exercise local memory swapping.");
> +
> +#define __round_mask(x, y) ((__typeof__(x))((y) - 1))
> +#define round_up(x, y) ((((x) - 1) | __round_mask(x, y)) + 1)
> +
> +#define PAGE_SIZE  (1ULL << 12)
> +#define SZ_64K    (16 * PAGE_SIZE)
> +
> +static const char *readable_unit(uint64_t size)
> +{
> +       return size >> 20 ? "MiB" : size >> 10 ? "KiB" : "Bytes";
> +}
> +
> +static uint64_t readable_size(uint64_t size)
> +{
> +       return size >> 20 ? size >> 20 : size >> 10 ? size >> 10 : size;
> +}
> +
> +struct {
> +       unsigned int seed;
> +       bool user_seed;
> +} opt;
> +
> +struct params {
> +       struct {
> +               uint64_t min;
> +               uint64_t max;
> +       } size;
> +       unsigned int count;
> +       unsigned int loops;
> +       unsigned int mem_limit;
> +#define TEST_VERIFY    (1 << 0)
> +#define TEST_PARALLEL  (1 << 1)
> +#define TEST_HEAVY     (1 << 2)
> +#define TEST_RANDOM    (1 << 3)
> +#define TEST_ENGINES   (1 << 4)
> +#define TEST_MULTI     (1 << 5)
> +       unsigned int flags;
> +       unsigned int seed;
> +       bool oom_test;
> +};
> +
> +struct object {
> +       uint64_t size;
> +       uint32_t seed;
> +       uint32_t handle;
> +};
> +
> +static uint32_t create_bo(int i915,
> +                         uint64_t size,
> +                         struct drm_i915_gem_memory_class_instance *regi=
on,
> +                         bool do_oom_test)
> +{
> +       uint32_t handle;
> +       int ret;
> +
> +retry:
> +       ret =3D __gem_create_in_memory_region_list(i915, &handle, &size, =
region, 1);
> +       if (do_oom_test && (ret =3D=3D -ENOMEM || ret =3D=3D -ENXIO))

AFAIK __gem_create doesn't allocate any pages(at least on drm-tip),
just a "shell" object, so we shouldn't expect to see something like
-ENXIO here. Hopefully this doesn't change the meaning of some test
below using this?

> +               goto retry;
> +       igt_assert_eq(ret, 0);
> +       return handle;
> +}
> +
> +static unsigned int __num_engines__;
> +
> +static void
> +init_object(int i915, struct object *obj, unsigned long seed, unsigned i=
nt flags)
> +{
> +       unsigned int j;
> +       uint32_t *buf;
> +
> +       obj->seed =3D seed;
> +
> +       buf =3D gem_mmap_offset__fixed(i915, obj->handle, 0, obj->size, P=
ROT_WRITE);
> +
> +       for (j =3D 0; j < obj->size / sizeof(*buf); j++)
> +               buf[j] =3D seed++;
> +
> +       munmap(buf, obj->size);
> +}
> +
> +static void
> +verify_object(int i915, const struct object *obj,  unsigned int flags)
> +{
> +       unsigned long j;
> +       uint32_t *buf;
> +
> +       buf =3D gem_mmap_offset__fixed(i915, obj->handle, 0, obj->size, P=
ROT_READ);
> +
> +       for (j =3D 0; j < obj->size / PAGE_SIZE; j++) {
> +               unsigned long x =3D (j * PAGE_SIZE + rand() % PAGE_SIZE) =
/ sizeof(*buf);
> +               uint32_t val =3D obj->seed + x;
> +
> +               igt_assert_f(buf[x] =3D=3D val,
> +                            "Object mismatch at offset %zu - found %08x,=
 expected %08x; difference:%08x!\n",
> +                            x * sizeof(*buf), buf[x], val, buf[x] ^ val)=
;
> +       }
> +
> +       munmap(buf, obj->size);
> +}
> +
> +static void move_to_lmem(int i915,
> +                        struct object *list,
> +                        unsigned int num,
> +                        uint32_t batch,
> +                        unsigned int engine,
> +                        bool do_oom_test)
> +{
> +       struct drm_i915_gem_exec_object2 obj[1 + num];
> +       struct drm_i915_gem_execbuffer2 eb =3D {
> +               .buffers_ptr =3D to_user_pointer(obj),
> +               .buffer_count =3D 1 + num,
> +               .flags =3D I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT | en=
gine,
> +       };
> +       unsigned int i, ret;
> +
> +       memset(obj, 0, sizeof(obj));
> +
> +       for (i =3D 0; i < num; i++) {
> +               obj[i].handle =3D list[i].handle;
> +               obj[i].flags =3D EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +       }
> +
> +       obj[i].handle =3D batch;
> +retry:
> +       ret =3D __gem_execbuf(i915, &eb);
> +       if (do_oom_test && (ret =3D=3D -ENOMEM || ret =3D=3D -ENXIO))
> +               goto retry;
> +       igt_assert_eq(ret, 0);
> +}
> +
> +static void __do_evict(int i915,
> +                      struct drm_i915_gem_memory_class_instance *region,
> +                      struct params *params,
> +                      unsigned int seed)
> +{
> +       const unsigned int max_swap_in =3D params->count / 100 + 1;
> +       const uint32_t bbe =3D MI_BATCH_BUFFER_END;
> +       struct object *objects, *obj, *list;
> +       uint32_t batch;
> +       unsigned int engine =3D 0;
> +       unsigned int i, l;
> +       uint64_t size;
> +       struct timespec t =3D {};
> +       unsigned int num;
> +
> +       __gem_context_set_persistence(i915, 0, false);
> +       size =3D 4096;
> +       batch =3D create_bo(i915, size, region, params->oom_test);
> +
> +       gem_write(i915, batch, 0, &bbe, sizeof(bbe));
> +
> +       objects =3D calloc(params->count, sizeof(*objects));
> +       igt_assert(objects);
> +
> +       list =3D calloc(max_swap_in, sizeof(*list));
> +       igt_assert(list);
> +
> +       srand(seed);
> +
> +       /* Create the initial working set of objects. */
> +
> +       size =3D 0;
> +       for (i =3D 0, obj =3D objects; i < params->count; i++, obj++) {
> +               if (params->flags & TEST_RANDOM)
> +                       obj->size =3D rand() %
> +                               (params->size.max - params->size.min) +
> +                               params->size.min;
> +               else
> +                       obj->size =3D params->size.min;
> +
> +               size +=3D obj->size;
> +               if ((size >> 20) > params->mem_limit) {
> +                       params->count =3D i;
> +                       break;
> +               }
> +               obj->handle =3D create_bo(i915, obj->size, region, params=
->oom_test);
> +
> +               if (params->flags & TEST_VERIFY)
> +                       init_object(i915, obj, rand(), params->flags);
> +               else
> +                       move_to_lmem(i915, objects + i, 1, batch, engine,
> +                                    params->oom_test);
> +       }
> +
> +       igt_debug("obj size min/max=3D%lu %s/%lu %s, count=3D%u, seed: %u=
\n",
> +                 readable_size(params->size.min), readable_unit(params->=
size.min),
> +                 readable_size(params->size.max), readable_unit(params->=
size.max),
> +                 params->count, seed);
> +
> +       /*
> +        * Move random objects back into lmem.
> +        * for TEST_MULTI runs, make each object count s a loop to
> +        * avoid excessive run times

Strange formatting?

> +        */
> +       for (l =3D 0; l < params->loops && igt_seconds_elapsed(&t) < 300;=
 l +=3D num) {
> +               unsigned int idx =3D rand() % params->count;
> +
> +               num =3D params->flags & TEST_MULTI ? rand() % max_swap_in=
 + 1 : 1;
> +               for (i =3D 0; i < num; i++) {
> +                       list[i] =3D objects[idx];
> +                       idx =3D (idx + 1) % params->count;
> +               }
> +
> +               move_to_lmem(i915, list, num, batch, engine, params->oom_=
test);
> +
> +               if (params->flags & TEST_ENGINES)
> +                       engine =3D (engine + 1) % __num_engines__;
> +
> +               if (params->flags & TEST_VERIFY) {
> +                       for (i =3D 0; i < num; i++)
> +                               verify_object(i915, &list[i], params->fla=
gs);
> +
> +                       /* Update random object - may swap it back in. */
> +                       i =3D rand() % params->count;
> +                       init_object(i915, &objects[i], rand(), params->fl=
ags);
> +               }
> +       }
> +
> +       for (i =3D 0; i < params->count; i++)
> +               gem_close(i915, objects[i].handle);
> +
> +       free(list);
> +       free(objects);
> +
> +       gem_close(i915, batch);
> +}
> +
> +static void fill_params(int i915, struct params *params,
> +                       struct drm_i915_memory_region_info *region,
> +                       unsigned int flags,
> +                       unsigned int nproc,
> +                       bool do_oom_test)
> +{
> +       const int swap_mb =3D /* For lmem, swap is total of smem + swap. =
*/
> +               intel_get_total_ram_mb() + intel_get_total_swap_mb();
> +       const unsigned int size =3D 1 << 20;
> +       const int max_swap_pct =3D 75;
> +       /*
> +        * In random mode, add 85% hard limit to use system memory.
> +        * noticed that 88.8% can trigger OOM on some system.
> +        */
> +       const int mem_limit_pct =3D 85;
> +       int spill_mb;
> +       uint32_t handle;
> +
> +       if (flags & TEST_RANDOM) {
> +               params->size.min =3D 4096;
> +               handle =3D create_bo(i915, params->size.min, &region->reg=
ion,
> +                                  do_oom_test);
> +               gem_close(i915, handle);
> +               params->size.max =3D 2 * size + params->size.min;
> +       } else {
> +               params->size.min =3D size;
> +               params->size.max =3D size;
> +       }
> +
> +       params->count =3D (region->probed_size + (size - 1)) / size * 3 /=
 2;
> +       spill_mb =3D (size >> 20) * params->count - (region->probed_size =
>> 20);
> +       /* Don't use all RAM for swapout. */
> +       igt_require(spill_mb <=3D swap_mb * max_swap_pct / 100);
> +
> +       if (flags & TEST_HEAVY) {
> +               params->count *=3D 2;
> +               spill_mb =3D (size >> 20) * params->count -
> +                       (region->probed_size >> 20);
> +
> +               if (spill_mb > swap_mb * max_swap_pct / 100) {
> +                       unsigned int count;
> +                       unsigned long set;
> +
> +                       igt_warn("Reducing working set due low RAM + swap=
! (Need %d MiB, have %d MiB.)\n",
> +                                spill_mb, swap_mb);
> +                       set =3D region->probed_size +
> +                               (((unsigned long)swap_mb * max_swap_pct /=
 100) << 20);
> +                       count =3D set / size;
> +                       /* No point if heavy test is too similar to norma=
l. */
> +                       igt_require(count > (params->count / 2) * 133 / 1=
00);
> +                       params->count =3D count;
> +               }
> +       }
> +
> +       params->loops =3D params->count;
> +       params->seed =3D opt.user_seed ? opt.seed : time(NULL);
> +
> +       /*
> +        * If run in parallel, reduce per process buffer count to keep th=
e
> +        * total the same, but don't reduce loops since we gain some
> +        * efficiency by the parallel execution
> +        */
> +       if (flags & TEST_PARALLEL)
> +               params->count /=3D nproc;
> +
> +       /*
> +        * For heavy tests, reduce the loop count to avoid excessive
> +        * run-times
> +        */
> +       if (flags & TEST_HEAVY)
> +               params->loops =3D params->loops / 2 + 1;
> +
> +       params->flags =3D flags;
> +       params->oom_test =3D do_oom_test;
> +
> +       params->mem_limit =3D swap_mb * mem_limit_pct / 100 +
> +               (region->probed_size >> 20);
> +       igt_info("Memory: system-total %dMiB, lmem-region %lldMiB, usage-=
limit %dMiB\n",
> +                swap_mb, (region->probed_size >> 20), params->mem_limit)=
;
> +       igt_info("Using %u thread(s), %u loop(s), %u objects of %lu %s - =
%lu %s, seed: %u, oom: %s\n",
> +                params->flags & TEST_PARALLEL ? nproc : 1,
> +                params->loops,
> +                params->count,
> +                readable_size(params->size.min),
> +                readable_unit(params->size.min),
> +                readable_size(params->size.max),
> +                readable_unit(params->size.max),
> +                params->seed,
> +                do_oom_test ? "yes" : "no");
> +}
> +
> +static void test_evict(int i915,
> +                      struct drm_i915_memory_region_info *region,
> +                      unsigned int flags)
> +{
> +       const unsigned int nproc =3D sysconf(_SC_NPROCESSORS_ONLN) + 1;
> +       struct params params;
> +
> +       fill_params(i915, &params, region, flags, nproc, false);
> +
> +       if (flags & TEST_PARALLEL) {
> +               int fd =3D gem_reopen_driver(i915);
> +
> +               igt_fork(child, nproc)
> +                       __do_evict(fd, &region->region, &params,
> +                                  params.seed + child + 1);
> +
> +               igt_waitchildren();
> +               close(fd);
> +       } else {
> +               __do_evict(i915, &region->region, &params, params.seed);
> +       }
> +}
> +
> +static void leak(uint64_t alloc)
> +{
> +       char *ptr;
> +
> +       ptr =3D mmap(NULL, alloc, PROT_READ | PROT_WRITE,
> +                  MAP_ANON | MAP_PRIVATE | MAP_POPULATE, -1, 0);
> +       if (ptr =3D=3D MAP_FAILED)
> +               return;
> +
> +       while (alloc) {
> +               alloc -=3D 4096;
> +               ptr[alloc] =3D 0;
> +       }
> +}
> +
> +static void gem_leak(int fd, uint64_t alloc)
> +{
> +       uint32_t handle =3D gem_create(fd, alloc);
> +       void *buf;
> +
> +       buf =3D gem_mmap_offset__fixed(fd, handle, 0, PAGE_SIZE, PROT_WRI=
TE);
> +       memset(buf, 0, PAGE_SIZE);
> +       munmap(buf, PAGE_SIZE);
> +
> +       gem_madvise(fd, handle, I915_MADV_DONTNEED);

Don't know if it matters much, but this doesn't really "leak" anything
AFAIK. It just allocates the pages and then drops them immediately in
the madvise, due to differences in how the mmap works in the ttm vs
the old stuff(the ttm fault handler doesn't currently set the
mm.pages). I guess it depends on what the original meaning of this
"gem_leak" was.

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +}
> +
> +static int *lmem_done;
> +
> +static void smem_oom_exit_handler(int sig)
> +{
> +       (*lmem_done)++;
> +}
> +
> +static void test_smem_oom(int i915,
> +                         struct drm_i915_memory_region_info *region)
> +{
> +       const uint64_t smem_size =3D intel_get_total_ram_mb() +
> +               intel_get_total_swap_mb();
> +       const unsigned int alloc =3D 256 * 1024 * 1024;
> +       const unsigned int num_alloc =3D 1 + smem_size / (alloc >> 20);
> +       struct igt_helper_process smem_proc =3D {};
> +       unsigned int n;
> +
> +       lmem_done =3D mmap(0, sizeof(*lmem_done), PROT_WRITE,
> +                        MAP_SHARED | MAP_ANON, -1, 0);
> +       igt_assert(lmem_done !=3D MAP_FAILED);
> +       *lmem_done =3D 0;
> +
> +       /* process for testing lmem eviction */
> +       igt_fork(child, 1) {
> +               int fd =3D gem_reopen_driver(i915);
> +               struct params params;
> +
> +               fill_params(i915, &params, region, 0, 1, true);
> +
> +               igt_install_exit_handler(smem_oom_exit_handler);
> +               __do_evict(fd, &region->region, &params,
> +                          params.seed + child + 1);
> +
> +               close(fd);
> +       }
> +
> +       /* smem memory hog process, respawn till the lmem process complet=
es */
> +       while (!READ_ONCE(*lmem_done)) {
> +               igt_fork_helper(&smem_proc) {
> +                       igt_fork(child, 1) {
> +                               for (int pass =3D 0; pass < num_alloc; pa=
ss++) {
> +                                       if (READ_ONCE(*lmem_done))
> +                                               break;
> +                                       leak(alloc);
> +                               }
> +                       }
> +                       igt_fork(child, 1) {
> +                               int fd =3D gem_reopen_driver(i915);
> +
> +                               for (int pass =3D 0; pass < num_alloc; pa=
ss++) {
> +                                       if (READ_ONCE(*lmem_done))
> +                                               break;
> +                                       gem_leak(fd, alloc);
> +                               }
> +                               close(fd);
> +                       }
> +                       /*
> +                        * Wait for grand-child processes to finish or be
> +                        * killed by the oom killer, don't call
> +                        * igt_waitchildren because of the noise
> +                        */
> +                       for (n =3D 0; n < 2; n++)
> +                               wait(NULL);
> +               }
> +               igt_wait_helper(&smem_proc);
> +       }
> +       munmap(lmem_done, sizeof(*lmem_done));
> +       /* Reap exit status of the lmem process */
> +       igt_waitchildren();
> +}
> +
> +#define dynamic_lmem_subtest(reg, regs, subtest_name...) \
> +       igt_subtest_with_dynamic(subtest_name) \
> +               for (unsigned int i =3D 0; i < (regs)->num_regions; i++) =
\
> +                       for_each_if (((reg) =3D &(regs)->regions[i])->reg=
ion.memory_class =3D=3D I915_MEMORY_CLASS_DEVICE) \
> +                               igt_dynamic_f("lmem%u", (reg)->region.mem=
ory_instance)
> +
> +static int opt_handler(int option, int option_index, void *input)
> +{
> +       switch (option) {
> +       case 's':
> +               opt.user_seed =3D true;
> +               opt.seed =3D strtoul(optarg, NULL, 0);
> +               break;
> +       default:
> +               return IGT_OPT_HANDLER_ERROR;
> +       }
> +
> +       return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =3D
> +       "  --seed       Seed for random number generator";
> +
> +struct option long_options[] =3D {
> +       { "seed",    required_argument, NULL, 's'},
> +       { 0, 0, 0, 0 }
> +};
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
> +{
> +       struct drm_i915_query_memory_regions *regions;
> +       struct drm_i915_memory_region_info *region;
> +       struct test {
> +               const char *name;
> +               unsigned int flags;
> +       } *test, tests[] =3D {
> +               { "basic", 0 },
> +               { "random", TEST_RANDOM },
> +               { "random-engines", TEST_RANDOM | TEST_ENGINES },
> +               { "heavy-random", TEST_RANDOM | TEST_HEAVY },
> +               { "heavy-multi", TEST_RANDOM | TEST_HEAVY | TEST_ENGINES =
| TEST_MULTI },
> +               { "verify", TEST_VERIFY},
> +               { "verify-random", TEST_VERIFY | TEST_RANDOM},
> +               { "heavy-verify-random", TEST_VERIFY | TEST_RANDOM | TEST=
_HEAVY },
> +               { "heavy-verify-multi", TEST_VERIFY | TEST_RANDOM | TEST_=
HEAVY | TEST_ENGINES | TEST_MULTI },
> +               { "parallel-random", TEST_PARALLEL | TEST_RANDOM },
> +               { "parallel-random-engines", TEST_PARALLEL | TEST_RANDOM =
| TEST_ENGINES },
> +               { "parallel-random-verify", TEST_PARALLEL | TEST_RANDOM |=
 TEST_VERIFY },
> +               { "parallel-multi", TEST_PARALLEL | TEST_RANDOM | TEST_VE=
RIFY | TEST_ENGINES | TEST_MULTI },
> +               { }
> +       };
> +       int i915 =3D -1;
> +
> +       igt_fixture {
> +               struct intel_execution_engine2 *e;
> +
> +               i915 =3D drm_open_driver(DRIVER_INTEL);
> +               igt_require_gem(i915);
> +
> +               regions =3D gem_get_query_memory_regions(i915);
> +               igt_require(regions);
> +
> +               for_each_physical_engine(i915, e)
> +                       __num_engines__++;
> +               igt_require(__num_engines__);
> +       }
> +
> +       for (test =3D tests; test->name; test++) {
> +               igt_describe("Exercise local memory swapping to system me=
mory");
> +               dynamic_lmem_subtest(region, regions, test->name)
> +                       test_evict(i915, region, test->flags);
> +       }
> +
> +       igt_describe("Exercise local memory swapping during exhausting sy=
stem memory");
> +       dynamic_lmem_subtest(region, regions, "smem-oom")
> +               test_smem_oom(i915, region);
> +
> +       igt_fixture {
> +               free(regions);
> +               close(i915);
> +       }
> +
> +       igt_exit();
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 0af3e03a3..49c0f2d24 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -156,6 +156,7 @@ i915_progs =3D [
>         'gem_gtt_speed',
>         'gem_huc_copy',
>         'gem_linear_blits',
> +       'gem_lmem_swapping',
>         'gem_lut_handle',
>         'gem_madvise',
>         'gem_media_fill',
> --
> 2.26.0
>
