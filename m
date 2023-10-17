Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083E489190
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 15:28:42 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5046bf37ec1so7142940e87.1
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 08:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231013112848.68164-1-zbigniew.kempczynski@intel.com>
 <20231013112848.68164-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231013112848.68164-4-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 17 Oct 2023 16:28:12 +0100
Message-ID: <CAM0jSHMktZJYzw6u4TMmE8Z_HGLprcKLJ7b=eK3hk_1F6bG+=A@mail.gmail.com>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] tests/xe_evict_ccs: Add evict
 ccs test
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

On Fri, 13 Oct 2023 at 12:31, Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> Exercise is flat-ccs eviction working fine in the kernel driver
> when buffers takes more than available vram. Differentiate with
> standalone/parallel execution, same or separate drm fd and buffer
> freeing time. Tests are divided to two groups - first which won't
> exceed vram memory size (thus don't trigger eviction, but it is
> good for the reference logic is properly compress/decompress
> buffers) and second which exceeds.
>
> v2:
> - Add command line switches to exercise kernel with different
>   sizes, number of objects and vram overcommitment
> - Add -simple test which creates single big object which enforces
>   eviction (Matt)
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  tests/intel/xe_evict_ccs.c | 522 +++++++++++++++++++++++++++++++++++++
>  tests/meson.build          |   1 +
>  2 files changed, 523 insertions(+)
>  create mode 100644 tests/intel/xe_evict_ccs.c
>
> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
> new file mode 100644
> index 0000000000..72872f952b
> --- /dev/null
> +++ b/tests/intel/xe_evict_ccs.c
> @@ -0,0 +1,522 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +/**
> + * TEST: Check flat-ccs eviction
> + * Category: Software building block
> + * Sub-category: Flat-CCS
> + * Functionality: evict
> + * GPU requirements: GPU needs to have dedicated VRAM
> + */
> +
> +#include "igt.h"
> +#include "igt_list.h"
> +#include "intel_blt.h"
> +#include "intel_mocs.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +#include "xe_drm.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include <math.h>
> +#include <string.h>
> +
> +#define OVERCOMMIT_VRAM_PERCENT 110
> +#define MIN_OBJ_KB 64
> +#define MAX_OBJ_KB (256 * 1024)
> +#define DUMP_FILENAME "/tmp/object.data"
> +#define DUMP_EXPFILENAME "/tmp/object.expected"
> +
> +static struct param {
> +       bool print_bb;
> +       bool disable_compression;
> +       bool dump_corrupted_surface;
> +       int num_objs;
> +       int vram_percent;
> +       int min_size_kb;
> +       int max_size_kb;
> +       bool verify;
> +} params =3D {
> +       .num_objs =3D 0,
> +       .vram_percent =3D OVERCOMMIT_VRAM_PERCENT,
> +       .min_size_kb =3D MIN_OBJ_KB,
> +       .max_size_kb =3D MAX_OBJ_KB,
> +};
> +
> +struct object {
> +       uint64_t size;
> +       uint32_t start_value;
> +       struct blt_copy_object *blt_obj;
> +       struct igt_list_head link;
> +};
> +
> +#define TEST_PARALLEL          (1 << 0)
> +#define TEST_INSTANTFREE       (1 << 1)
> +#define TEST_REOPEN            (1 << 2)
> +#define TEST_SIMPLE            (1 << 3)
> +
> +#define MAX_NPROC 8
> +struct config {
> +       uint32_t flags;
> +       int nproc;
> +       int free_mb, total_mb;
> +       int test_mb, mb_per_proc;
> +       const struct param *param;
> +};
> +
> +static void copy_obj(struct blt_copy_data *blt,
> +                    struct blt_copy_object *src_obj,
> +                    struct blt_copy_object *dst_obj,
> +                    intel_ctx_t *ctx,
> +                    uint64_t ahnd)
> +{
> +       struct blt_block_copy_data_ext ext =3D {};
> +       int fd =3D blt->fd;
> +       uint64_t bb_size =3D xe_get_default_alignment(fd);
> +       uint32_t bb;
> +       uint32_t w, h;
> +
> +       w =3D src_obj->x2;
> +       h =3D src_obj->y2;
> +
> +       bb =3D xe_bo_create_flags(fd, 0, bb_size,
> +                               vram_memory(fd, 0) | XE_GEM_CREATE_FLAG_N=
EEDS_VISIBLE_VRAM);

Nit: we can use visible_vram_memory() here.

> +
> +       blt->color_depth =3D CD_32bit;
> +       blt->print_bb =3D params.print_bb;
> +       blt_set_copy_object(&blt->src, src_obj);
> +       blt_set_copy_object(&blt->dst, dst_obj);
> +       blt_set_object_ext(&ext.src, 0, w, h, SURFACE_TYPE_2D);
> +       blt_set_object_ext(&ext.dst, 0, w, h, SURFACE_TYPE_2D);
> +       blt_set_batch(&blt->bb, bb, bb_size, vram_if_possible(fd, 0));
> +       blt_block_copy(fd, ctx, NULL, ahnd, blt, &ext);
> +       intel_ctx_xe_sync(ctx, true);
> +
> +       gem_close(fd, bb);
> +       put_offset(ahnd, bb);
> +       put_offset(ahnd, blt->src.handle);
> +       put_offset(ahnd, blt->dst.handle);
> +       intel_allocator_bind(ahnd, 0, 0);
> +}
> +
> +static uint32_t rand_and_update(uint32_t *left, uint32_t min, uint32_t m=
ax)
> +{
> +       int left_bit, min_bit, max_bit, rand_id, rand_kb;
> +
> +       left_bit =3D igt_fls(*left) - 1;
> +       min_bit =3D igt_fls(min) - 1;
> +       max_bit =3D max_t(int, min_t(int, igt_fls(max) - 1, left_bit), ig=
t_fls(max));
> +       rand_id =3D rand() % (max_bit - min_bit);
> +       rand_kb =3D 1 << (rand_id + min_bit);
> +
> +       if (*left >=3D rand_kb)
> +               *left -=3D rand_kb;
> +       else
> +               *left =3D 0;
> +
> +       return rand_kb;
> +}
> +
> +static struct object *create_obj(struct blt_copy_data *blt,
> +                                intel_ctx_t *ctx, uint64_t ahnd,
> +                                uint64_t size, int start_value,
> +                                bool disable_compression)
> +{
> +       int fd =3D blt->fd;
> +       struct object *obj;
> +       uint32_t w, h;
> +       uint8_t uc_mocs =3D intel_get_uc_mocs_index(fd);
> +       int i;
> +       struct blt_copy_object *src;
> +
> +       obj =3D calloc(1, sizeof(*obj));
> +       igt_assert(obj);
> +       obj->size =3D size;
> +       obj->start_value =3D start_value;
> +
> +       w =3D max_t(int, 1024, roundup_power_of_two(sqrt(size/4)));
> +       h =3D size / w / 4; /* /4 - 32bpp */
> +
> +       igt_debug("Obj size: %ldKiB (%ldMiB) <w: %d, h: %d>\n",
> +                 size / SZ_1K, size / SZ_1M, w, h);
> +
> +       src =3D blt_create_object(blt,
> +                               system_memory(fd),
> +                               w, h, 32, uc_mocs,
> +                               T_LINEAR, COMPRESSION_DISABLED,
> +                               COMPRESSION_TYPE_3D, true);
> +
> +       obj->blt_obj =3D blt_create_object(blt,
> +                                        vram_memory(fd, 0) | XE_GEM_CREA=
TE_FLAG_NEEDS_VISIBLE_VRAM,

Same here. I assume blt_create_object() knows to ignore the non-region
bits when setting obj->region, or doesn't it really matter?

> +                                        w, h, 32, uc_mocs,
> +                                        T_LINEAR,
> +                                        disable_compression ? COMPRESSIO=
N_DISABLED :
> +                                                              COMPRESSIO=
N_ENABLED,
> +                                        COMPRESSION_TYPE_3D, true);
> +
> +       for (i =3D 0; i < size / sizeof(uint32_t); i++)
> +               src->ptr[i] =3D start_value++;
> +
> +       copy_obj(blt, src, obj->blt_obj, ctx, ahnd);
> +
> +       blt_destroy_object_and_alloc_free(fd, ahnd, src);
> +       intel_allocator_bind(ahnd, 0, 0);
> +
> +       return obj;
> +}
> +
> +static void dump_obj(const struct blt_copy_object *obj, int start_value)
> +{
> +       FILE *out;
> +
> +       if (!params.dump_corrupted_surface)
> +               return;
> +
> +       out =3D fopen(DUMP_FILENAME, "wb");
> +       fwrite(obj->ptr, obj->size, 1, out);
> +       fclose(out);
> +
> +       out =3D fopen(DUMP_EXPFILENAME, "wb");
> +       for (int i =3D 0; i < obj->size / 4; i++) {
> +               int v =3D start_value + i;
> +
> +               fwrite(&v, sizeof(int), 1, out);
> +       }
> +       fclose(out);
> +}
> +
> +static void check_obj(const char *check_mode,
> +                     const struct blt_copy_object *obj, uint64_t size,
> +                     int start_value, int num_obj)
> +{
> +       int i, idx;
> +
> +       if (obj->ptr[0] !=3D start_value ||
> +           (obj->ptr[size/4 - 1] !=3D start_value + size/4 - 1)) {
> +               igt_info("[%s] Failed object w: %d, h: %d, size: %ldKiB (=
%ldMiB)\n",
> +                        check_mode, obj->x2, obj->y2, obj->size / SZ_1K,=
 obj->size / SZ_1M);
> +               dump_obj(obj, start_value);
> +       }
> +
> +       igt_assert_eq(obj->ptr[0], start_value);
> +       igt_assert_eq(obj->ptr[size/4 - 1], start_value + size/4 - 1);
> +
> +       /* Couple of checks of random indices */
> +       for (i =3D 0; i < 128; i++) {
> +               idx =3D rand() % (size/4);
> +
> +               if (obj->ptr[idx] !=3D start_value + idx) {
> +                       igt_info("[%s] Failed object w: %d, h: %d, size: =
%ldKiB (%ldMiB)\n",
> +                                check_mode, obj->x2, obj->y2,
> +                                obj->size / SZ_1K, obj->size / SZ_1M);
> +                       dump_obj(obj, start_value);
> +               }
> +
> +               igt_assert_f(obj->ptr[idx] =3D=3D start_value + idx,
> +                            "[%s] Object number %d doesn't contain valid=
 data",
> +                            check_mode, num_obj);
> +       }
> +}
> +
> +static void evict_single(int fd, int child, const struct config *config)
> +{
> +       struct blt_copy_data blt =3D {};
> +       struct blt_copy_object *orig_obj;
> +       uint32_t kb_left =3D config->mb_per_proc * SZ_1K;
> +       uint32_t min_alloc_kb =3D config->param->min_size_kb;
> +       uint32_t max_alloc_kb =3D config->param->max_size_kb;
> +       uint32_t vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS,=
 0);
> +       uint64_t ahnd =3D intel_allocator_open(fd, vm, INTEL_ALLOCATOR_RE=
LOC);
> +       uint8_t uc_mocs =3D intel_get_uc_mocs_index(fd);
> +       struct object *obj, *tmp;
> +       struct igt_list_head list;
> +       struct drm_xe_engine_class_instance inst =3D {
> +               .engine_class =3D DRM_XE_ENGINE_CLASS_COPY,
> +       };
> +       intel_ctx_t *ctx;
> +       uint32_t exec_queue, big_obj;
> +       int num_obj =3D 0;
> +
> +       srandom(time(NULL));
> +       IGT_INIT_LIST_HEAD(&list);
> +       igt_debug("[%2d] child : to allocate: %uMiB\n", child, kb_left/SZ=
_1K);
> +
> +       blt_copy_init(fd, &blt);
> +
> +       exec_queue =3D xe_exec_queue_create(fd, vm, &inst, 0);
> +       ctx =3D intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
> +
> +       while (kb_left) {
> +               struct blt_copy_object *verify_obj;
> +               uint64_t obj_size =3D rand_and_update(&kb_left, min_alloc=
_kb, max_alloc_kb) * SZ_1K;
> +               int start_value =3D rand();
> +
> +               if (config->flags & TEST_SIMPLE)
> +                       obj_size =3D max_alloc_kb * SZ_1K;
> +
> +               obj =3D create_obj(&blt, ctx, ahnd, obj_size, start_value=
,
> +                                config->param->disable_compression);
> +               igt_list_add(&obj->link, &list);
> +
> +               if (config->param->verify) {
> +                       verify_obj =3D blt_create_object(&blt, system_mem=
ory(fd),
> +                                                      obj->blt_obj->x2,
> +                                                      obj->blt_obj->y2,
> +                                                      32, uc_mocs,
> +                                                      T_LINEAR, COMPRESS=
ION_DISABLED,
> +                                                      0, true);
> +                       copy_obj(&blt, obj->blt_obj, verify_obj, ctx, ahn=
d);
> +                       check_obj("Verify", verify_obj, obj->blt_obj->siz=
e,
> +                                 obj->start_value, num_obj++);
> +                       blt_destroy_object_and_alloc_free(fd, ahnd, verif=
y_obj);
> +                       intel_allocator_bind(ahnd, 0, 0);
> +               }
> +
> +               if (config->flags & TEST_SIMPLE) {
> +                       big_obj =3D xe_bo_create_flags(fd, vm, kb_left * =
SZ_1K,
> +                                                    vram_memory(fd, 0));
> +                       break;
> +               }
> +
> +               if (config->param->num_objs && ++num_obj =3D=3D config->p=
aram->num_objs)
> +                       break;
> +       }
> +
> +       if (config->param->verify)
> +               igt_info("[%8d] Verify ok\n", getpid());
> +
> +       num_obj =3D 0;
> +       igt_list_for_each_entry_safe(obj, tmp, &list, link) {
> +               orig_obj =3D blt_create_object(&blt, system_memory(fd),
> +                                            obj->blt_obj->x2,
> +                                            obj->blt_obj->y2,
> +                                            32, uc_mocs,
> +                                            T_LINEAR, COMPRESSION_DISABL=
ED,
> +                                            0, true);
> +               copy_obj(&blt, obj->blt_obj, orig_obj, ctx, ahnd);
> +               check_obj("Check", orig_obj, obj->blt_obj->size, obj->sta=
rt_value, num_obj++);
> +               blt_destroy_object_and_alloc_free(fd, ahnd, orig_obj);
> +
> +               if (config->flags & TEST_INSTANTFREE) {
> +                       igt_list_del(&obj->link);
> +                       blt_destroy_object_and_alloc_free(fd, ahnd, obj->=
blt_obj);
> +                       free(obj);
> +               }
> +               intel_allocator_bind(ahnd, 0, 0);
> +       }
> +
> +       if (!(config->flags & TEST_INSTANTFREE))
> +               igt_list_for_each_entry_safe(obj, tmp, &list, link) {
> +                       igt_list_del(&obj->link);
> +                       blt_destroy_object_and_alloc_free(fd, ahnd, obj->=
blt_obj);
> +                       free(obj);
> +               }
> +
> +       if (config->flags & TEST_SIMPLE)
> +               gem_close(fd, big_obj);
> +}
> +
> +static void set_config(int fd, uint32_t flags, const struct param *param=
,
> +                      struct config *config)
> +{
> +       int nproc =3D 1;
> +
> +       config->param =3D param;
> +       config->flags =3D flags;
> +       config->free_mb =3D xe_vram_available(fd, 0) / SZ_1M;

Should this be visible avail?

> +       config->total_mb =3D xe_visible_vram_size(fd, 0) / SZ_1M;
> +       config->test_mb =3D min_t(int, config->free_mb * config->param->v=
ram_percent / 100,
> +                               config->total_mb * config->param->vram_pe=
rcent / 100);
> +
> +       igt_debug("VRAM memory size: %dMB/%dMB (use %dMB), overcommit per=
c: %d\n",
> +                 config->free_mb, config->total_mb,
> +                 config->test_mb, config->param->vram_percent);
> +
> +       if (flags & TEST_PARALLEL)
> +               nproc =3D min_t(int, sysconf(_SC_NPROCESSORS_ONLN), MAX_N=
PROC);
> +       config->nproc =3D nproc;
> +       config->mb_per_proc =3D config->test_mb / nproc;
> +
> +       igt_debug("nproc: %d, mem per proc: %dMB\n", nproc, config->mb_pe=
r_proc);
> +}
> +
> +static void evict_ccs(int fd, uint32_t flags, const struct param *param)
> +{
> +       struct config config;
> +       char numstr[32];
> +
> +       igt_info("Test mode <parallel: %d, instant free: %d, reopen: %d, =
simple: %d>\n",
> +                !!(flags & TEST_PARALLEL),
> +                !!(flags & TEST_INSTANTFREE),
> +                !!(flags & TEST_REOPEN),
> +                !!(flags & TEST_SIMPLE));
> +       if (param->num_objs)
> +               snprintf(numstr, sizeof(numstr), "%d", param->num_objs);
> +       else
> +               strncpy(numstr, "limited to vram", sizeof(numstr));
> +       igt_info("Params: compression: %s, num objects: %s, vram percent:=
 %d, kb <min: %d, max: %d>\n",
> +                param->disable_compression ? "disabled" : "enabled",
> +                numstr, param->vram_percent,
> +                param->min_size_kb, param->max_size_kb);
> +
> +       set_config(fd, flags, param, &config);
> +
> +       if (flags & TEST_PARALLEL) {
> +               igt_fork(n, config.nproc) {
> +                       if (flags & TEST_REOPEN) {
> +                               fd =3D drm_reopen_driver(fd);
> +                               intel_allocator_init();
> +                       }
> +                       evict_single(fd, n, &config);
> +               }
> +               igt_waitchildren();
> +       } else {
> +               if (flags & TEST_REOPEN)
> +                       fd =3D drm_reopen_driver(fd);
> +               evict_single(fd, 0, &config);
> +       }
> +}
> +
> +/**
> + *
> + * SUBTEST: evict-ccs-overcommit-simple
> + * Description: FlatCCS eviction test.
> + * Feature: flatccs
> + * Test category: stress test
> + */
> +/**
> + *
> + * SUBTEST: evict-ccs-overcommit-%s-%s-%s
> + * Description: FlatCCS eviction test.
> + * Feature: flatccs
> + * Test category: stress test
> + *
> + * arg[1]:
> + *
> + * @standalone:                        single process
> + * @parallel:                  multiple processes
> + *
> + * arg[2]:
> + *
> + * @nofree:                    keep objects till the end of the test
> + * @instantfree:               free object after it was verified and it =
won't
> + *                             be used anymore
> + *
> + * arg[3]:
> + *
> + * @samefd:                    operate on same opened drm fd
> + * @reopen:                    use separately opened drm fds
> + *
> + */
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +       switch (opt) {
> +       case 'b':
> +               params.print_bb =3D true;
> +               igt_debug("Print bb: %d\n", params.print_bb);
> +               break;
> +       case 'd':
> +               params.disable_compression =3D true;
> +               igt_debug("Print bb: %d\n", params.disable_compression);
> +               break;
> +       case 'D':
> +               params.dump_corrupted_surface =3D true;
> +               igt_debug("Print bb: %d\n", params.dump_corrupted_surface=
);
> +               break;
> +       case 'n':
> +               params.num_objs =3D atoi(optarg);
> +               igt_debug("Number objects: %d\n", params.num_objs);
> +               break;
> +       case 'p':
> +               params.vram_percent =3D atoi(optarg);
> +               igt_debug("Percent vram: %d\n", params.vram_percent);
> +               break;
> +       case 's':
> +               params.min_size_kb =3D atoi(optarg);
> +               igt_debug("Min size kb: %d\n", params.min_size_kb);
> +               break;
> +       case 'S':
> +               params.max_size_kb =3D atoi(optarg);
> +               igt_debug("Max size kb: %d\n", params.max_size_kb);
> +               break;
> +       case 'V':
> +               params.verify =3D true;
> +               igt_debug("Verify: %d\n", params.verify);
> +               break;
> +       default:
> +               return IGT_OPT_HANDLER_ERROR;
> +       }
> +
> +       return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =3D
> +       "  -b\tPrint bb\n"
> +       "  -d\tDisable compression (don't use flatccs area)\n"
> +       "  -D\tDump surface which doesn't match\n"
> +       "  -e\tAdd temporary object which enforce eviction\n"
> +       "  -n\tNumber of objects to create (0 - 31)\n"
> +       "  -p\tPercent of VRAM to alloc\n"
> +       "  -s\tMinimum size of object in kb\n"
> +       "  -S\tMaximum size of object in kb\n"
> +       "  -V\tVerify object after compressing\n"
> +       ;
> +
> +igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
> +{
> +       struct drm_xe_engine_class_instance *hwe;
> +
> +       const struct ccs {
> +               const char *name;
> +               uint32_t flags;
> +       } ccs[] =3D {
> +               { "simple",
> +                       TEST_SIMPLE },
> +               { "standalone-nofree-samefd",
> +                       0 },
> +               { "standalone-nofree-reopen",
> +                       TEST_REOPEN },
> +               { "standalone-instantfree-samefd",
> +                       TEST_INSTANTFREE },
> +               { "standalone-instantfree-reopen",
> +                       TEST_INSTANTFREE | TEST_REOPEN },
> +               { "parallel-nofree-samefd",
> +                       TEST_PARALLEL },
> +               { "parallel-nofree-reopen",
> +                       TEST_PARALLEL | TEST_REOPEN },
> +               { "parallel-instantfree-samefd",
> +                       TEST_PARALLEL | TEST_INSTANTFREE },
> +               { "parallel-instantfree-reopen",
> +                       TEST_PARALLEL | TEST_INSTANTFREE | TEST_REOPEN },
> +               { },
> +       };
> +       uint64_t vram_size;
> +       int fd;
> +
> +       igt_fixture {
> +               fd =3D drm_open_driver(DRIVER_XE);
> +               igt_require(xe_has_vram(fd));
> +               vram_size =3D xe_visible_vram_size(fd, 0);
> +               igt_assert(vram_size);
> +
> +               xe_for_each_hw_engine(fd, hwe)
> +                       if (hwe->engine_class !=3D DRM_XE_ENGINE_CLASS_CO=
PY)
> +                               break;
> +       }
> +
> +       igt_fixture
> +               intel_allocator_multiprocess_start();
> +
> +       for (const struct ccs *s =3D ccs; s->name; s++) {
> +               igt_subtest_f("evict-ccs-overcommit-%s", s->name)
> +                       evict_ccs(fd, s->flags, &params);
> +       }
> +
> +       igt_fixture {
> +               intel_allocator_multiprocess_stop();
> +               drm_close_driver(fd);
> +       }
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2c2e1ca9ac..831947567f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -279,6 +279,7 @@ intel_xe_progs =3D [
>         'xe_debugfs',
>         'xe_drm_fdinfo',
>         'xe_evict',
> +       'xe_evict_ccs',
>         'xe_exec_balancer',
>         'xe_exec_basic',
>         'xe_exec_compute_mode',
> --
> 2.34.1
>
