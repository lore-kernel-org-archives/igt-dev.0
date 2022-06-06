Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D267610EECA
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 11:03:31 +0000 (UTC)
Date: Mon, 6 Jun 2022 13:03:27 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <Yp3e/5tS+XYdzFpm@zkempczy-mobl2>
References: <20220606090511.26339-1-juhapekka.heikkila@gmail.com>
 <20220606090511.26339-2-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606090511.26339-2-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/intel_chipset: restore usage of
 has_flatccs flag
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

On Mon, Jun 06, 2022 at 12:05:11PM +0300, Juha-Pekka Heikkila wrote:
> When older patches had been merged on top of newer patches
> has_flatccs flag usage had gotten lost, put it back here.
> While at it also set has_flatccs flag to take only one bit
> since it is of boolean type.
> 
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/intel_chipset.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 815474086..de4749e14 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -41,7 +41,7 @@ struct intel_device_info {
>  	unsigned display_ver;
>  	unsigned gt; /* 0 if unknown */
>  	bool has_4tile : 1;
> -	bool has_flatccs;
> +	bool has_flatccs : 1;
>  	bool is_mobile : 1;
>  	bool is_whitney : 1;
>  	bool is_almador : 1;
> @@ -221,7 +221,6 @@ void intel_check_pch(void);
>  
>  #define HAS_4TILE(devid)	(intel_get_device_info(devid)->has_4tile)
>  
> -/* use HAS_4TILE here as all devices with 4-tile have flat ccs. */
> -#define HAS_FLATCCS(devid)	HAS_4TILE(devid)
> +#define HAS_FLATCCS(devid)	(intel_get_device_info(devid)->has_flatccs)

Uhm, dg1 has 4tile but this doesn't implicate it has flatccs, so:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  
>  #endif /* _INTEL_CHIPSET_H */
> -- 
> 2.28.0
> 
