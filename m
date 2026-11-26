Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B31E606A683
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KlgzW85i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B6210E218;
	Thu, 26 Nov 2026 12:23:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7AB10E218
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795695721; x=1827231721;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=62elx+NjDk2+riears1h0UY1qdqdjqgkFO2PEzlbccc=;
 b=KlgzW85iov/74vVplAMs2e0z+isgjI+IqRrJmOxHIYXr13NmO6LQihE0
 gUv+5c0cChVXaPuCZq7OONOSdU5Myh+oqmXvGPuU0wW1pdPPeNUevjFJS
 fH0wNKqgL+fTavMDNAdWmf/AD/uQj8RrBgMkt4zFOwpM9LYPKCil1glyf
 YQjdZAUYOYyzaLjTOkMFBSyxc/ywA1DQ744NFk1UlAs0qBUvrqoISfzNI
 YLw+jR1rWE4iohzRzj8ADU37OhnFqDVFNltNlQXCCoZLe78dM8+RSnFk5
 6r33fH5TbQgbKvxUemzgwOyWcnzTUsteRIL1IANZBNsN3OoJqCIffSD+m g==;
X-CSE-ConnectionGUID: MBeUhH76Q6ePJqY3vLlPnQ==
X-CSE-MsgGUID: Z67Bcd0URaWrM6b2z7aqng==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4670348"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4670348"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:22:00 -0800
X-CSE-ConnectionGUID: 7yojqjGASc2ne3fBpatL5A==
X-CSE-MsgGUID: 6LYMeLRwRZmc3ZwPc/8YMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12490318"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:21:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Roy <rongh7426@gmail.com>, igt-dev@lists.freedesktop.org
Cc: Roy <rongh7426@gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_vblank: Query the pipe under test in
 the invalid subtest
In-Reply-To: <20261126030034.641144-1-rongh7426@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126030034.641144-1-rongh7426@gmail.com>
Date: Thu, 26 Nov 2026 14:21:54 +0200
Message-ID: <78487c3aa5f1aacf574e647e711cb61d502d7b35@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026, Roy <rongh7426@gmail.com> wrote:
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
>
> Signed-off-by: Roy <rongh7426@gmail.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

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

-- 
Jani Nikula, Intel
