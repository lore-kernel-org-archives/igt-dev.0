Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B5110E110
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 07:58:18 +0000 (UTC)
Date: Mon, 19 Dec 2022 08:58:14 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20221219075814.qb46pmfn3rbak6fy@zkempczy-mobl2>
References: <20221214072944.3492-1-dominik.karol.piatkowski@intel.com>
 <20221214072944.3492-4-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221214072944.3492-4-dominik.karol.piatkowski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/i915/api_intel_allocator:
 Fixed start offset
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

On Wed, Dec 14, 2022 at 08:29:43AM +0100, Dominik Karol Piatkowski wrote:
> On some platforms it may be required to use safe start offset
> instead of hardcoded one.
> 
> Signed-off-by: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/api_intel_allocator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index 87abd900..cf401176 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -96,7 +96,7 @@ static void reserve_simple(int fd)
>  static void reserve(int fd, uint8_t type)
>  {
>  	struct test_obj obj;
> -	uint64_t ahnd, offset = 0x40000, size = 0x1000;
> +	uint64_t ahnd, offset = gem_detect_safe_start_offset(fd), size = 0x1000;

Isn't better would be to use intel_allocator_get_address_range() here?
Above will work because we're not executing anything, but I still see
mismatch between offset and allocator start offset which will be aligned
to safe alignment (patches 1/4 and 2/4). Start offset detected here may
be less than aligned start established during intel_allocator_open().

--
Zbigniew

>  
>  	ahnd = intel_allocator_open(fd, 0, type);
>  
> -- 
> 2.34.1
> 
