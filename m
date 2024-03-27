Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8758EC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 04:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1725910F808;
	Wed, 27 Mar 2024 04:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abxkkPhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0789410F808
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 04:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711515596; x=1743051596;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9uhRu9+FlNySUGdDsBEuQ0ziJNWiFE9JipkbuUdY4oM=;
 b=abxkkPhyARoFMNJKupvqXHa8aHKz0Oalt7rKhj6O9Vy47wp4M4MoL5qy
 6rsG5ed0tLAPnHa4uoTmOMTDe8j4qqeMLef9izLuYbBucEmoNnUnLH/P4
 x92xUABc3L12MycRCqXnewGYx+el5OPEQvH7PxkohGRFrRsgy4bF6Ix1+
 pfWGVY4al2FGyDQkAMpI8Qc7oYepQip0Uh8xBYhC2E3tLCbdtrK701f4V
 p5H68DxGGURWUmbri+EN2ovKAm7rzlDSRCmUs6PsS3t1/WcMcinlwIObd
 O+T2DJ9t74r/zcYY8JdvpX0lDCm0L9vpa8S3g6ZTJVp94q9u/Cv/rn2Cf Q==;
X-CSE-ConnectionGUID: v6NQb3ioRvasB+OANoUUSA==
X-CSE-MsgGUID: jCmBX0rCReuAWGgv6av7QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6707661"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6707661"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 21:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="16242325"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.47])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 21:59:54 -0700
Date: Wed, 27 Mar 2024 05:59:51 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [v4 2/3] lib/igt_draw: Sanitize the buffer data in the beginning
Message-ID: <20240327045951.ywswes3pyd3ljhrw@zkempczy-mobl2>
References: <20240326141422.13993-1-vandita.kulkarni@intel.com>
 <20240326141422.13993-3-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326141422.13993-3-vandita.kulkarni@intel.com>
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

On Tue, Mar 26, 2024 at 07:44:21PM +0530, Vandita Kulkarni wrote:
> Since now we have a new member in buffer data which is a
> pointer, we need to initialise the buf_ptr. If left uninitialised
> may contain garbage. Also may be used in wc write method if it is
> initialised to already mmapped buffer.
> 
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  lib/igt_draw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index a4d5f2f0e..5ad631f38 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -801,7 +801,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
>  	uint32_t devid = intel_get_drm_devid(fd);
>  	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
>  	struct intel_bb *ibb;
> -	struct buf_data tmp;
> +	struct buf_data tmp = {};
>  	int pixel_size = buf->bpp / 8;
>  
>  	igt_skip_on(!rendercopy);
> @@ -822,6 +822,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
>  	tmp.bpp = buf->bpp;
>  	tmp.width = rect->w;
>  	tmp.height = rect->h;
> +	tmp.buf_ptr = buf->buf_ptr;
>  	if (is_i915_device(fd))
>  		draw_rect_mmap_cpu(fd, &tmp, &(struct rect){0, 0, rect->w, rect->h},
>  				   I915_TILING_NONE, I915_BIT_6_SWIZZLE_NONE, color);
> -- 
> 2.43.2
> 

LGTM.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
