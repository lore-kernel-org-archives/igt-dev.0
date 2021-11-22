Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAEF6E1BE
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Nov 2021 08:15:05 +0000 (UTC)
Date: Mon, 22 Nov 2021 09:15:01 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211122081501.GA7458@zkempczy-mobl2>
References: <20211122064849.785894-1-apoorva1.singh@intel.com>
 <20211122064849.785894-3-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211122064849.785894-3-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v2 2/3] lib/intel_chipset.h: Add has_flat_ccs flag
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 12:18:48PM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add a new platform flag, has_flat_ccs, for platforms
> supporting Flat CCS.
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  lib/intel_chipset.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 2b795527..d2719932 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -40,6 +40,7 @@ struct intel_device_info {
>  	unsigned graphics_ver;
>  	unsigned display_ver;
>  	unsigned gt; /* 0 if unknown */
> +	bool has_flat_ccs : 1;
>  	bool is_mobile : 1;
>  	bool is_whitney : 1;
>  	bool is_almador : 1;
> @@ -209,4 +210,6 @@ void intel_check_pch(void);
>  				   IS_CHERRYVIEW(devid) || \
>  				   IS_BROXTON(devid)))
>  
> +#define HAS_FLAT_CCS(devid)	(intel_get_device_info(devid)->has_flat_ccs)
> +

This will require explicit define line for newer gens - I got nothing
against it (I see no better solution right now). I've not found dg2
definition so above series is a little bit dead code now and we got
no possibility to test it on CI. Anyway:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 

>  #endif /* _INTEL_CHIPSET_H */
> -- 
> 2.25.1
> 
