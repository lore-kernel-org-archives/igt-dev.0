Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0986606A320
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BdaQne/B
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37F910EB7E;
	Tue, 20 Oct 2026 10:11:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC6C10F4A0
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792491064; x=1824027064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fTwXo7fJ2KYD1jeCNWFu+GEe8nHUTk86OawJYzpLiuY=;
 b=BdaQne/BbZ0+UmL8YFJ77fpwofw1t2k3r0TyFWMxoMTnmsly/nwp498A
 SBOle6HQjlYuwfcfIv25VMyPMMT49x18HJVbcunv09/8Oke1IwfCHrOGq
 mvSwDX5gWcSmdG2jpZC9PnbHYxMW+dwg7p+CCOQRhy9b16n1uzGWFZQJ7
 VEeh4uvYrH7dQgItcWcnOwVzPhFjMPF8ABVp2irA+QJBwZuLCYl4vqrHm
 fbFKe9y/phcSYv2oVf2qSZtRnH6cStNqkq4A1OtAny11TaOgigTwkQllE
 89x2a6CYoUWlUPySu5vKEPKMj+chZDUH0CVekRRE4LBJVuLnemFJN+fVH A==;
X-CSE-ConnectionGUID: 1hO5eQ/LRFurJr60WBgRtw==
X-CSE-MsgGUID: z/Z++TQASl6vC2kWkdFYSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1205592"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1205592"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 03:11:03 -0700
X-CSE-ConnectionGUID: wnaLhnyfRaS7JO3qNE6bvA==
X-CSE-MsgGUID: +nhPOxoERUmHlGPS48x8tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3126637"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 03:11:02 -0700
Date: Tue, 20 Oct 2026 12:10:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 9/9] tests/kms_plane_scaling: remove legacy
 subtests covered by max-crc tests
Message-ID: <20261020101045.kgha543o2oehhuhe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
 <20261015131616.3172918-9-juhapekka.heikkila@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015131616.3172918-9-juhapekka.heikkila@gmail.com>
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

Hi Juha-Pekka,
On 2026-10-15 at 16:16:16 +0300, Juha-Pekka Heikkila wrote:
> The plane-*-max-crc subtests search scaling limits kernel actually accepts
> for each pixel format, modifier and rotation, on all pipes, for primary
> and overlay planes alone and together, and verify result with crc. Legacy
> subtests below only checked that commit with fixed scaling factor was
> accepted, skipping on -EINVAL or -ERANGE, so they never
> verified the scaled output.
> 
> The first three removed groups each had six variants: upscale-20x20,
> upscale-factor-0-25, downscale-factor-0-25, downscale-factor-0-5,
> downscale-factor-0-75 and scaler-unity-scaling.
> 
> plane-*-with-pixel-format
>   Covered by plane-{up/down}scale-max-crc-linear, which tests every
>   format at largest accepted factor and checks the crc.
>   Unity scaling is reference commit of each max-crc step.
> 
> plane-*-with-modifiers
>   Covered by per modifier plane-{up/down}scale-max-crc-* subtests.
> 
> plane-*-with-rotation
>   Linear XRGB8888 walking rotations 0, 90, 180, 270 and returning on the
>   first rejected commit. Where 90 is advertised it is rejected with
>   linear, so only rotation 0 was ever exercised; Covered by
>   plane-{up/down}scale-max-crc-* and plane-{up/down}scale-max-crc-rotation-*.
> 
> planes-* (24 subtests)
>   Covered by primary+overlay step of the max-crc subtests, which scales
>   both planes at their limits at the same time on pipes with at least
>   two scalers and compares against both planes unscaled.
> 
> Assisted-by: Claude:claude-opus-5

Recent consensus is to drop Assisted-by ... any LLM model ...
from git history, and if any, move it after '---' line below.



Regards,
Kamil

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_scaling.c | 697 --------------------------------------
>  1 file changed, 697 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 176ab6b65..7e7155ccd 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -36,144 +36,14 @@
>  #include <math.h>
>  
[cut]
