Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF93F506E0
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 14:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D995E10E23C;
	Mon, 16 Mar 2026 14:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OI74sMn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FF710E58D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773672290; x=1805208290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eIo2C3RaX3Uw66hkUV6yvaQfpd9fLM9Yy8n7o8au+nc=;
 b=OI74sMn4Y20xUI7dK1UKuXzz6ddkDZwewiP0io3ZjTRzkRV9RpKrbCwJ
 4MsNHup8MyIEe6lU48luElBgU6oo/vrJNXelM3vCF4NtsIECiiHxSdB5+
 JUAcZ2fb/Cp/a95/XNAk24EudH6veEf4CStT75fq2/YUeXz85C7Duwq3A
 Rukv7QOxGIPgHIOi7DaiD7BuV/qNdGMX8Pag2awN1sRnzLeeg/GXFyjy3
 owEbpDrIpYx14+LFJs7a2h9BJbtVwYVZHi9T6vSFnIo/JWx65hpYprRhB
 3isWCb9Et65aAACIHm4NsZqJijo5Jta16AeAlDN6fe+DtICQEFW2CwAY/ Q==;
X-CSE-ConnectionGUID: Qq+ibSVHRZKZqsu6tD3sxg==
X-CSE-MsgGUID: 9yLurSuaR6yqgGBMrb250g==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77298239"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="77298239"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 07:44:49 -0700
X-CSE-ConnectionGUID: lLySZaAIR/q6LH7jd5gZww==
X-CSE-MsgGUID: eNB7Q+SQT42eB+2wNg6sng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="220979672"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.42])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 07:44:48 -0700
Date: Mon, 16 Mar 2026 16:44:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, ramanaidu.naladala@intel.com
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier
 when supported
Message-ID: <abgWhvmToId2i7mj@intel.com>
References: <20260316033807.24078-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316033807.24078-1-jeevan.b@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, Mar 16, 2026 at 09:08:07AM +0530, Jeevan B wrote:
> While creating the framebuffer, prefer tile4 when it is supported
> instead of always using linear. Fall back to linear if tile4 is not
> available.

Why?

> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 5399ef481..4c4e477a1 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -367,15 +367,21 @@ static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
>  {
>  	drmModeModeInfoPtr mode;
>  	igt_plane_t *primary;
> +	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>  
>  	igt_output_set_crtc(output, crtc);
>  	mode = igt_output_get_mode(output);
>  
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	if (igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
> +				     I915_FORMAT_MOD_4_TILED))
> +		modifier = I915_FORMAT_MOD_4_TILED;
> +
>  	igt_create_pattern_fb(display->drm_fd,
>  		      mode->hdisplay, mode->vdisplay,
> -		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb_info);
> +		      DRM_FORMAT_XRGB8888, modifier, fb_info);
>  
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, fb_info);
>  }
>  
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
