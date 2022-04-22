Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D611110E727
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 12:04:17 +0000 (UTC)
Date: Fri, 22 Apr 2022 08:04:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <YmKZu6iHUXFcC8YD@intel.com>
References: <20220418125048.7969-1-anshuman.gupta@intel.com>
 <20220418125048.7969-9-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418125048.7969-9-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 8/9] i915_pm_rpm: Extend gem_execbuf
 test with D3Cold
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 18, 2022 at 06:20:47PM +0530, Anshuman Gupta wrote:
> Added d3cold dynamic subtest to gem_execbuf with device class
> memory region. It test both D3Cold-{VRAM_SR, Off} by using
> d3cold_sr_lmem_threshold i915_params debugfs.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/i915/i915_pm_rpm.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index 8e9ff56ec..414797bc8 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -1344,10 +1344,11 @@ static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
>  }
>  
>  /* Make sure we can submit a batch buffer and verify its result. */
> -static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_regions)
> +static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_regions, bool d3cold)
>  {
>  	int x, y;
>  	uint32_t handle;
> +	struct pci_device *root;
>  	int bpp = 4;
>  	int pitch = 128 * bpp;
>  	int dst_size = 128 * 128 * bpp; /* 128x128 square */
> @@ -1369,6 +1370,9 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
>  	memset(cpu_buf, 0, dst_size);
>  	gem_write(drm_fd, handle, 0, cpu_buf, dst_size);
>  
> +	if (d3cold)
> +		root = setup_d3cold_and_get_root_port();
> +
>  	/* Now suspend and try it. */
>  	disable_all_screens_and_wait(&ms_data);
>  
> @@ -1376,9 +1380,14 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
>  	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
>  		       &presumed_offset);
>  	igt_assert(wait_for_suspended());
> +	if (d3cold)
> +		igt_assert(wait_for_d3cold(root));
>  
>  	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
>  	igt_assert(wait_for_suspended());
> +	if (d3cold)
> +		igt_assert(wait_for_d3cold(root));
> +
>  	for (y = 0; y < 128; y++) {
>  		for (x = 0; x < 128; x++) {
>  			uint32_t px = cpu_buf[y * 128 + x];
> @@ -1416,6 +1425,8 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
>  		       &presumed_offset);
>  
>  	disable_all_screens_and_wait(&ms_data);
> +	if (d3cold)
> +		igt_assert(wait_for_d3cold(root));
>  
>  	memset(cpu_buf, 0, dst_size);
>  	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
> @@ -2172,7 +2183,18 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	igt_subtest_with_dynamic("gem-execbuf") {
>  		for_each_memory_region(r, drm_fd) {
>  			igt_dynamic_f("%s", r->name)
> -				gem_execbuf_subtest(&r->ci);
> +				gem_execbuf_subtest(&r->ci, false);
> +			if (r->ci.memory_class == I915_MEMORY_CLASS_SYSTEM)
> +				continue;
> +			igt_dynamic_f("%s-%s", "d3cold", r->name) {
> +				int lmem_threshold;
> +
> +				lmem_threshold = get_d3cold_sr_lmem_threshold(debugfs);
> +				gem_execbuf_subtest(&r->ci, true);
> +				set_d3cold_sr_lmem_threshold(debugfs, 0);
> +				gem_execbuf_subtest(&r->ci, true);

here as well... we should have 2 separated subtests

> +				set_d3cold_sr_lmem_threshold(debugfs, lmem_threshold);
> +			}
>  		}
>  	}
>  	igt_subtest("gem-idle")
> -- 
> 2.26.2
> 
