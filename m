Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AC5D2CDFA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 16:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22FB10E6BE;
	Tue, 22 Oct 2024 16:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPccr2yG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEAA10E6BE
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729614089; x=1761150089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+U0RvnNwaZ5uF6cwF/5mtRljVNbJffg7lLdgkBRWN4o=;
 b=aPccr2yGhJoPmJyCOut5+olKbWMozNHuNqqrvraEpmp30rDqdfqC0yGY
 /zH+9XDpwaVGl0bEKIEjv4t7JiX2K5juqAOSr0kTNRGqItoyuzAyNm+KB
 2Zxky4FG/1F47VIHEMYEYCCoUr6mGmsTMTqXZ/GD+Ge66ni4da0LOEsy5
 5J+yo9ov/pHxKMfs54vOETMwOOzXxlFC5RZXf/qDPOsOTNIsPp+/S6dKL
 rea7MlPI3ZGftlVC2gNOT+0ODF1AZcguytQ6uiTvaEAlJACwLa6CyI+wB
 zF13TjlcZiGuZKAZwdR2aH8KHy2Paf/vv2GSNJW23idvSTaSMiwG/pyQl w==;
X-CSE-ConnectionGUID: IgLhbUfRT5Ou/5wnqXU60Q==
X-CSE-MsgGUID: ozZKwXOWSoWehbd3/5Euuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40536969"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="40536969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 09:21:28 -0700
X-CSE-ConnectionGUID: H0chMGhURx2nQ5IV6UPrzw==
X-CSE-MsgGUID: PMxBXACbTFOrBWPdw8WslA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="103214890"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 09:21:27 -0700
Date: Tue, 22 Oct 2024 18:21:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 11/14] lib/rendercopy: Use igt_require() to
 validate gen2/3 surface size
Message-ID: <20241022162125.3mghv55bznb25tpg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-12-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004104121.32750-12-ville.syrjala@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Ville,
On 2024-10-04 at 13:41:18 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> gen2/3 render engine has a max surface size 2kx2k. That is
> pretty easy to hit accidentally. Rather than exploding with
> an assert it seems better to just gracefully skip the test.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/rendercopy_i830.c | 8 ++++----
>  lib/rendercopy_i915.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/rendercopy_i830.c b/lib/rendercopy_i830.c
> index 4b0ea3b859e2..ced4a84a23e8 100644
> --- a/lib/rendercopy_i830.c
> +++ b/lib/rendercopy_i830.c
> @@ -139,8 +139,8 @@ static void gen2_emit_target(struct intel_bb *ibb,
>  	uint32_t format;
>  
>  	igt_assert_lte(dst->surface[0].stride, 8192);
> -	igt_assert_lte(intel_buf_width(dst), 2048);
> -	igt_assert_lte(intel_buf_height(dst), 2048);
> +	igt_require(intel_buf_width(dst) <= 2048);
> +	igt_require(intel_buf_height(dst) <= 2048);
>  
>  	switch (dst->bpp) {
>  		case 8: format = COLR_BUF_8BIT; break;
> @@ -184,8 +184,8 @@ static void gen2_emit_texture(struct intel_bb *ibb,
>  	uint32_t format;
>  
>  	igt_assert_lte(src->surface[0].stride, 8192);
> -	igt_assert_lte(intel_buf_width(src), 2048);
> -	igt_assert_lte(intel_buf_height(src), 2048);
> +	igt_require(intel_buf_width(src) <= 2048);
> +	igt_require(intel_buf_height(src) <= 2048);
>  
>  	switch (src->bpp) {
>  		case 8: format = MAPSURF_8BIT | MT_8BIT_L8; break;
> diff --git a/lib/rendercopy_i915.c b/lib/rendercopy_i915.c
> index 94cdfb99af9a..2095a7c14b26 100644
> --- a/lib/rendercopy_i915.c
> +++ b/lib/rendercopy_i915.c
> @@ -93,8 +93,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
>  		uint32_t format_bits, tiling_bits = 0;
>  
>  		igt_assert_lte(src->surface[0].stride, 8192);
> -		igt_assert_lte(intel_buf_width(src), 2048);
> -		igt_assert_lte(intel_buf_height(src), 2048);
> +		igt_require(intel_buf_width(src) <= 2048);
> +		igt_require(intel_buf_height(src) <= 2048);
>  
>  		if (src->tiling != I915_TILING_NONE)
>  			tiling_bits = MS3_TILED_SURFACE;
> @@ -136,8 +136,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
>  		uint32_t format_bits;
>  
>  		igt_assert_lte(dst->surface[0].stride, 8192);
> -		igt_assert_lte(intel_buf_width(dst), 2048);
> -		igt_assert_lte(intel_buf_height(dst), 2048);
> +		igt_require(intel_buf_width(dst) <= 2048);
> +		igt_require(intel_buf_height(dst) <= 2048);
>  
>  		switch (dst->bpp) {
>  			case 8: format_bits = COLR_BUF_8BIT; break;
> -- 
> 2.45.2
> 
