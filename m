Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200218144702.1270825-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <5ad6c04e-4dc5-8dfd-fc0f-7a9e68dbd591@intel.com>
Date: Tue, 18 Feb 2020 10:08:13 -0800
MIME-Version: 1.0
In-Reply-To: <20200218144702.1270825-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] lib: Don't specify a
 non-existent blitter ring
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 18/02/20 06:47, Chris Wilson wrote:
> I915_EXEC_BLT only exists on gen6+
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/1256
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Acked-by: Antonio Argenziano <antonio.argenziano@intel.com>

> ---
>   lib/intel_batchbuffer.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 5a00481cf..f1a45b473 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -695,20 +695,13 @@ fill_object(struct drm_i915_gem_exec_object2 *obj, uint32_t gem_handle,
>   
>   static void exec_blit(int fd,
>   		      struct drm_i915_gem_exec_object2 *objs, uint32_t count,
> -		      uint32_t batch_len /* in dwords */)
> +		      int gen)
>   {
> -	struct drm_i915_gem_execbuffer2 exec;
> -
> -	exec.buffers_ptr = to_user_pointer(objs);
> -	exec.buffer_count = count;
> -	exec.batch_start_offset = 0;
> -	exec.batch_len = batch_len * 4;
> -	exec.DR1 = exec.DR4 = 0;
> -	exec.num_cliprects = 0;
> -	exec.cliprects_ptr = 0;
> -	exec.flags = I915_EXEC_BLT;
> -	i915_execbuffer2_set_context_id(exec, 0);
> -	exec.rsvd2 = 0;
> +	struct drm_i915_gem_execbuffer2 exec = {
> +		.buffers_ptr = to_user_pointer(objs),
> +		.buffer_count = count,
> +		.flags = gen >= 6 ? I915_EXEC_BLT : 0,
> +	};
>   
>   	gem_execbuf(fd, &exec);
>   }
> @@ -892,7 +885,7 @@ void igt_blitter_src_copy(int fd,
>   	objs[0].flags |= EXEC_OBJECT_NEEDS_FENCE;
>   	objs[1].flags |= EXEC_OBJECT_NEEDS_FENCE;
>   
> -	exec_blit(fd, objs, 3, ARRAY_SIZE(batch));
> +	exec_blit(fd, objs, 3, gen);
>   
>   	gem_close(fd, batch_handle);
>   }
> @@ -985,7 +978,7 @@ void igt_blitter_fast_copy__raw(int fd,
>   	fill_object(&objs[1], src_handle, NULL, 0);
>   	fill_object(&objs[2], batch_handle, relocs, 2);
>   
> -	exec_blit(fd, objs, 3, ARRAY_SIZE(batch));
> +	exec_blit(fd, objs, 3, intel_gen(intel_get_drm_devid(fd)));
>   
>   	gem_close(fd, batch_handle);
>   }
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
