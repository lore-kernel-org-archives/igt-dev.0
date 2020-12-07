Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDD489E9B
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Dec 2020 08:23:01 +0000 (UTC)
Date: Mon, 7 Dec 2020 09:22:56 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201207082256.GA3532@zkempczy-mobl2>
References: <20201206121045.263779-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201206121045.263779-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_gpgpu_fill: Add test
 description
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
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Dec 06, 2020 at 05:40:45PM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add description for the test
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_gpgpu_fill.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
> index c605629f..3356892d 100644
> --- a/tests/i915/gem_gpgpu_fill.c
> +++ b/tests/i915/gem_gpgpu_fill.c
> @@ -47,6 +47,8 @@
>  #include "igt.h"
>  #include "intel_bufops.h"
>  
> +IGT_TEST_DESCRIPTION("Test for the gpgpu fill function - a very simple workload for the GPGPU pipeline");
> +

Maybe "Verify surface is filled correctly using GPGPU pipeline"?

--
Zbigniew 


>  #define WIDTH 64
>  #define HEIGHT 64
>  #define STRIDE (WIDTH)
> -- 
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
