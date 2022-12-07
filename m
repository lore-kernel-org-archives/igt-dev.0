Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC350899A3
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Dec 2022 11:35:04 +0000 (UTC)
Date: Wed, 7 Dec 2022 12:35:00 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20221207113500.mkcofrteow2ek4px@zkempczy-mobl2>
References: <20221207110232.3305-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221207110232.3305-1-dominik.karol.piatkowski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_allocator: Fixed start offset
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

On Wed, Dec 07, 2022 at 12:02:32PM +0100, Dominik Karol Piatkowski wrote:
> Fixed start offset in __intel_allocator_open_full.
> 
> Signed-off-by: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_allocator.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index 717d7fc5..4525ba97 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -913,6 +913,9 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
>  	struct alloc_resp resp;
>  	uint64_t gtt_size;
>  
> +	if (!start)
> +		req.open.start = gem_detect_safe_start_offset(fd);
> +
>  	if (!end) {
>  		igt_assert_f(can_report_gtt_size(fd), "Invalid fd\n");
>  		gtt_size = gem_aperture_size(fd);
> -- 
> 2.34.1
>

Please join both patches to single series, and add description
why we need to fix this. 

--
Zbigniew 
