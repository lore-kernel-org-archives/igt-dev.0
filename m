Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E088189F24
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 07:09:18 +0000 (UTC)
Date: Tue, 10 Aug 2021 09:09:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210810070912.GA10247@zkempczy-mobl2>
References: <20210809132026.8692-1-andrzej.turko@linux.intel.com>
 <20210809132026.8692-2-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210809132026.8692-2-andrzej.turko@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_streaming_writes:
 Support gens without relocations
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 09, 2021 at 03:20:25PM +0200, Andrzej Turko wrote:
> Use softpin to completely avoid relocations on generations
> which do not support them.
> 
> Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_streaming_writes.c | 109 +++++++++++++++++-------------
>  1 file changed, 62 insertions(+), 47 deletions(-)
> 
> diff --git a/tests/i915/gem_streaming_writes.c b/tests/i915/gem_streaming_writes.c
> index c104792bd..ce82d8823 100644
> --- a/tests/i915/gem_streaming_writes.c
> +++ b/tests/i915/gem_streaming_writes.c
> @@ -62,7 +62,8 @@ IGT_TEST_DESCRIPTION("Test of streaming writes into active GPU sources");
>  
>  static void test_streaming(int fd, int mode, int sync)
>  {
> -	const int has_64bit_reloc = intel_gen(intel_get_drm_devid(fd)) >= 8;
> +	const bool has_64bit_addr = intel_gen(intel_get_drm_devid(fd)) >= 8;
> +	const bool do_relocs = gem_has_relocations(fd);
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_exec_object2 exec[3];
>  	struct drm_i915_gem_relocation_entry reloc[128];
> @@ -112,30 +113,35 @@ static void test_streaming(int fd, int mode, int sync)
>  	__src_offset = src_offset;
>  	__dst_offset = dst_offset;
>  
> -	memset(reloc, 0, sizeof(reloc));
> -	for (i = 0; i < 64; i++) {
> -		reloc[2*i+0].offset = 64*i + 4 * sizeof(uint32_t);
> -		reloc[2*i+0].delta = 0;
> -		reloc[2*i+0].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? DST : dst;
> -		reloc[2*i+0].presumed_offset = dst_offset;
> -		reloc[2*i+0].read_domains = I915_GEM_DOMAIN_RENDER;
> -		reloc[2*i+0].write_domain = I915_GEM_DOMAIN_RENDER;
> -
> -		reloc[2*i+1].offset = 64*i + 7 * sizeof(uint32_t);
> -		if (has_64bit_reloc)
> -			reloc[2*i+1].offset +=  sizeof(uint32_t);
> -		reloc[2*i+1].delta = 0;
> -		reloc[2*i+1].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? SRC : src;
> -		reloc[2*i+1].presumed_offset = src_offset;
> -		reloc[2*i+1].read_domains = I915_GEM_DOMAIN_RENDER;
> -		reloc[2*i+1].write_domain = 0;
> -	}
>  	gem_execbuf(fd, &execbuf);
>  	igt_assert_eq_u64(__src_offset, src_offset);
>  	igt_assert_eq_u64(__dst_offset, dst_offset);
>  
>  	exec[DST].flags = EXEC_OBJECT_WRITE;
> -	exec[BATCH].relocation_count = 2;
> +	if (do_relocs) {
> +		memset(reloc, 0, sizeof(reloc));
> +		for (i = 0; i < 64; i++) {
> +			reloc[2*i+0].offset = 64*i + 4 * sizeof(uint32_t);
> +			reloc[2*i+0].delta = 0;
> +			reloc[2*i+0].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? DST : dst;
> +			reloc[2*i+0].presumed_offset = dst_offset;
> +			reloc[2*i+0].read_domains = I915_GEM_DOMAIN_RENDER;
> +			reloc[2*i+0].write_domain = I915_GEM_DOMAIN_RENDER;
> +
> +			reloc[2*i+1].offset = 64*i + 7 * sizeof(uint32_t);
> +			if (has_64bit_addr)
> +				reloc[2*i+1].offset +=  sizeof(uint32_t);
> +			reloc[2*i+1].delta = 0;
> +			reloc[2*i+1].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? SRC : src;
> +			reloc[2*i+1].presumed_offset = src_offset;
> +			reloc[2*i+1].read_domains = I915_GEM_DOMAIN_RENDER;
> +			reloc[2*i+1].write_domain = 0;
> +		}
> +		exec[BATCH].relocation_count = 2;
> +	} else {
> +		exec[DST].flags |= EXEC_OBJECT_PINNED;
> +		exec[SRC].flags = EXEC_OBJECT_PINNED;
> +	}
>  	execbuf.buffer_count = 3;
>  	execbuf.flags |= I915_EXEC_NO_RELOC;
>  	if (gem_has_blt(fd))
> @@ -159,19 +165,19 @@ static void test_streaming(int fd, int mode, int sync)
>  			int k = 0;
>  
>  			b[k] = COPY_BLT_CMD | BLT_WRITE_ARGB;
> -			if (has_64bit_reloc)
> +			if (has_64bit_addr)
>  				b[k] += 2;
>  			k++;
>  			b[k++] = 0xcc << 16 | 1 << 25 | 1 << 24 | 4096;
>  			b[k++] = (y << 16) | x;
>  			b[k++] = ((y+1) << 16) | (x + (CHUNK_SIZE >> 2));
>  			b[k++] = dst_offset;
> -			if (has_64bit_reloc)
> +			if (has_64bit_addr)
>  				b[k++] = dst_offset >> 32;
>  			b[k++] = (y << 16) | x;
>  			b[k++] = 4096;
>  			b[k++] = src_offset;
> -			if (has_64bit_reloc)
> +			if (has_64bit_addr)
>  				b[k++] = src_offset >> 32;
>  			b[k++] = MI_BATCH_BUFFER_END;
>  
> @@ -205,7 +211,8 @@ static void test_streaming(int fd, int mode, int sync)
>  
>  			b = offset / CHUNK_SIZE / 64;
>  			n = offset / CHUNK_SIZE % 64;
> -			exec[BATCH].relocs_ptr = to_user_pointer((reloc + 2*n));
> +			if (do_relocs)
> +				exec[BATCH].relocs_ptr = to_user_pointer((reloc + 2*n));
>  			exec[BATCH].handle = batch[b].handle;
>  			exec[BATCH].offset = batch[b].offset;
>  			execbuf.batch_start_offset = 64*n;
> @@ -234,7 +241,8 @@ static void test_streaming(int fd, int mode, int sync)
>  
>  static void test_batch(int fd, int mode, int reverse)
>  {
> -	const int has_64bit_reloc = intel_gen(intel_get_drm_devid(fd)) >= 8;
> +	const bool has_64bit_addr = intel_gen(intel_get_drm_devid(fd)) >= 8;
> +	const bool do_relocs = gem_has_relocations(fd);
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_exec_object2 exec[3];
>  	struct drm_i915_gem_relocation_entry reloc[2];
> @@ -254,26 +262,28 @@ static void test_batch(int fd, int mode, int reverse)
>  
>  	d = gem_mmap__cpu(fd, dst, 0, OBJECT_SIZE, PROT_READ);
>  
> -	memset(reloc, 0, sizeof(reloc));
> -	reloc[0].offset =  4 * sizeof(uint32_t);
> -	reloc[0].delta = 0;
> -	reloc[0].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? DST : dst;
> -	reloc[0].presumed_offset = dst_offset;
> -	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
> -	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
> -
> -	reloc[1].offset = 7 * sizeof(uint32_t);
> -	if (has_64bit_reloc)
> -		reloc[1].offset +=  sizeof(uint32_t);
> -	reloc[1].delta = 0;
> -	reloc[1].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? SRC : src;
> -	reloc[1].presumed_offset = src_offset;
> -	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
> -	reloc[1].write_domain = 0;
> -
> +	if (do_relocs) {
> +		memset(reloc, 0, sizeof(reloc));
> +		reloc[0].offset =  4 * sizeof(uint32_t);
> +		reloc[0].delta = 0;
> +		reloc[0].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? DST : dst;
> +		reloc[0].presumed_offset = dst_offset;
> +		reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
> +		reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
> +
> +		reloc[1].offset = 7 * sizeof(uint32_t);
> +		if (has_64bit_addr)
> +			reloc[1].offset +=  sizeof(uint32_t);
> +		reloc[1].delta = 0;
> +		reloc[1].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? SRC : src;
> +		reloc[1].presumed_offset = src_offset;
> +		reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
> +		reloc[1].write_domain = 0;
> +
> +		exec[BATCH].relocs_ptr = to_user_pointer(reloc);
> +		exec[BATCH].relocation_count = 2;
> +	}
>  	batch_size = ALIGN(OBJECT_SIZE / CHUNK_SIZE * 128, 4096);
> -	exec[BATCH].relocs_ptr = to_user_pointer(reloc);
> -	exec[BATCH].relocation_count = 2;
>  	exec[BATCH].handle = gem_create(fd, batch_size);
>  
>  	switch (mode) {
> @@ -308,8 +318,13 @@ static void test_batch(int fd, int mode, int reverse)
>  	exec[DST].flags = EXEC_OBJECT_WRITE;
>  	/* We assume that the active objects are fixed to avoid relocations */
>  	exec[BATCH].relocation_count = 0;
> +	exec[BATCH].relocs_ptr = 0;
>  	__src_offset = src_offset;
>  	__dst_offset = dst_offset;
> +	if (!do_relocs) {
> +		exec[DST].flags |= EXEC_OBJECT_PINNED;
> +		exec[SRC].flags = EXEC_OBJECT_PINNED;
> +	}
>  
>  	offset = mode ? I915_GEM_DOMAIN_GTT : I915_GEM_DOMAIN_CPU;
>  	gem_set_domain(fd, exec[BATCH].handle, offset, offset);
> @@ -334,19 +349,19 @@ static void test_batch(int fd, int mode, int reverse)
>  			k = execbuf.batch_start_offset / 4;
>  
>  			base[k] = COPY_BLT_CMD | BLT_WRITE_ARGB;
> -			if (has_64bit_reloc)
> +			if (has_64bit_addr)
>  				base[k] += 2;
>  			k++;
>  			base[k++] = 0xcc << 16 | 1 << 25 | 1 << 24 | 4096;
>  			base[k++] = (y << 16) | x;
>  			base[k++] = ((y+1) << 16) | (x + (CHUNK_SIZE >> 2));
>  			base[k++] = dst_offset;
> -			if (has_64bit_reloc)
> +			if (has_64bit_addr)
>  				base[k++] = dst_offset >> 32;
>  			base[k++] = (y << 16) | x;
>  			base[k++] = 4096;
>  			base[k++] = src_offset;
> -			if (has_64bit_reloc)
> +			if (has_64bit_addr)
>  				base[k++] = src_offset >> 32;
>  			base[k++] = MI_BATCH_BUFFER_END;
>  
> -- 
> 2.25.1
>

Code looks ok so it should handle softpin properly. Only check I need to add
before merge is to check mappable aperture - test won't run on discrete due
to lack of gtt mapping. Anyway:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
