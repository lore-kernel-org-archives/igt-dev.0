Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D5C10E891
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 09:03:43 +0000 (UTC)
Date: Fri, 8 Sep 2023 11:03:14 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZPrjUs7lyYxA1loA@fdugast-desk.home>
References: <20230905133309.365109-1-zbigniew.kempczynski@intel.com>
 <20230905133309.365109-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230905133309.365109-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/9] lib/intel_compute: Add
 compatibility flags for running compute
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

On Tue, Sep 05, 2023 at 03:33:02PM +0200, Zbigniew Kempczyński wrote:
> Allow selectively turn on/off compute tests on both i915 and xe
> drivers.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/intel_compute.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 647bce0e43..dd9f686d0c 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -446,17 +446,27 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
>  }
>  
>  /*
> - * Generic code
> + * Compatibility flags.
> + *
> + * There will be some time period in which both drivers (i915 and xe)
> + * will support compute runtime tests. Lets define compat flags to allow
> + * the code to be shared between two drivers allowing disabling this in
> + * the future.
>   */
> +#define COMPAT_FLAG(f) (1 << (f))
> +#define COMPAT_I915 COMPAT_FLAG(INTEL_DRIVER_I915)
> +#define COMPAT_XE   COMPAT_FLAG(INTEL_DRIVER_XE)

This approach allows solving the issue of unsupported combinations of
platforms and drivers. I cannot think of something better but my concern
is there could be some confusion if the test is skipped on a platform
that appears to be supported because it is listed in the compute_batches.

s/COMPAT_I915/COMPAT_DRIVER_I915/ and s/COMPAT_XE/COMPAT_DRIVER_XE/ can
help make it not ambiguous.

It would be good to get ack from someone else on the compat flag
approach, Mauro maybe?

Francois

>  
>  static const struct {
>  	unsigned int ip_ver;
>  	void (*compute_exec)(int fd, const unsigned char *kernel,
>  			     unsigned int size);
> +	uint32_t compat;
>  } compute_batches[] = {
>  	{
>  		.ip_ver = IP_VER(12, 0),
>  		.compute_exec = tgl_compute_exec,
> +		.compat = COMPAT_I915 | COMPAT_XE,
>  	},
>  };
>  
> @@ -465,6 +475,7 @@ bool run_compute_kernel(int fd)
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	unsigned int batch;
>  	const struct compute_kernels *kernels = compute_square_kernels;
> +	enum intel_driver driver = get_intel_driver(fd);
>  
>  	for (batch = 0; batch < ARRAY_SIZE(compute_batches); batch++) {
>  		if (ip_ver == compute_batches[batch].ip_ver)
> @@ -473,6 +484,12 @@ bool run_compute_kernel(int fd)
>  	if (batch == ARRAY_SIZE(compute_batches))
>  		return false;
>  
> +	if (!(COMPAT_FLAG(driver) & compute_batches[batch].compat)) {
> +		igt_debug("driver flag: %x\n", COMPAT_FLAG(driver));
> +		igt_debug("compat flag: %x\n", compute_batches[batch].compat);
> +		return false;
> +	}
> +
>  	while (kernels->kernel) {
>  		if (ip_ver == kernels->ip_ver)
>  			break;
> -- 
> 2.34.1
> 
