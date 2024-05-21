Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869CBC25B75
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 09:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E186310E8B9;
	Tue, 21 May 2024 09:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpBmLML5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36DC10E8B9
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716282966; x=1747818966;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pXdOFZKkFn2Ytx1LU5BbmhkTPcg8e5/eqUtUJpaH7eA=;
 b=UpBmLML5ovkUISy489XR7psgLDxx35ZBhDIEYqyebflqd82afM/uVRfG
 nuRACJqXv/+mjxpvMWb48K3pB14BH9/p1i04a6PCfHttrsvap/XC5Ti1e
 mSIz//GhtTcK+fgjg2f+Bz7kEcbPqZzQaWZv4/ro3kVcN5nNES6KeBoH3
 9slezQeE2HLVEpE26GguayvN5PaJlWaKSMAyKoc5VpCY91T757YUcIn+A
 kjOG7D1rA9a4w8EwbuS74DtdGd+JMZ5ALZfWLoS4hS7+BXzJCpB9CWc+c
 MnqHZGtjkSH+336bk9nTTXeqlFbUUpFP39hYg4xwb4tD6BJGuyVNBeM9P g==;
X-CSE-ConnectionGUID: cLzEx6U+QD+PZnJBfBmCvg==
X-CSE-MsgGUID: vMHoPj9gQ22RR6v9PvpgkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="29981427"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="29981427"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:16:04 -0700
X-CSE-ConnectionGUID: 5bxgUvcCSxSgV5k7M9MIyQ==
X-CSE-MsgGUID: AXxT3n2rQQK7BeLcDRtn6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32830083"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 02:16:02 -0700
Date: Tue, 21 May 2024 11:16:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 jeevan.b@intel.com, sameer.lattannavar@intel.com
Subject: Re: [PATCH i-g-t v4] tests/intel/kms_big_fb: Restrict runs on
 simulation
Message-ID: <20240521091600.2hhby57l5o3ovdgp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 jeevan.b@intel.com, sameer.lattannavar@intel.com
References: <20240520172810.455947-1-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240520172810.455947-1-pranay.samala@intel.com>
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
On 2024-05-20 at 22:58:10 +0530, Pranay Samala wrote:
> This test executes on only one pipe and all the available planes with
> set of 6 coordinates. Due to this, test takes long duration to execute
> on simulation and gets timeout.
> 
> Restricting the test to execute only on one of the coordinates for
> simulation.
> 
> v4:
> - Inserted simulation check right after for loop (Kamil)
> - Executing only on 1 coordinate (w, h) on simulation
> 

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_big_fb.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 1e45d8e42..605813f7f 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -443,6 +443,7 @@ static bool test_plane(data_t *data)
>  	struct igt_fb *big_fb = &data->big_fb;
>  	int w = data->big_fb_width - small_fb->width;
>  	int h = data->big_fb_height - small_fb->height;
> +	bool run_in_simulation = igt_run_in_simulation();
>  	struct {
>  		int x, y;
>  	} coords[] = {
> @@ -467,8 +468,13 @@ static bool test_plane(data_t *data)
>  
>  	for (int i = 0; i < ARRAY_SIZE(coords); i++) {
>  		igt_crc_t small_crc, big_crc;
> -		int x = coords[i].x;
> -		int y = coords[i].y;
> +		int x, y;
> +
> +		if (run_in_simulation)
> +			i = ARRAY_SIZE(coords) - 1;
> +
> +		x = coords[i].x;
> +		y = coords[i].y;
>  
>  		/* Hardware limitation */
>  		if (data->format == DRM_FORMAT_RGB565 &&
> @@ -540,6 +546,7 @@ static bool test_pipe(data_t *data)
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
>  	bool ret = false;
> +	bool run_in_simulation = igt_run_in_simulation();
>  
>  	igt_info("Using (pipe %s + %s) to run the subtest.\n",
>  		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
> @@ -597,7 +604,7 @@ static bool test_pipe(data_t *data)
>  
>  	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
>  		ret = test_plane(data);
> -		if (ret)
> +		if (ret || run_in_simulation)
>  			break;
>  	}
>  
> -- 
> 2.34.1
> 
