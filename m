Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771FAD25056
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 08:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2524310E080;
	Mon, 12 Jan 2026 08:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu82av75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA59610E080
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 08:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768208200; x=1799744200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pfUt7bd7pWqqlVx13NnIdFQDI51FCC3gFlXWugX+W7w=;
 b=iu82av75xSu6PQ8WvCd7JHgc5WRflOD0WbIcgYvH35zuIXbCI8+/R3SP
 H1oyPNLe+JIEayA9tsvqAQuLZILqIoA59L2gmumK1L2yNANqrj81C356L
 i1XnyTlyaDS5UUUtU3+wAuz6E44oDDrUr24aS0YJPDq4LIW0TMQn1mmpe
 z3l27+NG7qkUFV1cVbWmQOIasjy4B6Jp97QlQJmf7SIOrjn1/IAm6PMoq
 Tu34SKmWLbYHUh/GxEoBrZ+V/NluIT/FnzmS+bnFX9o7qPAuVoR+dI2lB
 ug93QHUaPtiIM9Wbf7cpAGL0k8wu6x2H5m+CCLZ41gMKfQczdW3vCvzHV g==;
X-CSE-ConnectionGUID: rMY8XD/rS5CsrQLLBiJ+kw==
X-CSE-MsgGUID: 0VJLjIHnSv+xXQUYqJCN0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="87065388"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="87065388"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:56:40 -0800
X-CSE-ConnectionGUID: wwpYjQkUTLqGqu572nsaag==
X-CSE-MsgGUID: usDDyKTcQA21atYPQD5dUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204451274"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 00:56:38 -0800
Date: Mon, 12 Jan 2026 09:56:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sowmiya S <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 suraj.kandpal@intel.com
Subject: Re: [PATCH i-g-t v4 5/6] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Message-ID: <20260112085621.rbpmfwlt4yitp3l4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org,
 swati2.sharma@intel.com, suraj.kandpal@intel.com
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
 <20251203094307.3187669-6-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251203094307.3187669-6-sowmiya.s@intel.com>
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

Hi Sowmiya,
On 2025-12-03 at 15:13:06 +0530, Sowmiya S wrote:
> Remove individual tests for each format for the test
> writeback-fb-id and introduce dynamic subtest generation
> based on the formats supported. Framebuffer creation was
> now part of the subtest level based on format.
> 
> v4: squashed the FB creation function with this commit
> 
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>

This change introduce error in building:

FAILED: docs/testplan/kms_tests.rst 
ERROR: Missing documentation for igt@kms_writeback@writeback-fb-id
ERROR: Unneeded documentation for igt@kms_writeback@writeback-fb-id-XBGR2101010
ERROR: Unneeded documentation for igt@kms_writeback@writeback-fb-id-XBGR8888
Please refer: docs/test_documentation.md for more details

There is one missing subtest doc and two non-needed. Please fix it.

ALso look into building log in patchwork.

Regards,
Kamil

> ---
>  tests/kms_writeback.c | 74 +++++++++++++++++++++++--------------------
>  1 file changed, 40 insertions(+), 34 deletions(-)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 6725f5ea3..d54d649b2 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -51,9 +51,6 @@
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *
> - * SUBTEST: writeback-fb-id-XRGB2101010
> - * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> - *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
>   *
> @@ -507,6 +504,25 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
>  	igt_remove_fb(display->drm_fd, &output_fb);
>  }
>  
> +static void create_fbs(igt_display_t *display, igt_fb_t *input_fb, igt_fb_t *output_fb,
> +		       uint32_t format, drmModeModeInfo *mode)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay,
> +			      mode->vdisplay,
> +			      format,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      input_fb);
> +	igt_assert(fb_id >= 0);
> +
> +	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
> +			      format,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      output_fb);
> +	igt_assert(fb_id >= 0);
> +}
> +
>  static igt_output_t *list_writeback_modes(igt_display_t *display)
>  {
>  	for (int i = 0; i < display->n_outputs; i++) {
> @@ -685,37 +701,27 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
> -	igt_subtest("writeback-fb-id") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> -
> -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and invalid options");
> -	igt_subtest("writeback-fb-id-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010), "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> +		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format = fourcc[i];
> +
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format), "BGR"))
> +					continue;
> +			igt_dynamic_f("writeback-fb-id-%s", igt_format_str(test_format)) {
> +				igt_fb_t in_fb;
> +				igt_fb_t output_fb;
> +
> +				igt_skip_on(data.dump_check || data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 << i)),
> +					      "DRM_FORMAT_%s is not supported\n",
> +					      igt_format_str(test_format));
> +				create_fbs(&display, &in_fb, &output_fb, test_format, &mode);
> +				writeback_fb_id(output, &in_fb, &output_fb);
> +				igt_remove_fb(display.drm_fd, &in_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>  
>  	igt_describe("Check writeback output with CRC validation");
> -- 
> 2.43.0
> 
