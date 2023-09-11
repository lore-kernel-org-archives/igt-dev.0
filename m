Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE5810E263
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 09:58:12 +0000 (UTC)
Date: Mon, 11 Sep 2023 11:58:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230911095805.5vpmulbaybqt7i46@kamilkon-desk.igk.intel.com>
References: <20230911060345.324372-1-zbigniew.kempczynski@intel.com>
 <20230911060345.324372-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230911060345.324372-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/9] lib/intel_compute: Add
 compatibility flags for running compute
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zbigniew,

On 2023-09-11 at 08:03:38 +0200, Zbigniew Kempczyński wrote:
> Allow selectively turn on/off compute tests on both i915 and xe
> drivers.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/intel_compute.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index c0f5b1c937..9766dc127b 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -445,17 +445,27 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
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
>  
>  static const struct {
>  	unsigned int ip_ver;
>  	void (*compute_exec)(int fd, const unsigned char *kernel,
>  			     unsigned int size);
> +	uint32_t compat;
>  } intel_compute_batches[] = {
>  	{
>  		.ip_ver = IP_VER(12, 0),
>  		.compute_exec = tgl_compute_exec,
> +		.compat = COMPAT_I915 | COMPAT_XE,
>  	},
>  };
>  
> @@ -464,6 +474,7 @@ bool run_intel_compute_kernel(int fd)
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	unsigned int batch;
>  	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
> +	enum intel_driver driver = get_intel_driver(fd);
>  
>  	for (batch = 0; batch < ARRAY_SIZE(intel_compute_batches); batch++) {
>  		if (ip_ver == intel_compute_batches[batch].ip_ver)
> @@ -472,6 +483,12 @@ bool run_intel_compute_kernel(int fd)
>  	if (batch == ARRAY_SIZE(intel_compute_batches))
>  		return false;
>  
> +	if (!(COMPAT_FLAG(driver) & intel_compute_batches[batch].compat)) {
> +		igt_debug("driver flag: %x\n", COMPAT_FLAG(driver));
-------------------^
> +		igt_debug("compat flag: %x\n", intel_compute_batches[batch].compat);
-------------------^

I would rather write that there are no compute kernel,
then prints flags for them, something like:

		igt_debug("no compute kernel found, flags: %x & %x\n", COMPAT_FLAG(driver), intel_compute_batches[batch].compat);

With or without it,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +		return false;
> +	}
> +
>  	while (kernels->kernel) {
>  		if (ip_ver == kernels->ip_ver)
>  			break;
> -- 
> 2.34.1
> 
