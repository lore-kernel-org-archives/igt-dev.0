Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B782610E1D9
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Sep 2023 19:06:18 +0000 (UTC)
Date: Tue, 19 Sep 2023 21:06:02 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Message-ID: <20230919190602.py3s2tfvmcvlcq3q@zkempczy-mobl2>
References: <20230919170230.3307408-1-jonathan.cavitt@intel.com>
 <20230919170230.3307408-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919170230.3307408-2-jonathan.cavitt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/intel_allocator: Limit last
 page if not reserved
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 10:02:30AM -0700, Jonathan Cavitt wrote:
> We currently limit the last page of the allocator space to avoid a hang
> on some platforms when a batch would be pinned in the last page.
> However, in the future, we may already be reserving the last page of the
> ppgtt in kernel space, so we would not need to limit the last page
> because gem_aperture_size would not report its existence in
> __intel_allocator_open_full when this is the case.
> 
> Check the gtt_size and only limit the last page if it's not already
> reserved by kernel space.  This is generalized to if the reported page
> count is even.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  lib/intel_allocator.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index f0a9b7fb53..fc7836dcee 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -53,12 +53,6 @@ static inline const char *reqstr(enum reqtype request_type)
>  #define bind_debug(...) {}
>  #endif
>  
> -/*
> - * We limit allocator space to avoid hang when batch would be
> - * pinned in the last page.
> - */
> -#define RESERVED 4096
> -
>  struct allocator {
>  	int fd;
>  	uint32_t ctx;
> @@ -941,11 +935,21 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
>  		if (!end) {
>  			igt_assert_f(can_report_gtt_size(fd), "Invalid fd\n");
>  			gtt_size = gem_aperture_size(fd);
> -			if (!gem_uses_full_ppgtt(fd))
> +			if (!gem_uses_full_ppgtt(fd)) {
>  				gtt_size /= 2;
> -			else
> -				gtt_size -= RESERVED;
> -
> +			} else {
> +				/*
> +				 * We limit allocator space to avoid hang when batch would be
> +				 * pinned in the last page.
> +				 *
> +				 * The last page is reserved when the gtt_size is aligned
> +				 * with an odd number of pages.
> +				 */
> +				uint64_t align = gtt_size % (SZ_4K * 2);
> +				align += SZ_4K;
> +				align %= (SZ_4K * 2);
> +				gtt_size -= align;
> +			}

If you're afraid you're entering danger zone from ppgtt perspective
from IGTs just increase RESERVED to 8K/16K/32K/... (pick appropriate).
Most IGTs don't care where's the limit of vm. If test will need to
exercise those offsets it has api to increase end to real gtt size
and play with those offsets.

--
Zbigniew

>  			req.open.end = gtt_size;
>  		}
>  
> -- 
> 2.25.1
> 
