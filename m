Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB65CD74941
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 22:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944B410E733;
	Tue, 29 Oct 2024 22:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbrXxSzY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C3E10E723
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 22:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730239343; x=1761775343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CY+qyS/7zJ7zCAgBbvO9NJWNFCpzBGFT1G0/FFyCsiU=;
 b=bbrXxSzY9nKL089bxQyPMEPptgUL2laoCXgrf0qBo6ImjvlHok2bZlzH
 rO18sZ7uhACDP5/o1nxzAmc1xmRqLhzyS491fTdVU5/ptcOrWCzwl6onv
 hyjb8ARpDCGCYH8VhK4gB5NGICoOgp2IAWrx/+ZtYIHCxYa51B3jWUsUZ
 64bPdRz7F/gCGsDoqhosk0r2tZ+KVBpG8TaXb5W1ZH3RnplwVL2D+H3PU
 Wp8v7FoVh0jsmvCqzMpRRWfR44PnltFJNJ0y0fZ5Qz+LwDmanY+vRX7HK
 6KVqAUr4UApaWG+aYXj2mhJ1vRSwPqLf/CHrTeLFvlGqbGWlf6CXhnpVJ A==;
X-CSE-ConnectionGUID: fDo1pKXaQNucwO4+Zu6J8A==
X-CSE-MsgGUID: CUTBsc6BQv+2k1nO4kIT2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29812529"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="29812529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 15:02:10 -0700
X-CSE-ConnectionGUID: SHjYdKtTR72dZ0CBu6T7Cg==
X-CSE-MsgGUID: GNNDqcaYQwCNMQ99MFULqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="82202773"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 29 Oct 2024 15:02:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 30 Oct 2024 00:02:06 +0200
Date: Wed, 30 Oct 2024 00:02:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org,
 "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_rotation_crc: Intel display version
 20 onwards doesn't do hflip with tile4
Message-ID: <ZyFbXl06g_94aoNy@intel.com>
References: <20241022094744.3884409-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241022094744.3884409-1-juhapekka.heikkila@gmail.com>
X-Patchwork-Hint: comment
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

On Tue, Oct 22, 2024 at 12:47:44PM +0300, Juha-Pekka Heikkila wrote:
> On Intel display version 20 Tile4 no longer can be used with horizontal
> flip.
> 
> Bspec: 69853
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_rotation_crc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 9888ac6ac..d4a1c91cc 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -639,6 +639,14 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>  			    !IS_CHERRYVIEW(data->devid) ||
>  			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
>  
> +		/* Intel display version 20 onwards cannot do reflect-x with
> +		 * tile4
> +		 */
> +		igt_require(!is_intel_device(data->gfx_fd) ||
> +			    intel_display_ver(data->devid) < 20 ||
> +			    !(data->override_modifier == I915_FORMAT_MOD_4_TILED &&
> +			    data->rotation & IGT_REFLECT_X));
> +

This place is getting rather cluttered. Can you extract all the
igt_require() conditions here into a separate function so we'd
just be left with something like
 igt_require(plane_can_rotate(...)); ?

>  		prepare_crtc(data, output, pipe, plane, true);
>  
>  		for (i = 0; i < num_rectangle_types; i++) {
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
