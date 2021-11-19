Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C656EC4E
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Nov 2021 03:48:02 +0000 (UTC)
Date: Fri, 19 Nov 2021 04:47:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211119034757.GA3698@zkempczy-mobl2>
References: <20211118111652.10584-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211118111652.10584-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/1] tests/gem_blits: Add no-reloc
 capability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 12:16:52PM +0100, Kamil Konieczny wrote:
> Add no-relocation mode for GPU gens without relocations. In WC
> mode on discrete dg1 we need to use device_coherent mmap.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> ---
> v4: add put_offset for balancing get_offset, rewrite version
>     history (Zbigniew)
> v3: set EXEC_OBJECT_WRITE for no-reloc path only (Zbigniew)
> v2: remove unnecessary variable rename and use allocator handle
>     as conditional to diverge reloc and no-reloc paths (Zbigniew)
> ---
>  tests/i915/gem_blits.c | 83 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 71 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index 21dcee68..46f157b9 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -38,6 +38,7 @@ struct device {
>  	int gen;
>  	int pciid;
>  	int llc;
> +	uint64_t ahnd; /* ahnd != 0 if no-relocs */
>  };
>  
>  struct buffer {
> @@ -119,8 +120,10 @@ static struct buffer *buffer_create(const struct device *device,
>  	buffer->size = ALIGN(buffer->stride * height, 4096);
>  	buffer->handle = gem_create(device->fd, buffer->size);
>  	buffer->caching = device->llc;
> -
> -	buffer->gtt_offset = buffer->handle * buffer->size;
> +	if (device->ahnd)
> +		buffer->gtt_offset = get_offset(device->ahnd, buffer->handle, buffer->size, 0);
> +	else
> +		buffer->gtt_offset = buffer->handle * buffer->size;
>  
>  	for (int y = 0; y < height; y++) {
>  		uint32_t *row = buffer->model + y * width;
> @@ -160,20 +163,34 @@ static void buffer_set_tiling(const struct device *device,
>  	execbuf.buffer_count = ARRAY_SIZE(obj);
>  	if (device->gen >= 6)
>  		execbuf.flags = I915_EXEC_BLT;
> +	if (device->ahnd)
> +		execbuf.flags |= I915_EXEC_NO_RELOC;
>  
>  	memset(obj, 0, sizeof(obj));
>  	obj[0].handle = gem_create(device->fd, size);
>  	if (__gem_set_tiling(device->fd, obj[0].handle, tiling, stride) == 0)
>  		obj[0].flags = EXEC_OBJECT_NEEDS_FENCE;
> +	if (device->ahnd) {
> +		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> +		obj[0].offset = get_offset(device->ahnd, obj[0].handle, size, 0);
> +	}
>  
>  	obj[1].handle = buffer->handle;
>  	obj[1].offset = buffer->gtt_offset;
>  	if (buffer->fenced)
>  		obj[1].flags = EXEC_OBJECT_NEEDS_FENCE;
> +	if (device->ahnd)
> +		obj[1].flags |= EXEC_OBJECT_PINNED;
>  
>  	obj[2].handle = gem_create(device->fd, 4096);
> -	obj[2].relocs_ptr = to_user_pointer(memset(reloc, 0, sizeof(reloc)));
> -	obj[2].relocation_count = 2;
> +	if (device->ahnd) {
> +		obj[2].offset = get_offset(device->ahnd, obj[2].handle, 4096, 0);
> +		obj[2].flags |= EXEC_OBJECT_PINNED;
> +	} else {
> +		obj[2].relocs_ptr = to_user_pointer(memset(reloc, 0, sizeof(reloc)));
> +		obj[2].relocation_count = 2;
> +	}
> +
>  	batch = gem_mmap__cpu(device->fd, obj[2].handle, 0, 4096, PROT_WRITE);
>  
>  	i = 0;
> @@ -247,8 +264,11 @@ static void buffer_set_tiling(const struct device *device,
>  	gem_execbuf(device->fd, &execbuf);
>  
>  	gem_close(device->fd, obj[2].handle);
> +	put_offset(device->ahnd, obj[2].offset);
> +
>  	gem_close(device->fd, obj[1].handle);
>  
> +	put_offset(device->ahnd, buffer->gtt_offset);
>  	buffer->gtt_offset = obj[0].offset;
>  	buffer->handle = obj[0].handle;
>  
> @@ -292,19 +312,34 @@ static bool blit_to_linear(const struct device *device,
>  	execbuf.buffer_count = ARRAY_SIZE(obj);
>  	if (device->gen >= 6)
>  		execbuf.flags = I915_EXEC_BLT;
> +	if (device->ahnd)
> +		execbuf.flags |= I915_EXEC_NO_RELOC;
>  
>  	memset(obj, 0, sizeof(obj));
>  	if (__gem_userptr(device->fd, linear, buffer->size, 0, 0, &obj[0].handle))
>  		return false;
>  
> +	if (device->ahnd) {
> +		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> +		obj[0].offset = get_offset(device->ahnd, obj[0].handle, buffer->size, 0);
> +	}
> +
>  	obj[1].handle = buffer->handle;
>  	obj[1].offset = buffer->gtt_offset;
>  	obj[1].flags = EXEC_OBJECT_NEEDS_FENCE;
> +	if (device->ahnd)
> +		obj[1].flags |= EXEC_OBJECT_PINNED;
>  
>  	memset(reloc, 0, sizeof(reloc));
>  	obj[2].handle = gem_create(device->fd, 4096);
> -	obj[2].relocs_ptr = to_user_pointer(reloc);
> -	obj[2].relocation_count = ARRAY_SIZE(reloc);
> +	if (device->ahnd) {
> +		obj[2].flags |= EXEC_OBJECT_PINNED;
> +		obj[2].offset = get_offset(device->ahnd, obj[2].handle, 4096, 0);
> +	} else {
> +		obj[2].relocs_ptr = to_user_pointer(reloc);
> +		obj[2].relocation_count = ARRAY_SIZE(reloc);
> +	}
> +
>  	batch = gem_mmap__cpu(device->fd, obj[2].handle, 0, 4096, PROT_WRITE);
>  
>  	if (buffer->tiling >= I915_TILING_Y) {
> @@ -368,9 +403,11 @@ static bool blit_to_linear(const struct device *device,
>  
>  	gem_execbuf(device->fd, &execbuf);
>  	gem_close(device->fd, obj[2].handle);
> +	put_offset(device->ahnd, obj[2].offset);
>  
>  	gem_sync(device->fd, obj[0].handle);
>  	gem_close(device->fd, obj[0].handle);
> +	put_offset(device->ahnd, obj[0].offset);
>  
>  	return true;
>  }
> @@ -399,7 +436,8 @@ static void *download(const struct device *device,
>  		break;
>  
>  	case WC:
> -		if (!gem_mmap__has_wc(device->fd) || buffer->tiling)
> +		if (!(gem_mmap__has_wc(device->fd) || gem_mmap__has_device_coherent(device->fd))
> +		    || buffer->tiling)
>  			mode = GTT;
>  		break;
>  
> @@ -425,9 +463,12 @@ static void *download(const struct device *device,
>  		break;
>  
>  	case WC:
> -		src = gem_mmap__wc(device->fd, buffer->handle,
> -				   0, buffer->size,
> -				   PROT_READ);
> +		src = __gem_mmap__wc(device->fd, buffer->handle,
> +				     0, buffer->size,
> +				     PROT_READ);
> +		if (!src)
> +			src = gem_mmap__device_coherent(device->fd, buffer->handle, 0,
> +							buffer->size, PROT_READ);
>  
>  		gem_set_domain(device->fd, buffer->handle,
>  			       I915_GEM_DOMAIN_WC, 0);
> @@ -490,6 +531,7 @@ static void buffer_free(const struct device *device, struct buffer *buffer)
>  {
>  	igt_assert(buffer_check(device, buffer, GTT));
>  	gem_close(device->fd, buffer->handle);
> +	put_offset(device->ahnd, buffer->gtt_offset);
>  	free(buffer);
>  }
>  
> @@ -604,22 +646,33 @@ blit(const struct device *device,
>  	execbuf.buffer_count = ARRAY_SIZE(obj);
>  	if (device->gen >= 6)
>  		execbuf.flags = I915_EXEC_BLT;
> +	if (device->ahnd)
> +		execbuf.flags |= I915_EXEC_NO_RELOC;
>  
>  	memset(obj, 0, sizeof(obj));
>  	obj[0].handle = dst->handle;
>  	obj[0].offset = dst->gtt_offset;
>  	if (dst->tiling)
>  		obj[0].flags = EXEC_OBJECT_NEEDS_FENCE;
> +	if (device->ahnd)
> +		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
>  
>  	obj[1].handle = src->handle;
>  	obj[1].offset = src->gtt_offset;
>  	if (src->tiling)
>  		obj[1].flags = EXEC_OBJECT_NEEDS_FENCE;
> +	if (device->ahnd)
> +		obj[1].flags |= EXEC_OBJECT_PINNED;
>  
>  	memset(reloc, 0, sizeof(reloc));
>  	obj[2].handle = gem_create(device->fd, 4096);
> -	obj[2].relocs_ptr = to_user_pointer(reloc);
> -	obj[2].relocation_count = ARRAY_SIZE(reloc);
> +	if (device->ahnd) {
> +		obj[2].offset = get_offset(device->ahnd, obj[2].handle, 4096, 0);
> +		obj[2].flags |= EXEC_OBJECT_PINNED;
> +	} else {
> +		obj[2].relocs_ptr = to_user_pointer(reloc);
> +		obj[2].relocation_count = ARRAY_SIZE(reloc);
> +	}
>  	batch = gem_mmap__cpu(device->fd, obj[2].handle, 0, 4096, PROT_WRITE);
>  
>  	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
> @@ -691,6 +744,7 @@ blit(const struct device *device,
>  
>  	gem_execbuf(device->fd, &execbuf);
>  	gem_close(device->fd, obj[2].handle);
> +	put_offset(device->ahnd, obj[2].offset);
>  
>  	dst->gtt_offset = obj[0].offset;
>  	src->gtt_offset = obj[1].offset;
> @@ -733,6 +787,7 @@ igt_main
>  		device.pciid = intel_get_drm_devid(device.fd);
>  		device.gen = intel_gen(device.pciid);
>  		device.llc = gem_has_llc(device.fd);
> +		device.ahnd = get_reloc_ahnd(device.fd, 0);
>  	}
>  
>  	igt_subtest("basic") {
> @@ -794,4 +849,8 @@ igt_main
>  			}
>  		}
>  	}
> +
> +	igt_fixture {
> +		put_ahnd(device.ahnd);
> +	}
>  }
> -- 
> 2.32.0
>

Ok, LGTM now:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
