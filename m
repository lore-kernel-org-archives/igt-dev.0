Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE7810E63D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 16:28:49 +0000 (UTC)
Date: Wed, 10 Jan 2024 17:28:43 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: janga.rahul.kumar@intel.com
Subject: Re: [PATCH i-g-t] lib/intel_compute: Fix incorrect check for opencl
 kernel support
Message-ID: <20240110162843.wjtqhz6pgokkwjb5@zkempczy-mobl2>
References: <20240110065353.2271236-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110065353.2271236-1-janga.rahul.kumar@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 12:23:53PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Skip compute tests on platforms which doesn't have a opencl
> kernel defined in the library.
> 
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  lib/intel_compute.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 1f1c79fd3..b092e5d85 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1430,7 +1430,7 @@ static bool __run_intel_compute_kernel(int fd,
>  		kernels++;
>  	}
>  	if (!kernels->kernel)
> -		return 1;
> +		return 0;

As function returns bool, may you switch this to false? With this:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  
>  	intel_compute_batches[batch].compute_exec(fd, kernels->kernel,
>  						  kernels->size, eci);
> -- 
> 2.25.1
> 
