Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CF210F8F3
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 09:26:46 +0000 (UTC)
Date: Fri, 22 Apr 2022 05:26:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <YmJ00H6aMy13sF6o@intel.com>
References: <20220418125048.7969-1-anshuman.gupta@intel.com>
 <20220418125048.7969-2-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418125048.7969-2-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/9] test/i915_pm_rpm: Add placement to
 gem-{mmap-type, execbuf}
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, badal.nilawar@intel.com,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 18, 2022 at 06:20:40PM +0530, Anshuman Gupta wrote:
> Add memory region placement to gem-{mmap-type, execbuf} subtest.
> This will be useful to extend these sub-test for D3Cold.
> 
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/i915/i915_pm_rpm.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index 461730e8a..d2bce5826 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -1069,7 +1069,8 @@ static void debugfs_forcewake_user_subtest(void)
>  	igt_assert(wait_for_suspended());
>  }
>  
> -static void gem_mmap_args(const struct mmap_offset *t)
> +static void gem_mmap_args(const struct mmap_offset *t,
> +			  struct drm_i915_gem_memory_class_instance *mem_regions)
>  {
>  	int i;
>  	uint32_t handle;
> @@ -1079,7 +1080,7 @@ static void gem_mmap_args(const struct mmap_offset *t)
>  	/* Create, map and set data while the device is active. */
>  	enable_one_screen_and_wait(&ms_data);
>  
> -	handle = gem_create(drm_fd, buf_size);
> +	handle = gem_create_in_memory_region_list(drm_fd, buf_size, mem_regions, 1);
>  
>  	gem_buf = __gem_mmap_offset(drm_fd, handle, 0, buf_size,
>  				    PROT_READ | PROT_WRITE, t->type);
> @@ -1290,7 +1291,7 @@ static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
>  }
>  
>  /* Make sure we can submit a batch buffer and verify its result. */
> -static void gem_execbuf_subtest(void)
> +static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_regions)
>  {
>  	int x, y;
>  	uint32_t handle;
> @@ -1308,7 +1309,7 @@ static void gem_execbuf_subtest(void)
>  	/* Create and set data while the device is active. */
>  	enable_one_screen_and_wait(&ms_data);
>  
> -	handle = gem_create(drm_fd, dst_size);
> +	handle = gem_create_in_memory_region_list(drm_fd, dst_size, mem_regions, 1);
>  
>  	cpu_buf = malloc(dst_size);
>  	igt_assert(cpu_buf);
> @@ -2083,15 +2084,21 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	/* GEM */
>  	igt_subtest_with_dynamic("gem-mmap-type") {
>  		for_each_mmap_offset_type(drm_fd, t) {
> -			igt_dynamic_f("%s", t->name)
> -				gem_mmap_args(t);
> +			for_each_memory_region(r, drm_fd) {
> +				igt_dynamic_f("%s-%s", t->name, r->name)
> +				gem_mmap_args(t, &r->ci);
> +			}
>  		}
>  	}
>  
>  	igt_subtest("gem-pread")
>  		gem_pread_subtest();
> -	igt_subtest("gem-execbuf")
> -		gem_execbuf_subtest();
> +	igt_subtest_with_dynamic("gem-execbuf") {
> +		for_each_memory_region(r, drm_fd) {
> +			igt_dynamic_f("%s", r->name)
> +				gem_execbuf_subtest(&r->ci);
> +		}
> +	}

I believe for D3Cold the only ones that matters are the lmem ones,
but I don't believe it hurts to try more.


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



>  	igt_subtest("gem-idle")
>  		gem_idle_subtest();
>  	igt_subtest("gem-evict-pwrite") {
> -- 
> 2.26.2
> 
