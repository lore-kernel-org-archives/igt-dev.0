Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CC8E9A02C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 13:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED4510E2E9;
	Wed, 18 Feb 2026 13:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDMTu0An";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EBD10E2E9
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771420718; x=1802956718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G5G/4GwzmsWQlxSTwpAIGu0fnRDL3nyQxokSYuBbFQo=;
 b=LDMTu0AnHckMBgrHYGITaCXEXs5We9EpqsVLmghnUbUyvL+cJ0IdWuAK
 xpItWBmKJ2ySLMESaML08S3TR0kXf4JT8Ye8u7EfwdtfiurdJ2KiTZwsw
 jgCReXSznDirFwcnOAT06sNQnJcdM2BPbCITBCLdAXdcupIsggxLmdQwj
 I4NZVp1punujDweobT3D6E8NMU6dKc/VYw+ojtTzLVtYK/gMCvtlznFSk
 l9/YgBy7xbKzQfD52uyGI2uOh8H3N8eoL5xAQ2pCnZORp+McEsl73IE8q
 22ko2p367ra2D4uDSe775ja0NK+Trzm0WZg2Hc3jwYuAv+X0Vpsw7anOw g==;
X-CSE-ConnectionGUID: OL9eb+g3QhSAg7m87DW86A==
X-CSE-MsgGUID: BNCRJB1TRYiJTgF1iF7BxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83211810"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="83211810"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 05:18:38 -0800
X-CSE-ConnectionGUID: oa/qvWfVTe6VQgF0xGK4QA==
X-CSE-MsgGUID: XMjFH/XZSG6grIXB6+zvgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="214301313"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 05:18:38 -0800
Date: Wed, 18 Feb 2026 14:18:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_atomic: Read the error msg on
 atomic_ioctl failure
Message-ID: <20260218131818.6t72iirnh2cqwxvv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250822065535.213451-1-arun.r.murthy@intel.com>
 <20260210085333.3250279-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210085333.3250279-1-arun.r.murthy@intel.com>
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

Hi Arun,
On 2026-02-10 at 14:23:33 +0530, Arun R Murthy wrote:
> On atomic_ioctl failure compare the failure flag with the expected
> invalid reason and pass if same else fail the test.
> 
> The corresponding KMD changes are pushed for review @
> https://patchwork.freedesktop.org/series/152276/
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  tests/kms_atomic.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index fa321cc3c..a609a9f14 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -1041,13 +1041,17 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
>  static void atomic_invalid_params(data_t *data, igt_output_t *output)
>  {
>  	struct drm_mode_atomic ioc;
> +	struct drm_mode_atomic_err_code *err_code;
>  	uint32_t obj_raw[16]; /* array of objects (sized by count_objs) */
>  	uint32_t num_props_raw[16]; /* array of num props per obj (ditto) */
>  	uint32_t props_raw[256]; /* array of props (sum of count_props) */
>  	uint64_t values_raw[256]; /* array of values for properties (ditto) */
>  	int i;
>  
> +	err_code = malloc(sizeof(struct drm_mode_atomic_err_code));
> +	memset(err_code, 0, sizeof(struct drm_mode_atomic_err_code));

Use calloc.

>  	memset(&ioc, 0, sizeof(ioc));
> +	ioc.reserved = (uintptr_t)err_code;

It is better using function to_user_pointer()

>  
>  	/* An empty request should do nothing. */
>  	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
> @@ -1076,14 +1080,18 @@ static void atomic_invalid_params(data_t *data, igt_output_t *output)
>  	/* Nonsense flags. */
>  	ioc.flags = 0xdeadbeef;
>  	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
> +	if (igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ERROR_REPORTING))
> +		igt_assert_eq(err_code->failure_code, DRM_MODE_ATOMIC_INVALID_API_USAGE);
>  
>  	ioc.flags = 0;
>  	/* Safety check that flags is reset properly. */
>  	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
>  
>  	/* Reserved/MBZ. */
> -	ioc.reserved = 1;
> -	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
> +	if (!igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ERROR_REPORTING)) {
> +		ioc.reserved = 1;
> +		do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
> +	}
>  	ioc.reserved = 0;
>  	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);

Where is free(err_code)?

Regards,
Kamil 
>  
> -- 
> 2.25.1
> 
