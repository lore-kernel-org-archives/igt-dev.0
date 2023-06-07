Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B3810E456
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 08:00:54 +0000 (UTC)
Date: Wed, 7 Jun 2023 10:00:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230607080050.si34kvlg7wl5nxnb@kamilkon-desk1>
References: <20230606184847.97018-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230606184847.97018-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_allocator: Fix missing
 alignment bug
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

On 2023-06-06 at 20:48:47 +0200, Zbigniew Kempczyński wrote:
> For helpers which don't pass alignment we must establish any positive
> value to move forward in RELOC allocator.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

lgtm,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_allocator.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index 45c1168ab5..8161221dbf 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -935,6 +935,9 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
>  
>  		igt_assert(xe_dev);
>  
> +		if (!default_alignment)
> +			req.open.default_alignment = xe_get_default_alignment(fd);
> +
>  		if (!end)
>  			req.open.end = 1ull << xe_dev->va_bits;
>  	}
> -- 
> 2.34.1
> 
