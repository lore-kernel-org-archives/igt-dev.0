Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1109EF8E4B5
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 07:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95C310E987;
	Fri, 17 Apr 2026 07:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbD/h8z9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A257E10E987
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 07:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776410915; x=1807946915;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ChMAE/Gz76u8VHJohRwXp20F2hdgHWALlMpKgYXsGNM=;
 b=BbD/h8z9VdDASQFlOTfXiuLkIRo3bVXhYOB/stSOESSMsiClYx5gykXR
 zPhgbcddkN9VrMAelJczhywfodtep2I8SVuHz+CmEveoCJAI5DW/Wqrgy
 OqxeKEHzQlwXlejd2jnCCB+ovKbbLEJ1/KjdAdiMoln1hzejtbxePMiO5
 M2p17BgghHSTmH7RKrZSe1umdh60geea9ddBGLLLk1Nr+RGGqvl2Lcxyk
 CJB987WwlTziWp4e3T1uCmuq5R54CmcmTjSnK8yT99Mn7ZfGg5GyxB/h0
 KguWXWWz32XMciQw8piBIcwbnCjhX+uTXrZBv1uS3hUS3wSfinWFDDoM5 A==;
X-CSE-ConnectionGUID: B2onDvb+S8u1NEJZuEvF8Q==
X-CSE-MsgGUID: 6iSByINAQqqfT/BG9Cwlhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="100069717"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="100069717"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:28:34 -0700
X-CSE-ConnectionGUID: FaAv0QCMRoSypK4VyRwkpg==
X-CSE-MsgGUID: AXTovfDdRgiLZtakxVufzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="228295101"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:28:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/kms_sharpness_filter: Find
 mode with lowest bw requirement for test
In-Reply-To: <20260416155421.2000-5-juhapekka.heikkila@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
 <20260416155421.2000-5-juhapekka.heikkila@gmail.com>
Date: Fri, 17 Apr 2026 10:28:30 +0300
Message-ID: <211893c124d2fc3418b729e7ccfa19029536b182@intel.com>
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

On Thu, 16 Apr 2026, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
> choose mode from connector with lowest bandwidth requirement
> for tests to try to fit tests into bandwidth limitations
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 35 +++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index 98eb671d1..cf5b0d2c7 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -609,6 +609,24 @@ static void build_test_suffix(data_t *data, enum test_type type,
>  	}
>  }
>  
> +static drmModeModeInfo *find_lowest_mode(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *low = NULL;
> +
> +	for (int i = 0; i < connector->count_modes; i++) {

for_each_connector_mode()

> +		drmModeModeInfo *mode = &connector->modes[i];
> +		int pixels = mode->hdisplay * mode->vdisplay;
> +		int low_pixels = low ? low->hdisplay * low->vdisplay : INT_MAX;
> +
> +		if (pixels < low_pixels ||
> +		    (pixels == low_pixels && mode->vrefresh < low->vrefresh))
> +			low = mode;
> +	}
> +
> +	return low;
> +}
> +
>  static void
>  run_sharpness_filter_test(data_t *data, enum test_type type)
>  {
> @@ -647,7 +665,22 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>  					 data->mode->vdisplay,
>  					 data->mode->vrefresh);
>  			} else {
> -				data->mode = igt_output_get_mode(data->output);
> +				if (is_invalid_test(type)) {
> +					data->mode = igt_output_get_mode(data->output);
> +				} else {
> +					data->mode = find_lowest_mode(data->output);
> +					if (!data->mode) {
> +						igt_info("No mode found on output %s\n",
> +							 igt_output_name(data->output));
> +						continue;
> +					}
> +
> +					igt_info("Executing on lowest mode %dx%d@%d@%s\n",
> +						 data->mode->hdisplay,
> +						 data->mode->vdisplay,
> +						 data->mode->vrefresh,
> +						 data->output->name);
> +				}
>  			}
>  
>  			if (!has_sharpness_filter(data->crtc)) {

-- 
Jani Nikula, Intel
