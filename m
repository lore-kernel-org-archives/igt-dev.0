Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D549C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 10:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE07410E049;
	Mon, 29 Jun 2026 10:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTStiA2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB3A10E049
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782727575; x=1814263575;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MdmMKlXWnW+Tmw0RXN5yT3Qh65n4pNgzUr1wWCcAujY=;
 b=RTStiA2ym4g1V7t+l8ZhaEnKehWnIUXfUyA5MhW+QDJDoMebLh1HoFO1
 Dy6kywzBc+/c2ZCD+iQYXYxgwibmifBzB9hZSn2MTeUnFICvbKPi7G29t
 6F7pxDDztvVm8cRErNeteXXKUSJgWav4C8GhqlTuTzGhLrnx7tNo+xbwM
 IuyNGQ7o6taxvzhy4YTWjHG1djPDuE+hRaKWIUQwwQwxrJaTB8e+KomYj
 TSaleo8LeeFwKORYxxXVY/p4s5ZHZe5HC/n5FiSIiw14F8okWw5eHxK0Q
 hhHie/0kCVN3NUpQWiYmo2BRDwtkBUWMmsymHR1stwLGgjKrNReTeTwxA g==;
X-CSE-ConnectionGUID: PiZwIat9S4Ota9TIIXPilQ==
X-CSE-MsgGUID: x/2wvSPiRqao1aZ2tglx1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="100846828"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="100846828"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 03:06:05 -0700
X-CSE-ConnectionGUID: 2LcfWllgSt2WntHpYtbrRA==
X-CSE-MsgGUID: iM4zXqhYSvKfAPMJerdSRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="248553162"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.253])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 03:06:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: Re: [PATCH i-g-t v4 3/3] tests/intel/kms_pipe_stress: Fit display
 modes to MST link budget
In-Reply-To: <20260629092611.298235-4-sowmiya.s@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260629092611.298235-1-sowmiya.s@intel.com>
 <20260629092611.298235-4-sowmiya.s@intel.com>
Date: Mon, 29 Jun 2026 13:05:59 +0300
Message-ID: <ea7b154a135f353dc9a094b87b5dbec149b20ca7@intel.com>
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

On Mon, 29 Jun 2026, Sowmiya S <sowmiya.s@intel.com> wrote:
> When multiple displays share a single MST link,
> running them at their highest modes can exceed the
> available bandwidth.This causes the stress loop to
> fail with -ENOSPC when the driver rejects the commit.
> Before allocating framebuffers,check that the combined
> mode bandwidth fits the link and scale down modes if
> needed,so stress loop never commits an impossible config.

I don't see any reason in the patch to require the use of enum pipe. It
should be avoided if it's at all possible.

>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_pipe_stress.c | 51 +++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 36e3842c6..84dcba11f 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -763,6 +763,8 @@ static void prepare_test(struct data *data)
>  	int i, j;
>  	int num_connectors;
>  	int num_cpus = (int) sysconf(_SC_NPROCESSORS_ONLN);
> +	igt_output_t *output;
> +	enum pipe pipe = PIPE_A;
>  
>  	data->number_of_cores = min(num_cpus, MAX_CORES);
>  
> @@ -820,6 +822,55 @@ static void prepare_test(struct data *data)
>  			 data->num_planes[i], i);
>  	}
>  
> +	/*
> +	 * Assign all connected outputs to their pipes and fit the modes
> +	 * within the available link bandwidth.  On shared-link MST
> +	 * configurations such as a TBT dock (e.g. 2x4K displays)
> +	 * the combined DP stream bandwidth can exceed the link capacity
> +	 * and cause subsequent commits to fail with -ENOSPC.
> +	 * igt_require_mst_link_bw() detects this and selects the highest
> +	 * modes that fit the link budget; for non-MST setups it is a
> +	 * no-op.  Update data->highest_mode[] before create_framebuffers()
> +	 * so that FBs are allocated at the BW-constrained dimensions and
> +	 * the stress loop commits with a mode the driver will accept.
> +	 */
> +	igt_display_reset(display);
> +	for_each_connected_output(display, output) {
> +		igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
> +
> +		if (!crtc || !data->highest_mode[pipe]) {
> +			if (++pipe >= IGT_MAX_PIPES)
> +				break;
> +			continue;
> +		}
> +
> +		igt_output_set_crtc(output, crtc);
> +		igt_output_override_mode(output, data->highest_mode[pipe]);
> +		pipe++;
> +		if (pipe >= IGT_MAX_PIPES)
> +			break;
> +	}
> +
> +	igt_require_mst_link_bw(display);
> +
> +	/* Update highest_mode[] with the (possibly fitted) modes. */
> +	for_each_connected_output(display, output) {
> +		igt_crtc_t *crtc = output->pending_crtc;
> +		enum pipe p;
> +
> +		if (!crtc)
> +			continue;
> +
> +		p = crtc->pipe;
> +		if (!data->highest_mode[p])
> +			continue;
> +
> +		data->highest_mode[p] = igt_output_get_mode(output);
> +		igt_assert(data->highest_mode[p]);
> +		igt_info("Mode for pipe %d after BW fitting:\n", (int)p);

There's a helper for printing pipe name. (But hopefully you can just
switch to using igt_crtc_t and CRTC index.)

> +		kmstest_dump_mode(data->highest_mode[p]);
> +	}
> +
>  	create_framebuffers(data);
>  
>  	if (intel_gen(intel_get_drm_devid(data->drm_fd)) > 9)

-- 
Jani Nikula, Intel
