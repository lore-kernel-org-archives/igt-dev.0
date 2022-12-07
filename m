Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA6210E1A0
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Dec 2022 10:09:01 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 07 Dec 2022 11:08:57 +0100
Message-ID: <1849749.tdWV9SEqCh@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <20221116132921.1509627-1-vikas.srivastava@intel.com>
References: <20221116132921.1509627-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_linear_blits: Added
 XY_FAST_COPY_BLT Command for MTL
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

Hi Vikas,

Please use imperative mode, not simple past, i.e.:

	tests/gem_linear_blits: Use XY_FAST_COPY_BLT on genX+

On Wednesday, 16 November 2022 14:29:21 CET Vikas Srivastava wrote:
> From: Arjun Melkaveri <arjun.melkaveri@intel.com>
> 
> Extend New copy commands for MTL.Tests were failing
> due to legacy command which is not supported on MTL
> 
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Please always add your S-o-b when submitting patches from other authors.

> 
> ---
>  tests/i915/gem_linear_blits.c | 66 ++++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 25 deletions(-)
> 
> diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
> index d02751be..75f389e7 100644
> --- a/tests/i915/gem_linear_blits.c
> +++ b/tests/i915/gem_linear_blits.c
> @@ -68,6 +68,7 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, 
uint32_t src,
>  	struct drm_i915_gem_exec_object2 obj[3];
>  	struct drm_i915_gem_execbuffer2 exec;
>  	int i = 0;
> +	static uint32_t devid;
>  
>  	memset(obj, 0, sizeof(obj));
>  	obj[0].handle = dst;
> @@ -82,31 +83,46 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, 
uint32_t src,
>  			4096, ALIGNMENT);
>  	obj[2].offset = CANONICAL(obj[2].offset);
>  	obj[2].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> -
> -	batch[i++] = XY_SRC_COPY_BLT_CMD |
> -		  XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		  XY_SRC_COPY_BLT_WRITE_RGB;
> -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> -		batch[i - 1] |= 8;
> -	else
> -		batch[i - 1] |= 6;
> -
> -	batch[i++] = (3 << 24) | /* 32 bits */
> -		  (0xcc << 16) | /* copy ROP */
> -		  WIDTH*4;
> -	batch[i++] = 0; /* dst x1,y1 */
> -	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
> -	batch[i++] = obj[0].offset;
> -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> -		batch[i++] = obj[0].offset >> 32;
> -	batch[i++] = 0; /* src x1,y1 */
> -	batch[i++] = WIDTH*4;
> -	batch[i++] = obj[1].offset;
> -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> -		batch[i++] = obj[1].offset >> 32;
> -	batch[i++] = MI_BATCH_BUFFER_END;
> -	batch[i++] = MI_NOOP;
> -
> +	devid = intel_get_drm_devid(fd);
> +
> +	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {

Since there are no 12.60 machines in CI so far, the new processing path is not 
yet exercised, then not verified by pre-merge.  AFAICT, XY_FAST_COPY_BLT is 
supported since gen9.  Is there any reason for not using it in this test on 
some pre-12.60 platforms?

My comments apply as well to your other recent XY_FAST_COPT_BLT related 
submissions.

Thanks,
Janusz


> +		batch[i++] = XY_FAST_COPY_BLT;
> +		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
> +		batch[i++] = 0;/* dst x1,y1 */
> +		batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
> +		batch[i++] = obj[0].offset;       /* dst address lower 
bits */
> +		batch[i++] = obj[0].offset >> 32; /* dst address upper 
bits */
> +		batch[i++] = 0;/* src x1,y1 */
> +		batch[i++] = WIDTH*4;/* src pitch */
> +		batch[i++] = obj[1].offset;       /* src address lower 
bits */
> +		batch[i++] = obj[1].offset >> 32; /* src address upper 
bits */
> +		batch[i++] = MI_BATCH_BUFFER_END;
> +		batch[i++] = MI_NOOP;
> +	} else {
> +		batch[i++] = XY_SRC_COPY_BLT_CMD |
> +				XY_SRC_COPY_BLT_WRITE_ALPHA |
> +				XY_SRC_COPY_BLT_WRITE_RGB;
> +		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> +				batch[i - 1] |= 8;
> +		else
> +				batch[i - 1] |= 6;
> +
> +		batch[i++] = (3 << 24) | /* 32 bits */
> +				(0xcc << 16) | /* copy ROP */
> +				WIDTH*4;
> +		batch[i++] = 0; /* dst x1,y1 */
> +		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
> +		batch[i++] = obj[0].offset;
> +		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> +				batch[i++] = obj[0].offset >> 32;
> +		batch[i++] = 0; /* src x1,y1 */
> +		batch[i++] = WIDTH*4;
> +		batch[i++] = obj[1].offset;
> +		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> +				batch[i++] = obj[1].offset >> 32;
> +		batch[i++] = MI_BATCH_BUFFER_END;
> +		batch[i++] = MI_NOOP;
> +}
>  	gem_write(fd, obj[2].handle, 0, batch, i * sizeof(batch[0]));
>  
>  	memset(reloc, 0, sizeof(reloc));
> 



