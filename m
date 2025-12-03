Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD7ED12D64
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 14:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762F310E7F4;
	Wed,  3 Dec 2025 14:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpS3bHLC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D2A10E7F4
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764770548; x=1796306548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bCxY3QyLKVaWftAtpYkwSPFWzopnwrEFUuOvqZ8wH9U=;
 b=UpS3bHLC8gxh2OpEa/bRzckwOtuNC+HanOngma7YMhs3nuDip/Kd+U9T
 eEX8meDP0dBOzSoTb15eBttEMecOIWOBUlB7y5RLX47X3DbkaAu13EryO
 bbF+Ezr8Go/rnEHPmOAT9/FTGbpcao28DFxP3TAjhjXaWVDvnQPG0JmvT
 CzkKHAdAhjRwqBIZ4AYsl6gTU96/0uST6nSx3bXAqRmgQwj6dO3oTjBf9
 lHDO7i0LfLa86K2yjBQ7EDQ/ZrFdr1SHv0TSiNt2oDezVLJ1dyXTvxd8C
 uCZHR+MezmAPz2vO00yzlXNml1sIJYD5EEXX+PHTmT6+Cj+/7Ovcpbyk6 A==;
X-CSE-ConnectionGUID: +mwmQlTDQ0SZg1JJAsanww==
X-CSE-MsgGUID: csPnkrTKS9SzbnTWoBX+VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84356520"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="84356520"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 06:02:28 -0800
X-CSE-ConnectionGUID: SyRT58IqRJubckTdRz+4Ng==
X-CSE-MsgGUID: NHZuL2YvTcO3w4EQtsRREw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="199642318"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 06:02:27 -0800
Date: Wed, 3 Dec 2025 15:02:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, santhosh.reddy.guddati@intel.com
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/kms_joiner: Add function for
 pretest checks
Message-ID: <20251203140224.22xjw4xc4vcdvqob@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 santhosh.reddy.guddati@intel.com
References: <20251202084243.2677718-1-karthik.b.s@intel.com>
 <20251202084243.2677718-3-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202084243.2677718-3-karthik.b.s@intel.com>
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
On 2025-12-02 at 14:12:43 +0530, Karthik B S wrote:
> Move igt_require checks in individual subtests to a function which is
> called from all subtests to avoid code duplication.
> 
> v2: Use enum for various joiner modes (Santhosh)
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel/kms_joiner.c | 91 ++++++++++++++++++++++++----------------
>  1 file changed, 55 insertions(+), 36 deletions(-)
> 
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 55bdef9fa..19c880cf6 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -101,10 +101,18 @@ typedef struct {
>  	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>  	enum pipe pipe_seq[IGT_MAX_PIPES];
>  	igt_display_t display;
> +	bool ultra_joiner_supported;
>  } data_t;
>  
>  static int max_dotclock;
>  
> +enum joiner_mode {
> +	FORCE_BIG_JOINER,
> +	FORCE_ULTRA_JOINER,
> +	BIG_JOINER,
> +	ULTRA_JOINER
> +};

imho better to simplify it into force/non-force:

enum force_mode {
	FORCE_NOT_NEEDED = 0,
	FORCE_NEEDED
};

For explanation see below. Btw feel free to change name, for
example into FORCE_CHECK?

> +
>  static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>  {
>  	bool status;
> @@ -179,6 +187,37 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
>  
> +static void require_joiners(data_t *data, enum joiner_mode mode)

imho it will be better to add two functions, one for each type
of joiner:

static void require_big_joiners(data_t *data, enum force_mode mode)
static void require_ultra_joiners(data_t *data, enum force_mode mode)


> +{
> +	bool forced = (mode == FORCE_BIG_JOINER ||
> +		       mode == FORCE_ULTRA_JOINER);
> +
> +	switch (mode) {
> +	case FORCE_ULTRA_JOINER:
> +		igt_require(data->non_ultra_joiner_output_count > 0);

Please keep igt_require_f() here and in all places.

> +		/* fallthough */
> +
> +	case ULTRA_JOINER:
> +		igt_require(data->ultra_joiner_supported);
> +		igt_require(data->n_pipes > 3);
> +
> +		if (!forced)
> +			igt_require(data->ultra_joiner_output_count > 0);

imho this 'if' makes FORCE above redundand, so you always require it?
imho sample implementation should look like:

static void require_ultra_joiners(data_t *data, enum force_mode mode)
{
	igt_require_f(data->ultra_joiner_supported,
		      "Ultra joiner not supported on this platform\n");

	igt_require_f(data->ultra_joiner_output_count > 0,
		      "No ultra joiner output found\n");

	if (mode == FORCE_NEEDED)
		igt_require_f(data->non_ultra_joiner_output_count > 0,
			      "No non ultra joiner output found\n");

	igt_require_f(data.n_pipes >= 4, "Minimum 4 pipes required\n");
}


Regards,
Kamil

> +		break;
> +
> +	case FORCE_BIG_JOINER:
> +		igt_require(data->non_big_joiner_output_count > 0);
> +		/* fallthough */
> +
> +	case BIG_JOINER:
> +		igt_require(data->n_pipes > 1);
> +
> +		if (!forced)
> +			igt_require(data->big_joiner_output_count > 0);
> +		break;
> +	}
> +}
> +
>  static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
>  {
>  	drmModeModeInfo bj_mode;
> @@ -554,7 +593,7 @@ igt_main
>  	data_t data;
>  
>  	igt_fixture {
> -		ultra_joiner_supported = false;
> +		data.ultra_joiner_supported = false;
>  		data.big_joiner_output_count = 0;
>  		data.ultra_joiner_output_count = 0;
>  		data.non_big_joiner_output_count = 0;
> @@ -574,7 +613,7 @@ igt_main
>  		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>  		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
>  		if (is_dgfx && display_ver == 14)
> -			ultra_joiner_supported = true;
> +			data.ultra_joiner_supported = true;
>  
>  		for_each_connected_output(&data.display, output) {
>  			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
> @@ -629,32 +668,25 @@ igt_main
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
> +		require_joiners(&data, BIG_JOINER);
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
> +		require_joiners(&data, ULTRA_JOINER);
> +		igt_dynamic_f("single-joiner")
> +			test_ultra_joiner(&data, false, false, false);
>  	}
>  
>  	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>  		     "when the pipe is active with a big joiner modeset");
>  	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
> -		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
> -		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> +		require_joiners(&data, BIG_JOINER);
>  		if (data.big_joiner_output_count >= 1)
>  			igt_dynamic_f("big_joiner_on_last_pipe")
>  				test_joiner_on_last_pipe(&data, false);
> @@ -669,9 +701,7 @@ igt_main
>  	igt_describe("Verify if the modeset on the other pipes are rejected "
>  		     "when the pipe A is active with a ultra joiner modeset");
>  	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> -		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
> -		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
> -
> +		require_joiners(&data, ULTRA_JOINER);
>  		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>  			test_ultra_joiner(&data, true, false, false);
>  		if (data.non_ultra_joiner_output_count > 0) {
> @@ -682,10 +712,7 @@ igt_main
>  
>  	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>  	igt_subtest_with_dynamic("basic-force-big-joiner") {
> -		igt_require_f(data.non_big_joiner_output_count > 0,
> -			      "No non big joiner output found\n");
> -		igt_require_f(data.n_pipes > 1,
> -			      "Minimum 2 pipes required\n");
> +		require_joiners(&data, FORCE_BIG_JOINER);
>  		igt_dynamic_f("single") {
>  			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>  			test_single_joiner(&data, data.non_big_joiner_output_count, true);
> @@ -701,10 +728,7 @@ igt_main
>  	}
>  
>  	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> -		igt_require_f(data.non_big_joiner_output_count > 0,
> -			      "Non big joiner output not found\n");
> -		igt_require_f(data.n_pipes > 1,
> -			      "Minimum of 2 pipes are required\n");
> +		require_joiners(&data, FORCE_BIG_JOINER);
>  		if (data.non_big_joiner_output_count >= 1) {
>  			igt_dynamic_f("big_joiner_on_last_pipe") {
>  				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> @@ -723,12 +747,7 @@ igt_main
>  
>  	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>  	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> -			      "Ultra joiner not supported on this platform\n");
> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
> -			      "No non ultra joiner output found\n");
> -		igt_require_f(data.n_pipes > 3,
> -			      "Minimum 4 pipes required\n");
> +		require_joiners(&data, FORCE_ULTRA_JOINER);
>  		igt_dynamic_f("single") {
>  			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>  			test_ultra_joiner(&data, false, false, true);
> -- 
> 2.43.0
> 
