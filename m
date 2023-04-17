Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A3510E40A
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Apr 2023 10:57:11 +0000 (UTC)
Date: Mon, 17 Apr 2023 12:57:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230417105706.pyzocygeqkpitjdc@zkempczy-mobl2>
References: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
 <20230413162732.1155058-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413162732.1155058-2-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 1/7] lib/intel_bufops: Fix bops creation to
 support XE
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

On Thu, Apr 13, 2023 at 09:57:26PM +0530, Bhanuprakash Modem wrote:
> As XE won't support tiling, fix the bops creation logic to
> support XE device.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

No, we want to do software tiling here.

I'm going to enablement series today.

--
Zbigniew

> ---
>  lib/intel_bufops.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index cdc7a1698b2..81f7b951813 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -1423,6 +1423,25 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>  	igt_debug("generation: %d, supported tiles: 0x%02x\n",
>  		  bops->intel_gen, bops->supported_tiles);
>  
> +	/* No tiling support in XE. */
> +	if (is_xe_device(fd)) {
> +		bops->supported_tiles = TILE_NONE;
> +		bops->supported_hw_tiles = TILE_NONE;
> +
> +		bops->linear_to_x = NULL;
> +		bops->x_to_linear = NULL;
> +		bops->linear_to_y = NULL;
> +		bops->y_to_linear = NULL;
> +		bops->linear_to_tile4 = NULL;
> +		bops->tile4_to_linear = NULL;
> +		bops->linear_to_yf = NULL;
> +		bops->yf_to_linear = NULL;
> +		bops->linear_to_ys = NULL;
> +		bops->ys_to_linear = NULL;
> +
> +		return bops;
> +	}
> +
>  	/*
>  	 * Warning!
>  	 *
> -- 
> 2.40.0
> 
