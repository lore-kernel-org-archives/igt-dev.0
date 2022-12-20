Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF7D10E0DC
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Dec 2022 20:40:16 +0000 (UTC)
Date: Tue, 20 Dec 2022 21:40:13 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20221220204013.o6iiykwxrwzf5dxg@zkempczy-mobl2>
References: <20221220070717.4757-1-dominik.karol.piatkowski@intel.com>
 <20221220070717.4757-3-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220070717.4757-3-dominik.karol.piatkowski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/api_intel_allocator:
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

On Tue, Dec 20, 2022 at 08:07:17AM +0100, Dominik Karol Piatkowski wrote:
> It is safer to use intel_allocator_get_address_range than arbitrary
> hardcoded start offset that may be too low.
> 
> Signed-off-by: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
                                 ^
                                 +----- why there's missing ą?

--
Zbigniew

> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/api_intel_allocator.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index 87abd900..e9039a21 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -96,9 +96,10 @@ static void reserve_simple(int fd)
>  static void reserve(int fd, uint8_t type)
>  {
>  	struct test_obj obj;
> -	uint64_t ahnd, offset = 0x40000, size = 0x1000;
> +	uint64_t ahnd, offset, size = 0x1000;
>  
>  	ahnd = intel_allocator_open(fd, 0, type);
> +	intel_allocator_get_address_range(ahnd, &offset, NULL);
>  
>  	igt_assert_eq(intel_allocator_reserve(ahnd, 0, size, offset), true);
>  	/* try overlapping won't succeed */
> -- 
> 2.34.1
> 
