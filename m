Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F60E9907C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 10:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BC710E936;
	Fri, 10 Apr 2026 10:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsD35RrO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC46810E936
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775817945; x=1807353945;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Pno4yEcGEF1gz+k14bZQ/edyDxKM6JeaEpeuWboOlXI=;
 b=UsD35RrODADhqbfm9QmPqrU1Ux8WQwec21pG09xk8ZR+Pa/pQsqo5LeR
 MltlrbDG4wAlWDtGdnXzhfGHDNjDyro2aajl9sxbqNqjwejSvb9KcbKJ/
 CuVpd6Lfv6HySYAWhFO1KOT5uf8dlUciOYcbF5QDefBerXou0mtjBdh8T
 5EDIhHUL1Bl2Q2ZyqPSp7xn25c72oRm0g1diVRLML4BQc8eiItO2pVtF1
 QEqIFCQWjvm6mN9LlVGIZavd+ge5qGHNgNepJ6ZKqg4hpKH7N9nbIWYHy
 iW2P/uSP3Xexx++t+NnnOIXjJrwBZriqDqEykNZwO2MNTemujwr2jy5nt A==;
X-CSE-ConnectionGUID: iKOFK1DTSUa4DOIxeFylkA==
X-CSE-MsgGUID: JG8262yIRf2+1Iu0bDQVlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76957003"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76957003"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 03:45:44 -0700
X-CSE-ConnectionGUID: +x7l9t+6Rc263Jnp4eC0yw==
X-CSE-MsgGUID: tzgNmzz3RsmZhbFEsQH/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="228973681"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.89])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 03:45:43 -0700
Date: Fri, 10 Apr 2026 13:45:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH i-g-t, v2] tests/intel/kms_cdclk: Skip CDCLK bump
 validation on eDP with fixed clock modes
Message-ID: <adjU0z1jJWmtpii4@intel.com>
References: <20260408181126.997093-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408181126.997093-1-swati2.sharma@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Apr 08, 2026 at 11:41:26PM +0530, Swati Sharma wrote:
> eDP panels may expose modes with the same resolution and pixel clock
> but different vtotal. Since only the vblank region differs, the CDCLK
> requirement remains identical across such modes, so no CDCLK bump is
> expected.
> 
> Skip CDCLK bump validation on eDP connectors where modes share the
> same hdisplay, vdisplay and clock but vary only in vtotal.
> 
> Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_cdclk.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 20b8a5f0a..a015afa29 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -72,6 +72,24 @@ static bool hardware_supported(data_t *data)
>  	return false;
>  }
>  
> +static bool edp_has_fixed_clock_modes(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +
> +	if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +		return false;
> +
> +	for (int i = 0; i < connector->count_modes; i++)
> +		for (int j = i + 1; j < connector->count_modes; j++)
> +			if (connector->modes[i].hdisplay == connector->modes[j].hdisplay &&
> +			    connector->modes[i].vdisplay == connector->modes[j].vdisplay &&
> +			    connector->modes[i].clock == connector->modes[j].clock &&
> +			    connector->modes[i].vtotal != connector->modes[j].vtotal)
> +				return true;
> +
> +	return false;
> +}
> +
>  static __u64 get_mode_data_rate(drmModeModeInfo *mode)
>  {
>  	__u64 data_rate = (__u64)mode->hdisplay * (__u64)mode->vdisplay * (__u64)mode->vrefresh;
> @@ -329,6 +347,20 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
>  	igt_crtc_t *crtc;
>  
>  	for_each_crtc_with_valid_output(display, crtc, output) {
> +		/*
> +		 * eDP panels may expose modes with the same resolution and
> +		 * pixel clock but different vtotal. Since only the vblank
> +		 * region differs, the CDCLK requirement remains identical
> +		 * across such modes, so no CDCLK bump is expected and
> +		 * validating it would lead to false failures.
> +		 */
> +		if ((flags & TEST_MODETRANSITION) &&
> +		    edp_has_fixed_clock_modes(output)) {
> +			igt_info("Skipping %s: eDP has modes with same clock "
> +				 "but different vtotal\n", output->name);
> +			continue;
> +		}

Seems overly complicated. Why aren't we just skipping if the highres and
lowres modes have the same dotclock?

> +
>  		igt_output_set_crtc(output,
>  				    crtc);
>  		if (!intel_pipe_output_combo_valid(display)) {
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
