Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DCACCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 06:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D2E10E0F4;
	Wed,  1 Oct 2025 06:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5jBDn51";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D6F10E0F4
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 06:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759299967; x=1790835967;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=pE4zonl4Gzf7L5Xy07petJg91D34j8yCt5X4xI26bog=;
 b=n5jBDn511z6kZe7zFkiE1+IEaaDWTdhaOBhMYb8/8+3iI90/Z2iNWA6q
 rArnca94Xs68lZTwyicDuBdLnGa46c8n35pCwfHsU5TnxV0MCNJ0pSCCq
 yjmm5MrjNjmGvnXp5SAHpq58BS/t0RtihaWRAC5/Kb1cm6RIpSWN/yaTL
 QgQpceS45qrZYpHdp9FSa989DSw5A82r/hMlRgQ0IPPEOKnm2tl7dTWxC
 xaJWxXR48zLPidjcwH7xIkUI8O60gDEzyDmaKEMSTBIwvDlea7vrOx54e
 EMNCRQjiorGuWiteua7Uwewo5RGKrRJbMr+xXBAt21xg5ZDbAmGsZeCz2 w==;
X-CSE-ConnectionGUID: R+e7BBxARWSYcnacGf68zw==
X-CSE-MsgGUID: u9H9hMTRSzuDEXLPEHt+TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61274958"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208,217";a="61274958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:26:07 -0700
X-CSE-ConnectionGUID: MWQxRLEzQVO/aDQWuC1dgQ==
X-CSE-MsgGUID: bxDyaZJNSh6Ejd5mPVMRhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
 d="scan'208,217";a="178755328"
Received: from mahendir-mobl.gar.corp.intel.com (HELO [10.247.154.187])
 ([10.247.154.187])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:26:04 -0700
Content-Type: multipart/alternative;
 boundary="------------MdPKCDuhTLlebZ27WTdzJ18S"
Message-ID: <4194c486-ff6d-494a-b76f-2565a1381e50@intel.com>
Date: Wed, 1 Oct 2025 11:56:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v14,2/2] tests/kms_prime: Enable basic-modeset for xe
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, bhanuprakash.modem@gmail.com,
 anshuman.gupta@intel.com, matthew.auld@intel.com, kamil.konieczny@intel.com
References: <20250918092651.306828-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250918092651.306828-2-santhosh.reddy.guddati@intel.com>
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

This is a multi-part message in MIME format.
--------------MdPKCDuhTLlebZ27WTdzJ18S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Santhosh,

On 18-09-2025 14:56, Santhosh Reddy Guddati wrote:
> Add support for basic-modeset subtest for xe driver.
>
> V2: Update commit description to reflect the changes (Kamil)
>
> Signed-off-by: Santhosh Reddy Guddati<santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_prime.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 9082b3e51..9ccb85d49 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -459,6 +459,9 @@ static void test_basic_modeset(int drm_fd)
>   	enum pipe pipe;
>   	drmModeModeInfo *mode;
>   	struct igt_fb fb;
> +	uint32_t bo;
> +	int ret;
> +	uint32_t offsets[4] = { 0 };
>   
>   	igt_device_set_master(drm_fd);
>   	igt_display_require(&display, drm_fd);
> @@ -467,6 +470,38 @@ static void test_basic_modeset(int drm_fd)
>   	mode = igt_output_get_mode(output);
>   	igt_assert(mode);
>   
> +	if (is_xe_device(drm_fd) && xe_has_vram(drm_fd)) {
> +		uint32_t strides[4] = { ALIGN(mode->hdisplay * 4, 64) };
> +
> +		igt_info("Doing modeset on discrete\n");
> +
> +		igt_init_fb(&fb, drm_fd, mode->hdisplay, mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
> +			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> +		igt_calc_fb_size(&fb);
> +
> +		bo =  xe_bo_create(drm_fd, 0, fb.size, vram_if_possible(drm_fd, 0), 0);
> +		igt_require(bo);
> +
> +		ret = __kms_addfb(drm_fd, bo,
> +				  mode->hdisplay, mode->vdisplay,
> +				  DRM_FORMAT_XRGB8888,
> +				  DRM_FORMAT_MOD_LINEAR,
> +				  strides, offsets, 1,
> +				  DRM_MODE_FB_MODIFIERS, &fb.fb_id);
igt_init_fb is called with DRM_FORMAT_MOD_NONE  and addfb 
DRM_FORMAT_MOD_LINEAR
> +		igt_assert_eq(ret, 0);
> +
> +		set_fb(&fb, &display, output);
> +		gem_close(drm_fd, bo);
> +
> +		cairo_surface_destroy(fb.cairo_surface);
> +		do_or_die(drmModeRmFB(drm_fd, fb.fb_id));
> +
> +		igt_display_fini(&display);
> +		igt_info("Modeset on discrete done\n");
> +		return;
> +	}
> +
>   	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>   			      DRM_FORMAT_MOD_LINEAR, &fb);
>   
Thanks and Regards
Kunal Joshi
--------------MdPKCDuhTLlebZ27WTdzJ18S
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Santhosh,</p>
    <div class="moz-cite-prefix">On 18-09-2025 14:56, Santhosh Reddy
      Guddati wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">Add support for basic-modeset subtest for xe driver.

V2: Update commit description to reflect the changes (Kamil)

Signed-off-by: Santhosh Reddy Guddati <a class="moz-txt-link-rfc2396E" href="mailto:santhosh.reddy.guddati@intel.com">&lt;santhosh.reddy.guddati@intel.com&gt;</a>
---
 tests/kms_prime.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 9082b3e51..9ccb85d49 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -459,6 +459,9 @@ static void test_basic_modeset(int drm_fd)
 	enum pipe pipe;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
+	uint32_t bo;
+	int ret;
+	uint32_t offsets[4] = { 0 };
 
 	igt_device_set_master(drm_fd);
 	igt_display_require(&amp;display, drm_fd);
@@ -467,6 +470,38 @@ static void test_basic_modeset(int drm_fd)
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
 
+	if (is_xe_device(drm_fd) &amp;&amp; xe_has_vram(drm_fd)) {
+		uint32_t strides[4] = { ALIGN(mode-&gt;hdisplay * 4, 64) };
+
+		igt_info("Doing modeset on discrete\n");
+
+		igt_init_fb(&amp;fb, drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+		igt_calc_fb_size(&amp;fb);
+
+		bo =  xe_bo_create(drm_fd, 0, fb.size, vram_if_possible(drm_fd, 0), 0);
+		igt_require(bo);
+
+		ret = __kms_addfb(drm_fd, bo,
+				  mode-&gt;hdisplay, mode-&gt;vdisplay,
+				  DRM_FORMAT_XRGB8888,
+				  DRM_FORMAT_MOD_LINEAR,
+				  strides, offsets, 1,
+				  DRM_MODE_FB_MODIFIERS, &amp;fb.fb_id);</pre>
    </blockquote>
    igt_init_fb is called with <span style="white-space: pre-wrap">DRM_FORMAT_MOD_NONE</span> 
     and addfb <span style="white-space: pre-wrap">DRM_FORMAT_MOD_LINEAR</span>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+		igt_assert_eq(ret, 0);
+
+		set_fb(&amp;fb, &amp;display, output);
+		gem_close(drm_fd, bo);
+
+		cairo_surface_destroy(fb.cairo_surface);
+		do_or_die(drmModeRmFB(drm_fd, fb.fb_id));
+
+		igt_display_fini(&amp;display);
+		igt_info("Modeset on discrete done\n");
+		return;
+	}
+
 	igt_create_pattern_fb(drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &amp;fb);
 </pre>
    </blockquote>
    Thanks and Regards<br>
    Kunal Joshi
  </body>
</html>

--------------MdPKCDuhTLlebZ27WTdzJ18S--
