Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4A410E0FA
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 06:02:18 +0000 (UTC)
Date: Fri, 5 Jan 2024 07:02:14 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t] lib/intel_compute: Do not skip test with Xe on DG2
Message-ID: <20240105060214.owesljl2dnnjebyf@zkempczy-mobl2>
References: <20240104163018.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240104163018.7-1-francois.dugast@intel.com>
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

On Thu, Jan 04, 2024 at 04:30:18PM +0000, Francois Dugast wrote:
> This combination used to fail but not anymore so let's add compatibility
> with Xe when executing on DG2.

Nice! Happy to see this on dg2/atsm.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_compute.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index bf6a91109..1f1c79fd3 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1386,7 +1386,7 @@ static const struct {
>  	{
>  		.ip_ver = IP_VER(12, 55),
>  		.compute_exec = xehp_compute_exec,
> -		.compat = COMPAT_DRIVER_I915,
> +		.compat = COMPAT_DRIVER_I915 | COMPAT_DRIVER_XE,
>  	},
>  	{
>  		.ip_ver = IP_VER(12, 60),
> -- 
> 2.34.1
> 
