Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2F5606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 09:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMLUAeHU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8C910E28A;
	Mon, 16 Nov 2026 09:36:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A8510ED97
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794821744; x=1826357744;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=u/BrxGsD6jb2/O5lI2j3IRL93AbTvhG2dnmNUQxlEy8=;
 b=mMLUAeHUBafEyzxJ4ZAXeZ7xEnOu0dVD90Wcj2tCBLxMTmtvDSjgIawI
 MxjKZ2owKx7dSTNZeTMTqbxe3epF862tiWxqLctJWm+Y61ShmxQN+rZUM
 ydFi83xo/DCOiY8PXZ2OnxzthocRWPisWoE53AwxXPM8Yn+RgcT8GPMYo
 WZNYGJqHmcwR45fXLDM4skYGu/lgNsUTVqh575lm/NMDk0Mhsmip+cv+g
 Jp7t/zt2jrP7dO8h+cC2R/Ck/5vJkcWUF7K3hxh/YC6i+N8v26mthWZDo
 qwis9UkyOfLGvi8ThL2tr9YbBc4MRR0RKL1iuMTxLhovpBUSNnoFkkp8v Q==;
X-CSE-ConnectionGUID: BYh72hP6R/6rbnk0FBCzqg==
X-CSE-MsgGUID: RB9yrAWhSyC/Q+oZ5PGevw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3446265"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3446265"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:35:37 -0800
X-CSE-ConnectionGUID: 88aQTOgAQQaSR+1vrJBILg==
X-CSE-MsgGUID: +qVTSFJ1Q16upumlbHFcMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="10035016"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:35:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to first
 and last CRTC
In-Reply-To: <20261116040120.3197381-1-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261116040120.3197381-1-jeevan.b@intel.com>
Date: Mon, 16 Nov 2026 11:35:32 +0200
Message-ID: <b1165a2bd1484d569c1422c94cf1cc9da2a51b7a@intel.com>
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

On Mon, 16 Nov 2026, Jeevan B <jeevan.b@intel.com> wrote:
> Running on every CRTC makes the test hit the timeout on simulation.
> Restrict it to the first and last usable CRTC when running in
> simulation, which keeps coverage while avoiding the timeout.
>
> v2:
>  - Test the first and last usable CRTC instead of the first 2 pipes, and
>    drop SIM_MAX_PIPES.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_plane_cursor.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 4b69f1a17..982505575 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -327,8 +327,37 @@ int igt_main()
>  	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>  		igt_describe_f("%s", tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", tests[i].name) {
> +			igt_crtc_t *first_crtc = NULL, *last_crtc = NULL;
> +
> +			/*
> +			 * In simulation, only test the first and last usable
> +			 * CRTC to avoid timeouts while keeping coverage.
> +			 */
> +			if (igt_run_in_simulation()) {
> +				for_each_crtc_with_single_output(&data.display,
> +								 crtc, output) {
> +					if ((tests[i].flags & TEST_OVERLAY) &&
> +					    !igt_crtc_get_plane_type(crtc,
> +								     DRM_PLANE_TYPE_OVERLAY))
> +						continue;
> +
> +					igt_display_reset(display);
> +					igt_output_set_crtc(output, crtc);
> +					if (!intel_pipe_output_combo_valid(display))
> +						continue;
> +
> +					if (!first_crtc)
> +						first_crtc = crtc;
> +					last_crtc = crtc;
> +				}
> +			}

Why are you duplicating the for_each_crtc_with_single_output() loop?
Aren't you also *adding* more modesets for simulation here?!

BR,
Jani.


> +
>  			for_each_crtc_with_single_output(&data.display, crtc,
>  							 output) {
> +				if (igt_run_in_simulation() &&
> +				    crtc != first_crtc && crtc != last_crtc)
> +					continue;
> +
>  				if ((tests[i].flags & TEST_OVERLAY) &&
>  				    !igt_crtc_get_plane_type(crtc,
>  							     DRM_PLANE_TYPE_OVERLAY))

-- 
Jani Nikula, Intel
