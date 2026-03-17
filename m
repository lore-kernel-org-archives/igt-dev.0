Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB3DF33831
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 10:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E0310E47E;
	Tue, 17 Mar 2026 10:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjHx0JhI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A96110E47E
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773741974; x=1805277974;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8CS+sgWRGTU2gjBiRp859eg511YgLJ7zsxug3mmzlJY=;
 b=NjHx0JhI7wWZJLBpDXpthB/EJtKCgULg0e+CcKMFSVth2X5yWjyVQv+e
 N+HqmUxruzPmoQ/kW4F9JhoK2OHVBAenmKFNcZdqwYT0r8JC9ViStL+L5
 38bVhkYdVJgPaDNN0x1kBlXpCbNQ7O5TATB2BFRVOa5bBCD+oIbnG2T0J
 7BF1RJPf+g+PXV6C2Pxvy1K4LP1XOqNiOuUClyDBn20s7t51YwjiRKWWA
 JfjZBZnS2jEmrKsXwiX0EssHLK8kXA9U2nuOE7y0tmRt8g668o9raJFUA
 7UhVfDuSCWSP8PixbWYpWbuKICumpR+n8u0p9inqoI+BJlwMqsgqs1xy4 Q==;
X-CSE-ConnectionGUID: S0Ir9iZ8S5uV4ms6kxSYRA==
X-CSE-MsgGUID: AYFKgZnjRzW8xlLLmKBBKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74658635"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74658635"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 03:06:14 -0700
X-CSE-ConnectionGUID: jpkAerwDTE61ft5feZhsHg==
X-CSE-MsgGUID: OgzNF56AQju5BTBPEAFPMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="218378167"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 03:06:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t v2] tests/kms_content_protection: Optimize
 framebuffer management
In-Reply-To: <20260316080735.2128881-1-jason-jh.lin@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260316080735.2128881-1-jason-jh.lin@mediatek.com>
Date: Tue, 17 Mar 2026 12:06:04 +0200
Message-ID: <356099f0d5b2c882460e344869720b92c0da538d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 16 Mar 2026, Jason-JH Lin <jason-jh.lin@mediatek.com> wrote:
> Refactor framebuffer management to improve reusability:
> - Create framebuffers once per pipe at test initialization via
>   create_fbs() and reuse them across all subtests
> - Centralize cleanup in remove_fbs() called at test fixture end
> - Use per-pipe framebuffer array (data.fbs[IGT_MAX_PIPES]) instead
>   of single global framebuffers
>
> Each framebuffer is created with the actual resolution of the first
> output that can connect to that pipe, avoiding buffer size mismatch
> issues (e.g., 3504x2190 panel incorrectly using 3840x2160 buffer).
>
> For MST tests, multiple outputs share bandwidth and may require mode
> override to fit within bandwidth constraints. When mode override
> changes the resolution, properly detach planes before removing the
> existing framebuffers, then recreate them with the new dimensions.

Please avoid using enum pipe and crtc->pipe for anything unless you
actually really *really* need to know the (Intel) hardware pipe.

Please pass igt_crtc_t* around, and use crtc->crtc_index instead.

Ville and I have been working hard to stop the conflation of pipes and
CRTC indexes in the IGT codebase in the past months, a total of 200+
commits. This also needs a shift in the mindset of IGT development to
avoid using pipes across the board, and make everything about the CRTC
and CRTC indexes. They're the hardware and vendor agnostic things.

I've considered suggesting to rename enum pipe to vendor_pipe and
crtc->pipe to crtc->vendor_pipe, which could mean different things on
different GPUs, and would emphasize common GPU independent code should
not use them.

The CRTC index numbering is always the kernel CRTC registration order,
and the numbers are consecutive. On Intel hardware, pipes could be fused
off, making the pipe numbers non-consecutive, and (in the immediate
future, prompting the work Ville and I have been doing) the pipes could
be allocated in a different order from the CRTC numbering.


BR,
Jani.



>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Suggested-by: Karthik B.S <karthik.b.s@intel.com>
> ---
>  tests/kms_content_protection.c | 198 +++++++++++++++++++++++++--------
>  1 file changed, 150 insertions(+), 48 deletions(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index f35c9fa73a57..6b4287b41668 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -107,10 +107,15 @@
>  
>  IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>  
> +struct hdcp_test_fbs {
> +	struct igt_fb red;
> +	struct igt_fb green;
> +};
> +
>  struct data {
>  	int drm_fd;
>  	igt_display_t display;
> -	struct igt_fb red, green;
> +	struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>  	unsigned int cp_tests;
>  	struct udev_monitor *uevent_monitor;
>  	bool is_force_hdcp14;
> @@ -257,7 +262,7 @@ commit_display_and_wait_for_flip(enum igt_commit_style commit_style)
>  	}
>  }
>  
> -static void modeset_with_fb(igt_output_t *output,
> +static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
>  			    enum igt_commit_style commit_style)
>  {
>  	igt_display_t *display = &data.display;
> @@ -267,18 +272,19 @@ static void modeset_with_fb(igt_output_t *output,
>  	mode = igt_output_get_mode(output);
>  
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_plane_set_fb(primary, &data.red);
> -	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(primary, &data.fbs[pipe].red);
> +	igt_fb_set_size(&data.fbs[pipe].red, primary, mode->hdisplay, mode->vdisplay);
>  
>  	igt_display_commit2(display, commit_style);
>  
> -	igt_plane_set_fb(primary, &data.green);
> +	igt_plane_set_fb(primary, &data.fbs[pipe].green);
>  
>  	/* Wait for Flip completion before starting the HDCP authentication */
>  	commit_display_and_wait_for_flip(commit_style);
>  }
>  
> -static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_style,
> +static bool test_cp_enable(igt_output_t *output, enum pipe pipe,
> +			   enum igt_commit_style commit_style,
>  			   int content_type, bool type_change)
>  {
>  	igt_display_t *display = &data.display;
> @@ -301,7 +307,7 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
>  	ret = wait_for_prop_value(output, CP_ENABLED,
>  				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>  	if (ret) {
> -		igt_plane_set_fb(primary, &data.green);
> +		igt_plane_set_fb(primary, &data.fbs[pipe].green);
>  		igt_display_commit2(display, commit_style);
>  	}
>  
> @@ -314,13 +320,15 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
>  {
>  	igt_display_t *display = &data.display;
>  	igt_plane_t *primary;
> +	igt_crtc_t *crtc;
>  	bool ret;
>  	int count;
>  	u64 val;
>  
>  	for (count = 0; count < valid_outputs; count++) {
> +		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
>  		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, &data.red);
> +		igt_plane_set_fb(primary, &data.fbs[crtc->pipe].red);
>  		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
>  					  CP_UNDESIRED);
>  	}
> @@ -338,7 +346,8 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
>  	igt_assert_f(ret, "Content Protection not cleared on all MST outputs\n");
>  }
>  
> -static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_style)
> +static void test_cp_disable(igt_output_t *output, enum pipe pipe,
> +			    enum igt_commit_style commit_style)
>  {
>  	igt_display_t *display = &data.display;
>  	igt_plane_t *primary;
> @@ -352,7 +361,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>  	 */
>  	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
>  				  CP_UNDESIRED);
> -	igt_plane_set_fb(primary, &data.red);
> +	igt_plane_set_fb(primary, &data.fbs[pipe].red);
>  	igt_display_commit2(display, commit_style);
>  
>  	/* Wait for HDCP to be disabled, before crtc off */
> @@ -361,7 +370,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>  	igt_assert_f(ret, "Content Protection not cleared\n");
>  }
>  
> -static void test_cp_enable_with_retry(igt_output_t *output,
> +static void test_cp_enable_with_retry(igt_output_t *output, enum pipe pipe,
>  				      enum igt_commit_style commit_style,
>  				      int retry, int content_type,
>  				      bool expect_failure,
> @@ -372,16 +381,16 @@ static void test_cp_enable_with_retry(igt_output_t *output,
>  
>  	do {
>  		if (!type_change || retry_orig != retry)
> -			test_cp_disable(output, commit_style);
> +			test_cp_disable(output, pipe, commit_style);
>  
> -		ret = test_cp_enable(output, commit_style, content_type, type_change);
> +		ret = test_cp_enable(output, pipe, commit_style, content_type, type_change);
>  
>  		if (!ret && --retry)
>  			igt_debug("Retry (%d/2) ...\n", 3 - retry);
>  	} while (retry && !ret);
>  
>  	if (!ret)
> -		test_cp_disable(output, commit_style);
> +		test_cp_disable(output, pipe, commit_style);
>  
>  	if (expect_failure)
>  		igt_assert_f(!ret,
> @@ -451,16 +460,16 @@ static void test_content_protection_on_output(igt_output_t *output,
>  	igt_display_t *display = &data.display;
>  	bool ret;
>  
> -	test_cp_enable_with_retry(output, commit_style, 3, content_type, false,
> +	test_cp_enable_with_retry(output, crtc->pipe, commit_style, 3, content_type, false,
>  				  false);
>  
>  	if (data.cp_tests & CP_TYPE_CHANGE) {
>  		/* Type 1 -> Type 0 */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc->pipe, commit_style, 3,
>  					  HDCP_CONTENT_TYPE_0, false,
>  					  true);
>  		/* Type 0 -> Type 1 */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc->pipe, commit_style, 3,
>  					  content_type, false,
>  					  true);
>  	}
> @@ -470,14 +479,14 @@ static void test_content_protection_on_output(igt_output_t *output,
>  			     "mei_hdcp unload failed");
>  
>  		/* Expected to fail */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc->pipe, commit_style, 3,
>  					  content_type, true, false);
>  
>  		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
>  			     "mei_hdcp load failed");
>  
>  		/* Expected to pass */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc->pipe, commit_style, 3,
>  					  content_type, false, false);
>  	}
>  
> @@ -496,7 +505,7 @@ static void test_content_protection_on_output(igt_output_t *output,
>  		ret = wait_for_prop_value(output, CP_ENABLED,
>  					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>  		if (!ret)
> -			test_cp_enable_with_retry(output, commit_style, 2,
> +			test_cp_enable_with_retry(output, crtc->pipe, commit_style, 2,
>  						  content_type, false,
>  						  false);
>  	}
> @@ -507,7 +516,7 @@ static void test_content_protection_on_output(igt_output_t *output,
>  		ret = wait_for_prop_value(output, CP_ENABLED,
>  					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>  		if (!ret)
> -			test_cp_enable_with_retry(output, commit_style, 2,
> +			test_cp_enable_with_retry(output, crtc->pipe, commit_style, 2,
>  						  content_type, false,
>  						  false);
>  	}
> @@ -577,21 +586,24 @@ static bool sink_hdcp2_capable(igt_output_t *output)
>  	return strstr(buf, "HDCP2.2");
>  }
>  
> -static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
> +static void prepare_modeset_on_mst_output(igt_output_t *output, int pipe, bool is_enabled)
>  {
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
>  	int width, height;
> +	struct igt_fb *fb;
>  
>  	mode = igt_output_get_mode(output);
>  
>  	width = mode->hdisplay;
>  	height = mode->vdisplay;
>  
> +	fb = is_enabled ? &data.fbs[pipe].green : &data.fbs[pipe].red;
> +
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
> -	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width, height);
> +	igt_plane_set_fb(primary, fb);
> +	igt_fb_set_size(fb, primary, width, height);
>  	igt_plane_set_size(primary, width, height);
>  }
>  
> @@ -663,11 +675,11 @@ static void reset_i915_force_hdcp14(igt_output_t *output)
>  }
>  
>  static void
> -test_fini(igt_output_t *output, enum igt_commit_style commit_style)
> +test_fini(igt_output_t *output, enum pipe pipe, enum igt_commit_style commit_style)
>  {
>  	igt_plane_t *primary;
>  
> -	test_cp_disable(output, commit_style);
> +	test_cp_disable(output, pipe, commit_style);
>  	primary = igt_output_get_plane_type(output,
>  					    DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
> @@ -739,7 +751,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>  			if (!intel_pipe_output_combo_valid(display))
>  				continue;
>  
> -			modeset_with_fb(output, commit_style);
> +			modeset_with_fb(crtc->pipe, output, commit_style);
>  			if (data.is_force_hdcp14)
>  				set_i915_force_hdcp14(output);
>  
> @@ -753,7 +765,8 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>  			if (data.is_force_hdcp14)
>  				reset_i915_force_hdcp14(output);
>  
> -			test_fini(output, commit_style);
> +			test_fini(output, crtc->pipe, commit_style);
> +
>  			/*
>  			 * Testing a output with a pipe is enough for HDCP
>  			 * testing. No ROI in testing the connector with other
> @@ -846,8 +859,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
>  		if (!ret || retries)
>  			igt_debug("Retry %d/3\n", 3 - retries);
>  
> -		for (i = 0; i < valid_outputs; i++)
> -			prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
> +		for (i = 0; i < valid_outputs; i++) {
> +			igt_crtc_t *crtc = igt_output_get_driving_crtc(hdcp_mst_output[i]);
> +
> +			prepare_modeset_on_mst_output(hdcp_mst_output[i], crtc->pipe, ret);
> +		}
>  
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  	} while (retries && !ret);
> @@ -868,7 +884,9 @@ test_content_protection_mst(int content_type)
>  	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
>  	igt_crtc_t *crtc;
>  	bool pipe_found;
> +	enum pipe pipe;
>  	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
> +	drmModeModeInfo *mode;
>  
>  	for_each_crtc(display, crtc)
>  		max_pipe++;
> @@ -882,6 +900,7 @@ test_content_protection_mst(int content_type)
>  			if (igt_crtc_is_free(crtc) &&
>  			    igt_crtc_connector_valid(crtc, output)) {
>  				pipe_found = true;
> +				pipe = crtc->pipe;
>  				break;
>  			}
>  		}
> @@ -889,7 +908,33 @@ test_content_protection_mst(int content_type)
>  		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
>  
>  		igt_output_set_crtc(output, crtc);
> -		prepare_modeset_on_mst_output(output, false);
> +
> +		mode = igt_output_get_mode(output);
> +
> +		/*
> +		 * Check if framebuffers already exist for this pipe from create_fbs().
> +		 * Since non-MST tests run first and share the same data.fbs[] array,
> +		 * the existing FB may have a different resolution than this MST output
> +		 * requires. If so, properly detach planes, remove old FBs, and recreate
> +		 * with the correct dimensions for this MST output.
> +		 */
> +		if (data.fbs[pipe].red.fb_id) {
> +			igt_plane_t *primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_plane_set_fb(primary, NULL);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			igt_remove_fb(data.drm_fd, &data.fbs[pipe].red);
> +			igt_remove_fb(data.drm_fd, &data.fbs[pipe].green);
> +		}
> +
> +		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    1.f, 0.f, 0.f, &data.fbs[pipe].red);
> +		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    0.f, 1.f, 0.f, &data.fbs[pipe].green);
> +
> +		prepare_modeset_on_mst_output(output, pipe, false);
>  		dp_mst_outputs++;
>  		if (output_hdcp_capable(output, content_type))
>  			hdcp_mst_output[valid_outputs++] = output;
> @@ -905,9 +950,33 @@ test_content_protection_mst(int content_type)
>  		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
>  		igt_require_f(found, "No valid mode combo found for MST modeset\n");
>  
> -		for (count = 0; count < valid_outputs; count++)
> -			prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
> +		/* Detach planes before removing framebuffers */
> +		for (count = 0; count < valid_outputs; count++) {
> +			crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
> +			pipe = crtc->pipe;
> +			prepare_modeset_on_mst_output(hdcp_mst_output[count], pipe, false);
> +		}
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +		/* Need to re-prepare after mode override */
> +		for (count = 0; count < valid_outputs; count++) {
> +			crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
> +			pipe = crtc->pipe;
> +
> +			igt_remove_fb(data.drm_fd, &data.fbs[pipe].red);
> +			igt_remove_fb(data.drm_fd, &data.fbs[pipe].green);
> +
> +			mode = igt_output_get_mode(hdcp_mst_output[count]);
>  
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    1.f, 0.f, 0.f, &data.fbs[pipe].red);
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    0.f, 1.f, 0.f, &data.fbs[pipe].green);
> +
> +			prepare_modeset_on_mst_output(hdcp_mst_output[count], pipe, false);
> +		}
>  		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>  		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
>  	}
> @@ -934,7 +1003,7 @@ test_content_protection_mst(int content_type)
>  	 * Verify if CP is still enabled on other outputs by disabling CP on the first output.
>  	 */
>  	igt_debug("CP Prop being UNDESIRED on %s\n", hdcp_mst_output[0]->name);
> -	test_cp_disable(hdcp_mst_output[0], COMMIT_ATOMIC);
> +	test_cp_disable(hdcp_mst_output[0], 0, COMMIT_ATOMIC);
>  
>  	/* CP is expected to be still enabled on other outputs*/
>  	for (i = 1; i < valid_outputs; i++) {
> @@ -945,8 +1014,22 @@ test_content_protection_mst(int content_type)
>  
>  	if (data.cp_tests & CP_LIC)
>  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
> -}
>  
> +	/* Detach planes before removing framebuffers */
> +	for (count = 0; count < valid_outputs; count++) {
> +		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
> +		pipe = crtc->pipe;
> +		prepare_modeset_on_mst_output(hdcp_mst_output[count], pipe, false);
> +	}
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	for (count = 0; count < valid_outputs; count++) {
> +		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
> +		pipe = crtc->pipe;
> +		igt_remove_fb(data.drm_fd, &data.fbs[pipe].red);
> +		igt_remove_fb(data.drm_fd, &data.fbs[pipe].green);
> +	}
> +}
>  
>  static void test_content_protection_cleanup(void)
>  {
> @@ -964,33 +1047,51 @@ static void test_content_protection_cleanup(void)
>  			continue;
>  
>  		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
> -		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +		test_cp_disable(output, 0, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  	}
> -
> -	igt_remove_fb(data.drm_fd, &data.red);
> -	igt_remove_fb(data.drm_fd, &data.green);
>  }
>  
>  static void create_fbs(void)
>  {
> -	uint16_t width = 0, height = 0;
>  	drmModeModeInfo *mode;
>  	igt_output_t *output;
> +	igt_crtc_t *crtc;
>  
> +	/* Create framebuffers for each connected output's pipe */
>  	for_each_connected_output(&data.display, output) {
>  		mode = igt_output_get_mode(output);
>  		igt_assert(mode);
>  
> -		width = max(width, mode->hdisplay);
> -		height = max(height, mode->vdisplay);
> +		/* Find a valid crtc for this output */
> +		for_each_crtc(&data.display, crtc) {
> +			if (!igt_crtc_connector_valid(crtc, output))
> +				continue;
> +
> +			/* Skip if already created for this pipe */
> +			if (data.fbs[crtc->pipe].red.fb_id)
> +				continue;
> +
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    1.f, 0.f, 0.f, &data.fbs[crtc->pipe].red);
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    0.f, 1.f, 0.f, &data.fbs[crtc->pipe].green);
> +			break;
> +		}
>  	}
> +}
>  
> -	igt_create_color_fb(data.drm_fd, width, height,
> -			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -			    1.f, 0.f, 0.f, &data.red);
> -	igt_create_color_fb(data.drm_fd, width, height,
> -			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -			    0.f, 1.f, 0.f, &data.green);
> +static void remove_fbs(void)
> +{
> +	igt_crtc_t *crtc;
> +
> +	for_each_crtc(&data.display, crtc) {
> +		if (data.fbs[crtc->pipe].red.fb_id)
> +			igt_remove_fb(data.drm_fd, &data.fbs[crtc->pipe].red);
> +		if (data.fbs[crtc->pipe].green.fb_id)
> +			igt_remove_fb(data.drm_fd, &data.fbs[crtc->pipe].green);
> +	}
>  }
>  
>  static const struct {
> @@ -1216,6 +1317,7 @@ int igt_main()
>  
>  	igt_fixture() {
>  		test_content_protection_cleanup();
> +		remove_fbs();
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
>  	}

-- 
Jani Nikula, Intel
