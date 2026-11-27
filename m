Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61776606A31E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ijQgrLy+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1049A10E045;
	Fri, 27 Nov 2026 08:47:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE98311289E
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795769207; x=1827305207;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ouX/oKmUSeCZtDdc9IH/pNY7+NbLPS9b28T9/G07sxc=;
 b=ijQgrLy+7XM3aOLE0C/v4UxkO1csoqKC/1dnsMUpUAtLfY71D3JpGYwA
 U13y+EiS3tSB0PiLv2+BEm0SliRSx/UXVCphFZHs9lxsaoPDQCTS48+UF
 Ml7iqRKVIE0B856r6YHSxXgOnDuKnwbh1z08tBfC5Oh9+569vpQmp4hGK
 0jMSonH68cQnlFlc6pyZN8gaiCJ4752AwyMbFo2SobbMSh9yx7fTC4lxo
 gDEsOv16CUQbrQOknVCNmr92cYe4uOVDQO5AMI5ym/xiVj5MouHsYFlq6
 qJ1iYF3hfjfYDLsYsTn9kT/JU05S4aQL116tjMYzgkxSwDo1wV1aO8RpX A==;
X-CSE-ConnectionGUID: howUBjiGRECCBp1rnaESaA==
X-CSE-MsgGUID: yNC6fDpzQCucwkUVtcRrKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4586622"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4586622"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 00:46:47 -0800
X-CSE-ConnectionGUID: AmaZxVPJSUuvADnYgwFDhw==
X-CSE-MsgGUID: XfrAb+UxR4GY+Zcaql2U/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12382215"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 00:46:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Avandhica S R <avandhica.s.r@intel.com>, igt-dev@lists.freedesktop.org
Cc: sowmiya.s@intel.com, avandhica.s.r@intel.com
Subject: Re: [PATCH i-g-t v3 1/3] tests/kms_plane_multiple: Fix plane count
 and shuffle bugs
In-Reply-To: <20261127051010.937287-2-avandhica.s.r@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261127051010.937287-1-avandhica.s.r@intel.com>
 <20261127051010.937287-2-avandhica.s.r@intel.com>
Date: Fri, 27 Nov 2026 10:46:42 +0200
Message-ID: <ad0199b47d9c09a0216078c7c53822f003863bfd@intel.com>
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

On Fri, 27 Nov 2026, Avandhica S R <avandhica.s.r@intel.com> wrote:
> Use the CRTC's actual plane count for memory allocations,
> fixed the shuffle randomization range and used try_commit
> instead of commit for unsupported plane combinations so
> that the test skips rather than asserting.
>
> v2:
> - separate fix and feature patch (kamil)
>
> v3:
> - keep fix for plane count and shuffle range as one separate
> patch (kamil)
> - use prefix for test in subject (kamil)
>
> Signed-off-by: Avandhica S R <avandhica.s.r@intel.com>
> ---
>  tests/kms_plane_multiple.c | 55 +++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 27 deletions(-)
>
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 0d338eeb5..1d53eba92 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -105,19 +105,19 @@ struct {
>  /*
>   * Common code across all tests, acting on data_t
>   */
> -static void test_init(data_t *data, igt_crtc_t *crtc, int n_planes)
> +static void test_init(data_t *data, igt_crtc_t *crtc)
>  {
>  	data->pipe_crc1 = igt_crtc_crc_new(crtc,
>  					   IGT_PIPE_CRC_SOURCE_AUTO);
>  
> -	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
> +	data->plane1 = calloc(crtc->n_planes, sizeof(*data->plane1));
>  	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for planes\n");
>  
> -	data->fb1 = calloc(n_planes, sizeof(struct igt_fb));
> +	data->fb1 = calloc(crtc->n_planes, sizeof(struct igt_fb));
>  	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for FBs\n");
>  }
>  
> -static void test_fini(data_t *data, igt_output_t *output, int n_planes)
> +static void test_fini(data_t *data, igt_output_t *output)
>  {
>  	/* reset the constraint on the pipe */
>  	igt_output_set_crtc(output, NULL);
> @@ -212,7 +212,7 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
>  	int *y;
>  	int *size;
>  	int i;
> -	int* suffle;
> +	int *suffle;
>  
>  	igt_output_set_crtc(output,
>  			    crtc);
> @@ -242,13 +242,13 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
>  		int n, m;
>  		int a, b;
>  
> -		n = rand() % (crtc->n_planes-1);
> -		m = rand() % (crtc->n_planes-1);
> +		n = rand() % (crtc->n_planes);
> +		m = rand() % (crtc->n_planes);
>  
>  		/*
>  		 * keep primary plane at its place for test's sake.
>  		 */
> -		if(n == primary->index || m == primary->index)
> +		if (n == primary->index || m == primary->index)
>  			continue;
>  
>  		a = suffle[n];
> @@ -306,10 +306,10 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
>  	create_fb_for_mode_position(data, output, mode, color, x, y,
>  				    size, size, modifier, max_planes, &fb[primary->index]);
>  	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
> -	free((void*)x);
> -	free((void*)y);
> -	free((void*)size);
> -	free((void*)suffle);
> +	free((void *)x);
> +	free((void *)y);
> +	free((void *)size);
> +	free((void *)suffle);

If you're changing this (and in general, style changes belong in
separate patches) then please just remove the casts to void *
altogether. They're unnecessary in C.

BR,
Jani.


>  }
>  
>  /*
> @@ -331,7 +331,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
>  	color_t blue  = { 0.0f, 0.0f, 1.0f };
>  	igt_crc_t crc;
>  	igt_plane_t *plane;
> -	int i;
> +	int i, ret;
>  	int err, c = 0;
>  	int iterations = max(1, opt.iterations);
>  	bool loop_forever;
> @@ -349,7 +349,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
>  			iterations, iterations > 1 ? "iterations" : "iteration");
>  	}
>  
> -	test_init(data, crtc, n_planes);
> +	test_init(data, crtc);
>  
>  	get_reference_crc(data, output,
>  			  crtc,
> @@ -370,7 +370,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
>  		igt_output_set_crtc(output, NULL);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
> -		for (int x = 0; x < c; x++)
> +		for (int x = 0; x < crtc->n_planes; x++)
>  			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>  	} while (!err && c < n_planes);
>  
> @@ -388,7 +388,8 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
>  		prepare_planes(data, crtc, &blue,
>  			       data->plane1, modifier, c, output, data->fb1);
>  
> -		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		igt_skip_on(ret != 0);
>  		igt_pipe_crc_start(data->pipe_crc1);
>  
>  		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1, &crc);
> @@ -402,13 +403,12 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
>  		igt_output_set_crtc(output, NULL);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
> -		for (int x = 0; x < c; x++)
> +		for (int x = 0; x < crtc->n_planes; x++)
>  			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>  
>  		i++;
>  	}
> -
> -	test_fini(data, output, n_planes);
> +	test_fini(data, output);
>  }
>  
>  static void
> @@ -430,23 +430,23 @@ test_plane_position(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>  }
>  
>  static void test_init_2_display(data_t *data, igt_crtc_t *crtc1,
> -				igt_crtc_t *crtc2, int n_planes)
> +				igt_crtc_t *crtc2)
>  {
>  	data->pipe_crc1 = igt_crtc_crc_new(crtc1,
>  					   IGT_PIPE_CRC_SOURCE_AUTO);
>  	data->pipe_crc2 = igt_crtc_crc_new(crtc2,
>  					   IGT_PIPE_CRC_SOURCE_AUTO);
>  
> -	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
> +	data->plane1 = calloc(crtc1->n_planes, sizeof(*data->plane1));
>  	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for planes\n");
>  
> -	data->plane2 = calloc(n_planes, sizeof(*data->plane2));
> +	data->plane2 = calloc(crtc2->n_planes, sizeof(*data->plane2));
>  	igt_assert_f(data->plane2 != NULL, "Failed to allocate memory for planes\n");
>  
> -	data->fb1 = calloc(n_planes, sizeof(struct igt_fb));
> +	data->fb1 = calloc(crtc1->n_planes, sizeof(struct igt_fb));
>  	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for FBs\n");
>  
> -	data->fb2 = calloc(n_planes, sizeof(struct igt_fb));
> +	data->fb2 = calloc(crtc2->n_planes, sizeof(struct igt_fb));
>  	igt_assert_f(data->fb2 != NULL, "Failed to allocate memory for FBs\n");
>  }
>  
> @@ -480,7 +480,7 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
>  {
>  	color_t blue  = { 0.0f, 0.0f, 1.0f };
>  	igt_crc_t crc1, crc2;
> -	int n_planes;
> +	int n_planes, ret;
>  
>  	n_planes = min(crtc1->n_planes, crtc2->n_planes);
>  	if (!opt.all_planes)
> @@ -494,7 +494,7 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
>  	 */
>  
>  	test_init_2_display(data, crtc1,
> -			    crtc2, n_planes);
> +			    crtc2);
>  	get_reference_crc(data, output1,
>  			  crtc1,
>  			  data->pipe_crc1, &blue,
> @@ -511,7 +511,8 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
>  		       data->plane2,
>  		       modifier, 2, output2, data->fb2);
>  
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_skip_on(ret != 0);
>  	igt_pipe_crc_start(data->pipe_crc1);
>  	igt_pipe_crc_start(data->pipe_crc2);

-- 
Jani Nikula, Intel
