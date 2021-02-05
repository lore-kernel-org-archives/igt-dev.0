Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7736E878
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Feb 2021 09:53:53 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210205090743.8464-1-ramalingam.c@intel.com>
References: <20210205090743.8464-1-ramalingam.c@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 05 Feb 2021 09:53:49 +0000
Message-ID: <161251882970.15583.5136301173713188659@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_module_load: obj size based
 on the engine count
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
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ramalingam C (2021-02-05 09:07:43)
> Calculate obj size for the sanity check of module reload
> based on the engines count.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> CC: Chris wilson <chris.p.wilson@intel.com>

Oh dear, I've seen a few more things that got lost in translation.

> ---
>  tests/i915/i915_module_load.c | 37 +++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index 06522ba6191b..00494bcb3480 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -46,7 +46,7 @@ static void store_all(int fd)
>         struct drm_i915_gem_relocation_entry reloc[2 * ARRAY_SIZE(engines)];
>         struct drm_i915_gem_execbuffer2 execbuf;
>         const struct intel_execution_engine2 *e;
> -       uint32_t batch[16];
> +       uint32_t batch[16], obj_size;
>         uint64_t offset;
>         unsigned nengine;
>         int value;
> @@ -56,10 +56,19 @@ static void store_all(int fd)
>         execbuf.buffers_ptr = (uintptr_t)obj;
>         execbuf.buffer_count = 2;
>  
> +       nengine = 0;
> +       __for_each_physical_engine(fd, e) {
> +               if (!gem_class_can_store_dword(fd, e->class))
> +                       continue;
> +               nengine++;
> +       }
> +
> +       obj_size = 2 * (nengine + 1) *sizeof(batch);
> +
>         memset(reloc, 0, sizeof(reloc));
>         memset(obj, 0, sizeof(obj));
> -       obj[0].handle = gem_create(fd, 4096);
> -       obj[1].handle = gem_create(fd, 4096);
> +       obj[0].handle = gem_create(fd, obj_size);

obj[0] needs only 4 * nengine
obj[1] indeed needs batch_size * nengine;

> +       obj[1].handle = gem_create(fd, obj_size);
>         obj[1].relocation_count = 1;
>  
>         offset = sizeof(uint32_t);
> @@ -79,24 +88,22 @@ static void store_all(int fd)
>         batch[value = ++i] = 0xc0ffee;
>         batch[++i] = MI_BATCH_BUFFER_END;
>  
> -       nengine = 0;
> +       i = 0;
>         intel_detect_and_clear_missed_interrupts(fd);
>         __for_each_physical_engine(fd, e) {
>                 if (!gem_class_can_store_dword(fd, e->class))
>                         continue;
>  
> -               igt_assert(2 * (nengine + 1) * sizeof(batch) <= 4096);
> -
> -               engines[nengine] = e->flags;
> +               engines[i] = e->flags;
>                 if (gen < 6)
> -                       engines[nengine] |= I915_EXEC_SECURE;
> -               execbuf.flags = engines[nengine];
> +                       engines[i] |= I915_EXEC_SECURE;
> +               execbuf.flags = engines[i];
>  
> -               j = 2*nengine;
> +               j = 2*i;
>                 reloc[j].target_handle = obj[0].handle;
>                 reloc[j].presumed_offset = ~0;
>                 reloc[j].offset = j*sizeof(batch) + offset;
> -               reloc[j].delta = nengine*sizeof(uint32_t);
> +               reloc[j].delta = i*sizeof(uint32_t);
>                 reloc[j].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
>                 reloc[j].write_domain = I915_GEM_DOMAIN_INSTRUCTION;

This should be (RENDER, RENDER)

INSTRUCTION, INSTRUCTION is special setting for a gen6 pipecontrol w/a
We don't want to confuse things for a basic liveness check.

>                 obj[1].relocs_ptr = (uintptr_t)&reloc[j];
> @@ -107,22 +114,22 @@ static void store_all(int fd)
>                 execbuf.batch_start_offset = j*sizeof(batch);
>                 gem_execbuf(fd, &execbuf);
>  
> -               j = 2*nengine + 1;
> +               j = 2*i + 1;
>                 reloc[j].target_handle = obj[0].handle;
>                 reloc[j].presumed_offset = ~0;
>                 reloc[j].offset = j*sizeof(batch) + offset;
> -               reloc[j].delta = nengine*sizeof(uint32_t);
> +               reloc[j].delta = i*sizeof(uint32_t);
>                 reloc[j].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
>                 reloc[j].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
>                 obj[1].relocs_ptr = (uintptr_t)&reloc[j];

And we only need one batch, halving the amount of work we have to do.
>  
> -               batch[value] = nengine;
> +               batch[value] = i;

Just set the first batch to emit batch[value] = i
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
