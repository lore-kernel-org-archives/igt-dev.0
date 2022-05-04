Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAB010E0EB
 for <igt-dev@lists.freedesktop.org>; Wed,  4 May 2022 17:56:24 +0000 (UTC)
Date: Wed, 4 May 2022 13:55:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <YnK+Guf0oyqHnPAX@intel.com>
References: <20220504135900.13806-1-anshuman.gupta@intel.com>
 <20220504135900.13806-9-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504135900.13806-9-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 8/8] i915_pm_rpm: Extend
 gem-mmap-type test with D3Cold
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, igt-dev@lists.freedesktop.org,
 badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 04, 2022 at 07:29:00PM +0530, Anshuman Gupta wrote:
> Added d3cold dynamic subtest to gem-mmap-type with device class
> memory region. It test both D3Cold-{VRAM_SR, Off} by using
> d3cold_sr_lmem_threshold i915_params debugfs.
> 
> v2:
> - Two different subtest d3cold-off and d3cold-vrsr. [Rodrigo]
> v3:
> - Skip the d3cold-vram-sr test when lmem_threshold is not available.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/i915/i915_pm_rpm.c | 41 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index a062fde88..3a4e2901b 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -1129,11 +1129,12 @@ static struct pci_device *setup_d3cold_and_get_root_port(void)
>  }
>  
>  static void gem_mmap_args(const struct mmap_offset *t,
> -			  struct drm_i915_gem_memory_class_instance *mem_regions)
> +			  struct drm_i915_gem_memory_class_instance *mem_regions, bool d3cold)
>  {
>  	int i;
>  	uint32_t handle;
>  	int buf_size = 8192;
> +	struct pci_device *root;
>  	uint8_t *gem_buf;
>  
>  	/* Create, map and set data while the device is active. */
> @@ -1151,17 +1152,29 @@ static void gem_mmap_args(const struct mmap_offset *t,
>  	for (i = 0; i < buf_size; i++)
>  		igt_assert(gem_buf[i] == (i & 0xFF));
>  
> +	if (d3cold)
> +		root = setup_d3cold_and_get_root_port();
> +
>  	/* Now suspend, read and modify. */
>  	disable_all_screens_and_wait(&ms_data);
>  
> +	if (d3cold)
> +		igt_assert(wait_for_d3cold(root));
> +
>  	for (i = 0; i < buf_size; i++)
>  		igt_assert(gem_buf[i] == (i & 0xFF));
>  	igt_assert(wait_for_suspended());
>  
> +	if (d3cold)
> +		igt_assert(wait_for_d3cold(root));
> +
>  	for (i = 0; i < buf_size; i++)
>  		gem_buf[i] = (~i & 0xFF);
>  	igt_assert(wait_for_suspended());
>  
> +	if (d3cold)
> +		igt_assert(wait_for_d3cold(root));
> +
>  	/* Now resume and see if it's still there. */
>  	enable_one_screen_and_wait(&ms_data);
>  	for (i = 0; i < buf_size; i++)
> @@ -1173,12 +1186,18 @@ static void gem_mmap_args(const struct mmap_offset *t,
>  	 * suspended. */
>  	disable_all_screens_and_wait(&ms_data);
>  
> +	if (d3cold)
> +		igt_assert(wait_for_d3cold(root));
> +
>  	gem_buf = __gem_mmap_offset(drm_fd, handle, 0, buf_size,
>  				    PROT_READ | PROT_WRITE, t->type);
>  	igt_require(gem_buf);
>  
>  	igt_assert(wait_for_suspended());
>  
> +	if (d3cold)
> +		igt_assert(wait_for_d3cold(root));
> +
>  	for (i = 0; i < buf_size; i++)
>  		gem_buf[i] = i & 0xFF;
>  
> @@ -1187,6 +1206,9 @@ static void gem_mmap_args(const struct mmap_offset *t,
>  
>  	igt_assert(wait_for_suspended());
>  
> +	if (d3cold)
> +		igt_assert(wait_for_d3cold(root));
> +
>  	/* Resume and check if it's still there. */
>  	enable_one_screen_and_wait(&ms_data);
>  	for (i = 0; i < buf_size; i++)
> @@ -2186,7 +2208,22 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		for_each_mmap_offset_type(drm_fd, t) {
>  			for_each_memory_region(r, drm_fd) {
>  				igt_dynamic_f("%s-%s", t->name, r->name)
> -				gem_mmap_args(t, &r->ci);
> +				gem_mmap_args(t, &r->ci, false);
> +
> +				if (r->ci.memory_class == I915_MEMORY_CLASS_SYSTEM)
> +					continue;
> +
> +				igt_dynamic_f("%s-%s-%s", t->name, "d3cold-off", r->name) {
> +					if (lmem_threshold >= 0)
> +						set_d3cold_sr_lmem_threshold(debugfs, 300);
> +					gem_mmap_args(t, &r->ci, true);
> +				}
> +
> +				igt_dynamic_f("%s-%s-%s", t->name, "d3cold-vrsr", r->name) {
> +					igt_require(lmem_threshold >= 0);
> +					set_d3cold_sr_lmem_threshold(debugfs, 0);
> +					gem_mmap_args(t, &r->ci, true);
> +				}
>  			}
>  		}
>  	}
> -- 
> 2.26.2
> 
