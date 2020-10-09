Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20201008221334.1478509-1-chris@chris-wilson.co.uk>
 <20201008230303.1560301-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <478fbc5e-0d54-8fd9-bf76-a8a431a54148@linux.intel.com>
Date: Fri, 9 Oct 2020 10:38:04 +0100
MIME-Version: 1.0
In-Reply-To: <20201008230303.1560301-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3] prime_vgem: Check that we wrap the
 vgem mmap with userptr
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
Cc: igt-dev@lists.freedesktop.org, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>, "Graunke,
 Kenneth W" <kenneth.w.graunke@intel.com>, "Kondapally,
 Kalyan" <kalyan.kondapally@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 09/10/2020 00:03, Chris Wilson wrote:
> This came up in a discussion about importing virtio dma-buf, which are
> themselves plain shmemfs objects and so not only backed by struct pages,
> but wrappable by userptr. vgem share the same properties and so should
> serve as a useful proxy for testing.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: "Graunke, Kenneth W" <kenneth.w.graunke@intel.com>,
> Cc: "Lahtinen, Joonas" <joonas.lahtinen@intel.com>
> Cc: "Kondapally, Kalyan" <kalyan.kondapally@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist |  1 +
>   tests/prime_vgem.c                    | 31 +++++++++++++++++++++++++++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index aa2eb3295..982d25834 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -143,6 +143,7 @@ igt@prime_vgem@basic-fence-read
>   igt@prime_vgem@basic-gtt
>   igt@prime_vgem@basic-read
>   igt@prime_vgem@basic-write
> +igt@prime_vgem@basic-userptr
>   igt@vgem_basic@setversion
>   igt@vgem_basic@create
>   igt@vgem_basic@debugfs
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 38e2026aa..bc74d6844 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -287,6 +287,34 @@ static void test_write(int vgem, int i915)
>   	munmap(ptr, scratch.size);
>   }
>   
> +static void test_userptr(int vgem, int i915)
> +{
> +	struct vgem_bo scratch;
> +	struct drm_i915_gem_exec_object2 obj = {};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.buffers_ptr = to_user_pointer(&obj),
> +		.buffer_count = 1,
> +	};
> +	uint32_t *ptr;
> +
> +	scratch.width = 1024;
> +	scratch.height = 1024;
> +	scratch.bpp = 32;
> +	vgem_create(vgem, &scratch);
> +
> +	ptr = vgem_mmap(vgem, &scratch, PROT_WRITE);
> +	gem_close(vgem, scratch.handle);
> +	*ptr = MI_BATCH_BUFFER_END;
> +
> +	gem_userptr(i915, ptr, scratch.size, 0, 0, &obj.handle);
> +	gem_set_caching(i915, obj.handle, I915_CACHING_NONE); /* for exec */
> +
> +	gem_execbuf(i915, &execbuf);
> +	gem_close(i915, obj.handle);
> +
> +	munmap(ptr, scratch.size);
> +}
> +
>   static void test_gtt(int vgem, int i915)
>   {
>   	struct vgem_bo scratch;
> @@ -1038,6 +1066,9 @@ igt_main
>   	igt_subtest("basic-write")
>   		test_write(vgem, i915);
>   
> +	igt_subtest("basic-userptr")
> +		test_userptr(vgem, i915);
> +
>   	igt_subtest("basic-gtt") {
>   		gem_require_mappable_ggtt(i915);
>   		test_gtt(vgem, i915);
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
