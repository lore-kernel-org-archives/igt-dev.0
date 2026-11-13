Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C628606A898
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 13:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NYTH30Lf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAE9112594;
	Fri, 13 Nov 2026 13:54:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798A510F2D1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794577996; x=1826113996;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2kW+zVJGzvB5beE8zbVfjBREZvTfUXa4R3CiaYlU3SY=;
 b=NYTH30LfPqnK2/rTsc2gLGcmsVR4307CMPvXsPC/dtIGeBOM50srirm8
 kYexQZhmX04ipTkVsW6WBMfYkIB3PrHFEwOtzBhEyr2H2nZGoHRHsV0Lp
 xduPm+cW7qybaPYfIDUB93uY+FShE1aCF8TjjoVOoPQ5lMTBGaBvDJt+w
 LvlAa9wqyruyeR77qYEhJtgnecudKmMLlMoyx26iHD/LFFY+5Z6jXuUbA
 HcrVDhqBWbBUwcQmuetzsZgvkDopUgwHtFICfpaGsM8yvw3z+F22Jm8Iv
 lfdMlRK6etxNiT57/PGpEWIjQdz1GeWaf7CsqFy9S1+pNyjbtxv0bQIgT A==;
X-CSE-ConnectionGUID: 6zJr2eMBSaWBZFIBFTpDFg==
X-CSE-MsgGUID: peLY0dpRS/SXufu3M4stmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3409549"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3409549"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:53:16 -0800
X-CSE-ConnectionGUID: INqWitcSSSe2mGoJaQzzGA==
X-CSE-MsgGUID: JSPfMfZmSMGTBisT3naWsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; d="scan'208";a="10703796"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:53:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to 2 pipes
In-Reply-To: <20261112041907.2876691-1-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261112041907.2876691-1-jeevan.b@intel.com>
Date: Fri, 13 Nov 2026 15:53:11 +0200
Message-ID: <566ec9cb86e08992f2f89b18553562230d7dd30e@intel.com>
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

On Thu, 12 Nov 2026, Jeevan B <jeevan.b@intel.com> wrote:
> Running on every pipe makes the test hit the timeout on simulation.
> Restrict it to 2 pipes when running in simulation.

This is not an Intel specific test. We should prefer generic drm/kms
naming in generic code, i.e. CRTC instead of pipe.

BR,
Jani.



>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_plane_cursor.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 4b69f1a17..5938b50c1 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -68,6 +68,9 @@ typedef struct {
>  	int h;
>  } rect_t;
>  
> +/* Max pipes to test on simulation, to avoid timeouts */
> +#define SIM_MAX_PIPES 2
> +
>  /* Common test data. */
>  typedef struct data {
>  	igt_display_t display;
> @@ -327,8 +330,14 @@ int igt_main()
>  	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>  		igt_describe_f("%s", tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", tests[i].name) {
> +			int pipes_tested = 0;
> +
>  			for_each_crtc_with_single_output(&data.display, crtc,
>  							 output) {
> +				if (igt_run_in_simulation() &&
> +				    pipes_tested >= SIM_MAX_PIPES)
> +					break;
> +
>  				if ((tests[i].flags & TEST_OVERLAY) &&
>  				    !igt_crtc_get_plane_type(crtc,
>  							     DRM_PLANE_TYPE_OVERLAY))
> @@ -361,6 +370,7 @@ int igt_main()
>  				}
>  
>  				test_fini(&data);
> +				pipes_tested++;
>  			}
>  		}
>  	}

-- 
Jani Nikula, Intel
