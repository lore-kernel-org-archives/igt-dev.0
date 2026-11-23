Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F45606A31F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CqeL17eG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B65210E402;
	Mon, 23 Nov 2026 09:33:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E04310E402
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795426338; x=1826962338;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y+XPidYHoHRNYDfl0ok0fT92rai5RCAYlYQQFC9wqhM=;
 b=CqeL17eGlQpyhd8iHAlSA8ogZrsLGIwtXEuVz4FQTALpLdiBqyF+EuhO
 XxYaVZNYR01R06Mx8q5LJ3aKV+0uYld6e7gb61PoARcDJaZ9y/rCbLCrV
 V7RfsezNuGXOZgRpEMDnuL9SbpbB39KZ1IRNsCQH5XxvJzVDS7juuEAvM
 FtrkLSbgHdlB0CDra87sFgfRJXatI2ykFeXc0Mj5IfOx7ctn4LodDCXDS
 SL5x7F9fSD6s4liiFV38QbfbZrez2PBjNqhyHdVg1Fp8gGZTb4v7SmBwW
 zAigIK/S17cIG4JLQlwmEovh8UJLDQ9SvtZKtp098gLoUxuduvDVWWPkX Q==;
X-CSE-ConnectionGUID: ABmmuthfQhCE9xkkAyX/Tw==
X-CSE-MsgGUID: qoKc2Ly2QvKLfODEz7/AkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4112836"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4112836"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:32:18 -0800
X-CSE-ConnectionGUID: ouds1GN8RbO7wFQRL4A6+Q==
X-CSE-MsgGUID: YLbLddhqRb68CEB1gcbMWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11237251"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:32:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to first
 and last CRTC
In-Reply-To: <20261123055604.724128-1-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261123055604.724128-1-jeevan.b@intel.com>
Date: Mon, 23 Nov 2026 11:32:14 +0200
Message-ID: <621c782368a8d45b97bddab30c05d49198838a2f@intel.com>
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

On Mon, 23 Nov 2026, Jeevan B <jeevan.b@intel.com> wrote:
> Running on every CRTC makes the test hit the timeout on simulation.
> Restrict it to the first and last usable CRTC when running in
> simulation, which keeps coverage while avoiding the timeout.
>
> v2:
>  - Test the first and last usable CRTC instead of the first 2 pipes,
>    and drop SIM_MAX_PIPES.
> v3:
>  - Skip non-first/non-last CRTCs inside the existing loop.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_plane_cursor.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 4b69f1a17..dfe1f2418 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -288,7 +288,7 @@ int igt_main()
>  {
>  	static const int cursor_sizes[] = { 64, 128, 256 };
>  	data_t data = { .max_curw = 64, .max_curh = 64 };
> -	igt_crtc_t *crtc;
> +	igt_crtc_t *crtc, *last_crtc;
>  	igt_output_t *output;
>  	igt_display_t *display;
>  	int i, j;
> @@ -315,6 +315,8 @@ int igt_main()
>  		igt_require(data.display.is_atomic);
>  		igt_display_require_output(&data.display);
>  		display = &data.display;
> +		last_crtc = igt_crtc_for_pipe(display,
> +					      igt_display_n_crtcs(display) - 1);

That's just plain wrong in many different ways.

Basically there's no guarantee "igt_display_n_crtcs(display) - 1" is a
pipe that exists. Pipes aren't guaranteed to be consecutive, and they
may not have anything to do with the number of CRTCs or CRTC indexes or
anything.

Even if "igt_display_n_crtcs(display) - 1" exists, it may be any pipe,
first, last, or something in between. You just can't make any
assumptions about pipe numbering or how they correspond to CRTCs.

And, in general, do not use igt_crtc_for_pipe() at all if it can be
avoided. Everything should be CRTC based if possible.

---

Now, we've seen patches here that do stuff on first/last pipe only, or
first/last CRTC only, or whatever.

I've said it a few times in various contexts, but this sprinkling of
random checks within loops is really not the way to go.

What you want is a CRTC index mask that you initialize in the beginning,
and the test loop only uses CRTCs that are in the mask. The test loop
shouldn't need to do any of this "igt_run_in_simulation()" or whatever.


BR,
Jani.


>  
>  		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &data.max_curw);
>  		igt_assert(ret == 0 || errno == EINVAL);
> @@ -327,6 +329,8 @@ int igt_main()
>  	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>  		igt_describe_f("%s", tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", tests[i].name) {
> +			bool tested_first = false;
> +
>  			for_each_crtc_with_single_output(&data.display, crtc,
>  							 output) {
>  				if ((tests[i].flags & TEST_OVERLAY) &&
> @@ -334,6 +338,15 @@ int igt_main()
>  							     DRM_PLANE_TYPE_OVERLAY))
>  					continue;
>  
> +				/*
> +				 * In simulation, only test the first usable
> +				 * CRTC and the last one to avoid timeouts
> +				 * while keeping coverage.
> +				 */
> +				if (igt_run_in_simulation() && tested_first &&
> +				    crtc != last_crtc)
> +					continue;
> +
>  				igt_display_reset(display);
>  
>  				igt_output_set_crtc(output,
> @@ -341,6 +354,8 @@ int igt_main()
>  				if (!intel_pipe_output_combo_valid(display))
>  					continue;
>  
> +				tested_first = true;
> +
>  				test_init(&data,
>  					  crtc,
>  					  output,

-- 
Jani Nikula, Intel
