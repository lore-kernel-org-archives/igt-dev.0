Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EDBED7B9C
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 10:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E4A10E34F;
	Tue, 14 Apr 2026 10:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPSG6ipW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A18410E34F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 10:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776164034; x=1807700034;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DR6cwaUnRTSbdqK01Fi2MKZNc8HeDrMyGhAetJ+GBjA=;
 b=XPSG6ipWKXT4GtGeGmsXZdi/R6QYyPgsEPPzibvfOh2FmvffdPKhgMAi
 ihAoa7JLLhVcy2h1fP6wssuJl8bJNU5zdOHS+a2eJLW8f771RoUy1Cqah
 Ukkvm7UJXIv1DgRW9Fjlt5+l8AvlgMS8FkCipi1v845i1NYhZe2N/4BEr
 2oACKL+GnwH3zoPjOcThlBBE86DBN2j0pk8x40mx26YkWQelrp83hdhSz
 vSrF9AwFH6uFEL0eKe34e6y7bXDmG4lUB0secu/Oobz0z4FP8UMAYNodm
 X5oiYQVmcOuwcNOuW1jDuwo1XR5WJGOIfpP6nNaWOL0nMrayrPbDXXIDb g==;
X-CSE-ConnectionGUID: REdjOkn6Q7eOfUOpYSbLsg==
X-CSE-MsgGUID: BpL7FbgiR8eMnz9v7/SjSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="99761003"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="99761003"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 03:53:53 -0700
X-CSE-ConnectionGUID: NQcrdQ0hTAOIRNCXLMnrMA==
X-CSE-MsgGUID: R+EREXF/Q/iUP8Io9Q+HEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253464956"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 03:53:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/kms_pm_dc: Add new test for
 dc3co framedrop validation
In-Reply-To: <20260414095014.55950-5-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260414095014.55950-1-jeevan.b@intel.com>
 <20260414095014.55950-5-jeevan.b@intel.com>
Date: Tue, 14 Apr 2026 13:53:48 +0300
Message-ID: <921579195a570e697199b80642d50a4d279c0d2f@intel.com>
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

On Tue, 14 Apr 2026, Jeevan B <jeevan.b@intel.com> wrote:
> Add a new subtest to validate that no frame drops occur during
> DC3CO entry, ensuring that no frame drops are detected and DC3CO
> is successfully triggered during the test.
>
> v2: update check_dc3co_framedrop for detecting frame drops via
>     drmWaitVBlank vblank sequence numbers, checks DC3CO counter
>     to confirm entry and cast variable 'delay'.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 109 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 910263c9f..ff7bc84ec 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -51,6 +51,10 @@
>   * Description: Make sure that system enters DC3CO when PSR2 is active and system
>   *              is in SLEEP state
>   *
> + * SUBTEST: dc3co-framedrop-check
> + * Description: Verify that DC3CO entry does not cause frame drops and successfully
> + * 		enters the power state
> + *
>   * SUBTEST: dc5-dpms
>   * Description: Validate display engine entry to DC5 state while all connectors's
>   *              DPMS property set to OFF
> @@ -338,6 +342,91 @@ static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
>  	cleanup_dc3co_fbs(data);
>  }
>  
> +static void setup_dc3co_for_framedrop(data_t *data, enum psr_mode mode)
> +{
> +	data->op_psr_mode = mode;
> +	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, NULL);
> +	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
> +		      "%s is not enabled\n",
> +		      mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
> +}
> +
> +static void check_dc3co_framedrop(data_t *data)

Please don't add functions named "check something". It's one of the most
ambiguous verbs you could use in a function name.

BR,
Jani.

> +{
> +	igt_plane_t *primary;
> +	uint32_t dc3co_prev_cnt;
> +	uint32_t prev_seq = 0, cur_seq = 0, diff = 0;
> +	int delay;
> +	int frame_count = 0, frame_drops = 0;
> +	int max_count = 60;
> +	bool dc3co_flag = false;
> +	drmVBlank wait;
> +	igt_crtc_t *crtc = data->output->pending_crtc;
> +	uint32_t vbl_flags;
> +
> +	igt_require_f(data->mode->vrefresh != 0, "Invalid vrefresh rate of 0\n");
> +
> +	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +
> +	/* Calculate delay to generate idle frame in usec */
> +	delay = (int)(1.5 * ((1000 * 1000) / data->mode->vrefresh));
> +
> +	vbl_flags = kmstest_get_vbl_flag(crtc->pipe);
> +
> +	/* Get initial vblank sequence number */
> +	memset(&wait, 0, sizeof(wait));
> +	wait.request.type = vbl_flags | DRM_VBLANK_RELATIVE;
> +	wait.request.sequence = 1;
> +	drmWaitVBlank(data->drm_fd, &wait);
> +	prev_seq = wait.reply.sequence;
> +
> +	while (frame_count < max_count) {
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +
> +		igt_plane_set_fb(primary, &data->fb_rgr);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +
> +		memset(&wait, 0, sizeof(wait));
> +		wait.request.type = vbl_flags | DRM_VBLANK_RELATIVE;
> +		wait.request.sequence = 1;
> +		drmWaitVBlank(data->drm_fd, &wait);
> +		cur_seq = wait.reply.sequence;
> +
> +		diff = cur_seq - prev_seq;
> +		if (diff > 1)
> +			frame_drops += diff - 1;
> +		prev_seq = cur_seq;
> +
> +		if (!dc3co_flag &&
> +		    igt_read_dc_counter(data->debugfs_fd,
> +					IGT_INTEL_CHECK_DC3CO) > dc3co_prev_cnt)
> +			dc3co_flag = true;
> +
> +		frame_count++;
> +	}
> +
> +	igt_assert_f(dc3co_flag, "DC3CO was not entered during the test\n");
> +	igt_assert_f(frame_drops == 0,
> +		     "Frame drops detected: frame_drops=%d, frame_count=%d, max_count=%d, "
> +		     "last measured vblank diff=%u\n",
> +		     frame_drops, frame_count, max_count, diff);
> +}
> +
> +static void test_dc3co_framedrop(data_t *data, enum psr_mode mode)
> +{
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	setup_output(data);
> +	setup_dc3co_for_framedrop(data, mode);
> +	setup_videoplayback(data);
> +	check_dc3co_framedrop(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
>  static void test_dc5_retention_flops(data_t *data, int dc_flag)
>  {
>  	uint32_t dc_counter_before_psr;
> @@ -687,6 +776,26 @@ int igt_main()
>  		}
>  	}
>  
> +	igt_describe("Validate that no frame drops occur during DC3CO entry "
> +		     "while alternating framebuffers with PSR2 or Panel Replay active");
> +	igt_subtest_with_dynamic("dc3co-framedrop-check") {
> +		igt_dynamic("psr2-dc3co-framedrop") {
> +			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +						     PSR_MODE_2, NULL));
> +			igt_require_f(IS_TIGERLAKE(data.devid) ||
> +				      intel_display_ver(data.devid) >= 35,
> +				      "Platform does not support DC3CO with PSR2\n");
> +			test_dc3co_framedrop(&data, PSR_MODE_2);
> +		}
> +		igt_dynamic("pr-dc3co-framedrop") {
> +			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +						     PR_MODE, NULL));
> +			igt_require_f(intel_display_ver(data.devid) >= 35,
> +				      "Platform does not support DC3CO with Panel Replay\n");
> +			test_dc3co_framedrop(&data, PR_MODE);
> +		}
> +	}
> +
>  	igt_describe("This test validates display engine entry to DC5 state "
>  		     "while PSR is active");
>  	igt_subtest("dc5-psr") {

-- 
Jani Nikula, Intel
