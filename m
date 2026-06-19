Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57765CD98F2
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 11:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BD710F550;
	Fri, 19 Jun 2026 11:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtXN78sR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F0A10F550
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781869864; x=1813405864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NLRWAhDwTILJLrvBxD2fUyoxuT+55sdyEGh8VGCwoec=;
 b=dtXN78sRzP54RMPriENt53lOpLZmMm3sSqyhVL79r/Ga1s5jqm/RmuJY
 TyyaMxTvaoVGhhPbsbWbe2EfP3OeM76XfXA7iLxbXR2849xzMT4rroGh0
 OEGfKGY3yGO0zwbpWER13pXQwssjamD+dDFD6NhT2HxyKX+AzPsvM1ruJ
 nROKDKfjAzqENQyhJ1g9KEQPtFCyem56CvCklTAj9+gsRod7niXDj1zyX
 oYqIDW47YGess9sTK57bFuzVIQxp18fv9hCI+mfxB8C7PpCzKVBNsqFRH
 TJ1WRUEAWpw148JXtyqMTkicT+I4hNhkbBAjbPQkTvTmzm1kISOvOs0/x Q==;
X-CSE-ConnectionGUID: I+ERGfx+TlqthkKBnb5rcw==
X-CSE-MsgGUID: SWcJYXn5TCKrKVcxK0xnZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82757249"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="82757249"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:51:04 -0700
X-CSE-ConnectionGUID: dWM4Ojb6R96v4DIuCtNTsw==
X-CSE-MsgGUID: 952msFwsSribEVZK3tbLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="272310370"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 04:51:03 -0700
Date: Fri, 19 Jun 2026 13:51:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
Cc: Lee Shawn C <shawn.c.lee@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [i-g-t, v6, 2/2] tests/kms_vrr: add support for full range
 refresh rate testing
Message-ID: <20260619115100.eu34ndefg4sitmdc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, igt-dev@lists.freedesktop.org
References: <shawn.c.lee@intel.com>
 <20260515063251.2239524-1-shawn.c.lee@intel.com>
 <20260515063251.2239524-3-shawn.c.lee@intel.com>
 <77aeb23d-8f8d-4ee1-9338-8a05955e5fae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77aeb23d-8f8d-4ee1-9338-8a05955e5fae@intel.com>
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

Hi Naladala,,
On 2026-05-19 at 14:18:42 +0530, Naladala, Ramanaidu wrote:
> Hi Lee Shawn,
> 
> On 5/15/2026 12:02 PM, Lee Shawn C wrote:
> > Currently, kms_vrr tests fixed step increments within the VRR range.
> > To better validate hardware stability and potential issues across the
> > entire spectrum, this patch adds a 'full-range' testing mode.
> > 
> > When the full-range flag is enabled, the test will:
> > 1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
> > 2. For standard testing, maintain the existing behavior of incrementing
> >     from minimum to maximum using the defined step size.
> > 
> > v2: Fix build failure by adding documentation for the new subtest.
> > v3: Remove unnecessary '!!' operator when assigning to bool.
> > v4: Add full-range (top-down/bottom-up) subtests to verify all supported
> >      RR within VRR range.
> > v5: Fix build failure for the new subtest.
> > v6: Revert commit 862eb176244f ("tests/kms_vrr: Start virtual RR test
> >      above midpoint to avoid mode fallback").
> > 
> > Cc: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
> > Signed-off-by: Lee Shawn C<shawn.c.lee@intel.com>
> > ---
> >   tests/kms_vrr.c | 126 ++++++++++++++++++++++++++++++++++++------------
> >   1 file changed, 95 insertions(+), 31 deletions(-)
> > 
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> > index 8f5c4a7c1501..b058a40df0a3 100644
> > --- a/tests/kms_vrr.c
> > +++ b/tests/kms_vrr.c
> > @@ -62,9 +62,11 @@
> >    * Description: Test to switch RR seamlessly without modeset.
> >    * Mega feature: General Display Features
> >    *
> > - * SUBTEST: seamless-rr-switch-virtual
> > - * Description: Test to create a Virtual Mode in VRR range and switch to it
> > - * 		without a full modeset.
> > + * SUBTEST: seamless-rr-switch-virtual-top-down
> > + * Description: Vrr seamless refresh rate switch for virtual modes using full range
> > + *
> > + * SUBTEST: seamless-rr-switch-virtual-bottom-up
> > + * Description: Vrr seamless refresh rate switch for virtual modes using full range
> >    *
> >    * SUBTEST: lobf
> >    * Description: Test to validate link-off between active frames in non-psr
> > @@ -93,9 +95,10 @@ enum {
> >   	TEST_FLIPLINE = 1 << 3,
> >   	TEST_SEAMLESS_VRR = 1 << 4,
> >   	TEST_SEAMLESS_DRRS = 1 << 5,
> > -	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
> > -	TEST_FASTSET = 1 << 7,
> > -	TEST_MAXMIN = 1 << 8,
> > +	TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN = 1 << 6,
> > +	TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP = 1 << 7,
> > +	TEST_FASTSET = 1 << 8,
> > +	TEST_MAXMIN = 1 << 9,
> >   	TEST_LINK_OFF = 1 << 10,
> >   	TEST_NEGATIVE = 1 << 11,
> >   	TEST_FORCE_RR = 1 << 12,
> > @@ -227,7 +230,7 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
> >   	for (i = 0; i < connector->count_modes; i++)
> >   		if (connector->modes[i].hdisplay == mode.hdisplay &&
> >   		    connector->modes[i].vdisplay == mode.vdisplay &&
> > -		    connector->modes[i].clock < mode.clock &&
> > +		    connector->modes[i].clock <= mode.clock &&
> >   		    connector->modes[i].vrefresh < mode.vrefresh &&
> >   		    connector->modes[i].vrefresh >= vrr_min)
> >   			mode = connector->modes[i];
> > @@ -235,13 +238,57 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
> >   	return mode;
> >   }
> > -static void
> > -virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
> > +static bool
> > +virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float virtual_refresh_rate)
> >   {
> >   	uint64_t clock_hz = mode->clock * 1000;
> > +	uint16_t virtual_vtotal;
> > +
> > +	virtual_vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
> > +	if (is_intel_device(data->drm_fd) && virtual_vtotal > 8192) {
> > +		igt_info("VTotal (%d) already exceed 8192 at %fHz\n", virtual_vtotal, virtual_refresh_rate);
> > +		return false;
> > +	}
> > -	mode->vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
> > +	mode->vsync_start = virtual_vtotal - (mode->vtotal - mode->vsync_start);
> > +	mode->vsync_end   = virtual_vtotal - (mode->vtotal - mode->vsync_end);
> > +	mode->vtotal = virtual_vtotal;
> >   	mode->vrefresh = virtual_refresh_rate;
> > +	return true;
> > +}
> > +
> > +static drmModeModeInfo*
> > +get_selected_fixed_mode(igt_output_t *output, bool lowest)
> > +{
> > +	drmModeConnectorPtr connector = output->config.connector;
> > +	drmModeModeInfo *selected_mode = NULL;
> > +
> > +	for (int i = 0; i < connector->count_modes; i++) {
> > +		drmModeModeInfo *m = &connector->modes[i];
> > +
> > +		if (m->type & (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)) {
> > +			if (!selected_mode) {
> > +				selected_mode = m;
> > +				continue;
> > +			}
> > +
> > +			if (lowest) {
> > +				if (m->vrefresh < selected_mode->vrefresh)
> > +					selected_mode = m;
> > +			} else {
> > +				if (m->vrefresh > selected_mode->vrefresh)
> > +					selected_mode = m;
> > +			}
> > +		}
> > +	}
> > +
> > +	if (selected_mode) {
> > +		igt_info("Found Target Fixed Mode: \"%s\" %dHz (vtotal: %d)\n",
> > +			 selected_mode->name, selected_mode->vrefresh, selected_mode->vtotal);
> > +		return selected_mode;
> > +	}
> > +
> > +	return NULL;
> >   }
> >   /* Read min and max vrr range from the connector debugfs. */
> > @@ -754,22 +801,28 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
> >   			       igt_output_t *output, uint32_t flags)
> >   {
> >   	uint32_t result;
> > -	unsigned int vrefresh;
> > +	int vrefresh;
> >   	uint64_t rate[] = {0};
> >   	uint32_t step_size;
> This variable step_size is unused; please remove it.
> > -	drmModeModeInfo virtual_mode;
> > +	int start, end, step;
> > +	drmModeModeInfo *virtual_mode = NULL;
> > +	bool need_low_rr = flags & TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP;
> > -	igt_info("Use HIGH_RR Mode as default\n");
> > -	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> > +	virtual_mode = get_selected_fixed_mode(output, need_low_rr);
> > +	if (!virtual_mode)
> > +		return;
> > +
> > +	igt_info("Use %s_RR Mode as default\n", need_low_rr ? "LOW" : "HIGH");
> > +	kmstest_dump_mode(virtual_mode);
> >   	prepare_test(data, output, crtc);
> > -	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> > +	rate[0] = igt_kms_frame_time_from_vrefresh(virtual_mode->vrefresh);
> >   	/*
> >   	 * Sink with DRR and VRR can be in downclock mode so
> > -	 * switch to highest refresh rate mode.
> > +	 * switch to desired requested rate mode.
> >   	 */
> > -	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> > +	igt_output_override_mode(output, virtual_mode);
> >   	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
> >   	result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
> > @@ -777,22 +830,29 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
> >   		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> >   		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
> > -	/*
> > -	 * Calculate step size by considering the no. of steps required to
> > -	 * reach Vmin to Vmax as 5.
> > -	 */
> > -	step_size = (data->range.max - data->range.min) / 5;
> > -
> >   	/* Switch to Virtual RR */
> > -	virtual_mode = *igt_output_get_mode(output);
> > +	virtual_mode = igt_output_get_mode(output);
> > +
> > +	if (flags & TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN) {
> > +		start = data->range.max;
> > +		end = data->range.min;
> > +		step = -1;
> > +	} else {
> > +		start = data->range.min;
> > +		end = data->range.max;
> > +		step = 1;
> > +	}
> > -	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
> > -		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
> > +	for (vrefresh = start; (step > 0) ? (vrefresh <= end) : (vrefresh >= end); vrefresh += step) {
> > +		if (!virtual_rr_vrr_range_mode(data, virtual_mode, vrefresh))
> > +			continue;
> >   		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> > -		kmstest_dump_mode(&virtual_mode);
> > +		kmstest_dump_mode(virtual_mode);
> > -		igt_output_override_mode(output, &virtual_mode);
> > +		igt_output_override_mode(output, virtual_mode);
> > +
> > +		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
> >   		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
> >   		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
> > @@ -1092,9 +1152,13 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
> >   		igt_subtest_with_dynamic("flip-basic-fastset")
> >   			run_vrr_test(&data, test_basic, TEST_FASTSET);
> > -		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
> > -		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
> > -			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
> > +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> > +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-top-down")
> > +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);
> > +
> > +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> > +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-bottom-up")
> > +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);
> Add a check in |seamless-rr-switch-virtual-bottom-up| to ensure probed modes
> have the identical clock, and continue the test only when this condition is
> satisfied.
> >   		igt_describe("Test to validate the link-off between active frames in "
> >   			     "non-PSR operation.");
> Please fix the reported |checkpatch.pl| style warnings:

Actually some checkpatch warnings should be ignored, below is
one of such cases for drm type:

> index.html.4:87: CHECK:CAMELCASE: Avoid CamelCase: <drmModeModeInfo>

Also, line too long, if only a little over 100, could also be
ignored.

Regards,
Kamil

> #87: FILE: tests/kms_vrr.c:242:
> +virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float
> virtual_refresh_rate)
> 
> index.html.4:94: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
> #94: FILE: tests/kms_vrr.c:249:
> +               igt_info("VTotal (%d) already exceed 8192 at %fHz\n",
> virtual_vtotal, virtual_refresh_rate);
> 
> index.html.4:109: CHECK:CAMELCASE: Avoid CamelCase: <drmModeConnectorPtr>
> #109: FILE: tests/kms_vrr.c:263:
> +       drmModeConnectorPtr connector = output->config.connector;
> 
> index.html.4:203: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
> #203: FILE: tests/kms_vrr.c:846:
> +       for (vrefresh = start; (step > 0) ? (vrefresh <= end) : (vrefresh >=
> end); vrefresh += step) {
> 
> index.html.4:214: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
> #214: FILE: tests/kms_vrr.c:855:
> +  igt_assert(igt_display_try_commit_atomic(&data->display,
> DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
> 
> index.html.4:227: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
> #227: FILE: tests/kms_vrr.c:1157:
> +                       run_vrr_test(&data, test_seamless_virtual_rr_basic,
> TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);
> 
> index.html.4:231: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
> #231: FILE: tests/kms_vrr.c:1161:
> +                       run_vrr_test(&data, test_seamless_virtual_rr_basic,
> TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);
> 
> total: 0 errors, 5 warnings, 2 checks, 186 lines checked.
> 
> 
>  - Thanks
