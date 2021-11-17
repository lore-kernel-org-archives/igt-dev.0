Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7348A6E54C
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Nov 2021 07:11:37 +0000 (UTC)
Date: Wed, 17 Nov 2021 08:11:33 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211117071133.GA3385@zkempczy-mobl2>
References: <20211116111945.12577-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116111945.12577-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/1] tests/gem_blits: Add no-reloc
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

On Tue, Nov 16, 2021 at 12:19:45PM +0100, Kamil Konieczny wrote:
> Add no-relocation mode for GPU gens without relocations. In WC
> mode on discrete dg1 we need to use device_coherent mmap. Also
> while at this, change var name from has_64b_relocs to
> has_64b_addresses, as it is related to offset size in both modes.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> ---
> v2: Address Zbyszek Kempczynski review: removed has_relocs as it
>   is sufficient to test if ahnd variable is non-zero, removed if-s
>   blocks around relocations to make patch smaller for review.
> ---
>  tests/i915/gem_blits.c | 112 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 88 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index 21dcee68..1a8c1989 100644
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
> @@ -143,7 +146,7 @@ static void buffer_set_tiling(const struct device *device,
>  	struct drm_i915_gem_exec_object2 obj[3];
>  	struct drm_i915_gem_relocation_entry reloc[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
> -	const bool has_64b_reloc = device->gen >= 8;
> +	const bool has_64b_addresses = device->gen >= 8;

Unnecessary change, adds noise to the change.

>  	uint32_t stride, size, pitch;
>  	uint32_t *batch;
>  	int i;
> @@ -160,20 +163,35 @@ static void buffer_set_tiling(const struct device *device,
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
> +	obj[0].flags |= EXEC_OBJECT_WRITE;

Move to conditional below. Let relocation part will take care for setting
this flag in the kernel.

> +	if (device->ahnd) {
> +		obj[0].flags |= EXEC_OBJECT_PINNED;
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
> @@ -199,7 +217,7 @@ static void buffer_set_tiling(const struct device *device,
>  		batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
>  	if (device->gen >= 4 && tiling)
>  		batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
> -	batch[i++] |= 6 + 2 * has_64b_reloc;
> +	batch[i++] |= 6 + 2 * has_64b_addresses;
>  
>  	pitch = stride;
>  	if (device->gen >= 4 && tiling)
> @@ -213,7 +231,7 @@ static void buffer_set_tiling(const struct device *device,
>  	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
>  	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
>  	batch[i++] = obj[0].offset;
> -	if (has_64b_reloc)
> +	if (has_64b_addresses)
>  		batch[i++] = obj[0].offset >> 32;
>  
>  	batch[i++] = 0;
> @@ -226,7 +244,7 @@ static void buffer_set_tiling(const struct device *device,
>  	reloc[1].offset = sizeof(*batch) * i;
>  	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
>  	batch[i++] = obj[1].offset;
> -	if (has_64b_reloc)
> +	if (has_64b_addresses)
>  		batch[i++] = obj[1].offset >> 32;
>  
>  	if ((tiling | buffer->tiling) >= I915_TILING_Y) {
> @@ -247,6 +265,9 @@ static void buffer_set_tiling(const struct device *device,
>  	gem_execbuf(device->fd, &execbuf);
>  
>  	gem_close(device->fd, obj[2].handle);
> +	if (device->ahnd)
> +		put_offset(device->ahnd, obj[2].offset);

Remove conditional - check put_offset() implementation.

> +
>  	gem_close(device->fd, obj[1].handle);
>  
>  	buffer->gtt_offset = obj[0].offset;
> @@ -277,7 +298,7 @@ static bool blit_to_linear(const struct device *device,
>  	struct drm_i915_gem_exec_object2 obj[3];
>  	struct drm_i915_gem_relocation_entry reloc[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
> -	const bool has_64b_reloc = device->gen >= 8;
> +	const bool has_64b_addresses = device->gen >= 8;
>  	uint32_t *batch;
>  	uint32_t pitch;
>  	int i = 0;
> @@ -292,19 +313,34 @@ static bool blit_to_linear(const struct device *device,
>  	execbuf.buffer_count = ARRAY_SIZE(obj);
>  	if (device->gen >= 6)
>  		execbuf.flags = I915_EXEC_BLT;
> +	if (device->ahnd)
> +		execbuf.flags |= I915_EXEC_NO_RELOC;
>  
>  	memset(obj, 0, sizeof(obj));
>  	if (__gem_userptr(device->fd, linear, buffer->size, 0, 0, &obj[0].handle))
>  		return false;
> +	obj[0].flags |= EXEC_OBJECT_WRITE;

Same as above, move to conditional.

> +	if (device->ahnd) {
> +		obj[0].flags |= EXEC_OBJECT_PINNED;
> +		obj[0].offset = get_offset(device->ahnd, obj[0].handle, buffer->size, 0);
> +	}
>  
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
> @@ -324,7 +360,7 @@ static bool blit_to_linear(const struct device *device,
>  		    XY_SRC_COPY_BLT_WRITE_RGB);
>  	if (device->gen >= 4 && buffer->tiling)
>  		batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> -	batch[i++] |= 6 + 2 * has_64b_reloc;
> +	batch[i++] |= 6 + 2 * has_64b_addresses;
>  
>  	batch[i++] = 3 << 24 | 0xcc << 16 | buffer->stride;
>  	batch[i++] = 0;
> @@ -335,7 +371,7 @@ static bool blit_to_linear(const struct device *device,
>  	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
>  	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
>  	batch[i++] = obj[0].offset;
> -	if (has_64b_reloc)
> +	if (has_64b_addresses)
>  		batch[i++] = obj[0].offset >> 32;
>  
>  	batch[i++] = 0;
> @@ -348,7 +384,7 @@ static bool blit_to_linear(const struct device *device,
>  	reloc[1].offset = sizeof(*batch) * i;
>  	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
>  	batch[i++] = obj[1].offset;
> -	if (has_64b_reloc)
> +	if (has_64b_addresses)
>  		batch[i++] = obj[1].offset >> 32;
>  
>  	if (buffer->tiling >= I915_TILING_Y) {
> @@ -368,6 +404,8 @@ static bool blit_to_linear(const struct device *device,
>  
>  	gem_execbuf(device->fd, &execbuf);
>  	gem_close(device->fd, obj[2].handle);
> +	if (device->ahnd)
> +		put_offset(device->ahnd, obj[2].offset);

Remove conditional.

>  
>  	gem_sync(device->fd, obj[0].handle);
>  	gem_close(device->fd, obj[0].handle);
> @@ -399,7 +437,8 @@ static void *download(const struct device *device,
>  		break;
>  
>  	case WC:
> -		if (!gem_mmap__has_wc(device->fd) || buffer->tiling)
> +		if (!(gem_mmap__has_wc(device->fd) || gem_mmap__has_device_coherent(device->fd))
> +		    || buffer->tiling)
>  			mode = GTT;
>  		break;
>  
> @@ -425,9 +464,12 @@ static void *download(const struct device *device,
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
> @@ -490,6 +532,8 @@ static void buffer_free(const struct device *device, struct buffer *buffer)
>  {
>  	igt_assert(buffer_check(device, buffer, GTT));
>  	gem_close(device->fd, buffer->handle);
> +	if (device->ahnd)
> +		put_offset(device->ahnd, buffer->gtt_offset);

Remove conditional.

>  	free(buffer);
>  }
>  
> @@ -557,7 +601,7 @@ blit(const struct device *device,
>  	struct drm_i915_gem_exec_object2 obj[3];
>  	struct drm_i915_gem_relocation_entry reloc[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
> -	const bool has_64b_reloc = device->gen >= 8;
> +	const bool has_64b_addresses = device->gen >= 8;
>  	uint32_t *batch;
>  	uint32_t pitch;
>  	int i = 0;
> @@ -604,22 +648,34 @@ blit(const struct device *device,
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
> +	obj[0].flags |= EXEC_OBJECT_WRITE;

Same as above regarding marking for write.

> +	if (device->ahnd)
> +		obj[0].flags |= EXEC_OBJECT_PINNED;
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
> @@ -643,7 +699,7 @@ blit(const struct device *device,
>  		batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
>  	if (device->gen >= 4 && dst->tiling)
>  		batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
> -	batch[i++] |= 6 + 2 * has_64b_reloc;
> +	batch[i++] |= 6 + 2 * has_64b_addresses;
>  
>  	pitch = dst->stride;
>  	if (device->gen >= 4 && dst->tiling)
> @@ -658,7 +714,7 @@ blit(const struct device *device,
>  	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
>  	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
>  	batch[i++] = obj[0].offset;
> -	if (has_64b_reloc)
> +	if (has_64b_addresses)
>  		batch[i++] = obj[0].offset >> 32;
>  
>  	batch[i++] = src_y << 16 | src_x;
> @@ -671,7 +727,7 @@ blit(const struct device *device,
>  	reloc[1].offset = sizeof(*batch) * i;
>  	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
>  	batch[i++] = obj[1].offset;
> -	if (has_64b_reloc)
> +	if (has_64b_addresses)
>  		batch[i++] = obj[1].offset >> 32;
>  
>  	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
> @@ -691,6 +747,8 @@ blit(const struct device *device,
>  
>  	gem_execbuf(device->fd, &execbuf);
>  	gem_close(device->fd, obj[2].handle);
> +	if (device->ahnd)
> +		put_offset(device->ahnd, obj[2].offset);

Remove conditional.

>  
>  	dst->gtt_offset = obj[0].offset;
>  	src->gtt_offset = obj[1].offset;
> @@ -733,6 +791,7 @@ igt_main
>  		device.pciid = intel_get_drm_devid(device.fd);
>  		device.gen = intel_gen(device.pciid);
>  		device.llc = gem_has_llc(device.fd);
> +		device.ahnd = get_reloc_ahnd(device.fd, 0);
>  	}
>  
>  	igt_subtest("basic") {
> @@ -794,4 +853,9 @@ igt_main
>  			}
>  		}
>  	}
> +
> +	igt_fixture {
> +		if (device.ahnd)
> +			put_ahnd(device.ahnd);

Remove conditional - put_ahnd() is checking allocator handle
argument.

--
Zbigniew

> +	}
>  }
> -- 
> 2.32.0
> 
