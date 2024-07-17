Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6BDC3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 15:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3453910E2A3;
	Wed, 17 Jul 2024 15:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZ3COt/L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221AE10E2A3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 15:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721229971; x=1752765971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZBBB0W9dd8ywbiJeBdXBTO+OlXvpdoYE3C6Gku3XigU=;
 b=XZ3COt/LITnwtbNxHRaQG5b2ZquE6+hxI9CWJmGz0R4Z2T/Z10ZFPd2Q
 JBUGxHXMaq2cNeJSeUACbIxT9klslc/ROWh7vyF/uKhTyPk+KYGbYWQz4
 pFu4+1nPB2o/FcvqJRlHCsKLg0Ux95zQ9r1AGjfHwmJYkex7zr52KIy1g
 L5l8084vUXTOFe+kZRKp8rIRTFZwx1mx3OA/X9OndS+udg0OWMpJoFH4L
 QOKixGKj+DzyVb6gBMjYIvEq0tPM7OTEOL8+B2aQ5fHKdGA7psCS/BCz4
 90Dp+9uisMgT8Fs5JOzsy6/BtxinS54gL4cGwV3j6bCqmFRa2nqrQ8mkV A==;
X-CSE-ConnectionGUID: YCYGxuhfR7m+Mewtuu+0Pw==
X-CSE-MsgGUID: NirCsJPLSGKOPTuhlokrqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18437046"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18437046"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 08:26:11 -0700
X-CSE-ConnectionGUID: mbgW73E7QOq7OUBNPkJ24A==
X-CSE-MsgGUID: mroAA7CRRmiSrnWLoERJCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54747072"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 08:26:10 -0700
Date: Wed, 17 Jul 2024 17:26:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>, jeevan.b@intel.com,
 suraj.kandpal@intel.com
Subject: Re: [PATCH i-g-t 1/3] tests/intel/kms_pm_dc:Add basic validation
 checks to achieve deep-pkgc
Message-ID: <20240717152607.twci3qsljmjbs6tp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 jeevan.b@intel.com, suraj.kandpal@intel.com
References: <20240717140556.640124-1-ramanaidu.naladala@intel.com>
 <20240717140556.640124-2-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240717140556.640124-2-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2024-07-17 at 19:35:54 +0530, Naladala Ramanaidu wrote:

please improve subject, was:

[PATCH i-g-t 1/3] tests/intel/kms_pm_dc:Add basic validation checks to achieve deep-pkgc

imho better:

[PATCH i-g-t 1/3] tests/intel/kms_pm_dc: Add basic validation for deep-pkgc

Note space after colon ':' char (before 'Add' word)

or even shorter:

[PATCH i-g-t 1/3] tests/intel/kms_pm_dc: Validate deep-pkgc

> Add connector checks and test requirement validations for deep-pkgc

Add dot '.' at sentence end. How do you validate deep-pkgc?
I do not see any new subtest added.

Regards,
Kamil

> 
> v2: Correct indentation and update comments (Suraj, Jeevan)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index e1318bfa6..8fb35a2df 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -592,31 +592,43 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
>  static void test_deep_pkgc_state(data_t *data)
>  {
>  	unsigned int pre_val = 0, cur_val = 0;
> -	time_t start = time(NULL), duration = 2, delay;
> +	time_t start = time(NULL), duration = 2, vb_delay, delay;
>  	enum pipe pipe;
>  	bool pkgc_flag = false;
> -	bool vrr_supported = false, flip = true;
> +	bool flip = true;
>  
>  	igt_display_t *display = &data->display;
>  	igt_plane_t *primary;
>  	igt_output_t *output = NULL;
>  
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> -		/* Check VRR capabilities before setting up */
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			igt_skip("No eDP output found, skipping the test.\n");
> +		/* DEEP PKG_C_LATENCY can be configured only for fixed refresh rates */
>  		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
>  		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> -			vrr_supported = true;
> +			igt_pipe_set_prop_value(display, pipe,
> +						IGT_CRTC_VRR_ENABLED, false);
> +			igt_assert(igt_display_try_commit_atomic(display,
> +								 DRM_MODE_ATOMIC_ALLOW_MODESET,
> +								 NULL) == 0);
>  			break;
>  		}
>  	}
>  
> -	/* Skip the test if no VRR capable output is found */
> -	if (!vrr_supported)
> -		igt_skip("No VRR capable output found, skipping the test.\n");
> -
>  	igt_display_reset(display);
> -
>  	igt_output_set_pipe(output, pipe);
> +	for_each_connector_mode(output) {
> +		data->mode = &output->config.connector->modes[j__];
> +		vb_delay = 1 * (MSECS / (data->mode->vrefresh));
> +		/*
> +		 * At least 5ms vblank time required to program higher
> +		 * watermark levels
> +		 */
> +		if (vb_delay > (5 * MSEC))
> +			break;
> +	}
>  
>  	data->output = output;
>  	data->mode = igt_output_get_mode(output);
> -- 
> 2.43.0
> 
