Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884AE6E865
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2020 00:43:02 +0000 (UTC)
References: <20200131173109.12527-1-ramalingam.c@intel.com>
 <20200131173109.12527-10-ramalingam.c@intel.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <9ebbfaf5-652e-4d17-7d30-82ff9a4fd346@intel.com>
Date: Tue, 4 Feb 2020 16:43:01 -0800
MIME-Version: 1.0
In-Reply-To: <20200131173109.12527-10-ramalingam.c@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 9/9] tests/gem_tiling_max_stride: Skip
 if set tiling is not supported
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
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 31/01/20 09:31, Ramalingam C wrote:
> When mmapable aperture is not supported set tiling also not supported.
> Hence skip the test.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   tests/i915/gem_tiling_max_stride.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/gem_tiling_max_stride.c b/tests/i915/gem_tiling_max_stride.c
> index 0e99d979f0ca..77f7223ba19b 100644
> --- a/tests/i915/gem_tiling_max_stride.c
> +++ b/tests/i915/gem_tiling_max_stride.c
> @@ -71,6 +71,7 @@ igt_simple_main
>   	fd = drm_open_driver(DRIVER_INTEL);
>   
>   	devid = intel_get_drm_devid(fd);
> +	gem_require_mappable_ggtt(fd);

AFAICT it would not work without tiled access.

Acked-by: Antonio Argenziano <antonio.argenziano@intel.com>

>   
>   	if (intel_gen(devid) >= 7) {
>   		stride = 256 * 1024;
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
