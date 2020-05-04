Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297326E34A
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2020 08:20:32 +0000 (UTC)
Date: Mon, 4 May 2020 11:20:29 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200504082029.GE9497@platvala-desk.ger.corp.intel.com>
References: <20200504073707.268608-1-arkadiusz.hiler@intel.com>
 <20200504073707.268608-3-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504073707.268608-3-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] test/kms_prime: Use
 drm_open_driver_another
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 04, 2020 at 10:37:07AM +0300, Arkadiusz Hiler wrote:
> The test now uses dumb buffers explicitly instead of the vgem helpers.
> 
> By default the first two devices that are matching provided chipset requirements
> are used (ANY + VGEM). This is sensitive to enumeration order, but as long as
> there are only two devices it's fine - PRIME will get tested both directions.
> 
> IGT-Version: 1.25-g0b58fd8c (x86_64) (Linux: 5.7.0-rc2-CI-CI_DRM_8370+ x86_64)
> Starting subtest: basic-crc
> Starting dynamic subtest: first-to-second
> Test requirement not met in function igt_require_pipe_crc, file ../lib/igt_debugfs.c:522:
> Test requirement: fstatat(dir, "crtc-0/crc/control", &stat, 0) == 0
> CRCs not supported on this platform
> Last errno: 2, No such file or directory
> Dynamic subtest first-to-second: SKIP (0,000s)
> Starting dynamic subtest: second-to-first
> Dynamic subtest second-to-first: SUCCESS (1,779s)
> Subtest basic-crc: SUCCESS (2,024s)
> 
> In case there are more than two devices you can specify which ones should be
> used or force ordering, e.g.:
> 
> sys:/sys/devices/pci0000:00/0000:00:02.0
>     subsystem       : pci
>     drm card        : /dev/dri/card0
>     drm render      : /dev/dri/renderD128
>     vendor          : 8086
>     device          : 9A49
> 
> sys:/sys/devices/platform/vgem
>     subsystem       : platform
>     drm card        : /dev/dri/card1
>     drm render      : /dev/dri/renderD129
> 
> IGT-Version: 1.25-g0b58fd8c (x86_64) (Linux: 5.7.0-rc2-CI-CI_DRM_8370+ x86_64)
> Starting subtest: basic-crc
> Looking for devices to open using filter 0: sys:/sys/devices/platform/vgem
> Filter matched /dev/dri/card1 | /dev/dri/renderD129
> Looking for devices to open using filter 1: pci:vendor=Intel
> Filter matched /dev/dri/card0 | /dev/dri/renderD128
> Starting dynamic subtest: first-to-second
> Dynamic subtest first-to-second: SUCCESS (1,978s)
> Starting dynamic subtest: second-to-first
> Test requirement not met in function igt_require_pipe_crc, file ../lib/igt_debugfs.c:522:
> Test requirement: fstatat(dir, "crtc-0/crc/control", &stat, 0) == 0
> CRCs not supported on this platform
> Last errno: 2, No such file or directory
> Dynamic subtest second-to-first: SKIP (0,000s)
> Subtest basic-crc: SUCCESS (2,944s)
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  tests/kms_prime.c | 107 +++++++++++++++++++++++++++++-----------------
>  1 file changed, 67 insertions(+), 40 deletions(-)
> 
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 3241c514..8cb2ca2a 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -22,12 +22,19 @@
>   */
>  
>  #include "igt.h"
> -#include "igt_vgem.h"
> +#include "igt_device.h"
>  
>  #include <sys/ioctl.h>
>  #include <sys/poll.h>
>  #include <time.h>
>  
> +struct dumb_bo {
> +	uint32_t handle;
> +	uint32_t width, height;
> +	uint32_t bpp, pitch;
> +	uint64_t size;
> +};
> +
>  struct crc_info {
>  	igt_crc_t crc;
>  	char *str;
> @@ -67,23 +74,24 @@ static bool has_prime_export(int fd)
>  }
>  
>  static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
> -				   enum pipe pipe)
> +				   enum pipe *pipe)
>  {
>  	igt_output_t *output;
> +	bool found = false;
>  
> -	igt_display_require(display, importer_fd);
> -	igt_skip_on(pipe >= display->n_pipes);
> -	output = igt_get_single_output_for_pipe(display, pipe);
> +	for_each_pipe_with_valid_output(display, *pipe, output) {
> +		found = true;
> +		break;
> +	}
>  
> -	igt_require_f(output, "No connector found for pipe %s\n",
> -		      kmstest_pipe_name(pipe));
> +	igt_require_f(found, "No valid connector/pipe found\n");
>  
>  	igt_display_reset(display);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_pipe(output, *pipe);
>  	return output;
>  }
>  
> -static void prepare_scratch(int exporter_fd, struct vgem_bo *scratch,
> +static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
>  			    drmModeModeInfo *mode, uint32_t color)
>  {
>  	uint32_t *ptr;
> @@ -91,16 +99,27 @@ static void prepare_scratch(int exporter_fd, struct vgem_bo *scratch,
>  	scratch->width = mode->hdisplay;
>  	scratch->height = mode->vdisplay;
>  	scratch->bpp = 32;
> -	vgem_create(exporter_fd, scratch);
>  
> -	ptr = vgem_mmap(exporter_fd, scratch, PROT_WRITE);
> +	scratch->handle = kmstest_dumb_create(exporter_fd,
> +			scratch->width,
> +			scratch->height,
> +			scratch->bpp,
> +			&scratch->pitch,
> +			&scratch->size);
> +
> +
> +	ptr = kmstest_dumb_map_buffer(exporter_fd,
> +				      scratch->handle,
> +				      scratch->size,
> +				      PROT_WRITE);
> +
>  	for (size_t idx = 0; idx < scratch->size / sizeof(*ptr); ++idx)
>  		ptr[idx] = color;
>  
>  	munmap(ptr, scratch->size);
>  }
>  
> -static void prepare_fb(int importer_fd, struct vgem_bo *scratch, struct igt_fb *fb)
> +static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *fb)
>  {
>  	enum igt_color_encoding color_encoding = IGT_COLOR_YCBCR_BT709;
>  	enum igt_color_range color_range = IGT_COLOR_YCBCR_LIMITED_RANGE;
> @@ -126,6 +145,7 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
>  			    DRM_FORMAT_XRGB8888,
>  			    handles, pitches, offsets,
>  			    &fb->fb_id, 0);
> +
>  	igt_assert(ret == 0);
>  }
>  
> @@ -162,19 +182,19 @@ static void test_crc(int exporter_fd, int importer_fd)
>  	igt_display_t display;
>  	igt_output_t *output;
>  	igt_pipe_crc_t *pipe_crc;
> -	enum pipe pipe = PIPE_A;
> +	enum pipe pipe;
>  	struct igt_fb fb;
>  	int dmabuf_fd;
> -	struct vgem_bo scratch = {}; /* despite the name, it suits for any
> -				      * gem-compatible device
> -				      * TODO: rename
> -				      */
> +	struct dumb_bo scratch = {};
> +	bool crc_equal;
>  	int i, j;
>  	drmModeModeInfo *mode;
>  
> -	bool crc_equal = false;
> +	igt_device_set_master(importer_fd);
> +	igt_require_pipe_crc(importer_fd);
> +	igt_display_require(&display, importer_fd);
>  
> -	output = setup_display(importer_fd, &display, pipe);
> +	output = setup_display(importer_fd, &display, &pipe);
>  
>  	mode = igt_output_get_mode(output);
>  	pipe_crc = igt_pipe_crc_new(importer_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
> @@ -188,6 +208,7 @@ static void test_crc(int exporter_fd, int importer_fd)
>  		import_fb(importer_fd, &fb, dmabuf_fd, scratch.pitch);
>  		close(dmabuf_fd);
>  
> +
>  		colors[i].prime_crc.name = "prime";
>  		collect_crc_for_fb(importer_fd, &fb, &display, output,
>  				   pipe_crc, colors[i].color, &colors[i].prime_crc);

Spurious whitespace change above.



Reviewed-by: Petri Latvala <petri.latvala@intel.com>




> @@ -228,29 +249,35 @@ static void test_crc(int exporter_fd, int importer_fd)
>  	igt_display_fini(&display);
>  }
>  
> -static void run_test_crc(int export_chipset, int import_chipset)
> -{
> -	int importer_fd = -1;
> -	int exporter_fd = -1;
> -
> -	exporter_fd = drm_open_driver(export_chipset);
> -	importer_fd = drm_open_driver_master(import_chipset);
> -
> -	igt_require(has_prime_export(exporter_fd));
> -	igt_require(has_prime_import(importer_fd));
> -	igt_require_pipe_crc(importer_fd);
> -
> -	test_crc(exporter_fd, importer_fd);
> -	close(importer_fd);
> -	close(exporter_fd);
> -}
> -
>  igt_main
>  {
> -	igt_fixture {
> +	igt_fixture
>  		kmstest_set_vt_graphics_mode();
> +
> +	igt_describe("Make a dumb color buffer, export to another device and"
> +		     " compare the CRCs with a buffer native to that device");
> +	igt_subtest_with_dynamic("basic-crc") {
> +		int first_fd = -1;
> +		int second_fd = -1;
> +
> +		/* ANY = anything that is not VGEM */
> +		first_fd = __drm_open_driver_another(0, DRIVER_ANY | DRIVER_VGEM);
> +		igt_require(first_fd >= 0);
> +
> +		second_fd = __drm_open_driver_another(1, DRIVER_ANY | DRIVER_VGEM);
> +		igt_require(second_fd >= 0);
> +
> +		if (has_prime_export(first_fd) &&
> +		    has_prime_import(second_fd))
> +			igt_dynamic("first-to-second")
> +				test_crc(first_fd, second_fd);
> +
> +		if (has_prime_import(first_fd) &&
> +		    has_prime_export(second_fd))
> +			igt_dynamic("second-to-first")
> +				test_crc(second_fd, first_fd);
> +
> +		close(first_fd);
> +		close(second_fd);
>  	}
> -	igt_describe("Make a dumb buffer inside vgem, fill it, export to another device and compare the CRC");
> -	igt_subtest("basic-crc")
> -		run_test_crc(DRIVER_VGEM, DRIVER_ANY);
>  }
> -- 
> 2.25.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
