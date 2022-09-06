Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C5510E555
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 13:28:57 +0000 (UTC)
Message-ID: <9e5acb70-0986-d00e-2cb9-b4c07facde6c@intel.com>
Date: Tue, 6 Sep 2022 16:28:50 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823183036.5270-13-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220823183036.5270-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 12/23] i915/perf: Skip tests that use
 rendercopy
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

On 23/08/2022 21:30, Umesh Nerlige Ramappa wrote:
> Running tests that require rendercopy sometimes leaves the DUT in an
> unsusable state. Further tests fail to run and DUT requires reboot.
> Since it affects CI efficiency, skip tests is rendercopy is missing.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Kind of awkward that igt_get_render_copyfunc() returns something when it 
doesn't seem to be have an engine able to run the copy function...


Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

> ---
>   tests/i915/perf.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index ba8c3792..85f3c5de 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -41,6 +41,7 @@
>   #include "i915/gem.h"
>   #include "i915/perf.h"
>   #include "igt.h"
> +#include "igt_perf.h"
>   #include "igt_sysfs.h"
>   #include "drm.h"
>   
> @@ -5025,6 +5026,19 @@ static int i915_perf_revision(int fd)
>   	return value;
>   }
>   
> +static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
> +{
> +	int fd;
> +
> +	fd = perf_i915_open(i915, I915_PMU_ENGINE_BUSY(class, instance));
> +	if (fd >= 0) {
> +		close(fd);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>   igt_main
>   {
>   	igt_fixture {
> @@ -5069,7 +5083,8 @@ igt_main
>   
>   		gt_max_freq_mhz = sysfs_read(RPS_RP0_FREQ_MHZ);
>   
> -		render_copy = igt_get_render_copyfunc(devid);
> +		if (has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0))
> +			render_copy = igt_get_render_copyfunc(devid);
>   	}
>   
>   	igt_subtest("non-system-wide-paranoid")

