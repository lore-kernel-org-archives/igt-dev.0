Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA3B10E3AD
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 09:57:45 +0000 (UTC)
Date: Tue, 29 Nov 2022 10:57:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y4XXkNALElpC55Fz@kamilkon-desk1>
References: <20221116103706.1492876-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221116103706.1492876-1-vikas.srivastava@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib: Remove deprecated interfaces
 from huc_copy for Gen12+ platforms.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

few more nits, see below.

On 2022-11-16 at 16:07:06 +0530, Vikas Srivastava wrote:
> From: "Ye, Tony" <tony.ye@intel.com>
> 
> Stop using relocs and the legacy execbuf flags.
> 
> Signed-off-by: "Ye, Tony" <tony.ye@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> ---
>  lib/huc_copy.c          | 77 +++++++++++++++++++++++++++++++++++++++++
>  lib/huc_copy.h          |  4 +++
>  lib/intel_batchbuffer.c |  8 +++--
>  3 files changed, 87 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/huc_copy.c b/lib/huc_copy.c
> index 6ec68864b..3b011a305 100644
> --- a/lib/huc_copy.c
> +++ b/lib/huc_copy.c
> @@ -26,6 +26,8 @@
>  #include "drmtest.h"
>  #include "huc_copy.h"
>  #include "intel_allocator.h"
> +#include "intel_ctx.h"
> +#include "i915/gem_engine_topology.h"
>  
>  static void
>  gen9_emit_huc_virtual_addr_state(struct drm_i915_gem_exec_object2 *src,
> @@ -123,3 +125,78 @@ gen9_huc_copyfunc(int fd, uint64_t ahnd,
>  
>  	gem_execbuf(fd, &execbuf);
>  }
> +
> +static void
> +gen12_emit_huc_virtual_addr_state(struct drm_i915_gem_exec_object2 *src,
------------------------------------ ^
> +		struct drm_i915_gem_exec_object2 *dst,
--------------- ^
Align to above.

> +		uint32_t *buf,

Same here.

> +		int *i)

Same here.

> +{
> +	buf[(*i)++] = HUC_VIRTUAL_ADDR_STATE;
> +
> +	for (int j = 0; j < HUC_VIRTUAL_ADDR_REGION_NUM; j++) {
> +		if (j == HUC_VIRTUAL_ADDR_REGION_SRC) {
> +			buf[(*i)++] = src->offset;

Add here:
			buf[(*i)++] = upper_32_bits(src->offset);

> +		} else if (j == HUC_VIRTUAL_ADDR_REGION_DST) {
> +			buf[(*i)++] = dst->offset;

Same here.

> +		} else {
> +			buf[(*i)++] = 0;

Add
			buf[(*i)++] = 0;
> +		}

Put newline.

> +		buf[(*i)++] = 0;
--------------- ^
Remove this.

> +		buf[(*i)++] = 0;

btw here are encoded mocs bits starting from bit 1, do we need
this on MTL ? At least for src/dst addresses.

+Cc Zbigniew

Regards,
Kamil

> +	}
> +}
> +
> +void
> +gen12_huc_copyfunc(int fd, uint64_t ahnd,
> +		  struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize)
> +{
> +	struct drm_i915_gem_execbuffer2 execbuf;
> +	int i = 0;
> +	uint32_t buf[63];
> +	const intel_ctx_t *ctx;
> +
> +	/* load huc kernel */
> +	buf[i++] = HUC_IMEM_STATE;
> +	buf[i++] = 0;
> +	buf[i++] = 0;
> +	buf[i++] = 0;
> +	buf[i++] = 0x3;
> +
> +	buf[i++] = MFX_WAIT;
> +	buf[i++] = MFX_WAIT;
> +
> +	buf[i++] = HUC_PIPE_MODE_SELECT;
> +	buf[i++] = 0;
> +	buf[i++] = 0;
> +
> +	buf[i++] = MFX_WAIT;
> +
> +	obj[0].offset = 0x200000;
> +	obj[0].flags |= EXEC_OBJECT_PINNED;
> +	obj[1].offset = 0x400000;
> +	obj[1].flags |= EXEC_OBJECT_PINNED;
> +	obj[1].flags |= EXEC_OBJECT_WRITE;
> +	obj[2].offset = 0x600000;
> +	obj[2].flags |= EXEC_OBJECT_PINNED;
> +	gen12_emit_huc_virtual_addr_state(&obj[0], &obj[1], buf, &i);
> +
> +	buf[i++] = HUC_START;
> +	buf[i++] = 1;
> +
> +	buf[i++] = MI_BATCH_BUFFER_END;
> +
> +	gem_write(fd, obj[2].handle, 0, buf, sizeof(buf));
> +
> +	memset(&execbuf, 0, sizeof(execbuf));
> +	execbuf.buffers_ptr = to_user_pointer(obj);
> +	execbuf.buffer_count = 3;
> +	execbuf.flags = I915_EXEC_DEFAULT;
> +
> +	ctx = intel_ctx_create_for_engine(fd, I915_ENGINE_CLASS_VIDEO, 0);
> +	execbuf.rsvd1 = ctx->id;
> +
> +	gem_execbuf(fd, &execbuf);
> +
> +	intel_ctx_destroy(fd, ctx);
> +}
> diff --git a/lib/huc_copy.h b/lib/huc_copy.h
> index 69d140933..e87e62c9c 100644
> --- a/lib/huc_copy.h
> +++ b/lib/huc_copy.h
> @@ -46,4 +46,8 @@ void
>  gen9_huc_copyfunc(int fd, uint64_t ahnd,
>  		  struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize);
>  
> +void
> +gen12_huc_copyfunc(int fd, uint64_t ahnd,
> +		   struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize);
> +
>  #endif /* HUC_COPY_H */
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 19a1fbe4d..9a855a7f0 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -3066,14 +3066,18 @@ void intel_bb_copy_intel_buf(struct intel_bb *ibb,
>   * Returns:
>   *
>   * The platform-specific huc copy function pointer for the device specified
> - * with @devid. Will return NULL when no media spin function is implemented.
> + * with @devid. Will return NULL when no huc copy function is implemented.
>   */
>  igt_huc_copyfunc_t igt_get_huc_copyfunc(int devid)
>  {
>  	igt_huc_copyfunc_t copy = NULL;
>  
> -	if (IS_GEN12(devid) || IS_GEN11(devid) || IS_GEN9(devid))
> +	if (AT_LEAST_GEN(devid, 12))
> +		copy = gen12_huc_copyfunc;
> +	else if (IS_GEN11(devid) || IS_GEN9(devid))
>  		copy = gen9_huc_copyfunc;
> +	else
> +		copy = NULL;
>  
>  	return copy;
>  }
> -- 
> 2.25.1
> 
