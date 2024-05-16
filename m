Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671ADC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 08:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEDA10E0C8;
	Thu, 16 May 2024 08:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4H8IyF6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B2D10E0C8
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 08:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715846610; x=1747382610;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=krdNiJlr/DNy2HMuCr68upxaZH0UEe7VGKdrSgkKn4s=;
 b=i4H8IyF6zs93JdjIgTbdoseABy39RmnCmrQ1ghVh4n4+cL4Urj2qEIna
 r2XfHkStXUivPXX/ioYxiruucRng22fu2GycVkR1NdrtEzoUpDq5LZ8o8
 CDVgnyUkmlPeAHlY0G0alMECzmXzu8ZGMazEPuAdIyBjaLNHWPQdIFPwN
 42q0TQpfhxcN8WMa3gtJohgwn2ME1ZVtADArYqqOXc5X9Yf/1lfG80583
 MUDVTsfGB9KuwJbeMzRnEzOQq2MQcxdwafDfu1qML34fOAO9tYEycn+O+
 rP+lE5ZszcWaYt7Zfy5zSFcmowQ1Ex60fPSCPjv7m5HNTPXo9hCx8AINy g==;
X-CSE-ConnectionGUID: Jz8VOjlPT7S4ggHYkDNNUA==
X-CSE-MsgGUID: 45kF/afZRTyMW0tDsh4scQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11554200"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="11554200"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 01:03:30 -0700
X-CSE-ConnectionGUID: Au/AaT43SGq5j77l9M0tEw==
X-CSE-MsgGUID: ZyiWFI0YSji69ka4F45kFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="35861793"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 01:03:28 -0700
Date: Thu, 16 May 2024 10:03:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 jeevan.b@intel.com, sameer.lattannavar@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/kms_big_fb: Introducing this
 restriction to optimize the test execution time on simulation
Message-ID: <20240516080325.5rdy3wfak4hjkl3y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 jeevan.b@intel.com, sameer.lattannavar@intel.com
References: <20240516041610.409576-1-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240516041610.409576-1-pranay.samala@intel.com>
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

Hi Pranay,
On 2024-05-16 at 09:46:10 +0530, Pranay Samala wrote:
> This test executes on all the availble planes and set of 6 coordinates.
> Due to this, test takes long duration to executes on simulation and
> gets timeout.

This is why part, write also how you solved that problem.

> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_big_fb.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 1e45d8e42..a26465b67 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -443,18 +443,26 @@ static bool test_plane(data_t *data)
>  	struct igt_fb *big_fb = &data->big_fb;
>  	int w = data->big_fb_width - small_fb->width;
>  	int h = data->big_fb_height - small_fb->height;
> +	int m;

Make it more descriptive, 'm' looks a little too short.

>  	struct {
>  		int x, y;
>  	} coords[] = {
>  		/* bunch of coordinates pulled out of thin air */
> +		{ w, h, },
>  		{ 0, 0, },
>  		{ w * 4 / 7, h / 5, },
>  		{ w * 3 / 7, h / 3, },
>  		{ w / 2, h / 2, },
>  		{ w / 3, h * 3 / 4, },
> -		{ w, h, },

Why you did this? This is a change in what is tested first and
it is not reflected in test name (I may be wrong here).
Btw why not testing also 0,0 in simulation?

>  	};
>  
> +	if (igt_run_in_simulation()) {
> +		m = 1;
> +		plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(plane, NULL);

What about pipe?

> +	} else
> +		m = ARRAY_SIZE(coords);
> +
>  	if (!igt_plane_has_format_mod(plane, data->format, data->modifier))
>  		return false;
>  
> @@ -465,7 +473,7 @@ static bool test_plane(data_t *data)
>  		igt_plane_set_rotation(plane, data->rotation);
>  	igt_plane_set_position(plane, 0, 0);
>  
> -	for (int i = 0; i < ARRAY_SIZE(coords); i++) {
> +	for (int i = 0; i < m; i++) {

You could just do a break here if in simulation and i > 0 or i > 1
or on some other conditions.

Regards,
Kamil

>  		igt_crc_t small_crc, big_crc;
>  		int x = coords[i].x;
>  		int y = coords[i].y;
> @@ -595,10 +603,14 @@ static bool test_pipe(data_t *data)
>  	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>  
> -	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
> +	if (igt_run_in_simulation())
>  		ret = test_plane(data);
> -		if (ret)
> -			break;
> +	else {
> +		for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
> +			ret = test_plane(data);
> +			if (ret)
> +				break;
> +		}
>  	}
>  
>  	if (data->format == DRM_FORMAT_C8)
> -- 
> 2.34.1
> 
