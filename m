Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF7010E4F7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 May 2023 15:24:07 +0000 (UTC)
Message-ID: <4847fc00-3b1c-0043-eaa5-494c25bcf603@intel.com>
Date: Thu, 11 May 2023 17:23:47 +0200
From: "Das, Nirmoy" <nirmoy.das@intel.com>
To: <igt-dev@lists.freedesktop.org>
References: <20230511143431.19215-1-nirmoy.das@intel.com>
Content-Language: en-US
In-Reply-To: <20230511143431.19215-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH igt-dii-client] test/prime_vgem: Remove
 test_userptr test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Please ignore this, a patch with wrong tag.

On 5/11/2023 4:34 PM, Nirmoy Das wrote:
> vgem objects are flagged with VM_PFNMAP which
> doesn't work with get_user_pages which is needed
> for userptr test.
>
> References: https://patchwork.freedesktop.org/patch/449741/
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/prime_vgem.c | 49 ----------------------------------------------
>   1 file changed, 49 deletions(-)
>
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 9aa767c9cd..dcf9e78d4b 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -294,51 +294,6 @@ static void test_write(int vgem, int i915)
>   	munmap(ptr, scratch.size);
>   }
>   
> -static bool has_userptr(int i915)
> -{
> -	uint32_t handle = 0;
> -	void *ptr;
> -
> -	igt_assert(posix_memalign(&ptr, 4096, 4096) == 0);
> -	if (__gem_userptr(i915, ptr, 4096, 0, 0, &handle) == 0)
> -		gem_close(i915, handle);
> -	free(ptr);
> -
> -	return handle;
> -}
> -
> -static void test_userptr(int vgem, int i915)
> -{
> -	struct drm_i915_gem_exec_object2 obj = {};
> -	struct drm_i915_gem_execbuffer2 execbuf = {
> -		.buffers_ptr = to_user_pointer(&obj),
> -		.buffer_count = 1,
> -	};
> -	struct vgem_bo scratch;
> -	uint32_t *ptr;
> -
> -	igt_require(has_userptr(i915));
> -
> -	scratch.width = 1024;
> -	scratch.height = 1024;
> -	scratch.bpp = 32;
> -	vgem_create(vgem, &scratch);
> -
> -	/* vgem is acting as a simple provider of a single vma backed by pages */
> -	ptr = vgem_mmap(vgem, &scratch, PROT_WRITE);
> -	gem_close(vgem, scratch.handle);
> -	*ptr = MI_BATCH_BUFFER_END;
> -
> -	gem_userptr(i915, ptr, scratch.size, 0, 0, &obj.handle);
> -	if (igt_has_set_caching(intel_get_drm_devid(i915)))
> -		gem_set_caching(i915, obj.handle, I915_CACHING_NONE); /* for !llc exec */
> -
> -	gem_execbuf(i915, &execbuf);
> -	gem_close(i915, obj.handle);
> -
> -	munmap(ptr, scratch.size);
> -}
> -
>   static void test_gtt(int vgem, int i915)
>   {
>   	struct vgem_bo scratch;
> @@ -1141,10 +1096,6 @@ igt_main
>   	igt_subtest("basic-write")
>   		test_write(vgem, i915);
>   
> -	igt_describe("Check that we wrap the vgem mmap with userptr.");
> -	igt_subtest("basic-userptr")
> -		test_userptr(vgem, i915);
> -
>   	igt_describe("Examine access path through GTT.");
>   	igt_subtest("basic-gtt") {
>   		gem_require_mappable_ggtt(i915);
