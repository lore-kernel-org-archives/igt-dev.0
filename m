Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521EF606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oDJPuq1Y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDED310E97E;
	Thu, 26 Nov 2026 16:06:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF89112595
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 16:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795709151; x=1827245151;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QADK1msJCAKIfcH6Ymj77qGMk/9jsKGT7+yKY3GH+lE=;
 b=oDJPuq1YO8gI89kgV10W4Ud8sXnH3WdcGTQPpCh/K/7IctOXxxZSkp/3
 XinXTXzHtMOnv1PKLL9keOXUgnFM/uHe+zKxy+oQbk/xoOFO/I+23dYo0
 vtTPbCc+3bBSdoTvCKQNDQgsLc/vT+TaUYoRLe6cx6M6OVqg0JEc3sfoF
 FSFr8fD8wxh4ICiG3VMuUr/OPPewlLVs+rFDyFtLd1UYkQPQLTWFQSjv1
 8k5pUnFqkG5LZAlngnUQU6fsh24QsvXTiSOfEQJ7WfecSMnfBSN7yBmzO
 S6JOAhV3GELhNx/qBiydOM9vrwVKk+KEGWAUN4JSDG1twlC8CIFdyChuB g==;
X-CSE-ConnectionGUID: Z9RINGGuRZSl3P689Otgbg==
X-CSE-MsgGUID: xjAxnX4STPePsMxQtQlyRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4640940"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4640940"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:05:50 -0800
X-CSE-ConnectionGUID: qBL47AN8T2CKHLtHk5vZWw==
X-CSE-MsgGUID: /tj/m+zuT1WjuVkuq2xMAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12204812"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:05:49 -0800
Date: Thu, 26 Nov 2026 17:05:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Roy <rongh7426@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_vblank: Query the pipe under test in the
 invalid subtest
Message-ID: <xjx4kosx3uvfjxcd7p5cyvrxussrevfx6vu7tlm3wk57iwvvkz@zkhxj6rqxyrz>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Roy <rongh7426@gmail.com>, igt-dev@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>
References: <20261126030034.641144-1-rongh7426@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261126030034.641144-1-rongh7426@gmail.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Roy,
On 2026-11-26 at 11:00:34 +0800, Roy wrote:
> invalid_subtest() sets up data->crtc but builds its vblank requests
> without the pipe flag, so every request goes to CRTC 0. The other
> subtests add igt_crtc_get_vbl_flag(data->crtc).
> 
> That breaks on hardware where the output under test can't be driven by
> CRTC 0. On a Raspberry Pi 5 (vc4), HDMI-A-1 only works with pipe C, so
> CRTC 0 is off and the first, valid query already fails:
> 
>   Starting dynamic subtest: pipe-C-HDMI-A-1
>   (kms_vblank) CRITICAL: Failed assertion: wait_vblank(fd, &vbl) == 0
>   (kms_vblank) CRITICAL: Last errno: 22, Invalid argument
>   Subtest invalid: FAIL
> 
> The invalid-flag checks after it have the same problem: with CRTC 0
> off, an -EINVAL can't tell a rejected flag from a CRTC that isn't
> running.
> 
> Add the pipe flag to the valid query and to the invalid-flag checks.
> The final check, which asks for an out-of-range pipe on purpose, is
> left as is.
> 
> Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39): the
> invalid subtest fails before and passes after.
> 
> This change and its description were written with the help of an AI
> coding assistant (Claude); the test runs above were done on real
> hardware.

Please do not add this in description, rather than here,
better place to move it after '---' below. No need for
resend unless you want to change something, for example
your s-o-b below.

> 
> Signed-off-by: Roy <rongh7426@gmail.com>

I would prefer here

Signed-off-by: Roy replace_with_your_Lastname <rongh7426@gmail.com>

but it is up to you, it can also go with short name.

Regards,
Kamil

> ---
>  tests/kms_vblank.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 47b733a..018bc6f 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -582,12 +582,14 @@ static void invalid_subtest(data_t *data, int fd)
>  	union drm_wait_vblank vbl;
>  	unsigned long valid_flags;
>  	igt_output_t *output = data->output;
> +	uint32_t crtc_flag;
>  
>  	prepare_crtc(data, fd, output);
> +	crtc_flag = igt_crtc_get_vbl_flag(data->crtc);
>  
>  	/* First check all is well with a simple query */
>  	memset(&vbl, 0, sizeof(vbl));
> -	vbl.request.type = _DRM_VBLANK_RELATIVE;
> +	vbl.request.type = _DRM_VBLANK_RELATIVE | crtc_flag;
>  	igt_assert_eq(wait_vblank(fd, &vbl), 0);
>  
>  	valid_flags = (_DRM_VBLANK_TYPES_MASK |
> @@ -596,7 +598,7 @@ static void invalid_subtest(data_t *data, int fd)
>  
>  	/* pick some interesting invalid permutations */
>  	memset(&vbl, 0, sizeof(vbl));
> -	vbl.request.type = _DRM_VBLANK_RELATIVE | ~valid_flags;
> +	vbl.request.type = _DRM_VBLANK_RELATIVE | crtc_flag | ~valid_flags;
>  	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
>  	for (int bit = 0; bit < 32; bit++) {
>  		int err;
> @@ -605,7 +607,7 @@ static void invalid_subtest(data_t *data, int fd)
>  			continue;
>  
>  		memset(&vbl, 0, sizeof(vbl));
> -		vbl.request.type = _DRM_VBLANK_RELATIVE | (1 << bit);
> +		vbl.request.type = _DRM_VBLANK_RELATIVE | crtc_flag | (1 << bit);
>  		err = wait_vblank(fd, &vbl);
>  		igt_assert_f(err == -EINVAL,
>  			     "vblank wait with invalid request.type bit %d [0x%08x] did not report -EINVAL, got %d\n",
> -- 
> 2.51.1.windows.1
> 
