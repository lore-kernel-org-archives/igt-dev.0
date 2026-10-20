Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54305606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=haBCI/Xw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0DE10E1BA;
	Tue, 20 Oct 2026 10:57:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F6789A5C
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792493813; x=1824029813;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sxPwltPEQT8wXUNiveu7ReO0mn/q3pSexGwa4PGjymU=;
 b=haBCI/Xw2biA6gtXGBJjpkhIhDiYcSxjeAcFtPOb4ozYefeTIfhlOWzt
 KacuHemW5/rdrh9hRhIg1sPMz5G2T0iKv2df0xzxdidbLXQHyXnDPaxAL
 oLgEO6id6w/rFVgxFH2aB847bA6SFXQM5eL+CVmZjOOxMe1AcyRRzjSwI
 lKPlfMfK5UALPjow3u1O72k+MsEpUX9NN/1TFlZ8xl75FK9yTW1HMhubZ
 x7EthRQOO8NmyzOQVjX2h777jzAJZSPD9jLpxJls34DB6k6nQCHs6Hase
 B0K2QUQhqYEXkz9iJnvu3kRKyIGYTE+DHQ3eTKjP65mQ0phpVJ+m90UQ3 Q==;
X-CSE-ConnectionGUID: e8pt0cyfRQOt9auZI8VBeg==
X-CSE-MsgGUID: t3ActoJ8T3CHi1O0TtSqGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1083066"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1083066"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 03:56:53 -0700
X-CSE-ConnectionGUID: rVxYzyc2QseWWd614XAoNg==
X-CSE-MsgGUID: VqItrdbuS5atWik1GkEYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4570948"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 03:56:52 -0700
Date: Tue, 20 Oct 2026 12:56:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] lib/gpu_cmds: use proper surface format for all platforms
Message-ID: <20261020105648.3uerun3eqj3mvguz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20261019-bpp_surface_fix-v1-1-c030fa182e3a@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-bpp_surface_fix-v1-1-c030fa182e3a@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrzej,
On 2026-10-19 at 19:23:31 +0200, Andrzej Hajda wrote:
> On older platforms (< 2.0) SURFACEFORMAT_R8_UNORM was used always,
> regardless of bpp, as it does not matter for media block send messages.
> Since 2.0 format reflecting bpp is required. The code was adjusted
> only for newer platforms, conditionals were added suggesting this is
> kind-of-workaround. The patch removes these conditionals, there is no
> point to keep them and perform cargo cult on new code.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> The patch was tested succesfully on ADL-S.
> ---
>  lib/gpu_cmds.c | 58 ++++++++++++++++++++++------------------------------------
>  1 file changed, 22 insertions(+), 36 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 7a72166a0ec6..db308b8e4726 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -298,53 +298,39 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  	return offset;
>  }
>  
> +static uint32_t fill_surface_state(struct intel_bb *ibb,
> +				   struct intel_buf *buf,
> +				   uint32_t format,
> +				   int is_dst)
> +{
> +	unsigned int gfx_ver = intel_graphics_ver(intel_get_drm_devid(ibb->fd));
> +
> +	return (gfx_ver >= IP_VER(12, 50) ? xehp_fill_surface_state :
> +		gfx_ver >= IP_VER(9, 0) ? gen9_fill_surface_state :
> +		gfx_ver >= IP_VER(8, 0) ? gen8_fill_surface_state :
> +		gen7_fill_surface_state)(ibb, buf, format, is_dst);
> +}
> +
>  static uint32_t
>  fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>  {
>  	uint32_t binding_table_offset;
>  	uint32_t *binding_table;
> -	uint32_t devid = intel_get_drm_devid(ibb->fd);
> +	uint32_t format;
>  
>  	intel_bb_ptr_align(ibb, 64);
>  	binding_table_offset = intel_bb_offset(ibb);
>  	binding_table = intel_bb_ptr(ibb);
>  	intel_bb_ptr_add(ibb, 64);
>  
> -	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> -		/*
> -		 * Up until now, SURFACEFORMAT_R8_UNROM was used regardless of the 'bpp' value.
> -		 * For bpp 32 this results in a surface that is 4x narrower than expected. However
> -		 * it worked, because the 'Media Block Read/Write' message assumes the surface width
> -		 * is always in units of dwords.
> -		 *
> -		 * Since Xe2 the Media Block Write message got replaced with 'Typed 2D Block
> -		 * Load/Store Message' which correctly interprets the surface format.
> -		 */
> -		if (buf->bpp == 32)
> -			binding_table[0] = xehp_fill_surface_state(ibb, buf,
> -								      SURFACEFORMAT_R8G8B8A8_UNORM,
> -								      1);
> -		else if (buf->bpp == 8)
> -			binding_table[0] = xehp_fill_surface_state(ibb, buf,
> -								      SURFACEFORMAT_R8_UNORM,
> -								      1);
> -		else
> -			igt_assert_f(false,
> -				     "Surface state for bpp = %u not implemented",
> -				     buf->bpp);
> -	} else if (intel_graphics_ver(devid) >= IP_VER(12, 50)) {
> -		binding_table[0] = xehp_fill_surface_state(ibb, buf,
> -							   SURFACEFORMAT_R8_UNORM, 1);
> -	} else if (intel_graphics_ver(devid) >= IP_VER(9, 0)) {
> -		binding_table[0] = gen9_fill_surface_state(ibb, buf,
> -							   SURFACEFORMAT_R8_UNORM, 1);
> -	} else if (intel_graphics_ver(devid) >= IP_VER(8, 0)) {
> -		binding_table[0] = gen8_fill_surface_state(ibb, buf,
> -							   SURFACEFORMAT_R8_UNORM, 1);
> -	} else {
> -		binding_table[0] = gen7_fill_surface_state(ibb, buf,
> -							   SURFACEFORMAT_R8_UNORM, 1);
> -	}
> +	if (buf->bpp == 32)
> +		format = SURFACEFORMAT_R8G8B8A8_UNORM;
> +	else if (buf->bpp == 8)
> +		format = SURFACEFORMAT_R8_UNORM;
> +	else
> +		igt_assert_f(false, "Surface state for bpp = %u not implemented", buf->bpp);
> +
> +	binding_table[0] = fill_surface_state(ibb, buf, format, 1);
>  
>  	return binding_table_offset;
>  }
> 
> ---
> base-commit: e171f5e98b9938f41790074d014fed417ace25c8
> change-id: 20261019-bpp_surface_fix-04efc0e9ce7d
> 
> Best regards,
> --  
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
