Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C6510E3C0
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 12:57:43 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id x75so12404358qkb.12
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 05:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220616120558.1190406-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20220616120558.1190406-1-priyanka.dandamudi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Jun 2022 13:57:16 +0100
Message-ID: <CAM0jSHNEqgNYVT=QVCzd9GbtNQ2nfc3Xzvv-qK6DodqcNT5LDw@mail.gmail.com>
To: priyanka.dandamudi@intel.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/i915/i915_module_load: Test resizable
 bar support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 16 Jun 2022 at 13:16, <priyanka.dandamudi@intel.com> wrote:
>
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
> New test named resize bar has been added which tests whether
> bar gets resized with different supported sizes.
>
> v2: Added code to check for bad bar sizes.
> Modified code to check for support of lmem_bar_size modparam.(Petri)
>
> Note:Test gets executed when
> 1. modparam lmem_bar_size gets added.
> 2. small bar bits gets enabled.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/i915_module_load.c | 89 +++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index f5f98acc2..5a653711b 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -31,12 +31,17 @@
>  #include <fcntl.h>
>
>  #include "i915/gem_create.h"
> +#include "i915/gem.h"
>  #include "igt_debugfs.h"
>  #include "igt_aux.h"
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
>  #include "igt_core.h"
>
> +#define BAR_SIZE_SHIFT 20
> +#define MIN_BAR_SIZE 256
> +#define BYTE 1024
> +
>  IGT_TEST_DESCRIPTION("Tests the i915 module loading.");
>
>  static void store_all(int i915)
> @@ -236,6 +241,48 @@ hda_dynamic_debug(bool enable)
>         fclose(fp);
>  }
>
> +static uint32_t  driver_load_unload(uint32_t lmem_bar_size, bool check_support)

driver_load_with_lmem_bar_size(size_mb, check_support)

?

> +{
> +       struct drm_i915_query_memory_regions *regions;
> +       struct drm_i915_memory_region_info *region;
> +       int i915 = -1;
> +       char lmem_bar[64];
> +
> +       igt_i915_driver_unload();
> +       if (lmem_bar_size == 0)
> +               igt_assert_eq(igt_i915_driver_load(NULL), 0);
> +       else {
> +               sprintf(lmem_bar, "lmem_bar_size=%u", lmem_bar_size);
> +               igt_assert_eq(igt_i915_driver_load(lmem_bar), 0);
> +       }
> +
> +       i915 = __drm_open_driver(DRIVER_INTEL);
> +       igt_require_fd(i915);
> +       igt_require_gem(i915);
> +       igt_require(gem_has_lmem(i915));
> +
> +       if (check_support) {
> +               char *tmp;
> +
> +               tmp = __igt_params_get(i915, "lmem_bar_size");
> +               if (!tmp)
> +                       igt_skip("lmem_bar_size modparam not supported on this kernel."
> +                                       "Skipping the test.");

We don't normally split long lines if it's just a string.

> +               free(tmp);
> +       }
> +
> +       regions = gem_get_query_memory_regions(i915);
> +       igt_require(regions);
> +
> +       for (unsigned int i = 0; i < (regions)->num_regions; i++)
> +               for_each_if(((region) = &(regions)->regions[i])->region.memory_class ==
> +                               I915_MEMORY_CLASS_DEVICE)

I guess we need to add a skip here if the cpu_size is zero, which
would indicate an older kernel?

Also for_each_memory_region() is a lot nicer here.

You just need: https://patchwork.freedesktop.org/patch/490396/?series=104368&rev=2

> +                       lmem_bar_size = (region->rsvd1[0] >> BAR_SIZE_SHIFT);

It's a bit unclear how lmem_bar_size would work on multi-tile,
assuming we even care. One of the tiles would have
probed_cpu_visible_size = 0, which likely leads to failing to load the
module, since I assume we always require at least some amount of
per-tile lmem that can be accessed by the CPU during initialization. I
think for now make the test skip if we detect more than a single lmem
instance?

> +       close(i915);
> +
> +       return lmem_bar_size;
> +}
> +
>  igt_main
>  {
>         igt_describe("Verify the basic functionality of i915 driver after it's reloaded.");
> @@ -285,6 +332,48 @@ igt_main
>
>                 /* inject_fault() leaves the module unloaded */
>         }
> +       igt_subtest("resize-bar") {
> +               uint32_t result_bar_size;
> +               uint32_t lmem_bar_size;
> +               int i915 = -1;
> +
> +               if (igt_kmod_is_loaded("i915")) {
> +                       i915 = __drm_open_driver(DRIVER_INTEL);
> +                       igt_require_fd(i915);
> +                       igt_require_gem(i915);
> +                       igt_require(gem_has_lmem(i915));
> +                       close(i915);
> +               }
> +
> +               /* Test for lmem_bar_size modparam support */
> +               lmem_bar_size = driver_load_unload(MIN_BAR_SIZE, true);
> +               igt_assert_eq(lmem_bar_size, MIN_BAR_SIZE);
> +
> +               lmem_bar_size = driver_load_unload(0, false);
> +
> +               lmem_bar_size = ceil((float)(lmem_bar_size)/BYTE)*BYTE;

Shouldn't this be rounddown_pow_of_two() ?

> +
> +               igt_skip_on_f(lmem_bar_size == MIN_BAR_SIZE, "Bar is already set to minimum size.");
> +
> +               while (lmem_bar_size > MIN_BAR_SIZE) {
> +                       lmem_bar_size = lmem_bar_size >> 1;
> +
> +                       result_bar_size = driver_load_unload(lmem_bar_size, false);
> +
> +                       igt_assert_f(lmem_bar_size == result_bar_size, "Bar couldn't be resized.");
> +               }
> +
> +               /* Test with unsupported sizes */
> +               lmem_bar_size = 80;
> +               result_bar_size = driver_load_unload(lmem_bar_size, false);
> +               igt_assert_f(lmem_bar_size != result_bar_size, "Bar resized to unsupported size.");
> +
> +               lmem_bar_size = 16400;
> +               result_bar_size = driver_load_unload(lmem_bar_size, false);
> +               igt_assert_f(lmem_bar_size != result_bar_size, "Bar resized to unsupported size.");
> +
> +               igt_i915_driver_unload();
> +       }
>
>         /* Subtests should unload the module themselves if they use modparams */
>  }
> --
> 2.27.0
>
