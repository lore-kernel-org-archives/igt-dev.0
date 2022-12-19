Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFB310E205
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 07:52:20 +0000 (UTC)
Date: Mon, 19 Dec 2022 08:52:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20221219075217.s6kyqga53tnxq3gl@zkempczy-mobl2>
References: <20221214072944.3492-1-dominik.karol.piatkowski@intel.com>
 <20221214072944.3492-5-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221214072944.3492-5-dominik.karol.piatkowski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/i915/api_intel_allocator:
 Fixed start alignment
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

On Wed, Dec 14, 2022 at 08:29:44AM +0100, Dominik Karol Piatkowski wrote:
> On some platforms it may be required to use aligned start address.
> 
> Signed-off-by: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/api_intel_allocator.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index cf401176..c9fe881c 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -50,6 +50,7 @@ static void alloc_simple(int fd)
>  	igt_assert(!freed);
>  
>  	intel_allocator_get_address_range(ahnd, &start, &end);
> +	start = ALIGN(start, gem_detect_safe_alignment(fd));

Is this patch is necessary? According to patches 1/4 and 2/4 I think
start in allocator is already aligned, so intel_allocator_get_address_range()
should set &start and &end accordingly.

--
Zbigniew

>  	offset0 = intel_allocator_alloc(ahnd, 1, end - start, 0);
>  	offset1 = __intel_allocator_alloc(ahnd, 2, 4096, 0, ALLOC_STRATEGY_NONE);
>  	igt_assert(offset1 == ALLOC_INVALID_ADDRESS);
> -- 
> 2.34.1
> 
