Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D038ED4921F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 12:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C5F10E348;
	Fri, 12 Dec 2025 12:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRgM8zrH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7E410E348
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765542741; x=1797078741;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gtWKefLZN3kpeVK3rLkiBtkxg8AOk1RFWZnin8sLfpc=;
 b=nRgM8zrHDp8mEQwd2AsuOgRqgex4m1g/LWzDPiHPkt8AIWwO9EWPVEMH
 mKA99s/uxAuxuPhvXJHo5RpZzH46v4DdGxky5doJ5/ZALlYDueTZu3eWs
 KIocwxlh3DL+UOo1Vl765z4IWIlTnvznzRBFPzzGh/2NQ1bAyNejtbLK5
 nywv7zPyiO72Ifurz6xAbsHTzunoqvJOkcI965VKaTvU7bo18Tb1/w+BK
 XcwnWb5UrzBoemCeSS/j7wblZ59G6nbXLVshLKLuUuu8A3CDkf/dMvmmQ
 C2et6SjQX8T5WvQJDSxrZGjPb5s+1YMS5KMS+rob+30yyumRHl5jUz9dg Q==;
X-CSE-ConnectionGUID: SoqiIHuLQNGcvhF8iejPFg==
X-CSE-MsgGUID: XZIMJl7bThqoCe7lOztxzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78248851"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78248851"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 04:32:21 -0800
X-CSE-ConnectionGUID: AhOkGaItTWWHhT6fAW4Gnw==
X-CSE-MsgGUID: jvDdR453TV6ST1vVx8a6mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197076420"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:32:20 -0800
Date: Fri, 12 Dec 2025 13:32:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, santhosh.reddy.guddati@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/kms_joiner: Add function for
 pretest checks
Message-ID: <20251212123216.ewyroutl4gx4wrcl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 santhosh.reddy.guddati@intel.com, Jeevan B <jeevan.b@intel.com>
References: <20251212055717.2870018-1-karthik.b.s@intel.com>
 <20251212055717.2870018-3-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251212055717.2870018-3-karthik.b.s@intel.com>
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

Hi Karthik,
On 2025-12-12 at 11:27:16 +0530, Karthik B S wrote:
> Move igt_require checks in individual subtests to a function which is
> called from all subtests to avoid code duplication.
> 
> v2: Use enum for various joiner modes (Santhosh)
> 
> v3: Split the function for big and ultra joiner (Kamil)
>     Use igt_require_f (Kamil)
>     Minor Styling cleanups
> 

+cc Jeevan B <jeevan.b@intel.com>

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel/kms_joiner.c | 98 +++++++++++++++++++++-------------------
>  1 file changed, 52 insertions(+), 46 deletions(-)
> 
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index f8e684b47..ed82f4789 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -101,10 +101,16 @@ typedef struct {
>  	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>  	enum pipe pipe_seq[IGT_MAX_PIPES];
>  	igt_display_t display;
> +	bool ultra_joiner_supported;
>  } data_t;
>  
>  static int max_dotclock;
>  
> +enum force_mode {
> +	FORCE_ENABLE = 0,
> +	FORCE_DISABLE
> +};
> +
>  static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>  {
>  	bool status;
> @@ -179,6 +185,32 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
>  
> +static void require_ultra_joiner(data_t *data, enum force_mode mode)
> +{
> +	igt_require_f(data->ultra_joiner_supported,
> +		      "Ultra joiner not supported on this platform\n");
> +	igt_require_f(data->n_pipes >= 4, "Minimum 4 pipes required\n");
> +
> +	if (mode == FORCE_ENABLE)
> +		igt_require_f(data->non_ultra_joiner_output_count > 0,
> +			      "No non ultra joiner output found\n");
> +	else
> +		igt_require_f(data->ultra_joiner_output_count > 0,
> +			      "No ultra joiner output found\n");
> +}
> +
> +static void require_big_joiner(data_t *data, enum force_mode mode)
> +{
> +	igt_require_f(data->n_pipes >= 2, "Minimum 2 pipes required\n");
> +
> +	if (mode == FORCE_ENABLE)
> +		igt_require_f(data->non_ultra_joiner_output_count > 0,

Should this be:
		igt_require_f(data->non_big_joiner_output_count > 0,

Regards,
Kamil

> +			      "No non big joiner output found\n");
> +	else
> +		igt_require_f(data->big_joiner_output_count > 0,
> +			      "No big joiner output found\n");
> +}
> +
>  static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
>  {
>  	drmModeModeInfo bj_mode;
> @@ -554,7 +586,7 @@ int igt_main()
>  	data_t data;
>  
>  	igt_fixture() {
> -		ultra_joiner_supported = false;
> +		data.ultra_joiner_supported = false;
>  		data.big_joiner_output_count = 0;
>  		data.ultra_joiner_output_count = 0;
>  		data.non_big_joiner_output_count = 0;
> @@ -574,7 +606,7 @@ int igt_main()
>  		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>  		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
>  		if (is_dgfx && display_ver == 14)
> -			ultra_joiner_supported = true;
> +			data.ultra_joiner_supported = true;
>  
>  		for_each_connected_output(&data.display, output) {
>  			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
> @@ -630,32 +662,25 @@ int igt_main()
>  
>  	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>  	igt_subtest_with_dynamic("basic-big-joiner") {
> -			igt_require_f(data.big_joiner_output_count > 0,
> -				      "No bigjoiner output found\n");
> -			igt_require_f(data.n_pipes > 1,
> -				      "Minimum 2 pipes required\n");
> -			igt_dynamic_f("single-joiner")
> -				test_single_joiner(&data, data.big_joiner_output_count, false);
> -			if (data.big_joiner_output_count > 1)
> -				igt_dynamic_f("multi-joiner")
> -					test_multi_joiner(&data, data.big_joiner_output_count, false);
> +		require_big_joiner(&data, FORCE_DISABLE);
> +		igt_dynamic_f("single-joiner")
> +			test_single_joiner(&data, data.big_joiner_output_count, false);
> +		if (data.big_joiner_output_count > 1)
> +			igt_dynamic_f("multi-joiner")
> +				test_multi_joiner(&data, data.big_joiner_output_count, false);
>  	}
>  
>  	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>  	igt_subtest_with_dynamic("basic-ultra-joiner") {
> -			igt_require_f(data.ultra_joiner_output_count > 0,
> -				      "No ultrajoiner output found\n");
> -			igt_require_f(data.n_pipes > 3,
> -				      "Minimum 4 pipes required\n");
> -			igt_dynamic_f("single-joiner")
> -				test_ultra_joiner(&data, false, false, false);
> +		require_big_joiner(&data, FORCE_DISABLE);
> +		igt_dynamic_f("single-joiner")
> +			test_ultra_joiner(&data, false, false, false);
>  	}
>  
>  	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>  		     "when the pipe is active with a big joiner modeset");
>  	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
> -		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
> -		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> +		require_big_joiner(&data, FORCE_DISABLE);
>  		if (data.big_joiner_output_count >= 1)
>  			igt_dynamic_f("big_joiner_on_last_pipe")
>  				test_joiner_on_last_pipe(&data, false);
> @@ -670,9 +695,7 @@ int igt_main()
>  	igt_describe("Verify if the modeset on the other pipes are rejected "
>  		     "when the pipe A is active with a ultra joiner modeset");
>  	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> -		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
> -		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
> -
> +		require_ultra_joiner(&data, FORCE_DISABLE);
>  		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>  			test_ultra_joiner(&data, true, false, false);
>  		if (data.non_ultra_joiner_output_count > 0) {
> @@ -681,12 +704,9 @@ int igt_main()
>  		}
>  	}
>  
> -	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +	igt_describe("Verify the basic modeset on force big joiner mode on all pipes");
>  	igt_subtest_with_dynamic("basic-force-big-joiner") {
> -		igt_require_f(data.non_big_joiner_output_count > 0,
> -			      "No non big joiner output found\n");
> -		igt_require_f(data.n_pipes > 1,
> -			      "Minimum 2 pipes required\n");
> +		require_big_joiner(&data, FORCE_ENABLE);
>  		igt_dynamic_f("single") {
>  			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>  			test_single_joiner(&data, data.non_big_joiner_output_count, true);
> @@ -703,10 +723,7 @@ int igt_main()
>  	}
>  
>  	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> -		igt_require_f(data.non_big_joiner_output_count > 0,
> -			      "Non big joiner output not found\n");
> -		igt_require_f(data.n_pipes > 1,
> -			      "Minimum of 2 pipes are required\n");
> +		require_big_joiner(&data, FORCE_ENABLE);
>  		if (data.non_big_joiner_output_count >= 1) {
>  			igt_dynamic_f("big_joiner_on_last_pipe") {
>  				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> @@ -724,14 +741,9 @@ int igt_main()
>  		}
>  	}
>  
> -	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> +	igt_describe("Verify the basic modeset on force ultra joiner mode on all pipes");
>  	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> -			      "Ultra joiner not supported on this platform\n");
> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
> -			      "No non ultra joiner output found\n");
> -		igt_require_f(data.n_pipes > 3,
> -			      "Minimum 4 pipes required\n");
> +		require_ultra_joiner(&data, FORCE_ENABLE);
>  		igt_dynamic_f("single") {
>  			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>  			test_ultra_joiner(&data, false, false, true);
> @@ -745,7 +757,7 @@ int igt_main()
>  			      "Ultra joiner not supported on this platform\n");
>  		igt_require_f(data.ultra_joiner_output_count > 0 ||
>  			      data.non_ultra_joiner_output_count > 0,
> -				  "No ultra joiner or force ultra joiner output found\n");
> +			      "No ultra joiner or force ultra joiner output found\n");
>  		igt_require_f(data.n_pipes > 3,
>  			      "Minimum 4 pipes required\n");
>  
> @@ -754,13 +766,7 @@ int igt_main()
>  	}
>  
>  	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> -			      "Ultra joiner not supported on this platform\n");
> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
> -			      "Non ultra joiner output not found\n");
> -		igt_require_f(data.n_pipes > 3,
> -			      "Minimum of 3 pipes are required\n");
> -
> +		require_ultra_joiner(&data, FORCE_ENABLE);
>  		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>  			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>  			test_ultra_joiner(&data, true, false, true);
> -- 
> 2.43.0
> 
