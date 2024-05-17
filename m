Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47D5C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 15:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6337510E2E6;
	Fri, 17 May 2024 15:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHYE+5iw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EB810E2E6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715959656; x=1747495656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VlWXOnXnc/OcWn4pUHhFXK7pb6reN2bzmvJlqW2hgEQ=;
 b=IHYE+5iw33dua8LiggKKTFcRZBEGgMwCZv4tvssgRr6QXPSpljYNW5Hj
 yLa1cJMIO0ScszU/IK7L9cgCkqjqUN+9VOrRRnYagcgSQAyb1CtK5D0Yq
 IqCFEI8I4I6iccHPwYyRIcg4LsbDfGjj9EU+pex5OgxQ0XyMHWkPvVBx6
 tVRrCd8hHIOM/l8wNlwKDvyFHrYNXZYOSs4xyiRRyIeWroyZi5I7b/kW3
 23lcS8e/fdP23i91b8lU14H6PP7xsgJimJUGAXS9Dunvevvxg7AqtAsC3
 6jNp3XJuB6oNSFR4ZjvJXcMa/UGQE01IH6B8HZuBb2Q2Woku1sKVB0dr4 Q==;
X-CSE-ConnectionGUID: YO1+NAjMSt2Vfk5SLkRG7g==
X-CSE-MsgGUID: 7kYl/lrxT823Hv7NujpwNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12262383"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12262383"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 08:27:35 -0700
X-CSE-ConnectionGUID: lofCJPQTQ9aKgDZAbyN0tg==
X-CSE-MsgGUID: JcuuDO11RqeUMC2r03ocxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="31916936"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 08:27:34 -0700
Date: Fri, 17 May 2024 17:27:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 jeevan.b@intel.com, sameer.lattannavar@intel.com
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_big_fb: Introducing this
 restriction to optimize the test execution time on simulation
Message-ID: <20240517152731.nma5dncdvsf5skpm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 jeevan.b@intel.com, sameer.lattannavar@intel.com
References: <20240516102817.424967-1-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240516102817.424967-1-pranay.samala@intel.com>
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
On 2024-05-16 at 15:58:17 +0530, Pranay Samala wrote:

please make subject shorter, instead of:

[PATCH i-g-t v2] tests/intel/kms_big_fb: Introducing this restriction to optimize the test execution time on simulation

imho better:
[PATCH i-g-t v2] tests/intel/kms_big_fb: Restrict runs on simulation


> This test executes on only one pipe and all the availble planes with
------------------------------------------------- ^^^^^^^^
s/availble/available/

> set of 6 coordinates. Due to this, test takes long duration to execute
> on simulation and gets timeout.
> 
> Restricting the test to execute only on primary plane with one of the
> coordinates for simulation.
> 
> v2:
> - Breaking the loop instead of using variable m to test only one
>   coordinate for simulation (Kamil)
> - Removed the variable m (Kamil)
> - By default the test is running on only one pipe (Kamil)
> - Testing on (0,0) coordinate (Kamil)
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_big_fb.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 1e45d8e42..f1207e21f 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -455,6 +455,11 @@ static bool test_plane(data_t *data)
>  		{ w, h, },
>  	};
>  
> +	if (igt_run_in_simulation()) {
> +		plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(plane, NULL);
> +	}
> +

Why do you need this here?

>  	if (!igt_plane_has_format_mod(plane, data->format, data->modifier))
>  		return false;
>  
> @@ -529,6 +534,9 @@ static bool test_plane(data_t *data)
>  
>  		igt_assert_crc_equal(&big_crc, &small_crc);
>  		igt_pipe_crc_stop(data->pipe_crc);
> +
> +		if (igt_run_in_simulation())
> +			break;

It would be better to place this just after for(;;) where you
could also choose for which 'i' make test. It is ok if you
want to choose x,y = 0,0

>  	}
>  
>  	return true;
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

Could you simplify this? With the help of new var,
for example:

bool run_in_simulation = igt_run_in_simulation();

you could write:
		for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
			ret = test_plane(data);
			if (ret || run_in_simulation)
				break;
		}

Regards,
Kamil

>  	}
>  
>  	if (data->format == DRM_FORMAT_C8)
> -- 
> 2.34.1
> 
