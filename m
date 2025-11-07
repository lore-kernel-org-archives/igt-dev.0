Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97256CCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 13:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEA210EACC;
	Fri,  7 Nov 2025 13:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNVv0Fjo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B44F10E0AB
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762523648; x=1794059648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=61exgT0EeQ2aNt6rgGBgPOKdJ9gIaTF6mEBZKX4M7/s=;
 b=NNVv0Fjobft9TdmVvGOtt5SBm3UAaV3IQm9UqVgAU9noUa72gwmQbf87
 06zm2KKt0N6hUrVJcc33QhRiBBCjHBJ/l7MQUGporY27RqDrXaUGfDLWo
 y2H62ZyHij9L5vsD8hzNLz33C+bKye41x8/955mYwwP9Ue6xweJqrFNXG
 Y8K82GT6BY3gDTX8MdcxfLmML/Wj9WazGI5kKzBgsegI8/e+OBkvXQXa5
 1bXn/Shw41udVUbxCu38jvoGeRZT9IgyyPbTpbhg119N1Z1CnbymuEx+p
 S+EMfEvVRRFTytE90XWO8sXdpmLyxWMco0zHvIGlxGFSrtkSIFjWjIVhr g==;
X-CSE-ConnectionGUID: ZqtQo1HDRSGPpUScZBkRjA==
X-CSE-MsgGUID: RF1VnK2NQV+PK5/VCp7IpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="76023889"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="76023889"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 05:54:07 -0800
X-CSE-ConnectionGUID: yLRSKqZIRl2Myd6Ckg1JBQ==
X-CSE-MsgGUID: Wt13vVvjRd6AVRpCU7CBeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="211487260"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.106])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 05:54:05 -0800
Date: Fri, 7 Nov 2025 15:54:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, pranay.samala@intel.com,
 "Syrjala, Ville" <ville.syrjala@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Reduce debug log
 level in CI for scaling tests
Message-ID: <aQ35-kADO2KSZVx8@intel.com>
References: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
 <20251106092204.1505129-2-ramanaidu.naladala@intel.com>
 <191a8b272532dbd8de15b380b583de718a37e44f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <191a8b272532dbd8de15b380b583de718a37e44f@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Nov 06, 2025 at 03:09:08PM +0200, Jani Nikula wrote:
> On Thu, 06 Nov 2025, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrote:
> > Reduce excessive logging in CI environments when multiple outputs
> > are connected. It prevents CI runners from exceeding disk usage
> > limits.
> 
> So how do we debug issues when there are no KMD debug logs? This can't
> be the go-to solution in the long run.

Yeah, this stuff is already causing problems. Eg.
igt@kms_atomic_transition@plane-toggle-modeset-transition keeps
failing randomly on tgl, but since the debugs are disabled the 
logs are completely useless.

I've thrown https://patchwork.freedesktop.org/series/155702 a few
times at trybot to get more logs, but since it's random no luck so 
far. If we didn't have this "disable debugs" crap in the first
place the bug would probably have been solved as soon as it
appeared.

> 
> Moreover, update_debug_mask_if_ci() doesn't even log the actual mask
> being switched to.
> 
> 
> BR,
> Jani.
> 
> 
> >
> > Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> > ---
> >  tests/kms_plane_scaling.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > index 63d35d76b..34c8f8a64 100644
> > --- a/tests/kms_plane_scaling.c
> > +++ b/tests/kms_plane_scaling.c
> > @@ -32,6 +32,7 @@
> >  
> >  #include "igt.h"
> >  #include "igt_vec.h"
> > +#include "igt_sysfs.h"
> >  #include <math.h>
> >  
> >  /**
> > @@ -1358,11 +1359,15 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
> >  		data.devid = is_intel_device(data.drm_fd) ?
> >  			intel_get_drm_devid(data.drm_fd) : 0;
> >  		igt_require(data.display.is_atomic);
> > +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> >  	}
> >  
> >  	igt_subtest_group {
> >  		igt_output_t *output;
> >  
> > +		if (igt_get_connected_output_count(&data.display) > 1)
> > +			update_debug_mask_if_ci(DRM_UT_DRIVER | DRM_UT_CORE);
> > +
> >  		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
> >  			igt_describe(scaler_with_pixel_format_tests[index].describe);
> >  			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
