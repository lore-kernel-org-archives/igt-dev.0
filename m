Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71642C54E60
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 20:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BDF10EAA0;
	Wed, 13 Mar 2024 20:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="Y2AKXqoP";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA99010EAA0
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 20:00:16 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Tw1Zm2gYpzDqv2;
 Wed, 13 Mar 2024 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1710360016; bh=+QHzhg+HDD13OH5/GmVveqi2VTU4yv2obYF8eIp//1c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y2AKXqoPsTYnPpcCSk5Mz6k8T087kmT4MLX6InZF6r02EXm0VqccZARz64dP+VEod
 /H8h9t5fFTXezZSBlPFyrPUPlVud8+QOTnrg/yzX6Vy5BzDWjVzvxghM9AkXo1AXBE
 lvnUAMqHyB4Y2vg2qMSV/OlaRnmr2lXal0Idw/0M=
X-Riseup-User-ID: 941FB89D9832856083E6B8A964B36B86CF1828B6BC707588D33BFFF82D0A3FD8
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tw1Zk33Z6zFsjD;
 Wed, 13 Mar 2024 20:00:14 +0000 (UTC)
Message-ID: <f4805e54-8a34-42ce-9721-aa3502d57a05@riseup.net>
Date: Wed, 13 Mar 2024 17:00:11 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v2 1/4] lib/igt_kms: Add reflection name and mask
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
 <20240313-new_rotation-v2-1-6230fd5cae59@bootlin.com>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240313-new_rotation-v2-1-6230fd5cae59@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 13/03/24 14:09, Louis Chauvet wrote:
> As for IGT_ROTATION_MASK and igt_plane_rotation_name, create the mask
> IGT_REFLECT_MASK and the function igt_plane_reflect_name.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 23 +++++++++++++++++++++++
>  lib/igt_kms.h |  3 +++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e18f6fe59882..85d278f3cae3 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5142,6 +5142,29 @@ const char *igt_plane_rotation_name(igt_rotation_t rotation)
>  	}
>  }
>  
> +
> +/**
> + * igt_plane_reflect_name:
> + * @reflect: Plane reflection value (x, y)
> + *
> + * Returns: Plane reflection value as a string
> + */
> +const char *igt_plane_reflect_name(igt_rotation_t reflect)
> +{
> +	switch (reflect & IGT_REFLECT_MASK) {
> +	case 0:
> +		return "none";
> +	case IGT_REFLECT_X:
> +		return "X";
> +	case IGT_REFLECT_Y:
> +		return "Y";
> +	case IGT_REFLECT_X | IGT_REFLECT_Y:
> +		return "XY";
> +	default:
> +		igt_assert(0);
> +	}
> +}

I think it would be good to call this on igt_plane_set_rotation(), like
igt_plane_rotation_name() is, for debug purposes.

Best Regards,
~Arthur Grillo

> +
>  /**
>   * igt_plane_set_rotation:
>   * @plane: Plane pointer for which rotation is to be set
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b3882808b42f..4760394428f3 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -371,6 +371,8 @@ typedef enum {
>  
>  #define IGT_ROTATION_MASK \
>  	(IGT_ROTATION_0 | IGT_ROTATION_90 | IGT_ROTATION_180 | IGT_ROTATION_270)
> +#define IGT_REFLECT_MASK \
> +	(IGT_REFLECT_X | IGT_REFLECT_Y)
>  
>  /**
>   * igt_rotation_90_or_270:
> @@ -562,6 +564,7 @@ static inline bool igt_plane_has_rotation(igt_plane_t *plane, igt_rotation_t rot
>  	return (plane->rotations & rotation) == rotation;
>  }
>  const char *igt_plane_rotation_name(igt_rotation_t rotation);
> +const char *igt_plane_reflect_name(igt_rotation_t reflect);
>  
>  void igt_wait_for_vblank(int drm_fd, int crtc_offset);
>  void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count);
> 
