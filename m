Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC3C10E49D
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 15:41:44 +0000 (UTC)
Date: Fri, 30 Jun 2023 17:41:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230630154140.whx2blfffwvtwi6o@kamilkon-desk1>
References: <cover.1687862551.git.karolina.stolarek@intel.com>
 <35cbc4615d68d3381749e718c191978fd0bd2163.1687862551.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35cbc4615d68d3381749e718c191978fd0bd2163.1687862551.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] tests/i915/i915_pm_rpm: Modify
 gem-execbuf test for gen12+
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Karolina,
On 2023-06-27 at 12:58:19 +0200, Karolina Stolarek wrote:
> From: Vikas Srivastava <vikas.srivastava@intel.com>
> 
> xy_color_blt is not supported on MTL and other gen12+ target
> hence an IGT test update needs to be done. Modify the test
> to add a lib API to check for xy_color_blt support.
> 
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/i915_pm_rpm.c | 185 ++++++++++++++++++++++++++++++---------
>  1 file changed, 146 insertions(+), 39 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index e866e7fc9..dee44d71b 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -246,6 +246,7 @@
>  #include "igt_debugfs.h"
>  #include "igt_device.h"
>  #include "igt_edid.h"
> +#include "intel_blt.h"
>  
>  #define MSR_PC8_RES	0x630
>  #define MSR_PC9_RES	0x631
> @@ -255,6 +256,11 @@
>  #define MAX_ENCODERS	32
>  #define MAX_CRTCS	16
>  
> +#define WIDTH 64
> +#define HEIGHT 64
> +#define STRIDE (WIDTH)
> +#define SIZE (HEIGHT * STRIDE)
> +
>  enum pc8_status {
>  	PC8_ENABLED,
>  	PC8_DISABLED
> @@ -311,10 +317,57 @@ struct modeset_params {
>  	drmModeModeInfoPtr mode;
>  };
>  
> +struct data_t {
> +	int width;
> +	int height;
> +	uint32_t region;
> +};
> +
>  struct modeset_params lpsp_mode_params;
>  struct modeset_params non_lpsp_mode_params;
>  struct modeset_params *default_mode_params;
>  
> +/* API to create mmap buffer */
> +static struct intel_buf *
> +create_buf(struct data_t *data, uint32_t color)
> +{
> +	struct intel_buf *buf;
> +	uint8_t *ptr;
> +	uint32_t handle;
> +	struct buf_ops *bops;
> +	int i;
> +
> +	buf = calloc(1, sizeof(*buf));
> +	igt_assert(buf);
> +	bops = buf_ops_create(drm_fd);
> +
> +	handle = gem_create_in_memory_regions(drm_fd, SIZE, data->region);
> +	intel_buf_init_using_handle(bops, handle, buf,
> +				    data->width / 4, data->height, 32, 0,
> +				    I915_TILING_NONE, 0);
> +
> +	ptr = gem_mmap__cpu_coherent(drm_fd, buf->handle, 0,
> +				     buf->surface[0].size, PROT_WRITE);
> +
> +	for (i = 0; i < buf->surface[0].size; i++)
> +		ptr[i] = color;
> +
> +	munmap(ptr, buf->surface[0].size);
> +
> +	return buf;
> +}
> +
> +/* checking the buffer content is correct or not */
> +static void buf_check(uint8_t *ptr, int x, int y, uint8_t color)
> +{
> +	uint8_t val;
> +
> +	val = ptr[y * WIDTH + x];
> +	igt_assert_f(val == color,
> +		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
> +		     color, val, x, y);
> +}
> +
>  static int modprobe(const char *driver)
>  {
>  	return igt_kmod_load(driver, NULL);
> @@ -1525,7 +1578,7 @@ static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
>  /* Make sure we can submit a batch buffer and verify its result. */
>  static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_regions)
>  {
> -	int x, y;
> +	int x, y, i, j;
>  	uint32_t handle;
>  	int bpp = 4;
>  	int pitch = 128 * bpp;
> @@ -1534,10 +1587,31 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
>  	uint32_t presumed_offset = 0;
>  	int sq_x = 5, sq_y = 10, sq_w = 15, sq_h = 20;
>  	uint32_t color;
> +	struct intel_buf *buf;
> +	uint8_t *ptr;
> +	struct data_t data = {0, };
> +	struct igt_collection *region;
> +	struct drm_i915_query_memory_regions *region_info;
> +	struct igt_collection *region_set;
> +	uint32_t id;
>  
>  	igt_require_gem(drm_fd);
>  	gem_require_blitter(drm_fd);
>  
> +	region_info = gem_get_query_memory_regions(drm_fd);
> +	igt_assert(region_info);
> +	region_set = get_memory_region_set(region_info,
> +					   I915_DEVICE_MEMORY,
> +					   I915_SYSTEM_MEMORY);
> +	for_each_combination(region, 1, region_set) {
> +		id = igt_collection_get_value(region, 0);
> +		break;
> +	}
> +
> +	data.width = WIDTH;
> +	data.height = HEIGHT;
> +	data.region = id;
> +
>  	/* Create and set data while the device is active. */
>  	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
>  
> @@ -1552,62 +1626,95 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
>  	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
>  
>  	color = 0x12345678;
> -	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
> -		       &presumed_offset);
> -	igt_assert(wait_for_suspended());
> +	if (blt_has_xy_color(drm_fd)) {
> +		submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
> +			       &presumed_offset);
> +		igt_assert(wait_for_suspended());
>  
> -	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
> -	igt_assert(wait_for_suspended());
> -	for (y = 0; y < 128; y++) {
> -		for (x = 0; x < 128; x++) {
> -			uint32_t px = cpu_buf[y * 128 + x];
> +		gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
> +		for (y = 0; y < 128; y++) {
> +			for (x = 0; x < 128; x++) {
> +				uint32_t px = cpu_buf[y * 128 + x];
>  
> -			if (y >= sq_y && y < (sq_y + sq_h) &&
> -			    x >= sq_x && x < (sq_x + sq_w))
> -				igt_assert_eq_u32(px, color);
> -			else
> -				igt_assert(px == 0);
> +				if (y >= sq_y && y < (sq_y + sq_h) &&
> +				    x >= sq_x && x < (sq_x + sq_w))
> +					igt_assert_eq_u32(px, color);
> +				else
> +					igt_assert(px == 0);
> +			}
>  		}
> +	} else {
> +		buf = create_buf(&data, color);
> +		ptr = gem_mmap__device_coherent(drm_fd, buf->handle, 0,
> +						buf->surface[0].size, PROT_READ);
> +		igt_assert(wait_for_suspended());
> +
> +		for (i = 0; i < WIDTH; i++)
> +			for (j = 0; j < HEIGHT; j++)
> +				buf_check(ptr, i, j, color);
> +		munmap(ptr, buf->surface[0].size);
>  	}
>  
>  	/* Now resume and check for it again. */
>  	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
>  
> -	memset(cpu_buf, 0, dst_size);
> -	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
> -	for (y = 0; y < 128; y++) {
> -		for (x = 0; x < 128; x++) {
> -			uint32_t px = cpu_buf[y * 128 + x];
> -
> -			if (y >= sq_y && y < (sq_y + sq_h) &&
> -			    x >= sq_x && x < (sq_x + sq_w))
> -				igt_assert_eq_u32(px, color);
> -			else
> -				igt_assert(px == 0);
> +	if (blt_has_xy_color(drm_fd)) {
> +		memset(cpu_buf, 0, dst_size);
> +		gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
> +
> +		for (y = 0; y < 128; y++) {
> +			for (x = 0; x < 128; x++) {
> +				uint32_t px = cpu_buf[y * 128 + x];
> +
> +				if (y >= sq_y && y < (sq_y + sq_h) &&
> +				    x >= sq_x && x < (sq_x + sq_w))
> +					igt_assert_eq_u32(px, color);
> +				else
> +					igt_assert(px == 0);
> +			}
>  		}
> +	} else {
> +		buf = create_buf(&data, color);
> +		ptr = gem_mmap__device_coherent(drm_fd, buf->handle, 0,
> +						buf->surface[0].size, PROT_READ);
> +		for (i = 0; i < WIDTH; i++)
> +			for (j = 0; j < HEIGHT; j++)
> +				buf_check(ptr, i, j, color);
> +		munmap(ptr, buf->surface[0].size);
>  	}
>  
>  	/* Now we'll do the opposite: do the blt while active, then read while
>  	 * suspended. We use the same spot, but a different color. As a bonus,
>  	 * we're testing the presumed_offset from the previous command. */
>  	color = 0x87654321;
> -	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
> -		       &presumed_offset);
> +	if (blt_has_xy_color(drm_fd)) {
>  
> -	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
> +		submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
> +			       &presumed_offset);
>  
> -	memset(cpu_buf, 0, dst_size);
> -	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
> -	for (y = 0; y < 128; y++) {
> -		for (x = 0; x < 128; x++) {
> -			uint32_t px = cpu_buf[y * 128 + x];
> -
> -			if (y >= sq_y && y < (sq_y + sq_h) &&
> -			    x >= sq_x && x < (sq_x + sq_w))
> -				igt_assert_eq_u32(px, color);
> -			else
> -				igt_assert(px == 0);
> +		disable_all_screens_or_forcewake_put_and_wait(&ms_data);
> +
> +		memset(cpu_buf, 0, dst_size);
> +		gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
> +		for (y = 0; y < 128; y++) {
> +			for (x = 0; x < 128; x++) {
> +				uint32_t px = cpu_buf[y * 128 + x];
> +
> +				if (y >= sq_y && y < (sq_y + sq_h) &&
> +				    x >= sq_x && x < (sq_x + sq_w))
> +					igt_assert_eq_u32(px, color);
> +				else
> +					igt_assert(px == 0);
> +			}
>  		}
> +	} else {
> +		buf = create_buf(&data, color);
> +		ptr = gem_mmap__device_coherent(drm_fd, buf->handle, 0,
> +						buf->surface[0].size, PROT_READ);
> +		for (i = 0; i < WIDTH; i++)
> +			for (j = 0; j < HEIGHT; j++)
> +				buf_check(ptr, i, j, color);
> +		munmap(ptr, buf->surface[0].size);
>  	}
>  
>  	gem_close(drm_fd, handle);
> -- 
> 2.25.1
> 
